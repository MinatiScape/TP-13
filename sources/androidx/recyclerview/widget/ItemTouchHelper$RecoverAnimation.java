package androidx.recyclerview.widget;

import android.animation.Animator;
import android.animation.ValueAnimator;
/* loaded from: classes.dex */
class ItemTouchHelper$RecoverAnimation implements Animator.AnimatorListener {
    public boolean mEnded;
    public final ValueAnimator mValueAnimator;

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        if (this.mEnded) {
            this.mEnded = true;
            return;
        }
        throw null;
    }
}
