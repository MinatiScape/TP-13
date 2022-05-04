package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import com.android.systemui.shared.system.QuickStepContract;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.Downsampler;
import com.bumptech.glide.util.ExceptionCatchingInputStream;
import com.bumptech.glide.util.MarkEnforcingInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayDeque;
import java.util.Objects;
import java.util.Queue;
/* loaded from: classes.dex */
public class StreamBitmapDecoder implements ResourceDecoder<InputStream, Bitmap> {
    public final ArrayPool byteArrayPool;
    public final Downsampler downsampler;

    /* loaded from: classes.dex */
    public static class UntrustedCallbacks implements Downsampler.DecodeCallbacks {
        public final RecyclableBufferedInputStream bufferedStream;
        public final ExceptionCatchingInputStream exceptionStream;

        public UntrustedCallbacks(RecyclableBufferedInputStream bufferedStream, ExceptionCatchingInputStream exceptionStream) {
            this.bufferedStream = bufferedStream;
            this.exceptionStream = exceptionStream;
        }

        @Override // com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeCallbacks
        public void onDecodeComplete(BitmapPool bitmapPool, Bitmap downsampled) throws IOException {
            IOException iOException = this.exceptionStream.exception;
            if (iOException != null) {
                if (downsampled != null) {
                    bitmapPool.put(downsampled);
                }
                throw iOException;
            }
        }

        @Override // com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeCallbacks
        public void onObtainBounds() {
            RecyclableBufferedInputStream recyclableBufferedInputStream = this.bufferedStream;
            synchronized (recyclableBufferedInputStream) {
                recyclableBufferedInputStream.marklimit = recyclableBufferedInputStream.buf.length;
            }
        }
    }

    public StreamBitmapDecoder(Downsampler downsampler, ArrayPool byteArrayPool) {
        this.downsampler = downsampler;
        this.byteArrayPool = byteArrayPool;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public Resource<Bitmap> decode(InputStream source, int width, int height, Options options) throws IOException {
        RecyclableBufferedInputStream recyclableBufferedInputStream;
        boolean z;
        ExceptionCatchingInputStream exceptionCatchingInputStream;
        InputStream inputStream = source;
        if (inputStream instanceof RecyclableBufferedInputStream) {
            recyclableBufferedInputStream = (RecyclableBufferedInputStream) inputStream;
            z = false;
        } else {
            z = true;
            recyclableBufferedInputStream = new RecyclableBufferedInputStream(inputStream, this.byteArrayPool, QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE);
        }
        Queue<ExceptionCatchingInputStream> queue = ExceptionCatchingInputStream.QUEUE;
        synchronized (queue) {
            exceptionCatchingInputStream = (ExceptionCatchingInputStream) ((ArrayDeque) queue).poll();
        }
        if (exceptionCatchingInputStream == null) {
            exceptionCatchingInputStream = new ExceptionCatchingInputStream();
        }
        exceptionCatchingInputStream.wrapped = recyclableBufferedInputStream;
        try {
            return this.downsampler.decode(new MarkEnforcingInputStream(exceptionCatchingInputStream), width, height, options, new UntrustedCallbacks(recyclableBufferedInputStream, exceptionCatchingInputStream));
        } finally {
            exceptionCatchingInputStream.release();
            if (z) {
                recyclableBufferedInputStream.release();
            }
        }
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public boolean handles(InputStream source, Options options) throws IOException {
        Objects.requireNonNull(this.downsampler);
        return true;
    }
}
