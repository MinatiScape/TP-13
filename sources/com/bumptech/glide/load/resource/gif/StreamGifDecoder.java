package com.bumptech.glide.load.resource.gif;

import android.util.Log;
import com.android.systemui.shared.system.QuickStepContract;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ImageHeaderParserUtils;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.List;
/* loaded from: classes.dex */
public final class StreamGifDecoder implements ResourceDecoder<InputStream, GifDrawable> {
    public final ArrayPool byteArrayPool;
    public final ResourceDecoder<ByteBuffer, GifDrawable> byteBufferDecoder;
    public final List<ImageHeaderParser> parsers;

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<GifDrawable> decode(InputStream inputStream, int i, int i2, Options options) throws IOException {
        byte[] bArr;
        InputStream inputStream2 = inputStream;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED);
        try {
            byte[] bArr2 = new byte[QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED];
            while (true) {
                int read = inputStream2.read(bArr2);
                if (read == -1) {
                    break;
                }
                byteArrayOutputStream.write(bArr2, 0, read);
            }
            byteArrayOutputStream.flush();
            bArr = byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            if (Log.isLoggable("StreamGifDecoder", 5)) {
                Log.w("StreamGifDecoder", "Error reading data from stream", e);
            }
            bArr = null;
        }
        if (bArr == null) {
            return null;
        }
        return this.byteBufferDecoder.decode(ByteBuffer.wrap(bArr), i, i2, options);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final boolean handles(InputStream inputStream, Options options) throws IOException {
        InputStream inputStream2 = inputStream;
        if (((Boolean) options.get(GifOptions.DISABLE_ANIMATION)).booleanValue() || ImageHeaderParserUtils.getType(this.parsers, inputStream2, this.byteArrayPool) != ImageHeaderParser.ImageType.GIF) {
            return false;
        }
        return true;
    }

    public StreamGifDecoder(List list, ByteBufferGifDecoder byteBufferGifDecoder, ArrayPool arrayPool) {
        this.parsers = list;
        this.byteBufferDecoder = byteBufferGifDecoder;
        this.byteArrayPool = arrayPool;
    }
}
