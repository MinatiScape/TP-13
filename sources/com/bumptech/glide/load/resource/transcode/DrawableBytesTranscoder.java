package com.bumptech.glide.load.resource.transcode;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.BitmapResource;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.google.android.gms.common.util.zzh;
/* loaded from: classes.dex */
public final class DrawableBytesTranscoder implements ResourceTranscoder<Drawable, byte[]> {
    public final ResourceTranscoder<Bitmap, byte[]> bitmapBytesTranscoder;
    public final BitmapPool bitmapPool;
    public final ResourceTranscoder<GifDrawable, byte[]> gifDrawableBytesTranscoder;

    public DrawableBytesTranscoder(BitmapPool bitmapPool, BitmapBytesTranscoder bitmapBytesTranscoder, zzh zzhVar) {
        this.bitmapPool = bitmapPool;
        this.bitmapBytesTranscoder = bitmapBytesTranscoder;
        this.gifDrawableBytesTranscoder = zzhVar;
    }

    @Override // com.bumptech.glide.load.resource.transcode.ResourceTranscoder
    public final Resource<byte[]> transcode(Resource<Drawable> resource, Options options) {
        Drawable drawable = resource.get();
        if (drawable instanceof BitmapDrawable) {
            return this.bitmapBytesTranscoder.transcode(BitmapResource.obtain(((BitmapDrawable) drawable).getBitmap(), this.bitmapPool), options);
        }
        if (drawable instanceof GifDrawable) {
            return this.gifDrawableBytesTranscoder.transcode(resource, options);
        }
        return null;
    }
}
