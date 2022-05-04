package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import java.io.File;
/* loaded from: classes.dex */
public final class BitmapDrawableEncoder implements ResourceEncoder<BitmapDrawable> {
    public final BitmapPool bitmapPool;
    public final ResourceEncoder<Bitmap> encoder;

    @Override // com.bumptech.glide.load.Encoder
    public final boolean encode(Object obj, File file, Options options) {
        return this.encoder.encode(new BitmapResource(((BitmapDrawable) ((Resource) obj).get()).getBitmap(), this.bitmapPool), file, options);
    }

    @Override // com.bumptech.glide.load.ResourceEncoder
    public final EncodeStrategy getEncodeStrategy(Options options) {
        return this.encoder.getEncodeStrategy(options);
    }

    public BitmapDrawableEncoder(BitmapPool bitmapPool, BitmapEncoder bitmapEncoder) {
        this.bitmapPool = bitmapPool;
        this.encoder = bitmapEncoder;
    }
}
