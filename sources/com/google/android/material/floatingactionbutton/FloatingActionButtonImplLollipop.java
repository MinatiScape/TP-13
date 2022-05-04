package com.google.android.material.floatingactionbutton;

import android.graphics.Rect;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
/* loaded from: classes.dex */
public final class FloatingActionButtonImplLollipop extends FloatingActionButtonImpl {
    @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl
    public final void jumpDrawableToCurrentState() {
    }

    @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl
    public final void onDrawableStateChanged(int[] iArr) {
    }

    @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl
    public final void updateFromViewRotation() {
    }

    @Override // com.google.android.material.floatingactionbutton.FloatingActionButtonImpl
    public final void getPadding(Rect rect) {
        FloatingActionButton.this.getClass();
        rect.set(0, 0, 0, 0);
    }

    public FloatingActionButtonImplLollipop(FloatingActionButton floatingActionButton, FloatingActionButton.ShadowDelegateImpl shadowDelegateImpl) {
        super(floatingActionButton, shadowDelegateImpl);
    }
}
