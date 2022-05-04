package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.Glide;
import com.bumptech.glide.GlideContext;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.bitmap.BitmapResource;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class GifDrawableTransformation implements Transformation<GifDrawable> {
    public final Transformation<Bitmap> wrapped;

    @Override // com.bumptech.glide.load.Key
    public final boolean equals(Object obj) {
        if (obj instanceof GifDrawableTransformation) {
            return this.wrapped.equals(((GifDrawableTransformation) obj).wrapped);
        }
        return false;
    }

    @Override // com.bumptech.glide.load.Key
    public final int hashCode() {
        return this.wrapped.hashCode();
    }

    @Override // com.bumptech.glide.load.Key
    public final void updateDiskCacheKey(MessageDigest messageDigest) {
        this.wrapped.updateDiskCacheKey(messageDigest);
    }

    public GifDrawableTransformation(Transformation<Bitmap> transformation) {
        ContainerHelpers.checkNotNull(transformation);
        this.wrapped = transformation;
    }

    @Override // com.bumptech.glide.load.Transformation
    public final Resource transform(GlideContext glideContext, Resource resource, int i, int i2) {
        GifDrawable gifDrawable = (GifDrawable) resource.get();
        BitmapResource bitmapResource = new BitmapResource(gifDrawable.state.frameLoader.firstFrame, Glide.get(glideContext).bitmapPool);
        Resource transform = this.wrapped.transform(glideContext, bitmapResource, i, i2);
        if (!bitmapResource.equals(transform)) {
            bitmapResource.recycle();
        }
        Transformation<Bitmap> transformation = this.wrapped;
        gifDrawable.state.frameLoader.setFrameTransformation(transformation, (Bitmap) transform.get());
        return resource;
    }
}
