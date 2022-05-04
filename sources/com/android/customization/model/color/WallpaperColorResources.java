package com.android.customization.model.color;

import android.app.WallpaperColors;
import android.util.SparseIntArray;
import com.android.systemui.monet.ColorScheme;
import java.util.List;
/* loaded from: classes.dex */
public class WallpaperColorResources {
    public final SparseIntArray mColorOverlay = new SparseIntArray();

    public WallpaperColorResources(WallpaperColors wallpaperColors) {
        ColorScheme colorScheme = new ColorScheme(wallpaperColors, false);
        addOverlayColor(colorScheme.getNeutral1(), 17170462);
        addOverlayColor(colorScheme.getNeutral2(), 17170475);
        addOverlayColor(colorScheme.getAccent1(), 17170488);
        addOverlayColor(colorScheme.getAccent2(), 17170501);
        addOverlayColor(colorScheme.getAccent3(), 17170514);
    }

    public final void addOverlayColor(List<Integer> list, int i) {
        for (Integer num : list) {
            this.mColorOverlay.put(i, num.intValue());
            i++;
        }
    }
}
