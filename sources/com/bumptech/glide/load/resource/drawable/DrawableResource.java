package com.bumptech.glide.load.resource.drawable;

import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.engine.Initializable;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.gif.GifDrawable;
/* loaded from: classes.dex */
public abstract class DrawableResource<T extends Drawable> implements Resource<T>, Initializable {
    public final T drawable;

    @Override // com.bumptech.glide.load.engine.Resource
    public final T get() {
        Drawable.ConstantState constantState = this.drawable.getConstantState();
        if (constantState == null) {
            return this.drawable;
        }
        return (T) constantState.newDrawable();
    }

    @Override // com.bumptech.glide.load.engine.Initializable
    public void initialize() {
        T t = this.drawable;
        if (t instanceof BitmapDrawable) {
            ((BitmapDrawable) t).getBitmap().prepareToDraw();
        } else if (t instanceof GifDrawable) {
            ((GifDrawable) t).state.frameLoader.firstFrame.prepareToDraw();
        }
    }

    public DrawableResource(T t) {
        ContainerHelpers.checkNotNull(t);
        this.drawable = t;
    }
}
