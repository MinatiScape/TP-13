package com.bumptech.glide.load.resource.transcode;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.BitmapResource;
import com.bumptech.glide.load.resource.gif.GifDrawable;
/* loaded from: classes.dex */
public final class DrawableBytesTranscoder implements ResourceTranscoder<Drawable, byte[]> {
    public final ResourceTranscoder<Bitmap, byte[]> bitmapBytesTranscoder;
    public final BitmapPool bitmapPool;
    public final ResourceTranscoder<GifDrawable, byte[]> gifDrawableBytesTranscoder;

    public DrawableBytesTranscoder(BitmapPool bitmapPool, ResourceTranscoder<Bitmap, byte[]> bitmapBytesTranscoder, ResourceTranscoder<GifDrawable, byte[]> gifDrawableBytesTranscoder) {
        this.bitmapPool = bitmapPool;
        this.bitmapBytesTranscoder = bitmapBytesTranscoder;
        this.gifDrawableBytesTranscoder = gifDrawableBytesTranscoder;
    }

    @Override // com.bumptech.glide.load.resource.transcode.ResourceTranscoder
    public Resource<byte[]> transcode(Resource<Drawable> toTranscode, Options options) {
        Drawable drawable = toTranscode.get();
        if (drawable instanceof BitmapDrawable) {
            return this.bitmapBytesTranscoder.transcode(BitmapResource.obtain(((BitmapDrawable) drawable).getBitmap(), this.bitmapPool), options);
        }
        if (drawable instanceof GifDrawable) {
            return this.gifDrawableBytesTranscoder.transcode(toTranscode, options);
        }
        return null;
    }
}
