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
public class StreamGifDecoder implements ResourceDecoder<InputStream, GifDrawable> {
    public final ArrayPool byteArrayPool;
    public final ResourceDecoder<ByteBuffer, GifDrawable> byteBufferDecoder;
    public final List<ImageHeaderParser> parsers;

    public StreamGifDecoder(List<ImageHeaderParser> parsers, ResourceDecoder<ByteBuffer, GifDrawable> byteBufferDecoder, ArrayPool byteArrayPool) {
        this.parsers = parsers;
        this.byteBufferDecoder = byteBufferDecoder;
        this.byteArrayPool = byteArrayPool;
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public Resource<GifDrawable> decode(InputStream source, int width, int height, Options options) throws IOException {
        byte[] bArr;
        InputStream inputStream = source;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED);
        try {
            byte[] bArr2 = new byte[QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED];
            while (true) {
                int read = inputStream.read(bArr2);
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
        return this.byteBufferDecoder.decode(ByteBuffer.wrap(bArr), width, height, options);
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public boolean handles(InputStream source, Options options) throws IOException {
        return !((Boolean) options.get(GifOptions.DISABLE_ANIMATION)).booleanValue() && ImageHeaderParserUtils.getType(this.parsers, source, this.byteArrayPool) == ImageHeaderParser.ImageType.GIF;
    }
}
