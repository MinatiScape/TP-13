package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import com.bumptech.glide.Glide;
import com.bumptech.glide.GlideContext;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class DrawableTransformation implements Transformation<Drawable> {
    public final boolean isRequired;
    public final Transformation<Bitmap> wrapped;

    @Override // com.bumptech.glide.load.Key
    public final boolean equals(Object obj) {
        if (obj instanceof DrawableTransformation) {
            return this.wrapped.equals(((DrawableTransformation) obj).wrapped);
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

    public DrawableTransformation(Transformation<Bitmap> transformation, boolean z) {
        this.wrapped = transformation;
        this.isRequired = z;
    }

    @Override // com.bumptech.glide.load.Transformation
    public final Resource transform(GlideContext glideContext, Resource resource, int i, int i2) {
        BitmapPool bitmapPool = Glide.get(glideContext).bitmapPool;
        Drawable drawable = (Drawable) resource.get();
        BitmapResource convert = DrawableToBitmapConverter.convert(bitmapPool, drawable, i, i2);
        if (convert != null) {
            Resource transform = this.wrapped.transform(glideContext, convert, i, i2);
            if (!transform.equals(convert)) {
                return new LazyBitmapDrawableResource(glideContext.getResources(), transform);
            }
            transform.recycle();
            return resource;
        } else if (!this.isRequired) {
            return resource;
        } else {
            throw new IllegalArgumentException("Unable to convert " + drawable + " to a Bitmap");
        }
    }
}
