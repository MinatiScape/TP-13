package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import com.bumptech.glide.load.engine.Initializable;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.util.Util;
/* loaded from: classes.dex */
public final class BitmapResource implements Resource<Bitmap>, Initializable {
    public final Bitmap bitmap;
    public final BitmapPool bitmapPool;

    public static BitmapResource obtain(Bitmap bitmap, BitmapPool bitmapPool) {
        if (bitmap == null) {
            return null;
        }
        return new BitmapResource(bitmap, bitmapPool);
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final int getSize() {
        return Util.getBitmapByteSize(this.bitmap);
    }

    @Override // com.bumptech.glide.load.engine.Initializable
    public final void initialize() {
        this.bitmap.prepareToDraw();
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final void recycle() {
        this.bitmapPool.put(this.bitmap);
    }

    public BitmapResource(Bitmap bitmap, BitmapPool bitmapPool) {
        if (bitmap != null) {
            this.bitmap = bitmap;
            if (bitmapPool != null) {
                this.bitmapPool = bitmapPool;
                return;
            }
            throw new NullPointerException("BitmapPool must not be null");
        }
        throw new NullPointerException("Bitmap must not be null");
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Bitmap get() {
        return this.bitmap;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Class<Bitmap> getResourceClass() {
        return Bitmap.class;
    }
}
