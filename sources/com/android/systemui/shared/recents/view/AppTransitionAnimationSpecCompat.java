package com.android.systemui.shared.recents.view;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.hardware.HardwareBuffer;
import android.view.AppTransitionAnimationSpec;
/* loaded from: classes.dex */
public class AppTransitionAnimationSpecCompat {
    private Bitmap mBuffer;
    private Rect mRect;
    private int mTaskId;

    public AppTransitionAnimationSpec toAppTransitionAnimationSpec() {
        HardwareBuffer hardwareBuffer;
        int i = this.mTaskId;
        Bitmap bitmap = this.mBuffer;
        if (bitmap != null) {
            hardwareBuffer = bitmap.getHardwareBuffer();
        } else {
            hardwareBuffer = null;
        }
        return new AppTransitionAnimationSpec(i, hardwareBuffer, this.mRect);
    }

    public AppTransitionAnimationSpecCompat(int i, Bitmap bitmap, Rect rect) {
        this.mTaskId = i;
        this.mBuffer = bitmap;
        this.mRect = rect;
    }
}
