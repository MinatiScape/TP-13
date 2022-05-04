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
            r4 = 3
            if (r3 == r4) goto Lc
            goto L13
        Lc:
            r2 = r2 & (-2)
            goto L13
        Lf:
            if (r4 == 0) goto Lc
            r2 = r2 | 1
        L13:
            if (r5 == 0) goto L17
            r2 = r2 | r0
            goto L19
        L17:
            r2 = r2 & (-3)
        L19:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.systemui.shared.recents.utilities.Utilities.calculateBackDispositionHints(int, int, boolean, boolean):int");
    }

    public static float clamp(float f, float f2, float f3) {
        return Math.max(f2, Math.min(f3, f));
    }

    public static float computeContrastBetweenColors(int i, int i2) {
        float red = Color.red(i) / 255.0f;
        float green = Color.green(i) / 255.0f;
        float blue = Color.blue(i) / 255.0f;
        float pow = red < 0.03928f ? red / 12.92f : (float) Math.pow((red + 0.055f) / 1.055f, 2.4000000953674316d);
        float pow2 = green < 0.03928f ? green / 12.92f : (float) Math.pow((green + 0.055f) / 1.055f, 2.4000000953674316d);
        float pow3 = ((blue < 0.03928f ? blue / 12.92f : (float) Math.pow((blue + 0.055f) / 1.055f, 2.4000000953674316d)) * 0.0722f) + (pow2 * 0.7152f) + (pow * 0.2126f);
        float red2 = Color.red(i2) / 255.0f;
        float green2 = Color.green(i2) / 255.0f;
        float blue2 = Color.blue(i2) / 255.0f;
        float pow4 = red2 < 0.03928f ? red2 / 12.92f : (float) Math.pow((red2 + 0.055f) / 1.055f, 2.4000000953674316d);
        return Math.abs(((((blue2 < 0.03928f ? blue2 / 12.92f : (float) Math.pow((blue2 + 0.055f) / 1.055f, 2.4000000953674316d)) * 0.0722f) + (((green2 < 0.03928f ? green2 / 12.92f : (float) Math.pow((green2 + 0.055f) / 1.055f, 2.4000000953674316d)) * 0.7152f) + (pow4 * 0.2126f))) + 0.05f) / (pow3 + 0.05f));
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
        return dpiFromPx((float) Math.min(bounds.width(), bounds.height()), context.getResources().getConfiguration().densityDpi) >= TABLET_MIN_DPS;
    }

    public static void postAtFrontOfQueueAsynchronously(Handler handler, Runnable runnable) {
        handler.sendMessageAtFrontOfQueue(handler.obtainMessage().setCallback(runnable));
    }
}
