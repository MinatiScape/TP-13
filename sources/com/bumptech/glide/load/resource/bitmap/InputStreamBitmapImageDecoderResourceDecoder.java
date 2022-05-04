package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.ImageDecoder;
import com.android.systemui.shared.system.QuickStepContract;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.util.ByteBufferUtil;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class InputStreamBitmapImageDecoderResourceDecoder implements ResourceDecoder<InputStream, Bitmap> {
    public final BitmapImageDecoderResourceDecoder wrapped = new BitmapImageDecoderResourceDecoder();

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final Resource<Bitmap> decode(InputStream inputStream, int i, int i2, Options options) throws IOException {
        InputStream inputStream2 = inputStream;
        AtomicReference<byte[]> atomicReference = ByteBufferUtil.BUFFER_REF;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED);
        byte[] andSet = ByteBufferUtil.BUFFER_REF.getAndSet(null);
        if (andSet == null) {
            andSet = new byte[QuickStepContract.SYSUI_STATE_BUBBLES_EXPANDED];
        }
        while (true) {
            int read = inputStream2.read(andSet);
            if (read >= 0) {
                byteArrayOutputStream.write(andSet, 0, read);
            } else {
                ByteBufferUtil.BUFFER_REF.set(andSet);
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                return this.wrapped.decode(ImageDecoder.createSource((ByteBuffer) ByteBuffer.allocateDirect(byteArray.length).put(byteArray).position(0)), i, i2, options);
            }
        }
    }

    @Override // com.bumptech.glide.load.ResourceDecoder
    public final /* bridge */ /* synthetic */ boolean handles(InputStream inputStream, Options options) throws IOException {
        return true;
    }
}
