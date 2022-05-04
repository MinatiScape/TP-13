package com.android.systemui.shared.rotation;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.android.systemui.navigationbar.buttons.KeyButtonRipple;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public class FloatingRotationButtonView extends ImageView {
    private static final float BACKGROUND_ALPHA = 0.92f;
    private final Configuration mLastConfiguration;
    private final Paint mOvalBgPaint;
    private KeyButtonRipple mRipple;

    public FloatingRotationButtonView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        float min = Math.min(getWidth(), getHeight());
        canvas.drawOval(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, min, min, this.mOvalBgPaint);
        super.draw(canvas);
    }

    @Override // android.view.View
    public void onConfigurationChanged(Configuration configuration) {
        KeyButtonRipple keyButtonRipple;
        int updateFrom = this.mLastConfiguration.updateFrom(configuration);
        if (((updateFrom & QuickStepContract.SYSUI_STATE_SEARCH_DISABLED) != 0 || (updateFrom & QuickStepContract.SYSUI_STATE_TRACING_ENABLED) != 0) && (keyButtonRipple = this.mRipple) != null) {
            keyButtonRipple.updateResources();
        }
    }

    @Override // android.view.View
    public void onWindowVisibilityChanged(int i) {
        super.onWindowVisibilityChanged(i);
        if (i != 0) {
            jumpDrawablesToCurrentState();
        }
    }

    public void setColors(int i, int i2) {
        getDrawable().setColorFilter(new PorterDuffColorFilter(i, PorterDuff.Mode.SRC_IN));
        this.mOvalBgPaint.setColor(Color.valueOf(Color.red(i2), Color.green(i2), Color.blue(i2), BACKGROUND_ALPHA).toArgb());
        this.mRipple.setType(KeyButtonRipple.Type.OVAL);
    }

    public void setDarkIntensity(float f) {
        this.mRipple.setDarkIntensity(f);
    }

    public void setRipple(int i) {
        KeyButtonRipple keyButtonRipple = new KeyButtonRipple(getContext(), this, i);
        this.mRipple = keyButtonRipple;
        setBackground(keyButtonRipple);
    }

    public FloatingRotationButtonView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mOvalBgPaint = new Paint(3);
        this.mLastConfiguration = getResources().getConfiguration();
        setClickable(true);
        setWillNotDraw(false);
        forceHasOverlappingRendering(false);
    }
}
