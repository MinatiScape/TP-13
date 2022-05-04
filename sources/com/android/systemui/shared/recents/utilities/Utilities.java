package com.android.systemui.shared.recents.utilities;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.Handler;
import android.view.WindowManager;
/* loaded from: classes.dex */
public class Utilities {
    private static final float TABLET_MIN_DPS = 600.0f;

    /* JADX WARN: Code restructure failed: missing block: B:8:0x0009, code lost:
        if (r3 != 3) goto L12;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int calculateBackDispositionHints(int r2, int r3, boolean r4, boolean r5) {
        /*
            r0 = 2
            if (r3 == 0) goto Lf
            r1 = 1
            if (r3 == r1) goto Lf
            if (r3 == r0) goto Lf
            r1 = 3
            if (r3 == r1) goto Lc
            goto L13
        Lc:
            r2 = r2 & (-2)
            goto L13
        Lf:
            if (r4 == 0) goto Lc
            r2 = r2 | 1
        L13:
            if (r4 == 0) goto L17
            r2 = r2 | r0
            goto L19
        L17:
            r2 = r2 & (-3)
        L19:
            if (r5 == 0) goto L1e
            r2 = r2 | 4
            goto L20
        L1e:
            r2 = r2 & (-5)
        L20:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.systemui.shared.recents.utilities.Utilities.calculateBackDispositionHints(int, int, boolean, boolean):int");
    }

    public static float dpiFromPx(float f, int i) {
        return f / (i / 160.0f);
    }

    public static boolean isRotationAnimationCCW(int i, int i2) {
        if (i == 0 && i2 == 1) {
            return false;
        }
        if (i == 0 && i2 == 2) {
            return true;
        }
        if (i == 0 && i2 == 3) {
            return true;
        }
        if (i == 1 && i2 == 0) {
            return true;
        }
        if (i == 1 && i2 == 2) {
            return false;
        }
        if (i == 1 && i2 == 3) {
            return true;
        }
        if (i == 2 && i2 == 0) {
            return true;
        }
        if (i == 2 && i2 == 1) {
            return true;
        }
        if (i == 2 && i2 == 3) {
            return false;
        }
        if (i == 3 && i2 == 0) {
            return false;
        }
        if (i == 3 && i2 == 1) {
            return true;
        }
        return i == 3 && i2 == 2;
    }

    @TargetApi(30)
    public static boolean isTablet(Context context) {
        Rect bounds = ((WindowManager) context.getSystemService(WindowManager.class)).getCurrentWindowMetrics().getBounds();
        if (dpiFromPx(Math.min(bounds.width(), bounds.height()), context.getResources().getConfiguration().densityDpi) >= TABLET_MIN_DPS) {
            return true;
        }
        return false;
    }

    public static float clamp(float f, float f2, float f3) {
        return Math.max(f2, Math.min(f3, f));
    }

    public static float computeContrastBetweenColors(int i, int i2) {
        float f;
        float f2;
        float f3;
        float f4;
        float f5;
        float f6;
        float red = Color.red(i) / 255.0f;
        float green = Color.green(i) / 255.0f;
        float blue = Color.blue(i) / 255.0f;
        if (red < 0.03928f) {
            f = red / 12.92f;
        } else {
            f = (float) Math.pow((red + 0.055f) / 1.055f, 2.4000000953674316d);
        }
        if (green < 0.03928f) {
            f2 = green / 12.92f;
        } else {
            f2 = (float) Math.pow((green + 0.055f) / 1.055f, 2.4000000953674316d);
        }
        if (blue < 0.03928f) {
            f3 = blue / 12.92f;
        } else {
            f3 = (float) Math.pow((blue + 0.055f) / 1.055f, 2.4000000953674316d);
        }
        float f7 = f3 * 0.0722f;
        float f8 = f7 + (f2 * 0.7152f) + (f * 0.2126f);
        float red2 = Color.red(i2) / 255.0f;
        float green2 = Color.green(i2) / 255.0f;
        float blue2 = Color.blue(i2) / 255.0f;
        if (red2 < 0.03928f) {
            f4 = red2 / 12.92f;
        } else {
            f4 = (float) Math.pow((red2 + 0.055f) / 1.055f, 2.4000000953674316d);
        }
        if (green2 < 0.03928f) {
            f5 = green2 / 12.92f;
        } else {
            f5 = (float) Math.pow((green2 + 0.055f) / 1.055f, 2.4000000953674316d);
        }
        if (blue2 < 0.03928f) {
            f6 = blue2 / 12.92f;
        } else {
            f6 = (float) Math.pow((blue2 + 0.055f) / 1.055f, 2.4000000953674316d);
        }
        return Math.abs((((f6 * 0.0722f) + ((f5 * 0.7152f) + (f4 * 0.2126f))) + 0.05f) / (f8 + 0.05f));
    }

    public static void postAtFrontOfQueueAsynchronously(Handler handler, Runnable runnable) {
        handler.sendMessageAtFrontOfQueue(handler.obtainMessage().setCallback(runnable));
    }
}
