package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.graphics.Bitmap;
import com.bumptech.glide.Glide;
import com.bumptech.glide.gifdecoder.GifHeaderParser$$ExternalSyntheticOutline0;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.util.Util;
/* loaded from: classes.dex */
public abstract class BitmapTransformation implements Transformation<Bitmap> {
    public abstract Bitmap transform(BitmapPool pool, Bitmap toTransform, int outWidth, int outHeight);

    @Override // com.bumptech.glide.load.Transformation
    public final Resource<Bitmap> transform(Context context, Resource<Bitmap> resource, int outWidth, int outHeight) {
        if (Util.isValidDimensions(outWidth, outHeight)) {
            BitmapPool bitmapPool = Glide.get(context).bitmapPool;
            Bitmap bitmap = resource.get();
            if (outWidth == Integer.MIN_VALUE) {
                outWidth = bitmap.getWidth();
            }
            if (outHeight == Integer.MIN_VALUE) {
                outHeight = bitmap.getHeight();
            }
            Bitmap transform = transform(bitmapPool, bitmap, outWidth, outHeight);
            return bitmap.equals(transform) ? resource : BitmapResource.obtain(transform, bitmapPool);
        }
        StringBuilder m = GifHeaderParser$$ExternalSyntheticOutline0.m(128, "Cannot apply transformation on width: ", outWidth, " or height: ", outHeight);
        m.append(" less than or equal to zero and not Target.SIZE_ORIGINAL");
        throw new IllegalArgumentException(m.toString());
    }
}
