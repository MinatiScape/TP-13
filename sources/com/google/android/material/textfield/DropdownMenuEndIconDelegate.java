package com.google.android.material.textfield;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.text.Editable;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.LinearInterpolator;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.Spinner;
import androidx.appcompat.R$bool;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.animation.AnimationUtils;
import com.google.android.material.internal.CheckableImageButton;
import com.google.android.material.internal.TextWatcherAdapter;
import com.google.android.material.resources.MaterialAttributes;
import com.google.android.material.shape.AbsoluteCornerSize;
import com.google.android.material.shape.MaterialShapeDrawable;
import com.google.android.material.shape.ShapeAppearanceModel;
import com.google.android.material.textfield.TextInputLayout;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class DropdownMenuEndIconDelegate extends EndIconDelegate {
    public AccessibilityManager accessibilityManager;
    public ValueAnimator fadeInAnim;
    public ValueAnimator fadeOutAnim;
    public StateListDrawable filledPopupBackground;
    public MaterialShapeDrawable outlinedPopupBackground;
    public final AnonymousClass1 exposedDropdownEndIconTextWatcher = new TextWatcherAdapter() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.1
        @Override // com.google.android.material.internal.TextWatcherAdapter, android.text.TextWatcher
        public final void afterTextChanged(Editable editable) {
            boolean z;
            DropdownMenuEndIconDelegate dropdownMenuEndIconDelegate = DropdownMenuEndIconDelegate.this;
            EditText editText = dropdownMenuEndIconDelegate.textInputLayout.editText;
            if (editText instanceof AutoCompleteTextView) {
                final AutoCompleteTextView autoCompleteTextView = (AutoCompleteTextView) editText;
                if (dropdownMenuEndIconDelegate.accessibilityManager.isTouchExplorationEnabled()) {
                    if (autoCompleteTextView.getKeyListener() != null) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (z && !DropdownMenuEndIconDelegate.this.endIconView.hasFocus()) {
                        autoCompleteTextView.dismissDropDown();
                    }
                }
                autoCompleteTextView.post(new Runnable() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.1.1
                    @Override // java.lang.Runnable
                    public final void run() {
                        boolean isPopupShowing = autoCompleteTextView.isPopupShowing();
                        DropdownMenuEndIconDelegate.this.setEndIconChecked(isPopupShowing);
                        DropdownMenuEndIconDelegate.this.dropdownPopupDirty = isPopupShowing;
                    }
                });
                return;
            }
            throw new RuntimeException("EditText needs to be an AutoCompleteTextView if an Exposed Dropdown Menu is being used.");
        }
    };
    public final AnonymousClass2 onFocusChangeListener = new View.OnFocusChangeListener() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.2
        @Override // android.view.View.OnFocusChangeListener
        public final void onFocusChange(View view, boolean z) {
            DropdownMenuEndIconDelegate.this.textInputLayout.endIconView.setActivated(z);
            if (!z) {
                DropdownMenuEndIconDelegate.this.setEndIconChecked(false);
                DropdownMenuEndIconDelegate.this.dropdownPopupDirty = false;
            }
        }
    };
    public final AnonymousClass3 accessibilityDelegate = new TextInputLayout.AccessibilityDelegate(this.textInputLayout) { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.3
        @Override // com.google.android.material.textfield.TextInputLayout.AccessibilityDelegate, androidx.core.view.AccessibilityDelegateCompat
        public final void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
            boolean z;
            super.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat);
            if (DropdownMenuEndIconDelegate.this.textInputLayout.editText.getKeyListener() != null) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                accessibilityNodeInfoCompat.mInfo.setClassName(Spinner.class.getName());
            }
            if (accessibilityNodeInfoCompat.mInfo.isShowingHintText()) {
                accessibilityNodeInfoCompat.mInfo.setHintText(null);
            }
        }

        @Override // androidx.core.view.AccessibilityDelegateCompat
        public final void onPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
            boolean z;
            super.onPopulateAccessibilityEvent(view, accessibilityEvent);
            EditText editText = DropdownMenuEndIconDelegate.this.textInputLayout.editText;
            if (editText instanceof AutoCompleteTextView) {
                AutoCompleteTextView autoCompleteTextView = (AutoCompleteTextView) editText;
                if (accessibilityEvent.getEventType() == 1 && DropdownMenuEndIconDelegate.this.accessibilityManager.isEnabled()) {
                    if (DropdownMenuEndIconDelegate.this.textInputLayout.editText.getKeyListener() != null) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (!z) {
                        DropdownMenuEndIconDelegate.access$500(DropdownMenuEndIconDelegate.this, autoCompleteTextView);
                        DropdownMenuEndIconDelegate dropdownMenuEndIconDelegate = DropdownMenuEndIconDelegate.this;
                        dropdownMenuEndIconDelegate.dropdownPopupDirty = true;
                        dropdownMenuEndIconDelegate.dropdownPopupActivatedAt = System.currentTimeMillis();
                        return;
                    }
                    return;
                }
                return;
            }
            throw new RuntimeException("EditText needs to be an AutoCompleteTextView if an Exposed Dropdown Menu is being used.");
        }
    };
    public final AnonymousClass4 dropdownMenuOnEditTextAttachedListener = new AnonymousClass4();
    @SuppressLint({"ClickableViewAccessibility"})
    public final AnonymousClass5 endIconChangedListener = new TextInputLayout.OnEndIconChangedListener() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.5
        @Override // com.google.android.material.textfield.TextInputLayout.OnEndIconChangedListener
        public final void onEndIconChanged(TextInputLayout textInputLayout, int i) {
            final AutoCompleteTextView autoCompleteTextView = (AutoCompleteTextView) textInputLayout.editText;
            if (autoCompleteTextView != null && i == 3) {
                autoCompleteTextView.post(new Runnable() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.5.1
                    @Override // java.lang.Runnable
                    public final void run() {
                        autoCompleteTextView.removeTextChangedListener(DropdownMenuEndIconDelegate.this.exposedDropdownEndIconTextWatcher);
                    }
                });
                if (autoCompleteTextView.getOnFocusChangeListener() == DropdownMenuEndIconDelegate.this.onFocusChangeListener) {
                    autoCompleteTextView.setOnFocusChangeListener(null);
                }
                autoCompleteTextView.setOnTouchListener(null);
                autoCompleteTextView.setOnDismissListener(null);
            }
        }
    };
    public boolean dropdownPopupDirty = false;
    public boolean isEndIconChecked = false;
    public long dropdownPopupActivatedAt = RecyclerView.FOREVER_NS;

    /* renamed from: com.google.android.material.textfield.DropdownMenuEndIconDelegate$4  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass4 implements TextInputLayout.OnEditTextAttachedListener {
        public AnonymousClass4() {
        }

        @Override // com.google.android.material.textfield.TextInputLayout.OnEditTextAttachedListener
        public final void onEditTextAttached(TextInputLayout textInputLayout) {
            EditText editText = textInputLayout.editText;
            if (editText instanceof AutoCompleteTextView) {
                final AutoCompleteTextView autoCompleteTextView = (AutoCompleteTextView) editText;
                DropdownMenuEndIconDelegate dropdownMenuEndIconDelegate = DropdownMenuEndIconDelegate.this;
                int i = dropdownMenuEndIconDelegate.textInputLayout.boxBackgroundMode;
                if (i == 2) {
                    autoCompleteTextView.setDropDownBackgroundDrawable(dropdownMenuEndIconDelegate.outlinedPopupBackground);
                } else if (i == 1) {
                    autoCompleteTextView.setDropDownBackgroundDrawable(dropdownMenuEndIconDelegate.filledPopupBackground);
                }
                DropdownMenuEndIconDelegate.this.addRippleEffect(autoCompleteTextView);
                final DropdownMenuEndIconDelegate dropdownMenuEndIconDelegate2 = DropdownMenuEndIconDelegate.this;
                dropdownMenuEndIconDelegate2.getClass();
                autoCompleteTextView.setOnTouchListener(new View.OnTouchListener() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.7
                    @Override // android.view.View.OnTouchListener
                    public final boolean onTouch(View view, MotionEvent motionEvent) {
                        boolean z;
                        if (motionEvent.getAction() == 1) {
                            DropdownMenuEndIconDelegate dropdownMenuEndIconDelegate3 = DropdownMenuEndIconDelegate.this;
                            dropdownMenuEndIconDelegate3.getClass();
                            long currentTimeMillis = System.currentTimeMillis() - dropdownMenuEndIconDelegate3.dropdownPopupActivatedAt;
                            if (currentTimeMillis < 0 || currentTimeMillis > 300) {
                                z = true;
                            } else {
                                z = false;
                            }
                            if (z) {
                                DropdownMenuEndIconDelegate.this.dropdownPopupDirty = false;
                            }
                            DropdownMenuEndIconDelegate.access$500(DropdownMenuEndIconDelegate.this, autoCompleteTextView);
                            DropdownMenuEndIconDelegate dropdownMenuEndIconDelegate4 = DropdownMenuEndIconDelegate.this;
                            dropdownMenuEndIconDelegate4.dropdownPopupDirty = true;
                            dropdownMenuEndIconDelegate4.dropdownPopupActivatedAt = System.currentTimeMillis();
                        }
                        return false;
                    }
                });
                autoCompleteTextView.setOnFocusChangeListener(dropdownMenuEndIconDelegate2.onFocusChangeListener);
                autoCompleteTextView.setOnDismissListener(new AutoCompleteTextView.OnDismissListener() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.8
                    @Override // android.widget.AutoCompleteTextView.OnDismissListener
                    public final void onDismiss() {
                        DropdownMenuEndIconDelegate dropdownMenuEndIconDelegate3 = DropdownMenuEndIconDelegate.this;
                        dropdownMenuEndIconDelegate3.dropdownPopupDirty = true;
                        dropdownMenuEndIconDelegate3.dropdownPopupActivatedAt = System.currentTimeMillis();
                        DropdownMenuEndIconDelegate.this.setEndIconChecked(false);
                    }
                });
                boolean z = false;
                autoCompleteTextView.setThreshold(0);
                autoCompleteTextView.removeTextChangedListener(DropdownMenuEndIconDelegate.this.exposedDropdownEndIconTextWatcher);
                autoCompleteTextView.addTextChangedListener(DropdownMenuEndIconDelegate.this.exposedDropdownEndIconTextWatcher);
                CheckableImageButton checkableImageButton = textInputLayout.endIconView;
                if (!checkableImageButton.checkable) {
                    checkableImageButton.checkable = true;
                    checkableImageButton.sendAccessibilityEvent(0);
                }
                textInputLayout.errorIconView.setImageDrawable(null);
                textInputLayout.updateErrorIconVisibility();
                textInputLayout.applyIconTint(textInputLayout.errorIconView, textInputLayout.errorIconTintList, textInputLayout.errorIconTintMode);
                if (autoCompleteTextView.getKeyListener() != null) {
                    z = true;
                }
                if (!z && DropdownMenuEndIconDelegate.this.accessibilityManager.isTouchExplorationEnabled()) {
                    CheckableImageButton checkableImageButton2 = DropdownMenuEndIconDelegate.this.endIconView;
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    ViewCompat.Api16Impl.setImportantForAccessibility(checkableImageButton2, 2);
                }
                AnonymousClass3 r7 = DropdownMenuEndIconDelegate.this.accessibilityDelegate;
                EditText editText2 = textInputLayout.editText;
                if (editText2 != null) {
                    ViewCompat.setAccessibilityDelegate(editText2, r7);
                }
                textInputLayout.setEndIconVisible(true);
                return;
            }
            throw new RuntimeException("EditText needs to be an AutoCompleteTextView if an Exposed Dropdown Menu is being used.");
        }
    }

    @Override // com.google.android.material.textfield.EndIconDelegate
    public final boolean isBoxBackgroundModeSupported(int i) {
        return i != 0;
    }

    public static void access$500(DropdownMenuEndIconDelegate dropdownMenuEndIconDelegate, AutoCompleteTextView autoCompleteTextView) {
        boolean z;
        if (autoCompleteTextView == null) {
            dropdownMenuEndIconDelegate.getClass();
            return;
        }
        dropdownMenuEndIconDelegate.getClass();
        long currentTimeMillis = System.currentTimeMillis() - dropdownMenuEndIconDelegate.dropdownPopupActivatedAt;
        if (currentTimeMillis < 0 || currentTimeMillis > 300) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            dropdownMenuEndIconDelegate.dropdownPopupDirty = false;
        }
        if (!dropdownMenuEndIconDelegate.dropdownPopupDirty) {
            dropdownMenuEndIconDelegate.setEndIconChecked(!dropdownMenuEndIconDelegate.isEndIconChecked);
            if (dropdownMenuEndIconDelegate.isEndIconChecked) {
                autoCompleteTextView.requestFocus();
                autoCompleteTextView.showDropDown();
                return;
            }
            autoCompleteTextView.dismissDropDown();
            return;
        }
        dropdownMenuEndIconDelegate.dropdownPopupDirty = false;
    }

    public final MaterialShapeDrawable getPopUpMaterialShapeDrawable(float f, float f2, float f3, int i) {
        ShapeAppearanceModel.Builder builder = new ShapeAppearanceModel.Builder();
        builder.topLeftCornerSize = new AbsoluteCornerSize(f);
        builder.topRightCornerSize = new AbsoluteCornerSize(f);
        builder.bottomLeftCornerSize = new AbsoluteCornerSize(f2);
        builder.bottomRightCornerSize = new AbsoluteCornerSize(f2);
        ShapeAppearanceModel shapeAppearanceModel = new ShapeAppearanceModel(builder);
        Context context = this.context;
        Paint paint = MaterialShapeDrawable.clearPaint;
        int resolveOrThrow = MaterialAttributes.resolveOrThrow(context, R.attr.colorSurface, "MaterialShapeDrawable");
        MaterialShapeDrawable materialShapeDrawable = new MaterialShapeDrawable();
        materialShapeDrawable.initializeElevationOverlay(context);
        materialShapeDrawable.setFillColor(ColorStateList.valueOf(resolveOrThrow));
        materialShapeDrawable.setElevation(f3);
        materialShapeDrawable.setShapeAppearanceModel(shapeAppearanceModel);
        MaterialShapeDrawable.MaterialShapeDrawableState materialShapeDrawableState = materialShapeDrawable.drawableState;
        if (materialShapeDrawableState.padding == null) {
            materialShapeDrawableState.padding = new Rect();
        }
        materialShapeDrawable.drawableState.padding.set(0, i, 0, i);
        materialShapeDrawable.invalidateSelf();
        return materialShapeDrawable;
    }

    @Override // com.google.android.material.textfield.EndIconDelegate
    public final void initialize() {
        float dimensionPixelOffset = this.context.getResources().getDimensionPixelOffset(R.dimen.mtrl_shape_corner_size_small_component);
        float dimensionPixelOffset2 = this.context.getResources().getDimensionPixelOffset(R.dimen.mtrl_exposed_dropdown_menu_popup_elevation);
        int dimensionPixelOffset3 = this.context.getResources().getDimensionPixelOffset(R.dimen.mtrl_exposed_dropdown_menu_popup_vertical_padding);
        MaterialShapeDrawable popUpMaterialShapeDrawable = getPopUpMaterialShapeDrawable(dimensionPixelOffset, dimensionPixelOffset, dimensionPixelOffset2, dimensionPixelOffset3);
        MaterialShapeDrawable popUpMaterialShapeDrawable2 = getPopUpMaterialShapeDrawable(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, dimensionPixelOffset, dimensionPixelOffset2, dimensionPixelOffset3);
        this.outlinedPopupBackground = popUpMaterialShapeDrawable;
        StateListDrawable stateListDrawable = new StateListDrawable();
        this.filledPopupBackground = stateListDrawable;
        stateListDrawable.addState(new int[]{16842922}, popUpMaterialShapeDrawable);
        this.filledPopupBackground.addState(new int[0], popUpMaterialShapeDrawable2);
        int i = this.customEndIcon;
        if (i == 0) {
            i = R.drawable.mtrl_dropdown_arrow;
        }
        this.textInputLayout.setEndIconDrawable(i);
        TextInputLayout textInputLayout = this.textInputLayout;
        textInputLayout.setEndIconContentDescription(textInputLayout.getResources().getText(R.string.exposed_dropdown_menu_content_description));
        TextInputLayout textInputLayout2 = this.textInputLayout;
        View.OnClickListener onClickListener = new View.OnClickListener() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.6
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                DropdownMenuEndIconDelegate dropdownMenuEndIconDelegate = DropdownMenuEndIconDelegate.this;
                DropdownMenuEndIconDelegate.access$500(dropdownMenuEndIconDelegate, (AutoCompleteTextView) dropdownMenuEndIconDelegate.textInputLayout.editText);
            }
        };
        CheckableImageButton checkableImageButton = textInputLayout2.endIconView;
        View.OnLongClickListener onLongClickListener = textInputLayout2.endIconOnLongClickListener;
        checkableImageButton.setOnClickListener(onClickListener);
        TextInputLayout.setIconClickable(checkableImageButton, onLongClickListener);
        TextInputLayout textInputLayout3 = this.textInputLayout;
        AnonymousClass4 r1 = this.dropdownMenuOnEditTextAttachedListener;
        textInputLayout3.editTextAttachedListeners.add(r1);
        if (textInputLayout3.editText != null) {
            r1.onEditTextAttached(textInputLayout3);
        }
        this.textInputLayout.endIconChangedListeners.add(this.endIconChangedListener);
        ValueAnimator ofFloat = ValueAnimator.ofFloat(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
        LinearInterpolator linearInterpolator = AnimationUtils.LINEAR_INTERPOLATOR;
        ofFloat.setInterpolator(linearInterpolator);
        ofFloat.setDuration(67);
        ofFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.10
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                DropdownMenuEndIconDelegate.this.endIconView.setAlpha(((Float) valueAnimator.getAnimatedValue()).floatValue());
            }
        });
        this.fadeInAnim = ofFloat;
        ValueAnimator ofFloat2 = ValueAnimator.ofFloat(1.0f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        ofFloat2.setInterpolator(linearInterpolator);
        ofFloat2.setDuration(50);
        ofFloat2.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.10
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                DropdownMenuEndIconDelegate.this.endIconView.setAlpha(((Float) valueAnimator.getAnimatedValue()).floatValue());
            }
        });
        this.fadeOutAnim = ofFloat2;
        ofFloat2.addListener(new AnimatorListenerAdapter() { // from class: com.google.android.material.textfield.DropdownMenuEndIconDelegate.9
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public final void onAnimationEnd(Animator animator) {
                DropdownMenuEndIconDelegate dropdownMenuEndIconDelegate = DropdownMenuEndIconDelegate.this;
                dropdownMenuEndIconDelegate.endIconView.setChecked(dropdownMenuEndIconDelegate.isEndIconChecked);
                DropdownMenuEndIconDelegate.this.fadeInAnim.start();
            }
        });
        this.accessibilityManager = (AccessibilityManager) this.context.getSystemService("accessibility");
    }

    public final void setEndIconChecked(boolean z) {
        if (this.isEndIconChecked != z) {
            this.isEndIconChecked = z;
            this.fadeInAnim.cancel();
            this.fadeOutAnim.start();
        }
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [com.google.android.material.textfield.DropdownMenuEndIconDelegate$1] */
    /* JADX WARN: Type inference failed for: r1v2, types: [com.google.android.material.textfield.DropdownMenuEndIconDelegate$2] */
    /* JADX WARN: Type inference failed for: r1v3, types: [com.google.android.material.textfield.DropdownMenuEndIconDelegate$3] */
    /* JADX WARN: Type inference failed for: r1v5, types: [com.google.android.material.textfield.DropdownMenuEndIconDelegate$5] */
    public DropdownMenuEndIconDelegate(TextInputLayout textInputLayout, int i) {
        super(textInputLayout, i);
    }

    public final void addRippleEffect(AutoCompleteTextView autoCompleteTextView) {
        boolean z;
        if (autoCompleteTextView.getKeyListener() != null) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            TextInputLayout textInputLayout = this.textInputLayout;
            int i = textInputLayout.boxBackgroundMode;
            if (i == 1 || i == 2) {
                MaterialShapeDrawable materialShapeDrawable = textInputLayout.boxBackground;
                int color = R$bool.getColor(autoCompleteTextView, R.attr.colorControlHighlight);
                int[][] iArr = {new int[]{16842919}, new int[0]};
                if (i == 2) {
                    int color2 = R$bool.getColor(autoCompleteTextView, R.attr.colorSurface);
                    MaterialShapeDrawable materialShapeDrawable2 = new MaterialShapeDrawable(materialShapeDrawable.drawableState.shapeAppearanceModel);
                    int layer = R$bool.layer(color, color2, 0.1f);
                    materialShapeDrawable2.setFillColor(new ColorStateList(iArr, new int[]{layer, 0}));
                    materialShapeDrawable2.setTint(color2);
                    ColorStateList colorStateList = new ColorStateList(iArr, new int[]{layer, color2});
                    MaterialShapeDrawable materialShapeDrawable3 = new MaterialShapeDrawable(materialShapeDrawable.drawableState.shapeAppearanceModel);
                    materialShapeDrawable3.setTint(-1);
                    LayerDrawable layerDrawable = new LayerDrawable(new Drawable[]{new RippleDrawable(colorStateList, materialShapeDrawable2, materialShapeDrawable3), materialShapeDrawable});
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    ViewCompat.Api16Impl.setBackground(autoCompleteTextView, layerDrawable);
                } else if (i == 1) {
                    int i2 = this.textInputLayout.boxBackgroundColor;
                    RippleDrawable rippleDrawable = new RippleDrawable(new ColorStateList(iArr, new int[]{R$bool.layer(color, i2, 0.1f), i2}), materialShapeDrawable, materialShapeDrawable);
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                    ViewCompat.Api16Impl.setBackground(autoCompleteTextView, rippleDrawable);
                }
            } else {
                throw new IllegalStateException();
            }
        }
    }
}
