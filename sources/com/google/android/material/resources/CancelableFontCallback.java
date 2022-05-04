package com.google.android.material.resources;

import android.graphics.Typeface;
import androidx.transition.PathMotion;
/* loaded from: classes.dex */
public final class CancelableFontCallback extends PathMotion {
    public final ApplyFont applyFont;
    public boolean cancelled;
    public final Typeface fallbackFont;

    /* loaded from: classes.dex */
    public interface ApplyFont {
        void apply(Typeface typeface);
    }

    @Override // androidx.transition.PathMotion
    public final void onFontRetrievalFailed(int i) {
        Typeface typeface = this.fallbackFont;
        if (!this.cancelled) {
            this.applyFont.apply(typeface);
        }
    }

    @Override // androidx.transition.PathMotion
    public final void onFontRetrieved(Typeface typeface, boolean z) {
        if (!this.cancelled) {
            this.applyFont.apply(typeface);
        }
    }

    public CancelableFontCallback(ApplyFont applyFont, Typeface typeface) {
        this.fallbackFont = typeface;
        this.applyFont = applyFont;
    }
}
