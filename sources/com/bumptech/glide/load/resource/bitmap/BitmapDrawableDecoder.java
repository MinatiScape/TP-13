package com.bumptech.glide.load.resource.bitmap;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import java.io.IOException;
/* loaded from: classes.dex */
public final class BitmapDrawableDecoder<DataType> implements ResourceDecoder<DataType, BitmapDrawable> {
    public final ResourceDecoder<DataType, Bitmap> decoder;
    public final Resources resources;

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<BitmapDrawable> decode(DataType datatype, int i, int i2, Options options) throws IOException {
        Resource<Bitmap> decode = this.decoder.decode(datatype, i, i2, options);
        Resources resources = this.resources;
        if (decode == null) {
            return null;
        }
        return new LazyBitmapDrawableResource(resources, decode);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final boolean handles(DataType datatype, Options options) throws IOException {
        return this.decoder.handles(datatype, options);
    }

    public BitmapDrawableDecoder(Resources resources, ResourceDecoder<DataType, Bitmap> resourceDecoder) {
        this.resources = resources;
        this.decoder = resourceDecoder;
    }
}
