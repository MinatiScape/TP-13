package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.os.ParcelFileDescriptor;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.bitmap.ImageReader;
import java.io.IOException;
/* loaded from: classes.dex */
public final class ParcelFileDescriptorBitmapDecoder implements ResourceDecoder<ParcelFileDescriptor, Bitmap> {
    public final Downsampler downsampler;

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<Bitmap> decode(ParcelFileDescriptor parcelFileDescriptor, int i, int i2, Options options) throws IOException {
        Downsampler downsampler = this.downsampler;
        return downsampler.decode(new ImageReader.ParcelFileDescriptorImageReader(parcelFileDescriptor, downsampler.parsers, downsampler.byteArrayPool), i, i2, options, Downsampler.EMPTY_CALLBACKS);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final boolean handles(ParcelFileDescriptor parcelFileDescriptor, Options options) throws IOException {
        this.downsampler.getClass();
        return true;
    }

    public ParcelFileDescriptorBitmapDecoder(Downsampler downsampler) {
        this.downsampler = downsampler;
    }
}
