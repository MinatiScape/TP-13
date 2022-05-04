package com.bumptech.glide.load.resource.bitmap;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.DisplayMetrics;
import android.util.Log;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import com.android.systemui.shared.system.QuickStepContract;
import com.bumptech.glide.gifdecoder.GifHeaderParser$$ExternalSyntheticOutline0;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.util.Preconditions;
import com.bumptech.glide.util.Util;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Queue;
import java.util.concurrent.locks.Lock;
/* loaded from: classes.dex */
public final class Downsampler {
    public static final Option<Boolean> ALLOW_HARDWARE_CONFIG;
    public static final Option<Boolean> FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS;
    public final BitmapPool bitmapPool;
    public final ArrayPool byteArrayPool;
    public final DisplayMetrics displayMetrics;
    public final HardwareConfigState hardwareConfigState;
    public final List<ImageHeaderParser> parsers;
    public static final Option<DecodeFormat> DECODE_FORMAT = Option.memory("com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeFormat", DecodeFormat.PREFER_ARGB_8888);
    public static final DecodeCallbacks EMPTY_CALLBACKS = new DecodeCallbacks() { // from class: com.bumptech.glide.load.resource.bitmap.Downsampler.1
        @Override // com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeCallbacks
        public void onDecodeComplete(BitmapPool bitmapPool, Bitmap downsampled) {
        }

        @Override // com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeCallbacks
        public void onObtainBounds() {
        }
    };
    public static final Queue<BitmapFactory.Options> OPTIONS_QUEUE = new ArrayDeque(0);

    /* loaded from: classes.dex */
    public interface DecodeCallbacks {
        void onDecodeComplete(BitmapPool bitmapPool, Bitmap downsampled) throws IOException;

        void onObtainBounds();
    }

    static {
        Option<DownsampleStrategy> option = DownsampleStrategy.OPTION;
        Boolean bool = Boolean.FALSE;
        FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS = Option.memory("com.bumptech.glide.load.resource.bitmap.Downsampler.FixBitmapSize", bool);
        ALLOW_HARDWARE_CONFIG = Option.memory("com.bumptech.glide.load.resource.bitmap.Downsampler.AllowHardwareDecode", bool);
        Collections.unmodifiableSet(new HashSet(Arrays.asList("image/vnd.wap.wbmp", "image/x-ico")));
        Collections.unmodifiableSet(EnumSet.of(ImageHeaderParser.ImageType.JPEG, ImageHeaderParser.ImageType.PNG_A, ImageHeaderParser.ImageType.PNG));
        char[] cArr = Util.HEX_CHAR_ARRAY;
    }

    public Downsampler(List<ImageHeaderParser> parsers, DisplayMetrics displayMetrics, BitmapPool bitmapPool, ArrayPool byteArrayPool) {
        if (HardwareConfigState.instance == null) {
            synchronized (HardwareConfigState.class) {
                if (HardwareConfigState.instance == null) {
                    HardwareConfigState.instance = new HardwareConfigState();
                }
            }
        }
        this.hardwareConfigState = HardwareConfigState.instance;
        this.parsers = parsers;
        Objects.requireNonNull(displayMetrics, "Argument must not be null");
        this.displayMetrics = displayMetrics;
        Objects.requireNonNull(bitmapPool, "Argument must not be null");
        this.bitmapPool = bitmapPool;
        Objects.requireNonNull(byteArrayPool, "Argument must not be null");
        this.byteArrayPool = byteArrayPool;
    }

    public static Bitmap decodeStream(InputStream is, BitmapFactory.Options options, DecodeCallbacks callbacks, BitmapPool bitmapPool) throws IOException {
        if (options.inJustDecodeBounds) {
            is.mark(10485760);
        } else {
            callbacks.onObtainBounds();
        }
        int i = options.outWidth;
        int i2 = options.outHeight;
        String str = options.outMimeType;
        Lock lock = TransformationUtils.BITMAP_DRAWABLE_LOCK;
        lock.lock();
        try {
            try {
                Bitmap decodeStream = BitmapFactory.decodeStream(is, null, options);
                lock.unlock();
                if (options.inJustDecodeBounds) {
                    is.reset();
                }
                return decodeStream;
            } catch (IllegalArgumentException e) {
                IOException newIoExceptionForInBitmapAssertion = newIoExceptionForInBitmapAssertion(e, i, i2, str, options);
                if (Log.isLoggable("Downsampler", 3)) {
                    Log.d("Downsampler", "Failed to decode with inBitmap, trying again without Bitmap re-use", newIoExceptionForInBitmapAssertion);
                }
                if (options.inBitmap != null) {
                    try {
                        is.reset();
                        bitmapPool.put(options.inBitmap);
                        options.inBitmap = null;
                        Bitmap decodeStream2 = decodeStream(is, options, callbacks, bitmapPool);
                        TransformationUtils.BITMAP_DRAWABLE_LOCK.unlock();
                        return decodeStream2;
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
        int allocationByteCount = bitmap.getAllocationByteCount();
        StringBuilder sb = new StringBuilder(14);
        sb.append(" (");
        sb.append(allocationByteCount);
        sb.append(")");
        String sb2 = sb.toString();
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        String valueOf = String.valueOf(bitmap.getConfig());
        StringBuilder m = GifHeaderParser$$ExternalSyntheticOutline0.m(XMPPathFactory$$ExternalSyntheticOutline0.m(sb2, valueOf.length() + 26), "[", width, "x", height);
        m.append("] ");
        m.append(valueOf);
        m.append(sb2);
        return m.toString();
    }

    public static int getDensityMultiplier(double adjustedScaleFactor) {
        if (adjustedScaleFactor > 1.0d) {
            adjustedScaleFactor = 1.0d / adjustedScaleFactor;
        }
        return (int) Math.round(adjustedScaleFactor * 2.147483647E9d);
    }

    public static int[] getDimensions(InputStream is, BitmapFactory.Options options, DecodeCallbacks decodeCallbacks, BitmapPool bitmapPool) throws IOException {
        options.inJustDecodeBounds = true;
        decodeStream(is, options, decodeCallbacks, bitmapPool);
        options.inJustDecodeBounds = false;
        return new int[]{options.outWidth, options.outHeight};
    }

    public static IOException newIoExceptionForInBitmapAssertion(IllegalArgumentException e, int outWidth, int outHeight, String outMimeType, BitmapFactory.Options options) {
        String bitmapString = getBitmapString(options.inBitmap);
        StringBuilder m = GifHeaderParser$$ExternalSyntheticOutline0.m(XMPPathFactory$$ExternalSyntheticOutline0.m(bitmapString, XMPPathFactory$$ExternalSyntheticOutline0.m(outMimeType, 99)), "Exception decoding bitmap, outWidth: ", outWidth, ", outHeight: ", outHeight);
        m.append(", outMimeType: ");
        m.append(outMimeType);
        m.append(", inBitmap: ");
        m.append(bitmapString);
        return new IOException(m.toString(), e);
    }

    public static void releaseOptions(BitmapFactory.Options decodeBitmapOptions) {
        resetOptions(decodeBitmapOptions);
        Queue<BitmapFactory.Options> queue = OPTIONS_QUEUE;
        synchronized (queue) {
            ((ArrayDeque) queue).offer(decodeBitmapOptions);
        }
    }

    public static void resetOptions(BitmapFactory.Options decodeBitmapOptions) {
        decodeBitmapOptions.inTempStorage = null;
        decodeBitmapOptions.inDither = false;
        decodeBitmapOptions.inScaled = false;
        decodeBitmapOptions.inSampleSize = 1;
        decodeBitmapOptions.inPreferredConfig = null;
        decodeBitmapOptions.inJustDecodeBounds = false;
        decodeBitmapOptions.inDensity = 0;
        decodeBitmapOptions.inTargetDensity = 0;
        decodeBitmapOptions.outWidth = 0;
        decodeBitmapOptions.outHeight = 0;
        decodeBitmapOptions.outMimeType = null;
        decodeBitmapOptions.inBitmap = null;
        decodeBitmapOptions.inMutable = true;
    }

    public static int round(double value) {
        return (int) (value + 0.5d);
    }

    public Resource<Bitmap> decode(InputStream is, int requestedWidth, int requestedHeight, Options options, DecodeCallbacks callbacks) throws IOException {
        BitmapFactory.Options options2;
        BitmapFactory.Options options3;
        Preconditions.checkArgument(is.markSupported(), "You must provide an InputStream that supports mark()");
        byte[] bArr = (byte[]) this.byteArrayPool.get(QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE, byte[].class);
        synchronized (Downsampler.class) {
            Queue<BitmapFactory.Options> queue = OPTIONS_QUEUE;
            synchronized (queue) {
                options2 = (BitmapFactory.Options) ((ArrayDeque) queue).poll();
            }
            if (options2 == null) {
                options2 = new BitmapFactory.Options();
                resetOptions(options2);
            }
            options3 = options2;
        }
        options3.inTempStorage = bArr;
        DecodeFormat decodeFormat = (DecodeFormat) options.get(DECODE_FORMAT);
        DownsampleStrategy downsampleStrategy = (DownsampleStrategy) options.get(DownsampleStrategy.OPTION);
        boolean booleanValue = ((Boolean) options.get(FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS)).booleanValue();
        Option<Boolean> option = ALLOW_HARDWARE_CONFIG;
        try {
            return BitmapResource.obtain(decodeFromWrappedStreams(is, options3, downsampleStrategy, decodeFormat, options.get(option) != null && ((Boolean) options.get(option)).booleanValue(), requestedWidth, requestedHeight, booleanValue, callbacks), this.bitmapPool);
        } finally {
            releaseOptions(options3);
            this.byteArrayPool.put(bArr);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:110:0x02d2  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x02da  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x0353  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0381  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x03cb  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x03db  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x03fd  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x04a0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.graphics.Bitmap decodeFromWrappedStreams(java.io.InputStream r27, android.graphics.BitmapFactory.Options r28, com.bumptech.glide.load.resource.bitmap.DownsampleStrategy r29, com.bumptech.glide.load.DecodeFormat r30, boolean r31, int r32, int r33, boolean r34, com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeCallbacks r35) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 1340
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.resource.bitmap.Downsampler.decodeFromWrappedStreams(java.io.InputStream, android.graphics.BitmapFactory$Options, com.bumptech.glide.load.resource.bitmap.DownsampleStrategy, com.bumptech.glide.load.DecodeFormat, boolean, int, int, boolean, com.bumptech.glide.load.resource.bitmap.Downsampler$DecodeCallbacks):android.graphics.Bitmap");
    }
}
