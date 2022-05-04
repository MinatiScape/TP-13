package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import android.widget.ImageView;
/* loaded from: classes.dex */
public final class DrawableImageViewTarget extends ImageViewTarget<Drawable> {
    @Override // com.bumptech.glide.request.target.ImageViewTarget
    public final void setResource(Drawable drawable) {
        ((ImageView) this.view).setImageDrawable(drawable);
    }

    public DrawableImageViewTarget(ImageView imageView) {
        super(imageView);
    }
}
