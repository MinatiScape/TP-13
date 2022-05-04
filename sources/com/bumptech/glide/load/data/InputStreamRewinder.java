package com.bumptech.glide.load.data;

import com.android.systemui.shared.system.QuickStepContract;
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

        public Factory(ArrayPool byteArrayPool) {
            this.byteArrayPool = byteArrayPool;
        }

        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public DataRewinder<InputStream> build(InputStream data) {
            return new InputStreamRewinder(data, this.byteArrayPool);
        }

        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public Class<InputStream> getDataClass() {
            return InputStream.class;
        }
    }

    public InputStreamRewinder(InputStream is, ArrayPool byteArrayPool) {
        RecyclableBufferedInputStream recyclableBufferedInputStream = new RecyclableBufferedInputStream(is, byteArrayPool, QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE);
        this.bufferedStream = recyclableBufferedInputStream;
        recyclableBufferedInputStream.mark(5242880);
    }

    @Override // com.bumptech.glide.load.data.DataRewinder
    public void cleanup() {
        this.bufferedStream.release();
    }

    @Override // com.bumptech.glide.load.data.DataRewinder
    public InputStream rewindAndGet() throws IOException {
        this.bufferedStream.reset();
        return this.bufferedStream;
    }
}
