package com.google.android.material.tabs;

import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.animation.AnimationUtils;
/* loaded from: classes.dex */
public final class FadeTabIndicatorInterpolator extends TabIndicatorInterpolator {
    @Override // com.google.android.material.tabs.TabIndicatorInterpolator
    public final void updateIndicatorForOffset(TabLayout tabLayout, View view, View view2, float f, Drawable drawable) {
        float f2;
        int i = (f > 0.5f ? 1 : (f == 0.5f ? 0 : -1));
        if (i >= 0) {
            view = view2;
        }
        RectF calculateIndicatorWidthForTab = TabIndicatorInterpolator.calculateIndicatorWidthForTab(tabLayout, view);
        if (i < 0) {
            f2 = AnimationUtils.lerp(1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0.5f, f);
        } else {
            f2 = AnimationUtils.lerp(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f, 0.5f, 1.0f, f);
        }
        drawable.setBounds((int) calculateIndicatorWidthForTab.left, drawable.getBounds().top, (int) calculateIndicatorWidthForTab.right, drawable.getBounds().bottom);
        drawable.setAlpha((int) (f2 * 255.0f));
    }
}
