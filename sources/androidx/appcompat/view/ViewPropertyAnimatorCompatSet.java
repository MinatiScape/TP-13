package androidx.appcompat.view;

import android.view.View;
import android.view.animation.Interpolator;
import androidx.appcompat.R$layout;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.ViewPropertyAnimatorListener;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class ViewPropertyAnimatorCompatSet {
    public Interpolator mInterpolator;
    public boolean mIsStarted;
    public ViewPropertyAnimatorListener mListener;
    public long mDuration = -1;
    public final AnonymousClass1 mProxyListener = new R$layout() { // from class: androidx.appcompat.view.ViewPropertyAnimatorCompatSet.1
        public boolean mProxyStarted = false;
        public int mProxyEndCount = 0;

        @Override // androidx.core.view.ViewPropertyAnimatorListener
        public final void onAnimationEnd() {
            int i = this.mProxyEndCount + 1;
            this.mProxyEndCount = i;
            if (i == ViewPropertyAnimatorCompatSet.this.mAnimators.size()) {
                ViewPropertyAnimatorListener viewPropertyAnimatorListener = ViewPropertyAnimatorCompatSet.this.mListener;
                if (viewPropertyAnimatorListener != null) {
                    viewPropertyAnimatorListener.onAnimationEnd();
                }
                this.mProxyEndCount = 0;
                this.mProxyStarted = false;
                ViewPropertyAnimatorCompatSet.this.mIsStarted = false;
            }
        }

        @Override // androidx.appcompat.R$layout, androidx.core.view.ViewPropertyAnimatorListener
        public final void onAnimationStart() {
            if (!this.mProxyStarted) {
                this.mProxyStarted = true;
                ViewPropertyAnimatorListener viewPropertyAnimatorListener = ViewPropertyAnimatorCompatSet.this.mListener;
                if (viewPropertyAnimatorListener != null) {
                    viewPropertyAnimatorListener.onAnimationStart();
                }
            }
        }
    };
    public final ArrayList<ViewPropertyAnimatorCompat> mAnimators = new ArrayList<>();

    public final void cancel() {
        if (this.mIsStarted) {
            Iterator<ViewPropertyAnimatorCompat> it = this.mAnimators.iterator();
            while (it.hasNext()) {
                it.next().cancel();
            }
            this.mIsStarted = false;
        }
    }

    public final void start() {
        View view;
        if (!this.mIsStarted) {
            Iterator<ViewPropertyAnimatorCompat> it = this.mAnimators.iterator();
            while (it.hasNext()) {
                ViewPropertyAnimatorCompat next = it.next();
                long j = this.mDuration;
                if (j >= 0) {
                    next.setDuration(j);
                }
                Interpolator interpolator = this.mInterpolator;
                if (!(interpolator == null || (view = next.mView.get()) == null)) {
                    view.animate().setInterpolator(interpolator);
                }
                if (this.mListener != null) {
                    next.setListener(this.mProxyListener);
                }
                View view2 = next.mView.get();
                if (view2 != null) {
                    view2.animate().start();
                }
            }
            this.mIsStarted = true;
        }
    }
}
