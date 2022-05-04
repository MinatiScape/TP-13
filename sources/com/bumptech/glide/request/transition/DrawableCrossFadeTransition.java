package com.bumptech.glide.request.transition;

import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.widget.ImageView;
import com.bumptech.glide.request.target.ImageViewTarget;
import com.bumptech.glide.request.transition.Transition;
/* loaded from: classes.dex */
public class DrawableCrossFadeTransition implements Transition<Drawable> {
    public final int duration;
    public final boolean isCrossFadeEnabled;

    public DrawableCrossFadeTransition(int duration, boolean isCrossFadeEnabled) {
        this.duration = duration;
        this.isCrossFadeEnabled = isCrossFadeEnabled;
    }

    @Override // com.bumptech.glide.request.transition.Transition
    public boolean transition(Drawable current, Transition.ViewAdapter adapter) {
        Drawable drawable = current;
        ImageViewTarget imageViewTarget = (ImageViewTarget) adapter;
        Drawable drawable2 = ((ImageView) imageViewTarget.view).getDrawable();
        if (drawable2 == null) {
            drawable2 = new ColorDrawable(0);
        }
        TransitionDrawable transitionDrawable = new TransitionDrawable(new Drawable[]{drawable2, drawable});
        transitionDrawable.setCrossFadeEnabled(this.isCrossFadeEnabled);
        transitionDrawable.startTransition(this.duration);
        ((ImageView) imageViewTarget.view).setImageDrawable(transitionDrawable);
        return true;
    }
}
