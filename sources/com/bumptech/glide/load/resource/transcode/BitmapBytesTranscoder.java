package com.bumptech.glide.load.resource.transcode;

import android.graphics.Bitmap;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.bytes.BytesResource;
import java.io.ByteArrayOutputStream;
/* loaded from: classes.dex */
public final class BitmapBytesTranscoder implements ResourceTranscoder<Bitmap, byte[]> {
    public final Bitmap.CompressFormat compressFormat = Bitmap.CompressFormat.JPEG;
    public final int quality = 100;

    @Override // com.bumptech.glide.load.resource.transcode.ResourceTranscoder
    public final Resource<byte[]> transcode(Resource<Bitmap> resource, Options options) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        resource.get().compress(this.compressFormat, this.quality, byteArrayOutputStream);
        resource.recycle();
        return new BytesResource(byteArrayOutputStream.toByteArray());
    }
}
