package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestBuilder;
import com.bumptech.glide.RequestManager;
import com.bumptech.glide.gifdecoder.GifDecoder;
import com.bumptech.glide.gifdecoder.StandardGifDecoder;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.UnitTransformation;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.RequestOptions;
import com.bumptech.glide.request.target.CustomTarget;
import com.bumptech.glide.request.transition.Transition;
import com.bumptech.glide.signature.ObjectKey;
import com.bumptech.glide.util.Executors;
import com.bumptech.glide.util.Util;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class GifFrameLoader {
    public final BitmapPool bitmapPool;
    public final ArrayList callbacks;
    public DelayTarget current;
    public Bitmap firstFrame;
    public int firstFrameSize;
    public final GifDecoder gifDecoder;
    public final Handler handler;
    public int height;
    public boolean isCleared;
    public boolean isLoadPending;
    public boolean isRunning;
    public DelayTarget next;
    public OnEveryFrameListener onEveryFrameListener;
    public DelayTarget pendingTarget;
    public RequestBuilder<Bitmap> requestBuilder;
    public final RequestManager requestManager;
    public Transformation<Bitmap> transformation;
    public int width;

    /* loaded from: classes.dex */
    public static class DelayTarget extends CustomTarget<Bitmap> {
        public final Handler handler;
        public final int index;
        public Bitmap resource;
        public final long targetTime;

        @Override // com.bumptech.glide.request.target.Target
        public final void onLoadCleared(Drawable drawable) {
            this.resource = null;
        }

        @Override // com.bumptech.glide.request.target.Target
        public final void onResourceReady(Object obj, Transition transition) {
            this.resource = (Bitmap) obj;
            this.handler.sendMessageAtTime(this.handler.obtainMessage(1, this), this.targetTime);
        }

        public DelayTarget(Handler handler, int i, long j) {
            this.handler = handler;
            this.index = i;
            this.targetTime = j;
        }
    }

    /* loaded from: classes.dex */
    public interface FrameCallback {
        void onFrameReady();
    }

    /* loaded from: classes.dex */
    public class FrameLoaderCallback implements Handler.Callback {
        public FrameLoaderCallback() {
        }

        @Override // android.os.Handler.Callback
        public final boolean handleMessage(Message message) {
            int i = message.what;
            if (i == 1) {
                GifFrameLoader.this.onFrameReady((DelayTarget) message.obj);
                return true;
            } else if (i != 2) {
                return false;
            } else {
                GifFrameLoader.this.requestManager.clear((DelayTarget) message.obj);
                return false;
            }
        }
    }

    /* loaded from: classes.dex */
    public interface OnEveryFrameListener {
        void onFrameReady();
    }

    public GifFrameLoader() {
        throw null;
    }

    public GifFrameLoader(Glide glide, StandardGifDecoder standardGifDecoder, int i, int i2, UnitTransformation unitTransformation, Bitmap bitmap) {
        BitmapPool bitmapPool = glide.bitmapPool;
        RequestManager with = Glide.with(glide.glideContext.getBaseContext());
        RequestBuilder<Bitmap> apply = Glide.with(glide.glideContext.getBaseContext()).asBitmap().mo32apply((BaseRequestOptions<?>) ((RequestOptions) new RequestOptions().diskCacheStrategy(DiskCacheStrategy.NONE).useAnimationPool()).skipMemoryCache(true).override(i, i2));
        this.callbacks = new ArrayList();
        this.requestManager = with;
        Handler handler = new Handler(Looper.getMainLooper(), new FrameLoaderCallback());
        this.bitmapPool = bitmapPool;
        this.handler = handler;
        this.requestBuilder = apply;
        this.gifDecoder = standardGifDecoder;
        setFrameTransformation(unitTransformation, bitmap);
    }

    public final void loadNextFrame() {
        if (this.isRunning && !this.isLoadPending) {
            DelayTarget delayTarget = this.pendingTarget;
            if (delayTarget != null) {
                this.pendingTarget = null;
                onFrameReady(delayTarget);
                return;
            }
            this.isLoadPending = true;
            long uptimeMillis = SystemClock.uptimeMillis() + this.gifDecoder.getNextDelay();
            this.gifDecoder.advance();
            this.next = new DelayTarget(this.handler, this.gifDecoder.getCurrentFrameIndex(), uptimeMillis);
            RequestBuilder<Bitmap> loadGeneric = this.requestBuilder.mo32apply((BaseRequestOptions<?>) ((RequestOptions) new RequestOptions().signature(new ObjectKey(Double.valueOf(Math.random()))))).loadGeneric(this.gifDecoder);
            loadGeneric.into(this.next, null, loadGeneric, Executors.MAIN_THREAD_EXECUTOR);
        }
    }

    public void onFrameReady(DelayTarget delayTarget) {
        OnEveryFrameListener onEveryFrameListener = this.onEveryFrameListener;
        if (onEveryFrameListener != null) {
            onEveryFrameListener.onFrameReady();
        }
        this.isLoadPending = false;
        if (this.isCleared) {
            this.handler.obtainMessage(2, delayTarget).sendToTarget();
        } else if (!this.isRunning) {
            this.pendingTarget = delayTarget;
        } else {
            if (delayTarget.resource != null) {
                Bitmap bitmap = this.firstFrame;
                if (bitmap != null) {
                    this.bitmapPool.put(bitmap);
                    this.firstFrame = null;
                }
                DelayTarget delayTarget2 = this.current;
                this.current = delayTarget;
                int size = this.callbacks.size();
                while (true) {
                    size--;
                    if (size < 0) {
                        break;
                    }
                    ((FrameCallback) this.callbacks.get(size)).onFrameReady();
                }
                if (delayTarget2 != null) {
                    this.handler.obtainMessage(2, delayTarget2).sendToTarget();
                }
            }
            loadNextFrame();
        }
    }

    public final void setFrameTransformation(Transformation<Bitmap> transformation, Bitmap bitmap) {
        ContainerHelpers.checkNotNull(transformation);
        this.transformation = transformation;
        ContainerHelpers.checkNotNull(bitmap);
        this.firstFrame = bitmap;
        this.requestBuilder = this.requestBuilder.mo32apply((BaseRequestOptions<?>) new RequestOptions().transform(transformation, true));
        this.firstFrameSize = Util.getBitmapByteSize(bitmap);
        this.width = bitmap.getWidth();
        this.height = bitmap.getHeight();
    }

    public void setOnEveryFrameReadyListener(OnEveryFrameListener onEveryFrameListener) {
        this.onEveryFrameListener = onEveryFrameListener;
    }
}
