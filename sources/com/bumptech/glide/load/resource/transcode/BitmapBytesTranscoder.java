package com.bumptech.glide.load.resource.transcode;

import android.graphics.Bitmap;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.bytes.BytesResource;
import java.io.ByteArrayOutputStream;
/* loaded from: classes.dex */
public class BitmapBytesTranscoder implements ResourceTranscoder<Bitmap, byte[]> {
    public final Bitmap.CompressFormat compressFormat = Bitmap.CompressFormat.JPEG;
    public final int quality = 100;

    @Override // com.bumptech.glide.load.resource.transcode.ResourceTranscoder
    public Resource<byte[]> transcode(Resource<Bitmap> toTranscode, Options options) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        toTranscode.get().compress(this.compressFormat, this.quality, byteArrayOutputStream);
        toTranscode.recycle();
        return new BytesResource(byteArrayOutputStream.toByteArray());
    }
}
