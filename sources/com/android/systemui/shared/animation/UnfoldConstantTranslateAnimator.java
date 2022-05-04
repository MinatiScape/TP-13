package com.android.systemui.shared.animation;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.view.View;
import android.view.ViewGroup;
import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: UnfoldConstantTranslateAnimator.kt */
/* loaded from: classes.dex */
public final class UnfoldConstantTranslateAnimator implements UnfoldTransitionProgressProvider.TransitionProgressListener {
    @NotNull
    private final UnfoldTransitionProgressProvider progressProvider;
    private ViewGroup rootView;
    private float translationMax;
    @NotNull
    private final Set<ViewIdToTranslate> viewsIdToTranslate;
    @NotNull
    private List<ViewToTranslate> viewsToTranslate = EmptyList.INSTANCE;

    /* compiled from: UnfoldConstantTranslateAnimator.kt */
    /* loaded from: classes.dex */
    public static final class ViewIdToTranslate {
        @NotNull
        private final Direction direction;
        @NotNull
        private final Function0<Boolean> shouldBeAnimated;
        private final int viewId;

        /* compiled from: UnfoldConstantTranslateAnimator.kt */
        /* renamed from: com.android.systemui.shared.animation.UnfoldConstantTranslateAnimator$ViewIdToTranslate$1  reason: invalid class name */
        /* loaded from: classes.dex */
        public static final class AnonymousClass1 extends Lambda implements Function0<Boolean> {
            public static final AnonymousClass1 INSTANCE = new AnonymousClass1();

            public AnonymousClass1() {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final Boolean invoke() {
                return Boolean.TRUE;
            }
        }

        public ViewIdToTranslate(int i, @NotNull Direction direction, @NotNull Function0<Boolean> shouldBeAnimated) {
            Intrinsics.checkNotNullParameter(direction, "direction");
            Intrinsics.checkNotNullParameter(shouldBeAnimated, "shouldBeAnimated");
            this.viewId = i;
            this.direction = direction;
            this.shouldBeAnimated = shouldBeAnimated;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ ViewIdToTranslate copy$default(ViewIdToTranslate viewIdToTranslate, int i, Direction direction, Function0 function0, int i2, Object obj) {
            if ((i2 & 1) != 0) {
                i = viewIdToTranslate.viewId;
            }
            if ((i2 & 2) != 0) {
                direction = viewIdToTranslate.direction;
            }
            if ((i2 & 4) != 0) {
                function0 = viewIdToTranslate.shouldBeAnimated;
            }
            return viewIdToTranslate.copy(i, direction, function0);
        }

        public final int component1() {
            return this.viewId;
        }

        @NotNull
        public final Direction component2() {
            return this.direction;
        }

        @NotNull
        public final Function0<Boolean> component3() {
            return this.shouldBeAnimated;
        }

        @NotNull
        public final ViewIdToTranslate copy(int i, @NotNull Direction direction, @NotNull Function0<Boolean> shouldBeAnimated) {
            Intrinsics.checkNotNullParameter(direction, "direction");
            Intrinsics.checkNotNullParameter(shouldBeAnimated, "shouldBeAnimated");
            return new ViewIdToTranslate(i, direction, shouldBeAnimated);
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ViewIdToTranslate)) {
                return false;
            }
            ViewIdToTranslate viewIdToTranslate = (ViewIdToTranslate) obj;
            return this.viewId == viewIdToTranslate.viewId && this.direction == viewIdToTranslate.direction && Intrinsics.areEqual(this.shouldBeAnimated, viewIdToTranslate.shouldBeAnimated);
        }

        public int hashCode() {
            int hashCode = this.direction.hashCode();
            return this.shouldBeAnimated.hashCode() + ((hashCode + (Integer.hashCode(this.viewId) * 31)) * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ViewIdToTranslate(viewId=");
            m.append(this.viewId);
            m.append(", direction=");
            m.append(this.direction);
            m.append(", shouldBeAnimated=");
            m.append(this.shouldBeAnimated);
            m.append(')');
            return m.toString();
        }

        public /* synthetic */ ViewIdToTranslate(int i, Direction direction, Function0 function0, int i2, DefaultConstructorMarker defaultConstructorMarker) {
            this(i, direction, (i2 & 4) != 0 ? AnonymousClass1.INSTANCE : function0);
        }

        @NotNull
        public final Direction getDirection() {
            return this.direction;
        }

        @NotNull
        public final Function0<Boolean> getShouldBeAnimated() {
            return this.shouldBeAnimated;
        }

        public final int getViewId() {
            return this.viewId;
        }
    }

    /* compiled from: UnfoldConstantTranslateAnimator.kt */
    /* loaded from: classes.dex */
    public static final class ViewToTranslate {
        @NotNull
        private final Direction direction;
        @NotNull
        private final Function0<Boolean> shouldBeAnimated;
        @NotNull
        private final WeakReference<View> view;

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ ViewToTranslate copy$default(ViewToTranslate viewToTranslate, WeakReference weakReference, Direction direction, Function0 function0, int i, Object obj) {
            if ((i & 1) != 0) {
                weakReference = viewToTranslate.view;
            }
            if ((i & 2) != 0) {
                direction = viewToTranslate.direction;
            }
            if ((i & 4) != 0) {
                function0 = viewToTranslate.shouldBeAnimated;
            }
            return viewToTranslate.copy(weakReference, direction, function0);
        }

        @NotNull
        public final WeakReference<View> component1() {
            return this.view;
        }

        @NotNull
        public final Direction component2() {
            return this.direction;
        }

        @NotNull
        public final Function0<Boolean> component3() {
            return this.shouldBeAnimated;
        }

        @NotNull
        public final ViewToTranslate copy(@NotNull WeakReference<View> view, @NotNull Direction direction, @NotNull Function0<Boolean> shouldBeAnimated) {
            Intrinsics.checkNotNullParameter(view, "view");
            Intrinsics.checkNotNullParameter(direction, "direction");
            Intrinsics.checkNotNullParameter(shouldBeAnimated, "shouldBeAnimated");
            return new ViewToTranslate(view, direction, shouldBeAnimated);
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ViewToTranslate)) {
                return false;
            }
            ViewToTranslate viewToTranslate = (ViewToTranslate) obj;
            return Intrinsics.areEqual(this.view, viewToTranslate.view) && this.direction == viewToTranslate.direction && Intrinsics.areEqual(this.shouldBeAnimated, viewToTranslate.shouldBeAnimated);
        }

        public int hashCode() {
            int hashCode = this.direction.hashCode();
            return this.shouldBeAnimated.hashCode() + ((hashCode + (this.view.hashCode() * 31)) * 31);
        }

        public ViewToTranslate(@NotNull WeakReference<View> view, @NotNull Direction direction, @NotNull Function0<Boolean> shouldBeAnimated) {
            Intrinsics.checkNotNullParameter(view, "view");
            Intrinsics.checkNotNullParameter(direction, "direction");
            Intrinsics.checkNotNullParameter(shouldBeAnimated, "shouldBeAnimated");
            this.view = view;
            this.direction = direction;
            this.shouldBeAnimated = shouldBeAnimated;
        }

        @NotNull
        public String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ViewToTranslate(view=");
            m.append(this.view);
            m.append(", direction=");
            m.append(this.direction);
            m.append(", shouldBeAnimated=");
            m.append(this.shouldBeAnimated);
            m.append(')');
            return m.toString();
        }

        @NotNull
        public final Direction getDirection() {
            return this.direction;
        }

        @NotNull
        public final Function0<Boolean> getShouldBeAnimated() {
            return this.shouldBeAnimated;
        }

        @NotNull
        public final WeakReference<View> getView() {
            return this.view;
        }
    }

    /* compiled from: UnfoldConstantTranslateAnimator.kt */
    /* loaded from: classes.dex */
    public enum Direction {
        LEFT(-1.0f),
        RIGHT(1.0f);
        
        private final float multiplier;

        Direction(float f) {
            this.multiplier = f;
        }

        public final float getMultiplier() {
            return this.multiplier;
        }
    }

    public UnfoldConstantTranslateAnimator(@NotNull Set<ViewIdToTranslate> viewsIdToTranslate, @NotNull UnfoldTransitionProgressProvider progressProvider) {
        Intrinsics.checkNotNullParameter(viewsIdToTranslate, "viewsIdToTranslate");
        Intrinsics.checkNotNullParameter(progressProvider, "progressProvider");
        this.viewsIdToTranslate = viewsIdToTranslate;
        this.progressProvider = progressProvider;
    }

    private final void registerViewsForAnimation(ViewGroup viewGroup, Set<ViewIdToTranslate> set) {
        ViewToTranslate viewToTranslate;
        ArrayList arrayList = new ArrayList();
        for (ViewIdToTranslate viewIdToTranslate : set) {
            int component1 = viewIdToTranslate.component1();
            Direction component2 = viewIdToTranslate.component2();
            Function0<Boolean> component3 = viewIdToTranslate.component3();
            View findViewById = viewGroup.findViewById(component1);
            if (findViewById == null) {
                viewToTranslate = null;
            } else {
                viewToTranslate = new ViewToTranslate(new WeakReference(findViewById), component2, component3);
            }
            if (viewToTranslate != null) {
                arrayList.add(viewToTranslate);
            }
        }
        this.viewsToTranslate = arrayList;
    }

    private final void translateViews(float f) {
        View view;
        float f2 = (f - 1.0f) * this.translationMax;
        for (ViewToTranslate viewToTranslate : this.viewsToTranslate) {
            WeakReference<View> component1 = viewToTranslate.component1();
            Direction component2 = viewToTranslate.component2();
            if (viewToTranslate.component3().invoke().booleanValue() && (view = component1.get()) != null) {
                view.setTranslationX(component2.getMultiplier() * f2);
            }
        }
    }

    public final void init(@NotNull ViewGroup rootView, float f) {
        Intrinsics.checkNotNullParameter(rootView, "rootView");
        this.rootView = rootView;
        this.translationMax = f;
        this.progressProvider.addCallback(this);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionFinished() {
        translateViews(1.0f);
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionStarted() {
        ViewGroup viewGroup = this.rootView;
        if (viewGroup != null) {
            registerViewsForAnimation(viewGroup, this.viewsIdToTranslate);
        } else {
            Intrinsics.throwUninitializedPropertyAccessException("rootView");
            throw null;
        }
    }

    @Override // com.android.systemui.unfold.UnfoldTransitionProgressProvider.TransitionProgressListener
    public void onTransitionProgress(float f) {
        translateViews(f);
    }
}
