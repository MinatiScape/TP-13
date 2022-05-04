package com.davemorrissey.labs.subscaleview;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Message;
import android.support.media.ExifInterface;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import androidx.constraintlayout.solver.widgets.analyzer.DependencyGraph$$ExternalSyntheticOutline0;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.picker.ImagePreviewFragment;
import com.android.wallpaper.picker.PreviewFragment;
import com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda8;
import com.davemorrissey.labs.subscaleview.decoder.CompatDecoderFactory;
import com.davemorrissey.labs.subscaleview.decoder.DecoderFactory;
import com.davemorrissey.labs.subscaleview.decoder.ImageDecoder;
import com.davemorrissey.labs.subscaleview.decoder.ImageRegionDecoder;
import com.davemorrissey.labs.subscaleview.decoder.SkiaImageDecoder;
import com.davemorrissey.labs.subscaleview.decoder.SkiaImageRegionDecoder;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import kotlin.jvm.internal.Intrinsics;
/* loaded from: classes.dex */
public class SubsamplingScaleImageView extends View {
    public Anim anim;
    public Bitmap bitmap;
    public CompatDecoderFactory bitmapDecoderFactory;
    public boolean bitmapIsCached;
    public boolean bitmapIsPreview;
    public Paint bitmapPaint;
    public ImageRegionDecoder decoder;
    public final ReentrantReadWriteLock decoderLock;
    public final float density;
    public GestureDetector detector;
    public int doubleTapZoomDuration;
    public float doubleTapZoomScale;
    public int doubleTapZoomStyle;
    public final float[] dstArray;
    public boolean eagerLoadingEnabled;
    public Executor executor;
    public int fullImageSampleSize;
    public final Handler handler;
    public boolean imageLoadedSent;
    public boolean isPanning;
    public boolean isQuickScaling;
    public boolean isZooming;
    public Matrix matrix;
    public float maxScale;
    public int maxTileHeight;
    public int maxTileWidth;
    public int maxTouchCount;
    public float minScale;
    public int minimumScaleType;
    public int minimumTileDpi;
    public View.OnLongClickListener onLongClickListener;
    public OnStateChangedListener onStateChangedListener;
    public int orientation;
    public boolean panEnabled;
    public int panLimit;
    public Float pendingScale;
    public boolean quickScaleEnabled;
    public float quickScaleLastDistance;
    public boolean quickScaleMoved;
    public PointF quickScaleSCenter;
    public final float quickScaleThreshold;
    public PointF quickScaleVLastPoint;
    public PointF quickScaleVStart;
    public boolean readySent;
    public CompatDecoderFactory regionDecoderFactory;
    public int sHeight;
    public int sOrientation;
    public PointF sPendingCenter;
    public RectF sRect;
    public PointF sRequestedCenter;
    public int sWidth;
    public ScaleAndTranslate satTemp;
    public float scale;
    public float scaleStart;
    public GestureDetector singleDetector;
    public final float[] srcArray;
    public Paint tileBgPaint;
    public LinkedHashMap tileMap;
    public Uri uri;
    public PointF vCenterStart;
    public float vDistStart;
    public PointF vTranslate;
    public PointF vTranslateBefore;
    public PointF vTranslateStart;
    public boolean zoomEnabled;
    public static final List<Integer> VALID_ORIENTATIONS = Arrays.asList(0, 90, 180, 270, -1);
    public static final List<Integer> VALID_ZOOM_STYLES = Arrays.asList(1, 2, 3);
    public static final List<Integer> VALID_EASING_STYLES = Arrays.asList(2, 1);
    public static final List<Integer> VALID_PAN_LIMITS = Arrays.asList(1, 2, 3);
    public static final List<Integer> VALID_SCALE_TYPES = Arrays.asList(2, 1, 3, 4);

    /* loaded from: classes.dex */
    public static class Anim {
        public OnAnimationEventListener listener;
        public PointF sCenterEnd;
        public PointF sCenterStart;
        public float scaleEnd;
        public float scaleStart;
        public PointF vFocusEnd;
        public PointF vFocusStart;
        public long duration = 500;
        public boolean interruptible = true;
        public int easing = 2;
        public int origin = 1;
        public long time = System.currentTimeMillis();
    }

    /* loaded from: classes.dex */
    public final class AnimationBuilder {
        public long duration;
        public int easing;
        public boolean interruptible;
        public int origin;
        public boolean panLimited;
        public final PointF targetSCenter;
        public final float targetScale;
        public final PointF vFocus;

        public AnimationBuilder(PointF pointF) {
            this.duration = 500L;
            this.easing = 2;
            this.origin = 1;
            this.interruptible = true;
            this.panLimited = true;
            this.targetScale = SubsamplingScaleImageView.this.scale;
            this.targetSCenter = pointF;
            this.vFocus = null;
        }

        public final void start() {
            PointF pointF;
            OnAnimationEventListener onAnimationEventListener;
            Anim anim = SubsamplingScaleImageView.this.anim;
            if (!(anim == null || (onAnimationEventListener = anim.listener) == null)) {
                try {
                    onAnimationEventListener.onInterruptedByNewAnim();
                } catch (Exception e) {
                    List<Integer> list = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                    Log.w("SubsamplingScaleImageView", "Error thrown by animation listener", e);
                }
            }
            int width = (((SubsamplingScaleImageView.this.getWidth() - SubsamplingScaleImageView.this.getPaddingRight()) - SubsamplingScaleImageView.this.getPaddingLeft()) / 2) + SubsamplingScaleImageView.this.getPaddingLeft();
            int height = (((SubsamplingScaleImageView.this.getHeight() - SubsamplingScaleImageView.this.getPaddingBottom()) - SubsamplingScaleImageView.this.getPaddingTop()) / 2) + SubsamplingScaleImageView.this.getPaddingTop();
            SubsamplingScaleImageView subsamplingScaleImageView = SubsamplingScaleImageView.this;
            float min = Math.min(subsamplingScaleImageView.maxScale, Math.max(subsamplingScaleImageView.minScale(), this.targetScale));
            if (this.panLimited) {
                SubsamplingScaleImageView subsamplingScaleImageView2 = SubsamplingScaleImageView.this;
                PointF pointF2 = this.targetSCenter;
                float f = pointF2.x;
                float f2 = pointF2.y;
                pointF = new PointF();
                PointF vTranslateForSCenter = subsamplingScaleImageView2.vTranslateForSCenter(f, f2, min);
                pointF.set((((((subsamplingScaleImageView2.getWidth() - subsamplingScaleImageView2.getPaddingRight()) - subsamplingScaleImageView2.getPaddingLeft()) / 2) + subsamplingScaleImageView2.getPaddingLeft()) - vTranslateForSCenter.x) / min, (((((subsamplingScaleImageView2.getHeight() - subsamplingScaleImageView2.getPaddingBottom()) - subsamplingScaleImageView2.getPaddingTop()) / 2) + subsamplingScaleImageView2.getPaddingTop()) - vTranslateForSCenter.y) / min);
            } else {
                pointF = this.targetSCenter;
            }
            SubsamplingScaleImageView.this.anim = new Anim();
            SubsamplingScaleImageView subsamplingScaleImageView3 = SubsamplingScaleImageView.this;
            Anim anim2 = subsamplingScaleImageView3.anim;
            anim2.scaleStart = subsamplingScaleImageView3.scale;
            anim2.scaleEnd = min;
            anim2.time = System.currentTimeMillis();
            SubsamplingScaleImageView subsamplingScaleImageView4 = SubsamplingScaleImageView.this;
            Anim anim3 = subsamplingScaleImageView4.anim;
            anim3.getClass();
            anim3.sCenterStart = subsamplingScaleImageView4.getCenter();
            SubsamplingScaleImageView subsamplingScaleImageView5 = SubsamplingScaleImageView.this;
            Anim anim4 = subsamplingScaleImageView5.anim;
            anim4.sCenterEnd = pointF;
            float f3 = pointF.x;
            float f4 = pointF.y;
            PointF pointF3 = new PointF();
            if (subsamplingScaleImageView5.vTranslate == null) {
                pointF3 = null;
            } else {
                pointF3.set(subsamplingScaleImageView5.sourceToViewX(f3), subsamplingScaleImageView5.sourceToViewY(f4));
            }
            anim4.vFocusStart = pointF3;
            SubsamplingScaleImageView.this.anim.vFocusEnd = new PointF(width, height);
            Anim anim5 = SubsamplingScaleImageView.this.anim;
            anim5.duration = this.duration;
            anim5.interruptible = this.interruptible;
            anim5.easing = this.easing;
            anim5.origin = this.origin;
            anim5.time = System.currentTimeMillis();
            Anim anim6 = SubsamplingScaleImageView.this.anim;
            anim6.listener = null;
            PointF pointF4 = this.vFocus;
            if (pointF4 != null) {
                float f5 = pointF4.x;
                PointF pointF5 = anim6.sCenterStart;
                float f6 = f5 - (pointF5.x * min);
                float f7 = pointF4.y - (pointF5.y * min);
                PointF pointF6 = new PointF(f6, f7);
                SubsamplingScaleImageView.this.fitToBounds(true, new ScaleAndTranslate(min, pointF6));
                Anim anim7 = SubsamplingScaleImageView.this.anim;
                PointF pointF7 = this.vFocus;
                anim7.vFocusEnd = new PointF((pointF6.x - f6) + pointF7.x, (pointF6.y - f7) + pointF7.y);
            }
            SubsamplingScaleImageView.this.invalidate();
        }

        public AnimationBuilder(float f, PointF pointF) {
            this.duration = 500L;
            this.easing = 2;
            this.origin = 1;
            this.interruptible = true;
            this.panLimited = true;
            this.targetScale = f;
            this.targetSCenter = pointF;
            this.vFocus = null;
        }

        public AnimationBuilder(float f, PointF pointF, PointF pointF2) {
            this.duration = 500L;
            this.easing = 2;
            this.origin = 1;
            this.interruptible = true;
            this.panLimited = true;
            this.targetScale = f;
            this.targetSCenter = pointF;
            this.vFocus = pointF2;
        }
    }

    /* loaded from: classes.dex */
    public static class BitmapLoadTask extends AsyncTask<Void, Void, Integer> {
        public Bitmap bitmap;
        public final WeakReference<Context> contextRef;
        public final WeakReference<DecoderFactory<? extends ImageDecoder>> decoderFactoryRef;
        public Exception exception;
        public final boolean preview;
        public final Uri source;
        public final WeakReference<SubsamplingScaleImageView> viewRef;

        @Override // android.os.AsyncTask
        public final Integer doInBackground(Void[] voidArr) {
            try {
                String uri = this.source.toString();
                Context context = this.contextRef.get();
                DecoderFactory<? extends ImageDecoder> decoderFactory = this.decoderFactoryRef.get();
                SubsamplingScaleImageView subsamplingScaleImageView = this.viewRef.get();
                if (!(context == null || decoderFactory == null || subsamplingScaleImageView == null)) {
                    List<Integer> list = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                    this.bitmap = decoderFactory.make().decode(context, this.source);
                    return Integer.valueOf(SubsamplingScaleImageView.m33$$Nest$mgetExifOrientation(subsamplingScaleImageView, context, uri));
                }
            } catch (Exception e) {
                List<Integer> list2 = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                Log.e("SubsamplingScaleImageView", "Failed to load bitmap", e);
                this.exception = e;
            } catch (OutOfMemoryError e2) {
                List<Integer> list3 = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                Log.e("SubsamplingScaleImageView", "Failed to load bitmap - OutOfMemoryError", e2);
                this.exception = new RuntimeException(e2);
            }
            return null;
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(Integer num) {
            Integer num2 = num;
            SubsamplingScaleImageView subsamplingScaleImageView = this.viewRef.get();
            if (subsamplingScaleImageView != null) {
                Bitmap bitmap = this.bitmap;
                if (bitmap == null || num2 == null) {
                    if (this.exception != null) {
                        List<Integer> list = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                    }
                } else if (this.preview) {
                    List<Integer> list2 = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                    synchronized (subsamplingScaleImageView) {
                        if (subsamplingScaleImageView.bitmap == null && !subsamplingScaleImageView.imageLoadedSent) {
                            subsamplingScaleImageView.bitmap = bitmap;
                            subsamplingScaleImageView.bitmapIsPreview = true;
                            if (subsamplingScaleImageView.checkReady()) {
                                subsamplingScaleImageView.invalidate();
                                subsamplingScaleImageView.requestLayout();
                            }
                            return;
                        }
                        bitmap.recycle();
                    }
                } else {
                    int intValue = num2.intValue();
                    List<Integer> list3 = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                    subsamplingScaleImageView.onImageLoaded(bitmap, intValue, false);
                }
            }
        }

        public BitmapLoadTask(SubsamplingScaleImageView subsamplingScaleImageView, Context context, DecoderFactory<? extends ImageDecoder> decoderFactory, Uri uri, boolean z) {
            this.viewRef = new WeakReference<>(subsamplingScaleImageView);
            this.contextRef = new WeakReference<>(context);
            this.decoderFactoryRef = new WeakReference<>(decoderFactory);
            this.source = uri;
            this.preview = z;
        }
    }

    /* loaded from: classes.dex */
    public static class DefaultOnStateChangedListener implements OnStateChangedListener {
    }

    /* loaded from: classes.dex */
    public interface OnAnimationEventListener {
        void onComplete();

        void onInterruptedByNewAnim();

        void onInterruptedByUser();
    }

    /* loaded from: classes.dex */
    public interface OnStateChangedListener {
    }

    /* loaded from: classes.dex */
    public static class TileLoadTask extends AsyncTask<Void, Void, Bitmap> {
        public final WeakReference<ImageRegionDecoder> decoderRef;
        public Exception exception;
        public final WeakReference<Tile> tileRef;
        public final WeakReference<SubsamplingScaleImageView> viewRef;

        @Override // android.os.AsyncTask
        public final Bitmap doInBackground(Void[] voidArr) {
            try {
                SubsamplingScaleImageView subsamplingScaleImageView = this.viewRef.get();
                ImageRegionDecoder imageRegionDecoder = this.decoderRef.get();
                Tile tile = this.tileRef.get();
                if (imageRegionDecoder != null && tile != null && subsamplingScaleImageView != null && imageRegionDecoder.isReady() && tile.visible) {
                    List<Integer> list = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                    subsamplingScaleImageView.decoderLock.readLock().lock();
                    try {
                        if (imageRegionDecoder.isReady()) {
                            subsamplingScaleImageView.fileSRect(tile.sRect, tile.fileSRect);
                            return imageRegionDecoder.decodeRegion(tile.fileSRect, tile.sampleSize);
                        }
                        tile.loading = false;
                        subsamplingScaleImageView.decoderLock.readLock().unlock();
                    } finally {
                        subsamplingScaleImageView.decoderLock.readLock().unlock();
                    }
                } else if (tile != null) {
                    tile.loading = false;
                }
            } catch (Exception e) {
                List<Integer> list2 = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                Log.e("SubsamplingScaleImageView", "Failed to decode tile", e);
                this.exception = e;
            } catch (OutOfMemoryError e2) {
                List<Integer> list3 = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                Log.e("SubsamplingScaleImageView", "Failed to decode tile - OutOfMemoryError", e2);
                this.exception = new RuntimeException(e2);
            }
            return null;
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(Bitmap bitmap) {
            Bitmap bitmap2;
            Bitmap bitmap3 = bitmap;
            SubsamplingScaleImageView subsamplingScaleImageView = this.viewRef.get();
            Tile tile = this.tileRef.get();
            if (subsamplingScaleImageView != null && tile != null) {
                if (bitmap3 != null) {
                    tile.bitmap = bitmap3;
                    tile.loading = false;
                    List<Integer> list = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                    synchronized (subsamplingScaleImageView) {
                        subsamplingScaleImageView.checkReady();
                        subsamplingScaleImageView.checkImageLoaded();
                        if (subsamplingScaleImageView.isBaseLayerReady() && (bitmap2 = subsamplingScaleImageView.bitmap) != null) {
                            if (!subsamplingScaleImageView.bitmapIsCached) {
                                bitmap2.recycle();
                            }
                            subsamplingScaleImageView.bitmap = null;
                            subsamplingScaleImageView.bitmapIsPreview = false;
                            subsamplingScaleImageView.bitmapIsCached = false;
                        }
                        subsamplingScaleImageView.invalidate();
                    }
                } else if (this.exception != null) {
                    List<Integer> list2 = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                }
            }
        }

        public TileLoadTask(SubsamplingScaleImageView subsamplingScaleImageView, ImageRegionDecoder imageRegionDecoder, Tile tile) {
            this.viewRef = new WeakReference<>(subsamplingScaleImageView);
            this.decoderRef = new WeakReference<>(imageRegionDecoder);
            this.tileRef = new WeakReference<>(tile);
            tile.loading = true;
        }
    }

    /* loaded from: classes.dex */
    public static class TilesInitTask extends AsyncTask<Void, Void, int[]> {
        public final WeakReference<Context> contextRef;
        public ImageRegionDecoder decoder;
        public final WeakReference<DecoderFactory<? extends ImageRegionDecoder>> decoderFactoryRef;
        public Exception exception;
        public final Uri source;
        public final WeakReference<SubsamplingScaleImageView> viewRef;

        @Override // android.os.AsyncTask
        public final int[] doInBackground(Void[] voidArr) {
            try {
                String uri = this.source.toString();
                Context context = this.contextRef.get();
                DecoderFactory<? extends ImageRegionDecoder> decoderFactory = this.decoderFactoryRef.get();
                SubsamplingScaleImageView subsamplingScaleImageView = this.viewRef.get();
                if (!(context == null || decoderFactory == null || subsamplingScaleImageView == null)) {
                    List<Integer> list = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                    ImageRegionDecoder make = decoderFactory.make();
                    this.decoder = make;
                    Point init = make.init(context, this.source);
                    return new int[]{init.x, init.y, SubsamplingScaleImageView.m33$$Nest$mgetExifOrientation(subsamplingScaleImageView, context, uri)};
                }
            } catch (Exception e) {
                List<Integer> list2 = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                Log.e("SubsamplingScaleImageView", "Failed to initialise bitmap decoder", e);
                this.exception = e;
            }
            return null;
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(int[] iArr) {
            int i;
            int i2;
            int i3;
            int[] iArr2 = iArr;
            SubsamplingScaleImageView subsamplingScaleImageView = this.viewRef.get();
            if (subsamplingScaleImageView != null) {
                ImageRegionDecoder imageRegionDecoder = this.decoder;
                if (imageRegionDecoder != null && iArr2 != null && iArr2.length == 3) {
                    int i4 = iArr2[0];
                    int i5 = iArr2[1];
                    int i6 = iArr2[2];
                    List<Integer> list = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                    synchronized (subsamplingScaleImageView) {
                        int i7 = subsamplingScaleImageView.sWidth;
                        if (i7 > 0 && (i3 = subsamplingScaleImageView.sHeight) > 0 && !(i7 == i4 && i3 == i5)) {
                            subsamplingScaleImageView.reset(false);
                            Bitmap bitmap = subsamplingScaleImageView.bitmap;
                            if (bitmap != null) {
                                if (!subsamplingScaleImageView.bitmapIsCached) {
                                    bitmap.recycle();
                                }
                                subsamplingScaleImageView.bitmap = null;
                                subsamplingScaleImageView.bitmapIsPreview = false;
                                subsamplingScaleImageView.bitmapIsCached = false;
                            }
                        }
                        subsamplingScaleImageView.decoder = imageRegionDecoder;
                        subsamplingScaleImageView.sWidth = i4;
                        subsamplingScaleImageView.sHeight = i5;
                        subsamplingScaleImageView.sOrientation = i6;
                        subsamplingScaleImageView.checkReady();
                        if (!subsamplingScaleImageView.checkImageLoaded() && (i = subsamplingScaleImageView.maxTileWidth) > 0 && i != Integer.MAX_VALUE && (i2 = subsamplingScaleImageView.maxTileHeight) > 0 && i2 != Integer.MAX_VALUE && subsamplingScaleImageView.getWidth() > 0 && subsamplingScaleImageView.getHeight() > 0) {
                            subsamplingScaleImageView.initialiseBaseLayer(new Point(subsamplingScaleImageView.maxTileWidth, subsamplingScaleImageView.maxTileHeight));
                        }
                        subsamplingScaleImageView.invalidate();
                        subsamplingScaleImageView.requestLayout();
                    }
                } else if (this.exception != null) {
                    List<Integer> list2 = SubsamplingScaleImageView.VALID_ORIENTATIONS;
                }
            }
        }

        public TilesInitTask(SubsamplingScaleImageView subsamplingScaleImageView, Context context, DecoderFactory<? extends ImageRegionDecoder> decoderFactory, Uri uri) {
            this.viewRef = new WeakReference<>(subsamplingScaleImageView);
            this.contextRef = new WeakReference<>(context);
            this.decoderFactoryRef = new WeakReference<>(decoderFactory);
            this.source = uri;
        }
    }

    public SubsamplingScaleImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        PointF pointF;
        int resourceId;
        String string;
        this.orientation = 0;
        this.maxScale = 2.0f;
        this.minScale = minScale();
        this.minimumTileDpi = -1;
        this.panLimit = 1;
        this.minimumScaleType = 1;
        this.maxTileWidth = Integer.MAX_VALUE;
        this.maxTileHeight = Integer.MAX_VALUE;
        this.executor = AsyncTask.THREAD_POOL_EXECUTOR;
        this.eagerLoadingEnabled = true;
        this.panEnabled = true;
        this.zoomEnabled = true;
        this.quickScaleEnabled = true;
        this.doubleTapZoomScale = 1.0f;
        this.doubleTapZoomStyle = 1;
        this.doubleTapZoomDuration = 500;
        this.decoderLock = new ReentrantReadWriteLock(true);
        this.bitmapDecoderFactory = new CompatDecoderFactory(SkiaImageDecoder.class);
        this.regionDecoderFactory = new CompatDecoderFactory(SkiaImageRegionDecoder.class);
        this.srcArray = new float[8];
        this.dstArray = new float[8];
        this.density = getResources().getDisplayMetrics().density;
        DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
        float f = 160;
        this.maxScale = ((displayMetrics.xdpi + displayMetrics.ydpi) / 2.0f) / f;
        DisplayMetrics displayMetrics2 = getResources().getDisplayMetrics();
        this.doubleTapZoomScale = ((displayMetrics2.xdpi + displayMetrics2.ydpi) / 2.0f) / f;
        DisplayMetrics displayMetrics3 = getResources().getDisplayMetrics();
        this.minimumTileDpi = (int) Math.min((displayMetrics3.xdpi + displayMetrics3.ydpi) / 2.0f, 320);
        if (this.readySent) {
            reset(false);
            invalidate();
        }
        setGestureDetector(context);
        this.handler = new Handler(new Handler.Callback() { // from class: com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView.1
            @Override // android.os.Handler.Callback
            public final boolean handleMessage(Message message) {
                SubsamplingScaleImageView subsamplingScaleImageView;
                View.OnLongClickListener onLongClickListener;
                if (message.what == 1 && (onLongClickListener = (subsamplingScaleImageView = SubsamplingScaleImageView.this).onLongClickListener) != null) {
                    subsamplingScaleImageView.maxTouchCount = 0;
                    SubsamplingScaleImageView.super.setOnLongClickListener(onLongClickListener);
                    SubsamplingScaleImageView.this.performLongClick();
                    SubsamplingScaleImageView.super.setOnLongClickListener(null);
                }
                return true;
            }
        });
        if (attributeSet != null) {
            TypedArray obtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, Intrinsics.SubsamplingScaleImageView);
            if (obtainStyledAttributes.hasValue(0) && (string = obtainStyledAttributes.getString(0)) != null && string.length() > 0) {
                String m = SupportMenuInflater$$ExternalSyntheticOutline0.m("file:///android_asset/", string);
                if (m != null) {
                    if (!m.contains("://")) {
                        m = SupportMenuInflater$$ExternalSyntheticOutline0.m("file:///", m.startsWith("/") ? m.substring(1) : m);
                    }
                    ImageSource imageSource = new ImageSource(Uri.parse(m));
                    imageSource.tile = true;
                    setImage(imageSource);
                } else {
                    throw new NullPointerException("Uri must not be null");
                }
            }
            if (obtainStyledAttributes.hasValue(3) && (resourceId = obtainStyledAttributes.getResourceId(3, 0)) > 0) {
                ImageSource imageSource2 = new ImageSource(resourceId);
                imageSource2.tile = true;
                setImage(imageSource2);
            }
            if (obtainStyledAttributes.hasValue(1)) {
                boolean z = obtainStyledAttributes.getBoolean(1, true);
                this.panEnabled = z;
                if (!z && (pointF = this.vTranslate) != null) {
                    pointF.x = (getWidth() / 2) - (this.scale * (sWidth() / 2));
                    this.vTranslate.y = (getHeight() / 2) - (this.scale * (sHeight() / 2));
                    if (this.readySent) {
                        refreshRequiredTiles(true);
                        invalidate();
                    }
                }
            }
            if (obtainStyledAttributes.hasValue(5)) {
                this.zoomEnabled = obtainStyledAttributes.getBoolean(5, true);
            }
            if (obtainStyledAttributes.hasValue(2)) {
                this.quickScaleEnabled = obtainStyledAttributes.getBoolean(2, true);
            }
            if (obtainStyledAttributes.hasValue(4)) {
                int color = obtainStyledAttributes.getColor(4, Color.argb(0, 0, 0, 0));
                if (Color.alpha(color) == 0) {
                    this.tileBgPaint = null;
                } else {
                    Paint paint = new Paint();
                    this.tileBgPaint = paint;
                    paint.setStyle(Paint.Style.FILL);
                    this.tileBgPaint.setColor(color);
                }
                invalidate();
            }
            obtainStyledAttributes.recycle();
        }
        this.quickScaleThreshold = TypedValue.applyDimension(1, 20.0f, context.getResources().getDisplayMetrics());
    }

    public static float ease(int i, long j, float f, float f2, long j2) {
        float f3;
        if (i == 1) {
            float f4 = ((float) j) / ((float) j2);
            return DependencyGraph$$ExternalSyntheticOutline0.m(f4, 2.0f, (-f2) * f4, f);
        } else if (i == 2) {
            float f5 = ((float) j) / (((float) j2) / 2.0f);
            if (f5 < 1.0f) {
                f3 = (f2 / 2.0f) * f5 * f5;
            } else {
                float f6 = f5 - 1.0f;
                f3 = (((f6 - 2.0f) * f6) - 1.0f) * ((-f2) / 2.0f);
            }
            return f3 + f;
        } else {
            throw new IllegalStateException("Unexpected easing type: " + i);
        }
    }

    public static void setMatrixArray(float[] fArr, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        fArr[0] = f;
        fArr[1] = f2;
        fArr[2] = f3;
        fArr[3] = f4;
        fArr[4] = f5;
        fArr[5] = f6;
        fArr[6] = f7;
        fArr[7] = f8;
    }

    public final void fitToBounds(boolean z, ScaleAndTranslate scaleAndTranslate) {
        float f;
        float f2;
        float f3;
        int i;
        if (this.panLimit == 2 && this.readySent) {
            z = false;
        }
        PointF pointF = scaleAndTranslate.vTranslate;
        float min = Math.min(this.maxScale, Math.max(minScale(), scaleAndTranslate.scale));
        float sWidth = sWidth() * min;
        float sHeight = sHeight() * min;
        if (this.panLimit == 3 && this.readySent) {
            pointF.x = Math.max(pointF.x, (getWidth() / 2) - sWidth);
            pointF.y = Math.max(pointF.y, (getHeight() / 2) - sHeight);
        } else if (z) {
            pointF.x = Math.max(pointF.x, getWidth() - sWidth);
            pointF.y = Math.max(pointF.y, getHeight() - sHeight);
        } else {
            pointF.x = Math.max(pointF.x, -sWidth);
            pointF.y = Math.max(pointF.y, -sHeight);
        }
        float f4 = 0.5f;
        if (getPaddingLeft() > 0 || getPaddingRight() > 0) {
            f = getPaddingLeft() / (getPaddingRight() + getPaddingLeft());
        } else {
            f = 0.5f;
        }
        if (getPaddingTop() > 0 || getPaddingBottom() > 0) {
            f4 = getPaddingTop() / (getPaddingBottom() + getPaddingTop());
        }
        if (this.panLimit == 3 && this.readySent) {
            f2 = Math.max(0, getWidth() / 2);
            i = Math.max(0, getHeight() / 2);
        } else if (z) {
            f2 = Math.max((float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES, (getWidth() - sWidth) * f);
            f3 = Math.max((float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES, (getHeight() - sHeight) * f4);
            pointF.x = Math.min(pointF.x, f2);
            pointF.y = Math.min(pointF.y, f3);
            scaleAndTranslate.scale = min;
        } else {
            f2 = Math.max(0, getWidth());
            i = Math.max(0, getHeight());
        }
        f3 = i;
        pointF.x = Math.min(pointF.x, f2);
        pointF.y = Math.min(pointF.y, f3);
        scaleAndTranslate.scale = min;
    }

    public final synchronized void initialiseBaseLayer(Point point) {
        ScaleAndTranslate scaleAndTranslate = new ScaleAndTranslate(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, new PointF(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES));
        this.satTemp = scaleAndTranslate;
        fitToBounds(true, scaleAndTranslate);
        int calculateInSampleSize = calculateInSampleSize(this.satTemp.scale);
        this.fullImageSampleSize = calculateInSampleSize;
        if (calculateInSampleSize > 1) {
            this.fullImageSampleSize = calculateInSampleSize / 2;
        }
        if (this.fullImageSampleSize != 1 || sWidth() >= point.x || sHeight() >= point.y) {
            initialiseTileMap(point);
            for (Tile tile : (List) this.tileMap.get(Integer.valueOf(this.fullImageSampleSize))) {
                new TileLoadTask(this, this.decoder, tile).executeOnExecutor(this.executor, new Void[0]);
            }
            refreshRequiredTiles(true);
        } else {
            this.decoder.recycle();
            this.decoder = null;
            new BitmapLoadTask(this, getContext(), this.bitmapDecoderFactory, this.uri, false).executeOnExecutor(this.executor, new Void[0]);
        }
    }

    public final synchronized void onImageLoaded(Bitmap bitmap, int i, boolean z) {
        int i2 = this.sWidth;
        if (i2 > 0 && this.sHeight > 0 && !(i2 == bitmap.getWidth() && this.sHeight == bitmap.getHeight())) {
            reset(false);
        }
        Bitmap bitmap2 = this.bitmap;
        if (bitmap2 != null && !this.bitmapIsCached) {
            bitmap2.recycle();
        }
        if (this.bitmap != null) {
            boolean z2 = this.bitmapIsCached;
        }
        this.bitmapIsPreview = false;
        this.bitmapIsCached = z;
        this.bitmap = bitmap;
        this.sWidth = bitmap.getWidth();
        this.sHeight = bitmap.getHeight();
        this.sOrientation = i;
        boolean checkReady = checkReady();
        boolean checkImageLoaded = checkImageLoaded();
        if (checkReady || checkImageLoaded) {
            invalidate();
            requestLayout();
        }
    }

    /* JADX WARN: Finally extract failed */
    public final void reset(boolean z) {
        this.scale = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        this.scaleStart = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        this.vTranslate = null;
        this.vTranslateStart = null;
        this.vTranslateBefore = null;
        this.pendingScale = Float.valueOf((float) HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.sPendingCenter = null;
        this.sRequestedCenter = null;
        this.isZooming = false;
        this.isPanning = false;
        this.isQuickScaling = false;
        this.maxTouchCount = 0;
        this.fullImageSampleSize = 0;
        this.vCenterStart = null;
        this.vDistStart = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        this.quickScaleLastDistance = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        this.quickScaleMoved = false;
        this.quickScaleSCenter = null;
        this.quickScaleVLastPoint = null;
        this.quickScaleVStart = null;
        this.anim = null;
        this.satTemp = null;
        this.matrix = null;
        this.sRect = null;
        if (z) {
            this.uri = null;
            this.decoderLock.writeLock().lock();
            try {
                ImageRegionDecoder imageRegionDecoder = this.decoder;
                if (imageRegionDecoder != null) {
                    imageRegionDecoder.recycle();
                    this.decoder = null;
                }
                this.decoderLock.writeLock().unlock();
                Bitmap bitmap = this.bitmap;
                if (bitmap != null && !this.bitmapIsCached) {
                    bitmap.recycle();
                }
                this.sWidth = 0;
                this.sHeight = 0;
                this.sOrientation = 0;
                this.readySent = false;
                this.imageLoadedSent = false;
                this.bitmap = null;
                this.bitmapIsPreview = false;
                this.bitmapIsCached = false;
            } catch (Throwable th) {
                this.decoderLock.writeLock().unlock();
                throw th;
            }
        }
        LinkedHashMap linkedHashMap = this.tileMap;
        if (linkedHashMap != null) {
            for (Map.Entry entry : linkedHashMap.entrySet()) {
                for (Tile tile : (List) entry.getValue()) {
                    tile.visible = false;
                    Bitmap bitmap2 = tile.bitmap;
                    if (bitmap2 != null) {
                        bitmap2.recycle();
                        tile.bitmap = null;
                    }
                }
            }
            this.tileMap = null;
        }
        setGestureDetector(getContext());
    }

    public final void setImage(ImageSource imageSource) {
        reset(true);
        Bitmap bitmap = imageSource.bitmap;
        if (bitmap != null) {
            onImageLoaded(bitmap, 0, imageSource.cached);
            return;
        }
        Uri uri = imageSource.uri;
        this.uri = uri;
        if (uri == null && imageSource.resource != null) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("android.resource://");
            m.append(getContext().getPackageName());
            m.append("/");
            m.append(imageSource.resource);
            this.uri = Uri.parse(m.toString());
        }
        if (!imageSource.tile) {
            new BitmapLoadTask(this, getContext(), this.bitmapDecoderFactory, this.uri, false).executeOnExecutor(this.executor, new Void[0]);
        } else {
            new TilesInitTask(this, getContext(), this.regionDecoderFactory, this.uri).executeOnExecutor(this.executor, new Void[0]);
        }
    }

    /* loaded from: classes.dex */
    public static class ScaleAndTranslate {
        public float scale;
        public final PointF vTranslate;

        public ScaleAndTranslate(float f, PointF pointF) {
            this.scale = f;
            this.vTranslate = pointF;
        }
    }

    /* renamed from: -$$Nest$mgetExifOrientation  reason: not valid java name */
    public static int m33$$Nest$mgetExifOrientation(SubsamplingScaleImageView subsamplingScaleImageView, Context context, String str) {
        int i;
        int i2;
        int i3 = 0;
        if (str.startsWith("content")) {
            Cursor cursor = null;
            try {
                try {
                    cursor = context.getContentResolver().query(Uri.parse(str), new String[]{"orientation"}, null, null, null);
                    if (cursor != null && cursor.moveToFirst()) {
                        int i4 = cursor.getInt(0);
                        if (!VALID_ORIENTATIONS.contains(Integer.valueOf(i4)) || i4 == -1) {
                            Log.w("SubsamplingScaleImageView", "Unsupported orientation: " + i4);
                        } else {
                            i3 = i4;
                        }
                    }
                    if (cursor == null) {
                        return i3;
                    }
                } catch (Throwable th) {
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            } catch (Exception unused) {
                Log.w("SubsamplingScaleImageView", "Could not get orientation of image from media store");
                if (cursor == null) {
                    return 0;
                }
            }
            cursor.close();
            return i3;
        } else if (!str.startsWith("file:///") || str.startsWith("file:///android_asset/")) {
            return 0;
        } else {
            try {
                ExifInterface exifInterface = new ExifInterface(str.substring(7));
                ExifInterface.ExifAttribute exifAttribute = exifInterface.getExifAttribute("Orientation");
                if (exifAttribute != null) {
                    try {
                        i = exifAttribute.getIntValue(exifInterface.mExifByteOrder);
                    } catch (NumberFormatException unused2) {
                        i = 1;
                    }
                    if (i == 1 && i != 0) {
                        if (i == 6) {
                            i2 = 90;
                        } else if (i == 3) {
                            i2 = 180;
                        } else if (i == 8) {
                            i2 = 270;
                        } else {
                            Log.w("SubsamplingScaleImageView", "Unsupported EXIF orientation: " + i);
                            return 0;
                        }
                        return i2;
                    }
                }
                i = 1;
                return i == 1 ? 0 : 0;
            } catch (Exception unused3) {
                Log.w("SubsamplingScaleImageView", "Could not get EXIF orientation of image");
                return 0;
            }
        }
    }

    public final int calculateInSampleSize(float f) {
        int i;
        if (this.minimumTileDpi > 0) {
            DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
            f *= this.minimumTileDpi / ((displayMetrics.xdpi + displayMetrics.ydpi) / 2.0f);
        }
        int sWidth = (int) (sWidth() * f);
        int sHeight = (int) (sHeight() * f);
        if (sWidth == 0 || sHeight == 0) {
            return 32;
        }
        int i2 = 1;
        if (sHeight() > sHeight || sWidth() > sWidth) {
            i = Math.round(sHeight() / sHeight);
            int round = Math.round(sWidth() / sWidth);
            if (i >= round) {
                i = round;
            }
        } else {
            i = 1;
        }
        while (true) {
            int i3 = i2 * 2;
            if (i3 >= i) {
                return i2;
            }
            i2 = i3;
        }
    }

    public final void doubleTapZoom(PointF pointF, PointF pointF2) {
        boolean z;
        if (!this.panEnabled) {
            PointF pointF3 = this.sRequestedCenter;
            if (pointF3 != null) {
                pointF.x = pointF3.x;
                pointF.y = pointF3.y;
            } else {
                pointF.x = sWidth() / 2;
                pointF.y = sHeight() / 2;
            }
        }
        float min = Math.min(this.maxScale, this.doubleTapZoomScale);
        float f = this.scale;
        if (f <= min * 0.9d || f == this.minScale) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            min = minScale();
        }
        int i = this.doubleTapZoomStyle;
        if (i == 3) {
            this.anim = null;
            this.pendingScale = Float.valueOf(min);
            this.sPendingCenter = pointF;
            this.sRequestedCenter = pointF;
            invalidate();
        } else if (i == 2 || !z || !this.panEnabled) {
            AnimationBuilder animationBuilder = new AnimationBuilder(min, pointF);
            animationBuilder.interruptible = false;
            animationBuilder.duration = this.doubleTapZoomDuration;
            animationBuilder.origin = 4;
            animationBuilder.start();
        } else if (i == 1) {
            AnimationBuilder animationBuilder2 = new AnimationBuilder(min, pointF, pointF2);
            animationBuilder2.interruptible = false;
            animationBuilder2.duration = this.doubleTapZoomDuration;
            animationBuilder2.origin = 4;
            animationBuilder2.start();
        }
        invalidate();
    }

    public final int getRequiredRotation() {
        int i = this.orientation;
        if (i == -1) {
            return this.sOrientation;
        }
        return i;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void initialiseTileMap(Point point) {
        boolean z;
        int i;
        int i2;
        this.tileMap = new LinkedHashMap();
        int i3 = this.fullImageSampleSize;
        int i4 = 1;
        int i5 = 1;
        int i6 = 1;
        while (true) {
            int sWidth = sWidth() / i5;
            int sHeight = sHeight() / i6;
            int i7 = sWidth / i3;
            int i8 = sHeight / i3;
            while (true) {
                if (i7 + i5 + i4 > point.x || (i7 > getWidth() * 1.25d && i3 < this.fullImageSampleSize)) {
                    i5++;
                    sWidth = sWidth() / i5;
                    i7 = sWidth / i3;
                }
            }
            while (true) {
                if (i8 + i6 + i4 > point.y || (i8 > getHeight() * 1.25d && i3 < this.fullImageSampleSize)) {
                    i6++;
                    sHeight = sHeight() / i6;
                    i8 = sHeight / i3;
                }
            }
            ArrayList arrayList = new ArrayList(i5 * i6);
            int i9 = 0;
            int i10 = 0;
            while (i10 < i5) {
                int i11 = i9;
                while (i11 < i6) {
                    Tile tile = new Tile(i9);
                    tile.sampleSize = i3;
                    if (i3 == this.fullImageSampleSize) {
                        z = i4;
                    } else {
                        z = i9;
                    }
                    tile.visible = z;
                    int i12 = i10 * sWidth;
                    int i13 = i11 * sHeight;
                    if (i10 == i5 - 1) {
                        i = sWidth();
                    } else {
                        i = (i10 + 1) * sWidth;
                    }
                    if (i11 == i6 - 1) {
                        i2 = sHeight();
                    } else {
                        i2 = (i11 + 1) * sHeight;
                    }
                    tile.sRect = new Rect(i12, i13, i, i2);
                    i9 = 0;
                    tile.vRect = new Rect(0, 0, 0, 0);
                    tile.fileSRect = new Rect(tile.sRect);
                    arrayList.add(tile);
                    i11++;
                    i4 = 1;
                }
                i10++;
                i4 = 1;
            }
            this.tileMap.put(Integer.valueOf(i3), arrayList);
            i4 = 1;
            if (i3 != 1) {
                i3 /= 2;
            } else {
                return;
            }
        }
    }

    public final boolean isBaseLayerReady() {
        boolean z = true;
        if (!(this.bitmap == null || this.bitmapIsPreview)) {
            return true;
        }
        LinkedHashMap linkedHashMap = this.tileMap;
        if (linkedHashMap == null) {
            return false;
        }
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            if (((Integer) entry.getKey()).intValue() == this.fullImageSampleSize) {
                for (Tile tile : (List) entry.getValue()) {
                    if (tile.loading || tile.bitmap == null) {
                        z = false;
                    }
                }
            }
        }
        return z;
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x011f  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onDraw(android.graphics.Canvas r28) {
        /*
            Method dump skipped, instructions count: 974
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView.onDraw(android.graphics.Canvas):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:50:0x0092, code lost:
        if (r6 != 262) goto L179;
     */
    /* JADX WARN: Removed duplicated region for block: B:178:0x043d  */
    /* JADX WARN: Removed duplicated region for block: B:221:0x054a  */
    /* JADX WARN: Removed duplicated region for block: B:227:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean onTouchEvent(android.view.MotionEvent r15) {
        /*
            Method dump skipped, instructions count: 1363
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView.onTouchEvent(android.view.MotionEvent):boolean");
    }

    public final void refreshRequiredTiles(boolean z) {
        boolean z2;
        if (!(this.decoder == null || this.tileMap == null)) {
            int min = Math.min(this.fullImageSampleSize, calculateInSampleSize(this.scale));
            for (Map.Entry entry : this.tileMap.entrySet()) {
                for (Tile tile : (List) entry.getValue()) {
                    int i = tile.sampleSize;
                    if (i < min || (i > min && i != this.fullImageSampleSize)) {
                        tile.visible = false;
                        Bitmap bitmap = tile.bitmap;
                        if (bitmap != null) {
                            bitmap.recycle();
                            tile.bitmap = null;
                        }
                    }
                    int i2 = tile.sampleSize;
                    if (i2 == min) {
                        float viewToSourceX = viewToSourceX(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                        float viewToSourceX2 = viewToSourceX(getWidth());
                        float viewToSourceY = viewToSourceY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                        float viewToSourceY2 = viewToSourceY(getHeight());
                        Rect rect = tile.sRect;
                        if (viewToSourceX > rect.right || rect.left > viewToSourceX2 || viewToSourceY > rect.bottom || rect.top > viewToSourceY2) {
                            z2 = false;
                        } else {
                            z2 = true;
                        }
                        if (z2) {
                            tile.visible = true;
                            if (!tile.loading && tile.bitmap == null && z) {
                                new TileLoadTask(this, this.decoder, tile).executeOnExecutor(this.executor, new Void[0]);
                            }
                        } else if (tile.sampleSize != this.fullImageSampleSize) {
                            tile.visible = false;
                            Bitmap bitmap2 = tile.bitmap;
                            if (bitmap2 != null) {
                                bitmap2.recycle();
                                tile.bitmap = null;
                            }
                        }
                    } else if (i2 == this.fullImageSampleSize) {
                        tile.visible = true;
                    }
                }
            }
        }
    }

    public final void sendStateChanged(float f, PointF pointF) {
        if (this.onStateChangedListener != null && !this.vTranslate.equals(pointF)) {
            OnStateChangedListener onStateChangedListener = this.onStateChangedListener;
            getCenter();
            ImagePreviewFragment.AnonymousClass3 r3 = (ImagePreviewFragment.AnonymousClass3) onStateChangedListener;
            ((PreviewFragment) ImagePreviewFragment.this).mBottomActionBar.enableActionButtonsWithBottomSheet(false);
            ImagePreviewFragment.this.mImageScaleChangeCounter.incrementAndGet();
            ImagePreviewFragment.this.mFullResImageView.postDelayed(new PreviewFragment$$ExternalSyntheticLambda8(r3, 2), 100L);
        }
    }

    public final void setGestureDetector(final Context context) {
        this.detector = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() { // from class: com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
            public final boolean onDoubleTap(MotionEvent motionEvent) {
                SubsamplingScaleImageView subsamplingScaleImageView = SubsamplingScaleImageView.this;
                if (!subsamplingScaleImageView.zoomEnabled || !subsamplingScaleImageView.readySent || subsamplingScaleImageView.vTranslate == null) {
                    return onDoubleTapEvent(motionEvent);
                }
                subsamplingScaleImageView.setGestureDetector(context);
                SubsamplingScaleImageView subsamplingScaleImageView2 = SubsamplingScaleImageView.this;
                PointF pointF = null;
                if (subsamplingScaleImageView2.quickScaleEnabled) {
                    subsamplingScaleImageView2.vCenterStart = new PointF(motionEvent.getX(), motionEvent.getY());
                    SubsamplingScaleImageView subsamplingScaleImageView3 = SubsamplingScaleImageView.this;
                    PointF pointF2 = SubsamplingScaleImageView.this.vTranslate;
                    subsamplingScaleImageView3.vTranslateStart = new PointF(pointF2.x, pointF2.y);
                    SubsamplingScaleImageView subsamplingScaleImageView4 = SubsamplingScaleImageView.this;
                    subsamplingScaleImageView4.scaleStart = subsamplingScaleImageView4.scale;
                    subsamplingScaleImageView4.isQuickScaling = true;
                    subsamplingScaleImageView4.isZooming = true;
                    subsamplingScaleImageView4.quickScaleLastDistance = -1.0f;
                    PointF pointF3 = subsamplingScaleImageView4.vCenterStart;
                    float f = pointF3.x;
                    float f2 = pointF3.y;
                    PointF pointF4 = new PointF();
                    if (subsamplingScaleImageView4.vTranslate != null) {
                        pointF4.set(subsamplingScaleImageView4.viewToSourceX(f), subsamplingScaleImageView4.viewToSourceY(f2));
                        pointF = pointF4;
                    }
                    subsamplingScaleImageView4.quickScaleSCenter = pointF;
                    SubsamplingScaleImageView.this.quickScaleVStart = new PointF(motionEvent.getX(), motionEvent.getY());
                    SubsamplingScaleImageView subsamplingScaleImageView5 = SubsamplingScaleImageView.this;
                    PointF pointF5 = SubsamplingScaleImageView.this.quickScaleSCenter;
                    subsamplingScaleImageView5.quickScaleVLastPoint = new PointF(pointF5.x, pointF5.y);
                    SubsamplingScaleImageView.this.quickScaleMoved = false;
                    return false;
                }
                PointF pointF6 = new PointF(motionEvent.getX(), motionEvent.getY());
                float f3 = pointF6.x;
                float f4 = pointF6.y;
                PointF pointF7 = new PointF();
                if (subsamplingScaleImageView2.vTranslate != null) {
                    pointF7.set(subsamplingScaleImageView2.viewToSourceX(f3), subsamplingScaleImageView2.viewToSourceY(f4));
                    pointF = pointF7;
                }
                subsamplingScaleImageView2.doubleTapZoom(pointF, new PointF(motionEvent.getX(), motionEvent.getY()));
                return true;
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public final boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
                SubsamplingScaleImageView subsamplingScaleImageView = SubsamplingScaleImageView.this;
                if (!subsamplingScaleImageView.panEnabled || !subsamplingScaleImageView.readySent || subsamplingScaleImageView.vTranslate == null || motionEvent == null || motionEvent2 == null || ((Math.abs(motionEvent.getX() - motionEvent2.getX()) <= 50.0f && Math.abs(motionEvent.getY() - motionEvent2.getY()) <= 50.0f) || ((Math.abs(f) <= 500.0f && Math.abs(f2) <= 500.0f) || SubsamplingScaleImageView.this.isZooming))) {
                    return super.onFling(motionEvent, motionEvent2, f, f2);
                }
                PointF pointF = SubsamplingScaleImageView.this.vTranslate;
                PointF pointF2 = new PointF((f * 0.25f) + pointF.x, (f2 * 0.25f) + pointF.y);
                float width = (SubsamplingScaleImageView.this.getWidth() / 2) - pointF2.x;
                SubsamplingScaleImageView subsamplingScaleImageView2 = SubsamplingScaleImageView.this;
                SubsamplingScaleImageView subsamplingScaleImageView3 = SubsamplingScaleImageView.this;
                AnimationBuilder animationBuilder = new AnimationBuilder(new PointF(width / subsamplingScaleImageView2.scale, ((subsamplingScaleImageView2.getHeight() / 2) - pointF2.y) / subsamplingScaleImageView3.scale));
                if (SubsamplingScaleImageView.VALID_EASING_STYLES.contains(1)) {
                    animationBuilder.easing = 1;
                    animationBuilder.panLimited = false;
                    animationBuilder.origin = 3;
                    animationBuilder.start();
                    return true;
                }
                throw new IllegalArgumentException("Unknown easing type: 1");
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
            public final boolean onSingleTapConfirmed(MotionEvent motionEvent) {
                SubsamplingScaleImageView.this.performClick();
                return true;
            }
        });
        this.singleDetector = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() { // from class: com.davemorrissey.labs.subscaleview.SubsamplingScaleImageView.3
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
            public final boolean onSingleTapConfirmed(MotionEvent motionEvent) {
                SubsamplingScaleImageView.this.performClick();
                return true;
            }
        });
    }

    public final void setMinimumScaleType() {
        if (VALID_SCALE_TYPES.contains(3)) {
            this.minimumScaleType = 3;
            if (this.readySent) {
                fitToBounds(true);
                invalidate();
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Invalid scale type: 3");
    }

    public final void setPanLimit() {
        if (VALID_PAN_LIMITS.contains(1)) {
            this.panLimit = 1;
            if (this.readySent) {
                fitToBounds(true);
                invalidate();
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Invalid pan limit: 1");
    }

    public final float sourceToViewX(float f) {
        PointF pointF = this.vTranslate;
        if (pointF == null) {
            return Float.NaN;
        }
        return (f * this.scale) + pointF.x;
    }

    public final float sourceToViewY(float f) {
        PointF pointF = this.vTranslate;
        if (pointF == null) {
            return Float.NaN;
        }
        return (f * this.scale) + pointF.y;
    }

    public final float viewToSourceX(float f) {
        PointF pointF = this.vTranslate;
        if (pointF == null) {
            return Float.NaN;
        }
        return (f - pointF.x) / this.scale;
    }

    public final float viewToSourceY(float f) {
        PointF pointF = this.vTranslate;
        if (pointF == null) {
            return Float.NaN;
        }
        return (f - pointF.y) / this.scale;
    }

    public final boolean checkImageLoaded() {
        boolean isBaseLayerReady = isBaseLayerReady();
        if (!this.imageLoadedSent && isBaseLayerReady) {
            preDraw();
            this.imageLoadedSent = true;
        }
        return isBaseLayerReady;
    }

    public final boolean checkReady() {
        boolean z;
        if (getWidth() <= 0 || getHeight() <= 0 || this.sWidth <= 0 || this.sHeight <= 0 || (this.bitmap == null && !isBaseLayerReady())) {
            z = false;
        } else {
            z = true;
        }
        if (!this.readySent && z) {
            preDraw();
            this.readySent = true;
        }
        return z;
    }

    public final void fileSRect(Rect rect, Rect rect2) {
        if (getRequiredRotation() == 0) {
            rect2.set(rect);
        } else if (getRequiredRotation() == 90) {
            int i = rect.top;
            int i2 = this.sHeight;
            rect2.set(i, i2 - rect.right, rect.bottom, i2 - rect.left);
        } else if (getRequiredRotation() == 180) {
            int i3 = this.sWidth;
            int i4 = this.sHeight;
            rect2.set(i3 - rect.right, i4 - rect.bottom, i3 - rect.left, i4 - rect.top);
        } else {
            int i5 = this.sWidth;
            rect2.set(i5 - rect.bottom, rect.left, i5 - rect.top, rect.right);
        }
    }

    public final PointF getCenter() {
        float width = getWidth() / 2;
        float height = getHeight() / 2;
        PointF pointF = new PointF();
        if (this.vTranslate == null) {
            return null;
        }
        pointF.set(viewToSourceX(width), viewToSourceY(height));
        return pointF;
    }

    public final float minScale() {
        int paddingTop = getPaddingTop() + getPaddingBottom();
        int paddingRight = getPaddingRight() + getPaddingLeft();
        int i = this.minimumScaleType;
        if (i == 2 || i == 4) {
            return Math.max((getWidth() - paddingRight) / sWidth(), (getHeight() - paddingTop) / sHeight());
        }
        if (i == 3) {
            float f = this.minScale;
            if (f > HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                return f;
            }
        }
        return Math.min((getWidth() - paddingRight) / sWidth(), (getHeight() - paddingTop) / sHeight());
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        boolean z;
        int mode = View.MeasureSpec.getMode(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size = View.MeasureSpec.getSize(i);
        int size2 = View.MeasureSpec.getSize(i2);
        boolean z2 = true;
        if (mode != 1073741824) {
            z = true;
        } else {
            z = false;
        }
        if (mode2 == 1073741824) {
            z2 = false;
        }
        if (this.sWidth > 0 && this.sHeight > 0) {
            if (z && z2) {
                size = sWidth();
                size2 = sHeight();
            } else if (z2) {
                size2 = (int) ((sHeight() / sWidth()) * size);
            } else if (z) {
                size = (int) ((sWidth() / sHeight()) * size2);
            }
        }
        setMeasuredDimension(Math.max(size, getSuggestedMinimumWidth()), Math.max(size2, getSuggestedMinimumHeight()));
    }

    @Override // android.view.View
    public final void onSizeChanged(int i, int i2, int i3, int i4) {
        PointF center = getCenter();
        if (this.readySent && center != null) {
            this.anim = null;
            this.pendingScale = Float.valueOf(this.scale);
            this.sPendingCenter = center;
        }
    }

    public final void preDraw() {
        Float f;
        if (getWidth() != 0 && getHeight() != 0 && this.sWidth > 0 && this.sHeight > 0) {
            if (!(this.sPendingCenter == null || (f = this.pendingScale) == null)) {
                this.scale = f.floatValue();
                if (this.vTranslate == null) {
                    this.vTranslate = new PointF();
                }
                this.vTranslate.x = (getWidth() / 2) - (this.scale * this.sPendingCenter.x);
                this.vTranslate.y = (getHeight() / 2) - (this.scale * this.sPendingCenter.y);
                this.sPendingCenter = null;
                this.pendingScale = null;
                fitToBounds(true);
                refreshRequiredTiles(true);
            }
            fitToBounds(false);
        }
    }

    public final int sHeight() {
        int requiredRotation = getRequiredRotation();
        if (requiredRotation == 90 || requiredRotation == 270) {
            return this.sWidth;
        }
        return this.sHeight;
    }

    public final int sWidth() {
        int requiredRotation = getRequiredRotation();
        if (requiredRotation == 90 || requiredRotation == 270) {
            return this.sHeight;
        }
        return this.sWidth;
    }

    public final PointF vTranslateForSCenter(float f, float f2, float f3) {
        int width = (((getWidth() - getPaddingRight()) - getPaddingLeft()) / 2) + getPaddingLeft();
        int height = (((getHeight() - getPaddingBottom()) - getPaddingTop()) / 2) + getPaddingTop();
        if (this.satTemp == null) {
            this.satTemp = new ScaleAndTranslate(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, new PointF(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES));
        }
        ScaleAndTranslate scaleAndTranslate = this.satTemp;
        scaleAndTranslate.scale = f3;
        scaleAndTranslate.vTranslate.set(width - (f * f3), height - (f2 * f3));
        fitToBounds(true, this.satTemp);
        return this.satTemp.vTranslate;
    }

    public final void fitToBounds(boolean z) {
        boolean z2;
        if (this.vTranslate == null) {
            z2 = true;
            this.vTranslate = new PointF(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        } else {
            z2 = false;
        }
        if (this.satTemp == null) {
            this.satTemp = new ScaleAndTranslate(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, new PointF(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES));
        }
        ScaleAndTranslate scaleAndTranslate = this.satTemp;
        scaleAndTranslate.scale = this.scale;
        scaleAndTranslate.vTranslate.set(this.vTranslate);
        fitToBounds(z, this.satTemp);
        ScaleAndTranslate scaleAndTranslate2 = this.satTemp;
        this.scale = scaleAndTranslate2.scale;
        this.vTranslate.set(scaleAndTranslate2.vTranslate);
        if (z2 && this.minimumScaleType != 4) {
            this.vTranslate.set(vTranslateForSCenter(sWidth() / 2, sHeight() / 2, this.scale));
        }
    }

    public SubsamplingScaleImageView(Context context) {
        this(context, null);
    }

    /* loaded from: classes.dex */
    public static class Tile {
        public Bitmap bitmap;
        public Rect fileSRect;
        public boolean loading;
        public Rect sRect;
        public int sampleSize;
        public Rect vRect;
        public boolean visible;

        public Tile() {
            throw null;
        }

        public Tile(int i) {
        }
    }

    @Override // android.view.View
    public final void setOnLongClickListener(View.OnLongClickListener onLongClickListener) {
        this.onLongClickListener = onLongClickListener;
    }
}
