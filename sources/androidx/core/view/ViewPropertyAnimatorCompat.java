package androidx.core.view;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import java.lang.ref.WeakReference;
/* loaded from: classes.dex */
public final class ViewPropertyAnimatorCompat {
    public WeakReference<View> mView;

    public final void alpha(float f) {
        View view = this.mView.get();
        if (view != null) {
            view.animate().alpha(f);
        }
    }

    public final void cancel() {
        View view = this.mView.get();
        if (view != null) {
            view.animate().cancel();
        }
    }

    public final void setDuration(long j) {
        View view = this.mView.get();
        if (view != null) {
            view.animate().setDuration(j);
        }
    }

    public final void setListener(final ViewPropertyAnimatorListener viewPropertyAnimatorListener) {
        final View view = this.mView.get();
        if (view == null) {
            return;
        }
        if (viewPropertyAnimatorListener != null) {
            view.animate().setListener(new AnimatorListenerAdapter() { // from class: androidx.core.view.ViewPropertyAnimatorCompat.1
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public final void onAnimationCancel(Animator animator) {
                    ViewPropertyAnimatorListener.this.onAnimationCancel(view);
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public final void onAnimationEnd(Animator animator) {
                    ViewPropertyAnimatorListener.this.onAnimationEnd();
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public final void onAnimationStart(Animator animator) {
                    ViewPropertyAnimatorListener.this.onAnimationStart();
                }
            });
        } else {
            view.animate().setListener(null);
        }
    }

    public final void translationY(float f) {
        View view = this.mView.get();
        if (view != null) {
            view.animate().translationY(f);
        }
    }

    public ViewPropertyAnimatorCompat(View view) {
        this.mView = new WeakReference<>(view);
    }
}
