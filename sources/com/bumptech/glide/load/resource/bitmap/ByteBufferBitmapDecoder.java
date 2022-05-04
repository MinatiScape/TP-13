package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.bitmap.ImageReader;
import com.bumptech.glide.util.ByteBufferUtil;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class ByteBufferBitmapDecoder implements ResourceDecoder<ByteBuffer, Bitmap> {
    public final Downsampler downsampler;

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<Bitmap> decode(ByteBuffer byteBuffer, int i, int i2, Options options) throws IOException {
        AtomicReference<byte[]> atomicReference = ByteBufferUtil.BUFFER_REF;
        ByteBufferUtil.ByteBufferStream byteBufferStream = new ByteBufferUtil.ByteBufferStream(byteBuffer);
        Downsampler downsampler = this.downsampler;
        return downsampler.decode(new ImageReader.InputStreamImageReader(byteBufferStream, downsampler.parsers, downsampler.byteArrayPool), i, i2, options, Downsampler.EMPTY_CALLBACKS);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final boolean handles(ByteBuffer byteBuffer, Options options) throws IOException {
        this.downsampler.getClass();
        return true;
    }

    public ByteBufferBitmapDecoder(Downsampler downsampler) {
        this.downsampler = downsampler;
    }
}
