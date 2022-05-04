package com.android.systemui.unfold.util;

import android.animation.ValueAnimator;
import android.content.ContentResolver;
import android.database.ContentObserver;
import android.provider.Settings;
import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: ScaleAwareTransitionProgressProvider.kt */
/* loaded from: classes.dex */
public final class ScaleAwareTransitionProgressProvider implements UnfoldTransitionProgressProvider {
    @NotNull
    private final ScaleAwareTransitionProgressProvider$animatorDurationScaleObserver$1 animatorDurationScaleObserver;
    @NotNull
    private final ContentResolver contentResolver;
    @NotNull
    private final ScopedUnfoldTransitionProgressProvider scopedUnfoldTransitionProgressProvider;

    /* compiled from: ScaleAwareTransitionProgressProvider.kt */
    /* loaded from: classes.dex */
    public interface Factory {
        @NotNull
        ScaleAwareTransitionProgressProvider wrap(@NotNull UnfoldTransitionProgressProvider unfoldTransitionProgressProvider);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v1, types: [com.android.systemui.unfold.util.ScaleAwareTransitionProgressProvider$animatorDurationScaleObserver$1, android.database.ContentObserver] */
    public ScaleAwareTransitionProgressProvider(@NotNull UnfoldTransitionProgressProvider progressProviderToWrap, @NotNull ContentResolver contentResolver) {
        Intrinsics.checkNotNullParameter(progressProviderToWrap, "progressProviderToWrap");
        Intrinsics.checkNotNullParameter(contentResolver, "contentResolver");
        this.contentResolver = contentResolver;
        this.scopedUnfoldTransitionProgressProvider = new ScopedUnfoldTransitionProgressProvider(progressProviderToWrap);
        ?? scaleAwareTransitionProgressProvider$animatorDurationScaleObserver$1 = new ContentObserver() { // from class: com.android.systemui.unfold.util.ScaleAwareTransitionProgressProvider$animatorDurationScaleObserver$1
            {
                super(null);
            }

            @Override // android.database.ContentObserver
            public void onChange(boolean z) {
                ScaleAwareTransitionProgressProvider.this.onAnimatorScaleChanged();
            }
        };
        this.animatorDurationScaleObserver = scaleAwareTransitionProgressProvider$animatorDurationScaleObserver$1;
        contentResolver.registerContentObserver(Settings.Global.getUriFor("animator_duration_scale"), false, scaleAwareTransitionProgressProvider$animatorDurationScaleObserver$1);
        onAnimatorScaleChanged();
    }

    public void addCallback(@NotNull UnfoldTransitionProgressProvider.TransitionProgressListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.scopedUnfoldTransitionProgressProvider.addCallback(listener);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider
    public void destroy() {
        this.contentResolver.unregisterContentObserver(this.animatorDurationScaleObserver);
        this.scopedUnfoldTransitionProgressProvider.destroy();
    }

    public void removeCallback(@NotNull UnfoldTransitionProgressProvider.TransitionProgressListener listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.scopedUnfoldTransitionProgressProvider.removeCallback(listener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void onAnimatorScaleChanged() {
        this.scopedUnfoldTransitionProgressProvider.setReadyToHandleTransition(ValueAnimator.areAnimatorsEnabled());
    }
}
