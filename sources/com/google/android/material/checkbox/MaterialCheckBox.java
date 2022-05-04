package com.google.android.material.checkbox;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import androidx.appcompat.R$bool;
import androidx.appcompat.widget.AppCompatCheckBox;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.R$styleable;
import com.google.android.material.internal.ThemeEnforcement;
import com.google.android.material.internal.ViewUtils;
import com.google.android.material.resources.MaterialResources;
import com.google.android.material.theme.overlay.MaterialThemeOverlay;
/* loaded from: classes.dex */
public final class MaterialCheckBox extends AppCompatCheckBox {
    public static final int[][] ENABLED_CHECKED_STATES = {new int[]{16842910, 16842912}, new int[]{16842910, -16842912}, new int[]{-16842910, 16842912}, new int[]{-16842910, -16842912}};
    public boolean centerIfNoTextEnabled;
    public ColorStateList materialThemeColorsTintList;
    public boolean useMaterialThemeColors;

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void onDraw(Canvas canvas) {
        Drawable buttonDrawable;
        int i;
        if (!this.centerIfNoTextEnabled || !TextUtils.isEmpty(getText()) || (buttonDrawable = getButtonDrawable()) == null) {
            super.onDraw(canvas);
            return;
        }
        if (ViewUtils.isLayoutRtl(this)) {
            i = -1;
        } else {
            i = 1;
        }
        int width = ((getWidth() - buttonDrawable.getIntrinsicWidth()) / 2) * i;
        int save = canvas.save();
        canvas.translate(width, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        super.onDraw(canvas);
        canvas.restoreToCount(save);
        if (getBackground() != null) {
            Rect bounds = buttonDrawable.getBounds();
            getBackground().setHotspotBounds(bounds.left + width, bounds.top, bounds.right + width, bounds.bottom);
        }
    }

    public MaterialCheckBox(Context context, AttributeSet attributeSet) {
        super(MaterialThemeOverlay.wrap(context, attributeSet, R.attr.checkboxStyle, R.style.Widget_MaterialComponents_CompoundButton_CheckBox), attributeSet, R.attr.checkboxStyle);
        Context context2 = getContext();
        TypedArray obtainStyledAttributes = ThemeEnforcement.obtainStyledAttributes(context2, attributeSet, R$styleable.MaterialCheckBox, R.attr.checkboxStyle, R.style.Widget_MaterialComponents_CompoundButton_CheckBox, new int[0]);
        if (obtainStyledAttributes.hasValue(0)) {
            setButtonTintList(MaterialResources.getColorStateList(context2, obtainStyledAttributes, 0));
        }
        this.useMaterialThemeColors = obtainStyledAttributes.getBoolean(2, false);
        this.centerIfNoTextEnabled = obtainStyledAttributes.getBoolean(1, true);
        obtainStyledAttributes.recycle();
    }

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.useMaterialThemeColors && getButtonTintList() == null) {
            this.useMaterialThemeColors = true;
            if (this.materialThemeColorsTintList == null) {
                int[][] iArr = ENABLED_CHECKED_STATES;
                int color = R$bool.getColor(this, R.attr.colorControlActivated);
                int color2 = R$bool.getColor(this, R.attr.colorSurface);
                int color3 = R$bool.getColor(this, R.attr.colorOnSurface);
                this.materialThemeColorsTintList = new ColorStateList(iArr, new int[]{R$bool.layer(color2, color, 1.0f), R$bool.layer(color2, color3, 0.54f), R$bool.layer(color2, color3, 0.38f), R$bool.layer(color2, color3, 0.38f)});
            }
            setButtonTintList(this.materialThemeColorsTintList);
        }
    }
}
