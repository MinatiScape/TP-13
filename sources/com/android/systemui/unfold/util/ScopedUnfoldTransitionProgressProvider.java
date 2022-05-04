package com.android.systemui.unfold.util;

import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda4;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
/* loaded from: classes.dex */
public final class ScopedUnfoldTransitionProgressProvider implements UnfoldTransitionProgressProvider, UnfoldTransitionProgressProvider.TransitionProgressListener {
    private static final float PROGRESS_UNSET = -1.0f;
    private boolean mIsReadyToHandleTransition;
    private boolean mIsTransitionRunning;
    private float mLastTransitionProgress;
    private final List<UnfoldTransitionProgressProvider.TransitionProgressListener> mListeners;
    private UnfoldTransitionProgressProvider mSource;

    public ScopedUnfoldTransitionProgressProvider() {
        this(null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$setReadyToHandleTransition$0(UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener) {
        transitionProgressListener.onTransitionProgress(this.mLastTransitionProgress);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider
    public void destroy() {
        this.mSource.removeCallback(this);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionFinished() {
        if (this.mIsReadyToHandleTransition) {
            this.mListeners.forEach(ScopedUnfoldTransitionProgressProvider$$ExternalSyntheticLambda1.INSTANCE);
        }
        this.mIsTransitionRunning = false;
        this.mLastTransitionProgress = PROGRESS_UNSET;
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionProgress(final float f) {
        if (this.mIsReadyToHandleTransition) {
            this.mListeners.forEach(new Consumer() { // from class: com.android.systemui.unfold.util.ScopedUnfoldTransitionProgressProvider$$ExternalSyntheticLambda0
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    ((UnfoldTransitionProgressProvider.TransitionProgressListener) obj).onTransitionProgress(f);
                }
            });
        }
        this.mLastTransitionProgress = f;
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionStarted() {
        this.mIsTransitionRunning = true;
        if (this.mIsReadyToHandleTransition) {
            this.mListeners.forEach(ScopedUnfoldTransitionProgressProvider$$ExternalSyntheticLambda2.INSTANCE);
        }
    }

    public void setReadyToHandleTransition(boolean z) {
        if (this.mIsTransitionRunning) {
            if (z) {
                this.mListeners.forEach(ScopedUnfoldTransitionProgressProvider$$ExternalSyntheticLambda2.INSTANCE);
                if (this.mLastTransitionProgress != PROGRESS_UNSET) {
                    this.mListeners.forEach(new BottomActionBar$$ExternalSyntheticLambda4(this));
                }
            } else {
                this.mIsTransitionRunning = false;
                this.mListeners.forEach(ScopedUnfoldTransitionProgressProvider$$ExternalSyntheticLambda1.INSTANCE);
            }
        }
        this.mIsReadyToHandleTransition = z;
    }

    public void setSourceProvider(UnfoldTransitionProgressProvider unfoldTransitionProgressProvider) {
        UnfoldTransitionProgressProvider unfoldTransitionProgressProvider2 = this.mSource;
        if (unfoldTransitionProgressProvider2 != null) {
            unfoldTransitionProgressProvider2.removeCallback(this);
        }
        if (unfoldTransitionProgressProvider != null) {
            this.mSource = unfoldTransitionProgressProvider;
            unfoldTransitionProgressProvider.addCallback(this);
            return;
        }
        this.mSource = null;
    }

    public ScopedUnfoldTransitionProgressProvider(UnfoldTransitionProgressProvider unfoldTransitionProgressProvider) {
        this.mListeners = new ArrayList();
        this.mLastTransitionProgress = PROGRESS_UNSET;
        setSourceProvider(unfoldTransitionProgressProvider);
    }

    public void addCallback(UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener) {
        this.mListeners.add(transitionProgressListener);
    }

    public void removeCallback(UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener) {
        this.mListeners.remove(transitionProgressListener);
    }
}
