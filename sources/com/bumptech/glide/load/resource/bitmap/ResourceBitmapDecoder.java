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
public class ResourceBitmapDecoder implements ResourceDecoder<Uri, Bitmap> {
    public final BitmapPool bitmapPool;
    public final ResourceDrawableDecoder drawableDecoder;

    public ResourceBitmapDecoder(ResourceDrawableDecoder drawableDecoder, BitmapPool bitmapPool) {
        this.drawableDecoder = drawableDecoder;
        this.bitmapPool = bitmapPool;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public Resource<Bitmap> decode(Uri source, int width, int height, Options options) throws IOException {
        Resource decode = this.drawableDecoder.decode(source);
        if (decode == null) {
            return null;
        }
        return DrawableToBitmapConverter.convert(this.bitmapPool, ((DrawableResource) decode).get(), width, height);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public boolean handles(Uri source, Options options) throws IOException {
        return "android.resource".equals(source.getScheme());
    }
}
