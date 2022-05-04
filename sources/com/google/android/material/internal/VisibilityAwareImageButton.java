package com.google.android.material.internal;

import android.annotation.SuppressLint;
import android.widget.ImageButton;
@SuppressLint({"AppCompatCustomView"})
/* loaded from: classes.dex */
public class VisibilityAwareImageButton extends ImageButton {
    public int userSetVisibility;

    public final void internalSetVisibility(int i, boolean z) {
        super.setVisibility(i);
        if (z) {
            this.userSetVisibility = i;
        }
    }
}
