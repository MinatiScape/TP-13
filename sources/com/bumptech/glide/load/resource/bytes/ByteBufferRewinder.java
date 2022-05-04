package com.bumptech.glide.load.resource.bytes;

import com.bumptech.glide.load.data.DataRewinder;
import java.io.IOException;
import java.nio.ByteBuffer;
/* loaded from: classes.dex */
public final class ByteBufferRewinder implements DataRewinder<ByteBuffer> {
    public final ByteBuffer buffer;

    /* loaded from: classes.dex */
    public static class Factory implements DataRewinder.Factory<ByteBuffer> {
        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public final DataRewinder<ByteBuffer> build(ByteBuffer byteBuffer) {
            return new ByteBufferRewinder(byteBuffer);
        }

        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public final Class<ByteBuffer> getDataClass() {
            return ByteBuffer.class;
        }
    }

    @Override // com.bumptech.glide.load.data.DataRewinder
    public final void cleanup() {
    }

    @Override // com.bumptech.glide.load.data.DataRewinder
    public final ByteBuffer rewindAndGet() throws IOException {
        this.buffer.position(0);
        return this.buffer;
    }

    public ByteBufferRewinder(ByteBuffer byteBuffer) {
        this.buffer = byteBuffer;
    }
}
