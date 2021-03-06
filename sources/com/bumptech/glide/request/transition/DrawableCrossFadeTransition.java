package com.bumptech.glide.request.transition;

import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.widget.ImageView;
import com.bumptech.glide.request.target.ImageViewTarget;
import com.bumptech.glide.request.transition.Transition;
/* loaded from: classes.dex */
public final class DrawableCrossFadeTransition implements Transition<Drawable> {
    public final int duration;
    public final boolean isCrossFadeEnabled;

    @Override // com.bumptech.glide.request.transition.Transition
    public final boolean transition(Drawable drawable, Transition.ViewAdapter viewAdapter) {
        Drawable drawable2 = drawable;
        ImageViewTarget imageViewTarget = (ImageViewTarget) viewAdapter;
        Drawable drawable3 = ((ImageView) imageViewTarget.view).getDrawable();
        if (drawable3 == null) {
            drawable3 = new ColorDrawable(0);
        }
        TransitionDrawable transitionDrawable = new TransitionDrawable(new Drawable[]{drawable3, drawable2});
        transitionDrawable.setCrossFadeEnabled(this.isCrossFadeEnabled);
        transitionDrawable.startTransition(this.duration);
        ((ImageView) imageViewTarget.view).setImageDrawable(transitionDrawable);
        return true;
    }

    public DrawableCrossFadeTransition(int i, boolean z) {
        this.duration = i;
        this.isCrossFadeEnabled = z;
    }
}
