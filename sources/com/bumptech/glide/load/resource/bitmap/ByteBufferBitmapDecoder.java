package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.util.ByteBufferUtil;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Objects;
/* loaded from: classes.dex */
public class ByteBufferBitmapDecoder implements ResourceDecoder<ByteBuffer, Bitmap> {
    public final Downsampler downsampler;

    public ByteBufferBitmapDecoder(Downsampler downsampler) {
        this.downsampler = downsampler;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public Resource<Bitmap> decode(ByteBuffer source, int width, int height, Options options) throws IOException {
        int i = ByteBufferUtil.$r8$clinit;
        return this.downsampler.decode(new ByteBufferUtil.ByteBufferStream(source), width, height, options, Downsampler.EMPTY_CALLBACKS);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public boolean handles(ByteBuffer source, Options options) throws IOException {
        Objects.requireNonNull(this.downsampler);
        return true;
    }
}
