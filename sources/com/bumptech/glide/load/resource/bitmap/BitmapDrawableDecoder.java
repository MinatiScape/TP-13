package com.bumptech.glide.load.resource.bitmap;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import java.io.IOException;
/* loaded from: classes.dex */
public class BitmapDrawableDecoder<DataType> implements ResourceDecoder<DataType, BitmapDrawable> {
    public final ResourceDecoder<DataType, Bitmap> decoder;
    public final Resources resources;

    public BitmapDrawableDecoder(Resources resources, ResourceDecoder<DataType, Bitmap> decoder) {
        this.resources = resources;
        this.decoder = decoder;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public Resource<BitmapDrawable> decode(DataType source, int width, int height, Options options) throws IOException {
        return LazyBitmapDrawableResource.obtain(this.resources, this.decoder.decode(source, width, height, options));
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public boolean handles(DataType source, Options options) throws IOException {
        return this.decoder.handles(source, options);
    }
}
