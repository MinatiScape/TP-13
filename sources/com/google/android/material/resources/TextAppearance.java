package com.google.android.material.resources;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextPaint;
import android.util.Log;
import android.util.TypedValue;
import androidx.core.content.res.ResourcesCompat;
import androidx.transition.PathMotion;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.R$styleable;
/* loaded from: classes.dex */
public final class TextAppearance {
    public Typeface font;
    public final String fontFamily;
    public final int fontFamilyResourceId;
    public boolean fontResolved = false;
    public final boolean hasLetterSpacing;
    public final float letterSpacing;
    public final ColorStateList shadowColor;
    public final float shadowDx;
    public final float shadowDy;
    public final float shadowRadius;
    public ColorStateList textColor;
    public float textSize;
    public final int textStyle;
    public final int typeface;

    public final void createFallbackFont() {
        String str;
        if (this.font == null && (str = this.fontFamily) != null) {
            this.font = Typeface.create(str, this.textStyle);
        }
        if (this.font == null) {
            int i = this.typeface;
            if (i == 1) {
                this.font = Typeface.SANS_SERIF;
            } else if (i == 2) {
                this.font = Typeface.SERIF;
            } else if (i != 3) {
                this.font = Typeface.DEFAULT;
            } else {
                this.font = Typeface.MONOSPACE;
            }
            this.font = Typeface.create(this.font, this.textStyle);
        }
    }

    public Typeface getFont(Context context) {
        if (this.fontResolved) {
            return this.font;
        }
        if (!context.isRestricted()) {
            try {
                Typeface font = ResourcesCompat.getFont(context, this.fontFamilyResourceId);
                this.font = font;
                if (font != null) {
                    this.font = Typeface.create(font, this.textStyle);
                }
            } catch (Resources.NotFoundException | UnsupportedOperationException unused) {
            } catch (Exception e) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Error loading font ");
                m.append(this.fontFamily);
                Log.d("TextAppearance", m.toString(), e);
            }
        }
        createFallbackFont();
        this.fontResolved = true;
        return this.font;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0021 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:9:0x001f A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean shouldLoadFontSynchronously(android.content.Context r8) {
        /*
            r7 = this;
            int r1 = r7.fontFamilyResourceId
            if (r1 == 0) goto L1c
            java.lang.ThreadLocal<android.util.TypedValue> r7 = androidx.core.content.res.ResourcesCompat.sTempTypedValue
            boolean r7 = r8.isRestricted()
            if (r7 == 0) goto Ld
            goto L1c
        Ld:
            android.util.TypedValue r2 = new android.util.TypedValue
            r2.<init>()
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 1
            r0 = r8
            android.graphics.Typeface r7 = androidx.core.content.res.ResourcesCompat.loadFont(r0, r1, r2, r3, r4, r5, r6)
            goto L1d
        L1c:
            r7 = 0
        L1d:
            if (r7 == 0) goto L21
            r7 = 1
            goto L22
        L21:
            r7 = 0
        L22:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.resources.TextAppearance.shouldLoadFontSynchronously(android.content.Context):boolean");
    }

    public TextAppearance(Context context, int i) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(i, R$styleable.TextAppearance);
        this.textSize = obtainStyledAttributes.getDimension(0, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.textColor = MaterialResources.getColorStateList(context, obtainStyledAttributes, 3);
        MaterialResources.getColorStateList(context, obtainStyledAttributes, 4);
        MaterialResources.getColorStateList(context, obtainStyledAttributes, 5);
        this.textStyle = obtainStyledAttributes.getInt(2, 0);
        this.typeface = obtainStyledAttributes.getInt(1, 1);
        int i2 = !obtainStyledAttributes.hasValue(12) ? 10 : 12;
        this.fontFamilyResourceId = obtainStyledAttributes.getResourceId(i2, 0);
        this.fontFamily = obtainStyledAttributes.getString(i2);
        obtainStyledAttributes.getBoolean(14, false);
        this.shadowColor = MaterialResources.getColorStateList(context, obtainStyledAttributes, 6);
        this.shadowDx = obtainStyledAttributes.getFloat(7, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.shadowDy = obtainStyledAttributes.getFloat(8, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.shadowRadius = obtainStyledAttributes.getFloat(9, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        obtainStyledAttributes.recycle();
        TypedArray obtainStyledAttributes2 = context.obtainStyledAttributes(i, R$styleable.MaterialTextAppearance);
        this.hasLetterSpacing = obtainStyledAttributes2.hasValue(0);
        this.letterSpacing = obtainStyledAttributes2.getFloat(0, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        obtainStyledAttributes2.recycle();
    }

    public final void getFontAsync(Context context, final PathMotion pathMotion) {
        if (shouldLoadFontSynchronously(context)) {
            getFont(context);
        } else {
            createFallbackFont();
        }
        int i = this.fontFamilyResourceId;
        if (i == 0) {
            this.fontResolved = true;
        }
        if (this.fontResolved) {
            pathMotion.onFontRetrieved(this.font, true);
            return;
        }
        try {
            ResourcesCompat.FontCallback fontCallback = new ResourcesCompat.FontCallback() { // from class: com.google.android.material.resources.TextAppearance.1
                @Override // androidx.core.content.res.ResourcesCompat.FontCallback
                public final void onFontRetrievalFailed(int i2) {
                    TextAppearance.this.fontResolved = true;
                    pathMotion.onFontRetrievalFailed(i2);
                }

                @Override // androidx.core.content.res.ResourcesCompat.FontCallback
                public final void onFontRetrieved(Typeface typeface) {
                    TextAppearance textAppearance = TextAppearance.this;
                    textAppearance.font = Typeface.create(typeface, textAppearance.textStyle);
                    TextAppearance textAppearance2 = TextAppearance.this;
                    textAppearance2.fontResolved = true;
                    pathMotion.onFontRetrieved(textAppearance2.font, false);
                }
            };
            ThreadLocal<TypedValue> threadLocal = ResourcesCompat.sTempTypedValue;
            if (context.isRestricted()) {
                fontCallback.callbackFailAsync(-4);
            } else {
                ResourcesCompat.loadFont(context, i, new TypedValue(), 0, fontCallback, false, false);
            }
        } catch (Resources.NotFoundException unused) {
            this.fontResolved = true;
            pathMotion.onFontRetrievalFailed(1);
        } catch (Exception e) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Error loading font ");
            m.append(this.fontFamily);
            Log.d("TextAppearance", m.toString(), e);
            this.fontResolved = true;
            pathMotion.onFontRetrievalFailed(-3);
        }
    }

    public final void updateDrawState(Context context, TextPaint textPaint, PathMotion pathMotion) {
        int i;
        int i2;
        updateMeasureState(context, textPaint, pathMotion);
        ColorStateList colorStateList = this.textColor;
        if (colorStateList != null) {
            i = colorStateList.getColorForState(textPaint.drawableState, colorStateList.getDefaultColor());
        } else {
            i = -16777216;
        }
        textPaint.setColor(i);
        float f = this.shadowRadius;
        float f2 = this.shadowDx;
        float f3 = this.shadowDy;
        ColorStateList colorStateList2 = this.shadowColor;
        if (colorStateList2 != null) {
            i2 = colorStateList2.getColorForState(textPaint.drawableState, colorStateList2.getDefaultColor());
        } else {
            i2 = 0;
        }
        textPaint.setShadowLayer(f, f2, f3, i2);
    }

    public final void updateMeasureState(final Context context, final TextPaint textPaint, final PathMotion pathMotion) {
        if (shouldLoadFontSynchronously(context)) {
            updateTextPaintMeasureState(context, textPaint, getFont(context));
            return;
        }
        createFallbackFont();
        updateTextPaintMeasureState(context, textPaint, this.font);
        getFontAsync(context, new PathMotion() { // from class: com.google.android.material.resources.TextAppearance.2
            @Override // androidx.transition.PathMotion
            public final void onFontRetrievalFailed(int i) {
                pathMotion.onFontRetrievalFailed(i);
            }

            @Override // androidx.transition.PathMotion
            public final void onFontRetrieved(Typeface typeface, boolean z) {
                TextAppearance.this.updateTextPaintMeasureState(context, textPaint, typeface);
                pathMotion.onFontRetrieved(typeface, z);
            }
        });
    }

    public final void updateTextPaintMeasureState(Context context, TextPaint textPaint, Typeface typeface) {
        boolean z;
        float f;
        Typeface maybeCopyWithFontWeightAdjustment = TypefaceUtils.maybeCopyWithFontWeightAdjustment(context.getResources().getConfiguration(), typeface);
        if (maybeCopyWithFontWeightAdjustment != null) {
            typeface = maybeCopyWithFontWeightAdjustment;
        }
        textPaint.setTypeface(typeface);
        int i = this.textStyle & (~typeface.getStyle());
        if ((i & 1) != 0) {
            z = true;
        } else {
            z = false;
        }
        textPaint.setFakeBoldText(z);
        if ((i & 2) != 0) {
            f = -0.25f;
        } else {
            f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        }
        textPaint.setTextSkewX(f);
        textPaint.setTextSize(this.textSize);
        if (this.hasLetterSpacing) {
            textPaint.setLetterSpacing(this.letterSpacing);
        }
    }
}
