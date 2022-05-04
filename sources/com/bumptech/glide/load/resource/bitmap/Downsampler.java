package com.bumptech.glide.load.resource.bitmap;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.DisplayMetrics;
import android.util.Log;
import androidx.collection.ContainerHelpers;
import com.android.systemui.shared.system.QuickStepContract;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.PreferredColorSpace;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.DownsampleStrategy;
import com.bumptech.glide.util.Util;
import java.io.IOException;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.locks.Lock;
/* loaded from: classes.dex */
public final class Downsampler {
    public static final Option<Boolean> ALLOW_HARDWARE_CONFIG;
    public static final Option<Boolean> FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS;
    public final BitmapPool bitmapPool;
    public final ArrayPool byteArrayPool;
    public final DisplayMetrics displayMetrics;
    public final HardwareConfigState hardwareConfigState = HardwareConfigState.getInstance();
    public final List<ImageHeaderParser> parsers;
    public static final Option<DecodeFormat> DECODE_FORMAT = Option.memory("com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeFormat", DecodeFormat.PREFER_ARGB_8888);
    public static final Option<PreferredColorSpace> PREFERRED_COLOR_SPACE = Option.memory("com.bumptech.glide.load.resource.bitmap.Downsampler.PreferredColorSpace", PreferredColorSpace.SRGB);
    public static final AnonymousClass1 EMPTY_CALLBACKS = new DecodeCallbacks() { // from class: com.bumptech.glide.load.resource.bitmap.Downsampler.1
        @Override // com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeCallbacks
        public final void onDecodeComplete(BitmapPool bitmapPool, Bitmap bitmap) {
        }

        @Override // com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeCallbacks
        public final void onObtainBounds() {
        }
    };
    public static final ArrayDeque OPTIONS_QUEUE = new ArrayDeque(0);

    /* loaded from: classes.dex */
    public interface DecodeCallbacks {
        void onDecodeComplete(BitmapPool bitmapPool, Bitmap bitmap) throws IOException;

        void onObtainBounds();
    }

    public static void resetOptions(BitmapFactory.Options options) {
        options.inTempStorage = null;
        options.inDither = false;
        options.inScaled = false;
        options.inSampleSize = 1;
        options.inPreferredConfig = null;
        options.inJustDecodeBounds = false;
        options.inDensity = 0;
        options.inTargetDensity = 0;
        options.inPreferredColorSpace = null;
        options.outColorSpace = null;
        options.outConfig = null;
        options.outWidth = 0;
        options.outHeight = 0;
        options.outMimeType = null;
        options.inBitmap = null;
        options.inMutable = true;
    }

    /* JADX WARN: Type inference failed for: r0v8, types: [com.bumptech.glide.load.resource.bitmap.Downsampler$1] */
    static {
        DownsampleStrategy.FitCenter fitCenter = DownsampleStrategy.FIT_CENTER;
        Boolean bool = Boolean.FALSE;
        FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS = Option.memory("com.bumptech.glide.load.resource.bitmap.Downsampler.FixBitmapSize", bool);
        ALLOW_HARDWARE_CONFIG = Option.memory("com.bumptech.glide.load.resource.bitmap.Downsampler.AllowHardwareDecode", bool);
        Collections.unmodifiableSet(new HashSet(Arrays.asList("image/vnd.wap.wbmp", "image/x-ico")));
        Collections.unmodifiableSet(EnumSet.of(ImageHeaderParser.ImageType.JPEG, ImageHeaderParser.ImageType.PNG_A, ImageHeaderParser.ImageType.PNG));
        char[] cArr = Util.HEX_CHAR_ARRAY;
    }

    public static Bitmap decodeStream(ImageReader imageReader, BitmapFactory.Options options, DecodeCallbacks decodeCallbacks, BitmapPool bitmapPool) throws IOException {
        if (!options.inJustDecodeBounds) {
            decodeCallbacks.onObtainBounds();
            imageReader.stopGrowingBuffers();
        }
        int i = options.outWidth;
        int i2 = options.outHeight;
        String str = options.outMimeType;
        Lock lock = TransformationUtils.BITMAP_DRAWABLE_LOCK;
        lock.lock();
        try {
            try {
                Bitmap decodeBitmap = imageReader.decodeBitmap(options);
                lock.unlock();
                return decodeBitmap;
            } catch (IllegalArgumentException e) {
                IOException newIoExceptionForInBitmapAssertion = newIoExceptionForInBitmapAssertion(e, i, i2, str, options);
                if (Log.isLoggable("Downsampler", 3)) {
                    Log.d("Downsampler", "Failed to decode with inBitmap, trying again without Bitmap re-use", newIoExceptionForInBitmapAssertion);
                }
                Bitmap bitmap = options.inBitmap;
                if (bitmap != null) {
                    try {
                        bitmapPool.put(bitmap);
                        options.inBitmap = null;
                        Bitmap decodeStream = decodeStream(imageReader, options, decodeCallbacks, bitmapPool);
                        TransformationUtils.BITMAP_DRAWABLE_LOCK.unlock();
                        return decodeStream;
                    } catch (IOException unused) {
                        throw newIoExceptionForInBitmapAssertion;
                    }
                } else {
                    throw newIoExceptionForInBitmapAssertion;
                }
            }
        } catch (Throwable th) {
            TransformationUtils.BITMAP_DRAWABLE_LOCK.unlock();
            throw th;
        }
    }

    @TargetApi(19)
    public static String getBitmapString(Bitmap bitmap) {
        if (bitmap == null) {
            return null;
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(" (");
        m.append(bitmap.getAllocationByteCount());
        m.append(")");
        String sb = m.toString();
        StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("[");
        m2.append(bitmap.getWidth());
        m2.append("x");
        m2.append(bitmap.getHeight());
        m2.append("] ");
        m2.append(bitmap.getConfig());
        m2.append(sb);
        return m2.toString();
    }

    public static IOException newIoExceptionForInBitmapAssertion(IllegalArgumentException illegalArgumentException, int i, int i2, String str, BitmapFactory.Options options) {
        return new IOException("Exception decoding bitmap, outWidth: " + i + ", outHeight: " + i2 + ", outMimeType: " + str + ", inBitmap: " + getBitmapString(options.inBitmap), illegalArgumentException);
    }

    public final BitmapResource decode(ImageReader imageReader, int i, int i2, Options options, DecodeCallbacks decodeCallbacks) throws IOException {
        ArrayDeque arrayDeque;
        BitmapFactory.Options options2;
        BitmapFactory.Options options3;
        boolean z;
        byte[] bArr = (byte[]) this.byteArrayPool.get(QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE, byte[].class);
        synchronized (Downsampler.class) {
            arrayDeque = OPTIONS_QUEUE;
            synchronized (arrayDeque) {
                options2 = (BitmapFactory.Options) arrayDeque.poll();
            }
            if (options2 == null) {
                options2 = new BitmapFactory.Options();
                resetOptions(options2);
            }
            options3 = options2;
        }
        options3.inTempStorage = bArr;
        DecodeFormat decodeFormat = (DecodeFormat) options.get(DECODE_FORMAT);
        PreferredColorSpace preferredColorSpace = (PreferredColorSpace) options.get(PREFERRED_COLOR_SPACE);
        DownsampleStrategy downsampleStrategy = (DownsampleStrategy) options.get(DownsampleStrategy.OPTION);
        boolean booleanValue = ((Boolean) options.get(FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS)).booleanValue();
        Option<Boolean> option = ALLOW_HARDWARE_CONFIG;
        if (options.get(option) == null || !((Boolean) options.get(option)).booleanValue()) {
            z = false;
        } else {
            z = true;
        }
        try {
            BitmapResource obtain = BitmapResource.obtain(decodeFromWrappedStreams(imageReader, options3, downsampleStrategy, decodeFormat, preferredColorSpace, z, i, i2, booleanValue, decodeCallbacks), this.bitmapPool);
            resetOptions(options3);
            synchronized (arrayDeque) {
                arrayDeque.offer(options3);
            }
            this.byteArrayPool.put(bArr);
            return obtain;
        } catch (Throwable th) {
            resetOptions(options3);
            ArrayDeque arrayDeque2 = OPTIONS_QUEUE;
            synchronized (arrayDeque2) {
                arrayDeque2.offer(options3);
                this.byteArrayPool.put(bArr);
                throw th;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x01cc  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x01d0  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x01de  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0250  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x0351  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x037d  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x03d5  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x03f6  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x03f9  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x0415  */
    /* JADX WARN: Removed duplicated region for block: B:178:0x049a  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x018b  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x018e  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01b0  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x01b2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.graphics.Bitmap decodeFromWrappedStreams(com.bumptech.glide.load.resource.bitmap.ImageReader r37, android.graphics.BitmapFactory.Options r38, com.bumptech.glide.load.resource.bitmap.DownsampleStrategy r39, com.bumptech.glide.load.DecodeFormat r40, com.bumptech.glide.load.PreferredColorSpace r41, boolean r42, int r43, int r44, boolean r45, com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeCallbacks r46) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 1340
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.resource.bitmap.Downsampler.decodeFromWrappedStreams(com.bumptech.glide.load.resource.bitmap.ImageReader, android.graphics.BitmapFactory$Options, com.bumptech.glide.load.resource.bitmap.DownsampleStrategy, com.bumptech.glide.load.DecodeFormat, com.bumptech.glide.load.PreferredColorSpace, boolean, int, int, boolean, com.bumptech.glide.load.resource.bitmap.Downsampler$DecodeCallbacks):android.graphics.Bitmap");
    }

    public Downsampler(List<ImageHeaderParser> list, DisplayMetrics displayMetrics, BitmapPool bitmapPool, ArrayPool arrayPool) {
        this.parsers = list;
        ContainerHelpers.checkNotNull(displayMetrics);
        this.displayMetrics = displayMetrics;
        ContainerHelpers.checkNotNull(bitmapPool);
        this.bitmapPool = bitmapPool;
        ContainerHelpers.checkNotNull(arrayPool);
        this.byteArrayPool = arrayPool;
    }
}
