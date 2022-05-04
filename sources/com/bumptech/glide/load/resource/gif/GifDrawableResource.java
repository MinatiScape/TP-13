package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import com.bumptech.glide.load.resource.drawable.DrawableResource;
import com.bumptech.glide.load.resource.gif.GifFrameLoader;
/* loaded from: classes.dex */
public final class GifDrawableResource extends DrawableResource<GifDrawable> {
    @Override // com.bumptech.glide.load.engine.Resource
    public final int getSize() {
        GifFrameLoader gifFrameLoader = ((GifDrawable) this.drawable).state.frameLoader;
        return gifFrameLoader.gifDecoder.getByteSize() + gifFrameLoader.firstFrameSize;
    }

    @Override // com.bumptech.glide.load.resource.drawable.DrawableResource, com.bumptech.glide.load.engine.Initializable
    public final void initialize() {
        ((GifDrawable) this.drawable).state.frameLoader.firstFrame.prepareToDraw();
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final void recycle() {
        ((GifDrawable) this.drawable).stop();
        GifDrawable gifDrawable = (GifDrawable) this.drawable;
        gifDrawable.isRecycled = true;
        GifFrameLoader gifFrameLoader = gifDrawable.state.frameLoader;
        gifFrameLoader.callbacks.clear();
        Bitmap bitmap = gifFrameLoader.firstFrame;
        if (bitmap != null) {
            gifFrameLoader.bitmapPool.put(bitmap);
            gifFrameLoader.firstFrame = null;
        }
        gifFrameLoader.isRunning = false;
        GifFrameLoader.DelayTarget delayTarget = gifFrameLoader.current;
        if (delayTarget != null) {
            gifFrameLoader.requestManager.clear(delayTarget);
            gifFrameLoader.current = null;
        }
        GifFrameLoader.DelayTarget delayTarget2 = gifFrameLoader.next;
        if (delayTarget2 != null) {
            gifFrameLoader.requestManager.clear(delayTarget2);
            gifFrameLoader.next = null;
        }
        GifFrameLoader.DelayTarget delayTarget3 = gifFrameLoader.pendingTarget;
        if (delayTarget3 != null) {
            gifFrameLoader.requestManager.clear(delayTarget3);
            gifFrameLoader.pendingTarget = null;
        }
        gifFrameLoader.gifDecoder.clear();
        gifFrameLoader.isCleared = true;
    }

    public GifDrawableResource(GifDrawable gifDrawable) {
        super(gifDrawable);
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Class<GifDrawable> getResourceClass() {
        return GifDrawable.class;
    }
}
