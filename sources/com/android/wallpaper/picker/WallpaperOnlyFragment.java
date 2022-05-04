package com.android.wallpaper.picker;

import com.android.customization.model.color.ColorOption$$ExternalSyntheticLambda2;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.CustomizationSectionController;
import java.util.List;
import java.util.stream.Collectors;
/* loaded from: classes.dex */
public class WallpaperOnlyFragment extends CustomizationPickerFragment {
    public static final /* synthetic */ int $r8$clinit = 0;

    @Override // com.android.wallpaper.picker.CustomizationPickerFragment
    public final List<CustomizationSectionController<?>> getAvailableSections(List<CustomizationSectionController<?>> list) {
        return super.getAvailableSections((List) list.stream().filter(ColorOption$$ExternalSyntheticLambda2.INSTANCE$1).collect(Collectors.toList()));
    }

    @Override // com.android.wallpaper.picker.CustomizationPickerFragment, com.android.wallpaper.picker.AppbarFragment
    public final CharSequence getDefaultTitle() {
        return getString(R.string.wallpaper_app_name);
    }
}
