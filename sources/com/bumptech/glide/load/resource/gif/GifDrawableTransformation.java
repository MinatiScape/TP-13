package com.bumptech.glide.load.resource.gif;

import android.content.Context;
import android.graphics.Bitmap;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.bitmap.BitmapResource;
import java.security.MessageDigest;
import java.util.Objects;
/* loaded from: classes.dex */
public class GifDrawableTransformation implements Transformation<GifDrawable> {
    public final Transformation<Bitmap> wrapped;

    public GifDrawableTransformation(Transformation<Bitmap> wrapped) {
        Objects.requireNonNull(wrapped, "Argument must not be null");
        this.wrapped = wrapped;
    }

    @Override // com.bumptech.glide.load.Key
    public boolean equals(Object o) {
        if (o instanceof GifDrawableTransformation) {
            return this.wrapped.equals(((GifDrawableTransformation) o).wrapped);
        }
        return false;
    }

    @Override // com.bumptech.glide.load.Key
    public int hashCode() {
        return this.wrapped.hashCode();
    }

    @Override // com.bumptech.glide.load.Transformation
    public Resource<GifDrawable> transform(Context context, Resource<GifDrawable> resource, int outWidth, int outHeight) {
        GifDrawable gifDrawable = resource.get();
        Resource<Bitmap> bitmapResource = new BitmapResource(gifDrawable.getFirstFrame(), Glide.get(context).bitmapPool);
        Resource<Bitmap> transform = this.wrapped.transform(context, bitmapResource, outWidth, outHeight);
        if (!bitmapResource.equals(transform)) {
            bitmapResource.recycle();
        }
        Transformation<Bitmap> transformation = this.wrapped;
        gifDrawable.state.frameLoader.setFrameTransformation(transformation, transform.get());
        return resource;
    }

    @Override // com.bumptech.glide.load.Key
    public void updateDiskCacheKey(MessageDigest messageDigest) {
        this.wrapped.updateDiskCacheKey(messageDigest);
    }
}
