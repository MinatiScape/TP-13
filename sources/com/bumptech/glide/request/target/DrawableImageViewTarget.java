package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import android.widget.ImageView;
/* loaded from: classes.dex */
public class DrawableImageViewTarget extends ImageViewTarget<Drawable> {
    public DrawableImageViewTarget(ImageView view) {
        super(view);
    }

    @Override // com.bumptech.glide.request.target.ImageViewTarget
    public void setResource(Drawable resource) {
        ((ImageView) this.view).setImageDrawable(resource);
    }
}