package com.google.android.material.resources;

import android.graphics.Typeface;
import com.google.android.gms.internal.zzgms;
/* loaded from: classes.dex */
public final class CancelableFontCallback extends zzgms {
    public final ApplyFont applyFont;
    public boolean cancelled;
    public final Typeface fallbackFont;

    /* loaded from: classes.dex */
    public interface ApplyFont {
        void apply(Typeface typeface);
    }

    public CancelableFontCallback(ApplyFont applyFont, Typeface typeface) {
        super(1);
        this.fallbackFont = typeface;
        this.applyFont = applyFont;
    }

    @Override // com.google.android.gms.internal.zzgms
    public void onFontRetrievalFailed(int i) {
        Typeface typeface = this.fallbackFont;
        if (!this.cancelled) {
            this.applyFont.apply(typeface);
        }
    }

    @Override // com.google.android.gms.internal.zzgms
    public void onFontRetrieved(Typeface typeface, boolean z) {
        if (!this.cancelled) {
            this.applyFont.apply(typeface);
        }
    }
}
