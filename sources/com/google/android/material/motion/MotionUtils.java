package com.google.android.material.motion;

import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public final class MotionUtils {
    public static float getControlPoint(String[] strArr, int i) {
        float parseFloat = Float.parseFloat(strArr[i]);
        if (parseFloat >= HingeAngleProviderKt.FULLY_CLOSED_DEGREES && parseFloat <= 1.0f) {
            return parseFloat;
        }
        throw new IllegalArgumentException("Motion easing control point value must be between 0 and 1; instead got: " + parseFloat);
    }

    public static boolean isEasingType(String str, String str2) {
        if (!str.startsWith(str2 + "(") || !str.endsWith(")")) {
            return false;
        }
        return true;
    }
}
