package com.google.android.material.textfield;

import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.Editable;
import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStructure;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.content.res.AppCompatResources;
import androidx.appcompat.widget.AppCompatDrawableManager;
import androidx.appcompat.widget.AppCompatTextView;
import androidx.appcompat.widget.DrawableUtils;
import androidx.appcompat.widget.TintTypedArray;
import androidx.core.content.ContextCompat;
import androidx.core.text.BidiFormatter;
import androidx.core.text.TextDirectionHeuristicCompat;
import androidx.core.text.TextDirectionHeuristicsCompat;
import androidx.core.text.TextUtilsCompat;
import androidx.core.view.AccessibilityDelegateCompat;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.customview.view.AbsSavedState;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.R$styleable;
import com.google.android.material.animation.AnimationUtils;
import com.google.android.material.internal.CheckableImageButton;
import com.google.android.material.internal.CollapsingTextHelper;
import com.google.android.material.internal.DescendantOffsetUtils;
import com.google.android.material.internal.ThemeEnforcement;
import com.google.android.material.internal.ViewUtils;
import com.google.android.material.resources.CancelableFontCallback;
import com.google.android.material.resources.MaterialResources;
import com.google.android.material.shape.MaterialShapeDrawable;
import com.google.android.material.shape.ShapeAppearanceModel;
import com.google.android.material.theme.overlay.MaterialThemeOverlay;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Objects;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class TextInputLayout extends LinearLayout {
    public ValueAnimator animator;
    public MaterialShapeDrawable boxBackground;
    public int boxBackgroundColor;
    public int boxBackgroundMode;
    public int boxCollapsedPaddingTopPx;
    public int boxLabelCutoutHeight;
    public final int boxLabelCutoutPaddingPx;
    public int boxStrokeColor;
    public int boxStrokeWidthDefaultPx;
    public int boxStrokeWidthFocusedPx;
    public int boxStrokeWidthPx;
    public MaterialShapeDrawable boxUnderline;
    public final CollapsingTextHelper collapsingTextHelper;
    public boolean counterEnabled;
    public int counterMaxLength;
    public int counterOverflowTextAppearance;
    public ColorStateList counterOverflowTextColor;
    public boolean counterOverflowed;
    public int counterTextAppearance;
    public ColorStateList counterTextColor;
    public TextView counterView;
    public int defaultFilledBackgroundColor;
    public ColorStateList defaultHintTextColor;
    public int defaultStrokeColor;
    public int disabledColor;
    public int disabledFilledBackgroundColor;
    public EditText editText;
    public final LinkedHashSet<OnEditTextAttachedListener> editTextAttachedListeners;
    public Drawable endDummyDrawable;
    public int endDummyDrawableWidth;
    public final LinkedHashSet<OnEndIconChangedListener> endIconChangedListeners;
    public final SparseArray<EndIconDelegate> endIconDelegates;
    public final FrameLayout endIconFrame;
    public int endIconMode;
    public View.OnLongClickListener endIconOnLongClickListener;
    public ColorStateList endIconTintList;
    public PorterDuff.Mode endIconTintMode;
    public final CheckableImageButton endIconView;
    public final LinearLayout endLayout;
    public ColorStateList errorIconTintList;
    public final CheckableImageButton errorIconView;
    public boolean expandedHintEnabled;
    public int focusedFilledBackgroundColor;
    public int focusedStrokeColor;
    public ColorStateList focusedTextColor;
    public boolean hasEndIconTintList;
    public boolean hasEndIconTintMode;
    public boolean hasStartIconTintList;
    public boolean hasStartIconTintMode;
    public CharSequence hint;
    public boolean hintAnimationEnabled;
    public boolean hintEnabled;
    public boolean hintExpanded;
    public int hoveredFilledBackgroundColor;
    public int hoveredStrokeColor;
    public boolean inDrawableStateChanged;
    public final IndicatorViewController indicatorViewController;
    public final FrameLayout inputFrame;
    public boolean isProvidingHint;
    public int maxWidth;
    public int minWidth;
    public Drawable originalEditTextEndDrawable;
    public CharSequence originalHint;
    public boolean placeholderEnabled;
    public CharSequence placeholderText;
    public int placeholderTextAppearance;
    public ColorStateList placeholderTextColor;
    public TextView placeholderTextView;
    public CharSequence prefixText;
    public final TextView prefixTextView;
    public boolean restoringSavedState;
    public ShapeAppearanceModel shapeAppearanceModel;
    public Drawable startDummyDrawable;
    public int startDummyDrawableWidth;
    public View.OnLongClickListener startIconOnLongClickListener;
    public ColorStateList startIconTintList;
    public PorterDuff.Mode startIconTintMode;
    public final CheckableImageButton startIconView;
    public final LinearLayout startLayout;
    public ColorStateList strokeErrorColor;
    public CharSequence suffixText;
    public final TextView suffixTextView;
    public final Rect tmpBoundsRect;
    public final Rect tmpRect;
    public final RectF tmpRectF;

    /* loaded from: classes.dex */
    public static class AccessibilityDelegate extends AccessibilityDelegateCompat {
        public final TextInputLayout layout;

        public AccessibilityDelegate(TextInputLayout textInputLayout) {
            this.layout = textInputLayout;
        }

        @Override // androidx.core.view.AccessibilityDelegateCompat
        public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
            TextView textView;
            this.mOriginalDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat.mInfo);
            EditText editText = this.layout.editText;
            CharSequence charSequence = null;
            Editable text = editText != null ? editText.getText() : null;
            CharSequence hint = this.layout.getHint();
            CharSequence error = this.layout.getError();
            TextInputLayout textInputLayout = this.layout;
            CharSequence charSequence2 = textInputLayout.placeholderEnabled ? textInputLayout.placeholderText : null;
            int i = textInputLayout.counterMaxLength;
            if (textInputLayout.counterEnabled && textInputLayout.counterOverflowed && (textView = textInputLayout.counterView) != null) {
                charSequence = textView.getContentDescription();
            }
            boolean z = !TextUtils.isEmpty(text);
            boolean z2 = !TextUtils.isEmpty(hint);
            boolean z3 = !this.layout.isHintExpanded();
            boolean z4 = !TextUtils.isEmpty(error);
            boolean z5 = z4 || !TextUtils.isEmpty(charSequence);
            String charSequence3 = z2 ? hint.toString() : "";
            if (z) {
                accessibilityNodeInfoCompat.mInfo.setText(text);
            } else if (!TextUtils.isEmpty(charSequence3)) {
                accessibilityNodeInfoCompat.mInfo.setText(charSequence3);
                if (z3 && charSequence2 != null) {
                    accessibilityNodeInfoCompat.mInfo.setText(charSequence3 + ", " + ((Object) charSequence2));
                }
            } else if (charSequence2 != null) {
                accessibilityNodeInfoCompat.mInfo.setText(charSequence2);
            }
            if (!TextUtils.isEmpty(charSequence3)) {
                accessibilityNodeInfoCompat.mInfo.setHintText(charSequence3);
                accessibilityNodeInfoCompat.mInfo.setShowingHintText(!z);
            }
            if (text == null || text.length() != i) {
                i = -1;
            }
            accessibilityNodeInfoCompat.mInfo.setMaxTextLength(i);
            if (z5) {
                if (!z4) {
                    error = charSequence;
                }
                accessibilityNodeInfoCompat.mInfo.setError(error);
            }
            if (editText != null) {
                editText.setLabelFor(R.id.textinput_helper_text);
            }
        }
    }

    /* loaded from: classes.dex */
    public interface OnEditTextAttachedListener {
        void onEditTextAttached(TextInputLayout textInputLayout);
    }

    /* loaded from: classes.dex */
    public interface OnEndIconChangedListener {
        void onEndIconChanged(TextInputLayout textInputLayout, int i);
    }

    /* loaded from: classes.dex */
    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SavedState>() { // from class: com.google.android.material.textfield.TextInputLayout.SavedState.1
            @Override // android.os.Parcelable.ClassLoaderCreator
            public SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return new SavedState(parcel, classLoader);
            }

            @Override // android.os.Parcelable.Creator
            public Object[] newArray(int i) {
                return new SavedState[i];
            }

            @Override // android.os.Parcelable.Creator
            public Object createFromParcel(Parcel parcel) {
                return new SavedState(parcel, null);
            }
        };
        public CharSequence error;
        public CharSequence helperText;
        public CharSequence hintText;
        public boolean isEndIconChecked;
        public CharSequence placeholderText;

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("TextInputLayout.SavedState{");
            m.append(Integer.toHexString(System.identityHashCode(this)));
            m.append(" error=");
            m.append((Object) this.error);
            m.append(" hint=");
            m.append((Object) this.hintText);
            m.append(" helperText=");
            m.append((Object) this.helperText);
            m.append(" placeholderText=");
            m.append((Object) this.placeholderText);
            m.append("}");
            return m.toString();
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mSuperState, i);
            TextUtils.writeToParcel(this.error, parcel, i);
            parcel.writeInt(this.isEndIconChecked ? 1 : 0);
            TextUtils.writeToParcel(this.hintText, parcel, i);
            TextUtils.writeToParcel(this.helperText, parcel, i);
            TextUtils.writeToParcel(this.placeholderText, parcel, i);
        }

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.error = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            this.isEndIconChecked = parcel.readInt() != 1 ? false : true;
            this.hintText = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            this.helperText = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            this.placeholderText = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        }
    }

    public TextInputLayout(Context context) {
        this(context, null);
    }

    public static void recursiveSetEnabled(ViewGroup viewGroup, boolean z) {
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = viewGroup.getChildAt(i);
            childAt.setEnabled(z);
            if (childAt instanceof ViewGroup) {
                recursiveSetEnabled((ViewGroup) childAt, z);
            }
        }
    }

    public static void setIconClickable(CheckableImageButton checkableImageButton, View.OnLongClickListener onLongClickListener) {
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        boolean hasOnClickListeners = checkableImageButton.hasOnClickListeners();
        boolean z = false;
        int i = 1;
        boolean z2 = onLongClickListener != null;
        if (hasOnClickListeners || z2) {
            z = true;
        }
        checkableImageButton.setFocusable(z);
        checkableImageButton.setClickable(hasOnClickListeners);
        checkableImageButton.pressable = hasOnClickListeners;
        checkableImageButton.setLongClickable(z2);
        if (!z) {
            i = 2;
        }
        checkableImageButton.setImportantForAccessibility(i);
    }

    public void addOnEditTextAttachedListener(OnEditTextAttachedListener onEditTextAttachedListener) {
        this.editTextAttachedListeners.add(onEditTextAttachedListener);
        if (this.editText != null) {
            onEditTextAttachedListener.onEditTextAttached(this);
        }
    }

    @Override // android.view.ViewGroup
    public void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        boolean z;
        boolean z2;
        if (view instanceof EditText) {
            FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(layoutParams);
            layoutParams2.gravity = (layoutParams2.gravity & (-113)) | 16;
            this.inputFrame.addView(view, layoutParams2);
            this.inputFrame.setLayoutParams(layoutParams);
            updateInputLayoutMargins();
            EditText editText = (EditText) view;
            if (this.editText == null) {
                if (this.endIconMode != 3 && !(editText instanceof TextInputEditText)) {
                    Log.i("TextInputLayout", "EditText added is not a TextInputEditText. Please switch to using that class instead.");
                }
                this.editText = editText;
                int i2 = this.minWidth;
                this.minWidth = i2;
                if (!(editText == null || i2 == -1)) {
                    editText.setMinWidth(i2);
                }
                int i3 = this.maxWidth;
                this.maxWidth = i3;
                EditText editText2 = this.editText;
                if (!(editText2 == null || i3 == -1)) {
                    editText2.setMaxWidth(i3);
                }
                onApplyBoxBackgroundMode();
                AccessibilityDelegate accessibilityDelegate = new AccessibilityDelegate(this);
                EditText editText3 = this.editText;
                if (editText3 != null) {
                    ViewCompat.setAccessibilityDelegate(editText3, accessibilityDelegate);
                }
                CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
                Typeface typeface = this.editText.getTypeface();
                CancelableFontCallback cancelableFontCallback = collapsingTextHelper.collapsedFontCallback;
                if (cancelableFontCallback != null) {
                    cancelableFontCallback.cancelled = true;
                }
                if (collapsingTextHelper.collapsedTypeface != typeface) {
                    collapsingTextHelper.collapsedTypeface = typeface;
                    z = true;
                } else {
                    z = false;
                }
                CancelableFontCallback cancelableFontCallback2 = collapsingTextHelper.expandedFontCallback;
                if (cancelableFontCallback2 != null) {
                    cancelableFontCallback2.cancelled = true;
                }
                if (collapsingTextHelper.expandedTypeface != typeface) {
                    collapsingTextHelper.expandedTypeface = typeface;
                    z2 = true;
                } else {
                    z2 = false;
                }
                if (z || z2) {
                    collapsingTextHelper.recalculate(false);
                }
                CollapsingTextHelper collapsingTextHelper2 = this.collapsingTextHelper;
                float textSize = this.editText.getTextSize();
                if (collapsingTextHelper2.expandedTextSize != textSize) {
                    collapsingTextHelper2.expandedTextSize = textSize;
                    collapsingTextHelper2.recalculate(false);
                }
                int gravity = this.editText.getGravity();
                this.collapsingTextHelper.setCollapsedTextGravity((gravity & (-113)) | 48);
                this.collapsingTextHelper.setExpandedTextGravity(gravity);
                this.editText.addTextChangedListener(new TextWatcher() { // from class: com.google.android.material.textfield.TextInputLayout.1
                    @Override // android.text.TextWatcher
                    public void afterTextChanged(Editable editable) {
                        TextInputLayout textInputLayout = TextInputLayout.this;
                        textInputLayout.updateLabelState(!textInputLayout.restoringSavedState, false);
                        TextInputLayout textInputLayout2 = TextInputLayout.this;
                        if (textInputLayout2.counterEnabled) {
                            textInputLayout2.updateCounter(editable.length());
                        }
                        TextInputLayout textInputLayout3 = TextInputLayout.this;
                        if (textInputLayout3.placeholderEnabled) {
                            textInputLayout3.updatePlaceholderText(editable.length());
                        }
                    }

                    @Override // android.text.TextWatcher
                    public void beforeTextChanged(CharSequence charSequence, int i4, int i5, int i6) {
                    }

                    @Override // android.text.TextWatcher
                    public void onTextChanged(CharSequence charSequence, int i4, int i5, int i6) {
                    }
                });
                if (this.defaultHintTextColor == null) {
                    this.defaultHintTextColor = this.editText.getHintTextColors();
                }
                if (this.hintEnabled) {
                    if (TextUtils.isEmpty(this.hint)) {
                        CharSequence hint = this.editText.getHint();
                        this.originalHint = hint;
                        setHint(hint);
                        this.editText.setHint((CharSequence) null);
                    }
                    this.isProvidingHint = true;
                }
                if (this.counterView != null) {
                    updateCounter(this.editText.getText().length());
                }
                updateEditTextBackground();
                this.indicatorViewController.adjustIndicatorPadding();
                this.startLayout.bringToFront();
                this.endLayout.bringToFront();
                this.endIconFrame.bringToFront();
                this.errorIconView.bringToFront();
                Iterator<OnEditTextAttachedListener> it = this.editTextAttachedListeners.iterator();
                while (it.hasNext()) {
                    it.next().onEditTextAttached(this);
                }
                updatePrefixTextViewPadding();
                updateSuffixTextViewPadding();
                if (!isEnabled()) {
                    editText.setEnabled(false);
                }
                updateLabelState(false, true);
                return;
            }
            throw new IllegalArgumentException("We already have an EditText, can only have one");
        }
        super.addView(view, i, layoutParams);
    }

    public void animateToExpansionFraction(float f) {
        if (this.collapsingTextHelper.expandedFraction != f) {
            if (this.animator == null) {
                ValueAnimator valueAnimator = new ValueAnimator();
                this.animator = valueAnimator;
                valueAnimator.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
                this.animator.setDuration(167L);
                this.animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.google.android.material.textfield.TextInputLayout.4
                    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                    public void onAnimationUpdate(ValueAnimator valueAnimator2) {
                        TextInputLayout.this.collapsingTextHelper.setExpansionFraction(((Float) valueAnimator2.getAnimatedValue()).floatValue());
                    }
                });
            }
            this.animator.setFloatValues(this.collapsingTextHelper.expandedFraction, f);
            this.animator.start();
        }
    }

    public final void applyEndIconTint() {
        applyIconTint(this.endIconView, this.hasEndIconTintList, this.endIconTintList, this.hasEndIconTintMode, this.endIconTintMode);
    }

    public final void applyIconTint(CheckableImageButton checkableImageButton, boolean z, ColorStateList colorStateList, boolean z2, PorterDuff.Mode mode) {
        Drawable drawable = checkableImageButton.getDrawable();
        if (drawable != null && (z || z2)) {
            drawable = drawable.mutate();
            if (z) {
                drawable.setTintList(colorStateList);
            }
            if (z2) {
                drawable.setTintMode(mode);
            }
        }
        if (checkableImageButton.getDrawable() != drawable) {
            checkableImageButton.setImageDrawable(drawable);
        }
    }

    public final int calculateLabelMarginTop() {
        float collapsedTextHeight;
        if (!this.hintEnabled) {
            return 0;
        }
        int i = this.boxBackgroundMode;
        if (i == 0 || i == 1) {
            collapsedTextHeight = this.collapsingTextHelper.getCollapsedTextHeight();
        } else if (i != 2) {
            return 0;
        } else {
            collapsedTextHeight = this.collapsingTextHelper.getCollapsedTextHeight() / 2.0f;
        }
        return (int) collapsedTextHeight;
    }

    public final boolean cutoutEnabled() {
        return this.hintEnabled && !TextUtils.isEmpty(this.hint) && (this.boxBackground instanceof CutoutDrawable);
    }

    public boolean cutoutIsOpen() {
        return cutoutEnabled() && (((CutoutDrawable) this.boxBackground).cutoutBounds.isEmpty() ^ true);
    }

    @Override // android.view.ViewGroup, android.view.View
    @TargetApi(26)
    public void dispatchProvideAutofillStructure(ViewStructure viewStructure, int i) {
        EditText editText = this.editText;
        if (editText == null) {
            super.dispatchProvideAutofillStructure(viewStructure, i);
            return;
        }
        if (this.originalHint != null) {
            boolean z = this.isProvidingHint;
            this.isProvidingHint = false;
            CharSequence hint = editText.getHint();
            this.editText.setHint(this.originalHint);
            try {
                super.dispatchProvideAutofillStructure(viewStructure, i);
            } finally {
                this.editText.setHint(hint);
                this.isProvidingHint = z;
            }
        } else {
            viewStructure.setAutofillId(getAutofillId());
            onProvideAutofillStructure(viewStructure, i);
            onProvideAutofillVirtualStructure(viewStructure, i);
            viewStructure.setChildCount(this.inputFrame.getChildCount());
            for (int i2 = 0; i2 < this.inputFrame.getChildCount(); i2++) {
                View childAt = this.inputFrame.getChildAt(i2);
                ViewStructure newChild = viewStructure.newChild(i2);
                childAt.dispatchProvideAutofillStructure(newChild, i);
                if (childAt == this.editText) {
                    newChild.setHint(getHint());
                }
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchRestoreInstanceState(SparseArray<Parcelable> sparseArray) {
        this.restoringSavedState = true;
        super.dispatchRestoreInstanceState(sparseArray);
        this.restoringSavedState = false;
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
        if (this.hintEnabled) {
            this.collapsingTextHelper.draw(canvas);
        }
        MaterialShapeDrawable materialShapeDrawable = this.boxUnderline;
        if (materialShapeDrawable != null) {
            Rect bounds = materialShapeDrawable.getBounds();
            bounds.top = bounds.bottom - this.boxStrokeWidthPx;
            this.boxUnderline.draw(canvas);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void drawableStateChanged() {
        if (!this.inDrawableStateChanged) {
            boolean z = true;
            this.inDrawableStateChanged = true;
            super.drawableStateChanged();
            int[] drawableState = getDrawableState();
            CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
            boolean state = collapsingTextHelper != null ? collapsingTextHelper.setState(drawableState) | false : false;
            if (this.editText != null) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (!isLaidOut() || !isEnabled()) {
                    z = false;
                }
                updateLabelState(z, false);
            }
            updateEditTextBackground();
            updateTextInputBoxState();
            if (state) {
                invalidate();
            }
            this.inDrawableStateChanged = false;
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    public int getBaseline() {
        EditText editText = this.editText;
        if (editText == null) {
            return super.getBaseline();
        }
        int baseline = editText.getBaseline();
        return calculateLabelMarginTop() + getPaddingTop() + baseline;
    }

    public final EndIconDelegate getEndIconDelegate() {
        EndIconDelegate endIconDelegate = this.endIconDelegates.get(this.endIconMode);
        return endIconDelegate != null ? endIconDelegate : this.endIconDelegates.get(0);
    }

    public CharSequence getError() {
        IndicatorViewController indicatorViewController = this.indicatorViewController;
        if (indicatorViewController.errorEnabled) {
            return indicatorViewController.errorText;
        }
        return null;
    }

    public final int getErrorTextCurrentColor() {
        return this.indicatorViewController.getErrorViewCurrentTextColor();
    }

    public CharSequence getHint() {
        if (this.hintEnabled) {
            return this.hint;
        }
        return null;
    }

    public final float getHintCollapsedTextHeight() {
        return this.collapsingTextHelper.getCollapsedTextHeight();
    }

    public final int getHintCurrentCollapsedTextColor() {
        return this.collapsingTextHelper.getCurrentCollapsedTextColor();
    }

    public final int getLabelLeftBoundAlightWithPrefix(int i, boolean z) {
        int compoundPaddingLeft = this.editText.getCompoundPaddingLeft() + i;
        return (this.prefixText == null || z) ? compoundPaddingLeft : (compoundPaddingLeft - this.prefixTextView.getMeasuredWidth()) + this.prefixTextView.getPaddingLeft();
    }

    public final int getLabelRightBoundAlignedWithSuffix(int i, boolean z) {
        int compoundPaddingRight = i - this.editText.getCompoundPaddingRight();
        return (this.prefixText == null || !z) ? compoundPaddingRight : compoundPaddingRight + (this.prefixTextView.getMeasuredWidth() - this.prefixTextView.getPaddingRight());
    }

    public final boolean hasEndIcon() {
        return this.endIconMode != 0;
    }

    public boolean isEndIconVisible() {
        return this.endIconFrame.getVisibility() == 0 && this.endIconView.getVisibility() == 0;
    }

    public final boolean isHelperTextDisplayed() {
        IndicatorViewController indicatorViewController = this.indicatorViewController;
        return indicatorViewController.captionDisplayed == 2 && indicatorViewController.helperTextView != null && !TextUtils.isEmpty(indicatorViewController.helperText);
    }

    public final boolean isHintExpanded() {
        return this.hintExpanded;
    }

    public final void onApplyBoxBackgroundMode() {
        int i = this.boxBackgroundMode;
        if (i == 0) {
            this.boxBackground = null;
            this.boxUnderline = null;
        } else if (i == 1) {
            this.boxBackground = new MaterialShapeDrawable(this.shapeAppearanceModel);
            this.boxUnderline = new MaterialShapeDrawable();
        } else if (i == 2) {
            if (!this.hintEnabled || (this.boxBackground instanceof CutoutDrawable)) {
                this.boxBackground = new MaterialShapeDrawable(this.shapeAppearanceModel);
            } else {
                this.boxBackground = new CutoutDrawable(this.shapeAppearanceModel);
            }
            this.boxUnderline = null;
        } else {
            throw new IllegalArgumentException(this.boxBackgroundMode + " is illegal; only @BoxBackgroundMode constants are supported.");
        }
        EditText editText = this.editText;
        if ((editText == null || this.boxBackground == null || editText.getBackground() != null || this.boxBackgroundMode == 0) ? false : true) {
            EditText editText2 = this.editText;
            MaterialShapeDrawable materialShapeDrawable = this.boxBackground;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            editText2.setBackground(materialShapeDrawable);
        }
        updateTextInputBoxState();
        if (this.boxBackgroundMode == 1) {
            if (MaterialResources.isFontScaleAtLeast2_0(getContext())) {
                this.boxCollapsedPaddingTopPx = getResources().getDimensionPixelSize(R.dimen.material_font_2_0_box_collapsed_padding_top);
            } else if (MaterialResources.isFontScaleAtLeast1_3(getContext())) {
                this.boxCollapsedPaddingTopPx = getResources().getDimensionPixelSize(R.dimen.material_font_1_3_box_collapsed_padding_top);
            }
        }
        if (this.editText != null && this.boxBackgroundMode == 1) {
            if (MaterialResources.isFontScaleAtLeast2_0(getContext())) {
                EditText editText3 = this.editText;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                editText3.setPaddingRelative(editText3.getPaddingStart(), getResources().getDimensionPixelSize(R.dimen.material_filled_edittext_font_2_0_padding_top), this.editText.getPaddingEnd(), getResources().getDimensionPixelSize(R.dimen.material_filled_edittext_font_2_0_padding_bottom));
            } else if (MaterialResources.isFontScaleAtLeast1_3(getContext())) {
                EditText editText4 = this.editText;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap3 = ViewCompat.sViewPropertyAnimatorMap;
                editText4.setPaddingRelative(editText4.getPaddingStart(), getResources().getDimensionPixelSize(R.dimen.material_filled_edittext_font_1_3_padding_top), this.editText.getPaddingEnd(), getResources().getDimensionPixelSize(R.dimen.material_filled_edittext_font_1_3_padding_bottom));
            }
        }
        if (this.boxBackgroundMode != 0) {
            updateInputLayoutMargins();
        }
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        super.onLayout(z, i, i2, i3, i4);
        EditText editText = this.editText;
        if (editText != null) {
            Rect rect = this.tmpRect;
            DescendantOffsetUtils.getDescendantRect(this, editText, rect);
            MaterialShapeDrawable materialShapeDrawable = this.boxUnderline;
            if (materialShapeDrawable != null) {
                int i7 = rect.bottom;
                materialShapeDrawable.setBounds(rect.left, i7 - this.boxStrokeWidthFocusedPx, rect.right, i7);
            }
            if (this.hintEnabled) {
                CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
                float textSize = this.editText.getTextSize();
                if (collapsingTextHelper.expandedTextSize != textSize) {
                    collapsingTextHelper.expandedTextSize = textSize;
                    collapsingTextHelper.recalculate(false);
                }
                int gravity = this.editText.getGravity();
                this.collapsingTextHelper.setCollapsedTextGravity((gravity & (-113)) | 48);
                this.collapsingTextHelper.setExpandedTextGravity(gravity);
                CollapsingTextHelper collapsingTextHelper2 = this.collapsingTextHelper;
                if (this.editText != null) {
                    Rect rect2 = this.tmpBoundsRect;
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    boolean z2 = getLayoutDirection() == 1;
                    rect2.bottom = rect.bottom;
                    int i8 = this.boxBackgroundMode;
                    if (i8 == 1) {
                        rect2.left = getLabelLeftBoundAlightWithPrefix(rect.left, z2);
                        rect2.top = rect.top + this.boxCollapsedPaddingTopPx;
                        rect2.right = getLabelRightBoundAlignedWithSuffix(rect.right, z2);
                    } else if (i8 != 2) {
                        rect2.left = getLabelLeftBoundAlightWithPrefix(rect.left, z2);
                        rect2.top = getPaddingTop();
                        rect2.right = getLabelRightBoundAlignedWithSuffix(rect.right, z2);
                    } else {
                        rect2.left = this.editText.getPaddingLeft() + rect.left;
                        rect2.top = rect.top - calculateLabelMarginTop();
                        rect2.right = rect.right - this.editText.getPaddingRight();
                    }
                    Objects.requireNonNull(collapsingTextHelper2);
                    int i9 = rect2.left;
                    int i10 = rect2.top;
                    int i11 = rect2.right;
                    int i12 = rect2.bottom;
                    if (!CollapsingTextHelper.rectEquals(collapsingTextHelper2.collapsedBounds, i9, i10, i11, i12)) {
                        collapsingTextHelper2.collapsedBounds.set(i9, i10, i11, i12);
                        collapsingTextHelper2.boundsChanged = true;
                        collapsingTextHelper2.onBoundsChanged();
                    }
                    CollapsingTextHelper collapsingTextHelper3 = this.collapsingTextHelper;
                    if (this.editText != null) {
                        Rect rect3 = this.tmpBoundsRect;
                        TextPaint textPaint = collapsingTextHelper3.tmpPaint;
                        textPaint.setTextSize(collapsingTextHelper3.expandedTextSize);
                        textPaint.setTypeface(collapsingTextHelper3.expandedTypeface);
                        textPaint.setLetterSpacing(collapsingTextHelper3.expandedLetterSpacing);
                        float f = -collapsingTextHelper3.tmpPaint.ascent();
                        rect3.left = this.editText.getCompoundPaddingLeft() + rect.left;
                        if (this.boxBackgroundMode == 1 && this.editText.getMinLines() <= 1) {
                            i5 = (int) (rect.centerY() - (f / 2.0f));
                        } else {
                            i5 = rect.top + this.editText.getCompoundPaddingTop();
                        }
                        rect3.top = i5;
                        rect3.right = rect.right - this.editText.getCompoundPaddingRight();
                        if (this.boxBackgroundMode == 1 && this.editText.getMinLines() <= 1) {
                            i6 = (int) (rect3.top + f);
                        } else {
                            i6 = rect.bottom - this.editText.getCompoundPaddingBottom();
                        }
                        rect3.bottom = i6;
                        int i13 = rect3.left;
                        int i14 = rect3.top;
                        int i15 = rect3.right;
                        if (!CollapsingTextHelper.rectEquals(collapsingTextHelper3.expandedBounds, i13, i14, i15, i6)) {
                            collapsingTextHelper3.expandedBounds.set(i13, i14, i15, i6);
                            collapsingTextHelper3.boundsChanged = true;
                            collapsingTextHelper3.onBoundsChanged();
                        }
                        this.collapsingTextHelper.recalculate(false);
                        if (cutoutEnabled() && !this.hintExpanded) {
                            openCutout();
                            return;
                        }
                        return;
                    }
                    throw new IllegalStateException();
                }
                throw new IllegalStateException();
            }
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    public void onMeasure(int i, int i2) {
        EditText editText;
        int max;
        super.onMeasure(i, i2);
        boolean z = false;
        if (this.editText != null && this.editText.getMeasuredHeight() < (max = Math.max(this.endLayout.getMeasuredHeight(), this.startLayout.getMeasuredHeight()))) {
            this.editText.setMinimumHeight(max);
            z = true;
        }
        boolean updateDummyDrawables = updateDummyDrawables();
        if (z || updateDummyDrawables) {
            this.editText.post(new Runnable() { // from class: com.google.android.material.textfield.TextInputLayout.3
                @Override // java.lang.Runnable
                public void run() {
                    TextInputLayout.this.editText.requestLayout();
                }
            });
        }
        if (!(this.placeholderTextView == null || (editText = this.editText) == null)) {
            this.placeholderTextView.setGravity(editText.getGravity());
            this.placeholderTextView.setPadding(this.editText.getCompoundPaddingLeft(), this.editText.getCompoundPaddingTop(), this.editText.getCompoundPaddingRight(), this.editText.getCompoundPaddingBottom());
        }
        updatePrefixTextViewPadding();
        updateSuffixTextViewPadding();
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.mSuperState);
        setError(savedState.error);
        if (savedState.isEndIconChecked) {
            this.endIconView.post(new Runnable() { // from class: com.google.android.material.textfield.TextInputLayout.2
                @Override // java.lang.Runnable
                public void run() {
                    TextInputLayout.this.endIconView.performClick();
                    TextInputLayout.this.endIconView.jumpDrawablesToCurrentState();
                }
            });
        }
        setHint(savedState.hintText);
        setHelperText(savedState.helperText);
        setPlaceholderText(savedState.placeholderText);
        requestLayout();
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        if (this.indicatorViewController.errorShouldBeShown()) {
            savedState.error = getError();
        }
        savedState.isEndIconChecked = hasEndIcon() && this.endIconView.isChecked();
        savedState.hintText = getHint();
        IndicatorViewController indicatorViewController = this.indicatorViewController;
        CharSequence charSequence = null;
        savedState.helperText = indicatorViewController.helperTextEnabled ? indicatorViewController.helperText : null;
        if (this.placeholderEnabled) {
            charSequence = this.placeholderText;
        }
        savedState.placeholderText = charSequence;
        return savedState;
    }

    public final void openCutout() {
        float f;
        float f2;
        int i;
        float f3;
        float f4;
        float f5;
        int i2;
        if (cutoutEnabled()) {
            RectF rectF = this.tmpRectF;
            CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
            int width = this.editText.getWidth();
            int gravity = this.editText.getGravity();
            boolean calculateIsRtl = collapsingTextHelper.calculateIsRtl(collapsingTextHelper.text);
            collapsingTextHelper.isRtl = calculateIsRtl;
            if (gravity == 17 || (gravity & 7) == 1) {
                f5 = width / 2.0f;
                f4 = collapsingTextHelper.calculateCollapsedTextWidth() / 2.0f;
            } else {
                if ((gravity & 8388613) == 8388613 || (gravity & 5) == 5) {
                    if (calculateIsRtl) {
                        i2 = collapsingTextHelper.collapsedBounds.left;
                        f = i2;
                    } else {
                        f5 = collapsingTextHelper.collapsedBounds.right;
                        f4 = collapsingTextHelper.calculateCollapsedTextWidth();
                    }
                } else if (calculateIsRtl) {
                    f5 = collapsingTextHelper.collapsedBounds.right;
                    f4 = collapsingTextHelper.calculateCollapsedTextWidth();
                } else {
                    i2 = collapsingTextHelper.collapsedBounds.left;
                    f = i2;
                }
                rectF.left = f;
                Rect rect = collapsingTextHelper.collapsedBounds;
                rectF.top = rect.top;
                if (gravity != 17 || (gravity & 7) == 1) {
                    f2 = (width / 2.0f) + (collapsingTextHelper.calculateCollapsedTextWidth() / 2.0f);
                } else if ((gravity & 8388613) == 8388613 || (gravity & 5) == 5) {
                    if (collapsingTextHelper.isRtl) {
                        f3 = collapsingTextHelper.calculateCollapsedTextWidth();
                        f2 = f3 + f;
                    } else {
                        i = rect.right;
                        f2 = i;
                    }
                } else if (collapsingTextHelper.isRtl) {
                    i = rect.right;
                    f2 = i;
                } else {
                    f3 = collapsingTextHelper.calculateCollapsedTextWidth();
                    f2 = f3 + f;
                }
                rectF.right = f2;
                rectF.bottom = collapsingTextHelper.getCollapsedTextHeight() + collapsingTextHelper.collapsedBounds.top;
                float f6 = rectF.left;
                float f7 = this.boxLabelCutoutPaddingPx;
                rectF.left = f6 - f7;
                rectF.right += f7;
                int i3 = this.boxStrokeWidthPx;
                this.boxLabelCutoutHeight = i3;
                rectF.top = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                rectF.bottom = i3;
                rectF.offset(-getPaddingLeft(), HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                CutoutDrawable cutoutDrawable = (CutoutDrawable) this.boxBackground;
                Objects.requireNonNull(cutoutDrawable);
                cutoutDrawable.setCutout(rectF.left, rectF.top, rectF.right, rectF.bottom);
            }
            f = f5 - f4;
            rectF.left = f;
            Rect rect2 = collapsingTextHelper.collapsedBounds;
            rectF.top = rect2.top;
            if (gravity != 17) {
            }
            f2 = (width / 2.0f) + (collapsingTextHelper.calculateCollapsedTextWidth() / 2.0f);
            rectF.right = f2;
            rectF.bottom = collapsingTextHelper.getCollapsedTextHeight() + collapsingTextHelper.collapsedBounds.top;
            float f62 = rectF.left;
            float f72 = this.boxLabelCutoutPaddingPx;
            rectF.left = f62 - f72;
            rectF.right += f72;
            int i32 = this.boxStrokeWidthPx;
            this.boxLabelCutoutHeight = i32;
            rectF.top = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            rectF.bottom = i32;
            rectF.offset(-getPaddingLeft(), HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            CutoutDrawable cutoutDrawable2 = (CutoutDrawable) this.boxBackground;
            Objects.requireNonNull(cutoutDrawable2);
            cutoutDrawable2.setCutout(rectF.left, rectF.top, rectF.right, rectF.bottom);
        }
    }

    public void refreshEndIconDrawableState() {
        refreshIconDrawableState(this.endIconView, this.endIconTintList);
    }

    public final void refreshIconDrawableState(CheckableImageButton checkableImageButton, ColorStateList colorStateList) {
        Drawable drawable = checkableImageButton.getDrawable();
        if (checkableImageButton.getDrawable() != null && colorStateList != null && colorStateList.isStateful()) {
            int[] drawableState = getDrawableState();
            int[] drawableState2 = checkableImageButton.getDrawableState();
            int length = drawableState.length;
            int[] copyOf = Arrays.copyOf(drawableState, drawableState.length + drawableState2.length);
            System.arraycopy(drawableState2, 0, copyOf, length, drawableState2.length);
            int colorForState = colorStateList.getColorForState(copyOf, colorStateList.getDefaultColor());
            Drawable mutate = drawable.mutate();
            mutate.setTintList(ColorStateList.valueOf(colorForState));
            checkableImageButton.setImageDrawable(mutate);
        }
    }

    @Override // android.view.View
    public void setEnabled(boolean z) {
        recursiveSetEnabled(this, z);
        super.setEnabled(z);
    }

    public void setEndIconCheckable(boolean z) {
        CheckableImageButton checkableImageButton = this.endIconView;
        if (checkableImageButton.checkable != z) {
            checkableImageButton.checkable = z;
            checkableImageButton.sendAccessibilityEvent(0);
        }
    }

    public void setEndIconContentDescription(CharSequence charSequence) {
        if (this.endIconView.getContentDescription() != charSequence) {
            this.endIconView.setContentDescription(charSequence);
        }
    }

    public void setEndIconDrawable(Drawable drawable) {
        this.endIconView.setImageDrawable(drawable);
        refreshEndIconDrawableState();
    }

    public void setEndIconMode(int i) {
        int i2 = this.endIconMode;
        this.endIconMode = i;
        Iterator<OnEndIconChangedListener> it = this.endIconChangedListeners.iterator();
        while (it.hasNext()) {
            it.next().onEndIconChanged(this, i2);
        }
        setEndIconVisible(i != 0);
        if (getEndIconDelegate().isBoxBackgroundModeSupported(this.boxBackgroundMode)) {
            getEndIconDelegate().initialize();
            applyEndIconTint();
            return;
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("The current box background mode ");
        m.append(this.boxBackgroundMode);
        m.append(" is not supported by the end icon mode ");
        m.append(i);
        throw new IllegalStateException(m.toString());
    }

    public void setEndIconOnClickListener(View.OnClickListener onClickListener) {
        CheckableImageButton checkableImageButton = this.endIconView;
        View.OnLongClickListener onLongClickListener = this.endIconOnLongClickListener;
        checkableImageButton.setOnClickListener(null);
        setIconClickable(checkableImageButton, onLongClickListener);
    }

    public void setEndIconVisible(boolean z) {
        if (isEndIconVisible() != z) {
            this.endIconView.setVisibility(z ? 0 : 8);
            updateSuffixTextViewPadding();
            updateDummyDrawables();
        }
    }

    public void setError(CharSequence charSequence) {
        if (!this.indicatorViewController.errorEnabled) {
            if (!TextUtils.isEmpty(charSequence)) {
                setErrorEnabled(true);
            } else {
                return;
            }
        }
        if (!TextUtils.isEmpty(charSequence)) {
            IndicatorViewController indicatorViewController = this.indicatorViewController;
            indicatorViewController.cancelCaptionAnimator();
            indicatorViewController.errorText = charSequence;
            indicatorViewController.errorView.setText(charSequence);
            int i = indicatorViewController.captionDisplayed;
            if (i != 1) {
                indicatorViewController.captionToShow = 1;
            }
            indicatorViewController.updateCaptionViewsVisibility(i, indicatorViewController.captionToShow, indicatorViewController.shouldAnimateCaptionView(indicatorViewController.errorView, charSequence));
            return;
        }
        this.indicatorViewController.hideError();
    }

    public void setErrorEnabled(boolean z) {
        IndicatorViewController indicatorViewController = this.indicatorViewController;
        if (indicatorViewController.errorEnabled != z) {
            indicatorViewController.cancelCaptionAnimator();
            if (z) {
                AppCompatTextView appCompatTextView = new AppCompatTextView(indicatorViewController.context);
                indicatorViewController.errorView = appCompatTextView;
                appCompatTextView.setId(R.id.textinput_error);
                indicatorViewController.errorView.setTextAlignment(5);
                int i = indicatorViewController.errorTextAppearance;
                indicatorViewController.errorTextAppearance = i;
                TextView textView = indicatorViewController.errorView;
                if (textView != null) {
                    indicatorViewController.textInputView.setTextAppearanceCompatWithErrorFallback(textView, i);
                }
                ColorStateList colorStateList = indicatorViewController.errorViewTextColor;
                indicatorViewController.errorViewTextColor = colorStateList;
                TextView textView2 = indicatorViewController.errorView;
                if (!(textView2 == null || colorStateList == null)) {
                    textView2.setTextColor(colorStateList);
                }
                CharSequence charSequence = indicatorViewController.errorViewContentDescription;
                indicatorViewController.errorViewContentDescription = charSequence;
                TextView textView3 = indicatorViewController.errorView;
                if (textView3 != null) {
                    textView3.setContentDescription(charSequence);
                }
                indicatorViewController.errorView.setVisibility(4);
                TextView textView4 = indicatorViewController.errorView;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                textView4.setAccessibilityLiveRegion(1);
                indicatorViewController.addIndicator(indicatorViewController.errorView, 0);
            } else {
                indicatorViewController.hideError();
                indicatorViewController.removeIndicator(indicatorViewController.errorView, 0);
                indicatorViewController.errorView = null;
                indicatorViewController.textInputView.updateEditTextBackground();
                indicatorViewController.textInputView.updateTextInputBoxState();
            }
            indicatorViewController.errorEnabled = z;
        }
    }

    public void setErrorIconDrawable(Drawable drawable) {
        this.errorIconView.setImageDrawable(drawable);
        setErrorIconVisible(drawable != null && this.indicatorViewController.errorEnabled);
    }

    public final void setErrorIconVisible(boolean z) {
        int i = 0;
        this.errorIconView.setVisibility(z ? 0 : 8);
        FrameLayout frameLayout = this.endIconFrame;
        if (z) {
            i = 8;
        }
        frameLayout.setVisibility(i);
        updateSuffixTextViewPadding();
        if (!hasEndIcon()) {
            updateDummyDrawables();
        }
    }

    public void setHelperText(CharSequence charSequence) {
        if (!TextUtils.isEmpty(charSequence)) {
            if (!this.indicatorViewController.helperTextEnabled) {
                setHelperTextEnabled(true);
            }
            IndicatorViewController indicatorViewController = this.indicatorViewController;
            indicatorViewController.cancelCaptionAnimator();
            indicatorViewController.helperText = charSequence;
            indicatorViewController.helperTextView.setText(charSequence);
            int i = indicatorViewController.captionDisplayed;
            if (i != 2) {
                indicatorViewController.captionToShow = 2;
            }
            indicatorViewController.updateCaptionViewsVisibility(i, indicatorViewController.captionToShow, indicatorViewController.shouldAnimateCaptionView(indicatorViewController.helperTextView, charSequence));
        } else if (this.indicatorViewController.helperTextEnabled) {
            setHelperTextEnabled(false);
        }
    }

    public void setHelperTextEnabled(boolean z) {
        IndicatorViewController indicatorViewController = this.indicatorViewController;
        if (indicatorViewController.helperTextEnabled != z) {
            indicatorViewController.cancelCaptionAnimator();
            if (z) {
                AppCompatTextView appCompatTextView = new AppCompatTextView(indicatorViewController.context);
                indicatorViewController.helperTextView = appCompatTextView;
                appCompatTextView.setId(R.id.textinput_helper_text);
                indicatorViewController.helperTextView.setTextAlignment(5);
                indicatorViewController.helperTextView.setVisibility(4);
                TextView textView = indicatorViewController.helperTextView;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                textView.setAccessibilityLiveRegion(1);
                int i = indicatorViewController.helperTextTextAppearance;
                indicatorViewController.helperTextTextAppearance = i;
                TextView textView2 = indicatorViewController.helperTextView;
                if (textView2 != null) {
                    textView2.setTextAppearance(i);
                }
                ColorStateList colorStateList = indicatorViewController.helperTextViewTextColor;
                indicatorViewController.helperTextViewTextColor = colorStateList;
                TextView textView3 = indicatorViewController.helperTextView;
                if (!(textView3 == null || colorStateList == null)) {
                    textView3.setTextColor(colorStateList);
                }
                indicatorViewController.addIndicator(indicatorViewController.helperTextView, 1);
            } else {
                indicatorViewController.cancelCaptionAnimator();
                int i2 = indicatorViewController.captionDisplayed;
                if (i2 == 2) {
                    indicatorViewController.captionToShow = 0;
                }
                indicatorViewController.updateCaptionViewsVisibility(i2, indicatorViewController.captionToShow, indicatorViewController.shouldAnimateCaptionView(indicatorViewController.helperTextView, null));
                indicatorViewController.removeIndicator(indicatorViewController.helperTextView, 1);
                indicatorViewController.helperTextView = null;
                indicatorViewController.textInputView.updateEditTextBackground();
                indicatorViewController.textInputView.updateTextInputBoxState();
            }
            indicatorViewController.helperTextEnabled = z;
        }
    }

    public void setHint(CharSequence charSequence) {
        if (this.hintEnabled) {
            if (!TextUtils.equals(charSequence, this.hint)) {
                this.hint = charSequence;
                this.collapsingTextHelper.setText(charSequence);
                if (!this.hintExpanded) {
                    openCutout();
                }
            }
            sendAccessibilityEvent(QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED);
        }
    }

    public void setPlaceholderText(CharSequence charSequence) {
        int i = 0;
        if (!this.placeholderEnabled || !TextUtils.isEmpty(charSequence)) {
            if (!this.placeholderEnabled) {
                setPlaceholderTextEnabled(true);
            }
            this.placeholderText = charSequence;
        } else {
            setPlaceholderTextEnabled(false);
        }
        EditText editText = this.editText;
        if (editText != null) {
            i = editText.getText().length();
        }
        updatePlaceholderText(i);
    }

    public final void setPlaceholderTextEnabled(boolean z) {
        if (this.placeholderEnabled != z) {
            if (z) {
                AppCompatTextView appCompatTextView = new AppCompatTextView(getContext());
                this.placeholderTextView = appCompatTextView;
                appCompatTextView.setId(R.id.textinput_placeholder);
                TextView textView = this.placeholderTextView;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                textView.setAccessibilityLiveRegion(1);
                int i = this.placeholderTextAppearance;
                this.placeholderTextAppearance = i;
                TextView textView2 = this.placeholderTextView;
                if (textView2 != null) {
                    textView2.setTextAppearance(i);
                }
                TextView textView3 = this.placeholderTextView;
                if (textView3 != null) {
                    this.inputFrame.addView(textView3);
                    this.placeholderTextView.setVisibility(0);
                }
            } else {
                TextView textView4 = this.placeholderTextView;
                if (textView4 != null) {
                    textView4.setVisibility(8);
                }
                this.placeholderTextView = null;
            }
            this.placeholderEnabled = z;
        }
    }

    public void setStartIconVisible(boolean z) {
        int i = 0;
        if ((this.startIconView.getVisibility() == 0) != z) {
            CheckableImageButton checkableImageButton = this.startIconView;
            if (!z) {
                i = 8;
            }
            checkableImageButton.setVisibility(i);
            updatePrefixTextViewPadding();
            updateDummyDrawables();
        }
    }

    public void setTextAppearanceCompatWithErrorFallback(TextView textView, int i) {
        boolean z = true;
        try {
            textView.setTextAppearance(i);
            if (textView.getTextColors().getDefaultColor() != -65281) {
                z = false;
            }
        } catch (Exception unused) {
        }
        if (z) {
            textView.setTextAppearance(R.style.TextAppearance_AppCompat_Caption);
            Context context = getContext();
            Object obj = ContextCompat.sLock;
            textView.setTextColor(context.getColor(R.color.design_error));
        }
    }

    public final void updateCounter() {
        if (this.counterView != null) {
            EditText editText = this.editText;
            updateCounter(editText == null ? 0 : editText.getText().length());
        }
    }

    public final void updateCounterTextAppearanceAndColor() {
        ColorStateList colorStateList;
        ColorStateList colorStateList2;
        TextView textView = this.counterView;
        if (textView != null) {
            setTextAppearanceCompatWithErrorFallback(textView, this.counterOverflowed ? this.counterOverflowTextAppearance : this.counterTextAppearance);
            if (!this.counterOverflowed && (colorStateList2 = this.counterTextColor) != null) {
                this.counterView.setTextColor(colorStateList2);
            }
            if (this.counterOverflowed && (colorStateList = this.counterOverflowTextColor) != null) {
                this.counterView.setTextColor(colorStateList);
            }
        }
    }

    public final boolean updateDummyDrawables() {
        boolean z;
        if (this.editText == null) {
            return false;
        }
        boolean z2 = true;
        CheckableImageButton checkableImageButton = null;
        if (!(this.startIconView.getDrawable() == null && this.prefixText == null) && this.startLayout.getMeasuredWidth() > 0) {
            int measuredWidth = this.startLayout.getMeasuredWidth() - this.editText.getPaddingLeft();
            if (this.startDummyDrawable == null || this.startDummyDrawableWidth != measuredWidth) {
                ColorDrawable colorDrawable = new ColorDrawable();
                this.startDummyDrawable = colorDrawable;
                this.startDummyDrawableWidth = measuredWidth;
                colorDrawable.setBounds(0, 0, measuredWidth, 1);
            }
            Drawable[] compoundDrawablesRelative = this.editText.getCompoundDrawablesRelative();
            Drawable drawable = compoundDrawablesRelative[0];
            Drawable drawable2 = this.startDummyDrawable;
            if (drawable != drawable2) {
                this.editText.setCompoundDrawablesRelative(drawable2, compoundDrawablesRelative[1], compoundDrawablesRelative[2], compoundDrawablesRelative[3]);
                z = true;
            }
            z = false;
        } else {
            if (this.startDummyDrawable != null) {
                Drawable[] compoundDrawablesRelative2 = this.editText.getCompoundDrawablesRelative();
                this.editText.setCompoundDrawablesRelative(null, compoundDrawablesRelative2[1], compoundDrawablesRelative2[2], compoundDrawablesRelative2[3]);
                this.startDummyDrawable = null;
                z = true;
            }
            z = false;
        }
        if ((this.errorIconView.getVisibility() == 0 || ((hasEndIcon() && isEndIconVisible()) || this.suffixText != null)) && this.endLayout.getMeasuredWidth() > 0) {
            int measuredWidth2 = this.suffixTextView.getMeasuredWidth() - this.editText.getPaddingRight();
            if (this.errorIconView.getVisibility() == 0) {
                checkableImageButton = this.errorIconView;
            } else if (hasEndIcon() && isEndIconVisible()) {
                checkableImageButton = this.endIconView;
            }
            if (checkableImageButton != null) {
                measuredWidth2 = checkableImageButton.getMeasuredWidth() + measuredWidth2 + ((ViewGroup.MarginLayoutParams) checkableImageButton.getLayoutParams()).getMarginStart();
            }
            Drawable[] compoundDrawablesRelative3 = this.editText.getCompoundDrawablesRelative();
            Drawable drawable3 = this.endDummyDrawable;
            if (drawable3 == null || this.endDummyDrawableWidth == measuredWidth2) {
                if (drawable3 == null) {
                    ColorDrawable colorDrawable2 = new ColorDrawable();
                    this.endDummyDrawable = colorDrawable2;
                    this.endDummyDrawableWidth = measuredWidth2;
                    colorDrawable2.setBounds(0, 0, measuredWidth2, 1);
                }
                Drawable drawable4 = compoundDrawablesRelative3[2];
                Drawable drawable5 = this.endDummyDrawable;
                if (drawable4 != drawable5) {
                    this.originalEditTextEndDrawable = compoundDrawablesRelative3[2];
                    this.editText.setCompoundDrawablesRelative(compoundDrawablesRelative3[0], compoundDrawablesRelative3[1], drawable5, compoundDrawablesRelative3[3]);
                } else {
                    z2 = z;
                }
            } else {
                this.endDummyDrawableWidth = measuredWidth2;
                drawable3.setBounds(0, 0, measuredWidth2, 1);
                this.editText.setCompoundDrawablesRelative(compoundDrawablesRelative3[0], compoundDrawablesRelative3[1], this.endDummyDrawable, compoundDrawablesRelative3[3]);
            }
        } else if (this.endDummyDrawable == null) {
            return z;
        } else {
            Drawable[] compoundDrawablesRelative4 = this.editText.getCompoundDrawablesRelative();
            if (compoundDrawablesRelative4[2] == this.endDummyDrawable) {
                this.editText.setCompoundDrawablesRelative(compoundDrawablesRelative4[0], compoundDrawablesRelative4[1], this.originalEditTextEndDrawable, compoundDrawablesRelative4[3]);
            } else {
                z2 = z;
            }
            this.endDummyDrawable = null;
        }
        return z2;
    }

    public void updateEditTextBackground() {
        Drawable background;
        TextView textView;
        EditText editText = this.editText;
        if (editText != null && this.boxBackgroundMode == 0 && (background = editText.getBackground()) != null) {
            if (DrawableUtils.canSafelyMutateDrawable(background)) {
                background = background.mutate();
            }
            if (this.indicatorViewController.errorShouldBeShown()) {
                background.setColorFilter(AppCompatDrawableManager.getPorterDuffColorFilter(this.indicatorViewController.getErrorViewCurrentTextColor(), PorterDuff.Mode.SRC_IN));
            } else if (!this.counterOverflowed || (textView = this.counterView) == null) {
                background.clearColorFilter();
                this.editText.refreshDrawableState();
            } else {
                background.setColorFilter(AppCompatDrawableManager.getPorterDuffColorFilter(textView.getCurrentTextColor(), PorterDuff.Mode.SRC_IN));
            }
        }
    }

    public final void updateInputLayoutMargins() {
        if (this.boxBackgroundMode != 1) {
            LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) this.inputFrame.getLayoutParams();
            int calculateLabelMarginTop = calculateLabelMarginTop();
            if (calculateLabelMarginTop != layoutParams.topMargin) {
                layoutParams.topMargin = calculateLabelMarginTop;
                this.inputFrame.requestLayout();
            }
        }
    }

    public final void updateLabelState(boolean z, boolean z2) {
        ColorStateList colorStateList;
        TextView textView;
        boolean isEnabled = isEnabled();
        EditText editText = this.editText;
        int i = 0;
        boolean z3 = editText != null && !TextUtils.isEmpty(editText.getText());
        EditText editText2 = this.editText;
        boolean z4 = editText2 != null && editText2.hasFocus();
        boolean errorShouldBeShown = this.indicatorViewController.errorShouldBeShown();
        ColorStateList colorStateList2 = this.defaultHintTextColor;
        if (colorStateList2 != null) {
            CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
            if (collapsingTextHelper.collapsedTextColor != colorStateList2) {
                collapsingTextHelper.collapsedTextColor = colorStateList2;
                collapsingTextHelper.recalculate(false);
            }
            CollapsingTextHelper collapsingTextHelper2 = this.collapsingTextHelper;
            ColorStateList colorStateList3 = this.defaultHintTextColor;
            if (collapsingTextHelper2.expandedTextColor != colorStateList3) {
                collapsingTextHelper2.expandedTextColor = colorStateList3;
                collapsingTextHelper2.recalculate(false);
            }
        }
        if (!isEnabled) {
            ColorStateList colorStateList4 = this.defaultHintTextColor;
            int colorForState = colorStateList4 != null ? colorStateList4.getColorForState(new int[]{-16842910}, this.disabledColor) : this.disabledColor;
            this.collapsingTextHelper.setCollapsedTextColor(ColorStateList.valueOf(colorForState));
            CollapsingTextHelper collapsingTextHelper3 = this.collapsingTextHelper;
            ColorStateList valueOf = ColorStateList.valueOf(colorForState);
            if (collapsingTextHelper3.expandedTextColor != valueOf) {
                collapsingTextHelper3.expandedTextColor = valueOf;
                collapsingTextHelper3.recalculate(false);
            }
        } else if (errorShouldBeShown) {
            CollapsingTextHelper collapsingTextHelper4 = this.collapsingTextHelper;
            TextView textView2 = this.indicatorViewController.errorView;
            collapsingTextHelper4.setCollapsedTextColor(textView2 != null ? textView2.getTextColors() : null);
        } else if (this.counterOverflowed && (textView = this.counterView) != null) {
            this.collapsingTextHelper.setCollapsedTextColor(textView.getTextColors());
        } else if (z4 && (colorStateList = this.focusedTextColor) != null) {
            CollapsingTextHelper collapsingTextHelper5 = this.collapsingTextHelper;
            if (collapsingTextHelper5.collapsedTextColor != colorStateList) {
                collapsingTextHelper5.collapsedTextColor = colorStateList;
                collapsingTextHelper5.recalculate(false);
            }
        }
        if (z3 || !this.expandedHintEnabled || (isEnabled() && z4)) {
            if (z2 || this.hintExpanded) {
                ValueAnimator valueAnimator = this.animator;
                if (valueAnimator != null && valueAnimator.isRunning()) {
                    this.animator.cancel();
                }
                if (!z || !this.hintAnimationEnabled) {
                    this.collapsingTextHelper.setExpansionFraction(1.0f);
                } else {
                    animateToExpansionFraction(1.0f);
                }
                this.hintExpanded = false;
                if (cutoutEnabled()) {
                    openCutout();
                }
                EditText editText3 = this.editText;
                if (editText3 != null) {
                    i = editText3.getText().length();
                }
                updatePlaceholderText(i);
                updatePrefixTextVisibility();
                updateSuffixTextVisibility();
            }
        } else if (z2 || !this.hintExpanded) {
            ValueAnimator valueAnimator2 = this.animator;
            if (valueAnimator2 != null && valueAnimator2.isRunning()) {
                this.animator.cancel();
            }
            if (!z || !this.hintAnimationEnabled) {
                this.collapsingTextHelper.setExpansionFraction(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            } else {
                animateToExpansionFraction(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            }
            if (cutoutEnabled() && (!((CutoutDrawable) this.boxBackground).cutoutBounds.isEmpty()) && cutoutEnabled()) {
                ((CutoutDrawable) this.boxBackground).setCutout(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            }
            this.hintExpanded = true;
            TextView textView3 = this.placeholderTextView;
            if (textView3 != null && this.placeholderEnabled) {
                textView3.setText((CharSequence) null);
                this.placeholderTextView.setVisibility(4);
            }
            updatePrefixTextVisibility();
            updateSuffixTextVisibility();
        }
    }

    public final void updatePlaceholderText(int i) {
        if (i != 0 || this.hintExpanded) {
            TextView textView = this.placeholderTextView;
            if (textView != null && this.placeholderEnabled) {
                textView.setText((CharSequence) null);
                this.placeholderTextView.setVisibility(4);
                return;
            }
            return;
        }
        TextView textView2 = this.placeholderTextView;
        if (textView2 != null && this.placeholderEnabled) {
            textView2.setText(this.placeholderText);
            this.placeholderTextView.setVisibility(0);
            this.placeholderTextView.bringToFront();
        }
    }

    public final void updatePrefixTextViewPadding() {
        if (this.editText != null) {
            int i = 0;
            if (!(this.startIconView.getVisibility() == 0)) {
                EditText editText = this.editText;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                i = editText.getPaddingStart();
            }
            TextView textView = this.prefixTextView;
            int compoundPaddingTop = this.editText.getCompoundPaddingTop();
            int dimensionPixelSize = getContext().getResources().getDimensionPixelSize(R.dimen.material_input_text_to_prefix_suffix_padding);
            int compoundPaddingBottom = this.editText.getCompoundPaddingBottom();
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
            textView.setPaddingRelative(i, compoundPaddingTop, dimensionPixelSize, compoundPaddingBottom);
        }
    }

    public final void updatePrefixTextVisibility() {
        this.prefixTextView.setVisibility((this.prefixText == null || isHintExpanded()) ? 8 : 0);
        updateDummyDrawables();
    }

    public final void updateStrokeErrorColor(boolean z, boolean z2) {
        int defaultColor = this.strokeErrorColor.getDefaultColor();
        int colorForState = this.strokeErrorColor.getColorForState(new int[]{16843623, 16842910}, defaultColor);
        int colorForState2 = this.strokeErrorColor.getColorForState(new int[]{16843518, 16842910}, defaultColor);
        if (z) {
            this.boxStrokeColor = colorForState2;
        } else if (z2) {
            this.boxStrokeColor = colorForState;
        } else {
            this.boxStrokeColor = defaultColor;
        }
    }

    public final void updateSuffixTextViewPadding() {
        if (this.editText != null) {
            int i = 0;
            if (!isEndIconVisible()) {
                if (!(this.errorIconView.getVisibility() == 0)) {
                    EditText editText = this.editText;
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    i = editText.getPaddingEnd();
                }
            }
            TextView textView = this.suffixTextView;
            int dimensionPixelSize = getContext().getResources().getDimensionPixelSize(R.dimen.material_input_text_to_prefix_suffix_padding);
            int paddingTop = this.editText.getPaddingTop();
            int paddingBottom = this.editText.getPaddingBottom();
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
            textView.setPaddingRelative(dimensionPixelSize, paddingTop, i, paddingBottom);
        }
    }

    public final void updateSuffixTextVisibility() {
        int visibility = this.suffixTextView.getVisibility();
        int i = 0;
        boolean z = this.suffixText != null && !isHintExpanded();
        TextView textView = this.suffixTextView;
        if (!z) {
            i = 8;
        }
        textView.setVisibility(i);
        if (visibility != this.suffixTextView.getVisibility()) {
            getEndIconDelegate().onSuffixVisibilityChanged(z);
        }
        updateDummyDrawables();
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x016f  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0190  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x019e  */
    /* JADX WARN: Removed duplicated region for block: B:123:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0143  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void updateTextInputBoxState() {
        /*
            Method dump skipped, instructions count: 441
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.textfield.TextInputLayout.updateTextInputBoxState():void");
    }

    public TextInputLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.textInputStyle);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v106 */
    /* JADX WARN: Type inference failed for: r1v107 */
    /* JADX WARN: Type inference failed for: r1v113 */
    /* JADX WARN: Type inference failed for: r1v16, types: [int, boolean] */
    public TextInputLayout(Context context, AttributeSet attributeSet, int i) {
        super(MaterialThemeOverlay.wrap(context, attributeSet, i, R.style.Widget_Design_TextInputLayout), attributeSet, i);
        int i2;
        int i3;
        ?? r1;
        View view;
        boolean z;
        boolean z2;
        CharSequence charSequence;
        boolean z3;
        int i4;
        int i5;
        int i6;
        CharSequence charSequence2;
        int i7;
        CharSequence charSequence3;
        TypedArray typedArray;
        View view2;
        int i8;
        ColorStateList colorStateList;
        ColorStateList colorStateList2;
        ColorStateList colorStateList3;
        ColorStateList colorStateList4;
        boolean z4;
        PorterDuff.Mode parseTintMode;
        ColorStateList colorStateList5;
        PorterDuff.Mode parseTintMode2;
        ColorStateList colorStateList6;
        PorterDuff.Mode parseTintMode3;
        ColorStateList colorStateList7;
        CharSequence text;
        ColorStateList colorStateList8;
        this.minWidth = -1;
        this.maxWidth = -1;
        IndicatorViewController indicatorViewController = new IndicatorViewController(this);
        this.indicatorViewController = indicatorViewController;
        this.tmpRect = new Rect();
        this.tmpBoundsRect = new Rect();
        this.tmpRectF = new RectF();
        this.editTextAttachedListeners = new LinkedHashSet<>();
        this.endIconMode = 0;
        SparseArray<EndIconDelegate> sparseArray = new SparseArray<>();
        this.endIconDelegates = sparseArray;
        this.endIconChangedListeners = new LinkedHashSet<>();
        CollapsingTextHelper collapsingTextHelper = new CollapsingTextHelper(this);
        this.collapsingTextHelper = collapsingTextHelper;
        Context context2 = getContext();
        setOrientation(1);
        setWillNotDraw(false);
        setAddStatesFromChildren(true);
        FrameLayout frameLayout = new FrameLayout(context2);
        this.inputFrame = frameLayout;
        frameLayout.setAddStatesFromChildren(true);
        addView(frameLayout);
        LinearLayout linearLayout = new LinearLayout(context2);
        this.startLayout = linearLayout;
        linearLayout.setOrientation(0);
        linearLayout.setLayoutParams(new FrameLayout.LayoutParams(-2, -1, 8388611));
        frameLayout.addView(linearLayout);
        LinearLayout linearLayout2 = new LinearLayout(context2);
        this.endLayout = linearLayout2;
        linearLayout2.setOrientation(0);
        linearLayout2.setLayoutParams(new FrameLayout.LayoutParams(-2, -1, 8388613));
        frameLayout.addView(linearLayout2);
        FrameLayout frameLayout2 = new FrameLayout(context2);
        this.endIconFrame = frameLayout2;
        frameLayout2.setLayoutParams(new FrameLayout.LayoutParams(-2, -1));
        TimeInterpolator timeInterpolator = AnimationUtils.LINEAR_INTERPOLATOR;
        collapsingTextHelper.textSizeInterpolator = timeInterpolator;
        collapsingTextHelper.recalculate(false);
        collapsingTextHelper.positionInterpolator = timeInterpolator;
        collapsingTextHelper.recalculate(false);
        collapsingTextHelper.setCollapsedTextGravity(8388659);
        int[] iArr = R$styleable.TextInputLayout;
        ThemeEnforcement.checkCompatibleTheme(context2, attributeSet, i, R.style.Widget_Design_TextInputLayout);
        ThemeEnforcement.checkTextAppearance(context2, attributeSet, iArr, i, R.style.Widget_Design_TextInputLayout, 20, 18, 33, 38, 42);
        TypedArray obtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, iArr, i, R.style.Widget_Design_TextInputLayout);
        TintTypedArray tintTypedArray = new TintTypedArray(context2, obtainStyledAttributes);
        this.hintEnabled = tintTypedArray.getBoolean(41, true);
        setHint(tintTypedArray.getText(4));
        this.hintAnimationEnabled = tintTypedArray.getBoolean(40, true);
        this.expandedHintEnabled = tintTypedArray.getBoolean(35, true);
        if (tintTypedArray.hasValue(3)) {
            i2 = -1;
            int dimensionPixelSize = tintTypedArray.getDimensionPixelSize(3, -1);
            this.minWidth = dimensionPixelSize;
            EditText editText = this.editText;
            if (!(editText == null || dimensionPixelSize == -1)) {
                editText.setMinWidth(dimensionPixelSize);
            }
        } else {
            i2 = -1;
        }
        if (tintTypedArray.hasValue(2)) {
            int dimensionPixelSize2 = tintTypedArray.getDimensionPixelSize(2, i2);
            this.maxWidth = dimensionPixelSize2;
            EditText editText2 = this.editText;
            if (!(editText2 == null || dimensionPixelSize2 == i2)) {
                editText2.setMaxWidth(dimensionPixelSize2);
            }
        }
        this.shapeAppearanceModel = ShapeAppearanceModel.builder(context2, attributeSet, i, (int) R.style.Widget_Design_TextInputLayout).build();
        this.boxLabelCutoutPaddingPx = context2.getResources().getDimensionPixelOffset(R.dimen.mtrl_textinput_box_label_cutout_padding);
        this.boxCollapsedPaddingTopPx = tintTypedArray.getDimensionPixelOffset(7, 0);
        this.boxStrokeWidthDefaultPx = tintTypedArray.getDimensionPixelSize(14, context2.getResources().getDimensionPixelSize(R.dimen.mtrl_textinput_box_stroke_width_default));
        this.boxStrokeWidthFocusedPx = tintTypedArray.getDimensionPixelSize(15, context2.getResources().getDimensionPixelSize(R.dimen.mtrl_textinput_box_stroke_width_focused));
        this.boxStrokeWidthPx = this.boxStrokeWidthDefaultPx;
        float dimension = tintTypedArray.getDimension(11, -1.0f);
        float dimension2 = tintTypedArray.getDimension(10, -1.0f);
        float dimension3 = tintTypedArray.getDimension(8, -1.0f);
        float dimension4 = tintTypedArray.getDimension(9, -1.0f);
        ShapeAppearanceModel shapeAppearanceModel = this.shapeAppearanceModel;
        Objects.requireNonNull(shapeAppearanceModel);
        ShapeAppearanceModel.Builder builder = new ShapeAppearanceModel.Builder(shapeAppearanceModel);
        if (dimension >= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            builder.setTopLeftCornerSize(dimension);
        }
        if (dimension2 >= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            builder.setTopRightCornerSize(dimension2);
        }
        if (dimension3 >= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            builder.setBottomRightCornerSize(dimension3);
        }
        if (dimension4 >= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
            builder.setBottomLeftCornerSize(dimension4);
        }
        this.shapeAppearanceModel = builder.build();
        ColorStateList colorStateList9 = MaterialResources.getColorStateList(context2, tintTypedArray, 5);
        if (colorStateList9 != null) {
            int defaultColor = colorStateList9.getDefaultColor();
            this.defaultFilledBackgroundColor = defaultColor;
            this.boxBackgroundColor = defaultColor;
            if (colorStateList9.isStateful()) {
                this.disabledFilledBackgroundColor = colorStateList9.getColorForState(new int[]{-16842910}, -1);
                this.focusedFilledBackgroundColor = colorStateList9.getColorForState(new int[]{16842908, 16842910}, -1);
                this.hoveredFilledBackgroundColor = colorStateList9.getColorForState(new int[]{16843623, 16842910}, -1);
                i3 = 0;
            } else {
                this.focusedFilledBackgroundColor = this.defaultFilledBackgroundColor;
                ThreadLocal<TypedValue> threadLocal = AppCompatResources.TL_TYPED_VALUE;
                ColorStateList colorStateList10 = context2.getColorStateList(R.color.mtrl_filled_background_color);
                i3 = 0;
                this.disabledFilledBackgroundColor = colorStateList10.getColorForState(new int[]{-16842910}, -1);
                this.hoveredFilledBackgroundColor = colorStateList10.getColorForState(new int[]{16843623}, -1);
            }
        } else {
            i3 = 0;
            this.boxBackgroundColor = 0;
            this.defaultFilledBackgroundColor = 0;
            this.disabledFilledBackgroundColor = 0;
            this.focusedFilledBackgroundColor = 0;
            this.hoveredFilledBackgroundColor = 0;
        }
        if (tintTypedArray.hasValue(1)) {
            ColorStateList colorStateList11 = tintTypedArray.getColorStateList(1);
            this.focusedTextColor = colorStateList11;
            this.defaultHintTextColor = colorStateList11;
        }
        ColorStateList colorStateList12 = MaterialResources.getColorStateList(context2, tintTypedArray, 12);
        this.focusedStrokeColor = tintTypedArray.getColor(12, i3);
        Object obj = ContextCompat.sLock;
        this.defaultStrokeColor = context2.getColor(R.color.mtrl_textinput_default_box_stroke_color);
        this.disabledColor = context2.getColor(R.color.mtrl_textinput_disabled_color);
        this.hoveredStrokeColor = context2.getColor(R.color.mtrl_textinput_hovered_box_stroke_color);
        if (colorStateList12 != null) {
            if (colorStateList12.isStateful()) {
                this.defaultStrokeColor = colorStateList12.getDefaultColor();
                this.disabledColor = colorStateList12.getColorForState(new int[]{-16842910}, -1);
                this.hoveredStrokeColor = colorStateList12.getColorForState(new int[]{16843623, 16842910}, -1);
                this.focusedStrokeColor = colorStateList12.getColorForState(new int[]{16842908, 16842910}, -1);
            } else if (this.focusedStrokeColor != colorStateList12.getDefaultColor()) {
                this.focusedStrokeColor = colorStateList12.getDefaultColor();
            }
            updateTextInputBoxState();
        }
        if (tintTypedArray.hasValue(13) && this.strokeErrorColor != (colorStateList8 = MaterialResources.getColorStateList(context2, tintTypedArray, 13))) {
            this.strokeErrorColor = colorStateList8;
            updateTextInputBoxState();
        }
        if (tintTypedArray.getResourceId(42, -1) != -1) {
            r1 = 0;
            r1 = 0;
            collapsingTextHelper.setCollapsedTextAppearance(tintTypedArray.getResourceId(42, 0));
            this.focusedTextColor = collapsingTextHelper.collapsedTextColor;
            if (this.editText != null) {
                updateLabelState(false, false);
                updateInputLayoutMargins();
            }
        } else {
            r1 = 0;
        }
        int i9 = r1 == true ? 1 : 0;
        int i10 = r1 == true ? 1 : 0;
        int i11 = r1 == true ? 1 : 0;
        int resourceId = tintTypedArray.getResourceId(33, i9);
        CharSequence text2 = tintTypedArray.getText(28);
        boolean z5 = tintTypedArray.getBoolean(29, r1);
        CheckableImageButton checkableImageButton = (CheckableImageButton) LayoutInflater.from(getContext()).inflate((int) R.layout.design_text_input_end_icon, linearLayout2, (boolean) r1);
        this.errorIconView = checkableImageButton;
        checkableImageButton.setId(R.id.text_input_error_icon);
        checkableImageButton.setVisibility(8);
        if (MaterialResources.isFontScaleAtLeast1_3(context2)) {
            ((ViewGroup.MarginLayoutParams) checkableImageButton.getLayoutParams()).setMarginStart(r1);
        }
        if (tintTypedArray.hasValue(30)) {
            setErrorIconDrawable(tintTypedArray.getDrawable(30));
        }
        if (tintTypedArray.hasValue(31)) {
            ColorStateList colorStateList13 = MaterialResources.getColorStateList(context2, tintTypedArray, 31);
            this.errorIconTintList = colorStateList13;
            Drawable drawable = checkableImageButton.getDrawable();
            if (drawable != null) {
                drawable = drawable.mutate();
                drawable.setTintList(colorStateList13);
            }
            if (checkableImageButton.getDrawable() != drawable) {
                checkableImageButton.setImageDrawable(drawable);
            }
        }
        if (tintTypedArray.hasValue(32)) {
            PorterDuff.Mode parseTintMode4 = ViewUtils.parseTintMode(tintTypedArray.getInt(32, -1), null);
            Drawable drawable2 = checkableImageButton.getDrawable();
            if (drawable2 != null) {
                drawable2 = drawable2.mutate();
                drawable2.setTintMode(parseTintMode4);
            }
            if (checkableImageButton.getDrawable() != drawable2) {
                checkableImageButton.setImageDrawable(drawable2);
            }
        }
        checkableImageButton.setContentDescription(getResources().getText(R.string.error_icon_content_description));
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        checkableImageButton.setImportantForAccessibility(2);
        checkableImageButton.setClickable(false);
        checkableImageButton.pressable = false;
        checkableImageButton.setFocusable(false);
        int resourceId2 = tintTypedArray.getResourceId(38, 0);
        boolean z6 = tintTypedArray.getBoolean(37, false);
        CharSequence text3 = tintTypedArray.getText(36);
        int resourceId3 = tintTypedArray.getResourceId(50, 0);
        CharSequence text4 = tintTypedArray.getText(49);
        int resourceId4 = tintTypedArray.getResourceId(53, 0);
        CharSequence text5 = tintTypedArray.getText(52);
        int resourceId5 = tintTypedArray.getResourceId(63, 0);
        CharSequence text6 = tintTypedArray.getText(62);
        boolean z7 = tintTypedArray.getBoolean(16, false);
        int i12 = tintTypedArray.getInt(17, -1);
        if (this.counterMaxLength != i12) {
            if (i12 > 0) {
                this.counterMaxLength = i12;
            } else {
                this.counterMaxLength = -1;
            }
            if (this.counterEnabled) {
                updateCounter();
            }
        }
        this.counterTextAppearance = tintTypedArray.getResourceId(20, 0);
        this.counterOverflowTextAppearance = tintTypedArray.getResourceId(18, 0);
        CheckableImageButton checkableImageButton2 = (CheckableImageButton) LayoutInflater.from(getContext()).inflate(R.layout.design_text_input_start_icon, (ViewGroup) linearLayout, false);
        this.startIconView = checkableImageButton2;
        checkableImageButton2.setVisibility(8);
        if (MaterialResources.isFontScaleAtLeast1_3(context2)) {
            ((ViewGroup.MarginLayoutParams) checkableImageButton2.getLayoutParams()).setMarginEnd(0);
        }
        View.OnLongClickListener onLongClickListener = this.startIconOnLongClickListener;
        checkableImageButton2.setOnClickListener(null);
        setIconClickable(checkableImageButton2, onLongClickListener);
        this.startIconOnLongClickListener = null;
        checkableImageButton2.setOnLongClickListener(null);
        setIconClickable(checkableImageButton2, null);
        if (tintTypedArray.hasValue(59)) {
            Drawable drawable3 = tintTypedArray.getDrawable(59);
            checkableImageButton2.setImageDrawable(drawable3);
            if (drawable3 != null) {
                setStartIconVisible(true);
                refreshIconDrawableState(checkableImageButton2, this.startIconTintList);
            } else {
                setStartIconVisible(false);
                View.OnLongClickListener onLongClickListener2 = this.startIconOnLongClickListener;
                checkableImageButton2.setOnClickListener(null);
                setIconClickable(checkableImageButton2, onLongClickListener2);
                this.startIconOnLongClickListener = null;
                checkableImageButton2.setOnLongClickListener(null);
                setIconClickable(checkableImageButton2, null);
                if (checkableImageButton2.getContentDescription() != null) {
                    checkableImageButton2.setContentDescription(null);
                }
            }
            if (tintTypedArray.hasValue(58) && checkableImageButton2.getContentDescription() != (text = tintTypedArray.getText(58))) {
                checkableImageButton2.setContentDescription(text);
            }
            boolean z8 = tintTypedArray.getBoolean(57, true);
            if (checkableImageButton2.checkable != z8) {
                checkableImageButton2.checkable = z8;
                checkableImageButton2.sendAccessibilityEvent(0);
            }
        }
        if (!tintTypedArray.hasValue(60) || this.startIconTintList == (colorStateList7 = MaterialResources.getColorStateList(context2, tintTypedArray, 60))) {
            view = checkableImageButton2;
            z2 = z6;
            z = z5;
            typedArray = obtainStyledAttributes;
            charSequence2 = text2;
            view2 = checkableImageButton;
            i6 = resourceId3;
            charSequence = text4;
            i5 = resourceId4;
            charSequence3 = text5;
            i4 = resourceId5;
            z3 = z7;
            i7 = resourceId;
            i8 = R.layout.design_text_input_end_icon;
        } else {
            this.startIconTintList = colorStateList7;
            this.hasStartIconTintList = true;
            boolean z9 = this.hasStartIconTintMode;
            PorterDuff.Mode mode = this.startIconTintMode;
            charSequence2 = text2;
            view2 = checkableImageButton;
            i6 = resourceId3;
            i5 = resourceId4;
            i4 = resourceId5;
            z3 = z7;
            charSequence = text4;
            charSequence3 = text5;
            view = checkableImageButton2;
            i7 = resourceId;
            i8 = R.layout.design_text_input_end_icon;
            z2 = z6;
            z = z5;
            typedArray = obtainStyledAttributes;
            applyIconTint(checkableImageButton2, true, colorStateList7, z9, mode);
        }
        if (tintTypedArray.hasValue(61) && this.startIconTintMode != (parseTintMode3 = ViewUtils.parseTintMode(tintTypedArray.getInt(61, -1), null))) {
            this.startIconTintMode = parseTintMode3;
            this.hasStartIconTintMode = true;
            applyIconTint(view, this.hasStartIconTintList, this.startIconTintList, true, parseTintMode3);
        }
        int i13 = tintTypedArray.getInt(6, 0);
        if (i13 != this.boxBackgroundMode) {
            this.boxBackgroundMode = i13;
            if (this.editText != null) {
                onApplyBoxBackgroundMode();
            }
        }
        CheckableImageButton checkableImageButton3 = (CheckableImageButton) LayoutInflater.from(getContext()).inflate(i8, (ViewGroup) frameLayout2, false);
        this.endIconView = checkableImageButton3;
        frameLayout2.addView(checkableImageButton3);
        checkableImageButton3.setVisibility(8);
        if (MaterialResources.isFontScaleAtLeast1_3(context2)) {
            ((ViewGroup.MarginLayoutParams) checkableImageButton3.getLayoutParams()).setMarginStart(0);
        }
        sparseArray.append(-1, new CustomEndIconDelegate(this));
        sparseArray.append(0, new NoEndIconDelegate(this));
        sparseArray.append(1, new PasswordToggleEndIconDelegate(this));
        sparseArray.append(2, new ClearTextEndIconDelegate(this));
        sparseArray.append(3, new DropdownMenuEndIconDelegate(this));
        if (tintTypedArray.hasValue(25)) {
            setEndIconMode(tintTypedArray.getInt(25, 0));
            if (tintTypedArray.hasValue(24)) {
                setEndIconDrawable(tintTypedArray.getDrawable(24));
            }
            if (tintTypedArray.hasValue(23)) {
                setEndIconContentDescription(tintTypedArray.getText(23));
            }
            setEndIconCheckable(tintTypedArray.getBoolean(22, true));
        } else if (tintTypedArray.hasValue(46)) {
            setEndIconMode(tintTypedArray.getBoolean(46, false) ? 1 : 0);
            setEndIconDrawable(tintTypedArray.getDrawable(45));
            setEndIconContentDescription(tintTypedArray.getText(44));
            if (tintTypedArray.hasValue(47) && this.endIconTintList != (colorStateList6 = MaterialResources.getColorStateList(context2, tintTypedArray, 47))) {
                this.endIconTintList = colorStateList6;
                this.hasEndIconTintList = true;
                applyEndIconTint();
            }
            if (tintTypedArray.hasValue(48) && this.endIconTintMode != (parseTintMode2 = ViewUtils.parseTintMode(tintTypedArray.getInt(48, -1), null))) {
                this.endIconTintMode = parseTintMode2;
                this.hasEndIconTintMode = true;
                applyEndIconTint();
            }
        }
        if (!tintTypedArray.hasValue(46)) {
            if (tintTypedArray.hasValue(26) && this.endIconTintList != (colorStateList5 = MaterialResources.getColorStateList(context2, tintTypedArray, 26))) {
                this.endIconTintList = colorStateList5;
                this.hasEndIconTintList = true;
                applyEndIconTint();
            }
            if (tintTypedArray.hasValue(27) && this.endIconTintMode != (parseTintMode = ViewUtils.parseTintMode(tintTypedArray.getInt(27, -1), null))) {
                this.endIconTintMode = parseTintMode;
                this.hasEndIconTintMode = true;
                applyEndIconTint();
            }
        }
        AppCompatTextView appCompatTextView = new AppCompatTextView(context2);
        this.prefixTextView = appCompatTextView;
        appCompatTextView.setId(R.id.textinput_prefix_text);
        appCompatTextView.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
        appCompatTextView.setAccessibilityLiveRegion(1);
        linearLayout.addView(view);
        linearLayout.addView(appCompatTextView);
        AppCompatTextView appCompatTextView2 = new AppCompatTextView(context2);
        this.suffixTextView = appCompatTextView2;
        appCompatTextView2.setId(R.id.textinput_suffix_text);
        appCompatTextView2.setLayoutParams(new FrameLayout.LayoutParams(-2, -2, 80));
        appCompatTextView2.setAccessibilityLiveRegion(1);
        linearLayout2.addView(appCompatTextView2);
        linearLayout2.addView(view2);
        linearLayout2.addView(frameLayout2);
        setHelperTextEnabled(z2);
        setHelperText(text3);
        indicatorViewController.helperTextTextAppearance = resourceId2;
        TextView textView = indicatorViewController.helperTextView;
        if (textView != null) {
            textView.setTextAppearance(resourceId2);
        }
        setErrorEnabled(z);
        int i14 = i7;
        indicatorViewController.errorTextAppearance = i14;
        TextView textView2 = indicatorViewController.errorView;
        if (textView2 != null) {
            indicatorViewController.textInputView.setTextAppearanceCompatWithErrorFallback(textView2, i14);
        }
        CharSequence charSequence4 = charSequence2;
        indicatorViewController.errorViewContentDescription = charSequence4;
        TextView textView3 = indicatorViewController.errorView;
        if (textView3 != null) {
            textView3.setContentDescription(charSequence4);
        }
        setPlaceholderText(charSequence);
        int i15 = i6;
        this.placeholderTextAppearance = i15;
        TextView textView4 = this.placeholderTextView;
        if (textView4 != null) {
            textView4.setTextAppearance(i15);
        }
        this.prefixText = TextUtils.isEmpty(charSequence3) ? null : charSequence3;
        appCompatTextView.setText(charSequence3);
        updatePrefixTextVisibility();
        appCompatTextView.setTextAppearance(i5);
        this.suffixText = TextUtils.isEmpty(text6) ? null : text6;
        appCompatTextView2.setText(text6);
        updateSuffixTextVisibility();
        appCompatTextView2.setTextAppearance(i4);
        if (tintTypedArray.hasValue(34)) {
            ColorStateList colorStateList14 = tintTypedArray.getColorStateList(34);
            indicatorViewController.errorViewTextColor = colorStateList14;
            TextView textView5 = indicatorViewController.errorView;
            if (!(textView5 == null || colorStateList14 == null)) {
                textView5.setTextColor(colorStateList14);
            }
        }
        if (tintTypedArray.hasValue(39)) {
            ColorStateList colorStateList15 = tintTypedArray.getColorStateList(39);
            indicatorViewController.helperTextViewTextColor = colorStateList15;
            TextView textView6 = indicatorViewController.helperTextView;
            if (!(textView6 == null || colorStateList15 == null)) {
                textView6.setTextColor(colorStateList15);
            }
        }
        if (tintTypedArray.hasValue(43) && this.focusedTextColor != (colorStateList4 = tintTypedArray.getColorStateList(43))) {
            if (this.defaultHintTextColor != null || collapsingTextHelper.collapsedTextColor == colorStateList4) {
                z4 = false;
            } else {
                collapsingTextHelper.collapsedTextColor = colorStateList4;
                z4 = false;
                collapsingTextHelper.recalculate(false);
            }
            this.focusedTextColor = colorStateList4;
            if (this.editText != null) {
                updateLabelState(z4, z4);
            }
        }
        if (tintTypedArray.hasValue(21) && this.counterTextColor != (colorStateList3 = tintTypedArray.getColorStateList(21))) {
            this.counterTextColor = colorStateList3;
            updateCounterTextAppearanceAndColor();
        }
        if (tintTypedArray.hasValue(19) && this.counterOverflowTextColor != (colorStateList2 = tintTypedArray.getColorStateList(19))) {
            this.counterOverflowTextColor = colorStateList2;
            updateCounterTextAppearanceAndColor();
        }
        if (tintTypedArray.hasValue(51) && this.placeholderTextColor != (colorStateList = tintTypedArray.getColorStateList(51))) {
            this.placeholderTextColor = colorStateList;
            TextView textView7 = this.placeholderTextView;
            if (!(textView7 == null || colorStateList == null)) {
                textView7.setTextColor(colorStateList);
            }
        }
        if (tintTypedArray.hasValue(54)) {
            appCompatTextView.setTextColor(tintTypedArray.getColorStateList(54));
        }
        if (tintTypedArray.hasValue(64)) {
            appCompatTextView2.setTextColor(tintTypedArray.getColorStateList(64));
        }
        boolean z10 = z3;
        if (this.counterEnabled != z10) {
            if (z10) {
                AppCompatTextView appCompatTextView3 = new AppCompatTextView(getContext());
                this.counterView = appCompatTextView3;
                appCompatTextView3.setId(R.id.textinput_counter);
                this.counterView.setMaxLines(1);
                indicatorViewController.addIndicator(this.counterView, 2);
                ((ViewGroup.MarginLayoutParams) this.counterView.getLayoutParams()).setMarginStart(getResources().getDimensionPixelOffset(R.dimen.mtrl_textinput_counter_margin_start));
                updateCounterTextAppearanceAndColor();
                updateCounter();
            } else {
                indicatorViewController.removeIndicator(this.counterView, 2);
                this.counterView = null;
            }
            this.counterEnabled = z10;
        }
        setEnabled(tintTypedArray.getBoolean(0, true));
        typedArray.recycle();
        setImportantForAccessibility(2);
        setImportantForAutofill(1);
    }

    public void updateCounter(int i) {
        String str;
        boolean z = this.counterOverflowed;
        int i2 = this.counterMaxLength;
        String str2 = null;
        if (i2 == -1) {
            this.counterView.setText(String.valueOf(i));
            this.counterView.setContentDescription(null);
            this.counterOverflowed = false;
        } else {
            this.counterOverflowed = i > i2;
            Context context = getContext();
            this.counterView.setContentDescription(context.getString(this.counterOverflowed ? R.string.character_counter_overflowed_content_description : R.string.character_counter_content_description, Integer.valueOf(i), Integer.valueOf(this.counterMaxLength)));
            if (z != this.counterOverflowed) {
                updateCounterTextAppearanceAndColor();
            }
            TextDirectionHeuristicCompat textDirectionHeuristicCompat = BidiFormatter.DEFAULT_TEXT_DIRECTION_HEURISTIC;
            Locale locale = Locale.getDefault();
            int i3 = TextUtilsCompat.$r8$clinit;
            boolean z2 = TextUtils.getLayoutDirectionFromLocale(locale) == 1;
            TextDirectionHeuristicCompat textDirectionHeuristicCompat2 = BidiFormatter.DEFAULT_TEXT_DIRECTION_HEURISTIC;
            BidiFormatter bidiFormatter = z2 ? BidiFormatter.DEFAULT_RTL_INSTANCE : BidiFormatter.DEFAULT_LTR_INSTANCE;
            TextView textView = this.counterView;
            String string = getContext().getString(R.string.character_counter_pattern, Integer.valueOf(i), Integer.valueOf(this.counterMaxLength));
            TextDirectionHeuristicCompat textDirectionHeuristicCompat3 = bidiFormatter.mDefaultTextDirectionHeuristicCompat;
            if (string != null) {
                boolean isRtl = ((TextDirectionHeuristicsCompat.TextDirectionHeuristicImpl) textDirectionHeuristicCompat3).isRtl(string, 0, string.length());
                SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
                String str3 = "";
                if ((bidiFormatter.mFlags & 2) != 0) {
                    boolean isRtl2 = ((TextDirectionHeuristicsCompat.TextDirectionHeuristicImpl) (isRtl ? TextDirectionHeuristicsCompat.RTL : TextDirectionHeuristicsCompat.LTR)).isRtl(string, 0, string.length());
                    if (bidiFormatter.mIsRtlContext || (!isRtl2 && BidiFormatter.getEntryDir(string) != 1)) {
                        str = (!bidiFormatter.mIsRtlContext || (isRtl2 && BidiFormatter.getEntryDir(string) != -1)) ? str3 : BidiFormatter.RLM_STRING;
                    } else {
                        str = BidiFormatter.LRM_STRING;
                    }
                    spannableStringBuilder.append((CharSequence) str);
                }
                if (isRtl != bidiFormatter.mIsRtlContext) {
                    spannableStringBuilder.append(isRtl ? (char) 8235 : (char) 8234);
                    spannableStringBuilder.append((CharSequence) string);
                    spannableStringBuilder.append((char) 8236);
                } else {
                    spannableStringBuilder.append((CharSequence) string);
                }
                boolean isRtl3 = ((TextDirectionHeuristicsCompat.TextDirectionHeuristicImpl) (isRtl ? TextDirectionHeuristicsCompat.RTL : TextDirectionHeuristicsCompat.LTR)).isRtl(string, 0, string.length());
                if (!bidiFormatter.mIsRtlContext && (isRtl3 || BidiFormatter.getExitDir(string) == 1)) {
                    str3 = BidiFormatter.LRM_STRING;
                } else if (bidiFormatter.mIsRtlContext && (!isRtl3 || BidiFormatter.getExitDir(string) == -1)) {
                    str3 = BidiFormatter.RLM_STRING;
                }
                spannableStringBuilder.append((CharSequence) str3);
                str2 = spannableStringBuilder.toString();
            }
            textView.setText(str2);
        }
        if (this.editText != null && z != this.counterOverflowed) {
            updateLabelState(false, false);
            updateTextInputBoxState();
            updateEditTextBackground();
        }
    }
}
