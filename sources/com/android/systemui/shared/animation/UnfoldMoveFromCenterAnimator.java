package com.android.systemui.shared.animation;

import android.graphics.Point;
import android.view.View;
import android.view.WindowManager;
import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: UnfoldMoveFromCenterAnimator.kt */
/* loaded from: classes.dex */
public final class UnfoldMoveFromCenterAnimator implements UnfoldTransitionProgressProvider.TransitionProgressListener {
    @Nullable
    private final AlphaProvider alphaProvider;
    @NotNull
    private final List<AnimatedView> animatedViews;
    private boolean isVerticalFold;
    private float lastAnimationProgress;
    @NotNull
    private final Point screenSize;
    @NotNull
    private final TranslationApplier translationApplier;
    @NotNull
    private final ViewCenterProvider viewCenterProvider;
    @NotNull
    private final WindowManager windowManager;

    /* compiled from: UnfoldMoveFromCenterAnimator.kt */
    /* loaded from: classes.dex */
    public interface AlphaProvider {
        float getAlpha(float f);
    }

    /* compiled from: UnfoldMoveFromCenterAnimator.kt */
    /* loaded from: classes.dex */
    public interface TranslationApplier {

        /* compiled from: UnfoldMoveFromCenterAnimator.kt */
        /* loaded from: classes.dex */
        public static final class DefaultImpls {
            public static void apply(@NotNull TranslationApplier translationApplier, @NotNull View view, float f, float f2) {
                Intrinsics.checkNotNullParameter(translationApplier, "this");
                Intrinsics.checkNotNullParameter(view, "view");
                view.setTranslationX(f);
                view.setTranslationY(f2);
            }
        }

        void apply(@NotNull View view, float f, float f2);
    }

    /* compiled from: UnfoldMoveFromCenterAnimator.kt */
    /* loaded from: classes.dex */
    public interface ViewCenterProvider {

        /* compiled from: UnfoldMoveFromCenterAnimator.kt */
        /* loaded from: classes.dex */
        public static final class DefaultImpls {
            public static void getViewCenter(@NotNull ViewCenterProvider viewCenterProvider, @NotNull View view, @NotNull Point outPoint) {
                Intrinsics.checkNotNullParameter(viewCenterProvider, "this");
                Intrinsics.checkNotNullParameter(view, "view");
                Intrinsics.checkNotNullParameter(outPoint, "outPoint");
                int[] iArr = new int[2];
                view.getLocationOnScreen(iArr);
                int i = iArr[0];
                int i2 = iArr[1];
                outPoint.x = (view.getWidth() / 2) + i;
                outPoint.y = (view.getHeight() / 2) + i2;
            }
        }

        void getViewCenter(@NotNull View view, @NotNull Point point);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public UnfoldMoveFromCenterAnimator(@NotNull WindowManager windowManager) {
        this(windowManager, null, null, null, 14, null);
        Intrinsics.checkNotNullParameter(windowManager, "windowManager");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public UnfoldMoveFromCenterAnimator(@NotNull WindowManager windowManager, @NotNull TranslationApplier translationApplier) {
        this(windowManager, translationApplier, null, null, 12, null);
        Intrinsics.checkNotNullParameter(windowManager, "windowManager");
        Intrinsics.checkNotNullParameter(translationApplier, "translationApplier");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public UnfoldMoveFromCenterAnimator(@NotNull WindowManager windowManager, @NotNull TranslationApplier translationApplier, @NotNull ViewCenterProvider viewCenterProvider) {
        this(windowManager, translationApplier, viewCenterProvider, null, 8, null);
        Intrinsics.checkNotNullParameter(windowManager, "windowManager");
        Intrinsics.checkNotNullParameter(translationApplier, "translationApplier");
        Intrinsics.checkNotNullParameter(viewCenterProvider, "viewCenterProvider");
    }

    public UnfoldMoveFromCenterAnimator(@NotNull WindowManager windowManager, @NotNull TranslationApplier translationApplier, @NotNull ViewCenterProvider viewCenterProvider, @Nullable AlphaProvider alphaProvider) {
        Intrinsics.checkNotNullParameter(windowManager, "windowManager");
        Intrinsics.checkNotNullParameter(translationApplier, "translationApplier");
        Intrinsics.checkNotNullParameter(viewCenterProvider, "viewCenterProvider");
        this.windowManager = windowManager;
        this.translationApplier = translationApplier;
        this.viewCenterProvider = viewCenterProvider;
        this.alphaProvider = alphaProvider;
        this.screenSize = new Point();
        this.animatedViews = new ArrayList();
    }

    private final void applyAlpha(AnimatedView animatedView, float f) {
        View view;
        if (this.alphaProvider != null && (view = animatedView.getView().get()) != null) {
            view.setAlpha(this.alphaProvider.getAlpha(f));
        }
    }

    private final AnimatedView createAnimatedView(View view) {
        return updateAnimatedView(new AnimatedView(new WeakReference(view), HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 6, null), view);
    }

    private final AnimatedView updateAnimatedView(AnimatedView animatedView, View view) {
        Point point = new Point();
        this.viewCenterProvider.getViewCenter(view, point);
        int i = point.x;
        int i2 = point.y;
        if (this.isVerticalFold) {
            animatedView.setStartTranslationX(((this.screenSize.x / 2) - i) * 0.3f);
            animatedView.setStartTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        } else {
            animatedView.setStartTranslationX(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            animatedView.setStartTranslationY(((this.screenSize.y / 2) - i2) * 0.3f);
        }
        return animatedView;
    }

    public final void clearRegisteredViews() {
        onTransitionProgress(1.0f);
        this.animatedViews.clear();
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionProgress(float f) {
        for (AnimatedView animatedView : this.animatedViews) {
            applyTransition(animatedView, f);
            applyAlpha(animatedView, f);
        }
        this.lastAnimationProgress = f;
    }

    public final void registerViewForAnimation(@NotNull View view) {
        Intrinsics.checkNotNullParameter(view, "view");
        this.animatedViews.add(createAnimatedView(view));
    }

    public final void updateDisplayProperties() {
        boolean z;
        this.windowManager.getDefaultDisplay().getSize(this.screenSize);
        if (this.windowManager.getDefaultDisplay().getRotation() == 0 || this.windowManager.getDefaultDisplay().getRotation() == 2) {
            z = true;
        } else {
            z = false;
        }
        this.isVerticalFold = z;
    }

    public final void updateViewPositions() {
        for (AnimatedView animatedView : this.animatedViews) {
            View view = animatedView.getView().get();
            if (view != null) {
                updateAnimatedView(animatedView, view);
            }
        }
        onTransitionProgress(this.lastAnimationProgress);
    }

    private final void applyTransition(AnimatedView animatedView, float f) {
        View view = animatedView.getView().get();
        if (view != null) {
            float f2 = 1 - f;
            this.translationApplier.apply(view, animatedView.getStartTranslationX() * f2, animatedView.getStartTranslationY() * f2);
        }
    }

    /* compiled from: UnfoldMoveFromCenterAnimator.kt */
    /* loaded from: classes.dex */
    public static final class AnimatedView {
        private float startTranslationX;
        private float startTranslationY;
        @NotNull
        private final WeakReference<View> view;

        public AnimatedView(@NotNull WeakReference<View> view, float f, float f2) {
            Intrinsics.checkNotNullParameter(view, "view");
            this.view = view;
            this.startTranslationX = f;
            this.startTranslationY = f2;
        }

        public /* synthetic */ AnimatedView(WeakReference weakReference, float f, float f2, int i, DefaultConstructorMarker defaultConstructorMarker) {
            this(weakReference, (i & 2) != 0 ? 0.0f : f, (i & 4) != 0 ? 0.0f : f2);
        }

        public final void setStartTranslationX(float f) {
            this.startTranslationX = f;
        }

        public final void setStartTranslationY(float f) {
            this.startTranslationY = f;
        }

        public final float getStartTranslationX() {
            return this.startTranslationX;
        }

        public final float getStartTranslationY() {
            return this.startTranslationY;
        }

        @NotNull
        public final WeakReference<View> getView() {
            return this.view;
        }
    }

    public /* synthetic */ UnfoldMoveFromCenterAnimator(WindowManager windowManager, TranslationApplier translationApplier, ViewCenterProvider viewCenterProvider, AlphaProvider alphaProvider, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(windowManager, (i & 2) != 0 ? new TranslationApplier() { // from class: com.android.systemui.shared.animation.UnfoldMoveFromCenterAnimator.1
            @Override // com.android.systemui.shared.animation.UnfoldMoveFromCenterAnimator.TranslationApplier
            public void apply(@NotNull View view, float f, float f2) {
                TranslationApplier.DefaultImpls.apply(this, view, f, f2);
            }
        } : translationApplier, (i & 4) != 0 ? new ViewCenterProvider() { // from class: com.android.systemui.shared.animation.UnfoldMoveFromCenterAnimator.2
            @Override // com.android.systemui.shared.animation.UnfoldMoveFromCenterAnimator.ViewCenterProvider
            public void getViewCenter(@NotNull View view, @NotNull Point point) {
                ViewCenterProvider.DefaultImpls.getViewCenter(this, view, point);
            }
        } : viewCenterProvider, (i & 8) != 0 ? null : alphaProvider);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionFinished() {
        UnfoldTransitionProgressProvider.TransitionProgressListener.DefaultImpls.onTransitionFinished(this);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionStarted() {
        UnfoldTransitionProgressProvider.TransitionProgressListener.DefaultImpls.onTransitionStarted(this);
    }
}
