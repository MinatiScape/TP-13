package com.google.android.material.snackbar;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import com.android.systemui.shared.R;
import com.google.android.material.snackbar.BaseTransientBottomBar;
import com.google.common.math.IntMath;
/* loaded from: classes.dex */
public final class Snackbar extends BaseTransientBottomBar<Snackbar> {
    public static final int[] SNACKBAR_CONTENT_STYLE_ATTRS = {R.attr.snackbarButtonStyle, R.attr.snackbarTextViewStyle};
    public final AccessibilityManager accessibilityManager;
    public boolean hasAction;

    /* loaded from: classes.dex */
    public static final class SnackbarLayout extends BaseTransientBottomBar.SnackbarBaseLayout {
        public SnackbarLayout(Context context) {
            super(context);
        }

        public SnackbarLayout(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        @Override // com.google.android.material.snackbar.BaseTransientBottomBar.SnackbarBaseLayout, android.widget.FrameLayout, android.view.View
        public final void onMeasure(int i, int i2) {
            super.onMeasure(i, i2);
            int childCount = getChildCount();
            int measuredWidth = (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
            for (int i3 = 0; i3 < childCount; i3++) {
                View childAt = getChildAt(i3);
                if (childAt.getLayoutParams().width == -1) {
                    childAt.measure(View.MeasureSpec.makeMeasureSpec(measuredWidth, IntMath.MAX_SIGNED_POWER_OF_TWO), View.MeasureSpec.makeMeasureSpec(childAt.getMeasuredHeight(), IntMath.MAX_SIGNED_POWER_OF_TWO));
                }
            }
        }
    }

    @Override // com.google.android.material.snackbar.BaseTransientBottomBar
    public final void dismiss() {
        dispatchDismiss(3);
    }

    public final int getDuration() {
        int i;
        int i2 = this.duration;
        if (i2 == -2) {
            return -2;
        }
        if (this.hasAction) {
            i = 4;
        } else {
            i = 0;
        }
        return this.accessibilityManager.getRecommendedTimeoutMillis(i2, i | 1 | 2);
    }

    public Snackbar(Context context, ViewGroup viewGroup, SnackbarContentLayout snackbarContentLayout, SnackbarContentLayout snackbarContentLayout2) {
        super(context, viewGroup, snackbarContentLayout, snackbarContentLayout2);
        this.accessibilityManager = (AccessibilityManager) viewGroup.getContext().getSystemService("accessibility");
    }
}
