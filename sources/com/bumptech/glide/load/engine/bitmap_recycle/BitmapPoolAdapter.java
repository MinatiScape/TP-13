package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
/* loaded from: classes.dex */
public class BitmapPoolAdapter implements BitmapPool {
    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public final void clearMemory() {
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public final void setSizeMultiplier(float f) {
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public final void trimMemory(int i) {
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public final Bitmap get(int i, int i2, Bitmap.Config config) {
        return Bitmap.createBitmap(i, i2, config);
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public final Bitmap getDirty(int i, int i2, Bitmap.Config config) {
        return Bitmap.createBitmap(i, i2, config);
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
    public void put(Bitmap bitmap) {
        bitmap.recycle();
    }
}
