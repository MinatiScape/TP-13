package com.bumptech.glide.load.resource.transcode;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.bitmap.LazyBitmapDrawableResource;
/* loaded from: classes.dex */
public final class BitmapDrawableTranscoder implements ResourceTranscoder<Bitmap, BitmapDrawable> {
    public final Resources resources;

    @Override // com.bumptech.glide.load.resource.transcode.ResourceTranscoder
    public final Resource<BitmapDrawable> transcode(Resource<Bitmap> resource, Options options) {
        Resources resources = this.resources;
        if (resource == null) {
            return null;
        }
        return new LazyBitmapDrawableResource(resources, resource);
    }

    public BitmapDrawableTranscoder(Resources resources) {
        this.resources = resources;
    }
}
