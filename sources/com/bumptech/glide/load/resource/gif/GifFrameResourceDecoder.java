package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import com.bumptech.glide.gifdecoder.GifDecoder;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.BitmapResource;
import java.io.IOException;
/* loaded from: classes.dex */
public final class GifFrameResourceDecoder implements ResourceDecoder<GifDecoder, Bitmap> {
    public final BitmapPool bitmapPool;

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<Bitmap> decode(GifDecoder gifDecoder, int i, int i2, Options options) throws IOException {
        return BitmapResource.obtain(gifDecoder.getNextFrame(), this.bitmapPool);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final /* bridge */ /* synthetic */ boolean handles(GifDecoder gifDecoder, Options options) throws IOException {
        return true;
    }

    public GifFrameResourceDecoder(BitmapPool bitmapPool) {
        this.bitmapPool = bitmapPool;
    }
}
