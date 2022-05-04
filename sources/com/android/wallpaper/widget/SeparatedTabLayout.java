package com.android.wallpaper.widget;

import android.content.Context;
import android.util.AttributeSet;
import androidx.viewpager2.widget.ViewPager2;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.tabs.TabLayout;
import java.lang.ref.WeakReference;
/* loaded from: classes.dex */
public final class SeparatedTabLayout extends TabLayout {

    /* loaded from: classes.dex */
    public static class SeparatedTabLayoutOnPageChangeCallback extends ViewPager2.OnPageChangeCallback {
        public int mPreviousScrollState = 0;
        public int mScrollState = 0;
        public final WeakReference<TabLayout> mTabLayoutRef;

        @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
        public final void onPageScrolled(int i, float f, int i2) {
            if (f == HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                boolean z = true;
                if (!(this.mPreviousScrollState == 1 && this.mScrollState == 2)) {
                    z = false;
                }
                if (z) {
                    updateTabPositionIfNeeded(i);
                }
            }
        }

        @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
        public final void onPageScrollStateChanged(int i) {
            this.mPreviousScrollState = this.mScrollState;
            this.mScrollState = i;
        }

        @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
        public final void onPageSelected(int i) {
            boolean z = true;
            if (!(this.mPreviousScrollState == 1 && this.mScrollState == 2)) {
                z = false;
            }
            if (!z) {
                updateTabPositionIfNeeded(i);
            }
        }

        public final void updateTabPositionIfNeeded(int i) {
            int i2;
            TabLayout tabLayout = this.mTabLayoutRef.get();
            if (tabLayout != null) {
                TabLayout.Tab tab = tabLayout.selectedTab;
                if (tab != null) {
                    i2 = tab.position;
                } else {
                    i2 = -1;
                }
                if (i2 != i && i < tabLayout.tabs.size()) {
                    tabLayout.selectTab(tabLayout.getTabAt(i), true);
                }
            }
        }

        public SeparatedTabLayoutOnPageChangeCallback(SeparatedTabLayout separatedTabLayout) {
            this.mTabLayoutRef = new WeakReference<>(separatedTabLayout);
        }
    }

    /* loaded from: classes.dex */
    public static class SeparatedTabLayoutOnTabSelectedListener implements TabLayout.OnTabSelectedListener {
        public final WeakReference<ViewPager2> mViewPagerRef;

        @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
        public final void onTabReselected() {
        }

        @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
        public final void onTabUnselected() {
        }

        @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
        public final void onTabSelected(TabLayout.Tab tab) {
            ViewPager2 viewPager2 = this.mViewPagerRef.get();
            if (viewPager2 != null) {
                int i = viewPager2.mCurrentItem;
                int i2 = tab.position;
                if (i != i2) {
                    viewPager2.setCurrentItem(i2, true);
                }
            }
        }

        public SeparatedTabLayoutOnTabSelectedListener(ViewPager2 viewPager2) {
            this.mViewPagerRef = new WeakReference<>(viewPager2);
        }
    }

    @Override // com.google.android.material.tabs.TabLayout
    public final TabLayout.Tab newTab() {
        TabLayout.Tab newTab = super.newTab();
        newTab.view.setBackgroundResource(R.drawable.separated_tabs_ripple_mask);
        return newTab;
    }

    public SeparatedTabLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }
}
