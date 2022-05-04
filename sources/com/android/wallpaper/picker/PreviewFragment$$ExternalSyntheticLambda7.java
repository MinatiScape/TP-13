package com.android.wallpaper.picker;

import androidx.viewpager2.widget.ViewPager2;
import com.android.customization.model.color.ColorSectionController;
import com.android.systemui.shared.R;
import com.android.wallpaper.widget.SeparatedTabLayout;
import com.google.android.material.tabs.TabLayout;
import java.util.function.Supplier;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewFragment$$ExternalSyntheticLambda7 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ PreviewFragment$$ExternalSyntheticLambda7(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                ((PreviewFragment) this.f$0).mFullScreenAnimation.startAnimation(true);
                return;
            default:
                final ColorSectionController colorSectionController = ColorSectionController.this;
                colorSectionController.mColorSectionAdapter.notifyDataSetChanged();
                SeparatedTabLayout separatedTabLayout = colorSectionController.mTabLayout;
                if (separatedTabLayout != null && separatedTabLayout.tabs.size() == 0) {
                    SeparatedTabLayout separatedTabLayout2 = colorSectionController.mTabLayout;
                    TabLayout.Tab newTab = separatedTabLayout2.newTab();
                    newTab.setText(R.string.wallpaper_color_tab);
                    separatedTabLayout2.addTab(newTab, 0, separatedTabLayout2.tabs.isEmpty());
                    SeparatedTabLayout separatedTabLayout3 = colorSectionController.mTabLayout;
                    TabLayout.Tab newTab2 = separatedTabLayout3.newTab();
                    newTab2.setText(R.string.preset_color_tab);
                    separatedTabLayout3.addTab(newTab2, 1, separatedTabLayout3.tabs.isEmpty());
                }
                if (colorSectionController.mWallpaperColorOptions.isEmpty()) {
                    colorSectionController.mTabLayout.getTabAt(0).view.setEnabled(false);
                    colorSectionController.mColorSectionViewPager.setCurrentItem(1, false);
                    return;
                }
                colorSectionController.mColorSectionViewPager.setCurrentItem(colorSectionController.mTabPositionToRestore.orElseGet(new Supplier() { // from class: com.android.customization.model.color.ColorSectionController$$ExternalSyntheticLambda1
                    @Override // java.util.function.Supplier
                    public final Object get() {
                        return Integer.valueOf("preset".equals(ColorSectionController.this.mColorManager.getCurrentColorSource()) ? 1 : 0);
                    }
                }).intValue(), false);
                ViewPager2 viewPager2 = colorSectionController.mColorSectionViewPager;
                viewPager2.mUserInputEnabled = false;
                viewPager2.mAccessibilityProvider.updatePageAccessibilityActions();
                return;
        }
    }
}
