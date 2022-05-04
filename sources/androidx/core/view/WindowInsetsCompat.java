package androidx.core.view;

import android.annotation.SuppressLint;
import android.view.DisplayCutout;
import android.view.View;
import android.view.WindowInsets;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import java.util.Objects;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class WindowInsetsCompat {
    public static final WindowInsetsCompat CONSUMED = Impl30.CONSUMED;
    public final Impl mImpl;

    /* loaded from: classes.dex */
    public static class BuilderImpl {
        public final WindowInsetsCompat mInsets;

        public BuilderImpl() {
            this(new WindowInsetsCompat());
        }

        public final void applyInsetTypes() {
        }

        public WindowInsetsCompat build() {
            throw null;
        }

        public void setStableInsets(Insets insets) {
            throw null;
        }

        public void setSystemWindowInsets(Insets insets) {
            throw null;
        }

        public BuilderImpl(WindowInsetsCompat windowInsetsCompat) {
            this.mInsets = windowInsetsCompat;
        }
    }

    /* loaded from: classes.dex */
    public static class BuilderImpl29 extends BuilderImpl {
        public final WindowInsets.Builder mPlatBuilder;

        public BuilderImpl29() {
            this.mPlatBuilder = new WindowInsets.Builder();
        }

        @Override // androidx.core.view.WindowInsetsCompat.BuilderImpl
        public void setStableInsets(Insets insets) {
            this.mPlatBuilder.setStableInsets(insets.toPlatformInsets());
        }

        @Override // androidx.core.view.WindowInsetsCompat.BuilderImpl
        public void setSystemWindowInsets(Insets insets) {
            this.mPlatBuilder.setSystemWindowInsets(insets.toPlatformInsets());
        }

        public BuilderImpl29(WindowInsetsCompat windowInsetsCompat) {
            super(windowInsetsCompat);
            WindowInsets.Builder builder;
            WindowInsets windowInsets = windowInsetsCompat.toWindowInsets();
            if (windowInsets != null) {
                builder = new WindowInsets.Builder(windowInsets);
            } else {
                builder = new WindowInsets.Builder();
            }
            this.mPlatBuilder = builder;
        }

        @Override // androidx.core.view.WindowInsetsCompat.BuilderImpl
        public WindowInsetsCompat build() {
            applyInsetTypes();
            WindowInsetsCompat windowInsetsCompat = WindowInsetsCompat.toWindowInsetsCompat(this.mPlatBuilder.build(), null);
            windowInsetsCompat.mImpl.setOverriddenInsets(null);
            return windowInsetsCompat;
        }
    }

    /* loaded from: classes.dex */
    public static class BuilderImpl30 extends BuilderImpl29 {
        public BuilderImpl30() {
        }

        public BuilderImpl30(WindowInsetsCompat windowInsetsCompat) {
            super(windowInsetsCompat);
        }
    }

    /* loaded from: classes.dex */
    public static class Impl20 extends Impl {
        public Insets[] mOverriddenInsets;
        public final WindowInsets mPlatformInsets;
        public Insets mRootViewVisibleInsets;
        public WindowInsetsCompat mRootWindowInsets;
        public Insets mSystemWindowInsets = null;

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public Insets getInsets(int i) {
            return getInsets(i, false);
        }

        public Insets getInsetsForType(int i, boolean z) {
            int i2;
            DisplayCutoutCompat displayCutoutCompat;
            if (i != 1) {
                Insets insets = null;
                if (i != 2) {
                    if (i == 8) {
                        Insets[] insetsArr = this.mOverriddenInsets;
                        if (insetsArr != null) {
                            insets = insetsArr[3];
                        }
                        if (insets != null) {
                            return insets;
                        }
                        Insets systemWindowInsets = getSystemWindowInsets();
                        Insets rootStableInsets = getRootStableInsets();
                        int i3 = systemWindowInsets.bottom;
                        if (i3 > rootStableInsets.bottom) {
                            return Insets.of(0, 0, 0, i3);
                        }
                        Insets insets2 = this.mRootViewVisibleInsets;
                        if (insets2 == null || insets2.equals(Insets.NONE) || (i2 = this.mRootViewVisibleInsets.bottom) <= rootStableInsets.bottom) {
                            return Insets.NONE;
                        }
                        return Insets.of(0, 0, 0, i2);
                    } else if (i == 16) {
                        return getSystemGestureInsets();
                    } else {
                        if (i == 32) {
                            return getMandatorySystemGestureInsets();
                        }
                        if (i == 64) {
                            return getTappableElementInsets();
                        }
                        if (i != 128) {
                            return Insets.NONE;
                        }
                        WindowInsetsCompat windowInsetsCompat = this.mRootWindowInsets;
                        if (windowInsetsCompat != null) {
                            displayCutoutCompat = windowInsetsCompat.mImpl.getDisplayCutout();
                        } else {
                            displayCutoutCompat = getDisplayCutout();
                        }
                        if (displayCutoutCompat != null) {
                            return Insets.of(((DisplayCutout) displayCutoutCompat.mDisplayCutout).getSafeInsetLeft(), ((DisplayCutout) displayCutoutCompat.mDisplayCutout).getSafeInsetTop(), ((DisplayCutout) displayCutoutCompat.mDisplayCutout).getSafeInsetRight(), ((DisplayCutout) displayCutoutCompat.mDisplayCutout).getSafeInsetBottom());
                        }
                        return Insets.NONE;
                    }
                } else if (z) {
                    Insets rootStableInsets2 = getRootStableInsets();
                    Insets stableInsets = getStableInsets();
                    return Insets.of(Math.max(rootStableInsets2.left, stableInsets.left), 0, Math.max(rootStableInsets2.right, stableInsets.right), Math.max(rootStableInsets2.bottom, stableInsets.bottom));
                } else {
                    Insets systemWindowInsets2 = getSystemWindowInsets();
                    WindowInsetsCompat windowInsetsCompat2 = this.mRootWindowInsets;
                    if (windowInsetsCompat2 != null) {
                        insets = windowInsetsCompat2.mImpl.getStableInsets();
                    }
                    int i4 = systemWindowInsets2.bottom;
                    if (insets != null) {
                        i4 = Math.min(i4, insets.bottom);
                    }
                    return Insets.of(systemWindowInsets2.left, 0, systemWindowInsets2.right, i4);
                }
            } else if (z) {
                return Insets.of(0, Math.max(getRootStableInsets().top, getSystemWindowInsets().top), 0, 0);
            } else {
                return Insets.of(0, getSystemWindowInsets().top, 0, 0);
            }
        }

        @SuppressLint({"WrongConstant"})
        private Insets getInsets(int i, boolean z) {
            Insets insets = Insets.NONE;
            for (int i2 = 1; i2 <= 256; i2 <<= 1) {
                if ((i & i2) != 0) {
                    Insets insetsForType = getInsetsForType(i2, z);
                    insets = Insets.of(Math.max(insets.left, insetsForType.left), Math.max(insets.top, insetsForType.top), Math.max(insets.right, insetsForType.right), Math.max(insets.bottom, insetsForType.bottom));
                }
            }
            return insets;
        }

        private Insets getRootStableInsets() {
            WindowInsetsCompat windowInsetsCompat = this.mRootWindowInsets;
            if (windowInsetsCompat != null) {
                return windowInsetsCompat.mImpl.getStableInsets();
            }
            return Insets.NONE;
        }

        private Insets getVisibleInsets(View view) {
            throw new UnsupportedOperationException("getVisibleInsets() should not be called on API >= 30. Use WindowInsets.isVisible() instead.");
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public final Insets getSystemWindowInsets() {
            if (this.mSystemWindowInsets == null) {
                this.mSystemWindowInsets = Insets.of(this.mPlatformInsets.getSystemWindowInsetLeft(), this.mPlatformInsets.getSystemWindowInsetTop(), this.mPlatformInsets.getSystemWindowInsetRight(), this.mPlatformInsets.getSystemWindowInsetBottom());
            }
            return this.mSystemWindowInsets;
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public WindowInsetsCompat inset(int i, int i2, int i3, int i4) {
            BuilderImpl30 builderImpl30 = new BuilderImpl30(WindowInsetsCompat.toWindowInsetsCompat(this.mPlatformInsets, null));
            builderImpl30.setSystemWindowInsets(WindowInsetsCompat.insetInsets(getSystemWindowInsets(), i, i2, i3, i4));
            builderImpl30.setStableInsets(WindowInsetsCompat.insetInsets(getStableInsets(), i, i2, i3, i4));
            return builderImpl30.build();
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public boolean isRound() {
            return this.mPlatformInsets.isRound();
        }

        public Impl20(WindowInsetsCompat windowInsetsCompat, WindowInsets windowInsets) {
            super(windowInsetsCompat);
            this.mPlatformInsets = windowInsets;
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public void copyRootViewBounds(View view) {
            Insets visibleInsets = getVisibleInsets(view);
            if (visibleInsets == null) {
                visibleInsets = Insets.NONE;
            }
            setRootViewData(visibleInsets);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public boolean equals(Object obj) {
            if (!super.equals(obj)) {
                return false;
            }
            return Objects.equals(this.mRootViewVisibleInsets, ((Impl20) obj).mRootViewVisibleInsets);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public void setOverriddenInsets(Insets[] insetsArr) {
            this.mOverriddenInsets = insetsArr;
        }

        public void setRootViewData(Insets insets) {
            this.mRootViewVisibleInsets = insets;
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public void setRootWindowInsets(WindowInsetsCompat windowInsetsCompat) {
            this.mRootWindowInsets = windowInsetsCompat;
        }
    }

    /* loaded from: classes.dex */
    public static class Impl21 extends Impl20 {
        public Insets mStableInsets = null;

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public WindowInsetsCompat consumeStableInsets() {
            return WindowInsetsCompat.toWindowInsetsCompat(this.mPlatformInsets.consumeStableInsets(), null);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public WindowInsetsCompat consumeSystemWindowInsets() {
            return WindowInsetsCompat.toWindowInsetsCompat(this.mPlatformInsets.consumeSystemWindowInsets(), null);
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

        public Impl21(WindowInsetsCompat windowInsetsCompat, WindowInsets windowInsets) {
            super(windowInsetsCompat, windowInsets);
        }
    }

    /* loaded from: classes.dex */
    public static class Impl28 extends Impl21 {
        @Override // androidx.core.view.WindowInsetsCompat.Impl20, androidx.core.view.WindowInsetsCompat.Impl
        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Impl28)) {
                return false;
            }
            Impl28 impl28 = (Impl28) obj;
            return Objects.equals(this.mPlatformInsets, impl28.mPlatformInsets) && Objects.equals(this.mRootViewVisibleInsets, impl28.mRootViewVisibleInsets);
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public WindowInsetsCompat consumeDisplayCutout() {
            return WindowInsetsCompat.toWindowInsetsCompat(this.mPlatformInsets.consumeDisplayCutout(), null);
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

        public Impl28(WindowInsetsCompat windowInsetsCompat, WindowInsets windowInsets) {
            super(windowInsetsCompat, windowInsets);
        }
    }

    /* loaded from: classes.dex */
    public static class Impl29 extends Impl28 {
        public Insets mSystemGestureInsets = null;
        public Insets mMandatorySystemGestureInsets = null;
        public Insets mTappableElementInsets = null;

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public Insets getMandatorySystemGestureInsets() {
            if (this.mMandatorySystemGestureInsets == null) {
                this.mMandatorySystemGestureInsets = Insets.toCompatInsets(this.mPlatformInsets.getMandatorySystemGestureInsets());
            }
            return this.mMandatorySystemGestureInsets;
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public Insets getSystemGestureInsets() {
            if (this.mSystemGestureInsets == null) {
                this.mSystemGestureInsets = Insets.toCompatInsets(this.mPlatformInsets.getSystemGestureInsets());
            }
            return this.mSystemGestureInsets;
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl
        public Insets getTappableElementInsets() {
            if (this.mTappableElementInsets == null) {
                this.mTappableElementInsets = Insets.toCompatInsets(this.mPlatformInsets.getTappableElementInsets());
            }
            return this.mTappableElementInsets;
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl20, androidx.core.view.WindowInsetsCompat.Impl
        public WindowInsetsCompat inset(int i, int i2, int i3, int i4) {
            return WindowInsetsCompat.toWindowInsetsCompat(this.mPlatformInsets.inset(i, i2, i3, i4), null);
        }

        public Impl29(WindowInsetsCompat windowInsetsCompat, WindowInsets windowInsets) {
            super(windowInsetsCompat, windowInsets);
        }
    }

    /* loaded from: classes.dex */
    public static class Impl30 extends Impl29 {
        public static final WindowInsetsCompat CONSUMED = WindowInsetsCompat.toWindowInsetsCompat(WindowInsets.CONSUMED, null);

        @Override // androidx.core.view.WindowInsetsCompat.Impl20, androidx.core.view.WindowInsetsCompat.Impl
        public final void copyRootViewBounds(View view) {
        }

        @Override // androidx.core.view.WindowInsetsCompat.Impl20, androidx.core.view.WindowInsetsCompat.Impl
        public Insets getInsets(int i) {
            return Insets.toCompatInsets(this.mPlatformInsets.getInsets(TypeImpl30.toPlatformType(i)));
        }

        public Impl30(WindowInsetsCompat windowInsetsCompat, WindowInsets windowInsets) {
            super(windowInsetsCompat, windowInsets);
        }
    }

    /* loaded from: classes.dex */
    public static final class TypeImpl30 {
        public static int toPlatformType(int i) {
            int i2;
            int i3 = 0;
            for (int i4 = 1; i4 <= 256; i4 <<= 1) {
                if ((i & i4) != 0) {
                    if (i4 == 1) {
                        i2 = WindowInsets.Type.statusBars();
                    } else if (i4 == 2) {
                        i2 = WindowInsets.Type.navigationBars();
                    } else if (i4 == 4) {
                        i2 = WindowInsets.Type.captionBar();
                    } else if (i4 == 8) {
                        i2 = WindowInsets.Type.ime();
                    } else if (i4 == 16) {
                        i2 = WindowInsets.Type.systemGestures();
                    } else if (i4 == 32) {
                        i2 = WindowInsets.Type.mandatorySystemGestures();
                    } else if (i4 == 64) {
                        i2 = WindowInsets.Type.tappableElement();
                    } else if (i4 == 128) {
                        i2 = WindowInsets.Type.displayCutout();
                    }
                    i3 |= i2;
                }
            }
            return i3;
        }
    }

    public WindowInsetsCompat(WindowInsets windowInsets) {
        this.mImpl = new Impl30(this, windowInsets);
    }

    /* loaded from: classes.dex */
    public static class Impl {
        public static final WindowInsetsCompat CONSUMED = new BuilderImpl30().build().mImpl.consumeDisplayCutout().mImpl.consumeStableInsets().mImpl.consumeSystemWindowInsets();
        public final WindowInsetsCompat mHost;

        public void copyRootViewBounds(View view) {
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Impl)) {
                return false;
            }
            Impl impl = (Impl) obj;
            return isRound() == impl.isRound() && isConsumed() == impl.isConsumed() && Objects.equals(getSystemWindowInsets(), impl.getSystemWindowInsets()) && Objects.equals(getStableInsets(), impl.getStableInsets()) && Objects.equals(getDisplayCutout(), impl.getDisplayCutout());
        }

        public DisplayCutoutCompat getDisplayCutout() {
            return null;
        }

        public int hashCode() {
            return Objects.hash(Boolean.valueOf(isRound()), Boolean.valueOf(isConsumed()), getSystemWindowInsets(), getStableInsets(), getDisplayCutout());
        }

        public boolean isConsumed() {
            return false;
        }

        public boolean isRound() {
            return false;
        }

        public void setOverriddenInsets(Insets[] insetsArr) {
        }

        public void setRootWindowInsets(WindowInsetsCompat windowInsetsCompat) {
        }

        public Impl(WindowInsetsCompat windowInsetsCompat) {
            this.mHost = windowInsetsCompat;
        }

        public Insets getMandatorySystemGestureInsets() {
            return getSystemWindowInsets();
        }

        public Insets getSystemGestureInsets() {
            return getSystemWindowInsets();
        }

        public Insets getTappableElementInsets() {
            return getSystemWindowInsets();
        }

        public WindowInsetsCompat inset(int i, int i2, int i3, int i4) {
            return CONSUMED;
        }

        public Insets getInsets(int i) {
            return Insets.NONE;
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

        public Insets getStableInsets() {
            return Insets.NONE;
        }

        public Insets getSystemWindowInsets() {
            return Insets.NONE;
        }
    }

    public static Insets insetInsets(Insets insets, int i, int i2, int i3, int i4) {
        int max = Math.max(0, insets.left - i);
        int max2 = Math.max(0, insets.top - i2);
        int max3 = Math.max(0, insets.right - i3);
        int max4 = Math.max(0, insets.bottom - i4);
        if (max == i && max2 == i2 && max3 == i3 && max4 == i4) {
            return insets;
        }
        return Insets.of(max, max2, max3, max4);
    }

    public static WindowInsetsCompat toWindowInsetsCompat(WindowInsets windowInsets, View view) {
        windowInsets.getClass();
        WindowInsetsCompat windowInsetsCompat = new WindowInsetsCompat(windowInsets);
        if (view != null) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            if (ViewCompat.Api19Impl.isAttachedToWindow(view)) {
                windowInsetsCompat.mImpl.setRootWindowInsets(ViewCompat.Api23Impl.getRootWindowInsets(view));
                windowInsetsCompat.mImpl.copyRootViewBounds(view.getRootView());
            }
        }
        return windowInsetsCompat;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof WindowInsetsCompat)) {
            return false;
        }
        return Objects.equals(this.mImpl, ((WindowInsetsCompat) obj).mImpl);
    }

    @Deprecated
    public final int getSystemWindowInsetBottom() {
        return this.mImpl.getSystemWindowInsets().bottom;
    }

    @Deprecated
    public final int getSystemWindowInsetLeft() {
        return this.mImpl.getSystemWindowInsets().left;
    }

    @Deprecated
    public final int getSystemWindowInsetRight() {
        return this.mImpl.getSystemWindowInsets().right;
    }

    @Deprecated
    public final int getSystemWindowInsetTop() {
        return this.mImpl.getSystemWindowInsets().top;
    }

    public final int hashCode() {
        Impl impl = this.mImpl;
        if (impl == null) {
            return 0;
        }
        return impl.hashCode();
    }

    public final WindowInsets toWindowInsets() {
        Impl impl = this.mImpl;
        if (impl instanceof Impl20) {
            return ((Impl20) impl).mPlatformInsets;
        }
        return null;
    }

    public WindowInsetsCompat() {
        this.mImpl = new Impl(this);
    }
}
