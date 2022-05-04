package com.bumptech.glide.load.data;

import com.bumptech.glide.load.data.DataRewinder;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class InputStreamRewinder implements DataRewinder<InputStream> {
    public final RecyclableBufferedInputStream bufferedStream;

    /* loaded from: classes.dex */
    public static final class Factory implements DataRewinder.Factory<InputStream> {
        public final ArrayPool byteArrayPool;

        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public final DataRewinder<InputStream> build(InputStream inputStream) {
            return new InputStreamRewinder(inputStream, this.byteArrayPool);
        }

        public Factory(ArrayPool arrayPool) {
            this.byteArrayPool = arrayPool;
        }

        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public final Class<InputStream> getDataClass() {
            return InputStream.class;
        }
    }

    @Override // com.bumptech.glide.load.data.DataRewinder
    public final void cleanup() {
        this.bufferedStream.release();
    }

    @Override // com.bumptech.glide.load.data.DataRewinder
    public final InputStream rewindAndGet() throws IOException {
        this.bufferedStream.reset();
        return this.bufferedStream;
    }

    public InputStreamRewinder(InputStream inputStream, ArrayPool arrayPool) {
        RecyclableBufferedInputStream recyclableBufferedInputStream = new RecyclableBufferedInputStream(inputStream, arrayPool);
        this.bufferedStream = recyclableBufferedInputStream;
        recyclableBufferedInputStream.mark(5242880);
    }
}
