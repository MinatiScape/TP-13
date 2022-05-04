package com.bumptech.glide.request.target;

import android.graphics.Bitmap;
import android.widget.ImageView;
/* loaded from: classes.dex */
public class BitmapImageViewTarget extends ImageViewTarget<Bitmap> {
    public BitmapImageViewTarget(ImageView view) {
        super(view);
    }

    @Override // com.bumptech.glide.request.target.ImageViewTarget
    public void setResource(Bitmap resource) {
        ((ImageView) this.view).setImageBitmap(resource);
    }
}
