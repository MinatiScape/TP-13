package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import androidx.viewpager2.widget.FakeDrag$$ExternalSyntheticOutline0;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public class DrawableTransformation implements Transformation<Drawable> {
    public final boolean isRequired;
    public final Transformation<Bitmap> wrapped;

    public DrawableTransformation(Transformation<Bitmap> wrapped, boolean isRequired) {
        this.wrapped = wrapped;
        this.isRequired = isRequired;
    }

    @Override // com.bumptech.glide.load.Key
    public boolean equals(Object o) {
        if (o instanceof DrawableTransformation) {
            return this.wrapped.equals(((DrawableTransformation) o).wrapped);
        }
        return false;
    }

    @Override // com.bumptech.glide.load.Key
    public int hashCode() {
        return this.wrapped.hashCode();
    }

    @Override // com.bumptech.glide.load.Transformation
    public Resource<Drawable> transform(Context context, Resource<Drawable> resource, int outWidth, int outHeight) {
        BitmapPool bitmapPool = Glide.get(context).bitmapPool;
        Drawable drawable = resource.get();
        Resource<Bitmap> convert = DrawableToBitmapConverter.convert(bitmapPool, drawable, outWidth, outHeight);
        if (convert != null) {
            Resource<Bitmap> transform = this.wrapped.transform(context, convert, outWidth, outHeight);
            if (!transform.equals(convert)) {
                return LazyBitmapDrawableResource.obtain(context.getResources(), transform);
            }
            transform.recycle();
            return resource;
        } else if (!this.isRequired) {
            return resource;
        } else {
            String valueOf = String.valueOf(drawable);
            throw new IllegalArgumentException(FakeDrag$$ExternalSyntheticOutline0.m(valueOf.length() + 30, "Unable to convert ", valueOf, " to a Bitmap"));
        }
    }

    @Override // com.bumptech.glide.load.Key
    public void updateDiskCacheKey(MessageDigest messageDigest) {
        this.wrapped.updateDiskCacheKey(messageDigest);
    }
}
