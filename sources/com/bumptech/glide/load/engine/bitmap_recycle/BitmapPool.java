package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
/* loaded from: classes.dex */
public interface BitmapPool {
    void clearMemory();

    Bitmap get(int width, int height, Bitmap.Config config);

    Bitmap getDirty(int width, int height, Bitmap.Config config);

    void put(Bitmap bitmap);

    void setSizeMultiplier(float sizeMultiplier);

    void trimMemory(int level);
}
