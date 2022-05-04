package com.google.android.material.tabs;

import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.google.android.material.animation.AnimationUtils;
/* loaded from: classes.dex */
public final class ElasticTabIndicatorInterpolator extends TabIndicatorInterpolator {
    @Override // com.google.android.material.tabs.TabIndicatorInterpolator
    public final void updateIndicatorForOffset(TabLayout tabLayout, View view, View view2, float f, Drawable drawable) {
        boolean z;
        float f2;
        float f3;
        RectF calculateIndicatorWidthForTab = TabIndicatorInterpolator.calculateIndicatorWidthForTab(tabLayout, view);
        RectF calculateIndicatorWidthForTab2 = TabIndicatorInterpolator.calculateIndicatorWidthForTab(tabLayout, view2);
        if (calculateIndicatorWidthForTab.left < calculateIndicatorWidthForTab2.left) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            double d = (f * 3.141592653589793d) / 2.0d;
            f2 = (float) (1.0d - Math.cos(d));
            f3 = (float) Math.sin(d);
        } else {
            double d2 = (f * 3.141592653589793d) / 2.0d;
            f2 = (float) Math.sin(d2);
            f3 = (float) (1.0d - Math.cos(d2));
        }
        drawable.setBounds(AnimationUtils.lerp((int) calculateIndicatorWidthForTab.left, (int) calculateIndicatorWidthForTab2.left, f2), drawable.getBounds().top, AnimationUtils.lerp((int) calculateIndicatorWidthForTab.right, (int) calculateIndicatorWidthForTab2.right, f3), drawable.getBounds().bottom);
    }
}
