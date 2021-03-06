package com.google.android.material.shadow;

import android.graphics.Paint;
import android.graphics.Path;
import androidx.core.graphics.ColorUtils;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public final class ShadowRenderer {
    public final Paint cornerShadowPaint;
    public final Paint edgeShadowPaint;
    public int shadowEndColor;
    public int shadowMiddleColor;
    public int shadowStartColor;
    public static final int[] edgeColors = new int[3];
    public static final float[] edgePositions = {HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0.5f, 1.0f};
    public static final int[] cornerColors = new int[4];
    public static final float[] cornerPositions = {HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0.5f, 1.0f};
    public final Path scratch = new Path();
    public Paint transparentPaint = new Paint();
    public final Paint shadowPaint = new Paint();

    public final void setShadowColor(int i) {
        this.shadowStartColor = ColorUtils.setAlphaComponent(i, 68);
        this.shadowMiddleColor = ColorUtils.setAlphaComponent(i, 20);
        this.shadowEndColor = ColorUtils.setAlphaComponent(i, 0);
        this.shadowPaint.setColor(this.shadowStartColor);
    }

    public ShadowRenderer() {
        setShadowColor(-16777216);
        this.transparentPaint.setColor(0);
        Paint paint = new Paint(4);
        this.cornerShadowPaint = paint;
        paint.setStyle(Paint.Style.FILL);
        this.edgeShadowPaint = new Paint(paint);
    }
}
