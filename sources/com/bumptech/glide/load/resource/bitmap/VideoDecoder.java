package com.bumptech.glide.load.resource.bitmap;

import android.content.res.AssetFileDescriptor;
import android.graphics.Bitmap;
import android.media.MediaDataSource;
import android.media.MediaMetadataRetriever;
import android.os.ParcelFileDescriptor;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class VideoDecoder<T> implements ResourceDecoder<T, Bitmap> {
    public static final int DEFAULT_FRAME_OPTION = 2;
    public final BitmapPool bitmapPool;
    public final MediaMetadataRetrieverFactory factory;
    public final MediaMetadataRetrieverInitializer<T> initializer;
    public static final Option<Long> TARGET_FRAME = new Option<>("com.bumptech.glide.load.resource.bitmap.VideoBitmapDecode.TargetFrame", -1L, new Option.CacheKeyUpdater<Long>() { // from class: com.bumptech.glide.load.resource.bitmap.VideoDecoder.1
        public final ByteBuffer buffer = ByteBuffer.allocate(8);

        @Override // com.bumptech.glide.load.Option.CacheKeyUpdater
        public final void update(byte[] bArr, Long l, MessageDigest messageDigest) {
            Long l2 = l;
            messageDigest.update(bArr);
            synchronized (this.buffer) {
                this.buffer.position(0);
                messageDigest.update(this.buffer.putLong(l2.longValue()).array());
            }
        }
    });
    public static final Option<Integer> FRAME_OPTION = new Option<>("com.bumptech.glide.load.resource.bitmap.VideoBitmapDecode.FrameOption", 2, new Option.CacheKeyUpdater<Integer>() { // from class: com.bumptech.glide.load.resource.bitmap.VideoDecoder.2
        public final ByteBuffer buffer = ByteBuffer.allocate(4);

        @Override // com.bumptech.glide.load.Option.CacheKeyUpdater
        public final void update(byte[] bArr, Integer num, MessageDigest messageDigest) {
            Integer num2 = num;
            if (num2 != null) {
                messageDigest.update(bArr);
                synchronized (this.buffer) {
                    this.buffer.position(0);
                    messageDigest.update(this.buffer.putInt(num2.intValue()).array());
                }
            }
        }
    });
    public static final MediaMetadataRetrieverFactory DEFAULT_FACTORY = new MediaMetadataRetrieverFactory();

    /* loaded from: classes.dex */
    public static final class AssetFileDescriptorInitializer implements MediaMetadataRetrieverInitializer<AssetFileDescriptor> {
        @Override // com.bumptech.glide.load.resource.bitmap.VideoDecoder.MediaMetadataRetrieverInitializer
        public final void initialize(MediaMetadataRetriever mediaMetadataRetriever, AssetFileDescriptor assetFileDescriptor) {
            AssetFileDescriptor assetFileDescriptor2 = assetFileDescriptor;
            mediaMetadataRetriever.setDataSource(assetFileDescriptor2.getFileDescriptor(), assetFileDescriptor2.getStartOffset(), assetFileDescriptor2.getLength());
        }
    }

    /* loaded from: classes.dex */
    public static final class ByteBufferInitializer implements MediaMetadataRetrieverInitializer<ByteBuffer> {
        @Override // com.bumptech.glide.load.resource.bitmap.VideoDecoder.MediaMetadataRetrieverInitializer
        public final void initialize(MediaMetadataRetriever mediaMetadataRetriever, ByteBuffer byteBuffer) {
            final ByteBuffer byteBuffer2 = byteBuffer;
            mediaMetadataRetriever.setDataSource(new MediaDataSource() { // from class: com.bumptech.glide.load.resource.bitmap.VideoDecoder.ByteBufferInitializer.1
                @Override // java.io.Closeable, java.lang.AutoCloseable
                public final void close() {
                }

                @Override // android.media.MediaDataSource
                public final long getSize() {
                    return byteBuffer2.limit();
                }

                @Override // android.media.MediaDataSource
                public final int readAt(long j, byte[] bArr, int i, int i2) {
                    if (j >= byteBuffer2.limit()) {
                        return -1;
                    }
                    byteBuffer2.position((int) j);
                    int min = Math.min(i2, byteBuffer2.remaining());
                    byteBuffer2.get(bArr, i, min);
                    return min;
                }
            });
        }
    }

    /* loaded from: classes.dex */
    public static class MediaMetadataRetrieverFactory {
    }

    /* loaded from: classes.dex */
    public interface MediaMetadataRetrieverInitializer<T> {
        void initialize(MediaMetadataRetriever mediaMetadataRetriever, T t);
    }

    /* loaded from: classes.dex */
    public static final class ParcelFileDescriptorInitializer implements MediaMetadataRetrieverInitializer<ParcelFileDescriptor> {
        @Override // com.bumptech.glide.load.resource.bitmap.VideoDecoder.MediaMetadataRetrieverInitializer
        public final void initialize(MediaMetadataRetriever mediaMetadataRetriever, ParcelFileDescriptor parcelFileDescriptor) {
            mediaMetadataRetriever.setDataSource(parcelFileDescriptor.getFileDescriptor());
        }
    }

    /* loaded from: classes.dex */
    public static final class VideoDecoderException extends RuntimeException {
        private static final long serialVersionUID = -2556382523004027815L;

        public VideoDecoderException() {
            super("MediaMetadataRetriever failed to retrieve a frame without throwing, check the adb logs for .*MetadataRetriever.* prior to this exception for details");
        }
    }

    public VideoDecoder(BitmapPool bitmapPool, MediaMetadataRetrieverInitializer<T> mediaMetadataRetrieverInitializer) {
        this(bitmapPool, mediaMetadataRetrieverInitializer, DEFAULT_FACTORY);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final boolean handles(T t, Options options) {
        return true;
    }

    public VideoDecoder(BitmapPool bitmapPool, MediaMetadataRetrieverInitializer<T> mediaMetadataRetrieverInitializer, MediaMetadataRetrieverFactory mediaMetadataRetrieverFactory) {
        this.bitmapPool = bitmapPool;
        this.initializer = mediaMetadataRetrieverInitializer;
        this.factory = mediaMetadataRetrieverFactory;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0063 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static android.graphics.Bitmap decodeFrame(android.media.MediaMetadataRetriever r9, long r10, int r12, int r13, int r14, com.bumptech.glide.load.resource.bitmap.DownsampleStrategy r15) {
        /*
            r0 = -2147483648(0xffffffff80000000, float:-0.0)
            if (r13 == r0) goto L5a
            if (r14 == r0) goto L5a
            com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$None r0 = com.bumptech.glide.load.resource.bitmap.DownsampleStrategy.NONE
            if (r15 == r0) goto L5a
            r0 = 18
            java.lang.String r0 = r9.extractMetadata(r0)     // Catch: java.lang.Throwable -> L4b
            int r0 = java.lang.Integer.parseInt(r0)     // Catch: java.lang.Throwable -> L4b
            r1 = 19
            java.lang.String r1 = r9.extractMetadata(r1)     // Catch: java.lang.Throwable -> L4b
            int r1 = java.lang.Integer.parseInt(r1)     // Catch: java.lang.Throwable -> L4b
            r2 = 24
            java.lang.String r2 = r9.extractMetadata(r2)     // Catch: java.lang.Throwable -> L4b
            int r2 = java.lang.Integer.parseInt(r2)     // Catch: java.lang.Throwable -> L4b
            r3 = 90
            if (r2 == r3) goto L30
            r3 = 270(0x10e, float:3.78E-43)
            if (r2 != r3) goto L33
        L30:
            r8 = r1
            r1 = r0
            r0 = r8
        L33:
            float r13 = r15.getScaleFactor(r0, r1, r13, r14)     // Catch: java.lang.Throwable -> L4b
            float r14 = (float) r0     // Catch: java.lang.Throwable -> L4b
            float r14 = r14 * r13
            int r6 = java.lang.Math.round(r14)     // Catch: java.lang.Throwable -> L4b
            float r14 = (float) r1     // Catch: java.lang.Throwable -> L4b
            float r13 = r13 * r14
            int r7 = java.lang.Math.round(r13)     // Catch: java.lang.Throwable -> L4b
            r2 = r9
            r3 = r10
            r5 = r12
            android.graphics.Bitmap r13 = r2.getScaledFrameAtTime(r3, r5, r6, r7)     // Catch: java.lang.Throwable -> L4b
            goto L5b
        L4b:
            r13 = move-exception
            r14 = 3
            java.lang.String r15 = "VideoDecoder"
            boolean r14 = android.util.Log.isLoggable(r15, r14)
            if (r14 == 0) goto L5a
            java.lang.String r14 = "Exception trying to decode a scaled frame on oreo+, falling back to a fullsize frame"
            android.util.Log.d(r15, r14, r13)
        L5a:
            r13 = 0
        L5b:
            if (r13 != 0) goto L61
            android.graphics.Bitmap r13 = r9.getFrameAtTime(r10, r12)
        L61:
            if (r13 == 0) goto L64
            return r13
        L64:
            com.bumptech.glide.load.resource.bitmap.VideoDecoder$VideoDecoderException r9 = new com.bumptech.glide.load.resource.bitmap.VideoDecoder$VideoDecoderException
            r9.<init>()
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.resource.bitmap.VideoDecoder.decodeFrame(android.media.MediaMetadataRetriever, long, int, int, int, com.bumptech.glide.load.resource.bitmap.DownsampleStrategy):android.graphics.Bitmap");
    }

    /* JADX WARN: Finally extract failed */
    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<Bitmap> decode(T t, int i, int i2, Options options) throws IOException {
        long longValue = ((Long) options.get(TARGET_FRAME)).longValue();
        if (longValue >= 0 || longValue == -1) {
            Integer num = (Integer) options.get(FRAME_OPTION);
            if (num == null) {
                num = 2;
            }
            DownsampleStrategy downsampleStrategy = (DownsampleStrategy) options.get(DownsampleStrategy.OPTION);
            if (downsampleStrategy == null) {
                downsampleStrategy = DownsampleStrategy.DEFAULT;
            }
            DownsampleStrategy downsampleStrategy2 = downsampleStrategy;
            this.factory.getClass();
            MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
            try {
                this.initializer.initialize(mediaMetadataRetriever, t);
                Bitmap decodeFrame = decodeFrame(mediaMetadataRetriever, longValue, num.intValue(), i, i2, downsampleStrategy2);
                mediaMetadataRetriever.release();
                return BitmapResource.obtain(decodeFrame, this.bitmapPool);
            } catch (Throwable th) {
                mediaMetadataRetriever.release();
                throw th;
            }
        } else {
            throw new IllegalArgumentException("Requested frame must be non-negative, or DEFAULT_FRAME, given: " + longValue);
        }
    }
}
