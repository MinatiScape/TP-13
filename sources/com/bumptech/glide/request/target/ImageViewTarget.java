package com.bumptech.glide.request.target;

import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import com.bumptech.glide.request.transition.Transition;
/* loaded from: classes.dex */
public abstract class ImageViewTarget<Z> extends ViewTarget<ImageView, Z> implements Transition.ViewAdapter {
    public Animatable animatable;

    @Override // com.bumptech.glide.request.target.Target
    public final void onLoadFailed(Drawable drawable) {
        setResource(null);
        this.animatable = null;
        ((ImageView) this.view).setImageDrawable(drawable);
    }

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.request.target.Target
    public final void onLoadStarted(Drawable drawable) {
        setResource(null);
        this.animatable = null;
        ((ImageView) this.view).setImageDrawable(drawable);
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void onResourceReady(Z z, Transition<? super Z> transition) {
        if (transition == null || !transition.transition(z, this)) {
            setResource(z);
            if (z instanceof Animatable) {
                Animatable animatable = (Animatable) z;
                this.animatable = animatable;
                animatable.start();
                return;
            }
            this.animatable = null;
        } else if (z instanceof Animatable) {
            Animatable animatable2 = (Animatable) z;
            this.animatable = animatable2;
            animatable2.start();
        } else {
            this.animatable = null;
        }
    }

    public abstract void setResource(Z z);

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.manager.LifecycleListener
    public final void onStart() {
        Animatable animatable = this.animatable;
        if (animatable != null) {
            animatable.start();
        }
    }

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.manager.LifecycleListener
    public final void onStop() {
        Animatable animatable = this.animatable;
        if (animatable != null) {
            animatable.stop();
        }
    }

    @Override // com.bumptech.glide.request.target.ViewTarget, com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.request.target.Target
    public final void onLoadCleared(Drawable drawable) {
        super.onLoadCleared(drawable);
        Animatable animatable = this.animatable;
        if (animatable != null) {
            animatable.stop();
        }
        setResource(null);
        this.animatable = null;
        ((ImageView) this.view).setImageDrawable(drawable);
    }

    public ImageViewTarget(ImageView imageView) {
        super(imageView);
    }
}
