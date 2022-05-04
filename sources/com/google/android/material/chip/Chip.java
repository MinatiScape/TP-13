package com.google.android.material.chip;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Outline;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.PointerIcon;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.TextView;
import androidx.appcompat.R$layout;
import androidx.appcompat.widget.AppCompatCheckBox;
import androidx.core.graphics.drawable.WrappedDrawable;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.customview.widget.ExploreByTouchHelper;
import androidx.transition.PathMotion;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.R$styleable;
import com.google.android.material.animation.MotionSpec;
import com.google.android.material.chip.ChipDrawable;
import com.google.android.material.internal.CheckableGroup;
import com.google.android.material.internal.MaterialCheckable;
import com.google.android.material.internal.ThemeEnforcement;
import com.google.android.material.internal.ViewUtils;
import com.google.android.material.resources.MaterialResources;
import com.google.android.material.resources.TextAppearance;
import com.google.android.material.shape.AbsoluteCornerSize;
import com.google.android.material.shape.MaterialShapeDrawable;
import com.google.android.material.shape.ShapeAppearanceModel;
import com.google.android.material.shape.Shapeable;
import com.google.android.material.theme.overlay.MaterialThemeOverlay;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class Chip extends AppCompatCheckBox implements ChipDrawable.Delegate, Shapeable, MaterialCheckable<Chip> {
    public ChipDrawable chipDrawable;
    public boolean closeIconFocused;
    public boolean closeIconHovered;
    public boolean closeIconPressed;
    public boolean deferredCheckedValue;
    public boolean ensureMinTouchTargetSize;
    public final AnonymousClass1 fontCallback;
    public InsetDrawable insetBackgroundDrawable;
    public int lastLayoutDirection;
    public int minTouchTargetSize;
    public MaterialCheckable.OnCheckedChangeListener<Chip> onCheckedChangeListenerInternal;
    public final Rect rect;
    public final RectF rectF;
    public RippleDrawable ripple;
    public static final Rect EMPTY_BOUNDS = new Rect();
    public static final int[] SELECTED_STATE = {16842913};
    public static final int[] CHECKABLE_STATE_SET = {16842911};

    /* loaded from: classes.dex */
    public class ChipTouchHelper extends ExploreByTouchHelper {
        @Override // androidx.customview.widget.ExploreByTouchHelper
        public final void getVisibleVirtualViews(ArrayList arrayList) {
            boolean z = false;
            arrayList.add(0);
            Chip chip = Chip.this;
            Rect rect = Chip.EMPTY_BOUNDS;
            if (chip.hasCloseIcon()) {
                Chip chip2 = Chip.this;
                ChipDrawable chipDrawable = chip2.chipDrawable;
                if (chipDrawable != null && chipDrawable.closeIconVisible) {
                    z = true;
                }
                if (z) {
                    chip2.getClass();
                }
            }
        }

        public ChipTouchHelper(Chip chip) {
            super(chip);
        }

        @Override // androidx.customview.widget.ExploreByTouchHelper
        public final void onPopulateNodeForVirtualView(int i, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
            String str = "";
            if (i == 1) {
                Chip chip = Chip.this;
                ChipDrawable chipDrawable = chip.chipDrawable;
                CharSequence text = chip.getText();
                Context context = Chip.this.getContext();
                Object[] objArr = new Object[1];
                if (!TextUtils.isEmpty(text)) {
                    str = text;
                }
                objArr[0] = str;
                accessibilityNodeInfoCompat.mInfo.setContentDescription(context.getString(R.string.mtrl_chip_close_icon_content_description, objArr).trim());
                Chip chip2 = Chip.this;
                chip2.rectF.setEmpty();
                chip2.hasCloseIcon();
                RectF rectF = chip2.rectF;
                chip2.rect.set((int) rectF.left, (int) rectF.top, (int) rectF.right, (int) rectF.bottom);
                accessibilityNodeInfoCompat.mInfo.setBoundsInParent(chip2.rect);
                accessibilityNodeInfoCompat.addAction(AccessibilityNodeInfoCompat.AccessibilityActionCompat.ACTION_CLICK);
                accessibilityNodeInfoCompat.mInfo.setEnabled(Chip.this.isEnabled());
                return;
            }
            accessibilityNodeInfoCompat.mInfo.setContentDescription(str);
            accessibilityNodeInfoCompat.mInfo.setBoundsInParent(Chip.EMPTY_BOUNDS);
        }
    }

    public Chip(Context context) {
        this(context, null);
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelativeWithIntrinsicBounds(int i, int i2, int i3, int i4) {
        if (i != 0) {
            throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
        } else if (i3 == 0) {
            super.setCompoundDrawablesRelativeWithIntrinsicBounds(i, i2, i3, i4);
        } else {
            throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesWithIntrinsicBounds(int i, int i2, int i3, int i4) {
        if (i != 0) {
            throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
        } else if (i3 == 0) {
            super.setCompoundDrawablesWithIntrinsicBounds(i, i2, i3, i4);
        } else {
            throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
        }
    }

    @Override // android.widget.TextView
    public final void setLines(int i) {
        if (i <= 1) {
            super.setLines(i);
            return;
        }
        throw new UnsupportedOperationException("Chip does not support multi-line text");
    }

    @Override // android.widget.TextView
    public final void setMaxLines(int i) {
        if (i <= 1) {
            super.setMaxLines(i);
            return;
        }
        throw new UnsupportedOperationException("Chip does not support multi-line text");
    }

    @Override // android.widget.TextView
    public final void setMinLines(int i) {
        if (i <= 1) {
            super.setMinLines(i);
            return;
        }
        throw new UnsupportedOperationException("Chip does not support multi-line text");
    }

    @Override // android.widget.TextView
    public final void setTextAppearance(Context context, int i) {
        super.setTextAppearance(context, i);
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable != null) {
            chipDrawable.setTextAppearance(new TextAppearance(chipDrawable.context, i));
        }
        updateTextPaintDrawState();
    }

    public Chip(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.chipStyle);
    }

    public final void ensureAccessibleTouchTarget(int i) {
        int i2;
        this.minTouchTargetSize = i;
        boolean z = this.ensureMinTouchTargetSize;
        float f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        int i3 = 0;
        if (!z) {
            InsetDrawable insetDrawable = this.insetBackgroundDrawable;
            if (insetDrawable == null) {
                updateBackgroundDrawable();
            } else if (insetDrawable != null) {
                this.insetBackgroundDrawable = null;
                setMinWidth(0);
                ChipDrawable chipDrawable = this.chipDrawable;
                if (chipDrawable != null) {
                    f = chipDrawable.chipMinHeight;
                }
                setMinHeight((int) f);
                updateBackgroundDrawable();
            }
        } else {
            int max = Math.max(0, i - ((int) this.chipDrawable.chipMinHeight));
            int max2 = Math.max(0, i - this.chipDrawable.getIntrinsicWidth());
            if (max2 > 0 || max > 0) {
                if (max2 > 0) {
                    i2 = max2 / 2;
                } else {
                    i2 = 0;
                }
                if (max > 0) {
                    i3 = max / 2;
                }
                int i4 = i3;
                if (this.insetBackgroundDrawable != null) {
                    Rect rect = new Rect();
                    this.insetBackgroundDrawable.getPadding(rect);
                    if (rect.top == i4 && rect.bottom == i4 && rect.left == i2 && rect.right == i2) {
                        updateBackgroundDrawable();
                        return;
                    }
                }
                if (getMinHeight() != i) {
                    setMinHeight(i);
                }
                if (getMinWidth() != i) {
                    setMinWidth(i);
                }
                this.insetBackgroundDrawable = new InsetDrawable((Drawable) this.chipDrawable, i2, i4, i2, i4);
                updateBackgroundDrawable();
                return;
            }
            InsetDrawable insetDrawable2 = this.insetBackgroundDrawable;
            if (insetDrawable2 == null) {
                updateBackgroundDrawable();
            } else if (insetDrawable2 != null) {
                this.insetBackgroundDrawable = null;
                setMinWidth(0);
                ChipDrawable chipDrawable2 = this.chipDrawable;
                if (chipDrawable2 != null) {
                    f = chipDrawable2.chipMinHeight;
                }
                setMinHeight((int) f);
                updateBackgroundDrawable();
            }
        }
    }

    @Override // android.widget.CheckBox, android.widget.CompoundButton, android.widget.Button, android.widget.TextView, android.view.View
    public final CharSequence getAccessibilityClassName() {
        boolean z;
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable == null || !chipDrawable.checkable) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            ViewParent parent = getParent();
            if (!(parent instanceof ChipGroup) || !((ChipGroup) parent).checkableGroup.singleSelection) {
                return "android.widget.CompoundButton";
            }
            return "android.widget.RadioButton";
        } else if (isClickable()) {
            return "android.widget.Button";
        } else {
            return "android.view.View";
        }
    }

    @Override // android.widget.TextView
    public final TextUtils.TruncateAt getEllipsize() {
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable != null) {
            return chipDrawable.truncateAt;
        }
        return null;
    }

    public final boolean hasCloseIcon() {
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable != null) {
            Drawable drawable = chipDrawable.closeIcon;
            if (drawable == null) {
                drawable = null;
            } else if (drawable instanceof WrappedDrawable) {
                drawable = ((WrappedDrawable) drawable).getWrappedDrawable();
            }
            if (drawable != null) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.material.chip.ChipDrawable.Delegate
    public final void onChipDrawableSizeChange() {
        ensureAccessibleTouchTarget(this.minTouchTargetSize);
        requestLayout();
        invalidateOutline();
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i) {
        boolean z;
        int[] onCreateDrawableState = super.onCreateDrawableState(i + 2);
        if (isChecked()) {
            View.mergeDrawableStates(onCreateDrawableState, SELECTED_STATE);
        }
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable == null || !chipDrawable.checkable) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            View.mergeDrawableStates(onCreateDrawableState, CHECKABLE_STATE_SET);
        }
        return onCreateDrawableState;
    }

    @Override // android.widget.Button, android.widget.TextView, android.view.View
    @TargetApi(24)
    public final PointerIcon onResolvePointerIcon(MotionEvent motionEvent, int i) {
        this.rectF.setEmpty();
        hasCloseIcon();
        if (!this.rectF.contains(motionEvent.getX(), motionEvent.getY()) || !isEnabled()) {
            return null;
        }
        return PointerIcon.getSystemIcon(getContext(), 1002);
    }

    @Override // android.view.View
    public final void setBackground(Drawable drawable) {
        Drawable drawable2 = this.insetBackgroundDrawable;
        if (drawable2 == null) {
            drawable2 = this.chipDrawable;
        }
        if (drawable == drawable2 || drawable == this.ripple) {
            super.setBackground(drawable);
        } else {
            Log.w("Chip", "Do not set the background; Chip manages its own background drawable.");
        }
    }

    @Override // android.view.View
    public final void setBackgroundColor(int i) {
        Log.w("Chip", "Do not set the background color; Chip manages its own background drawable.");
    }

    @Override // androidx.appcompat.widget.AppCompatCheckBox, android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        Drawable drawable2 = this.insetBackgroundDrawable;
        if (drawable2 == null) {
            drawable2 = this.chipDrawable;
        }
        if (drawable == drawable2 || drawable == this.ripple) {
            super.setBackgroundDrawable(drawable);
        } else {
            Log.w("Chip", "Do not set the background drawable; Chip manages its own background drawable.");
        }
    }

    @Override // androidx.appcompat.widget.AppCompatCheckBox, android.view.View
    public final void setBackgroundResource(int i) {
        Log.w("Chip", "Do not set the background resource; Chip manages its own background drawable.");
    }

    @Override // android.view.View
    public final void setBackgroundTintList(ColorStateList colorStateList) {
        Log.w("Chip", "Do not set the background tint list; Chip manages its own background drawable.");
    }

    @Override // android.view.View
    public final void setBackgroundTintMode(PorterDuff.Mode mode) {
        Log.w("Chip", "Do not set the background tint mode; Chip manages its own background drawable.");
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final void setChecked(boolean z) {
        MaterialCheckable.OnCheckedChangeListener<Chip> onCheckedChangeListener;
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable == null) {
            this.deferredCheckedValue = z;
        } else if (chipDrawable.checkable) {
            boolean isChecked = isChecked();
            super.setChecked(z);
            if (isChecked != z && (onCheckedChangeListener = this.onCheckedChangeListenerInternal) != null) {
                CheckableGroup.AnonymousClass1 r0 = (CheckableGroup.AnonymousClass1) onCheckedChangeListener;
                r0.getClass();
                if (!z) {
                    CheckableGroup checkableGroup = CheckableGroup.this;
                    if (!checkableGroup.uncheckInternal(this, checkableGroup.selectionRequired)) {
                        return;
                    }
                } else if (!CheckableGroup.this.checkInternal(this)) {
                    return;
                }
                CheckableGroup.this.onCheckedStateChanged();
            }
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        if (drawable != null) {
            throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
        } else if (drawable3 == null) {
            super.setCompoundDrawables(drawable, drawable2, drawable3, drawable4);
        } else {
            throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelative(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        if (drawable != null) {
            throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
        } else if (drawable3 == null) {
            super.setCompoundDrawablesRelative(drawable, drawable2, drawable3, drawable4);
        } else {
            throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
        }
    }

    @Override // android.widget.TextView
    public final void setEllipsize(TextUtils.TruncateAt truncateAt) {
        if (this.chipDrawable != null) {
            if (truncateAt != TextUtils.TruncateAt.MARQUEE) {
                super.setEllipsize(truncateAt);
                ChipDrawable chipDrawable = this.chipDrawable;
                if (chipDrawable != null) {
                    chipDrawable.truncateAt = truncateAt;
                    return;
                }
                return;
            }
            throw new UnsupportedOperationException("Text within a chip are not allowed to scroll.");
        }
    }

    @Override // android.view.View
    public final void setLayoutDirection(int i) {
        if (this.chipDrawable != null) {
            super.setLayoutDirection(i);
        }
    }

    @Override // com.google.android.material.shape.Shapeable
    public final void setShapeAppearanceModel(ShapeAppearanceModel shapeAppearanceModel) {
        this.chipDrawable.setShapeAppearanceModel(shapeAppearanceModel);
    }

    @Override // android.widget.TextView
    public final void setSingleLine(boolean z) {
        if (z) {
            super.setSingleLine(z);
            return;
        }
        throw new UnsupportedOperationException("Chip does not support multi-line text");
    }

    @Override // android.widget.TextView
    public final void setText(CharSequence charSequence, TextView.BufferType bufferType) {
        CharSequence charSequence2;
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable != null) {
            if (charSequence == null) {
                charSequence = "";
            }
            if (chipDrawable.shouldDrawText) {
                charSequence2 = null;
            } else {
                charSequence2 = charSequence;
            }
            super.setText(charSequence2, bufferType);
            ChipDrawable chipDrawable2 = this.chipDrawable;
            if (chipDrawable2 != null && !TextUtils.equals(chipDrawable2.text, charSequence)) {
                chipDrawable2.text = charSequence;
                chipDrawable2.textDrawableHelper.textWidthDirty = true;
                chipDrawable2.invalidateSelf();
                chipDrawable2.onSizeChange();
            }
        }
    }

    public final void updateBackgroundDrawable() {
        ColorStateList colorStateList = this.chipDrawable.rippleColor;
        if (colorStateList == null) {
            colorStateList = ColorStateList.valueOf(0);
        }
        Drawable drawable = this.insetBackgroundDrawable;
        if (drawable == null) {
            drawable = this.chipDrawable;
        }
        this.ripple = new RippleDrawable(colorStateList, drawable, null);
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable.useCompatRipple) {
            chipDrawable.useCompatRipple = false;
            chipDrawable.compatRippleColor = null;
            chipDrawable.onStateChange(chipDrawable.getState());
        }
        RippleDrawable rippleDrawable = this.ripple;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        ViewCompat.Api16Impl.setBackground(this, rippleDrawable);
        updatePaddingInternal();
    }

    /* JADX WARN: Type inference failed for: r1v4, types: [com.google.android.material.chip.Chip$1] */
    public Chip(Context context, AttributeSet attributeSet, int i) {
        super(MaterialThemeOverlay.wrap(context, attributeSet, i, R.style.Widget_MaterialComponents_Chip_Action), attributeSet, i);
        ChipDrawable chipDrawable;
        int resourceId;
        int resourceId2;
        ColorStateList colorStateList;
        int resourceId3;
        this.rect = new Rect();
        this.rectF = new RectF();
        this.fontCallback = new PathMotion() { // from class: com.google.android.material.chip.Chip.1
            @Override // androidx.transition.PathMotion
            public final void onFontRetrievalFailed(int i2) {
            }

            @Override // androidx.transition.PathMotion
            public final void onFontRetrieved(Typeface typeface, boolean z) {
                CharSequence charSequence;
                Chip chip = Chip.this;
                ChipDrawable chipDrawable2 = chip.chipDrawable;
                if (chipDrawable2.shouldDrawText) {
                    charSequence = chipDrawable2.text;
                } else {
                    charSequence = chip.getText();
                }
                chip.setText(charSequence);
                Chip.this.requestLayout();
                Chip.this.invalidate();
            }
        };
        Context context2 = getContext();
        if (attributeSet != null) {
            if (attributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "background") != null) {
                Log.w("Chip", "Do not set the background; Chip manages its own background drawable.");
            }
            if (attributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "drawableLeft") != null) {
                throw new UnsupportedOperationException("Please set left drawable using R.attr#chipIcon.");
            } else if (attributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "drawableStart") != null) {
                throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
            } else if (attributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "drawableEnd") != null) {
                throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
            } else if (attributeSet.getAttributeValue("http://schemas.android.com/apk/res/android", "drawableRight") != null) {
                throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
            } else if (!attributeSet.getAttributeBooleanValue("http://schemas.android.com/apk/res/android", "singleLine", true) || attributeSet.getAttributeIntValue("http://schemas.android.com/apk/res/android", "lines", 1) != 1 || attributeSet.getAttributeIntValue("http://schemas.android.com/apk/res/android", "minLines", 1) != 1 || attributeSet.getAttributeIntValue("http://schemas.android.com/apk/res/android", "maxLines", 1) != 1) {
                throw new UnsupportedOperationException("Chip does not support multi-line text");
            } else if (attributeSet.getAttributeIntValue("http://schemas.android.com/apk/res/android", "gravity", 8388627) != 8388627) {
                Log.w("Chip", "Chip text must be vertically center and start aligned");
            }
        }
        ChipDrawable chipDrawable2 = new ChipDrawable(context2, attributeSet, i);
        Context context3 = chipDrawable2.context;
        int[] iArr = R$styleable.Chip;
        TypedArray obtainStyledAttributes = ThemeEnforcement.obtainStyledAttributes(context3, attributeSet, iArr, i, R.style.Widget_MaterialComponents_Chip_Action, new int[0]);
        chipDrawable2.isShapeThemingEnabled = obtainStyledAttributes.hasValue(37);
        ColorStateList colorStateList2 = MaterialResources.getColorStateList(chipDrawable2.context, obtainStyledAttributes, 24);
        if (chipDrawable2.chipSurfaceColor != colorStateList2) {
            chipDrawable2.chipSurfaceColor = colorStateList2;
            chipDrawable2.onStateChange(chipDrawable2.getState());
        }
        ColorStateList colorStateList3 = MaterialResources.getColorStateList(chipDrawable2.context, obtainStyledAttributes, 11);
        if (chipDrawable2.chipBackgroundColor != colorStateList3) {
            chipDrawable2.chipBackgroundColor = colorStateList3;
            chipDrawable2.onStateChange(chipDrawable2.getState());
        }
        float dimension = obtainStyledAttributes.getDimension(19, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.chipMinHeight != dimension) {
            chipDrawable2.chipMinHeight = dimension;
            chipDrawable2.invalidateSelf();
            chipDrawable2.onSizeChange();
        }
        if (obtainStyledAttributes.hasValue(12)) {
            float dimension2 = obtainStyledAttributes.getDimension(12, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            if (chipDrawable2.chipCornerRadius != dimension2) {
                chipDrawable2.chipCornerRadius = dimension2;
                ShapeAppearanceModel shapeAppearanceModel = chipDrawable2.drawableState.shapeAppearanceModel;
                shapeAppearanceModel.getClass();
                ShapeAppearanceModel.Builder builder = new ShapeAppearanceModel.Builder(shapeAppearanceModel);
                builder.topLeftCornerSize = new AbsoluteCornerSize(dimension2);
                builder.topRightCornerSize = new AbsoluteCornerSize(dimension2);
                builder.bottomRightCornerSize = new AbsoluteCornerSize(dimension2);
                builder.bottomLeftCornerSize = new AbsoluteCornerSize(dimension2);
                chipDrawable2.setShapeAppearanceModel(new ShapeAppearanceModel(builder));
            }
        }
        ColorStateList colorStateList4 = MaterialResources.getColorStateList(chipDrawable2.context, obtainStyledAttributes, 22);
        if (chipDrawable2.chipStrokeColor != colorStateList4) {
            chipDrawable2.chipStrokeColor = colorStateList4;
            if (chipDrawable2.isShapeThemingEnabled) {
                MaterialShapeDrawable.MaterialShapeDrawableState materialShapeDrawableState = chipDrawable2.drawableState;
                if (materialShapeDrawableState.strokeColor != colorStateList4) {
                    materialShapeDrawableState.strokeColor = colorStateList4;
                    chipDrawable2.onStateChange(chipDrawable2.getState());
                }
            }
            chipDrawable2.onStateChange(chipDrawable2.getState());
        }
        float dimension3 = obtainStyledAttributes.getDimension(23, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.chipStrokeWidth != dimension3) {
            chipDrawable2.chipStrokeWidth = dimension3;
            chipDrawable2.chipPaint.setStrokeWidth(dimension3);
            if (chipDrawable2.isShapeThemingEnabled) {
                chipDrawable2.drawableState.strokeWidth = dimension3;
                chipDrawable2.invalidateSelf();
            }
            chipDrawable2.invalidateSelf();
        }
        ColorStateList colorStateList5 = MaterialResources.getColorStateList(chipDrawable2.context, obtainStyledAttributes, 36);
        if (chipDrawable2.rippleColor != colorStateList5) {
            chipDrawable2.rippleColor = colorStateList5;
            if (!chipDrawable2.useCompatRipple) {
                colorStateList5 = null;
            } else if (colorStateList5 == null) {
                colorStateList5 = ColorStateList.valueOf(0);
            }
            chipDrawable2.compatRippleColor = colorStateList5;
            chipDrawable2.onStateChange(chipDrawable2.getState());
        }
        String text = obtainStyledAttributes.getText(5);
        text = text == null ? "" : text;
        if (!TextUtils.equals(chipDrawable2.text, text)) {
            chipDrawable2.text = text;
            chipDrawable2.textDrawableHelper.textWidthDirty = true;
            chipDrawable2.invalidateSelf();
            chipDrawable2.onSizeChange();
        }
        TextAppearance textAppearance = (!obtainStyledAttributes.hasValue(0) || (resourceId3 = obtainStyledAttributes.getResourceId(0, 0)) == 0) ? null : new TextAppearance(chipDrawable2.context, resourceId3);
        textAppearance.textSize = obtainStyledAttributes.getDimension(1, textAppearance.textSize);
        chipDrawable2.setTextAppearance(textAppearance);
        int i2 = obtainStyledAttributes.getInt(3, 0);
        if (i2 == 1) {
            chipDrawable2.truncateAt = TextUtils.TruncateAt.START;
        } else if (i2 == 2) {
            chipDrawable2.truncateAt = TextUtils.TruncateAt.MIDDLE;
        } else if (i2 == 3) {
            chipDrawable2.truncateAt = TextUtils.TruncateAt.END;
        }
        chipDrawable2.setChipIconVisible(obtainStyledAttributes.getBoolean(18, false));
        if (!(attributeSet == null || attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "chipIconEnabled") == null || attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "chipIconVisible") != null)) {
            chipDrawable2.setChipIconVisible(obtainStyledAttributes.getBoolean(15, false));
        }
        Drawable drawable = MaterialResources.getDrawable(chipDrawable2.context, obtainStyledAttributes, 14);
        Drawable drawable2 = chipDrawable2.chipIcon;
        if (drawable2 == null) {
            drawable2 = null;
        } else if (drawable2 instanceof WrappedDrawable) {
            drawable2 = ((WrappedDrawable) drawable2).getWrappedDrawable();
        }
        if (drawable2 != drawable) {
            float calculateChipIconWidth = chipDrawable2.calculateChipIconWidth();
            chipDrawable2.chipIcon = drawable != null ? drawable.mutate() : null;
            float calculateChipIconWidth2 = chipDrawable2.calculateChipIconWidth();
            ChipDrawable.unapplyChildDrawable(drawable2);
            if (chipDrawable2.showsChipIcon()) {
                chipDrawable2.applyChildDrawable(chipDrawable2.chipIcon);
            }
            chipDrawable2.invalidateSelf();
            if (calculateChipIconWidth != calculateChipIconWidth2) {
                chipDrawable2.onSizeChange();
            }
        }
        if (obtainStyledAttributes.hasValue(17)) {
            ColorStateList colorStateList6 = MaterialResources.getColorStateList(chipDrawable2.context, obtainStyledAttributes, 17);
            chipDrawable2.hasChipIconTint = true;
            if (chipDrawable2.chipIconTint != colorStateList6) {
                chipDrawable2.chipIconTint = colorStateList6;
                if (chipDrawable2.showsChipIcon()) {
                    chipDrawable2.chipIcon.setTintList(colorStateList6);
                }
                chipDrawable2.onStateChange(chipDrawable2.getState());
            }
        }
        float dimension4 = obtainStyledAttributes.getDimension(16, -1.0f);
        if (chipDrawable2.chipIconSize != dimension4) {
            float calculateChipIconWidth3 = chipDrawable2.calculateChipIconWidth();
            chipDrawable2.chipIconSize = dimension4;
            float calculateChipIconWidth4 = chipDrawable2.calculateChipIconWidth();
            chipDrawable2.invalidateSelf();
            if (calculateChipIconWidth3 != calculateChipIconWidth4) {
                chipDrawable2.onSizeChange();
            }
        }
        chipDrawable2.setCloseIconVisible(obtainStyledAttributes.getBoolean(31, false));
        if (!(attributeSet == null || attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "closeIconEnabled") == null || attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "closeIconVisible") != null)) {
            chipDrawable2.setCloseIconVisible(obtainStyledAttributes.getBoolean(26, false));
        }
        Drawable drawable3 = MaterialResources.getDrawable(chipDrawable2.context, obtainStyledAttributes, 25);
        Drawable drawable4 = chipDrawable2.closeIcon;
        if (drawable4 == null) {
            drawable4 = null;
        } else if (drawable4 instanceof WrappedDrawable) {
            drawable4 = ((WrappedDrawable) drawable4).getWrappedDrawable();
        }
        if (drawable4 != drawable3) {
            float calculateCloseIconWidth = chipDrawable2.calculateCloseIconWidth();
            chipDrawable2.closeIcon = drawable3 != null ? drawable3.mutate() : null;
            ColorStateList colorStateList7 = chipDrawable2.rippleColor;
            chipDrawable2.closeIconRipple = new RippleDrawable(colorStateList7 == null ? ColorStateList.valueOf(0) : colorStateList7, chipDrawable2.closeIcon, ChipDrawable.closeIconRippleMask);
            float calculateCloseIconWidth2 = chipDrawable2.calculateCloseIconWidth();
            ChipDrawable.unapplyChildDrawable(drawable4);
            if (chipDrawable2.showsCloseIcon()) {
                chipDrawable2.applyChildDrawable(chipDrawable2.closeIcon);
            }
            chipDrawable2.invalidateSelf();
            if (calculateCloseIconWidth != calculateCloseIconWidth2) {
                chipDrawable2.onSizeChange();
            }
        }
        ColorStateList colorStateList8 = MaterialResources.getColorStateList(chipDrawable2.context, obtainStyledAttributes, 30);
        if (chipDrawable2.closeIconTint != colorStateList8) {
            chipDrawable2.closeIconTint = colorStateList8;
            if (chipDrawable2.showsCloseIcon()) {
                chipDrawable2.closeIcon.setTintList(colorStateList8);
            }
            chipDrawable2.onStateChange(chipDrawable2.getState());
        }
        float dimension5 = obtainStyledAttributes.getDimension(28, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.closeIconSize != dimension5) {
            chipDrawable2.closeIconSize = dimension5;
            chipDrawable2.invalidateSelf();
            if (chipDrawable2.showsCloseIcon()) {
                chipDrawable2.onSizeChange();
            }
        }
        boolean z = obtainStyledAttributes.getBoolean(6, false);
        if (chipDrawable2.checkable != z) {
            chipDrawable2.checkable = z;
            float calculateChipIconWidth5 = chipDrawable2.calculateChipIconWidth();
            if (!z && chipDrawable2.currentChecked) {
                chipDrawable2.currentChecked = false;
            }
            float calculateChipIconWidth6 = chipDrawable2.calculateChipIconWidth();
            chipDrawable2.invalidateSelf();
            if (calculateChipIconWidth5 != calculateChipIconWidth6) {
                chipDrawable2.onSizeChange();
            }
        }
        chipDrawable2.setCheckedIconVisible(obtainStyledAttributes.getBoolean(10, false));
        if (!(attributeSet == null || attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "checkedIconEnabled") == null || attributeSet.getAttributeValue("http://schemas.android.com/apk/res-auto", "checkedIconVisible") != null)) {
            chipDrawable2.setCheckedIconVisible(obtainStyledAttributes.getBoolean(8, false));
        }
        Drawable drawable5 = MaterialResources.getDrawable(chipDrawable2.context, obtainStyledAttributes, 7);
        if (chipDrawable2.checkedIcon != drawable5) {
            float calculateChipIconWidth7 = chipDrawable2.calculateChipIconWidth();
            chipDrawable2.checkedIcon = drawable5;
            float calculateChipIconWidth8 = chipDrawable2.calculateChipIconWidth();
            ChipDrawable.unapplyChildDrawable(chipDrawable2.checkedIcon);
            chipDrawable2.applyChildDrawable(chipDrawable2.checkedIcon);
            chipDrawable2.invalidateSelf();
            if (calculateChipIconWidth7 != calculateChipIconWidth8) {
                chipDrawable2.onSizeChange();
            }
        }
        if (obtainStyledAttributes.hasValue(9) && chipDrawable2.checkedIconTint != (colorStateList = MaterialResources.getColorStateList(chipDrawable2.context, obtainStyledAttributes, 9))) {
            chipDrawable2.checkedIconTint = colorStateList;
            if (chipDrawable2.checkedIconVisible && chipDrawable2.checkedIcon != null && chipDrawable2.checkable) {
                chipDrawable2.checkedIcon.setTintList(colorStateList);
            }
            chipDrawable2.onStateChange(chipDrawable2.getState());
        }
        Context context4 = chipDrawable2.context;
        if (obtainStyledAttributes.hasValue(39) && (resourceId2 = obtainStyledAttributes.getResourceId(39, 0)) != 0) {
            MotionSpec.createFromResource(context4, resourceId2);
        }
        Context context5 = chipDrawable2.context;
        if (obtainStyledAttributes.hasValue(33) && (resourceId = obtainStyledAttributes.getResourceId(33, 0)) != 0) {
            MotionSpec.createFromResource(context5, resourceId);
        }
        float dimension6 = obtainStyledAttributes.getDimension(21, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.chipStartPadding != dimension6) {
            chipDrawable2.chipStartPadding = dimension6;
            chipDrawable2.invalidateSelf();
            chipDrawable2.onSizeChange();
        }
        float dimension7 = obtainStyledAttributes.getDimension(35, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.iconStartPadding != dimension7) {
            float calculateChipIconWidth9 = chipDrawable2.calculateChipIconWidth();
            chipDrawable2.iconStartPadding = dimension7;
            float calculateChipIconWidth10 = chipDrawable2.calculateChipIconWidth();
            chipDrawable2.invalidateSelf();
            if (calculateChipIconWidth9 != calculateChipIconWidth10) {
                chipDrawable2.onSizeChange();
            }
        }
        float dimension8 = obtainStyledAttributes.getDimension(34, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.iconEndPadding != dimension8) {
            float calculateChipIconWidth11 = chipDrawable2.calculateChipIconWidth();
            chipDrawable2.iconEndPadding = dimension8;
            float calculateChipIconWidth12 = chipDrawable2.calculateChipIconWidth();
            chipDrawable2.invalidateSelf();
            if (calculateChipIconWidth11 != calculateChipIconWidth12) {
                chipDrawable2.onSizeChange();
            }
        }
        float dimension9 = obtainStyledAttributes.getDimension(41, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.textStartPadding != dimension9) {
            chipDrawable2.textStartPadding = dimension9;
            chipDrawable2.invalidateSelf();
            chipDrawable2.onSizeChange();
        }
        float dimension10 = obtainStyledAttributes.getDimension(40, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.textEndPadding != dimension10) {
            chipDrawable2.textEndPadding = dimension10;
            chipDrawable2.invalidateSelf();
            chipDrawable2.onSizeChange();
        }
        float dimension11 = obtainStyledAttributes.getDimension(29, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.closeIconStartPadding != dimension11) {
            chipDrawable2.closeIconStartPadding = dimension11;
            chipDrawable2.invalidateSelf();
            if (chipDrawable2.showsCloseIcon()) {
                chipDrawable2.onSizeChange();
            }
        }
        float dimension12 = obtainStyledAttributes.getDimension(27, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.closeIconEndPadding != dimension12) {
            chipDrawable2.closeIconEndPadding = dimension12;
            chipDrawable2.invalidateSelf();
            if (chipDrawable2.showsCloseIcon()) {
                chipDrawable2.onSizeChange();
            }
        }
        float dimension13 = obtainStyledAttributes.getDimension(13, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        if (chipDrawable2.chipEndPadding != dimension13) {
            chipDrawable2.chipEndPadding = dimension13;
            chipDrawable2.invalidateSelf();
            chipDrawable2.onSizeChange();
        }
        chipDrawable2.maxWidth = obtainStyledAttributes.getDimensionPixelSize(4, Integer.MAX_VALUE);
        obtainStyledAttributes.recycle();
        TypedArray obtainStyledAttributes2 = ThemeEnforcement.obtainStyledAttributes(context2, attributeSet, iArr, i, R.style.Widget_MaterialComponents_Chip_Action, new int[0]);
        this.ensureMinTouchTargetSize = obtainStyledAttributes2.getBoolean(32, false);
        this.minTouchTargetSize = (int) Math.ceil(obtainStyledAttributes2.getDimension(20, (float) Math.ceil(ViewUtils.dpToPx(getContext(), 48))));
        obtainStyledAttributes2.recycle();
        ChipDrawable chipDrawable3 = this.chipDrawable;
        if (chipDrawable3 != chipDrawable2) {
            if (chipDrawable3 != null) {
                chipDrawable3.delegate = new WeakReference<>(null);
            }
            this.chipDrawable = chipDrawable2;
            chipDrawable2.shouldDrawText = false;
            chipDrawable2.delegate = new WeakReference<>(this);
            ensureAccessibleTouchTarget(this.minTouchTargetSize);
        }
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        chipDrawable2.setElevation(ViewCompat.Api21Impl.getElevation(this));
        TypedArray obtainStyledAttributes3 = ThemeEnforcement.obtainStyledAttributes(context2, attributeSet, iArr, i, R.style.Widget_MaterialComponents_Chip_Action, new int[0]);
        boolean hasValue = obtainStyledAttributes3.hasValue(37);
        obtainStyledAttributes3.recycle();
        new ChipTouchHelper(this);
        if (hasCloseIcon() && (chipDrawable = this.chipDrawable) != null) {
            boolean z2 = chipDrawable.closeIconVisible;
        }
        ViewCompat.setAccessibilityDelegate(this, null);
        if (!hasValue) {
            setOutlineProvider(new ViewOutlineProvider() { // from class: com.google.android.material.chip.Chip.2
                @Override // android.view.ViewOutlineProvider
                @TargetApi(21)
                public final void getOutline(View view, Outline outline) {
                    ChipDrawable chipDrawable4 = Chip.this.chipDrawable;
                    if (chipDrawable4 != null) {
                        chipDrawable4.getOutline(outline);
                    } else {
                        outline.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    }
                }
            });
        }
        setChecked(this.deferredCheckedValue);
        setText(chipDrawable2.text);
        setEllipsize(chipDrawable2.truncateAt);
        updateTextPaintDrawState();
        if (!this.chipDrawable.shouldDrawText) {
            setLines(1);
            setHorizontallyScrolling(true);
        }
        setGravity(8388627);
        updatePaddingInternal();
        if (this.ensureMinTouchTargetSize) {
            setMinHeight(this.minTouchTargetSize);
        }
        this.lastLayoutDirection = ViewCompat.Api17Impl.getLayoutDirection(this);
    }

    @Override // android.view.View
    public final boolean dispatchHoverEvent(MotionEvent motionEvent) {
        return super.dispatchHoverEvent(motionEvent);
    }

    @Override // android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent);
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [int, boolean] */
    @Override // androidx.appcompat.widget.AppCompatCheckBox, android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        int i;
        super.drawableStateChanged();
        ChipDrawable chipDrawable = this.chipDrawable;
        boolean z = false;
        if (chipDrawable != null && ChipDrawable.isStateful(chipDrawable.closeIcon)) {
            ChipDrawable chipDrawable2 = this.chipDrawable;
            ?? isEnabled = isEnabled();
            int i2 = isEnabled;
            if (this.closeIconFocused) {
                i2 = isEnabled + 1;
            }
            int i3 = i2;
            if (this.closeIconHovered) {
                i3 = i2 + 1;
            }
            int i4 = i3;
            if (this.closeIconPressed) {
                i4 = i3 + 1;
            }
            int i5 = i4;
            if (isChecked()) {
                i5 = i4 + 1;
            }
            int[] iArr = new int[i5];
            if (isEnabled()) {
                iArr[0] = 16842910;
                i = 1;
            } else {
                i = 0;
            }
            if (this.closeIconFocused) {
                iArr[i] = 16842908;
                i++;
            }
            if (this.closeIconHovered) {
                iArr[i] = 16843623;
                i++;
            }
            if (this.closeIconPressed) {
                iArr[i] = 16842919;
                i++;
            }
            if (isChecked()) {
                iArr[i] = 16842913;
            }
            if (!Arrays.equals(chipDrawable2.closeIconStateSet, iArr)) {
                chipDrawable2.closeIconStateSet = iArr;
                if (chipDrawable2.showsCloseIcon()) {
                    z = chipDrawable2.onStateChange(chipDrawable2.getState(), iArr);
                }
            }
        }
        if (z) {
            invalidate();
        }
    }

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        R$layout.setParentAbsoluteElevation(this, this.chipDrawable);
    }

    @Override // android.view.View
    public final boolean onHoverEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 7) {
            this.rectF.setEmpty();
            hasCloseIcon();
            boolean contains = this.rectF.contains(motionEvent.getX(), motionEvent.getY());
            if (this.closeIconHovered != contains) {
                this.closeIconHovered = contains;
                refreshDrawableState();
            }
        } else if (actionMasked == 10 && this.closeIconHovered) {
            this.closeIconHovered = false;
            refreshDrawableState();
        }
        return super.onHoverEvent(motionEvent);
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        boolean z;
        int i;
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName(getAccessibilityClassName());
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable == null || !chipDrawable.checkable) {
            z = false;
        } else {
            z = true;
        }
        accessibilityNodeInfo.setCheckable(z);
        accessibilityNodeInfo.setClickable(isClickable());
        if (getParent() instanceof ChipGroup) {
            ChipGroup chipGroup = (ChipGroup) getParent();
            int i2 = -1;
            if (chipGroup.singleLine) {
                i = 0;
                for (int i3 = 0; i3 < chipGroup.getChildCount(); i3++) {
                    if (chipGroup.getChildAt(i3) instanceof Chip) {
                        if (((Chip) chipGroup.getChildAt(i3)) == this) {
                            break;
                        }
                        i++;
                    }
                }
            }
            i = -1;
            Object tag = getTag(R.id.row_index_key);
            if (tag instanceof Integer) {
                i2 = ((Integer) tag).intValue();
            }
            accessibilityNodeInfo.setCollectionItemInfo((AccessibilityNodeInfo.CollectionItemInfo) AccessibilityNodeInfoCompat.CollectionItemInfoCompat.obtain(i2, 1, i, 1, isChecked()).mInfo);
        }
    }

    @Override // android.widget.TextView, android.view.View
    @TargetApi(17)
    public final void onRtlPropertiesChanged(int i) {
        super.onRtlPropertiesChanged(i);
        if (this.lastLayoutDirection != i) {
            this.lastLayoutDirection = i;
            updatePaddingInternal();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:8:0x0024, code lost:
        if (r0 != 3) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0043  */
    @Override // android.widget.TextView, android.view.View
    @android.annotation.SuppressLint({"ClickableViewAccessibility"})
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean onTouchEvent(android.view.MotionEvent r6) {
        /*
            r5 = this;
            int r0 = r6.getActionMasked()
            android.graphics.RectF r1 = r5.rectF
            r1.setEmpty()
            r5.hasCloseIcon()
            android.graphics.RectF r1 = r5.rectF
            float r2 = r6.getX()
            float r3 = r6.getY()
            boolean r1 = r1.contains(r2, r3)
            r2 = 0
            r3 = 1
            if (r0 == 0) goto L49
            if (r0 == r3) goto L35
            r4 = 2
            if (r0 == r4) goto L27
            r1 = 3
            if (r0 == r1) goto L3e
            goto L56
        L27:
            boolean r0 = r5.closeIconPressed
            if (r0 == 0) goto L56
            if (r1 != 0) goto L54
            if (r0 == 0) goto L54
            r5.closeIconPressed = r2
            r5.refreshDrawableState()
            goto L54
        L35:
            boolean r0 = r5.closeIconPressed
            if (r0 == 0) goto L3e
            r5.playSoundEffect(r2)
            r0 = r3
            goto L3f
        L3e:
            r0 = r2
        L3f:
            boolean r1 = r5.closeIconPressed
            if (r1 == 0) goto L57
            r5.closeIconPressed = r2
            r5.refreshDrawableState()
            goto L57
        L49:
            if (r1 == 0) goto L56
            boolean r0 = r5.closeIconPressed
            if (r0 == r3) goto L54
            r5.closeIconPressed = r3
            r5.refreshDrawableState()
        L54:
            r0 = r3
            goto L57
        L56:
            r0 = r2
        L57:
            if (r0 != 0) goto L5f
            boolean r5 = super.onTouchEvent(r6)
            if (r5 == 0) goto L60
        L5f:
            r2 = r3
        L60:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.chip.Chip.onTouchEvent(android.view.MotionEvent):boolean");
    }

    @Override // android.view.View
    public final void setElevation(float f) {
        super.setElevation(f);
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable != null) {
            chipDrawable.setElevation(f);
        }
    }

    @Override // android.widget.TextView
    public final void setGravity(int i) {
        if (i != 8388627) {
            Log.w("Chip", "Chip text must be vertically center and start aligned");
        } else {
            super.setGravity(i);
        }
    }

    @Override // android.widget.TextView
    public final void setMaxWidth(int i) {
        super.setMaxWidth(i);
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable != null) {
            chipDrawable.maxWidth = i;
        }
    }

    public final void updatePaddingInternal() {
        ChipDrawable chipDrawable;
        if (!TextUtils.isEmpty(getText()) && (chipDrawable = this.chipDrawable) != null) {
            int calculateCloseIconWidth = (int) (chipDrawable.calculateCloseIconWidth() + chipDrawable.chipEndPadding + chipDrawable.textEndPadding);
            ChipDrawable chipDrawable2 = this.chipDrawable;
            int calculateChipIconWidth = (int) (chipDrawable2.calculateChipIconWidth() + chipDrawable2.chipStartPadding + chipDrawable2.textStartPadding);
            if (this.insetBackgroundDrawable != null) {
                Rect rect = new Rect();
                this.insetBackgroundDrawable.getPadding(rect);
                calculateChipIconWidth += rect.left;
                calculateCloseIconWidth += rect.right;
            }
            int paddingTop = getPaddingTop();
            int paddingBottom = getPaddingBottom();
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api17Impl.setPaddingRelative(this, calculateChipIconWidth, paddingTop, calculateCloseIconWidth, paddingBottom);
        }
    }

    public final void updateTextPaintDrawState() {
        TextAppearance textAppearance;
        TextPaint paint = getPaint();
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable != null) {
            paint.drawableState = chipDrawable.getState();
        }
        ChipDrawable chipDrawable2 = this.chipDrawable;
        if (chipDrawable2 != null) {
            textAppearance = chipDrawable2.textDrawableHelper.textAppearance;
        } else {
            textAppearance = null;
        }
        if (textAppearance != null) {
            textAppearance.updateDrawState(getContext(), paint, this.fontCallback);
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesRelativeWithIntrinsicBounds(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        if (drawable != null) {
            throw new UnsupportedOperationException("Please set start drawable using R.attr#chipIcon.");
        } else if (drawable3 == null) {
            super.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable, drawable2, drawable3, drawable4);
        } else {
            throw new UnsupportedOperationException("Please set end drawable using R.attr#closeIcon.");
        }
    }

    @Override // android.widget.TextView
    public final void setCompoundDrawablesWithIntrinsicBounds(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4) {
        if (drawable != null) {
            throw new UnsupportedOperationException("Please set left drawable using R.attr#chipIcon.");
        } else if (drawable3 == null) {
            super.setCompoundDrawablesWithIntrinsicBounds(drawable, drawable2, drawable3, drawable4);
        } else {
            throw new UnsupportedOperationException("Please set right drawable using R.attr#closeIcon.");
        }
    }

    @Override // android.widget.TextView
    public final void setTextAppearance(int i) {
        super.setTextAppearance(i);
        ChipDrawable chipDrawable = this.chipDrawable;
        if (chipDrawable != null) {
            chipDrawable.setTextAppearance(new TextAppearance(chipDrawable.context, i));
        }
        updateTextPaintDrawState();
    }

    @Override // android.widget.TextView, android.view.View
    public final void onFocusChanged(boolean z, int i, Rect rect) {
        super.onFocusChanged(z, i, rect);
    }

    @Override // android.widget.TextView, android.view.View
    public final void getFocusedRect(Rect rect) {
        super.getFocusedRect(rect);
    }
}
