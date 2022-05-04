package com.android.systemui.unfold.util;

import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: ScopedUnfoldTransitionProgressProvider.kt */
/* loaded from: classes.dex */
public class ScopedUnfoldTransitionProgressProvider implements UnfoldTransitionProgressProvider, UnfoldTransitionProgressProvider.TransitionProgressListener {
    @NotNull
    public static final Companion Companion = new Companion(null);
    private static final float PROGRESS_UNSET = -1.0f;
    private boolean isReadyToHandleTransition;
    private boolean isTransitionRunning;
    private float lastTransitionProgress;
    @NotNull
    private final List<UnfoldTransitionProgressProvider.TransitionProgressListener> listeners;
    @Nullable
    private UnfoldTransitionProgressProvider source;

    public ScopedUnfoldTransitionProgressProvider() {
        this(null, 1, null);
    }

    public ScopedUnfoldTransitionProgressProvider(@Nullable UnfoldTransitionProgressProvider unfoldTransitionProgressProvider) {
        this.listeners = new ArrayList();
        this.lastTransitionProgress = PROGRESS_UNSET;
        setSourceProvider(unfoldTransitionProgressProvider);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionStarted() {
        this.isTransitionRunning = true;
        if (this.isReadyToHandleTransition) {
            for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener : this.listeners) {
                transitionProgressListener.onTransitionStarted();
            }
        }
    }

    public void addCallback(@NotNull UnfoldTransitionProgressProvider.TransitionProgressListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.listeners.add(listener);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider
    public void destroy() {
        UnfoldTransitionProgressProvider unfoldTransitionProgressProvider = this.source;
        if (unfoldTransitionProgressProvider != null) {
            unfoldTransitionProgressProvider.removeCallback(this);
        }
        UnfoldTransitionProgressProvider unfoldTransitionProgressProvider2 = this.source;
        if (unfoldTransitionProgressProvider2 != null) {
            unfoldTransitionProgressProvider2.destroy();
        }
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionFinished() {
        if (this.isReadyToHandleTransition) {
            for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener : this.listeners) {
                transitionProgressListener.onTransitionFinished();
            }
        }
        this.isTransitionRunning = false;
        this.lastTransitionProgress = PROGRESS_UNSET;
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionProgress(float f) {
        if (this.isReadyToHandleTransition) {
            for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener : this.listeners) {
                transitionProgressListener.onTransitionProgress(f);
            }
        }
        this.lastTransitionProgress = f;
    }

    public void removeCallback(@NotNull UnfoldTransitionProgressProvider.TransitionProgressListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.listeners.remove(listener);
    }

    public final void setReadyToHandleTransition(boolean z) {
        if (this.isTransitionRunning) {
            boolean z2 = false;
            if (z) {
                for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener : this.listeners) {
                    transitionProgressListener.onTransitionStarted();
                }
                if (this.lastTransitionProgress == PROGRESS_UNSET) {
                    z2 = true;
                }
                if (!z2) {
                    for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener2 : this.listeners) {
                        transitionProgressListener2.onTransitionProgress(this.lastTransitionProgress);
                    }
                }
            } else {
                this.isTransitionRunning = false;
                for (UnfoldTransitionProgressProvider.TransitionProgressListener transitionProgressListener3 : this.listeners) {
                    transitionProgressListener3.onTransitionFinished();
                }
            }
        }
        this.isReadyToHandleTransition = z;
    }

    public final void setSourceProvider(@Nullable UnfoldTransitionProgressProvider unfoldTransitionProgressProvider) {
        UnfoldTransitionProgressProvider unfoldTransitionProgressProvider2 = this.source;
        if (unfoldTransitionProgressProvider2 != null) {
            unfoldTransitionProgressProvider2.removeCallback(this);
        }
        if (unfoldTransitionProgressProvider != null) {
            this.source = unfoldTransitionProgressProvider;
            unfoldTransitionProgressProvider.addCallback(this);
            return;
        }
        this.source = null;
    }

    public /* synthetic */ ScopedUnfoldTransitionProgressProvider(UnfoldTransitionProgressProvider unfoldTransitionProgressProvider, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? null : unfoldTransitionProgressProvider);
    }

    /* compiled from: ScopedUnfoldTransitionProgressProvider.kt */
    /* loaded from: classes.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }
}
