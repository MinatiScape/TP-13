package com.bumptech.glide.load.resource.gif;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.SystemClock;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import com.bumptech.glide.Glide;
import com.bumptech.glide.gifdecoder.GifHeader;
import com.bumptech.glide.gifdecoder.GifHeaderParser;
import com.bumptech.glide.gifdecoder.StandardGifDecoder;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.UnitTransformation;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.util.LogTime;
import com.bumptech.glide.util.Util;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public final class ByteBufferGifDecoder implements ResourceDecoder<ByteBuffer, GifDrawable> {
    public static final GifDecoderFactory GIF_DECODER_FACTORY = new GifDecoderFactory();
    public static final GifHeaderParserPool PARSER_POOL = new GifHeaderParserPool();
    public final Context context;
    public final GifDecoderFactory gifDecoderFactory;
    public final GifHeaderParserPool parserPool;
    public final List<ImageHeaderParser> parsers;
    public final GifBitmapProvider provider;

    /* loaded from: classes.dex */
    public static class GifDecoderFactory {
    }

    public ByteBufferGifDecoder() {
        throw null;
    }

    public ByteBufferGifDecoder(Context context, List<ImageHeaderParser> list, BitmapPool bitmapPool, ArrayPool arrayPool, GifHeaderParserPool gifHeaderParserPool, GifDecoderFactory gifDecoderFactory) {
        this.context = context.getApplicationContext();
        this.parsers = list;
        this.gifDecoderFactory = gifDecoderFactory;
        this.provider = new GifBitmapProvider(bitmapPool, arrayPool);
        this.parserPool = gifHeaderParserPool;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<GifDrawable> decode(ByteBuffer byteBuffer, int i, int i2, Options options) throws IOException {
        GifHeaderParser gifHeaderParser;
        ByteBuffer byteBuffer2 = byteBuffer;
        GifHeaderParserPool gifHeaderParserPool = this.parserPool;
        synchronized (gifHeaderParserPool) {
            GifHeaderParser gifHeaderParser2 = (GifHeaderParser) gifHeaderParserPool.pool.poll();
            if (gifHeaderParser2 == null) {
                gifHeaderParser2 = new GifHeaderParser();
            }
            gifHeaderParser = gifHeaderParser2;
            gifHeaderParser.rawData = null;
            Arrays.fill(gifHeaderParser.block, (byte) 0);
            gifHeaderParser.header = new GifHeader();
            gifHeaderParser.blockSize = 0;
            ByteBuffer asReadOnlyBuffer = byteBuffer2.asReadOnlyBuffer();
            gifHeaderParser.rawData = asReadOnlyBuffer;
            asReadOnlyBuffer.position(0);
            gifHeaderParser.rawData.order(ByteOrder.LITTLE_ENDIAN);
        }
        try {
            GifDrawableResource decode = decode(byteBuffer2, i, i2, gifHeaderParser, options);
            GifHeaderParserPool gifHeaderParserPool2 = this.parserPool;
            synchronized (gifHeaderParserPool2) {
                gifHeaderParser.rawData = null;
                gifHeaderParser.header = null;
                gifHeaderParserPool2.pool.offer(gifHeaderParser);
            }
            return decode;
        } catch (Throwable th) {
            GifHeaderParserPool gifHeaderParserPool3 = this.parserPool;
            synchronized (gifHeaderParserPool3) {
                gifHeaderParser.rawData = null;
                gifHeaderParser.header = null;
                gifHeaderParserPool3.pool.offer(gifHeaderParser);
                throw th;
            }
        }
    }

    /* loaded from: classes.dex */
    public static class GifHeaderParserPool {
        public final ArrayDeque pool = new ArrayDeque(0);

        public GifHeaderParserPool() {
            char[] cArr = Util.HEX_CHAR_ARRAY;
        }
    }

    public static int getSampleSize(GifHeader gifHeader, int i, int i2) {
        int i3;
        int min = Math.min(gifHeader.height / i2, gifHeader.width / i);
        if (min == 0) {
            i3 = 0;
        } else {
            i3 = Integer.highestOneBit(min);
        }
        int max = Math.max(1, i3);
        if (Log.isLoggable("BufferGifDecoder", 2) && max > 1) {
            Log.v("BufferGifDecoder", "Downsampling GIF, sampleSize: " + max + ", target dimens: [" + i + "x" + i2 + "], actual dimens: [" + gifHeader.width + "x" + gifHeader.height + "]");
        }
        return max;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final boolean handles(ByteBuffer byteBuffer, Options options) throws IOException {
        ImageHeaderParser.ImageType imageType;
        ByteBuffer byteBuffer2 = byteBuffer;
        if (((Boolean) options.get(GifOptions.DISABLE_ANIMATION)).booleanValue()) {
            return false;
        }
        List<ImageHeaderParser> list = this.parsers;
        if (byteBuffer2 == null) {
            imageType = ImageHeaderParser.ImageType.UNKNOWN;
        } else {
            int size = list.size();
            int i = 0;
            while (true) {
                if (i >= size) {
                    imageType = ImageHeaderParser.ImageType.UNKNOWN;
                    break;
                }
                ImageHeaderParser.ImageType type = list.get(i).getType(byteBuffer2);
                if (type != ImageHeaderParser.ImageType.UNKNOWN) {
                    imageType = type;
                    break;
                }
                i++;
            }
        }
        if (imageType == ImageHeaderParser.ImageType.GIF) {
            return true;
        }
        return false;
    }

    public final GifDrawableResource decode(ByteBuffer byteBuffer, int i, int i2, GifHeaderParser gifHeaderParser, Options options) {
        Bitmap.Config config;
        int i3 = LogTime.$r8$clinit;
        long elapsedRealtimeNanos = SystemClock.elapsedRealtimeNanos();
        try {
            GifHeader parseHeader = gifHeaderParser.parseHeader();
            if (parseHeader.frameCount > 0 && parseHeader.status == 0) {
                if (options.get(GifOptions.DECODE_FORMAT) == DecodeFormat.PREFER_RGB_565) {
                    config = Bitmap.Config.RGB_565;
                } else {
                    config = Bitmap.Config.ARGB_8888;
                }
                int sampleSize = getSampleSize(parseHeader, i, i2);
                GifDecoderFactory gifDecoderFactory = this.gifDecoderFactory;
                GifBitmapProvider gifBitmapProvider = this.provider;
                gifDecoderFactory.getClass();
                StandardGifDecoder standardGifDecoder = new StandardGifDecoder(gifBitmapProvider, parseHeader, byteBuffer, sampleSize);
                standardGifDecoder.setDefaultBitmapConfig(config);
                standardGifDecoder.advance();
                Bitmap nextFrame = standardGifDecoder.getNextFrame();
                if (nextFrame == null) {
                    return null;
                }
                GifDrawableResource gifDrawableResource = new GifDrawableResource(new GifDrawable(new GifDrawable.GifState(new GifFrameLoader(Glide.get(this.context), standardGifDecoder, i, i2, UnitTransformation.TRANSFORMATION, nextFrame))));
                if (Log.isLoggable("BufferGifDecoder", 2)) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Decoded GIF from stream in ");
                    m.append(LogTime.getElapsedMillis(elapsedRealtimeNanos));
                    Log.v("BufferGifDecoder", m.toString());
                }
                return gifDrawableResource;
            }
            if (Log.isLoggable("BufferGifDecoder", 2)) {
                StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Decoded GIF from stream in ");
                m2.append(LogTime.getElapsedMillis(elapsedRealtimeNanos));
                Log.v("BufferGifDecoder", m2.toString());
            }
            return null;
        } finally {
            if (Log.isLoggable("BufferGifDecoder", 2)) {
                StringBuilder m3 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Decoded GIF from stream in ");
                m3.append(LogTime.getElapsedMillis(elapsedRealtimeNanos));
                Log.v("BufferGifDecoder", m3.toString());
            }
        }
    }
}
