package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.util.Util;
import java.io.IOException;
/* loaded from: classes.dex */
public final class UnitBitmapDecoder implements ResourceDecoder<Bitmap, Bitmap> {

    /* loaded from: classes.dex */
    public static final class NonOwnedBitmapResource implements Resource<Bitmap> {
        public final Bitmap bitmap;

        @Override // com.bumptech.glide.load.engine.Resource
        public final void recycle() {
        }

        @Override // com.bumptech.glide.load.engine.Resource
        public final int getSize() {
            return Util.getBitmapByteSize(this.bitmap);
        }

        public NonOwnedBitmapResource(Bitmap bitmap) {
            this.bitmap = bitmap;
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

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<Bitmap> decode(Bitmap bitmap, int i, int i2, Options options) throws IOException {
        return new NonOwnedBitmapResource(bitmap);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final /* bridge */ /* synthetic */ boolean handles(Bitmap bitmap, Options options) throws IOException {
        return true;
    }
}
