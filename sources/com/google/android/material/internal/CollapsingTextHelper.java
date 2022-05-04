package com.google.android.material.internal;

import android.animation.TimeInterpolator;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.animation.LinearInterpolator;
import androidx.constraintlayout.solver.widgets.analyzer.DependencyGraph$$ExternalSyntheticOutline0;
import androidx.core.graphics.ColorUtils;
import androidx.core.text.TextDirectionHeuristicsCompat;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.interpolator.view.animation.FastOutSlowInInterpolator;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.animation.AnimationUtils;
import com.google.android.material.internal.StaticLayoutBuilderCompat;
import com.google.android.material.resources.CancelableFontCallback;
import com.google.android.material.resources.TextAppearance;
import com.google.android.material.resources.TypefaceUtils;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class CollapsingTextHelper {
    public boolean boundsChanged;
    public float collapsedDrawX;
    public float collapsedDrawY;
    public CancelableFontCallback collapsedFontCallback;
    public float collapsedLetterSpacing;
    public ColorStateList collapsedShadowColor;
    public float collapsedShadowDx;
    public float collapsedShadowDy;
    public float collapsedShadowRadius;
    public float collapsedTextBlend;
    public ColorStateList collapsedTextColor;
    public float collapsedTextWidth;
    public Typeface collapsedTypeface;
    public Typeface collapsedTypefaceBold;
    public Typeface collapsedTypefaceDefault;
    public float currentDrawX;
    public float currentDrawY;
    public float currentLetterSpacing;
    public int currentOffsetY;
    public int currentShadowColor;
    public float currentShadowDx;
    public float currentShadowDy;
    public float currentShadowRadius;
    public float currentTextSize;
    public Typeface currentTypeface;
    public boolean drawTitle;
    public float expandedDrawX;
    public float expandedDrawY;
    public CancelableFontCallback expandedFontCallback;
    public float expandedFraction;
    public float expandedLetterSpacing;
    public int expandedLineCount;
    public ColorStateList expandedShadowColor;
    public float expandedShadowDx;
    public float expandedShadowDy;
    public float expandedShadowRadius;
    public float expandedTextBlend;
    public ColorStateList expandedTextColor;
    public Bitmap expandedTitleTexture;
    public Typeface expandedTypeface;
    public Typeface expandedTypefaceBold;
    public Typeface expandedTypefaceDefault;
    public boolean fadeModeEnabled;
    public float fadeModeStartFraction;
    public float fadeModeThresholdFraction;
    public boolean isRtl;
    public TimeInterpolator positionInterpolator;
    public float scale;
    public int[] state;
    public CharSequence text;
    public StaticLayout textLayout;
    public final TextPaint textPaint;
    public TimeInterpolator textSizeInterpolator;
    public CharSequence textToDraw;
    public CharSequence textToDrawCollapsed;
    public final TextPaint tmpPaint;
    public final View view;
    public int expandedTextGravity = 16;
    public int collapsedTextGravity = 16;
    public float expandedTextSize = 15.0f;
    public float collapsedTextSize = 15.0f;
    public boolean isRtlTextDirectionHeuristicsEnabled = true;
    public int maxLines = 1;
    public final Rect collapsedBounds = new Rect();
    public final Rect expandedBounds = new Rect();
    public final RectF currentBounds = new RectF();

    public final int getCurrentColor(ColorStateList colorStateList) {
        if (colorStateList == null) {
            return 0;
        }
        int[] iArr = this.state;
        if (iArr != null) {
            return colorStateList.getColorForState(iArr, 0);
        }
        return colorStateList.getDefaultColor();
    }

    public final void setExpansionFraction(float f) {
        float f2;
        float f3;
        Rect rect;
        if (f < HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            f = 0.0f;
        } else if (f > 1.0f) {
            f = 1.0f;
        }
        if (f != this.expandedFraction) {
            this.expandedFraction = f;
            if (this.fadeModeEnabled) {
                RectF rectF = this.currentBounds;
                if (f < this.fadeModeThresholdFraction) {
                    rect = this.expandedBounds;
                } else {
                    rect = this.collapsedBounds;
                }
                rectF.set(rect);
            } else {
                this.currentBounds.left = lerp(this.expandedBounds.left, this.collapsedBounds.left, f, this.positionInterpolator);
                this.currentBounds.top = lerp(this.expandedDrawY, this.collapsedDrawY, f, this.positionInterpolator);
                this.currentBounds.right = lerp(this.expandedBounds.right, this.collapsedBounds.right, f, this.positionInterpolator);
                this.currentBounds.bottom = lerp(this.expandedBounds.bottom, this.collapsedBounds.bottom, f, this.positionInterpolator);
            }
            if (!this.fadeModeEnabled) {
                this.currentDrawX = lerp(this.expandedDrawX, this.collapsedDrawX, f, this.positionInterpolator);
                this.currentDrawY = lerp(this.expandedDrawY, this.collapsedDrawY, f, this.positionInterpolator);
                setInterpolatedTextSize(f);
                f2 = f;
            } else if (f < this.fadeModeThresholdFraction) {
                this.currentDrawX = this.expandedDrawX;
                this.currentDrawY = this.expandedDrawY;
                setInterpolatedTextSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                f2 = 0.0f;
            } else {
                this.currentDrawX = this.collapsedDrawX;
                this.currentDrawY = this.collapsedDrawY - Math.max(0, this.currentOffsetY);
                setInterpolatedTextSize(1.0f);
                f2 = 1.0f;
            }
            FastOutSlowInInterpolator fastOutSlowInInterpolator = AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR;
            this.collapsedTextBlend = 1.0f - lerp(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f, 1.0f - f, fastOutSlowInInterpolator);
            View view = this.view;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.postInvalidateOnAnimation(view);
            this.expandedTextBlend = lerp(1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, f, fastOutSlowInInterpolator);
            ViewCompat.Api16Impl.postInvalidateOnAnimation(this.view);
            ColorStateList colorStateList = this.collapsedTextColor;
            ColorStateList colorStateList2 = this.expandedTextColor;
            if (colorStateList != colorStateList2) {
                this.textPaint.setColor(blendARGB(getCurrentColor(colorStateList2), getCurrentColor(this.collapsedTextColor), f2));
            } else {
                this.textPaint.setColor(getCurrentColor(colorStateList));
            }
            float f4 = this.collapsedLetterSpacing;
            float f5 = this.expandedLetterSpacing;
            if (f4 != f5) {
                this.textPaint.setLetterSpacing(lerp(f5, f4, f, fastOutSlowInInterpolator));
            } else {
                this.textPaint.setLetterSpacing(f4);
            }
            this.currentShadowRadius = lerp(this.expandedShadowRadius, this.collapsedShadowRadius, f, null);
            this.currentShadowDx = lerp(this.expandedShadowDx, this.collapsedShadowDx, f, null);
            this.currentShadowDy = lerp(this.expandedShadowDy, this.collapsedShadowDy, f, null);
            int blendARGB = blendARGB(getCurrentColor(this.expandedShadowColor), getCurrentColor(this.collapsedShadowColor), f);
            this.currentShadowColor = blendARGB;
            this.textPaint.setShadowLayer(this.currentShadowRadius, this.currentShadowDx, this.currentShadowDy, blendARGB);
            if (this.fadeModeEnabled) {
                int alpha = this.textPaint.getAlpha();
                float f6 = this.fadeModeThresholdFraction;
                if (f <= f6) {
                    f3 = AnimationUtils.lerp(1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, this.fadeModeStartFraction, f6, f);
                } else {
                    f3 = AnimationUtils.lerp(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f, f6, 1.0f, f);
                }
                this.textPaint.setAlpha((int) (f3 * alpha));
            }
            ViewCompat.Api16Impl.postInvalidateOnAnimation(this.view);
        }
    }

    public final void setInterpolatedTextSize(float f) {
        calculateUsingTextSize(f, false);
        View view = this.view;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        ViewCompat.Api16Impl.postInvalidateOnAnimation(view);
    }

    public static int blendARGB(int i, int i2, float f) {
        float f2 = 1.0f - f;
        return Color.argb(Math.round((Color.alpha(i2) * f) + (Color.alpha(i) * f2)), Math.round((Color.red(i2) * f) + (Color.red(i) * f2)), Math.round((Color.green(i2) * f) + (Color.green(i) * f2)), Math.round((Color.blue(i2) * f) + (Color.blue(i) * f2)));
    }

    public static float lerp(float f, float f2, float f3, TimeInterpolator timeInterpolator) {
        if (timeInterpolator != null) {
            f3 = timeInterpolator.getInterpolation(f3);
        }
        LinearInterpolator linearInterpolator = AnimationUtils.LINEAR_INTERPOLATOR;
        return DependencyGraph$$ExternalSyntheticOutline0.m(f2, f, f3, f);
    }

    public final boolean calculateIsRtl(CharSequence charSequence) {
        TextDirectionHeuristicsCompat.TextDirectionHeuristicInternal textDirectionHeuristicInternal;
        View view = this.view;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        boolean z = true;
        if (ViewCompat.Api17Impl.getLayoutDirection(view) != 1) {
            z = false;
        }
        if (!this.isRtlTextDirectionHeuristicsEnabled) {
            return z;
        }
        if (z) {
            textDirectionHeuristicInternal = TextDirectionHeuristicsCompat.FIRSTSTRONG_RTL;
        } else {
            textDirectionHeuristicInternal = TextDirectionHeuristicsCompat.FIRSTSTRONG_LTR;
        }
        return textDirectionHeuristicInternal.isRtl(charSequence, charSequence.length());
    }

    public final void calculateUsingTextSize(float f, boolean z) {
        boolean z2;
        float f2;
        float f3;
        boolean z3;
        boolean z4;
        boolean z5;
        StaticLayout staticLayout;
        Layout.Alignment alignment;
        boolean z6;
        boolean z7;
        boolean z8;
        boolean z9;
        boolean z10;
        if (this.text != null) {
            float width = this.collapsedBounds.width();
            float width2 = this.expandedBounds.width();
            if (Math.abs(f - 1.0f) < 1.0E-5f) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (z2) {
                f3 = this.collapsedTextSize;
                f2 = this.collapsedLetterSpacing;
                this.scale = 1.0f;
                Typeface typeface = this.currentTypeface;
                Typeface typeface2 = this.collapsedTypeface;
                if (typeface != typeface2) {
                    this.currentTypeface = typeface2;
                    z3 = true;
                } else {
                    z3 = false;
                }
            } else {
                float f4 = this.expandedTextSize;
                float f5 = this.expandedLetterSpacing;
                Typeface typeface3 = this.currentTypeface;
                Typeface typeface4 = this.expandedTypeface;
                if (typeface3 != typeface4) {
                    this.currentTypeface = typeface4;
                    z9 = true;
                } else {
                    z9 = false;
                }
                if (Math.abs(f - HingeAngleProviderKt.FULLY_CLOSED_DEGREES) < 1.0E-5f) {
                    z10 = true;
                } else {
                    z10 = false;
                }
                if (z10) {
                    this.scale = 1.0f;
                } else {
                    this.scale = lerp(this.expandedTextSize, this.collapsedTextSize, f, this.textSizeInterpolator) / this.expandedTextSize;
                }
                float f6 = this.collapsedTextSize / this.expandedTextSize;
                float f7 = width2 * f6;
                if (!z && f7 > width) {
                    width = Math.min(width / f6, width2);
                } else {
                    width = width2;
                }
                f3 = f4;
                f2 = f5;
                z3 = z9;
            }
            boolean z11 = z3;
            if (width > HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                if (this.currentTextSize != f3) {
                    z6 = true;
                } else {
                    z6 = false;
                }
                if (this.currentLetterSpacing != f2) {
                    z7 = true;
                } else {
                    z7 = false;
                }
                if (z6 || z7 || this.boundsChanged || z3) {
                    z8 = true;
                } else {
                    z8 = false;
                }
                this.currentTextSize = f3;
                this.currentLetterSpacing = f2;
                this.boundsChanged = false;
                z11 = z8;
            }
            if (this.textToDraw == null || z11) {
                this.textPaint.setTextSize(this.currentTextSize);
                this.textPaint.setTypeface(this.currentTypeface);
                this.textPaint.setLetterSpacing(this.currentLetterSpacing);
                TextPaint textPaint = this.textPaint;
                if (this.scale != 1.0f) {
                    z4 = true;
                } else {
                    z4 = false;
                }
                textPaint.setLinearText(z4);
                boolean calculateIsRtl = calculateIsRtl(this.text);
                this.isRtl = calculateIsRtl;
                int i = this.maxLines;
                if (i <= 1 || (calculateIsRtl && !this.fadeModeEnabled)) {
                    z5 = false;
                } else {
                    z5 = true;
                }
                if (!z5) {
                    i = 1;
                }
                try {
                    if (i == 1) {
                        alignment = Layout.Alignment.ALIGN_NORMAL;
                    } else {
                        int absoluteGravity = Gravity.getAbsoluteGravity(this.expandedTextGravity, calculateIsRtl ? 1 : 0) & 7;
                        if (absoluteGravity == 1) {
                            alignment = Layout.Alignment.ALIGN_CENTER;
                        } else if (absoluteGravity != 5) {
                            if (this.isRtl) {
                                alignment = Layout.Alignment.ALIGN_OPPOSITE;
                            } else {
                                alignment = Layout.Alignment.ALIGN_NORMAL;
                            }
                        } else if (this.isRtl) {
                            alignment = Layout.Alignment.ALIGN_NORMAL;
                        } else {
                            alignment = Layout.Alignment.ALIGN_OPPOSITE;
                        }
                    }
                    StaticLayoutBuilderCompat staticLayoutBuilderCompat = new StaticLayoutBuilderCompat(this.text, this.textPaint, (int) width);
                    staticLayoutBuilderCompat.ellipsize = TextUtils.TruncateAt.END;
                    staticLayoutBuilderCompat.isRtl = calculateIsRtl;
                    staticLayoutBuilderCompat.alignment = alignment;
                    staticLayoutBuilderCompat.includePad = false;
                    staticLayoutBuilderCompat.maxLines = i;
                    staticLayoutBuilderCompat.lineSpacingAdd = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                    staticLayoutBuilderCompat.lineSpacingMultiplier = 1.0f;
                    staticLayoutBuilderCompat.hyphenationFrequency = 1;
                    staticLayout = staticLayoutBuilderCompat.build();
                } catch (StaticLayoutBuilderCompat.StaticLayoutBuilderCompatException e) {
                    Log.e("CollapsingTextHelper", e.getCause().getMessage(), e);
                    staticLayout = null;
                }
                staticLayout.getClass();
                this.textLayout = staticLayout;
                this.textToDraw = staticLayout.getText();
            }
        }
    }

    public final float getCollapsedTextHeight() {
        TextPaint textPaint = this.tmpPaint;
        textPaint.setTextSize(this.collapsedTextSize);
        textPaint.setTypeface(this.collapsedTypeface);
        textPaint.setLetterSpacing(this.collapsedLetterSpacing);
        return -this.tmpPaint.ascent();
    }

    public final void maybeUpdateFontWeightAdjustment(Configuration configuration) {
        Typeface typeface = this.collapsedTypefaceDefault;
        if (typeface != null) {
            this.collapsedTypefaceBold = TypefaceUtils.maybeCopyWithFontWeightAdjustment(configuration, typeface);
        }
        Typeface typeface2 = this.expandedTypefaceDefault;
        if (typeface2 != null) {
            this.expandedTypefaceBold = TypefaceUtils.maybeCopyWithFontWeightAdjustment(configuration, typeface2);
        }
        Typeface typeface3 = this.collapsedTypefaceBold;
        if (typeface3 == null) {
            typeface3 = this.collapsedTypefaceDefault;
        }
        this.collapsedTypeface = typeface3;
        Typeface typeface4 = this.expandedTypefaceBold;
        if (typeface4 == null) {
            typeface4 = this.expandedTypefaceDefault;
        }
        this.expandedTypeface = typeface4;
        recalculate(true);
    }

    public final void onBoundsChanged() {
        boolean z;
        if (this.collapsedBounds.width() <= 0 || this.collapsedBounds.height() <= 0 || this.expandedBounds.width() <= 0 || this.expandedBounds.height() <= 0) {
            z = false;
        } else {
            z = true;
        }
        this.drawTitle = z;
    }

    public final void recalculate(boolean z) {
        float f;
        float f2;
        int i;
        float f3;
        float f4;
        Rect rect;
        StaticLayout staticLayout;
        if ((this.view.getHeight() > 0 && this.view.getWidth() > 0) || z) {
            calculateUsingTextSize(1.0f, z);
            CharSequence charSequence = this.textToDraw;
            if (!(charSequence == null || (staticLayout = this.textLayout) == null)) {
                this.textToDrawCollapsed = TextUtils.ellipsize(charSequence, this.textPaint, staticLayout.getWidth(), TextUtils.TruncateAt.END);
            }
            CharSequence charSequence2 = this.textToDrawCollapsed;
            if (charSequence2 != null) {
                this.collapsedTextWidth = this.textPaint.measureText(charSequence2, 0, charSequence2.length());
            } else {
                this.collapsedTextWidth = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            }
            int absoluteGravity = Gravity.getAbsoluteGravity(this.collapsedTextGravity, this.isRtl ? 1 : 0);
            int i2 = absoluteGravity & R.styleable.AppCompatTheme_toolbarNavigationButtonStyle;
            if (i2 == 48) {
                this.collapsedDrawY = this.collapsedBounds.top;
            } else if (i2 != 80) {
                this.collapsedDrawY = this.collapsedBounds.centerY() - ((this.textPaint.descent() - this.textPaint.ascent()) / 2.0f);
            } else {
                this.collapsedDrawY = this.textPaint.ascent() + this.collapsedBounds.bottom;
            }
            int i3 = absoluteGravity & 8388615;
            if (i3 == 1) {
                this.collapsedDrawX = this.collapsedBounds.centerX() - (this.collapsedTextWidth / 2.0f);
            } else if (i3 != 5) {
                this.collapsedDrawX = this.collapsedBounds.left;
            } else {
                this.collapsedDrawX = this.collapsedBounds.right - this.collapsedTextWidth;
            }
            calculateUsingTextSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, z);
            StaticLayout staticLayout2 = this.textLayout;
            if (staticLayout2 != null) {
                f = staticLayout2.getHeight();
            } else {
                f = 0.0f;
            }
            StaticLayout staticLayout3 = this.textLayout;
            if (staticLayout3 == null || this.maxLines <= 1) {
                CharSequence charSequence3 = this.textToDraw;
                if (charSequence3 != null) {
                    f2 = this.textPaint.measureText(charSequence3, 0, charSequence3.length());
                } else {
                    f2 = 0.0f;
                }
            } else {
                f2 = staticLayout3.getWidth();
            }
            StaticLayout staticLayout4 = this.textLayout;
            if (staticLayout4 != null) {
                i = staticLayout4.getLineCount();
            } else {
                i = 0;
            }
            this.expandedLineCount = i;
            int absoluteGravity2 = Gravity.getAbsoluteGravity(this.expandedTextGravity, this.isRtl ? 1 : 0);
            int i4 = absoluteGravity2 & R.styleable.AppCompatTheme_toolbarNavigationButtonStyle;
            if (i4 == 48) {
                this.expandedDrawY = this.expandedBounds.top;
            } else if (i4 != 80) {
                this.expandedDrawY = this.expandedBounds.centerY() - (f / 2.0f);
            } else {
                this.expandedDrawY = this.textPaint.descent() + (this.expandedBounds.bottom - f);
            }
            int i5 = absoluteGravity2 & 8388615;
            if (i5 == 1) {
                this.expandedDrawX = this.expandedBounds.centerX() - (f2 / 2.0f);
            } else if (i5 != 5) {
                this.expandedDrawX = this.expandedBounds.left;
            } else {
                this.expandedDrawX = this.expandedBounds.right - f2;
            }
            Bitmap bitmap = this.expandedTitleTexture;
            if (bitmap != null) {
                bitmap.recycle();
                this.expandedTitleTexture = null;
            }
            setInterpolatedTextSize(this.expandedFraction);
            float f5 = this.expandedFraction;
            if (this.fadeModeEnabled) {
                RectF rectF = this.currentBounds;
                if (f5 < this.fadeModeThresholdFraction) {
                    rect = this.expandedBounds;
                } else {
                    rect = this.collapsedBounds;
                }
                rectF.set(rect);
            } else {
                this.currentBounds.left = lerp(this.expandedBounds.left, this.collapsedBounds.left, f5, this.positionInterpolator);
                this.currentBounds.top = lerp(this.expandedDrawY, this.collapsedDrawY, f5, this.positionInterpolator);
                this.currentBounds.right = lerp(this.expandedBounds.right, this.collapsedBounds.right, f5, this.positionInterpolator);
                this.currentBounds.bottom = lerp(this.expandedBounds.bottom, this.collapsedBounds.bottom, f5, this.positionInterpolator);
            }
            if (!this.fadeModeEnabled) {
                this.currentDrawX = lerp(this.expandedDrawX, this.collapsedDrawX, f5, this.positionInterpolator);
                this.currentDrawY = lerp(this.expandedDrawY, this.collapsedDrawY, f5, this.positionInterpolator);
                setInterpolatedTextSize(f5);
                f3 = f5;
            } else if (f5 < this.fadeModeThresholdFraction) {
                this.currentDrawX = this.expandedDrawX;
                this.currentDrawY = this.expandedDrawY;
                setInterpolatedTextSize(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                f3 = 0.0f;
            } else {
                this.currentDrawX = this.collapsedDrawX;
                this.currentDrawY = this.collapsedDrawY - Math.max(0, this.currentOffsetY);
                setInterpolatedTextSize(1.0f);
                f3 = 1.0f;
            }
            FastOutSlowInInterpolator fastOutSlowInInterpolator = AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR;
            this.collapsedTextBlend = 1.0f - lerp(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f, 1.0f - f5, fastOutSlowInInterpolator);
            View view = this.view;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.postInvalidateOnAnimation(view);
            this.expandedTextBlend = lerp(1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, f5, fastOutSlowInInterpolator);
            ViewCompat.Api16Impl.postInvalidateOnAnimation(this.view);
            ColorStateList colorStateList = this.collapsedTextColor;
            ColorStateList colorStateList2 = this.expandedTextColor;
            if (colorStateList != colorStateList2) {
                this.textPaint.setColor(blendARGB(getCurrentColor(colorStateList2), getCurrentColor(this.collapsedTextColor), f3));
            } else {
                this.textPaint.setColor(getCurrentColor(colorStateList));
            }
            float f6 = this.collapsedLetterSpacing;
            float f7 = this.expandedLetterSpacing;
            if (f6 != f7) {
                this.textPaint.setLetterSpacing(lerp(f7, f6, f5, fastOutSlowInInterpolator));
            } else {
                this.textPaint.setLetterSpacing(f6);
            }
            this.currentShadowRadius = lerp(this.expandedShadowRadius, this.collapsedShadowRadius, f5, null);
            this.currentShadowDx = lerp(this.expandedShadowDx, this.collapsedShadowDx, f5, null);
            this.currentShadowDy = lerp(this.expandedShadowDy, this.collapsedShadowDy, f5, null);
            int blendARGB = blendARGB(getCurrentColor(this.expandedShadowColor), getCurrentColor(this.collapsedShadowColor), f5);
            this.currentShadowColor = blendARGB;
            this.textPaint.setShadowLayer(this.currentShadowRadius, this.currentShadowDx, this.currentShadowDy, blendARGB);
            if (this.fadeModeEnabled) {
                int alpha = this.textPaint.getAlpha();
                float f8 = this.fadeModeThresholdFraction;
                if (f5 <= f8) {
                    f4 = AnimationUtils.lerp(1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, this.fadeModeStartFraction, f8, f5);
                } else {
                    f4 = AnimationUtils.lerp(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f, f8, 1.0f, f5);
                }
                this.textPaint.setAlpha((int) (f4 * alpha));
            }
            ViewCompat.Api16Impl.postInvalidateOnAnimation(this.view);
        }
    }

    public final void setCollapsedTextAppearance(int i) {
        TextAppearance textAppearance = new TextAppearance(this.view.getContext(), i);
        ColorStateList colorStateList = textAppearance.textColor;
        if (colorStateList != null) {
            this.collapsedTextColor = colorStateList;
        }
        float f = textAppearance.textSize;
        if (f != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            this.collapsedTextSize = f;
        }
        ColorStateList colorStateList2 = textAppearance.shadowColor;
        if (colorStateList2 != null) {
            this.collapsedShadowColor = colorStateList2;
        }
        this.collapsedShadowDx = textAppearance.shadowDx;
        this.collapsedShadowDy = textAppearance.shadowDy;
        this.collapsedShadowRadius = textAppearance.shadowRadius;
        this.collapsedLetterSpacing = textAppearance.letterSpacing;
        CancelableFontCallback cancelableFontCallback = this.collapsedFontCallback;
        if (cancelableFontCallback != null) {
            cancelableFontCallback.cancelled = true;
        }
        CancelableFontCallback.ApplyFont applyFont = new CancelableFontCallback.ApplyFont() { // from class: com.google.android.material.internal.CollapsingTextHelper.1
            @Override // com.google.android.material.resources.CancelableFontCallback.ApplyFont
            public final void apply(Typeface typeface) {
                CollapsingTextHelper collapsingTextHelper = CollapsingTextHelper.this;
                if (collapsingTextHelper.setCollapsedTypefaceInternal(typeface)) {
                    collapsingTextHelper.recalculate(false);
                }
            }
        };
        textAppearance.createFallbackFont();
        this.collapsedFontCallback = new CancelableFontCallback(applyFont, textAppearance.font);
        textAppearance.getFontAsync(this.view.getContext(), this.collapsedFontCallback);
        recalculate(false);
    }

    public final void setCollapsedTextColor(ColorStateList colorStateList) {
        if (this.collapsedTextColor != colorStateList) {
            this.collapsedTextColor = colorStateList;
            recalculate(false);
        }
    }

    public final boolean setCollapsedTypefaceInternal(Typeface typeface) {
        CancelableFontCallback cancelableFontCallback = this.collapsedFontCallback;
        if (cancelableFontCallback != null) {
            cancelableFontCallback.cancelled = true;
        }
        if (this.collapsedTypefaceDefault == typeface) {
            return false;
        }
        this.collapsedTypefaceDefault = typeface;
        Typeface maybeCopyWithFontWeightAdjustment = TypefaceUtils.maybeCopyWithFontWeightAdjustment(this.view.getContext().getResources().getConfiguration(), typeface);
        this.collapsedTypefaceBold = maybeCopyWithFontWeightAdjustment;
        if (maybeCopyWithFontWeightAdjustment == null) {
            maybeCopyWithFontWeightAdjustment = this.collapsedTypefaceDefault;
        }
        this.collapsedTypeface = maybeCopyWithFontWeightAdjustment;
        return true;
    }

    public final void setExpandedTextAppearance(int i) {
        TextAppearance textAppearance = new TextAppearance(this.view.getContext(), i);
        ColorStateList colorStateList = textAppearance.textColor;
        if (colorStateList != null) {
            this.expandedTextColor = colorStateList;
        }
        float f = textAppearance.textSize;
        if (f != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            this.expandedTextSize = f;
        }
        ColorStateList colorStateList2 = textAppearance.shadowColor;
        if (colorStateList2 != null) {
            this.expandedShadowColor = colorStateList2;
        }
        this.expandedShadowDx = textAppearance.shadowDx;
        this.expandedShadowDy = textAppearance.shadowDy;
        this.expandedShadowRadius = textAppearance.shadowRadius;
        this.expandedLetterSpacing = textAppearance.letterSpacing;
        CancelableFontCallback cancelableFontCallback = this.expandedFontCallback;
        if (cancelableFontCallback != null) {
            cancelableFontCallback.cancelled = true;
        }
        CancelableFontCallback.ApplyFont applyFont = new CancelableFontCallback.ApplyFont() { // from class: com.google.android.material.internal.CollapsingTextHelper.2
            @Override // com.google.android.material.resources.CancelableFontCallback.ApplyFont
            public final void apply(Typeface typeface) {
                CollapsingTextHelper collapsingTextHelper = CollapsingTextHelper.this;
                if (collapsingTextHelper.setExpandedTypefaceInternal(typeface)) {
                    collapsingTextHelper.recalculate(false);
                }
            }
        };
        textAppearance.createFallbackFont();
        this.expandedFontCallback = new CancelableFontCallback(applyFont, textAppearance.font);
        textAppearance.getFontAsync(this.view.getContext(), this.expandedFontCallback);
        recalculate(false);
    }

    public final boolean setExpandedTypefaceInternal(Typeface typeface) {
        CancelableFontCallback cancelableFontCallback = this.expandedFontCallback;
        if (cancelableFontCallback != null) {
            cancelableFontCallback.cancelled = true;
        }
        if (this.expandedTypefaceDefault == typeface) {
            return false;
        }
        this.expandedTypefaceDefault = typeface;
        Typeface maybeCopyWithFontWeightAdjustment = TypefaceUtils.maybeCopyWithFontWeightAdjustment(this.view.getContext().getResources().getConfiguration(), typeface);
        this.expandedTypefaceBold = maybeCopyWithFontWeightAdjustment;
        if (maybeCopyWithFontWeightAdjustment == null) {
            maybeCopyWithFontWeightAdjustment = this.expandedTypefaceDefault;
        }
        this.expandedTypeface = maybeCopyWithFontWeightAdjustment;
        return true;
    }

    public final boolean setState(int[] iArr) {
        boolean z;
        ColorStateList colorStateList;
        this.state = iArr;
        ColorStateList colorStateList2 = this.collapsedTextColor;
        if ((colorStateList2 == null || !colorStateList2.isStateful()) && ((colorStateList = this.expandedTextColor) == null || !colorStateList.isStateful())) {
            z = false;
        } else {
            z = true;
        }
        if (!z) {
            return false;
        }
        recalculate(false);
        return true;
    }

    public CollapsingTextHelper(View view) {
        this.view = view;
        TextPaint textPaint = new TextPaint(129);
        this.textPaint = textPaint;
        this.tmpPaint = new TextPaint(textPaint);
        float f = this.fadeModeStartFraction;
        this.fadeModeThresholdFraction = DependencyGraph$$ExternalSyntheticOutline0.m(1.0f, f, 0.5f, f);
        maybeUpdateFontWeightAdjustment(view.getContext().getResources().getConfiguration());
    }

    public final void draw(Canvas canvas) {
        int save = canvas.save();
        if (this.textToDraw != null && this.drawTitle) {
            this.textPaint.setTextSize(this.currentTextSize);
            float f = this.currentDrawX;
            float f2 = this.currentDrawY;
            float f3 = this.scale;
            if (f3 != 1.0f && !this.fadeModeEnabled) {
                canvas.scale(f3, f3, f, f2);
            }
            boolean z = true;
            if (this.maxLines <= 1 || (this.isRtl && !this.fadeModeEnabled)) {
                z = false;
            }
            if (!z || (this.fadeModeEnabled && this.expandedFraction <= this.fadeModeThresholdFraction)) {
                canvas.translate(f, f2);
                this.textLayout.draw(canvas);
            } else {
                float lineStart = this.currentDrawX - this.textLayout.getLineStart(0);
                int alpha = this.textPaint.getAlpha();
                canvas.translate(lineStart, f2);
                float f4 = alpha;
                this.textPaint.setAlpha((int) (this.expandedTextBlend * f4));
                TextPaint textPaint = this.textPaint;
                float f5 = this.currentShadowRadius;
                float f6 = this.currentShadowDx;
                float f7 = this.currentShadowDy;
                int i = this.currentShadowColor;
                textPaint.setShadowLayer(f5, f6, f7, ColorUtils.setAlphaComponent(i, (Color.alpha(i) * textPaint.getAlpha()) / 255));
                this.textLayout.draw(canvas);
                this.textPaint.setAlpha((int) (this.collapsedTextBlend * f4));
                TextPaint textPaint2 = this.textPaint;
                float f8 = this.currentShadowRadius;
                float f9 = this.currentShadowDx;
                float f10 = this.currentShadowDy;
                int i2 = this.currentShadowColor;
                textPaint2.setShadowLayer(f8, f9, f10, ColorUtils.setAlphaComponent(i2, (Color.alpha(i2) * textPaint2.getAlpha()) / 255));
                int lineBaseline = this.textLayout.getLineBaseline(0);
                CharSequence charSequence = this.textToDrawCollapsed;
                float f11 = lineBaseline;
                canvas.drawText(charSequence, 0, charSequence.length(), HingeAngleProviderKt.FULLY_CLOSED_DEGREES, f11, this.textPaint);
                this.textPaint.setShadowLayer(this.currentShadowRadius, this.currentShadowDx, this.currentShadowDy, this.currentShadowColor);
                if (!this.fadeModeEnabled) {
                    String trim = this.textToDrawCollapsed.toString().trim();
                    if (trim.endsWith("…")) {
                        trim = trim.substring(0, trim.length() - 1);
                    }
                    this.textPaint.setAlpha(alpha);
                    canvas.drawText(trim, 0, Math.min(this.textLayout.getLineEnd(0), trim.length()), HingeAngleProviderKt.FULLY_CLOSED_DEGREES, f11, (Paint) this.textPaint);
                }
            }
            canvas.restoreToCount(save);
        }
    }
}
