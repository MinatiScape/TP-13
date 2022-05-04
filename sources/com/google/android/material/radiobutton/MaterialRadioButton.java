package com.google.android.material.radiobutton;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import androidx.appcompat.R$bool;
import androidx.appcompat.widget.AppCompatRadioButton;
import com.android.systemui.shared.R;
import com.google.android.material.R$styleable;
import com.google.android.material.internal.ThemeEnforcement;
import com.google.android.material.resources.MaterialResources;
import com.google.android.material.theme.overlay.MaterialThemeOverlay;
/* loaded from: classes.dex */
public final class MaterialRadioButton extends AppCompatRadioButton {
    public static final int[][] ENABLED_CHECKED_STATES = {new int[]{16842910, 16842912}, new int[]{16842910, -16842912}, new int[]{-16842910, 16842912}, new int[]{-16842910, -16842912}};
    public ColorStateList materialThemeColorsTintList;
    public boolean useMaterialThemeColors;

    public MaterialRadioButton(Context context, AttributeSet attributeSet) {
        super(MaterialThemeOverlay.wrap(context, attributeSet, R.attr.radioButtonStyle, R.style.Widget_MaterialComponents_CompoundButton_RadioButton), attributeSet);
        Context context2 = getContext();
        TypedArray obtainStyledAttributes = ThemeEnforcement.obtainStyledAttributes(context2, attributeSet, R$styleable.MaterialRadioButton, R.attr.radioButtonStyle, R.style.Widget_MaterialComponents_CompoundButton_RadioButton, new int[0]);
        if (obtainStyledAttributes.hasValue(0)) {
            setButtonTintList(MaterialResources.getColorStateList(context2, obtainStyledAttributes, 0));
        }
        this.useMaterialThemeColors = obtainStyledAttributes.getBoolean(1, false);
        obtainStyledAttributes.recycle();
    }

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.useMaterialThemeColors && getButtonTintList() == null) {
            this.useMaterialThemeColors = true;
            if (this.materialThemeColorsTintList == null) {
                int color = R$bool.getColor(this, R.attr.colorControlActivated);
                int color2 = R$bool.getColor(this, R.attr.colorOnSurface);
                int color3 = R$bool.getColor(this, R.attr.colorSurface);
                this.materialThemeColorsTintList = new ColorStateList(ENABLED_CHECKED_STATES, new int[]{R$bool.layer(color3, color, 1.0f), R$bool.layer(color3, color2, 0.54f), R$bool.layer(color3, color2, 0.38f), R$bool.layer(color3, color2, 0.38f)});
            }
            setButtonTintList(this.materialThemeColorsTintList);
        }
    }
}
