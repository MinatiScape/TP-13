package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Paint;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class CenterCrop extends BitmapTransformation {
    public static final byte[] ID_BYTES = "com.bumptech.glide.load.resource.bitmap.CenterCrop".getBytes(Key.CHARSET);

    @Override // com.bumptech.glide.load.Key
    public final int hashCode() {
        return -599754482;
    }

    @Override // com.bumptech.glide.load.resource.bitmap.BitmapTransformation
    public final Bitmap transform(BitmapPool bitmapPool, Bitmap bitmap, int i, int i2) {
        float f;
        float f2;
        Bitmap.Config config;
        Paint paint = TransformationUtils.DEFAULT_PAINT;
        if (bitmap.getWidth() == i && bitmap.getHeight() == i2) {
            return bitmap;
        }
        Matrix matrix = new Matrix();
        int width = bitmap.getWidth() * i2;
        int height = bitmap.getHeight() * i;
        float f3 = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        if (width > height) {
            f2 = i2 / bitmap.getHeight();
            f3 = (i - (bitmap.getWidth() * f2)) * 0.5f;
            f = 0.0f;
        } else {
            f2 = i / bitmap.getWidth();
            f = (i2 - (bitmap.getHeight() * f2)) * 0.5f;
        }
        matrix.setScale(f2, f2);
        matrix.postTranslate((int) (f3 + 0.5f), (int) (f + 0.5f));
        if (bitmap.getConfig() != null) {
            config = bitmap.getConfig();
        } else {
            config = Bitmap.Config.ARGB_8888;
        }
        Bitmap bitmap2 = bitmapPool.get(i, i2, config);
        bitmap2.setHasAlpha(bitmap.hasAlpha());
        TransformationUtils.applyMatrix(bitmap, bitmap2, matrix);
        return bitmap2;
    }

    @Override // com.bumptech.glide.load.Key
    public final void updateDiskCacheKey(MessageDigest messageDigest) {
        messageDigest.update(ID_BYTES);
    }

    @Override // com.bumptech.glide.load.Key
    public final boolean equals(Object obj) {
        return obj instanceof CenterCrop;
    }
}
