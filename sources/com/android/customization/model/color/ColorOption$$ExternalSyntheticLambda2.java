package com.android.customization.model.color;

import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.model.WallpaperSectionController;
import com.android.wallpaper.picker.WallpaperOnlyFragment;
import java.util.Map;
import java.util.function.Predicate;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ColorOption$$ExternalSyntheticLambda2 implements Predicate {
    public static final /* synthetic */ ColorOption$$ExternalSyntheticLambda2 INSTANCE = new ColorOption$$ExternalSyntheticLambda2(0);
    public static final /* synthetic */ ColorOption$$ExternalSyntheticLambda2 INSTANCE$1 = new ColorOption$$ExternalSyntheticLambda2(1);
    public final /* synthetic */ int $r8$classId;

    public /* synthetic */ ColorOption$$ExternalSyntheticLambda2(int i) {
        this.$r8$classId = i;
    }

    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        switch (this.$r8$classId) {
            case 0:
                if (((Map.Entry) obj).getValue() != null) {
                    return true;
                }
                return false;
            default:
                int i = WallpaperOnlyFragment.$r8$clinit;
                return ((CustomizationSectionController) obj) instanceof WallpaperSectionController;
        }
    }
}
