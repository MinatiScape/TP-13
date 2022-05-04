package com.google.android.material.internal;

import android.graphics.Typeface;
import android.text.TextPaint;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.gms.internal.zzgms;
import com.google.android.material.resources.TextAppearance;
import java.lang.ref.WeakReference;
/* loaded from: classes.dex */
public class TextDrawableHelper {
    public WeakReference<TextDrawableDelegate> delegate;
    public TextAppearance textAppearance;
    public float textWidth;
    public final TextPaint textPaint = new TextPaint(1);
    public final zzgms fontCallback = new zzgms() { // from class: com.google.android.material.internal.TextDrawableHelper.1
        @Override // com.google.android.gms.internal.zzgms
        public void onFontRetrievalFailed(int i) {
            TextDrawableHelper textDrawableHelper = TextDrawableHelper.this;
            textDrawableHelper.textWidthDirty = true;
            TextDrawableDelegate textDrawableDelegate = textDrawableHelper.delegate.get();
            if (textDrawableDelegate != null) {
                textDrawableDelegate.onTextSizeChange();
            }
        }

        @Override // com.google.android.gms.internal.zzgms
        public void onFontRetrieved(Typeface typeface, boolean z) {
            if (!z) {
                TextDrawableHelper textDrawableHelper = TextDrawableHelper.this;
                textDrawableHelper.textWidthDirty = true;
                TextDrawableDelegate textDrawableDelegate = textDrawableHelper.delegate.get();
                if (textDrawableDelegate != null) {
                    textDrawableDelegate.onTextSizeChange();
                }
            }
        }
    };
    public boolean textWidthDirty = true;

    /* loaded from: classes.dex */
    public interface TextDrawableDelegate {
        int[] getState();

        boolean onStateChange(int[] iArr);

        void onTextSizeChange();
    }

    public TextDrawableHelper(TextDrawableDelegate textDrawableDelegate) {
        this.delegate = new WeakReference<>(null);
        this.delegate = new WeakReference<>(textDrawableDelegate);
    }

    public float getTextWidth(String str) {
        if (!this.textWidthDirty) {
            return this.textWidth;
        }
        float measureText = str == null ? HingeAngleProviderKt.FULLY_CLOSED_DEGREES : this.textPaint.measureText((CharSequence) str, 0, str.length());
        this.textWidth = measureText;
        this.textWidthDirty = false;
        return measureText;
    }
}
