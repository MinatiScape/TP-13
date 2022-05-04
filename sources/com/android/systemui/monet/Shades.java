package com.android.systemui.monet;

import com.android.internal.annotations.VisibleForTesting;
import com.android.internal.graphics.ColorUtils;
@VisibleForTesting
/* loaded from: classes.dex */
public class Shades {
    public static final float MIDDLE_LSTAR = 49.6f;

    public static int[] of(float f, float f2) {
        float f3;
        int[] iArr = new int[12];
        iArr[0] = ColorUtils.CAMToColor(f, Math.min(40.0f, f2), 99.0f);
        iArr[1] = ColorUtils.CAMToColor(f, Math.min(40.0f, f2), 95.0f);
        for (int i = 2; i < 12; i++) {
            if (i == 6) {
                f3 = 49.6f;
            } else {
                f3 = 100 - ((i - 1) * 10);
            }
            if (f3 >= 90.0f) {
                f2 = Math.min(40.0f, f2);
            }
            iArr[i] = ColorUtils.CAMToColor(f, f2, f3);
        }
        return iArr;
    }
}
