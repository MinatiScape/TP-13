package com.bumptech.glide.load.resource.bitmap;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.engine.Initializable;
import com.bumptech.glide.load.engine.Resource;
/* loaded from: classes.dex */
public final class LazyBitmapDrawableResource implements Resource<BitmapDrawable>, Initializable {
    public final Resource<Bitmap> bitmapResource;
    public final Resources resources;

    @Override // com.bumptech.glide.load.engine.Resource
    public final BitmapDrawable get() {
        return new BitmapDrawable(this.resources, this.bitmapResource.get());
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final int getSize() {
        return this.bitmapResource.getSize();
    }

    @Override // com.bumptech.glide.load.engine.Initializable
    public final void initialize() {
        Resource<Bitmap> resource = this.bitmapResource;
        if (resource instanceof Initializable) {
            ((Initializable) resource).initialize();
        }
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final void recycle() {
        this.bitmapResource.recycle();
    }

    public LazyBitmapDrawableResource(Resources resources, Resource<Bitmap> resource) {
        ContainerHelpers.checkNotNull(resources);
        this.resources = resources;
        ContainerHelpers.checkNotNull(resource);
        this.bitmapResource = resource;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Class<BitmapDrawable> getResourceClass() {
        return BitmapDrawable.class;
    }
}
