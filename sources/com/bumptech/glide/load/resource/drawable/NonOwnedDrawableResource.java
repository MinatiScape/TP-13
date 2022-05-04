package com.bumptech.glide.load.resource.drawable;

import android.graphics.drawable.Drawable;
/* loaded from: classes.dex */
public final class NonOwnedDrawableResource extends DrawableResource<Drawable> {
    @Override // com.bumptech.glide.load.engine.Resource
    public final void recycle() {
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Class<Drawable> getResourceClass() {
        return this.drawable.getClass();
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final int getSize() {
        return Math.max(1, this.drawable.getIntrinsicHeight() * this.drawable.getIntrinsicWidth() * 4);
    }

    public NonOwnedDrawableResource(Drawable drawable) {
        super(drawable);
    }
}
