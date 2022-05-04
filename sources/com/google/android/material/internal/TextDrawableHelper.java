package com.google.android.material.internal;

import android.graphics.Typeface;
import android.text.TextPaint;
import androidx.transition.PathMotion;
import com.google.android.material.resources.TextAppearance;
import java.lang.ref.WeakReference;
/* loaded from: classes.dex */
public final class TextDrawableHelper {
    public WeakReference<TextDrawableDelegate> delegate;
    public TextAppearance textAppearance;
    public float textWidth;
    public final TextPaint textPaint = new TextPaint(1);
    public final AnonymousClass1 fontCallback = new PathMotion() { // from class: com.google.android.material.internal.TextDrawableHelper.1
        @Override // androidx.transition.PathMotion
        public final void onFontRetrievalFailed(int i) {
            TextDrawableHelper textDrawableHelper = TextDrawableHelper.this;
            textDrawableHelper.textWidthDirty = true;
            TextDrawableDelegate textDrawableDelegate = textDrawableHelper.delegate.get();
            if (textDrawableDelegate != null) {
                textDrawableDelegate.onTextSizeChange();
            }
        }

        @Override // androidx.transition.PathMotion
        public final void onFontRetrieved(Typeface typeface, boolean z) {
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

    /* JADX WARN: Type inference failed for: r0v1, types: [com.google.android.material.internal.TextDrawableHelper$1] */
    public TextDrawableHelper(TextDrawableDelegate textDrawableDelegate) {
        this.delegate = new WeakReference<>(null);
        this.delegate = new WeakReference<>(textDrawableDelegate);
    }
}
