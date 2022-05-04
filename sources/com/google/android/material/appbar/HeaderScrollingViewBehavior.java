package com.google.android.material.appbar;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.math.MathUtils;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.recyclerview.widget.RecyclerView;
import com.google.common.math.IntMath;
import java.util.List;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public abstract class HeaderScrollingViewBehavior extends ViewOffsetBehavior<View> {
    public int overlayTop;
    public final Rect tempRect1 = new Rect();
    public final Rect tempRect2 = new Rect();
    public int verticalLayoutGap = 0;

    public HeaderScrollingViewBehavior() {
    }

    public abstract AppBarLayout findFirstDependency$1(List list);

    public float getOverlapRatioForOffset(View view) {
        return 1.0f;
    }

    public int getScrollRange(View view) {
        return view.getMeasuredHeight();
    }

    @Override // com.google.android.material.appbar.ViewOffsetBehavior
    public final void layoutChild(CoordinatorLayout coordinatorLayout, View view, int i) {
        AppBarLayout findFirstDependency$1 = findFirstDependency$1(coordinatorLayout.getDependencies(view));
        int i2 = 0;
        if (findFirstDependency$1 != null) {
            CoordinatorLayout.LayoutParams layoutParams = (CoordinatorLayout.LayoutParams) view.getLayoutParams();
            Rect rect = this.tempRect1;
            rect.set(coordinatorLayout.getPaddingLeft() + ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin, findFirstDependency$1.getBottom() + ((ViewGroup.MarginLayoutParams) layoutParams).topMargin, (coordinatorLayout.getWidth() - coordinatorLayout.getPaddingRight()) - ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin, ((findFirstDependency$1.getBottom() + coordinatorLayout.getHeight()) - coordinatorLayout.getPaddingBottom()) - ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin);
            WindowInsetsCompat windowInsetsCompat = coordinatorLayout.mLastInsets;
            if (windowInsetsCompat != null) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (ViewCompat.Api16Impl.getFitsSystemWindows(coordinatorLayout) && !ViewCompat.Api16Impl.getFitsSystemWindows(view)) {
                    rect.left = windowInsetsCompat.getSystemWindowInsetLeft() + rect.left;
                    rect.right -= windowInsetsCompat.getSystemWindowInsetRight();
                }
            }
            Rect rect2 = this.tempRect2;
            int i3 = layoutParams.gravity;
            if (i3 == 0) {
                i3 = 8388659;
            }
            Gravity.apply(i3, view.getMeasuredWidth(), view.getMeasuredHeight(), rect, rect2, i);
            if (this.overlayTop != 0) {
                float overlapRatioForOffset = getOverlapRatioForOffset(findFirstDependency$1);
                int i4 = this.overlayTop;
                i2 = MathUtils.clamp((int) (overlapRatioForOffset * i4), 0, i4);
            }
            view.layout(rect2.left, rect2.top - i2, rect2.right, rect2.bottom - i2);
            this.verticalLayoutGap = rect2.top - findFirstDependency$1.getBottom();
            return;
        }
        coordinatorLayout.onLayoutChild(view, i);
        this.verticalLayoutGap = 0;
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
    public final boolean onMeasureChild(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3) {
        AppBarLayout findFirstDependency$1;
        int i4;
        WindowInsetsCompat windowInsetsCompat;
        int i5 = view.getLayoutParams().height;
        if ((i5 != -1 && i5 != -2) || (findFirstDependency$1 = findFirstDependency$1(coordinatorLayout.getDependencies(view))) == null) {
            return false;
        }
        int size = View.MeasureSpec.getSize(i3);
        if (size > 0) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            if (ViewCompat.Api16Impl.getFitsSystemWindows(findFirstDependency$1) && (windowInsetsCompat = coordinatorLayout.mLastInsets) != null) {
                size += windowInsetsCompat.getSystemWindowInsetBottom() + windowInsetsCompat.getSystemWindowInsetTop();
            }
        } else {
            size = coordinatorLayout.getHeight();
        }
        int scrollRange = (getScrollRange(findFirstDependency$1) + size) - findFirstDependency$1.getMeasuredHeight();
        if (i5 == -1) {
            i4 = IntMath.MAX_SIGNED_POWER_OF_TWO;
        } else {
            i4 = RecyclerView.UNDEFINED_DURATION;
        }
        coordinatorLayout.onMeasureChild(view, i, i2, View.MeasureSpec.makeMeasureSpec(scrollRange, i4));
        return true;
    }

    public HeaderScrollingViewBehavior(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }
}
