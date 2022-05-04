package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Paint;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public class CenterCrop extends BitmapTransformation {
    public static final byte[] ID_BYTES = "com.bumptech.glide.load.resource.bitmap.CenterCrop".getBytes(Key.CHARSET);

    @Override // com.bumptech.glide.load.Key
    public boolean equals(Object o) {
        return o instanceof CenterCrop;
    }

    @Override // com.bumptech.glide.load.Key
    public int hashCode() {
        return -599754482;
    }

    @Override // com.bumptech.glide.load.resource.bitmap.BitmapTransformation
    public Bitmap transform(BitmapPool pool, Bitmap toTransform, int outWidth, int outHeight) {
        float f;
        float f2;
        Paint paint = TransformationUtils.DEFAULT_PAINT;
        if (toTransform.getWidth() == outWidth && toTransform.getHeight() == outHeight) {
            return toTransform;
        }
        Matrix matrix = new Matrix();
        int width = toTransform.getWidth() * outHeight;
        int height = toTransform.getHeight() * outWidth;
        float f3 = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        if (width > height) {
            f2 = outHeight / toTransform.getHeight();
            f3 = (outWidth - (toTransform.getWidth() * f2)) * 0.5f;
            f = 0.0f;
        } else {
            f2 = outWidth / toTransform.getWidth();
            f = (outHeight - (toTransform.getHeight() * f2)) * 0.5f;
        }
        matrix.setScale(f2, f2);
        matrix.postTranslate((int) (f3 + 0.5f), (int) (f + 0.5f));
        Bitmap bitmap = pool.get(outWidth, outHeight, TransformationUtils.getNonNullConfig(toTransform));
        bitmap.setHasAlpha(toTransform.hasAlpha());
        TransformationUtils.applyMatrix(toTransform, bitmap, matrix);
        return bitmap;
    }

    @Override // com.bumptech.glide.load.Key
    public void updateDiskCacheKey(MessageDigest messageDigest) {
        messageDigest.update(ID_BYTES);
    }
}
