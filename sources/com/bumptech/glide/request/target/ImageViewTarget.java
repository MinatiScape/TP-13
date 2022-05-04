package com.bumptech.glide.request.target;

import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import com.bumptech.glide.request.transition.Transition;
/* loaded from: classes.dex */
public abstract class ImageViewTarget<Z> extends ViewTarget<ImageView, Z> implements Transition.ViewAdapter {
    public Animatable animatable;

    public ImageViewTarget(ImageView view) {
        super(view);
    }

    @Override // com.bumptech.glide.request.target.ViewTarget, com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.request.target.Target
    public void onLoadCleared(Drawable placeholder) {
        this.sizeDeterminer.clearCallbacksAndListener();
        Animatable animatable = this.animatable;
        if (animatable != null) {
            animatable.stop();
        }
        setResourceInternal(null);
        ((ImageView) this.view).setImageDrawable(placeholder);
    }

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.request.target.Target
    public void onLoadFailed(Drawable errorDrawable) {
        setResourceInternal(null);
        ((ImageView) this.view).setImageDrawable(errorDrawable);
    }

    @Override // com.bumptech.glide.request.target.ViewTarget, com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.request.target.Target
    public void onLoadStarted(Drawable placeholder) {
        setResourceInternal(null);
        ((ImageView) this.view).setImageDrawable(placeholder);
    }

    @Override // com.bumptech.glide.request.target.Target
    public void onResourceReady(Z resource, Transition<? super Z> transition) {
        if (transition == null || !transition.transition(resource, this)) {
            setResourceInternal(resource);
        } else if (resource instanceof Animatable) {
            Animatable animatable = (Animatable) resource;
            this.animatable = animatable;
            animatable.start();
        } else {
            this.animatable = null;
        }
    }

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.manager.LifecycleListener
    public void onStart() {
        Animatable animatable = this.animatable;
        if (animatable != null) {
            animatable.start();
        }
    }

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.manager.LifecycleListener
    public void onStop() {
        Animatable animatable = this.animatable;
        if (animatable != null) {
            animatable.stop();
        }
    }

    public abstract void setResource(Z resource);

    public final void setResourceInternal(Z resource) {
        setResource(resource);
        if (resource instanceof Animatable) {
            Animatable animatable = (Animatable) resource;
            this.animatable = animatable;
            animatable.start();
            return;
        }
        this.animatable = null;
    }
}
