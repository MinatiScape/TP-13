package com.google.android.material.button;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.Layout;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.Checkable;
import android.widget.CompoundButton;
import androidx.appcompat.R$bool;
import androidx.appcompat.R$layout;
import androidx.appcompat.content.res.AppCompatResources;
import androidx.appcompat.widget.AppCompatBackgroundHelper;
import androidx.appcompat.widget.AppCompatButton;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.customview.view.AbsSavedState;
import com.android.systemui.shared.R;
import com.google.android.material.R$styleable;
import com.google.android.material.internal.ThemeEnforcement;
import com.google.android.material.internal.ViewUtils;
import com.google.android.material.resources.MaterialResources;
import com.google.android.material.shape.AbsoluteCornerSize;
import com.google.android.material.shape.MaterialShapeDrawable;
import com.google.android.material.shape.ShapeAppearanceModel;
import com.google.android.material.shape.Shapeable;
import com.google.android.material.theme.overlay.MaterialThemeOverlay;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class MaterialButton extends AppCompatButton implements Checkable, Shapeable {
    public static final int[] CHECKABLE_STATE_SET = {16842911};
    public static final int[] CHECKED_STATE_SET = {16842912};
    public boolean broadcasting;
    public boolean checked;
    public Drawable icon;
    public int iconGravity;
    public int iconLeft;
    public int iconPadding;
    public int iconSize;
    public ColorStateList iconTint;
    public PorterDuff.Mode iconTintMode;
    public int iconTop;
    public final MaterialButtonHelper materialButtonHelper;
    public final LinkedHashSet<OnCheckedChangeListener> onCheckedChangeListeners;
    public OnPressedChangeListener onPressedChangeListenerInternal;

    /* loaded from: classes.dex */
    public interface OnCheckedChangeListener {
        void onCheckedChanged();
    }

    /* loaded from: classes.dex */
    public interface OnPressedChangeListener {
    }

    /* loaded from: classes.dex */
    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SavedState>() { // from class: com.google.android.material.button.MaterialButton.SavedState.1
            @Override // android.os.Parcelable.ClassLoaderCreator
            public final SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return new SavedState(parcel, classLoader);
            }

            @Override // android.os.Parcelable.Creator
            public final Object createFromParcel(Parcel parcel) {
                return new SavedState(parcel, null);
            }

            @Override // android.os.Parcelable.Creator
            public final Object[] newArray(int i) {
                return new SavedState[i];
            }
        };
        public boolean checked;

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            if (classLoader == null) {
                getClass().getClassLoader();
            }
            this.checked = parcel.readInt() != 1 ? false : true;
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mSuperState, i);
            parcel.writeInt(this.checked ? 1 : 0);
        }
    }

    public MaterialButton(Context context) {
        this(context, null);
    }

    public MaterialButton(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.materialButtonStyle);
    }

    public final boolean isUsingOriginalBackground() {
        MaterialButtonHelper materialButtonHelper = this.materialButtonHelper;
        if (materialButtonHelper == null || materialButtonHelper.backgroundOverwritten) {
            return false;
        }
        return true;
    }

    @Override // android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i) {
        boolean z;
        int[] onCreateDrawableState = super.onCreateDrawableState(i + 2);
        MaterialButtonHelper materialButtonHelper = this.materialButtonHelper;
        if (materialButtonHelper == null || !materialButtonHelper.checkable) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            View.mergeDrawableStates(onCreateDrawableState, CHECKABLE_STATE_SET);
        }
        if (isChecked()) {
            View.mergeDrawableStates(onCreateDrawableState, CHECKED_STATE_SET);
        }
        return onCreateDrawableState;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.mSuperState);
        setChecked(savedState.checked);
    }

    public final void resetIconDrawable() {
        boolean z;
        boolean z2;
        int i = this.iconGravity;
        boolean z3 = false;
        if (i == 1 || i == 2) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            setCompoundDrawablesRelative(this.icon, null, null, null);
            return;
        }
        if (i == 3 || i == 4) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (z2) {
            setCompoundDrawablesRelative(null, null, this.icon, null);
            return;
        }
        if (i == 16 || i == 32) {
            z3 = true;
        }
        if (z3) {
            setCompoundDrawablesRelative(null, this.icon, null, null);
        }
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.view.View
    public final void setBackgroundResource(int i) {
        Drawable drawable;
        if (i != 0) {
            drawable = AppCompatResources.getDrawable(getContext(), i);
        } else {
            drawable = null;
        }
        setBackgroundDrawable(drawable);
    }

    @Override // android.widget.Checkable
    public final void setChecked(boolean z) {
        boolean z2;
        MaterialButtonHelper materialButtonHelper = this.materialButtonHelper;
        if (materialButtonHelper == null || !materialButtonHelper.checkable) {
            z2 = false;
        } else {
            z2 = true;
        }
        if (z2 && isEnabled() && this.checked != z) {
            this.checked = z;
            refreshDrawableState();
            if (getParent() instanceof MaterialButtonToggleGroup) {
                MaterialButtonToggleGroup materialButtonToggleGroup = (MaterialButtonToggleGroup) getParent();
                boolean z3 = this.checked;
                if (!materialButtonToggleGroup.skipCheckedStateTracker) {
                    materialButtonToggleGroup.checkInternal(getId(), z3);
                }
            }
            if (!this.broadcasting) {
                this.broadcasting = true;
                Iterator<OnCheckedChangeListener> it = this.onCheckedChangeListeners.iterator();
                while (it.hasNext()) {
                    it.next().onCheckedChanged();
                }
                this.broadcasting = false;
            }
        }
    }

    @Override // android.view.View
    public final void setPressed(boolean z) {
        OnPressedChangeListener onPressedChangeListener = this.onPressedChangeListenerInternal;
        if (onPressedChangeListener != null) {
            MaterialButtonToggleGroup.this.invalidate();
        }
        super.setPressed(z);
    }

    @Override // android.widget.Checkable
    public final void toggle() {
        setChecked(!this.checked);
    }

    public final void updateIcon(boolean z) {
        boolean z2;
        boolean z3;
        boolean z4;
        Drawable drawable = this.icon;
        boolean z5 = true;
        if (drawable != null) {
            Drawable mutate = drawable.mutate();
            this.icon = mutate;
            mutate.setTintList(this.iconTint);
            PorterDuff.Mode mode = this.iconTintMode;
            if (mode != null) {
                this.icon.setTintMode(mode);
            }
            int i = this.iconSize;
            if (i == 0) {
                i = this.icon.getIntrinsicWidth();
            }
            int i2 = this.iconSize;
            if (i2 == 0) {
                i2 = this.icon.getIntrinsicHeight();
            }
            Drawable drawable2 = this.icon;
            int i3 = this.iconLeft;
            int i4 = this.iconTop;
            drawable2.setBounds(i3, i4, i + i3, i2 + i4);
            this.icon.setVisible(true, z);
        }
        if (z) {
            resetIconDrawable();
            return;
        }
        Drawable[] compoundDrawablesRelative = getCompoundDrawablesRelative();
        Drawable drawable3 = compoundDrawablesRelative[0];
        Drawable drawable4 = compoundDrawablesRelative[1];
        Drawable drawable5 = compoundDrawablesRelative[2];
        int i5 = this.iconGravity;
        if (i5 == 1 || i5 == 2) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (!z2 || drawable3 == this.icon) {
            if (i5 == 3 || i5 == 4) {
                z3 = true;
            } else {
                z3 = false;
            }
            if (!z3 || drawable5 == this.icon) {
                if (i5 == 16 || i5 == 32) {
                    z4 = true;
                } else {
                    z4 = false;
                }
                if (!z4 || drawable4 == this.icon) {
                    z5 = false;
                }
            }
        }
        if (z5) {
            resetIconDrawable();
        }
    }

    public final void updateIconPosition(int i, int i2) {
        boolean z;
        Layout.Alignment alignment;
        boolean z2;
        boolean z3;
        if (this.icon != null && getLayout() != null) {
            int i3 = this.iconGravity;
            boolean z4 = true;
            if (i3 == 1 || i3 == 2) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                if (i3 == 3 || i3 == 4) {
                    z3 = true;
                } else {
                    z3 = false;
                }
                if (!z3) {
                    if (!(i3 == 16 || i3 == 32)) {
                        z4 = false;
                    }
                    if (z4) {
                        this.iconLeft = 0;
                        if (i3 == 16) {
                            this.iconTop = 0;
                            updateIcon(false);
                            return;
                        }
                        int i4 = this.iconSize;
                        if (i4 == 0) {
                            i4 = this.icon.getIntrinsicHeight();
                        }
                        TextPaint paint = getPaint();
                        String charSequence = getText().toString();
                        if (getTransformationMethod() != null) {
                            charSequence = getTransformationMethod().getTransformation(charSequence, this).toString();
                        }
                        Rect rect = new Rect();
                        paint.getTextBounds(charSequence, 0, charSequence.length(), rect);
                        int min = (((((i2 - Math.min(rect.height(), getLayout().getHeight())) - getPaddingTop()) - i4) - this.iconPadding) - getPaddingBottom()) / 2;
                        if (this.iconTop != min) {
                            this.iconTop = min;
                            updateIcon(false);
                            return;
                        }
                        return;
                    }
                    return;
                }
            }
            this.iconTop = 0;
            int textAlignment = getTextAlignment();
            if (textAlignment == 1) {
                int gravity = getGravity() & 8388615;
                if (gravity == 1) {
                    alignment = Layout.Alignment.ALIGN_CENTER;
                } else if (gravity == 5 || gravity == 8388613) {
                    alignment = Layout.Alignment.ALIGN_OPPOSITE;
                } else {
                    alignment = Layout.Alignment.ALIGN_NORMAL;
                }
            } else if (textAlignment == 6 || textAlignment == 3) {
                alignment = Layout.Alignment.ALIGN_OPPOSITE;
            } else if (textAlignment != 4) {
                alignment = Layout.Alignment.ALIGN_NORMAL;
            } else {
                alignment = Layout.Alignment.ALIGN_CENTER;
            }
            int i5 = this.iconGravity;
            if (i5 == 1 || i5 == 3 || ((i5 == 2 && alignment == Layout.Alignment.ALIGN_NORMAL) || (i5 == 4 && alignment == Layout.Alignment.ALIGN_OPPOSITE))) {
                this.iconLeft = 0;
                updateIcon(false);
                return;
            }
            int i6 = this.iconSize;
            if (i6 == 0) {
                i6 = this.icon.getIntrinsicWidth();
            }
            TextPaint paint2 = getPaint();
            String charSequence2 = getText().toString();
            if (getTransformationMethod() != null) {
                charSequence2 = getTransformationMethod().getTransformation(charSequence2, this).toString();
            }
            int min2 = i - Math.min((int) paint2.measureText(charSequence2), getLayout().getEllipsizedWidth());
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            int paddingEnd = (((min2 - ViewCompat.Api17Impl.getPaddingEnd(this)) - i6) - this.iconPadding) - ViewCompat.Api17Impl.getPaddingStart(this);
            if (alignment == Layout.Alignment.ALIGN_CENTER) {
                paddingEnd /= 2;
            }
            if (ViewCompat.Api17Impl.getLayoutDirection(this) == 1) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (this.iconGravity != 4) {
                z4 = false;
            }
            if (z2 != z4) {
                paddingEnd = -paddingEnd;
            }
            if (this.iconLeft != paddingEnd) {
                this.iconLeft = paddingEnd;
                updateIcon(false);
            }
        }
    }

    public MaterialButton(Context context, AttributeSet attributeSet, int i) {
        super(MaterialThemeOverlay.wrap(context, attributeSet, i, R.style.Widget_MaterialComponents_Button), attributeSet, i);
        this.onCheckedChangeListeners = new LinkedHashSet<>();
        boolean z = false;
        this.checked = false;
        this.broadcasting = false;
        Context context2 = getContext();
        TypedArray obtainStyledAttributes = ThemeEnforcement.obtainStyledAttributes(context2, attributeSet, R$styleable.MaterialButton, i, R.style.Widget_MaterialComponents_Button, new int[0]);
        this.iconPadding = obtainStyledAttributes.getDimensionPixelSize(12, 0);
        this.iconTintMode = ViewUtils.parseTintMode(obtainStyledAttributes.getInt(15, -1), PorterDuff.Mode.SRC_IN);
        this.iconTint = MaterialResources.getColorStateList(getContext(), obtainStyledAttributes, 14);
        this.icon = MaterialResources.getDrawable(getContext(), obtainStyledAttributes, 10);
        this.iconGravity = obtainStyledAttributes.getInteger(11, 1);
        this.iconSize = obtainStyledAttributes.getDimensionPixelSize(13, 0);
        MaterialButtonHelper materialButtonHelper = new MaterialButtonHelper(this, new ShapeAppearanceModel(ShapeAppearanceModel.builder(context2, attributeSet, i, (int) R.style.Widget_MaterialComponents_Button)));
        this.materialButtonHelper = materialButtonHelper;
        materialButtonHelper.insetLeft = obtainStyledAttributes.getDimensionPixelOffset(1, 0);
        materialButtonHelper.insetRight = obtainStyledAttributes.getDimensionPixelOffset(2, 0);
        materialButtonHelper.insetTop = obtainStyledAttributes.getDimensionPixelOffset(3, 0);
        materialButtonHelper.insetBottom = obtainStyledAttributes.getDimensionPixelOffset(4, 0);
        if (obtainStyledAttributes.hasValue(8)) {
            int dimensionPixelSize = obtainStyledAttributes.getDimensionPixelSize(8, -1);
            ShapeAppearanceModel shapeAppearanceModel = materialButtonHelper.shapeAppearanceModel;
            float f = dimensionPixelSize;
            shapeAppearanceModel.getClass();
            ShapeAppearanceModel.Builder builder = new ShapeAppearanceModel.Builder(shapeAppearanceModel);
            builder.topLeftCornerSize = new AbsoluteCornerSize(f);
            builder.topRightCornerSize = new AbsoluteCornerSize(f);
            builder.bottomRightCornerSize = new AbsoluteCornerSize(f);
            builder.bottomLeftCornerSize = new AbsoluteCornerSize(f);
            materialButtonHelper.setShapeAppearanceModel(new ShapeAppearanceModel(builder));
        }
        materialButtonHelper.strokeWidth = obtainStyledAttributes.getDimensionPixelSize(20, 0);
        materialButtonHelper.backgroundTintMode = ViewUtils.parseTintMode(obtainStyledAttributes.getInt(7, -1), PorterDuff.Mode.SRC_IN);
        materialButtonHelper.backgroundTint = MaterialResources.getColorStateList(getContext(), obtainStyledAttributes, 6);
        materialButtonHelper.strokeColor = MaterialResources.getColorStateList(getContext(), obtainStyledAttributes, 19);
        materialButtonHelper.rippleColor = MaterialResources.getColorStateList(getContext(), obtainStyledAttributes, 16);
        materialButtonHelper.checkable = obtainStyledAttributes.getBoolean(5, false);
        materialButtonHelper.elevation = obtainStyledAttributes.getDimensionPixelSize(9, 0);
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        int paddingStart = ViewCompat.Api17Impl.getPaddingStart(this);
        int paddingTop = getPaddingTop();
        int paddingEnd = ViewCompat.Api17Impl.getPaddingEnd(this);
        int paddingBottom = getPaddingBottom();
        if (obtainStyledAttributes.hasValue(0)) {
            materialButtonHelper.backgroundOverwritten = true;
            setSupportBackgroundTintList(materialButtonHelper.backgroundTint);
            setSupportBackgroundTintMode(materialButtonHelper.backgroundTintMode);
        } else {
            MaterialShapeDrawable materialShapeDrawable = new MaterialShapeDrawable(materialButtonHelper.shapeAppearanceModel);
            materialShapeDrawable.initializeElevationOverlay(getContext());
            materialShapeDrawable.setTintList(materialButtonHelper.backgroundTint);
            PorterDuff.Mode mode = materialButtonHelper.backgroundTintMode;
            if (mode != null) {
                materialShapeDrawable.setTintMode(mode);
            }
            ColorStateList colorStateList = materialButtonHelper.strokeColor;
            materialShapeDrawable.drawableState.strokeWidth = materialButtonHelper.strokeWidth;
            materialShapeDrawable.invalidateSelf();
            MaterialShapeDrawable.MaterialShapeDrawableState materialShapeDrawableState = materialShapeDrawable.drawableState;
            if (materialShapeDrawableState.strokeColor != colorStateList) {
                materialShapeDrawableState.strokeColor = colorStateList;
                materialShapeDrawable.onStateChange(materialShapeDrawable.getState());
            }
            MaterialShapeDrawable materialShapeDrawable2 = new MaterialShapeDrawable(materialButtonHelper.shapeAppearanceModel);
            materialShapeDrawable2.setTint(0);
            float f2 = materialButtonHelper.strokeWidth;
            int color = materialButtonHelper.shouldDrawSurfaceColorStroke ? R$bool.getColor(this, R.attr.colorSurface) : 0;
            materialShapeDrawable2.drawableState.strokeWidth = f2;
            materialShapeDrawable2.invalidateSelf();
            ColorStateList valueOf = ColorStateList.valueOf(color);
            MaterialShapeDrawable.MaterialShapeDrawableState materialShapeDrawableState2 = materialShapeDrawable2.drawableState;
            if (materialShapeDrawableState2.strokeColor != valueOf) {
                materialShapeDrawableState2.strokeColor = valueOf;
                materialShapeDrawable2.onStateChange(materialShapeDrawable2.getState());
            }
            MaterialShapeDrawable materialShapeDrawable3 = new MaterialShapeDrawable(materialButtonHelper.shapeAppearanceModel);
            materialButtonHelper.maskDrawable = materialShapeDrawable3;
            materialShapeDrawable3.setTint(-1);
            ColorStateList colorStateList2 = materialButtonHelper.rippleColor;
            RippleDrawable rippleDrawable = new RippleDrawable(colorStateList2 == null ? ColorStateList.valueOf(0) : colorStateList2, new InsetDrawable((Drawable) new LayerDrawable(new Drawable[]{materialShapeDrawable2, materialShapeDrawable}), materialButtonHelper.insetLeft, materialButtonHelper.insetTop, materialButtonHelper.insetRight, materialButtonHelper.insetBottom), materialButtonHelper.maskDrawable);
            materialButtonHelper.rippleDrawable = rippleDrawable;
            setInternalBackground(rippleDrawable);
            MaterialShapeDrawable materialShapeDrawable4 = materialButtonHelper.getMaterialShapeDrawable(false);
            if (materialShapeDrawable4 != null) {
                materialShapeDrawable4.setElevation(materialButtonHelper.elevation);
            }
        }
        ViewCompat.Api17Impl.setPaddingRelative(this, paddingStart + materialButtonHelper.insetLeft, paddingTop + materialButtonHelper.insetTop, paddingEnd + materialButtonHelper.insetRight, paddingBottom + materialButtonHelper.insetBottom);
        obtainStyledAttributes.recycle();
        setCompoundDrawablePadding(this.iconPadding);
        updateIcon(this.icon != null ? true : z);
    }

    @Override // android.view.View
    public final ColorStateList getBackgroundTintList() {
        if (isUsingOriginalBackground()) {
            return this.materialButtonHelper.backgroundTint;
        }
        AppCompatBackgroundHelper appCompatBackgroundHelper = this.mBackgroundTintHelper;
        if (appCompatBackgroundHelper != null) {
            return appCompatBackgroundHelper.getSupportBackgroundTintList();
        }
        return null;
    }

    @Override // android.view.View
    public final PorterDuff.Mode getBackgroundTintMode() {
        if (isUsingOriginalBackground()) {
            return this.materialButtonHelper.backgroundTintMode;
        }
        AppCompatBackgroundHelper appCompatBackgroundHelper = this.mBackgroundTintHelper;
        if (appCompatBackgroundHelper != null) {
            return appCompatBackgroundHelper.getSupportBackgroundTintMode();
        }
        return null;
    }

    @Override // android.widget.TextView, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (isUsingOriginalBackground()) {
            R$layout.setParentAbsoluteElevation(this, this.materialButtonHelper.getMaterialShapeDrawable(false));
        }
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        boolean z;
        Class cls;
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        MaterialButtonHelper materialButtonHelper = this.materialButtonHelper;
        if (materialButtonHelper == null || !materialButtonHelper.checkable) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            cls = CompoundButton.class;
        } else {
            cls = Button.class;
        }
        accessibilityEvent.setClassName(cls.getName());
        accessibilityEvent.setChecked(isChecked());
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        boolean z;
        Class cls;
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        MaterialButtonHelper materialButtonHelper = this.materialButtonHelper;
        boolean z2 = true;
        if (materialButtonHelper == null || !materialButtonHelper.checkable) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            cls = CompoundButton.class;
        } else {
            cls = Button.class;
        }
        accessibilityNodeInfo.setClassName(cls.getName());
        MaterialButtonHelper materialButtonHelper2 = this.materialButtonHelper;
        if (materialButtonHelper2 == null || !materialButtonHelper2.checkable) {
            z2 = false;
        }
        accessibilityNodeInfo.setCheckable(z2);
        accessibilityNodeInfo.setChecked(isChecked());
        accessibilityNodeInfo.setClickable(isClickable());
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.widget.TextView, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        updateIconPosition(getMeasuredWidth(), getMeasuredHeight());
    }

    @Override // android.widget.TextView, android.view.View
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.checked = this.checked;
        return savedState;
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.widget.TextView
    public final void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        super.onTextChanged(charSequence, i, i2, i3);
        updateIconPosition(getMeasuredWidth(), getMeasuredHeight());
    }

    @Override // android.view.View
    public final boolean performClick() {
        toggle();
        return super.performClick();
    }

    @Override // android.view.View
    public final void refreshDrawableState() {
        super.refreshDrawableState();
        if (this.icon != null) {
            if (this.icon.setState(getDrawableState())) {
                invalidate();
            }
        }
    }

    @Override // android.view.View
    public final void setBackgroundColor(int i) {
        if (isUsingOriginalBackground()) {
            MaterialButtonHelper materialButtonHelper = this.materialButtonHelper;
            if (materialButtonHelper.getMaterialShapeDrawable(false) != null) {
                materialButtonHelper.getMaterialShapeDrawable(false).setTint(i);
                return;
            }
            return;
        }
        super.setBackgroundColor(i);
    }

    @Override // androidx.appcompat.widget.AppCompatButton, android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        if (!isUsingOriginalBackground()) {
            super.setBackgroundDrawable(drawable);
        } else if (drawable != getBackground()) {
            Log.w("MaterialButton", "MaterialButton manages its own background to control elevation, shape, color and states. Consider using backgroundTint, shapeAppearance and other attributes where available. A custom background will ignore these attributes and you should consider handling interaction states such as pressed, focused and disabled");
            MaterialButtonHelper materialButtonHelper = this.materialButtonHelper;
            materialButtonHelper.backgroundOverwritten = true;
            materialButtonHelper.materialButton.setSupportBackgroundTintList(materialButtonHelper.backgroundTint);
            materialButtonHelper.materialButton.setSupportBackgroundTintMode(materialButtonHelper.backgroundTintMode);
            super.setBackgroundDrawable(drawable);
        } else {
            getBackground().setState(drawable.getState());
        }
    }

    @Override // android.view.View
    public final void setElevation(float f) {
        super.setElevation(f);
        if (isUsingOriginalBackground()) {
            this.materialButtonHelper.getMaterialShapeDrawable(false).setElevation(f);
        }
    }

    @Override // com.google.android.material.shape.Shapeable
    public final void setShapeAppearanceModel(ShapeAppearanceModel shapeAppearanceModel) {
        if (isUsingOriginalBackground()) {
            this.materialButtonHelper.setShapeAppearanceModel(shapeAppearanceModel);
            return;
        }
        throw new IllegalStateException("Attempted to set ShapeAppearanceModel on a MaterialButton which has an overwritten background.");
    }

    public final void setSupportBackgroundTintList(ColorStateList colorStateList) {
        if (isUsingOriginalBackground()) {
            MaterialButtonHelper materialButtonHelper = this.materialButtonHelper;
            if (materialButtonHelper.backgroundTint != colorStateList) {
                materialButtonHelper.backgroundTint = colorStateList;
                if (materialButtonHelper.getMaterialShapeDrawable(false) != null) {
                    materialButtonHelper.getMaterialShapeDrawable(false).setTintList(materialButtonHelper.backgroundTint);
                    return;
                }
                return;
            }
            return;
        }
        AppCompatBackgroundHelper appCompatBackgroundHelper = this.mBackgroundTintHelper;
        if (appCompatBackgroundHelper != null) {
            appCompatBackgroundHelper.setSupportBackgroundTintList(colorStateList);
        }
    }

    public final void setSupportBackgroundTintMode(PorterDuff.Mode mode) {
        if (isUsingOriginalBackground()) {
            MaterialButtonHelper materialButtonHelper = this.materialButtonHelper;
            if (materialButtonHelper.backgroundTintMode != mode) {
                materialButtonHelper.backgroundTintMode = mode;
                if (materialButtonHelper.getMaterialShapeDrawable(false) != null && materialButtonHelper.backgroundTintMode != null) {
                    materialButtonHelper.getMaterialShapeDrawable(false).setTintMode(materialButtonHelper.backgroundTintMode);
                    return;
                }
                return;
            }
            return;
        }
        AppCompatBackgroundHelper appCompatBackgroundHelper = this.mBackgroundTintHelper;
        if (appCompatBackgroundHelper != null) {
            appCompatBackgroundHelper.setSupportBackgroundTintMode(mode);
        }
    }

    @Override // android.view.View
    public final void setTextAlignment(int i) {
        super.setTextAlignment(i);
        updateIconPosition(getMeasuredWidth(), getMeasuredHeight());
    }

    @Override // android.view.View
    public final void setBackground(Drawable drawable) {
        setBackgroundDrawable(drawable);
    }

    @Override // android.view.View
    public final void setBackgroundTintList(ColorStateList colorStateList) {
        setSupportBackgroundTintList(colorStateList);
    }

    @Override // android.view.View
    public final void setBackgroundTintMode(PorterDuff.Mode mode) {
        setSupportBackgroundTintMode(mode);
    }

    public final void setInternalBackground(RippleDrawable rippleDrawable) {
        super.setBackgroundDrawable(rippleDrawable);
    }

    @Override // android.widget.Checkable
    public final boolean isChecked() {
        return this.checked;
    }
}
