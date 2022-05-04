package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.net.Uri;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.drawable.DrawableResource;
import com.bumptech.glide.load.resource.drawable.ResourceDrawableDecoder;
import java.io.IOException;
/* loaded from: classes.dex */
public final class ResourceBitmapDecoder implements ResourceDecoder<Uri, Bitmap> {
    public final BitmapPool bitmapPool;
    public final ResourceDrawableDecoder drawableDecoder;

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<Bitmap> decode(Uri uri, int i, int i2, Options options) throws IOException {
        Resource decode = this.drawableDecoder.decode(uri);
        if (decode == null) {
            return null;
        }
        return DrawableToBitmapConverter.convert(this.bitmapPool, ((DrawableResource) decode).get(), i, i2);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final boolean handles(Uri uri, Options options) throws IOException {
        return "android.resource".equals(uri.getScheme());
    }

    public ResourceBitmapDecoder(ResourceDrawableDecoder resourceDrawableDecoder, BitmapPool bitmapPool) {
        this.drawableDecoder = resourceDrawableDecoder;
        this.bitmapPool = bitmapPool;
    }
}
