package com.bumptech.glide.load.resource.bytes;

import com.bumptech.glide.load.data.DataRewinder;
import java.io.IOException;
import java.nio.ByteBuffer;
/* loaded from: classes.dex */
public class ByteBufferRewinder implements DataRewinder<ByteBuffer> {
    public final ByteBuffer buffer;

    /* loaded from: classes.dex */
    public static class Factory implements DataRewinder.Factory<ByteBuffer> {
        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public DataRewinder<ByteBuffer> build(ByteBuffer data) {
            return new ByteBufferRewinder(data);
        }

        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public Class<ByteBuffer> getDataClass() {
            return ByteBuffer.class;
        }
    }

    public ByteBufferRewinder(ByteBuffer buffer) {
        this.buffer = buffer;
    }

    @Override // com.bumptech.glide.load.data.DataRewinder
    public void cleanup() {
    }

    @Override // com.bumptech.glide.load.data.DataRewinder
    public ByteBuffer rewindAndGet() throws IOException {
        this.buffer.position(0);
        return this.buffer;
    }
}
