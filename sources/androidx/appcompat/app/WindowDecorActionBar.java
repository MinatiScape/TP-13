package androidx.appcompat.app;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.TypedArray;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import androidx.appcompat.R$layout;
import androidx.appcompat.R$styleable;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatDelegateImpl;
import androidx.appcompat.app.WindowDecorActionBar;
import androidx.appcompat.view.ActionMode;
import androidx.appcompat.view.SupportMenuInflater;
import androidx.appcompat.view.ViewPropertyAnimatorCompatSet;
import androidx.appcompat.view.menu.MenuBuilder;
import androidx.appcompat.widget.ActionBarContainer;
import androidx.appcompat.widget.ActionBarContextView;
import androidx.appcompat.widget.ActionBarOverlayLayout;
import androidx.appcompat.widget.ActionMenuPresenter;
import androidx.appcompat.widget.DecorToolbar;
import androidx.appcompat.widget.Toolbar;
import androidx.appcompat.widget.ToolbarWidgetWrapper;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.ViewPropertyAnimatorUpdateListener;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class WindowDecorActionBar extends ActionBar implements ActionBarOverlayLayout.ActionBarVisibilityCallback {
    public static final AccelerateInterpolator sHideInterpolator = new AccelerateInterpolator();
    public static final DecelerateInterpolator sShowInterpolator = new DecelerateInterpolator();
    public ActionModeImpl mActionMode;
    public ActionBarContainer mContainerView;
    public View mContentView;
    public Context mContext;
    public ActionBarContextView mContextView;
    public ViewPropertyAnimatorCompatSet mCurrentShowAnim;
    public DecorToolbar mDecorToolbar;
    public ActionModeImpl mDeferredDestroyActionMode;
    public ActionMode.Callback mDeferredModeDestroyCallback;
    public boolean mDisplayHomeAsUpSet;
    public boolean mHasEmbeddedTabs;
    public boolean mHiddenBySystem;
    public boolean mHideOnContentScroll;
    public boolean mLastMenuVisibility;
    public ActionBarOverlayLayout mOverlayLayout;
    public boolean mShowHideAnimationEnabled;
    public boolean mShowingForMode;
    public Context mThemedContext;
    public ArrayList<ActionBar.OnMenuVisibilityListener> mMenuVisibilityListeners = new ArrayList<>();
    public int mCurWindowVisibility = 0;
    public boolean mContentAnimations = true;
    public boolean mNowShowing = true;
    public final AnonymousClass1 mHideListener = new AnonymousClass1();
    public final AnonymousClass2 mShowListener = new AnonymousClass2();
    public final AnonymousClass3 mUpdateListener = new AnonymousClass3();

    /* renamed from: androidx.appcompat.app.WindowDecorActionBar$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 extends R$layout {
        public AnonymousClass1() {
        }

        @Override // androidx.core.view.ViewPropertyAnimatorListener
        public final void onAnimationEnd() {
            View view;
            WindowDecorActionBar windowDecorActionBar = WindowDecorActionBar.this;
            if (windowDecorActionBar.mContentAnimations && (view = windowDecorActionBar.mContentView) != null) {
                view.setTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                WindowDecorActionBar.this.mContainerView.setTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            }
            WindowDecorActionBar.this.mContainerView.setVisibility(8);
            ActionBarContainer actionBarContainer = WindowDecorActionBar.this.mContainerView;
            actionBarContainer.mIsTransitioning = false;
            actionBarContainer.setDescendantFocusability(QuickStepContract.SYSUI_STATE_IME_SHOWING);
            WindowDecorActionBar windowDecorActionBar2 = WindowDecorActionBar.this;
            windowDecorActionBar2.mCurrentShowAnim = null;
            ActionMode.Callback callback = windowDecorActionBar2.mDeferredModeDestroyCallback;
            if (callback != null) {
                callback.onDestroyActionMode(windowDecorActionBar2.mDeferredDestroyActionMode);
                windowDecorActionBar2.mDeferredDestroyActionMode = null;
                windowDecorActionBar2.mDeferredModeDestroyCallback = null;
            }
            ActionBarOverlayLayout actionBarOverlayLayout = WindowDecorActionBar.this.mOverlayLayout;
            if (actionBarOverlayLayout != null) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api20Impl.requestApplyInsets(actionBarOverlayLayout);
            }
        }
    }

    /* renamed from: androidx.appcompat.app.WindowDecorActionBar$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass2 extends R$layout {
        public AnonymousClass2() {
        }

        @Override // androidx.core.view.ViewPropertyAnimatorListener
        public final void onAnimationEnd() {
            WindowDecorActionBar windowDecorActionBar = WindowDecorActionBar.this;
            windowDecorActionBar.mCurrentShowAnim = null;
            windowDecorActionBar.mContainerView.requestLayout();
        }
    }

    /* renamed from: androidx.appcompat.app.WindowDecorActionBar$3  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass3 implements ViewPropertyAnimatorUpdateListener {
        public AnonymousClass3() {
        }
    }

    /* loaded from: classes.dex */
    public class ActionModeImpl extends ActionMode implements MenuBuilder.Callback {
        public final Context mActionModeContext;
        public ActionMode.Callback mCallback;
        public WeakReference<View> mCustomView;
        public final MenuBuilder mMenu;

        @Override // androidx.appcompat.view.ActionMode
        public final void setSubtitle(CharSequence charSequence) {
            ActionBarContextView actionBarContextView = WindowDecorActionBar.this.mContextView;
            actionBarContextView.mSubtitle = charSequence;
            actionBarContextView.initTitle();
        }

        @Override // androidx.appcompat.view.ActionMode
        public final void setTitle(CharSequence charSequence) {
            ActionBarContextView actionBarContextView = WindowDecorActionBar.this.mContextView;
            actionBarContextView.mTitle = charSequence;
            actionBarContextView.initTitle();
            ViewCompat.setAccessibilityPaneTitle(actionBarContextView, charSequence);
        }

        public ActionModeImpl(Context context, AppCompatDelegateImpl.ActionModeCallbackWrapperV9 actionModeCallbackWrapperV9) {
            this.mActionModeContext = context;
            this.mCallback = actionModeCallbackWrapperV9;
            MenuBuilder menuBuilder = new MenuBuilder(context);
            menuBuilder.mDefaultShowAsAction = 1;
            this.mMenu = menuBuilder;
            menuBuilder.mCallback = this;
        }

        @Override // androidx.appcompat.view.ActionMode
        public final void finish() {
            WindowDecorActionBar windowDecorActionBar = WindowDecorActionBar.this;
            if (windowDecorActionBar.mActionMode == this) {
                if (!(!windowDecorActionBar.mHiddenBySystem)) {
                    windowDecorActionBar.mDeferredDestroyActionMode = this;
                    windowDecorActionBar.mDeferredModeDestroyCallback = this.mCallback;
                } else {
                    this.mCallback.onDestroyActionMode(this);
                }
                this.mCallback = null;
                WindowDecorActionBar.this.animateToMode(false);
                ActionBarContextView actionBarContextView = WindowDecorActionBar.this.mContextView;
                if (actionBarContextView.mClose == null) {
                    actionBarContextView.killMode();
                }
                WindowDecorActionBar windowDecorActionBar2 = WindowDecorActionBar.this;
                ActionBarOverlayLayout actionBarOverlayLayout = windowDecorActionBar2.mOverlayLayout;
                boolean z = windowDecorActionBar2.mHideOnContentScroll;
                if (z != actionBarOverlayLayout.mHideOnContentScroll) {
                    actionBarOverlayLayout.mHideOnContentScroll = z;
                    if (!z) {
                        actionBarOverlayLayout.haltActionBarHideOffsetAnimations();
                        actionBarOverlayLayout.haltActionBarHideOffsetAnimations();
                        actionBarOverlayLayout.mActionBarTop.setTranslationY(-Math.max(0, Math.min(0, actionBarOverlayLayout.mActionBarTop.getHeight())));
                    }
                }
                WindowDecorActionBar.this.mActionMode = null;
            }
        }

        @Override // androidx.appcompat.view.ActionMode
        public final View getCustomView() {
            WeakReference<View> weakReference = this.mCustomView;
            if (weakReference != null) {
                return weakReference.get();
            }
            return null;
        }

        @Override // androidx.appcompat.view.ActionMode
        public final MenuInflater getMenuInflater() {
            return new SupportMenuInflater(this.mActionModeContext);
        }

        @Override // androidx.appcompat.view.ActionMode
        public final CharSequence getSubtitle() {
            return WindowDecorActionBar.this.mContextView.mSubtitle;
        }

        @Override // androidx.appcompat.view.ActionMode
        public final CharSequence getTitle() {
            return WindowDecorActionBar.this.mContextView.mTitle;
        }

        @Override // androidx.appcompat.view.ActionMode
        public final void invalidate() {
            if (WindowDecorActionBar.this.mActionMode == this) {
                this.mMenu.stopDispatchingItemsChanged();
                try {
                    this.mCallback.onPrepareActionMode(this, this.mMenu);
                } finally {
                    this.mMenu.startDispatchingItemsChanged();
                }
            }
        }

        @Override // androidx.appcompat.view.ActionMode
        public final boolean isTitleOptional() {
            return WindowDecorActionBar.this.mContextView.mTitleOptional;
        }

        @Override // androidx.appcompat.view.menu.MenuBuilder.Callback
        public final boolean onMenuItemSelected(MenuBuilder menuBuilder, MenuItem menuItem) {
            ActionMode.Callback callback = this.mCallback;
            if (callback != null) {
                return callback.onActionItemClicked(this, menuItem);
            }
            return false;
        }

        @Override // androidx.appcompat.view.menu.MenuBuilder.Callback
        public final void onMenuModeChange(MenuBuilder menuBuilder) {
            if (this.mCallback != null) {
                invalidate();
                ActionMenuPresenter actionMenuPresenter = WindowDecorActionBar.this.mContextView.mActionMenuPresenter;
                if (actionMenuPresenter != null) {
                    actionMenuPresenter.showOverflowMenu();
                }
            }
        }

        @Override // androidx.appcompat.view.ActionMode
        public final void setCustomView(View view) {
            WindowDecorActionBar.this.mContextView.setCustomView(view);
            this.mCustomView = new WeakReference<>(view);
        }

        @Override // androidx.appcompat.view.ActionMode
        public final void setTitleOptionalHint(boolean z) {
            this.mTitleOptionalHint = z;
            ActionBarContextView actionBarContextView = WindowDecorActionBar.this.mContextView;
            if (z != actionBarContextView.mTitleOptional) {
                actionBarContextView.requestLayout();
            }
            actionBarContextView.mTitleOptional = z;
        }

        @Override // androidx.appcompat.view.ActionMode
        public final void setSubtitle(int i) {
            setSubtitle(WindowDecorActionBar.this.mContext.getResources().getString(i));
        }

        @Override // androidx.appcompat.view.ActionMode
        public final void setTitle(int i) {
            setTitle(WindowDecorActionBar.this.mContext.getResources().getString(i));
        }

        @Override // androidx.appcompat.view.ActionMode
        public final MenuBuilder getMenu() {
            return this.mMenu;
        }
    }

    public WindowDecorActionBar(Activity activity, boolean z) {
        new ArrayList();
        View decorView = activity.getWindow().getDecorView();
        init(decorView);
        if (!z) {
            this.mContentView = decorView.findViewById(16908290);
        }
    }

    public final void animateToMode(boolean z) {
        ViewPropertyAnimatorCompat viewPropertyAnimatorCompat;
        ViewPropertyAnimatorCompat viewPropertyAnimatorCompat2;
        long j;
        if (z) {
            if (!this.mShowingForMode) {
                this.mShowingForMode = true;
                updateVisibility(false);
            }
        } else if (this.mShowingForMode) {
            this.mShowingForMode = false;
            updateVisibility(false);
        }
        ActionBarContainer actionBarContainer = this.mContainerView;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (ViewCompat.Api19Impl.isLaidOut(actionBarContainer)) {
            if (z) {
                viewPropertyAnimatorCompat = this.mDecorToolbar.setupAnimatorToVisibility(4, 100L);
                viewPropertyAnimatorCompat2 = this.mContextView.setupAnimatorToVisibility(0, 200L);
            } else {
                ViewPropertyAnimatorCompat viewPropertyAnimatorCompat3 = this.mDecorToolbar.setupAnimatorToVisibility(0, 200L);
                viewPropertyAnimatorCompat = this.mContextView.setupAnimatorToVisibility(8, 100L);
                viewPropertyAnimatorCompat2 = viewPropertyAnimatorCompat3;
            }
            ViewPropertyAnimatorCompatSet viewPropertyAnimatorCompatSet = new ViewPropertyAnimatorCompatSet();
            viewPropertyAnimatorCompatSet.mAnimators.add(viewPropertyAnimatorCompat);
            View view = viewPropertyAnimatorCompat.mView.get();
            if (view != null) {
                j = view.animate().getDuration();
            } else {
                j = 0;
            }
            View view2 = viewPropertyAnimatorCompat2.mView.get();
            if (view2 != null) {
                view2.animate().setStartDelay(j);
            }
            viewPropertyAnimatorCompatSet.mAnimators.add(viewPropertyAnimatorCompat2);
            viewPropertyAnimatorCompatSet.start();
        } else if (z) {
            this.mDecorToolbar.setVisibility(4);
            this.mContextView.setVisibility(0);
        } else {
            this.mDecorToolbar.setVisibility(0);
            this.mContextView.setVisibility(8);
        }
    }

    public final void dispatchMenuVisibilityChanged(boolean z) {
        if (z != this.mLastMenuVisibility) {
            this.mLastMenuVisibility = z;
            int size = this.mMenuVisibilityListeners.size();
            for (int i = 0; i < size; i++) {
                this.mMenuVisibilityListeners.get(i).onMenuVisibilityChanged();
            }
        }
    }

    public final Context getThemedContext() {
        if (this.mThemedContext == null) {
            TypedValue typedValue = new TypedValue();
            this.mContext.getTheme().resolveAttribute(R.attr.actionBarWidgetTheme, typedValue, true);
            int i = typedValue.resourceId;
            if (i != 0) {
                this.mThemedContext = new ContextThemeWrapper(this.mContext, i);
            } else {
                this.mThemedContext = this.mContext;
            }
        }
        return this.mThemedContext;
    }

    public final void setDefaultDisplayHomeAsUpEnabled(boolean z) {
        int i;
        if (!this.mDisplayHomeAsUpSet) {
            if (z) {
                i = 4;
            } else {
                i = 0;
            }
            int displayOptions = this.mDecorToolbar.getDisplayOptions();
            this.mDisplayHomeAsUpSet = true;
            this.mDecorToolbar.setDisplayOptions((i & 4) | (displayOptions & (-5)));
        }
    }

    public final void setHasEmbeddedTabs(boolean z) {
        this.mHasEmbeddedTabs = z;
        if (!z) {
            this.mDecorToolbar.setEmbeddedTabView();
            this.mContainerView.getClass();
        } else {
            this.mContainerView.getClass();
            this.mDecorToolbar.setEmbeddedTabView();
        }
        this.mDecorToolbar.getNavigationMode();
        DecorToolbar decorToolbar = this.mDecorToolbar;
        boolean z2 = this.mHasEmbeddedTabs;
        decorToolbar.setCollapsible(false);
        ActionBarOverlayLayout actionBarOverlayLayout = this.mOverlayLayout;
        boolean z3 = this.mHasEmbeddedTabs;
        actionBarOverlayLayout.mHasNonEmbeddedTabs = false;
    }

    public final void updateVisibility(boolean z) {
        boolean z2;
        View view;
        int[] iArr;
        View view2;
        View view3;
        int[] iArr2;
        boolean z3 = this.mHiddenBySystem;
        if (!this.mShowingForMode && z3) {
            z2 = false;
        } else {
            z2 = true;
        }
        ValueAnimator.AnimatorUpdateListener animatorUpdateListener = null;
        if (z2) {
            if (!this.mNowShowing) {
                this.mNowShowing = true;
                ViewPropertyAnimatorCompatSet viewPropertyAnimatorCompatSet = this.mCurrentShowAnim;
                if (viewPropertyAnimatorCompatSet != null) {
                    viewPropertyAnimatorCompatSet.cancel();
                }
                this.mContainerView.setVisibility(0);
                if (this.mCurWindowVisibility != 0 || (!this.mShowHideAnimationEnabled && !z)) {
                    this.mContainerView.setAlpha(1.0f);
                    this.mContainerView.setTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    if (this.mContentAnimations && (view2 = this.mContentView) != null) {
                        view2.setTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    }
                    this.mShowListener.onAnimationEnd();
                } else {
                    this.mContainerView.setTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    float f = -this.mContainerView.getHeight();
                    if (z) {
                        this.mContainerView.getLocationInWindow(new int[]{0, 0});
                        f -= iArr2[1];
                    }
                    this.mContainerView.setTranslationY(f);
                    ViewPropertyAnimatorCompatSet viewPropertyAnimatorCompatSet2 = new ViewPropertyAnimatorCompatSet();
                    ViewPropertyAnimatorCompat animate = ViewCompat.animate(this.mContainerView);
                    animate.translationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    AnonymousClass3 r2 = this.mUpdateListener;
                    View view4 = animate.mView.get();
                    if (view4 != null) {
                        if (r2 != null) {
                            animatorUpdateListener = new ValueAnimator.AnimatorUpdateListener(view4) { // from class: androidx.core.view.ViewPropertyAnimatorCompat.2
                                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                                    ((View) WindowDecorActionBar.this.mContainerView.getParent()).invalidate();
                                }
                            };
                        }
                        view4.animate().setUpdateListener(animatorUpdateListener);
                    }
                    if (!viewPropertyAnimatorCompatSet2.mIsStarted) {
                        viewPropertyAnimatorCompatSet2.mAnimators.add(animate);
                    }
                    if (this.mContentAnimations && (view3 = this.mContentView) != null) {
                        view3.setTranslationY(f);
                        ViewPropertyAnimatorCompat animate2 = ViewCompat.animate(this.mContentView);
                        animate2.translationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                        if (!viewPropertyAnimatorCompatSet2.mIsStarted) {
                            viewPropertyAnimatorCompatSet2.mAnimators.add(animate2);
                        }
                    }
                    DecelerateInterpolator decelerateInterpolator = sShowInterpolator;
                    boolean z4 = viewPropertyAnimatorCompatSet2.mIsStarted;
                    if (!z4) {
                        viewPropertyAnimatorCompatSet2.mInterpolator = decelerateInterpolator;
                    }
                    if (!z4) {
                        viewPropertyAnimatorCompatSet2.mDuration = 250L;
                    }
                    AnonymousClass2 r0 = this.mShowListener;
                    if (!z4) {
                        viewPropertyAnimatorCompatSet2.mListener = r0;
                    }
                    this.mCurrentShowAnim = viewPropertyAnimatorCompatSet2;
                    viewPropertyAnimatorCompatSet2.start();
                }
                ActionBarOverlayLayout actionBarOverlayLayout = this.mOverlayLayout;
                if (actionBarOverlayLayout != null) {
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    ViewCompat.Api20Impl.requestApplyInsets(actionBarOverlayLayout);
                }
            }
        } else if (this.mNowShowing) {
            this.mNowShowing = false;
            ViewPropertyAnimatorCompatSet viewPropertyAnimatorCompatSet3 = this.mCurrentShowAnim;
            if (viewPropertyAnimatorCompatSet3 != null) {
                viewPropertyAnimatorCompatSet3.cancel();
            }
            if (this.mCurWindowVisibility != 0 || (!this.mShowHideAnimationEnabled && !z)) {
                this.mHideListener.onAnimationEnd();
                return;
            }
            this.mContainerView.setAlpha(1.0f);
            ActionBarContainer actionBarContainer = this.mContainerView;
            actionBarContainer.mIsTransitioning = true;
            actionBarContainer.setDescendantFocusability(393216);
            ViewPropertyAnimatorCompatSet viewPropertyAnimatorCompatSet4 = new ViewPropertyAnimatorCompatSet();
            float f2 = -this.mContainerView.getHeight();
            if (z) {
                this.mContainerView.getLocationInWindow(new int[]{0, 0});
                f2 -= iArr[1];
            }
            ViewPropertyAnimatorCompat animate3 = ViewCompat.animate(this.mContainerView);
            animate3.translationY(f2);
            AnonymousClass3 r1 = this.mUpdateListener;
            View view5 = animate3.mView.get();
            if (view5 != null) {
                if (r1 != null) {
                    animatorUpdateListener = new ValueAnimator.AnimatorUpdateListener(view5) { // from class: androidx.core.view.ViewPropertyAnimatorCompat.2
                        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                        public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                            ((View) WindowDecorActionBar.this.mContainerView.getParent()).invalidate();
                        }
                    };
                }
                view5.animate().setUpdateListener(animatorUpdateListener);
            }
            if (!viewPropertyAnimatorCompatSet4.mIsStarted) {
                viewPropertyAnimatorCompatSet4.mAnimators.add(animate3);
            }
            if (this.mContentAnimations && (view = this.mContentView) != null) {
                ViewPropertyAnimatorCompat animate4 = ViewCompat.animate(view);
                animate4.translationY(f2);
                if (!viewPropertyAnimatorCompatSet4.mIsStarted) {
                    viewPropertyAnimatorCompatSet4.mAnimators.add(animate4);
                }
            }
            AccelerateInterpolator accelerateInterpolator = sHideInterpolator;
            boolean z5 = viewPropertyAnimatorCompatSet4.mIsStarted;
            if (!z5) {
                viewPropertyAnimatorCompatSet4.mInterpolator = accelerateInterpolator;
            }
            if (!z5) {
                viewPropertyAnimatorCompatSet4.mDuration = 250L;
            }
            AnonymousClass1 r9 = this.mHideListener;
            if (!z5) {
                viewPropertyAnimatorCompatSet4.mListener = r9;
            }
            this.mCurrentShowAnim = viewPropertyAnimatorCompatSet4;
            viewPropertyAnimatorCompatSet4.start();
        }
    }

    public final void init(View view) {
        DecorToolbar decorToolbar;
        boolean z;
        String str;
        ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) view.findViewById(R.id.decor_content_parent);
        this.mOverlayLayout = actionBarOverlayLayout;
        if (actionBarOverlayLayout != null) {
            actionBarOverlayLayout.mActionBarVisibilityCallback = this;
            if (actionBarOverlayLayout.getWindowToken() != null) {
                ((WindowDecorActionBar) actionBarOverlayLayout.mActionBarVisibilityCallback).mCurWindowVisibility = actionBarOverlayLayout.mWindowVisibility;
                int i = actionBarOverlayLayout.mLastSystemUiVisibility;
                if (i != 0) {
                    actionBarOverlayLayout.onWindowSystemUiVisibilityChanged(i);
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    ViewCompat.Api20Impl.requestApplyInsets(actionBarOverlayLayout);
                }
            }
        }
        View findViewById = view.findViewById(R.id.action_bar);
        if (findViewById instanceof DecorToolbar) {
            decorToolbar = (DecorToolbar) findViewById;
        } else if (findViewById instanceof Toolbar) {
            Toolbar toolbar = (Toolbar) findViewById;
            if (toolbar.mWrapper == null) {
                toolbar.mWrapper = new ToolbarWidgetWrapper(toolbar);
            }
            decorToolbar = toolbar.mWrapper;
        } else {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Can't make a decor toolbar out of ");
            if (findViewById != null) {
                str = findViewById.getClass().getSimpleName();
            } else {
                str = "null";
            }
            m.append(str);
            throw new IllegalStateException(m.toString());
        }
        this.mDecorToolbar = decorToolbar;
        this.mContextView = (ActionBarContextView) view.findViewById(R.id.action_context_bar);
        ActionBarContainer actionBarContainer = (ActionBarContainer) view.findViewById(R.id.action_bar_container);
        this.mContainerView = actionBarContainer;
        DecorToolbar decorToolbar2 = this.mDecorToolbar;
        if (decorToolbar2 == null || this.mContextView == null || actionBarContainer == null) {
            throw new IllegalStateException("WindowDecorActionBar can only be used with a compatible window decor layout");
        }
        this.mContext = decorToolbar2.getContext();
        if ((this.mDecorToolbar.getDisplayOptions() & 4) != 0) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            this.mDisplayHomeAsUpSet = true;
        }
        Context context = this.mContext;
        int i2 = context.getApplicationInfo().targetSdkVersion;
        this.mDecorToolbar.setHomeButtonEnabled();
        setHasEmbeddedTabs(context.getResources().getBoolean(R.bool.abc_action_bar_embed_tabs));
        TypedArray obtainStyledAttributes = this.mContext.obtainStyledAttributes(null, R$styleable.ActionBar, R.attr.actionBarStyle, 0);
        if (obtainStyledAttributes.getBoolean(14, false)) {
            ActionBarOverlayLayout actionBarOverlayLayout2 = this.mOverlayLayout;
            if (actionBarOverlayLayout2.mOverlayMode) {
                this.mHideOnContentScroll = true;
                if (true != actionBarOverlayLayout2.mHideOnContentScroll) {
                    actionBarOverlayLayout2.mHideOnContentScroll = true;
                }
            } else {
                throw new IllegalStateException("Action bar must be in overlay mode (Window.FEATURE_OVERLAY_ACTION_BAR) to enable hide on content scroll");
            }
        }
        int dimensionPixelSize = obtainStyledAttributes.getDimensionPixelSize(12, 0);
        if (dimensionPixelSize != 0) {
            ActionBarContainer actionBarContainer2 = this.mContainerView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api21Impl.setElevation(actionBarContainer2, dimensionPixelSize);
        }
        obtainStyledAttributes.recycle();
    }

    public WindowDecorActionBar(Dialog dialog) {
        new ArrayList();
        init(dialog.getWindow().getDecorView());
    }
}
