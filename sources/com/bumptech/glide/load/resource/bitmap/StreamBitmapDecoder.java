package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.Downsampler;
import com.bumptech.glide.load.resource.bitmap.ImageReader;
import com.bumptech.glide.util.ExceptionPassthroughInputStream;
import com.bumptech.glide.util.MarkEnforcingInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayDeque;
/* loaded from: classes.dex */
public final class StreamBitmapDecoder implements ResourceDecoder<InputStream, Bitmap> {
    public final ArrayPool byteArrayPool;
    public final Downsampler downsampler;

    /* loaded from: classes.dex */
    public static class UntrustedCallbacks implements Downsampler.DecodeCallbacks {
        public final RecyclableBufferedInputStream bufferedStream;
        public final ExceptionPassthroughInputStream exceptionStream;

        @Override // com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeCallbacks
        public final void onDecodeComplete(BitmapPool bitmapPool, Bitmap bitmap) throws IOException {
            IOException iOException = this.exceptionStream.exception;
            if (iOException != null) {
                if (bitmap != null) {
                    bitmapPool.put(bitmap);
                }
                throw iOException;
            }
        }

        @Override // com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeCallbacks
        public final void onObtainBounds() {
            RecyclableBufferedInputStream recyclableBufferedInputStream = this.bufferedStream;
            synchronized (recyclableBufferedInputStream) {
                recyclableBufferedInputStream.marklimit = recyclableBufferedInputStream.buf.length;
            }
        }

        public UntrustedCallbacks(RecyclableBufferedInputStream recyclableBufferedInputStream, ExceptionPassthroughInputStream exceptionPassthroughInputStream) {
            this.bufferedStream = recyclableBufferedInputStream;
            this.exceptionStream = exceptionPassthroughInputStream;
        }
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<Bitmap> decode(InputStream inputStream, int i, int i2, Options options) throws IOException {
        boolean z;
        RecyclableBufferedInputStream recyclableBufferedInputStream;
        ExceptionPassthroughInputStream exceptionPassthroughInputStream;
        InputStream inputStream2 = inputStream;
        if (inputStream2 instanceof RecyclableBufferedInputStream) {
            recyclableBufferedInputStream = (RecyclableBufferedInputStream) inputStream2;
            z = false;
        } else {
            z = true;
            recyclableBufferedInputStream = new RecyclableBufferedInputStream(inputStream2, this.byteArrayPool);
        }
        ArrayDeque arrayDeque = ExceptionPassthroughInputStream.POOL;
        synchronized (arrayDeque) {
            exceptionPassthroughInputStream = (ExceptionPassthroughInputStream) arrayDeque.poll();
        }
        if (exceptionPassthroughInputStream == null) {
            exceptionPassthroughInputStream = new ExceptionPassthroughInputStream();
        }
        exceptionPassthroughInputStream.wrapped = recyclableBufferedInputStream;
        MarkEnforcingInputStream markEnforcingInputStream = new MarkEnforcingInputStream(exceptionPassthroughInputStream);
        UntrustedCallbacks untrustedCallbacks = new UntrustedCallbacks(recyclableBufferedInputStream, exceptionPassthroughInputStream);
        try {
            Downsampler downsampler = this.downsampler;
            BitmapResource decode = downsampler.decode(new ImageReader.InputStreamImageReader(markEnforcingInputStream, downsampler.parsers, downsampler.byteArrayPool), i, i2, options, untrustedCallbacks);
            exceptionPassthroughInputStream.exception = null;
            exceptionPassthroughInputStream.wrapped = null;
            synchronized (arrayDeque) {
                arrayDeque.offer(exceptionPassthroughInputStream);
            }
            if (z) {
                recyclableBufferedInputStream.release();
            }
            return decode;
        } catch (Throwable th) {
            exceptionPassthroughInputStream.exception = null;
            exceptionPassthroughInputStream.wrapped = null;
            ArrayDeque arrayDeque2 = ExceptionPassthroughInputStream.POOL;
            synchronized (arrayDeque2) {
                arrayDeque2.offer(exceptionPassthroughInputStream);
                if (z) {
                    recyclableBufferedInputStream.release();
                }
                throw th;
            }
        }
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final boolean handles(InputStream inputStream, Options options) throws IOException {
        this.downsampler.getClass();
        return true;
    }

    public StreamBitmapDecoder(Downsampler downsampler, ArrayPool arrayPool) {
        this.downsampler = downsampler;
        this.byteArrayPool = arrayPool;
    }
}
