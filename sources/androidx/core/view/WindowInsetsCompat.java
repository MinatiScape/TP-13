package androidx.core.view;

import android.view.DisplayCutout;
import android.view.View;
import android.view.WindowInsets;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import java.util.Objects;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class WindowInsetsCompat {
    public static final WindowInsetsCompat CONSUMED = Impl30.CONSUMED;
    public final Impl mImpl;

    /* loaded from: classes.dex */
    public static class BuilderImpl {
        public final WindowInsetsCompat mInsets;

        public BuilderImpl() {
            this(new WindowInsetsCompat((WindowInsetsCompat) null));
        }

        public final void applyInsetTypes() {
        }

        public WindowInsetsCompat build() {
            throw null;
        }

        public BuilderImpl(WindowInsetsCompat insets) {
            this.mInsets = insets;
        }
    }

    /* loaded from: classes.dex */
    public static class BuilderImpl30 extends BuilderImpl29 {
        public BuilderImpl30() {
        }

        public BuilderImpl30(WindowInsetsCompat insets) {
            super(insets);
        }
    }

    /* loaded from: classes.dex */
    public static class Impl {
        public static final WindowInsetsCompat CONSUMED = new BuilderImpl30().build().mImpl.consumeDisplayCutout().mImpl.consumeStableInsets().consumeSystemWindowInsets();
        public final WindowInsetsCompat mHost;

        public Impl(WindowInsetsCompat host) {
            this.mHost = host;
        }

        public WindowInsetsCompat consumeDisplayCutout() {
            return this.mHost;
        }

        public WindowInsetsCompat consumeStableInsets() {
            return this.mHost;
        }

        public WindowInsetsCompat consumeSystemWindowInsets() {
            return this.mHost;
        }

        public void copyRootViewBounds(View rootView) {
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (!(o instanceof Impl)) {
                return false;
            }
            Impl impl = (Impl) o;
            return isRound() == impl.isRound() && isConsumed() == impl.isConsumed() && Objects.equals(getSystemWindowInsets(), impl.getSystemWindowInsets()) && Objects.equals(getStableInsets(), impl.getStableInsets()) && Objects.equals(getDisplayCutout(), impl.getDisplayCutout());
        }

        public DisplayCutoutCompat getDisplayCutout() {
            return null;
        }

        public Insets getMandatorySystemGestureInsets() {
            return getSystemWindowInsets();
        }

        public Insets getStableInsets() {
            return Insets.NONE;
        }

        public Insets getSystemWindowInsets() {
            return Insets.NONE;
        }

        public int hashCode() {
            return Objects.hash(Boolean.valueOf(isRound()), Boolean.valueOf(isConsumed()), getSystemWindowInsets(), getStableInsets(), getDisplayCutout());
        }

        public WindowInsetsCompat inset(int left, int top, int right, int bottom) {
            return CONSUMED;
        }

        public boolean isConsumed() {
            return false;
        }

        public boolean isRound() {
            return false;
        }

        public void setOverriddenInsets(Insets[] insetsTypeMask) {
        }

        public void setRootWindowInsets(WindowInsetsCompat rootWindowInsets) {
        }
    }

    /* loaded from: classes.dex */
    public static class Impl20 extends Impl {
        public Insets[] mOverriddenInsets;
        public final WindowInsets mPlatformInsets;
        public Insets mRootViewVisibleInsets;
        public WindowInsetsCompat mRootWindowInsets;
        public Insets mSystemWindowInsets = null;

        public Impl20(WindowInsetsCompat host, WindowInsets insets) {
            super(host);
            this.mPlatformInsets = insets;
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public void copyRootViewBounds(View rootView) {
            Insets visibleInsets = getVisibleInsets(rootView);
            if (visibleInsets == null) {
                visibleInsets = Insets.NONE;
            }
            setRootViewData(visibleInsets);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public boolean equals(Object o) {
            if (!super.equals(o)) {
                return false;
            }
            return Objects.equals(this.mRootViewVisibleInsets, ((Impl20) o).mRootViewVisibleInsets);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public final Insets getSystemWindowInsets() {
            if (this.mSystemWindowInsets == null) {
                this.mSystemWindowInsets = Insets.of(this.mPlatformInsets.getSystemWindowInsetLeft(), this.mPlatformInsets.getSystemWindowInsetTop(), this.mPlatformInsets.getSystemWindowInsetRight(), this.mPlatformInsets.getSystemWindowInsetBottom());
            }
            return this.mSystemWindowInsets;
        }

        public final Insets getVisibleInsets(View rootView) {
            throw new UnsupportedOperationException("getVisibleInsets() should not be called on API >= 30. Use WindowInsets.isVisible() instead.");
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public WindowInsetsCompat inset(int left, int top, int right, int bottom) {
            BuilderImpl30 builderImpl30 = new BuilderImpl30(WindowInsetsCompat.toWindowInsetsCompat(this.mPlatformInsets));
            builderImpl30.setSystemWindowInsets(WindowInsetsCompat.insetInsets(getSystemWindowInsets(), left, top, right, bottom));
            builderImpl30.setStableInsets(WindowInsetsCompat.insetInsets(getStableInsets(), left, top, right, bottom));
            return builderImpl30.build();
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public boolean isRound() {
            return this.mPlatformInsets.isRound();
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public void setOverriddenInsets(Insets[] insetsTypeMask) {
            this.mOverriddenInsets = insetsTypeMask;
        }

        public void setRootViewData(Insets visibleInsets) {
            this.mRootViewVisibleInsets = visibleInsets;
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public void setRootWindowInsets(WindowInsetsCompat rootWindowInsets) {
            this.mRootWindowInsets = rootWindowInsets;
        }
    }

    /* loaded from: classes.dex */
    public static class Impl21 extends Impl20 {
        public Insets mStableInsets = null;

        public Impl21(WindowInsetsCompat host, WindowInsets insets) {
            super(host, insets);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public WindowInsetsCompat consumeStableInsets() {
            return WindowInsetsCompat.toWindowInsetsCompat(this.mPlatformInsets.consumeStableInsets());
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public WindowInsetsCompat consumeSystemWindowInsets() {
            return WindowInsetsCompat.toWindowInsetsCompat(this.mPlatformInsets.consumeSystemWindowInsets());
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public final Insets getStableInsets() {
            if (this.mStableInsets == null) {
                this.mStableInsets = Insets.of(this.mPlatformInsets.getStableInsetLeft(), this.mPlatformInsets.getStableInsetTop(), this.mPlatformInsets.getStableInsetRight(), this.mPlatformInsets.getStableInsetBottom());
            }
            return this.mStableInsets;
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public boolean isConsumed() {
            return this.mPlatformInsets.isConsumed();
        }
    }

    /* loaded from: classes.dex */
    public static class Impl28 extends Impl21 {
        public Impl28(WindowInsetsCompat host, WindowInsets insets) {
            super(host, insets);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public WindowInsetsCompat consumeDisplayCutout() {
            return WindowInsetsCompat.toWindowInsetsCompat(this.mPlatformInsets.consumeDisplayCutout());
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl20, androidx.core.view.WindowInsetsCompat.Impl
        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (!(o instanceof Impl28)) {
                return false;
            }
            Impl28 impl28 = (Impl28) o;
            return Objects.equals(this.mPlatformInsets, impl28.mPlatformInsets) && Objects.equals(this.mRootViewVisibleInsets, impl28.mRootViewVisibleInsets);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public DisplayCutoutCompat getDisplayCutout() {
            DisplayCutout displayCutout = this.mPlatformInsets.getDisplayCutout();
            if (displayCutout == null) {
                return null;
            }
            return new DisplayCutoutCompat(displayCutout);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public int hashCode() {
            return this.mPlatformInsets.hashCode();
        }
    }

    /* loaded from: classes.dex */
    public static class Impl29 extends Impl28 {
        public Insets mSystemGestureInsets = null;
        public Insets mMandatorySystemGestureInsets = null;
        public Insets mTappableElementInsets = null;

        public Impl29(WindowInsetsCompat host, WindowInsets insets) {
            super(host, insets);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public Insets getMandatorySystemGestureInsets() {
            if (this.mMandatorySystemGestureInsets == null) {
                this.mMandatorySystemGestureInsets = Insets.toCompatInsets(this.mPlatformInsets.getMandatorySystemGestureInsets());
            }
            return this.mMandatorySystemGestureInsets;
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl20, androidx.core.view.WindowInsetsCompat.Impl
        public WindowInsetsCompat inset(int left, int top, int right, int bottom) {
            return WindowInsetsCompat.toWindowInsetsCompat(this.mPlatformInsets.inset(left, top, right, bottom));
        }
    }

    /* loaded from: classes.dex */
    public static class Impl30 extends Impl29 {
        public static final WindowInsetsCompat CONSUMED = WindowInsetsCompat.toWindowInsetsCompat(WindowInsets.CONSUMED);

        public Impl30(WindowInsetsCompat host, WindowInsets insets) {
            super(host, insets);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl20, androidx.core.view.WindowInsetsCompat.Impl
        public final void copyRootViewBounds(View rootView) {
        }
    }

    public WindowInsetsCompat(WindowInsets insets) {
        this.mImpl = new Impl30(this, insets);
    }

    public static Insets insetInsets(Insets insets, int left, int top, int right, int bottom) {
        int max = Math.max(0, insets.left - left);
        int max2 = Math.max(0, insets.top - top);
        int max3 = Math.max(0, insets.right - right);
        int max4 = Math.max(0, insets.bottom - bottom);
        return (max == left && max2 == top && max3 == right && max4 == bottom) ? insets : Insets.of(max, max2, max3, max4);
    }

    public static WindowInsetsCompat toWindowInsetsCompat(WindowInsets insets) {
        return toWindowInsetsCompat(insets, null);
    }

    @Deprecated
    public WindowInsetsCompat consumeSystemWindowInsets() {
        return this.mImpl.consumeSystemWindowInsets();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof WindowInsetsCompat)) {
            return false;
        }
        return Objects.equals(this.mImpl, ((WindowInsetsCompat) o).mImpl);
    }

    @Deprecated
    public int getSystemWindowInsetBottom() {
        return this.mImpl.getSystemWindowInsets().bottom;
    }

    @Deprecated
    public int getSystemWindowInsetLeft() {
        return this.mImpl.getSystemWindowInsets().left;
    }

    @Deprecated
    public int getSystemWindowInsetRight() {
        return this.mImpl.getSystemWindowInsets().right;
    }

    @Deprecated
    public int getSystemWindowInsetTop() {
        return this.mImpl.getSystemWindowInsets().top;
    }

    public int hashCode() {
        Impl impl = this.mImpl;
        if (impl == null) {
            return 0;
        }
        return impl.hashCode();
    }

    public boolean isConsumed() {
        return this.mImpl.isConsumed();
    }

    public WindowInsets toWindowInsets() {
        Impl impl = this.mImpl;
        if (impl instanceof Impl20) {
            return ((Impl20) impl).mPlatformInsets;
        }
        return null;
    }

    /* loaded from: classes.dex */
    public static class BuilderImpl29 extends BuilderImpl {
        public final WindowInsets.Builder mPlatBuilder;

        public BuilderImpl29() {
            this.mPlatBuilder = new WindowInsets.Builder();
        }

        @Override // androidx.core.view.WindowInsetsCompat.BuilderImpl
        public WindowInsetsCompat build() {
            applyInsetTypes();
            WindowInsetsCompat windowInsetsCompat = WindowInsetsCompat.toWindowInsetsCompat(this.mPlatBuilder.build());
            windowInsetsCompat.mImpl.setOverriddenInsets(null);
            return windowInsetsCompat;
        }

        public void setStableInsets(Insets insets) {
            this.mPlatBuilder.setStableInsets(insets.toPlatformInsets());
        }

        public void setSystemWindowInsets(Insets insets) {
            this.mPlatBuilder.setSystemWindowInsets(insets.toPlatformInsets());
        }

        public BuilderImpl29(WindowInsetsCompat insets) {
            super(insets);
            WindowInsets.Builder builder;
            WindowInsets windowInsets = insets.toWindowInsets();
            if (windowInsets != null) {
                builder = new WindowInsets.Builder(windowInsets);
            } else {
                builder = new WindowInsets.Builder();
            }
            this.mPlatBuilder = builder;
        }
    }

    public static WindowInsetsCompat toWindowInsetsCompat(WindowInsets insets, View view) {
        Objects.requireNonNull(insets);
        WindowInsetsCompat windowInsetsCompat = new WindowInsetsCompat(insets);
        if (view != null && view.isAttachedToWindow()) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            windowInsetsCompat.mImpl.setRootWindowInsets(ViewCompat.Api23Impl.getRootWindowInsets(view));
            windowInsetsCompat.mImpl.copyRootViewBounds(view.getRootView());
        }
        return windowInsetsCompat;
    }

    public WindowInsetsCompat(final WindowInsetsCompat src) {
        this.mImpl = new Impl(this);
    }
}
