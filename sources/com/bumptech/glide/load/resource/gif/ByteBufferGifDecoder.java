package com.bumptech.glide.load.resource.gif;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.SystemClock;
import android.util.Log;
import com.android.systemui.shared.R;
import com.bumptech.glide.Glide;
import com.bumptech.glide.gifdecoder.GifHeader;
import com.bumptech.glide.gifdecoder.GifHeaderParser;
import com.bumptech.glide.gifdecoder.GifHeaderParser$$ExternalSyntheticOutline0;
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
import java.util.Objects;
import java.util.Queue;
/* loaded from: classes.dex */
public class ByteBufferGifDecoder implements ResourceDecoder<ByteBuffer, GifDrawable> {
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

    /* loaded from: classes.dex */
    public static class GifHeaderParserPool {
        public final Queue<GifHeaderParser> pool = new ArrayDeque(0);

        public GifHeaderParserPool() {
            char[] cArr = Util.HEX_CHAR_ARRAY;
        }

        public synchronized void release(GifHeaderParser parser) {
            parser.rawData = null;
            parser.header = null;
            this.pool.offer(parser);
        }
    }

    public ByteBufferGifDecoder(Context context, List<ImageHeaderParser> parsers, BitmapPool bitmapPool, ArrayPool arrayPool, GifHeaderParserPool parserPool, GifDecoderFactory gifDecoderFactory) {
        this.context = context.getApplicationContext();
        this.parsers = parsers;
        this.gifDecoderFactory = gifDecoderFactory;
        this.provider = new GifBitmapProvider(bitmapPool, arrayPool);
        this.parserPool = parserPool;
    }

    public static int getSampleSize(GifHeader gifHeader, int targetWidth, int targetHeight) {
        int min = Math.min(gifHeader.height / targetHeight, gifHeader.width / targetWidth);
        int max = Math.max(1, min == 0 ? 0 : Integer.highestOneBit(min));
        if (Log.isLoggable("BufferGifDecoder", 2) && max > 1) {
            int i = gifHeader.width;
            int i2 = gifHeader.height;
            StringBuilder m = GifHeaderParser$$ExternalSyntheticOutline0.m(R.styleable.AppCompatTheme_windowMinWidthMinor, "Downsampling GIF, sampleSize: ", max, ", target dimens: [", targetWidth);
            m.append("x");
            m.append(targetHeight);
            m.append("], actual dimens: [");
            m.append(i);
            m.append("x");
            m.append(i2);
            m.append("]");
            Log.v("BufferGifDecoder", m.toString());
        }
        return max;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public Resource<GifDrawable> decode(ByteBuffer source, int width, int height, Options options) throws IOException {
        GifHeaderParser gifHeaderParser;
        ByteBuffer byteBuffer = source;
        GifHeaderParserPool gifHeaderParserPool = this.parserPool;
        synchronized (gifHeaderParserPool) {
            GifHeaderParser poll = gifHeaderParserPool.pool.poll();
            if (poll == null) {
                poll = new GifHeaderParser();
            }
            gifHeaderParser = poll;
            gifHeaderParser.rawData = null;
            Arrays.fill(gifHeaderParser.block, (byte) 0);
            gifHeaderParser.header = new GifHeader();
            gifHeaderParser.blockSize = 0;
            ByteBuffer asReadOnlyBuffer = byteBuffer.asReadOnlyBuffer();
            gifHeaderParser.rawData = asReadOnlyBuffer;
            asReadOnlyBuffer.position(0);
            gifHeaderParser.rawData.order(ByteOrder.LITTLE_ENDIAN);
        }
        try {
            return decode(byteBuffer, width, height, gifHeaderParser, options);
        } finally {
            this.parserPool.release(gifHeaderParser);
        }
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public boolean handles(ByteBuffer source, Options options) throws IOException {
        ImageHeaderParser.ImageType imageType;
        ByteBuffer byteBuffer = source;
        if (((Boolean) options.get(GifOptions.DISABLE_ANIMATION)).booleanValue()) {
            return false;
        }
        List<ImageHeaderParser> list = this.parsers;
        if (byteBuffer == null) {
            imageType = ImageHeaderParser.ImageType.UNKNOWN;
        } else {
            int size = list.size();
            int i = 0;
            while (true) {
                if (i >= size) {
                    imageType = ImageHeaderParser.ImageType.UNKNOWN;
                    break;
                }
                ImageHeaderParser.ImageType type = list.get(i).getType(byteBuffer);
                if (type != ImageHeaderParser.ImageType.UNKNOWN) {
                    imageType = type;
                    break;
                }
                i++;
            }
        }
        return imageType == ImageHeaderParser.ImageType.GIF;
    }

    public final GifDrawableResource decode(ByteBuffer byteBuffer, int width, int height, GifHeaderParser parser, Options options) {
        int i = LogTime.$r8$clinit;
        long elapsedRealtimeNanos = SystemClock.elapsedRealtimeNanos();
        try {
            GifHeader parseHeader = parser.parseHeader();
            if (parseHeader.frameCount > 0 && parseHeader.status == 0) {
                Bitmap.Config config = options.get(GifOptions.DECODE_FORMAT) == DecodeFormat.PREFER_RGB_565 ? Bitmap.Config.RGB_565 : Bitmap.Config.ARGB_8888;
                int sampleSize = getSampleSize(parseHeader, width, height);
                GifDecoderFactory gifDecoderFactory = this.gifDecoderFactory;
                GifBitmapProvider gifBitmapProvider = this.provider;
                Objects.requireNonNull(gifDecoderFactory);
                StandardGifDecoder standardGifDecoder = new StandardGifDecoder(gifBitmapProvider, parseHeader, byteBuffer, sampleSize);
                standardGifDecoder.setDefaultBitmapConfig(config);
                standardGifDecoder.framePointer = (standardGifDecoder.framePointer + 1) % standardGifDecoder.header.frameCount;
                Bitmap nextFrame = standardGifDecoder.getNextFrame();
                if (nextFrame == null) {
                    return null;
                }
                GifDrawableResource gifDrawableResource = new GifDrawableResource(new GifDrawable(new GifDrawable.GifState(new GifFrameLoader(Glide.get(this.context), standardGifDecoder, width, height, (UnitTransformation) UnitTransformation.TRANSFORMATION, nextFrame))));
                if (Log.isLoggable("BufferGifDecoder", 2)) {
                    double elapsedMillis = LogTime.getElapsedMillis(elapsedRealtimeNanos);
                    StringBuilder sb = new StringBuilder(51);
                    sb.append("Decoded GIF from stream in ");
                    sb.append(elapsedMillis);
                    Log.v("BufferGifDecoder", sb.toString());
                }
                return gifDrawableResource;
            }
            if (Log.isLoggable("BufferGifDecoder", 2)) {
                double elapsedMillis2 = LogTime.getElapsedMillis(elapsedRealtimeNanos);
                StringBuilder sb2 = new StringBuilder(51);
                sb2.append("Decoded GIF from stream in ");
                sb2.append(elapsedMillis2);
                Log.v("BufferGifDecoder", sb2.toString());
            }
            return null;
        } finally {
            if (Log.isLoggable("BufferGifDecoder", 2)) {
                double elapsedMillis3 = LogTime.getElapsedMillis(elapsedRealtimeNanos);
                StringBuilder sb3 = new StringBuilder(51);
                sb3.append("Decoded GIF from stream in ");
                sb3.append(elapsedMillis3);
                Log.v("BufferGifDecoder", sb3.toString());
            }
        }
    }
}
