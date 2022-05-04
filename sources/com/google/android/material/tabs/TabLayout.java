package com.google.android.material.tabs;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.StateSet;
import android.view.LayoutInflater;
import android.view.PointerIcon;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.R$layout;
import androidx.appcompat.content.res.AppCompatResources;
import androidx.core.util.Pools$SimplePool;
import androidx.core.util.Pools$SynchronizedPool;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.viewpager.widget.ViewPager;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.animation.AnimationUtils;
import com.google.android.material.internal.ViewUtils;
import com.google.android.material.ripple.RippleUtils;
import com.google.android.material.shape.MaterialShapeDrawable;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.WeakHashMap;
@ViewPager.DecorView
/* loaded from: classes.dex */
public class TabLayout extends HorizontalScrollView {
    public static final Pools$SynchronizedPool tabPool = new Pools$SynchronizedPool(16);
    public AdapterChangeListener adapterChangeListener;
    public int contentInsetStart;
    public ViewPagerOnTabSelectedListener currentVpSelectedListener;
    public boolean inlineLabel;
    public int mode;
    public TabLayoutOnPageChangeListener pageChangeListener;
    public final int requestedTabMaxWidth;
    public final int requestedTabMinWidth;
    public ValueAnimator scrollAnimator;
    public final int scrollableTabMinWidth;
    public final ArrayList<BaseOnTabSelectedListener> selectedListeners;
    public Tab selectedTab;
    public boolean setupViewPagerImplicitly;
    public final SlidingTabIndicator slidingTabIndicator;
    public final int tabBackgroundResId;
    public int tabGravity;
    public ColorStateList tabIconTint;
    public PorterDuff.Mode tabIconTintMode;
    public int tabIndicatorAnimationDuration;
    public boolean tabIndicatorFullWidth;
    public int tabIndicatorGravity;
    public int tabIndicatorHeight;
    public TabIndicatorInterpolator tabIndicatorInterpolator;
    public int tabMaxWidth;
    public int tabPaddingBottom;
    public int tabPaddingEnd;
    public int tabPaddingStart;
    public int tabPaddingTop;
    public ColorStateList tabRippleColorStateList;
    public Drawable tabSelectedIndicator;
    public int tabSelectedIndicatorColor;
    public int tabTextAppearance;
    public ColorStateList tabTextColors;
    public float tabTextMultiLineSize;
    public float tabTextSize;
    public final Pools$SimplePool tabViewPool;
    public final ArrayList<Tab> tabs;
    public boolean unboundedRipple;
    public ViewPager viewPager;

    /* loaded from: classes.dex */
    public class AdapterChangeListener {
    }

    @Deprecated
    /* loaded from: classes.dex */
    public interface BaseOnTabSelectedListener<T extends Tab> {
        void onTabReselected();

        void onTabSelected(T t);

        void onTabUnselected();
    }

    /* loaded from: classes.dex */
    public interface OnTabSelectedListener extends BaseOnTabSelectedListener<Tab> {
    }

    /* loaded from: classes.dex */
    public class SlidingTabIndicator extends LinearLayout {
        public ValueAnimator indicatorAnimator;
        public int selectedPosition = -1;
        public float selectionOffset;

        public SlidingTabIndicator(Context context) {
            super(context);
            setWillNotDraw(false);
        }

        @Override // android.view.View
        public final void draw(Canvas canvas) {
            int height = TabLayout.this.tabSelectedIndicator.getBounds().height();
            if (height < 0) {
                height = TabLayout.this.tabSelectedIndicator.getIntrinsicHeight();
            }
            int i = TabLayout.this.tabIndicatorGravity;
            int i2 = 0;
            if (i == 0) {
                i2 = getHeight() - height;
                height = getHeight();
            } else if (i == 1) {
                i2 = (getHeight() - height) / 2;
                height = (getHeight() + height) / 2;
            } else if (i != 2) {
                if (i != 3) {
                    height = 0;
                } else {
                    height = getHeight();
                }
            }
            if (TabLayout.this.tabSelectedIndicator.getBounds().width() > 0) {
                Rect bounds = TabLayout.this.tabSelectedIndicator.getBounds();
                TabLayout.this.tabSelectedIndicator.setBounds(bounds.left, i2, bounds.right, height);
                TabLayout tabLayout = TabLayout.this;
                Drawable drawable = tabLayout.tabSelectedIndicator;
                int i3 = tabLayout.tabSelectedIndicatorColor;
                if (i3 != 0) {
                    drawable.setTint(i3);
                } else {
                    drawable.setTintList(null);
                }
                drawable.draw(canvas);
            }
            super.draw(canvas);
        }

        public final void jumpIndicatorToSelectedPosition() {
            View childAt = getChildAt(this.selectedPosition);
            TabLayout tabLayout = TabLayout.this;
            TabIndicatorInterpolator tabIndicatorInterpolator = tabLayout.tabIndicatorInterpolator;
            Drawable drawable = tabLayout.tabSelectedIndicator;
            tabIndicatorInterpolator.getClass();
            RectF calculateIndicatorWidthForTab = TabIndicatorInterpolator.calculateIndicatorWidthForTab(tabLayout, childAt);
            drawable.setBounds((int) calculateIndicatorWidthForTab.left, drawable.getBounds().top, (int) calculateIndicatorWidthForTab.right, drawable.getBounds().bottom);
        }

        public final void tweenIndicatorPosition(View view, View view2, float f) {
            boolean z;
            if (view == null || view.getWidth() <= 0) {
                z = false;
            } else {
                z = true;
            }
            if (z) {
                TabLayout tabLayout = TabLayout.this;
                tabLayout.tabIndicatorInterpolator.updateIndicatorForOffset(tabLayout, view, view2, f, tabLayout.tabSelectedIndicator);
            } else {
                Drawable drawable = TabLayout.this.tabSelectedIndicator;
                drawable.setBounds(-1, drawable.getBounds().top, -1, TabLayout.this.tabSelectedIndicator.getBounds().bottom);
            }
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.postInvalidateOnAnimation(this);
        }

        public final void updateOrRecreateIndicatorAnimation(boolean z, final int i, int i2) {
            final View childAt = getChildAt(this.selectedPosition);
            final View childAt2 = getChildAt(i);
            if (childAt2 == null) {
                jumpIndicatorToSelectedPosition();
                return;
            }
            ValueAnimator.AnimatorUpdateListener animatorUpdateListener = new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.tabs.TabLayout.SlidingTabIndicator.1
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    SlidingTabIndicator.this.tweenIndicatorPosition(childAt, childAt2, valueAnimator.getAnimatedFraction());
                }
            };
            if (z) {
                ValueAnimator valueAnimator = new ValueAnimator();
                this.indicatorAnimator = valueAnimator;
                valueAnimator.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
                valueAnimator.setDuration(i2);
                valueAnimator.setFloatValues(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
                valueAnimator.addUpdateListener(animatorUpdateListener);
                valueAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.google.android.material.tabs.TabLayout.SlidingTabIndicator.2
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public final void onAnimationEnd(Animator animator) {
                        SlidingTabIndicator.this.selectedPosition = i;
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public final void onAnimationStart(Animator animator) {
                        SlidingTabIndicator.this.selectedPosition = i;
                    }
                });
                valueAnimator.start();
                return;
            }
            this.indicatorAnimator.removeAllUpdateListeners();
            this.indicatorAnimator.addUpdateListener(animatorUpdateListener);
        }

        @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
        public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
            super.onLayout(z, i, i2, i3, i4);
            ValueAnimator valueAnimator = this.indicatorAnimator;
            if (valueAnimator == null || !valueAnimator.isRunning()) {
                jumpIndicatorToSelectedPosition();
            } else {
                updateOrRecreateIndicatorAnimation(false, this.selectedPosition, -1);
            }
        }

        @Override // android.widget.LinearLayout, android.view.View
        public final void onMeasure(int i, int i2) {
            super.onMeasure(i, i2);
            if (View.MeasureSpec.getMode(i) == 1073741824) {
                TabLayout tabLayout = TabLayout.this;
                boolean z = true;
                if (tabLayout.tabGravity == 1 || tabLayout.mode == 2) {
                    int childCount = getChildCount();
                    int i3 = 0;
                    for (int i4 = 0; i4 < childCount; i4++) {
                        View childAt = getChildAt(i4);
                        if (childAt.getVisibility() == 0) {
                            i3 = Math.max(i3, childAt.getMeasuredWidth());
                        }
                    }
                    if (i3 > 0) {
                        if (i3 * childCount <= getMeasuredWidth() - (((int) ViewUtils.dpToPx(getContext(), 16)) * 2)) {
                            boolean z2 = false;
                            for (int i5 = 0; i5 < childCount; i5++) {
                                LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) getChildAt(i5).getLayoutParams();
                                if (layoutParams.width != i3 || layoutParams.weight != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                                    layoutParams.width = i3;
                                    layoutParams.weight = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                                    z2 = true;
                                }
                            }
                            z = z2;
                        } else {
                            TabLayout tabLayout2 = TabLayout.this;
                            tabLayout2.tabGravity = 0;
                            tabLayout2.updateTabViews(false);
                        }
                        if (z) {
                            super.onMeasure(i, i2);
                        }
                    }
                }
            }
        }

        @Override // android.widget.LinearLayout, android.view.View
        public final void onRtlPropertiesChanged(int i) {
            super.onRtlPropertiesChanged(i);
        }
    }

    /* loaded from: classes.dex */
    public static class Tab {
        public CharSequence contentDesc;
        public View customView;
        public Drawable icon;
        public TabLayout parent;
        public CharSequence text;
        public TabView view;
        public int position = -1;
        public int id = -1;

        public final void select() {
            TabLayout tabLayout = this.parent;
            if (tabLayout != null) {
                tabLayout.selectTab(this, true);
                return;
            }
            throw new IllegalArgumentException("Tab not attached to a TabLayout");
        }

        public final void setText(int i) {
            TabLayout tabLayout = this.parent;
            if (tabLayout != null) {
                CharSequence text = tabLayout.getResources().getText(i);
                if (TextUtils.isEmpty(this.contentDesc) && !TextUtils.isEmpty(text)) {
                    this.view.setContentDescription(text);
                }
                this.text = text;
                TabView tabView = this.view;
                if (tabView != null) {
                    tabView.update();
                    return;
                }
                return;
            }
            throw new IllegalArgumentException("Tab not attached to a TabLayout");
        }
    }

    /* loaded from: classes.dex */
    public static class TabLayoutOnPageChangeListener implements ViewPager.OnPageChangeListener {
        public int previousScrollState;
        public int scrollState;
        public final WeakReference<TabLayout> tabLayoutRef;

        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public final void onPageScrollStateChanged(int i) {
            this.previousScrollState = this.scrollState;
            this.scrollState = i;
        }

        @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
        public final void onPageScrolled(int i, float f) {
            boolean z;
            TabLayout tabLayout = this.tabLayoutRef.get();
            if (tabLayout != null) {
                int i2 = this.scrollState;
                boolean z2 = false;
                if (i2 != 2 || this.previousScrollState == 1) {
                    z = true;
                } else {
                    z = false;
                }
                if (!(i2 == 2 && this.previousScrollState == 0)) {
                    z2 = true;
                }
                tabLayout.setScrollPosition(i, f, z, z2);
            }
        }

        public TabLayoutOnPageChangeListener(TabLayout tabLayout) {
            this.tabLayoutRef = new WeakReference<>(tabLayout);
        }
    }

    /* loaded from: classes.dex */
    public final class TabView extends LinearLayout {
        public Drawable baseBackgroundDrawable;
        public ImageView customIconView;
        public TextView customTextView;
        public View customView;
        public int defaultMaxLines = 2;
        public ImageView iconView;
        public Tab tab;
        public TextView textView;

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v4, types: [android.graphics.drawable.RippleDrawable] */
        public TabView(Context context) {
            super(context);
            int i = TabLayout.this.tabBackgroundResId;
            GradientDrawable gradientDrawable = null;
            if (i != 0) {
                Drawable drawable = AppCompatResources.getDrawable(context, i);
                this.baseBackgroundDrawable = drawable;
                if (drawable != null && drawable.isStateful()) {
                    this.baseBackgroundDrawable.setState(getDrawableState());
                }
            } else {
                this.baseBackgroundDrawable = null;
            }
            GradientDrawable gradientDrawable2 = new GradientDrawable();
            gradientDrawable2.setColor(0);
            if (TabLayout.this.tabRippleColorStateList != null) {
                GradientDrawable gradientDrawable3 = new GradientDrawable();
                gradientDrawable3.setCornerRadius(1.0E-5f);
                gradientDrawable3.setColor(-1);
                ColorStateList colorStateList = TabLayout.this.tabRippleColorStateList;
                ColorStateList colorStateList2 = new ColorStateList(new int[][]{RippleUtils.SELECTED_STATE_SET, StateSet.NOTHING}, new int[]{RippleUtils.getColorForState(colorStateList, RippleUtils.SELECTED_PRESSED_STATE_SET), RippleUtils.getColorForState(colorStateList, RippleUtils.PRESSED_STATE_SET)});
                boolean z = TabLayout.this.unboundedRipple;
                gradientDrawable2 = new RippleDrawable(colorStateList2, z ? null : gradientDrawable2, !z ? gradientDrawable3 : gradientDrawable);
            }
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.setBackground(this, gradientDrawable2);
            TabLayout.this.invalidate();
            ViewCompat.Api17Impl.setPaddingRelative(this, TabLayout.this.tabPaddingStart, TabLayout.this.tabPaddingTop, TabLayout.this.tabPaddingEnd, TabLayout.this.tabPaddingBottom);
            setGravity(17);
            setOrientation(!TabLayout.this.inlineLabel ? 1 : 0);
            setClickable(true);
            ViewCompat.Api24Impl.setPointerIcon(this, PointerIcon.getSystemIcon(getContext(), 1002));
        }

        public final void update() {
            View view;
            int i;
            boolean z;
            Tab tab = this.tab;
            if (tab != null) {
                view = tab.customView;
            } else {
                view = null;
            }
            if (view != null) {
                ViewParent parent = view.getParent();
                if (parent != this) {
                    if (parent != null) {
                        ((ViewGroup) parent).removeView(view);
                    }
                    addView(view);
                }
                this.customView = view;
                TextView textView = this.textView;
                if (textView != null) {
                    textView.setVisibility(8);
                }
                ImageView imageView = this.iconView;
                if (imageView != null) {
                    imageView.setVisibility(8);
                    this.iconView.setImageDrawable(null);
                }
                TextView textView2 = (TextView) view.findViewById(16908308);
                this.customTextView = textView2;
                if (textView2 != null) {
                    this.defaultMaxLines = textView2.getMaxLines();
                }
                this.customIconView = (ImageView) view.findViewById(16908294);
            } else {
                View view2 = this.customView;
                if (view2 != null) {
                    removeView(view2);
                    this.customView = null;
                }
                this.customTextView = null;
                this.customIconView = null;
            }
            boolean z2 = false;
            if (this.customView == null) {
                if (this.iconView == null) {
                    ImageView imageView2 = (ImageView) LayoutInflater.from(getContext()).inflate(R.layout.design_layout_tab_icon, (ViewGroup) this, false);
                    this.iconView = imageView2;
                    addView(imageView2, 0);
                }
                if (this.textView == null) {
                    TextView textView3 = (TextView) LayoutInflater.from(getContext()).inflate(R.layout.design_layout_tab_text, (ViewGroup) this, false);
                    this.textView = textView3;
                    addView(textView3);
                    this.defaultMaxLines = this.textView.getMaxLines();
                }
                this.textView.setTextAppearance(TabLayout.this.tabTextAppearance);
                ColorStateList colorStateList = TabLayout.this.tabTextColors;
                if (colorStateList != null) {
                    this.textView.setTextColor(colorStateList);
                }
                updateTextAndIcon(this.textView, this.iconView);
                final ImageView imageView3 = this.iconView;
                if (imageView3 != null) {
                    imageView3.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.google.android.material.tabs.TabLayout.TabView.1
                        @Override // android.view.View.OnLayoutChangeListener
                        public final void onLayoutChange(View view3, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9) {
                            if (imageView3.getVisibility() == 0) {
                                TabView.this.getClass();
                            }
                        }
                    });
                }
                final TextView textView4 = this.textView;
                if (textView4 != null) {
                    textView4.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.google.android.material.tabs.TabLayout.TabView.1
                        @Override // android.view.View.OnLayoutChangeListener
                        public final void onLayoutChange(View view3, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9) {
                            if (textView4.getVisibility() == 0) {
                                TabView.this.getClass();
                            }
                        }
                    });
                }
            } else {
                TextView textView5 = this.customTextView;
                if (!(textView5 == null && this.customIconView == null)) {
                    updateTextAndIcon(textView5, this.customIconView);
                }
            }
            if (tab != null && !TextUtils.isEmpty(tab.contentDesc)) {
                setContentDescription(tab.contentDesc);
            }
            if (tab != null) {
                TabLayout tabLayout = tab.parent;
                if (tabLayout != null) {
                    Tab tab2 = tabLayout.selectedTab;
                    if (tab2 != null) {
                        i = tab2.position;
                    } else {
                        i = -1;
                    }
                    if (i == -1 || i != tab.position) {
                        z = false;
                    } else {
                        z = true;
                    }
                    if (z) {
                        z2 = true;
                    }
                } else {
                    throw new IllegalArgumentException("Tab not attached to a TabLayout");
                }
            }
            setSelected(z2);
        }

        public final void updateTextAndIcon(TextView textView, ImageView imageView) {
            Drawable drawable;
            CharSequence charSequence;
            int i;
            Drawable drawable2;
            Tab tab = this.tab;
            CharSequence charSequence2 = null;
            if (tab == null || (drawable2 = tab.icon) == null) {
                drawable = null;
            } else {
                drawable = drawable2.mutate();
            }
            if (drawable != null) {
                drawable.setTintList(TabLayout.this.tabIconTint);
                PorterDuff.Mode mode = TabLayout.this.tabIconTintMode;
                if (mode != null) {
                    drawable.setTintMode(mode);
                }
            }
            Tab tab2 = this.tab;
            if (tab2 != null) {
                charSequence = tab2.text;
            } else {
                charSequence = null;
            }
            if (imageView != null) {
                if (drawable != null) {
                    imageView.setImageDrawable(drawable);
                    imageView.setVisibility(0);
                    setVisibility(0);
                } else {
                    imageView.setVisibility(8);
                    imageView.setImageDrawable(null);
                }
            }
            boolean z = !TextUtils.isEmpty(charSequence);
            if (textView != null) {
                if (z) {
                    textView.setText(charSequence);
                    this.tab.getClass();
                    textView.setVisibility(0);
                    setVisibility(0);
                } else {
                    textView.setVisibility(8);
                    textView.setText((CharSequence) null);
                }
            }
            if (imageView != null) {
                ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) imageView.getLayoutParams();
                if (!z || imageView.getVisibility() != 0) {
                    i = 0;
                } else {
                    i = (int) ViewUtils.dpToPx(getContext(), 8);
                }
                if (TabLayout.this.inlineLabel) {
                    if (i != marginLayoutParams.getMarginEnd()) {
                        marginLayoutParams.setMarginEnd(i);
                        marginLayoutParams.bottomMargin = 0;
                        imageView.setLayoutParams(marginLayoutParams);
                        imageView.requestLayout();
                    }
                } else if (i != marginLayoutParams.bottomMargin) {
                    marginLayoutParams.bottomMargin = i;
                    marginLayoutParams.setMarginEnd(0);
                    imageView.setLayoutParams(marginLayoutParams);
                    imageView.requestLayout();
                }
            }
            Tab tab3 = this.tab;
            if (tab3 != null) {
                charSequence2 = tab3.contentDesc;
            }
            if (!z) {
                charSequence = charSequence2;
            }
            setTooltipText(charSequence);
        }

        @Override // android.view.ViewGroup, android.view.View
        public final void drawableStateChanged() {
            super.drawableStateChanged();
            int[] drawableState = getDrawableState();
            Drawable drawable = this.baseBackgroundDrawable;
            boolean z = false;
            if (drawable != null && drawable.isStateful()) {
                z = false | this.baseBackgroundDrawable.setState(drawableState);
            }
            if (z) {
                invalidate();
                TabLayout.this.invalidate();
            }
        }

        @Override // android.view.View
        public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
            super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
            accessibilityNodeInfo.setCollectionItemInfo((AccessibilityNodeInfo.CollectionItemInfo) AccessibilityNodeInfoCompat.CollectionItemInfoCompat.obtain(0, 1, this.tab.position, 1, isSelected()).mInfo);
            if (isSelected()) {
                accessibilityNodeInfo.setClickable(false);
                accessibilityNodeInfo.removeAction((AccessibilityNodeInfo.AccessibilityAction) AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_CLICK.mAction);
            }
            accessibilityNodeInfo.getExtras().putCharSequence("AccessibilityNodeInfo.roleDescription", getResources().getString(R.string.item_view_role_description));
        }

        /* JADX WARN: Code restructure failed: missing block: B:30:0x008d, code lost:
            if (((r0 / r2.getPaint().getTextSize()) * r2.getLineWidth(0)) > ((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight())) goto L31;
         */
        @Override // android.widget.LinearLayout, android.view.View
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final void onMeasure(int r8, int r9) {
            /*
                r7 = this;
                int r0 = android.view.View.MeasureSpec.getSize(r8)
                int r1 = android.view.View.MeasureSpec.getMode(r8)
                com.google.android.material.tabs.TabLayout r2 = com.google.android.material.tabs.TabLayout.this
                int r2 = r2.tabMaxWidth
                if (r2 <= 0) goto L18
                if (r1 == 0) goto L12
                if (r0 <= r2) goto L18
            L12:
                r8 = -2147483648(0xffffffff80000000, float:-0.0)
                int r8 = android.view.View.MeasureSpec.makeMeasureSpec(r2, r8)
            L18:
                super.onMeasure(r8, r9)
                android.widget.TextView r0 = r7.textView
                if (r0 == 0) goto L9f
                com.google.android.material.tabs.TabLayout r0 = com.google.android.material.tabs.TabLayout.this
                float r0 = r0.tabTextSize
                int r1 = r7.defaultMaxLines
                android.widget.ImageView r2 = r7.iconView
                r3 = 1
                if (r2 == 0) goto L32
                int r2 = r2.getVisibility()
                if (r2 != 0) goto L32
                r1 = r3
                goto L40
            L32:
                android.widget.TextView r2 = r7.textView
                if (r2 == 0) goto L40
                int r2 = r2.getLineCount()
                if (r2 <= r3) goto L40
                com.google.android.material.tabs.TabLayout r0 = com.google.android.material.tabs.TabLayout.this
                float r0 = r0.tabTextMultiLineSize
            L40:
                android.widget.TextView r2 = r7.textView
                float r2 = r2.getTextSize()
                android.widget.TextView r4 = r7.textView
                int r4 = r4.getLineCount()
                android.widget.TextView r5 = r7.textView
                int r5 = r5.getMaxLines()
                int r2 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
                if (r2 != 0) goto L5a
                if (r5 < 0) goto L9f
                if (r1 == r5) goto L9f
            L5a:
                com.google.android.material.tabs.TabLayout r5 = com.google.android.material.tabs.TabLayout.this
                int r5 = r5.mode
                r6 = 0
                if (r5 != r3) goto L90
                if (r2 <= 0) goto L90
                if (r4 != r3) goto L90
                android.widget.TextView r2 = r7.textView
                android.text.Layout r2 = r2.getLayout()
                if (r2 == 0) goto L8f
                float r4 = r2.getLineWidth(r6)
                android.text.TextPaint r2 = r2.getPaint()
                float r2 = r2.getTextSize()
                float r2 = r0 / r2
                float r2 = r2 * r4
                int r4 = r7.getMeasuredWidth()
                int r5 = r7.getPaddingLeft()
                int r4 = r4 - r5
                int r5 = r7.getPaddingRight()
                int r4 = r4 - r5
                float r4 = (float) r4
                int r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
                if (r2 <= 0) goto L90
            L8f:
                r3 = r6
            L90:
                if (r3 == 0) goto L9f
                android.widget.TextView r2 = r7.textView
                r2.setTextSize(r6, r0)
                android.widget.TextView r0 = r7.textView
                r0.setMaxLines(r1)
                super.onMeasure(r8, r9)
            L9f:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.tabs.TabLayout.TabView.onMeasure(int, int):void");
        }

        @Override // android.view.View
        public final boolean performClick() {
            boolean performClick = super.performClick();
            if (this.tab == null) {
                return performClick;
            }
            if (!performClick) {
                playSoundEffect(0);
            }
            this.tab.select();
            return true;
        }

        @Override // android.view.View
        public final void setSelected(boolean z) {
            if (isSelected() != z) {
            }
            super.setSelected(z);
            TextView textView = this.textView;
            if (textView != null) {
                textView.setSelected(z);
            }
            ImageView imageView = this.iconView;
            if (imageView != null) {
                imageView.setSelected(z);
            }
            View view = this.customView;
            if (view != null) {
                view.setSelected(z);
            }
        }
    }

    /* loaded from: classes.dex */
    public static class ViewPagerOnTabSelectedListener implements OnTabSelectedListener {
        public final ViewPager viewPager;

        @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
        public final void onTabReselected() {
        }

        @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
        public final void onTabUnselected() {
        }

        @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
        public final void onTabSelected(Tab tab) {
            ViewPager viewPager = this.viewPager;
            int i = tab.position;
            viewPager.setScrollingCacheEnabled(false);
        }

        public ViewPagerOnTabSelectedListener(ViewPager viewPager) {
            this.viewPager = viewPager;
        }
    }

    public TabLayout(Context context) {
        this(context, null);
    }

    @Override // android.widget.HorizontalScrollView, android.view.ViewGroup
    public final void addView(View view) {
        addViewInternal(view);
    }

    public final void animateToTab(int i) {
        boolean z;
        if (i != -1) {
            if (getWindowToken() != null) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (ViewCompat.Api19Impl.isLaidOut(this)) {
                    SlidingTabIndicator slidingTabIndicator = this.slidingTabIndicator;
                    int childCount = slidingTabIndicator.getChildCount();
                    int i2 = 0;
                    while (true) {
                        if (i2 >= childCount) {
                            z = false;
                            break;
                        } else if (slidingTabIndicator.getChildAt(i2).getWidth() <= 0) {
                            z = true;
                            break;
                        } else {
                            i2++;
                        }
                    }
                    if (!z) {
                        int scrollX = getScrollX();
                        int calculateScrollXForTab = calculateScrollXForTab(i, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                        if (scrollX != calculateScrollXForTab) {
                            if (this.scrollAnimator == null) {
                                ValueAnimator valueAnimator = new ValueAnimator();
                                this.scrollAnimator = valueAnimator;
                                valueAnimator.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
                                this.scrollAnimator.setDuration(this.tabIndicatorAnimationDuration);
                                this.scrollAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.tabs.TabLayout.1
                                    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                                    public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                                        TabLayout.this.scrollTo(((Integer) valueAnimator2.getAnimatedValue()).intValue(), 0);
                                    }
                                });
                            }
                            this.scrollAnimator.setIntValues(scrollX, calculateScrollXForTab);
                            this.scrollAnimator.start();
                        }
                        SlidingTabIndicator slidingTabIndicator2 = this.slidingTabIndicator;
                        int i3 = this.tabIndicatorAnimationDuration;
                        ValueAnimator valueAnimator2 = slidingTabIndicator2.indicatorAnimator;
                        if (valueAnimator2 != null && valueAnimator2.isRunning()) {
                            slidingTabIndicator2.indicatorAnimator.cancel();
                        }
                        slidingTabIndicator2.updateOrRecreateIndicatorAnimation(true, i, i3);
                        return;
                    }
                }
            }
            setScrollPosition(i, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, true, true);
        }
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        TabView tabView;
        Drawable drawable;
        for (int i = 0; i < this.slidingTabIndicator.getChildCount(); i++) {
            View childAt = this.slidingTabIndicator.getChildAt(i);
            if ((childAt instanceof TabView) && (drawable = (tabView = (TabView) childAt).baseBackgroundDrawable) != null) {
                drawable.setBounds(tabView.getLeft(), tabView.getTop(), tabView.getRight(), tabView.getBottom());
                tabView.baseBackgroundDrawable.draw(canvas);
            }
        }
        super.onDraw(canvas);
    }

    public final void setScrollPosition(int i, float f, boolean z, boolean z2) {
        int i2;
        int round = Math.round(i + f);
        if (round >= 0 && round < this.slidingTabIndicator.getChildCount()) {
            if (z2) {
                SlidingTabIndicator slidingTabIndicator = this.slidingTabIndicator;
                ValueAnimator valueAnimator = slidingTabIndicator.indicatorAnimator;
                if (valueAnimator != null && valueAnimator.isRunning()) {
                    slidingTabIndicator.indicatorAnimator.cancel();
                }
                slidingTabIndicator.selectedPosition = i;
                slidingTabIndicator.selectionOffset = f;
                slidingTabIndicator.tweenIndicatorPosition(slidingTabIndicator.getChildAt(i), slidingTabIndicator.getChildAt(slidingTabIndicator.selectedPosition + 1), slidingTabIndicator.selectionOffset);
            }
            ValueAnimator valueAnimator2 = this.scrollAnimator;
            if (valueAnimator2 != null && valueAnimator2.isRunning()) {
                this.scrollAnimator.cancel();
            }
            if (i < 0) {
                i2 = 0;
            } else {
                i2 = calculateScrollXForTab(i, f);
            }
            scrollTo(i2, 0);
            if (z) {
                setSelectedTabView(round);
            }
        }
    }

    public final void updateTabViews(boolean z) {
        for (int i = 0; i < this.slidingTabIndicator.getChildCount(); i++) {
            View childAt = this.slidingTabIndicator.getChildAt(i);
            int i2 = this.requestedTabMinWidth;
            if (i2 == -1) {
                int i3 = this.mode;
                if (i3 == 0 || i3 == 2) {
                    i2 = this.scrollableTabMinWidth;
                } else {
                    i2 = 0;
                }
            }
            childAt.setMinimumWidth(i2);
            LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) childAt.getLayoutParams();
            if (this.mode == 1 && this.tabGravity == 0) {
                layoutParams.width = 0;
                layoutParams.weight = 1.0f;
            } else {
                layoutParams.width = -2;
                layoutParams.weight = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            }
            if (z) {
                childAt.requestLayout();
            }
        }
    }

    public TabLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.tabStyle);
    }

    @Deprecated
    public final void addOnTabSelectedListener(OnTabSelectedListener onTabSelectedListener) {
        if (!this.selectedListeners.contains(onTabSelectedListener)) {
            this.selectedListeners.add(onTabSelectedListener);
        }
    }

    public final void addTab(Tab tab, int i, boolean z) {
        if (tab.parent == this) {
            tab.position = i;
            this.tabs.add(i, tab);
            int size = this.tabs.size();
            while (true) {
                i++;
                if (i >= size) {
                    break;
                }
                this.tabs.get(i).position = i;
            }
            TabView tabView = tab.view;
            tabView.setSelected(false);
            tabView.setActivated(false);
            SlidingTabIndicator slidingTabIndicator = this.slidingTabIndicator;
            int i2 = tab.position;
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -1);
            if (this.mode == 1 && this.tabGravity == 0) {
                layoutParams.width = 0;
                layoutParams.weight = 1.0f;
            } else {
                layoutParams.width = -2;
                layoutParams.weight = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            }
            slidingTabIndicator.addView(tabView, i2, layoutParams);
            if (z) {
                tab.select();
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Tab belongs to a different TabLayout.");
    }

    @Override // android.widget.HorizontalScrollView, android.view.ViewGroup
    public final void addView(View view, int i) {
        addViewInternal(view);
    }

    public final void addViewInternal(View view) {
        if (view instanceof TabItem) {
            TabItem tabItem = (TabItem) view;
            Tab newTab = newTab();
            tabItem.getClass();
            if (!TextUtils.isEmpty(tabItem.getContentDescription())) {
                newTab.contentDesc = tabItem.getContentDescription();
                TabView tabView = newTab.view;
                if (tabView != null) {
                    tabView.update();
                }
            }
            addTab(newTab, this.tabs.size(), this.tabs.isEmpty());
            return;
        }
        throw new IllegalArgumentException("Only TabItem instances can be added to TabLayout");
    }

    public final int calculateScrollXForTab(int i, float f) {
        View childAt;
        View view;
        int i2 = this.mode;
        int i3 = 0;
        if ((i2 != 0 && i2 != 2) || (childAt = this.slidingTabIndicator.getChildAt(i)) == null) {
            return 0;
        }
        int i4 = i + 1;
        if (i4 < this.slidingTabIndicator.getChildCount()) {
            view = this.slidingTabIndicator.getChildAt(i4);
        } else {
            view = null;
        }
        int width = childAt.getWidth();
        if (view != null) {
            i3 = view.getWidth();
        }
        int left = ((width / 2) + childAt.getLeft()) - (getWidth() / 2);
        int i5 = (int) ((width + i3) * 0.5f * f);
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (ViewCompat.Api17Impl.getLayoutDirection(this) == 0) {
            return left + i5;
        }
        return left - i5;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public final FrameLayout.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return generateDefaultLayoutParams();
    }

    public final Tab getTabAt(int i) {
        if (i < 0 || i >= this.tabs.size()) {
            return null;
        }
        return this.tabs.get(i);
    }

    public Tab newTab() {
        TabView tabView;
        int i;
        Tab tab = (Tab) tabPool.acquire();
        if (tab == null) {
            tab = new Tab();
        }
        tab.parent = this;
        Pools$SimplePool pools$SimplePool = this.tabViewPool;
        if (pools$SimplePool != null) {
            tabView = (TabView) pools$SimplePool.acquire();
        } else {
            tabView = null;
        }
        if (tabView == null) {
            tabView = new TabView(getContext());
        }
        if (tab != tabView.tab) {
            tabView.tab = tab;
            tabView.update();
        }
        tabView.setFocusable(true);
        int i2 = this.requestedTabMinWidth;
        if (i2 == -1) {
            int i3 = this.mode;
            if (i3 == 0 || i3 == 2) {
                i = this.scrollableTabMinWidth;
            } else {
                i = 0;
            }
            i2 = i;
        }
        tabView.setMinimumWidth(i2);
        if (TextUtils.isEmpty(tab.contentDesc)) {
            tabView.setContentDescription(tab.text);
        } else {
            tabView.setContentDescription(tab.contentDesc);
        }
        tab.view = tabView;
        int i4 = tab.id;
        if (i4 != -1) {
            tabView.setId(i4);
        }
        return tab;
    }

    public final void populateFromPagerAdapter() {
        for (int childCount = this.slidingTabIndicator.getChildCount() - 1; childCount >= 0; childCount--) {
            TabView tabView = (TabView) this.slidingTabIndicator.getChildAt(childCount);
            this.slidingTabIndicator.removeViewAt(childCount);
            if (tabView != null) {
                if (tabView.tab != null) {
                    tabView.tab = null;
                    tabView.update();
                }
                tabView.setSelected(false);
                this.tabViewPool.release(tabView);
            }
            requestLayout();
        }
        Iterator<Tab> it = this.tabs.iterator();
        while (it.hasNext()) {
            Tab next = it.next();
            it.remove();
            next.parent = null;
            next.view = null;
            next.icon = null;
            next.id = -1;
            next.text = null;
            next.contentDesc = null;
            next.position = -1;
            next.customView = null;
            tabPool.release(next);
        }
        this.selectedTab = null;
    }

    public final void selectTab(Tab tab, boolean z) {
        int i;
        Tab tab2 = this.selectedTab;
        if (tab2 != tab) {
            if (tab != null) {
                i = tab.position;
            } else {
                i = -1;
            }
            if (z) {
                if ((tab2 == null || tab2.position == -1) && i != -1) {
                    setScrollPosition(i, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, true, true);
                } else {
                    animateToTab(i);
                }
                if (i != -1) {
                    setSelectedTabView(i);
                }
            }
            this.selectedTab = tab;
            if (tab2 != null) {
                for (int size = this.selectedListeners.size() - 1; size >= 0; size--) {
                    this.selectedListeners.get(size).onTabUnselected();
                }
            }
            if (tab != null) {
                for (int size2 = this.selectedListeners.size() - 1; size2 >= 0; size2--) {
                    this.selectedListeners.get(size2).onTabSelected(tab);
                }
            }
        } else if (tab2 != null) {
            for (int size3 = this.selectedListeners.size() - 1; size3 >= 0; size3--) {
                this.selectedListeners.get(size3).onTabReselected();
            }
            animateToTab(tab.position);
        }
    }

    public final void setSelectedTabView(int i) {
        boolean z;
        int childCount = this.slidingTabIndicator.getChildCount();
        if (i < childCount) {
            for (int i2 = 0; i2 < childCount; i2++) {
                View childAt = this.slidingTabIndicator.getChildAt(i2);
                boolean z2 = true;
                if (i2 == i) {
                    z = true;
                } else {
                    z = false;
                }
                childAt.setSelected(z);
                if (i2 != i) {
                    z2 = false;
                }
                childAt.setActivated(z2);
            }
        }
    }

    public final void setupWithViewPager(ViewPager viewPager, boolean z) {
        ArrayList arrayList;
        ArrayList arrayList2;
        ViewPager viewPager2 = this.viewPager;
        if (viewPager2 != null) {
            TabLayoutOnPageChangeListener tabLayoutOnPageChangeListener = this.pageChangeListener;
            if (!(tabLayoutOnPageChangeListener == null || (arrayList2 = viewPager2.mOnPageChangeListeners) == null)) {
                arrayList2.remove(tabLayoutOnPageChangeListener);
            }
            AdapterChangeListener adapterChangeListener = this.adapterChangeListener;
            if (!(adapterChangeListener == null || (arrayList = this.viewPager.mAdapterChangeListeners) == null)) {
                arrayList.remove(adapterChangeListener);
            }
        }
        ViewPagerOnTabSelectedListener viewPagerOnTabSelectedListener = this.currentVpSelectedListener;
        if (viewPagerOnTabSelectedListener != null) {
            this.selectedListeners.remove(viewPagerOnTabSelectedListener);
            this.currentVpSelectedListener = null;
        }
        if (viewPager != null) {
            this.viewPager = viewPager;
            if (this.pageChangeListener == null) {
                this.pageChangeListener = new TabLayoutOnPageChangeListener(this);
            }
            TabLayoutOnPageChangeListener tabLayoutOnPageChangeListener2 = this.pageChangeListener;
            tabLayoutOnPageChangeListener2.scrollState = 0;
            tabLayoutOnPageChangeListener2.previousScrollState = 0;
            if (viewPager.mOnPageChangeListeners == null) {
                viewPager.mOnPageChangeListeners = new ArrayList();
            }
            viewPager.mOnPageChangeListeners.add(tabLayoutOnPageChangeListener2);
            ViewPagerOnTabSelectedListener viewPagerOnTabSelectedListener2 = new ViewPagerOnTabSelectedListener(viewPager);
            this.currentVpSelectedListener = viewPagerOnTabSelectedListener2;
            addOnTabSelectedListener(viewPagerOnTabSelectedListener2);
            if (this.adapterChangeListener == null) {
                this.adapterChangeListener = new AdapterChangeListener();
            }
            this.adapterChangeListener.getClass();
            AdapterChangeListener adapterChangeListener2 = this.adapterChangeListener;
            if (viewPager.mAdapterChangeListeners == null) {
                viewPager.mAdapterChangeListeners = new ArrayList();
            }
            viewPager.mAdapterChangeListeners.add(adapterChangeListener2);
            setScrollPosition(viewPager.mCurItem, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, true, true);
        } else {
            this.viewPager = null;
            populateFromPagerAdapter();
        }
        this.setupViewPagerImplicitly = z;
    }

    @Override // android.widget.HorizontalScrollView, android.widget.FrameLayout, android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        if (Math.max(0, ((this.slidingTabIndicator.getWidth() - getWidth()) - getPaddingLeft()) - getPaddingRight()) > 0) {
            return true;
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:49:0x0269, code lost:
        if (r13 != 2) goto L53;
     */
    /* JADX WARN: Finally extract failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public TabLayout(android.content.Context r13, android.util.AttributeSet r14, int r15) {
        /*
            Method dump skipped, instructions count: 644
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.tabs.TabLayout.<init>(android.content.Context, android.util.AttributeSet, int):void");
    }

    @Override // android.widget.HorizontalScrollView, android.view.ViewGroup, android.view.ViewManager
    public final void addView(View view, ViewGroup.LayoutParams layoutParams) {
        addViewInternal(view);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        Drawable background = getBackground();
        if (background instanceof MaterialShapeDrawable) {
            R$layout.setParentAbsoluteElevation(this, (MaterialShapeDrawable) background);
        }
        if (this.viewPager == null) {
            ViewParent parent = getParent();
            if (parent instanceof ViewPager) {
                setupWithViewPager((ViewPager) parent, true);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.setupViewPagerImplicitly) {
            setupWithViewPager(null, false);
            this.setupViewPagerImplicitly = false;
        }
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setCollectionInfo((AccessibilityNodeInfo.CollectionInfo) AccessibilityNodeInfoCompat.CollectionInfoCompat.obtain(1, this.tabs.size(), 1).mInfo);
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x009f, code lost:
        if (r0 != 2) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00aa, code lost:
        if (r8.getMeasuredWidth() != getMeasuredWidth()) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00ac, code lost:
        r2 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00b6, code lost:
        if (r8.getMeasuredWidth() < getMeasuredWidth()) goto L43;
     */
    @Override // android.widget.HorizontalScrollView, android.widget.FrameLayout, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onMeasure(int r8, int r9) {
        /*
            r7 = this;
            android.content.Context r0 = r7.getContext()
            java.util.ArrayList<com.google.android.material.tabs.TabLayout$Tab> r1 = r7.tabs
            int r1 = r1.size()
            r2 = 0
            r3 = r2
        Lc:
            r4 = 1
            if (r3 >= r1) goto L2a
            java.util.ArrayList<com.google.android.material.tabs.TabLayout$Tab> r5 = r7.tabs
            java.lang.Object r5 = r5.get(r3)
            com.google.android.material.tabs.TabLayout$Tab r5 = (com.google.android.material.tabs.TabLayout.Tab) r5
            if (r5 == 0) goto L27
            android.graphics.drawable.Drawable r6 = r5.icon
            if (r6 == 0) goto L27
            java.lang.CharSequence r5 = r5.text
            boolean r5 = android.text.TextUtils.isEmpty(r5)
            if (r5 != 0) goto L27
            r1 = r4
            goto L2b
        L27:
            int r3 = r3 + 1
            goto Lc
        L2a:
            r1 = r2
        L2b:
            if (r1 == 0) goto L34
            boolean r1 = r7.inlineLabel
            if (r1 != 0) goto L34
            r1 = 72
            goto L36
        L34:
            r1 = 48
        L36:
            float r0 = com.google.android.material.internal.ViewUtils.dpToPx(r0, r1)
            int r0 = java.lang.Math.round(r0)
            int r1 = android.view.View.MeasureSpec.getMode(r9)
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = 1073741824(0x40000000, float:2.0)
            if (r1 == r3) goto L5a
            if (r1 == 0) goto L4b
            goto L6d
        L4b:
            int r9 = r7.getPaddingTop()
            int r9 = r9 + r0
            int r0 = r7.getPaddingBottom()
            int r0 = r0 + r9
            int r9 = android.view.View.MeasureSpec.makeMeasureSpec(r0, r5)
            goto L6d
        L5a:
            int r1 = r7.getChildCount()
            if (r1 != r4) goto L6d
            int r1 = android.view.View.MeasureSpec.getSize(r9)
            if (r1 < r0) goto L6d
            android.view.View r1 = r7.getChildAt(r2)
            r1.setMinimumHeight(r0)
        L6d:
            int r0 = android.view.View.MeasureSpec.getSize(r8)
            int r1 = android.view.View.MeasureSpec.getMode(r8)
            if (r1 == 0) goto L8b
            int r1 = r7.requestedTabMaxWidth
            if (r1 <= 0) goto L7c
            goto L89
        L7c:
            float r0 = (float) r0
            android.content.Context r1 = r7.getContext()
            r3 = 56
            float r1 = com.google.android.material.internal.ViewUtils.dpToPx(r1, r3)
            float r0 = r0 - r1
            int r1 = (int) r0
        L89:
            r7.tabMaxWidth = r1
        L8b:
            super.onMeasure(r8, r9)
            int r8 = r7.getChildCount()
            if (r8 != r4) goto Ld9
            android.view.View r8 = r7.getChildAt(r2)
            int r0 = r7.mode
            if (r0 == 0) goto Lae
            if (r0 == r4) goto La2
            r1 = 2
            if (r0 == r1) goto Lae
            goto Lb9
        La2:
            int r0 = r8.getMeasuredWidth()
            int r1 = r7.getMeasuredWidth()
            if (r0 == r1) goto Lb9
        Lac:
            r2 = r4
            goto Lb9
        Lae:
            int r0 = r8.getMeasuredWidth()
            int r1 = r7.getMeasuredWidth()
            if (r0 >= r1) goto Lb9
            goto Lac
        Lb9:
            if (r2 == 0) goto Ld9
            int r0 = r7.getPaddingTop()
            int r1 = r7.getPaddingBottom()
            int r1 = r1 + r0
            android.view.ViewGroup$LayoutParams r0 = r8.getLayoutParams()
            int r0 = r0.height
            int r9 = android.view.ViewGroup.getChildMeasureSpec(r9, r1, r0)
            int r7 = r7.getMeasuredWidth()
            int r7 = android.view.View.MeasureSpec.makeMeasureSpec(r7, r5)
            r8.measure(r7, r9)
        Ld9:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.tabs.TabLayout.onMeasure(int, int):void");
    }

    @Override // android.view.View
    public final void setElevation(float f) {
        super.setElevation(f);
        Drawable background = getBackground();
        if (background instanceof MaterialShapeDrawable) {
            ((MaterialShapeDrawable) background).setElevation(f);
        }
    }

    @Override // android.widget.HorizontalScrollView, android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        addViewInternal(view);
    }
}
