package com.google.android.material.textfield;

import android.animation.ValueAnimator;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
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
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStructure;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.LinearInterpolator;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.content.res.AppCompatResources;
import androidx.appcompat.widget.AppCompatDrawableManager;
import androidx.appcompat.widget.AppCompatTextView;
import androidx.appcompat.widget.DrawableUtils;
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
import androidx.transition.Fade;
import androidx.transition.TransitionManager;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.animation.AnimationUtils;
import com.google.android.material.internal.CheckableImageButton;
import com.google.android.material.internal.CollapsingTextHelper;
import com.google.android.material.internal.DescendantOffsetUtils;
import com.google.android.material.internal.ViewUtils;
import com.google.android.material.resources.MaterialResources;
import com.google.android.material.shape.AbsoluteCornerSize;
import com.google.android.material.shape.MaterialShapeDrawable;
import com.google.android.material.shape.ShapeAppearanceModel;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class TextInputLayout extends LinearLayout {
    public ValueAnimator animator;
    public boolean areCornerRadiiRtl;
    public MaterialShapeDrawable boxBackground;
    public int boxBackgroundColor;
    public int boxBackgroundMode;
    public int boxCollapsedPaddingTopPx;
    public final int boxLabelCutoutPaddingPx;
    public int boxStrokeColor;
    public int boxStrokeWidthDefaultPx;
    public int boxStrokeWidthFocusedPx;
    public int boxStrokeWidthPx;
    public MaterialShapeDrawable boxUnderlineDefault;
    public MaterialShapeDrawable boxUnderlineFocused;
    public final CollapsingTextHelper collapsingTextHelper;
    public boolean counterEnabled;
    public int counterMaxLength;
    public int counterOverflowTextAppearance;
    public ColorStateList counterOverflowTextColor;
    public boolean counterOverflowed;
    public int counterTextAppearance;
    public ColorStateList counterTextColor;
    public AppCompatTextView counterView;
    public int defaultFilledBackgroundColor;
    public ColorStateList defaultHintTextColor;
    public int defaultStrokeColor;
    public int disabledColor;
    public int disabledFilledBackgroundColor;
    public EditText editText;
    public final LinkedHashSet<OnEditTextAttachedListener> editTextAttachedListeners;
    public ColorDrawable endDummyDrawable;
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
    public PorterDuff.Mode errorIconTintMode;
    public final CheckableImageButton errorIconView;
    public boolean expandedHintEnabled;
    public int focusedFilledBackgroundColor;
    public int focusedStrokeColor;
    public ColorStateList focusedTextColor;
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
    public int maxEms;
    public int maxWidth;
    public int minEms;
    public int minWidth;
    public Drawable originalEditTextEndDrawable;
    public CharSequence originalHint;
    public boolean placeholderEnabled;
    public Fade placeholderFadeIn;
    public Fade placeholderFadeOut;
    public CharSequence placeholderText;
    public int placeholderTextAppearance;
    public ColorStateList placeholderTextColor;
    public AppCompatTextView placeholderTextView;
    public CharSequence prefixText;
    public final AppCompatTextView prefixTextView;
    public boolean restoringSavedState;
    public ShapeAppearanceModel shapeAppearanceModel;
    public ColorDrawable startDummyDrawable;
    public int startDummyDrawableWidth;
    public View.OnLongClickListener startIconOnLongClickListener;
    public ColorStateList startIconTintList;
    public PorterDuff.Mode startIconTintMode;
    public final CheckableImageButton startIconView;
    public final LinearLayout startLayout;
    public ColorStateList strokeErrorColor;
    public CharSequence suffixText;
    public final AppCompatTextView suffixTextView;
    public final Rect tmpBoundsRect;
    public final Rect tmpRect;
    public final RectF tmpRectF;

    /* loaded from: classes.dex */
    public static class AccessibilityDelegate extends AccessibilityDelegateCompat {
        public final TextInputLayout layout;

        @Override // androidx.core.view.AccessibilityDelegateCompat
        public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
            Editable editable;
            CharSequence charSequence;
            boolean z;
            String str;
            AppCompatTextView appCompatTextView;
            this.mOriginalDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat.mInfo);
            EditText editText = this.layout.editText;
            CharSequence charSequence2 = null;
            if (editText != null) {
                editable = editText.getText();
            } else {
                editable = null;
            }
            CharSequence hint = this.layout.getHint();
            CharSequence error = this.layout.getError();
            TextInputLayout textInputLayout = this.layout;
            if (textInputLayout.placeholderEnabled) {
                charSequence = textInputLayout.placeholderText;
            } else {
                charSequence = null;
            }
            int i = textInputLayout.counterMaxLength;
            if (textInputLayout.counterEnabled && textInputLayout.counterOverflowed && (appCompatTextView = textInputLayout.counterView) != null) {
                charSequence2 = appCompatTextView.getContentDescription();
            }
            boolean z2 = !TextUtils.isEmpty(editable);
            boolean z3 = !TextUtils.isEmpty(hint);
            boolean z4 = !this.layout.isHintExpanded();
            boolean z5 = !TextUtils.isEmpty(error);
            boolean z6 = false;
            if (z5 || !TextUtils.isEmpty(charSequence2)) {
                z = true;
            } else {
                z = false;
            }
            if (this.layout.prefixTextView.getVisibility() == 0) {
                z6 = true;
            }
            if (z3) {
                str = hint.toString();
            } else {
                str = "";
            }
            if (z6) {
                accessibilityNodeInfoCompat.mInfo.setLabelFor(this.layout.prefixTextView);
                accessibilityNodeInfoCompat.mInfo.setTraversalAfter(this.layout.prefixTextView);
            } else {
                accessibilityNodeInfoCompat.mInfo.setTraversalAfter(this.layout.startIconView);
            }
            if (z2) {
                accessibilityNodeInfoCompat.mInfo.setText(editable);
            } else if (!TextUtils.isEmpty(str)) {
                accessibilityNodeInfoCompat.mInfo.setText(str);
                if (z4 && charSequence != null) {
                    accessibilityNodeInfoCompat.mInfo.setText(str + ", " + ((Object) charSequence));
                }
            } else if (charSequence != null) {
                accessibilityNodeInfoCompat.mInfo.setText(charSequence);
            }
            if (!TextUtils.isEmpty(str)) {
                accessibilityNodeInfoCompat.mInfo.setHintText(str);
                accessibilityNodeInfoCompat.mInfo.setShowingHintText(!z2);
            }
            if (editable == null || editable.length() != i) {
                i = -1;
            }
            accessibilityNodeInfoCompat.mInfo.setMaxTextLength(i);
            if (z) {
                if (!z5) {
                    error = charSequence2;
                }
                accessibilityNodeInfoCompat.mInfo.setError(error);
            }
            AppCompatTextView appCompatTextView2 = this.layout.indicatorViewController.helperTextView;
            if (appCompatTextView2 != null) {
                accessibilityNodeInfoCompat.mInfo.setLabelFor(appCompatTextView2);
            }
        }

        public AccessibilityDelegate(TextInputLayout textInputLayout) {
            this.layout = textInputLayout;
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
        public CharSequence error;
        public CharSequence helperText;
        public CharSequence hintText;
        public boolean isEndIconChecked;
        public CharSequence placeholderText;

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.error = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            this.isEndIconChecked = parcel.readInt() != 1 ? false : true;
            this.hintText = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            this.helperText = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
            this.placeholderText = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        }

        public final String toString() {
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
        public final void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mSuperState, i);
            TextUtils.writeToParcel(this.error, parcel, i);
            parcel.writeInt(this.isEndIconChecked ? 1 : 0);
            TextUtils.writeToParcel(this.hintText, parcel, i);
            TextUtils.writeToParcel(this.helperText, parcel, i);
            TextUtils.writeToParcel(this.placeholderText, parcel, i);
        }
    }

    public TextInputLayout(Context context) {
        this(context, null);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchRestoreInstanceState(SparseArray<Parcelable> sparseArray) {
        this.restoringSavedState = true;
        super.dispatchRestoreInstanceState(sparseArray);
        this.restoringSavedState = false;
    }

    public final void setTextAppearanceCompatWithErrorFallback(TextView textView, int i) {
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

    public TextInputLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.textInputStyle);
    }

    public static void setIconClickable(CheckableImageButton checkableImageButton, View.OnLongClickListener onLongClickListener) {
        boolean z;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        boolean hasOnClickListeners = ViewCompat.Api15Impl.hasOnClickListeners(checkableImageButton);
        boolean z2 = false;
        int i = 1;
        if (onLongClickListener != null) {
            z = true;
        } else {
            z = false;
        }
        if (hasOnClickListeners || z) {
            z2 = true;
        }
        checkableImageButton.setFocusable(z2);
        checkableImageButton.setClickable(hasOnClickListeners);
        checkableImageButton.pressable = hasOnClickListeners;
        checkableImageButton.setLongClickable(z);
        if (!z2) {
            i = 2;
        }
        ViewCompat.Api16Impl.setImportantForAccessibility(checkableImageButton, i);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
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
                int i2 = this.minEms;
                if (i2 != -1) {
                    this.minEms = i2;
                    if (!(editText == null || i2 == -1)) {
                        editText.setMinEms(i2);
                    }
                } else {
                    int i3 = this.minWidth;
                    this.minWidth = i3;
                    if (!(editText == null || i3 == -1)) {
                        editText.setMinWidth(i3);
                    }
                }
                int i4 = this.maxEms;
                if (i4 != -1) {
                    this.maxEms = i4;
                    EditText editText2 = this.editText;
                    if (!(editText2 == null || i4 == -1)) {
                        editText2.setMaxEms(i4);
                    }
                } else {
                    int i5 = this.maxWidth;
                    this.maxWidth = i5;
                    EditText editText3 = this.editText;
                    if (!(editText3 == null || i5 == -1)) {
                        editText3.setMaxWidth(i5);
                    }
                }
                onApplyBoxBackgroundMode();
                AccessibilityDelegate accessibilityDelegate = new AccessibilityDelegate(this);
                EditText editText4 = this.editText;
                if (editText4 != null) {
                    ViewCompat.setAccessibilityDelegate(editText4, accessibilityDelegate);
                }
                CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
                Typeface typeface = this.editText.getTypeface();
                boolean collapsedTypefaceInternal = collapsingTextHelper.setCollapsedTypefaceInternal(typeface);
                boolean expandedTypefaceInternal = collapsingTextHelper.setExpandedTypefaceInternal(typeface);
                if (collapsedTypefaceInternal || expandedTypefaceInternal) {
                    collapsingTextHelper.recalculate(false);
                }
                CollapsingTextHelper collapsingTextHelper2 = this.collapsingTextHelper;
                float textSize = this.editText.getTextSize();
                if (collapsingTextHelper2.expandedTextSize != textSize) {
                    collapsingTextHelper2.expandedTextSize = textSize;
                    collapsingTextHelper2.recalculate(false);
                }
                CollapsingTextHelper collapsingTextHelper3 = this.collapsingTextHelper;
                float letterSpacing = this.editText.getLetterSpacing();
                if (collapsingTextHelper3.expandedLetterSpacing != letterSpacing) {
                    collapsingTextHelper3.expandedLetterSpacing = letterSpacing;
                    collapsingTextHelper3.recalculate(false);
                }
                int gravity = this.editText.getGravity();
                CollapsingTextHelper collapsingTextHelper4 = this.collapsingTextHelper;
                int i6 = (gravity & (-113)) | 48;
                if (collapsingTextHelper4.collapsedTextGravity != i6) {
                    collapsingTextHelper4.collapsedTextGravity = i6;
                    collapsingTextHelper4.recalculate(false);
                }
                CollapsingTextHelper collapsingTextHelper5 = this.collapsingTextHelper;
                if (collapsingTextHelper5.expandedTextGravity != gravity) {
                    collapsingTextHelper5.expandedTextGravity = gravity;
                    collapsingTextHelper5.recalculate(false);
                }
                this.editText.addTextChangedListener(new TextWatcher() { // from class: com.google.android.material.textfield.TextInputLayout.1
                    @Override // android.text.TextWatcher
                    public final void beforeTextChanged(CharSequence charSequence, int i7, int i8, int i9) {
                    }

                    @Override // android.text.TextWatcher
                    public final void onTextChanged(CharSequence charSequence, int i7, int i8, int i9) {
                    }

                    @Override // android.text.TextWatcher
                    public final void afterTextChanged(Editable editable) {
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
                    public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                        TextInputLayout.this.collapsingTextHelper.setExpansionFraction(((Float) valueAnimator2.getAnimatedValue()).floatValue());
                    }
                });
            }
            this.animator.setFloatValues(this.collapsingTextHelper.expandedFraction, f);
            this.animator.start();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00ca  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void applyBoxAttributes() {
        /*
            Method dump skipped, instructions count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.textfield.TextInputLayout.applyBoxAttributes():void");
    }

    public final int calculateLabelMarginTop() {
        float collapsedTextHeight;
        if (!this.hintEnabled) {
            return 0;
        }
        int i = this.boxBackgroundMode;
        if (i == 0) {
            collapsedTextHeight = this.collapsingTextHelper.getCollapsedTextHeight();
        } else if (i != 2) {
            return 0;
        } else {
            collapsedTextHeight = this.collapsingTextHelper.getCollapsedTextHeight() / 2.0f;
        }
        return (int) collapsedTextHeight;
    }

    public final boolean cutoutEnabled() {
        if (!this.hintEnabled || TextUtils.isEmpty(this.hint) || !(this.boxBackground instanceof CutoutDrawable)) {
            return false;
        }
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    @TargetApi(26)
    public final void dispatchProvideAutofillStructure(ViewStructure viewStructure, int i) {
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
    public final void drawableStateChanged() {
        boolean z;
        if (!this.inDrawableStateChanged) {
            boolean z2 = true;
            this.inDrawableStateChanged = true;
            super.drawableStateChanged();
            int[] drawableState = getDrawableState();
            CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
            if (collapsingTextHelper != null) {
                z = collapsingTextHelper.setState(drawableState) | false;
            } else {
                z = false;
            }
            if (this.editText != null) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                if (!ViewCompat.Api19Impl.isLaidOut(this) || !isEnabled()) {
                    z2 = false;
                }
                updateLabelState(z2, false);
            }
            updateEditTextBackground();
            updateTextInputBoxState();
            if (z) {
                invalidate();
            }
            this.inDrawableStateChanged = false;
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final int getBaseline() {
        EditText editText = this.editText;
        if (editText == null) {
            return super.getBaseline();
        }
        int baseline = editText.getBaseline();
        return calculateLabelMarginTop() + getPaddingTop() + baseline;
    }

    public final EndIconDelegate getEndIconDelegate() {
        EndIconDelegate endIconDelegate = this.endIconDelegates.get(this.endIconMode);
        if (endIconDelegate != null) {
            return endIconDelegate;
        }
        return this.endIconDelegates.get(0);
    }

    public final CharSequence getError() {
        IndicatorViewController indicatorViewController = this.indicatorViewController;
        if (indicatorViewController.errorEnabled) {
            return indicatorViewController.errorText;
        }
        return null;
    }

    public final int getErrorTextCurrentColor() {
        AppCompatTextView appCompatTextView = this.indicatorViewController.errorView;
        if (appCompatTextView != null) {
            return appCompatTextView.getCurrentTextColor();
        }
        return -1;
    }

    public final CharSequence getHint() {
        if (this.hintEnabled) {
            return this.hint;
        }
        return null;
    }

    public final float getHintCollapsedTextHeight() {
        return this.collapsingTextHelper.getCollapsedTextHeight();
    }

    public final int getHintCurrentCollapsedTextColor() {
        CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
        return collapsingTextHelper.getCurrentColor(collapsingTextHelper.collapsedTextColor);
    }

    public final boolean isEndIconVisible() {
        if (this.endIconFrame.getVisibility() == 0 && this.endIconView.getVisibility() == 0) {
            return true;
        }
        return false;
    }

    public final boolean isHelperTextDisplayed() {
        IndicatorViewController indicatorViewController = this.indicatorViewController;
        if (indicatorViewController.captionDisplayed != 2 || indicatorViewController.helperTextView == null || TextUtils.isEmpty(indicatorViewController.helperText)) {
            return false;
        }
        return true;
    }

    public final void onApplyBoxBackgroundMode() {
        boolean z;
        boolean z2;
        int i = this.boxBackgroundMode;
        boolean z3 = true;
        if (i == 0) {
            this.boxBackground = null;
            this.boxUnderlineDefault = null;
            this.boxUnderlineFocused = null;
        } else if (i == 1) {
            this.boxBackground = new MaterialShapeDrawable(this.shapeAppearanceModel);
            this.boxUnderlineDefault = new MaterialShapeDrawable();
            this.boxUnderlineFocused = new MaterialShapeDrawable();
        } else if (i == 2) {
            if (!this.hintEnabled || (this.boxBackground instanceof CutoutDrawable)) {
                this.boxBackground = new MaterialShapeDrawable(this.shapeAppearanceModel);
            } else {
                this.boxBackground = new CutoutDrawable(this.shapeAppearanceModel);
            }
            this.boxUnderlineDefault = null;
            this.boxUnderlineFocused = null;
        } else {
            throw new IllegalArgumentException(this.boxBackgroundMode + " is illegal; only @BoxBackgroundMode constants are supported.");
        }
        EditText editText = this.editText;
        if (editText == null || this.boxBackground == null || editText.getBackground() != null || this.boxBackgroundMode == 0) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            EditText editText2 = this.editText;
            MaterialShapeDrawable materialShapeDrawable = this.boxBackground;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.setBackground(editText2, materialShapeDrawable);
        }
        updateTextInputBoxState();
        if (this.boxBackgroundMode == 1) {
            if (getContext().getResources().getConfiguration().fontScale >= 2.0f) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (z2) {
                this.boxCollapsedPaddingTopPx = getResources().getDimensionPixelSize(R.dimen.material_font_2_0_box_collapsed_padding_top);
            } else if (MaterialResources.isFontScaleAtLeast1_3(getContext())) {
                this.boxCollapsedPaddingTopPx = getResources().getDimensionPixelSize(R.dimen.material_font_1_3_box_collapsed_padding_top);
            }
        }
        if (this.editText != null && this.boxBackgroundMode == 1) {
            if (getContext().getResources().getConfiguration().fontScale < 2.0f) {
                z3 = false;
            }
            if (z3) {
                EditText editText3 = this.editText;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api17Impl.setPaddingRelative(editText3, ViewCompat.Api17Impl.getPaddingStart(editText3), getResources().getDimensionPixelSize(R.dimen.material_filled_edittext_font_2_0_padding_top), ViewCompat.Api17Impl.getPaddingEnd(this.editText), getResources().getDimensionPixelSize(R.dimen.material_filled_edittext_font_2_0_padding_bottom));
            } else if (MaterialResources.isFontScaleAtLeast1_3(getContext())) {
                EditText editText4 = this.editText;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap3 = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api17Impl.setPaddingRelative(editText4, ViewCompat.Api17Impl.getPaddingStart(editText4), getResources().getDimensionPixelSize(R.dimen.material_filled_edittext_font_1_3_padding_top), ViewCompat.Api17Impl.getPaddingEnd(this.editText), getResources().getDimensionPixelSize(R.dimen.material_filled_edittext_font_1_3_padding_bottom));
            }
        }
        if (this.boxBackgroundMode != 0) {
            updateInputLayoutMargins();
        }
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
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
                public final void run() {
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

    public final void setEndIconContentDescription(CharSequence charSequence) {
        if (this.endIconView.getContentDescription() != charSequence) {
            this.endIconView.setContentDescription(charSequence);
        }
    }

    public final void setEndIconDrawable(int i) {
        Drawable drawable;
        if (i != 0) {
            drawable = AppCompatResources.getDrawable(getContext(), i);
        } else {
            drawable = null;
        }
        this.endIconView.setImageDrawable(drawable);
        if (drawable != null) {
            applyIconTint(this.endIconView, this.endIconTintList, this.endIconTintMode);
            refreshIconDrawableState(this.endIconView, this.endIconTintList);
        }
    }

    public final void setEndIconMode(int i) {
        boolean z;
        int i2 = this.endIconMode;
        if (i2 != i) {
            this.endIconMode = i;
            Iterator<OnEndIconChangedListener> it = this.endIconChangedListeners.iterator();
            while (it.hasNext()) {
                it.next().onEndIconChanged(this, i2);
            }
            if (i != 0) {
                z = true;
            } else {
                z = false;
            }
            setEndIconVisible(z);
            if (getEndIconDelegate().isBoxBackgroundModeSupported(this.boxBackgroundMode)) {
                getEndIconDelegate().initialize();
                applyIconTint(this.endIconView, this.endIconTintList, this.endIconTintMode);
                return;
            }
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("The current box background mode ");
            m.append(this.boxBackgroundMode);
            m.append(" is not supported by the end icon mode ");
            m.append(i);
            throw new IllegalStateException(m.toString());
        }
    }

    public final void setError(CharSequence charSequence) {
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

    public final void setErrorEnabled(boolean z) {
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
                AppCompatTextView appCompatTextView2 = indicatorViewController.errorView;
                if (appCompatTextView2 != null) {
                    indicatorViewController.textInputView.setTextAppearanceCompatWithErrorFallback(appCompatTextView2, i);
                }
                ColorStateList colorStateList = indicatorViewController.errorViewTextColor;
                indicatorViewController.errorViewTextColor = colorStateList;
                AppCompatTextView appCompatTextView3 = indicatorViewController.errorView;
                if (!(appCompatTextView3 == null || colorStateList == null)) {
                    appCompatTextView3.setTextColor(colorStateList);
                }
                CharSequence charSequence = indicatorViewController.errorViewContentDescription;
                indicatorViewController.errorViewContentDescription = charSequence;
                AppCompatTextView appCompatTextView4 = indicatorViewController.errorView;
                if (appCompatTextView4 != null) {
                    appCompatTextView4.setContentDescription(charSequence);
                }
                indicatorViewController.errorView.setVisibility(4);
                AppCompatTextView appCompatTextView5 = indicatorViewController.errorView;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api19Impl.setAccessibilityLiveRegion(appCompatTextView5, 1);
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

    public final void setHelperTextEnabled(boolean z) {
        final IndicatorViewController indicatorViewController = this.indicatorViewController;
        if (indicatorViewController.helperTextEnabled != z) {
            indicatorViewController.cancelCaptionAnimator();
            if (z) {
                AppCompatTextView appCompatTextView = new AppCompatTextView(indicatorViewController.context);
                indicatorViewController.helperTextView = appCompatTextView;
                appCompatTextView.setId(R.id.textinput_helper_text);
                indicatorViewController.helperTextView.setTextAlignment(5);
                indicatorViewController.helperTextView.setVisibility(4);
                AppCompatTextView appCompatTextView2 = indicatorViewController.helperTextView;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api19Impl.setAccessibilityLiveRegion(appCompatTextView2, 1);
                int i = indicatorViewController.helperTextTextAppearance;
                indicatorViewController.helperTextTextAppearance = i;
                AppCompatTextView appCompatTextView3 = indicatorViewController.helperTextView;
                if (appCompatTextView3 != null) {
                    appCompatTextView3.setTextAppearance(i);
                }
                ColorStateList colorStateList = indicatorViewController.helperTextViewTextColor;
                indicatorViewController.helperTextViewTextColor = colorStateList;
                AppCompatTextView appCompatTextView4 = indicatorViewController.helperTextView;
                if (!(appCompatTextView4 == null || colorStateList == null)) {
                    appCompatTextView4.setTextColor(colorStateList);
                }
                indicatorViewController.addIndicator(indicatorViewController.helperTextView, 1);
                indicatorViewController.helperTextView.setAccessibilityDelegate(new View.AccessibilityDelegate() { // from class: com.google.android.material.textfield.IndicatorViewController.2
                    @Override // android.view.View.AccessibilityDelegate
                    public final void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfo accessibilityNodeInfo) {
                        super.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfo);
                        EditText editText = IndicatorViewController.this.textInputView.editText;
                        if (editText != null) {
                            accessibilityNodeInfo.setLabeledBy(editText);
                        }
                    }
                });
            } else {
                indicatorViewController.cancelCaptionAnimator();
                int i2 = indicatorViewController.captionDisplayed;
                if (i2 == 2) {
                    indicatorViewController.captionToShow = 0;
                }
                indicatorViewController.updateCaptionViewsVisibility(i2, indicatorViewController.captionToShow, indicatorViewController.shouldAnimateCaptionView(indicatorViewController.helperTextView, ""));
                indicatorViewController.removeIndicator(indicatorViewController.helperTextView, 1);
                indicatorViewController.helperTextView = null;
                indicatorViewController.textInputView.updateEditTextBackground();
                indicatorViewController.textInputView.updateTextInputBoxState();
            }
            indicatorViewController.helperTextEnabled = z;
        }
    }

    public final void setHint(CharSequence charSequence) {
        if (this.hintEnabled) {
            if (!TextUtils.equals(charSequence, this.hint)) {
                this.hint = charSequence;
                CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
                if (charSequence == null || !TextUtils.equals(collapsingTextHelper.text, charSequence)) {
                    collapsingTextHelper.text = charSequence;
                    collapsingTextHelper.textToDraw = null;
                    Bitmap bitmap = collapsingTextHelper.expandedTitleTexture;
                    if (bitmap != null) {
                        bitmap.recycle();
                        collapsingTextHelper.expandedTitleTexture = null;
                    }
                    collapsingTextHelper.recalculate(false);
                }
                if (!this.hintExpanded) {
                    openCutout();
                }
            }
            sendAccessibilityEvent(QuickStepContract.SYSUI_STATE_QUICK_SETTINGS_EXPANDED);
        }
    }

    public final void setPlaceholderText(CharSequence charSequence) {
        if (this.placeholderTextView == null) {
            AppCompatTextView appCompatTextView = new AppCompatTextView(getContext());
            this.placeholderTextView = appCompatTextView;
            appCompatTextView.setId(R.id.textinput_placeholder);
            AppCompatTextView appCompatTextView2 = this.placeholderTextView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.setImportantForAccessibility(appCompatTextView2, 2);
            Fade fade = new Fade();
            fade.mDuration = 87L;
            LinearInterpolator linearInterpolator = AnimationUtils.LINEAR_INTERPOLATOR;
            fade.mInterpolator = linearInterpolator;
            this.placeholderFadeIn = fade;
            fade.mStartDelay = 67L;
            Fade fade2 = new Fade();
            fade2.mDuration = 87L;
            fade2.mInterpolator = linearInterpolator;
            this.placeholderFadeOut = fade2;
            int i = this.placeholderTextAppearance;
            this.placeholderTextAppearance = i;
            AppCompatTextView appCompatTextView3 = this.placeholderTextView;
            if (appCompatTextView3 != null) {
                appCompatTextView3.setTextAppearance(i);
            }
        }
        int i2 = 0;
        if (TextUtils.isEmpty(charSequence)) {
            setPlaceholderTextEnabled(false);
        } else {
            if (!this.placeholderEnabled) {
                setPlaceholderTextEnabled(true);
            }
            this.placeholderText = charSequence;
        }
        EditText editText = this.editText;
        if (editText != null) {
            i2 = editText.getText().length();
        }
        updatePlaceholderText(i2);
    }

    public final void setPlaceholderTextEnabled(boolean z) {
        if (this.placeholderEnabled != z) {
            if (z) {
                AppCompatTextView appCompatTextView = this.placeholderTextView;
                if (appCompatTextView != null) {
                    this.inputFrame.addView(appCompatTextView);
                    this.placeholderTextView.setVisibility(0);
                }
            } else {
                AppCompatTextView appCompatTextView2 = this.placeholderTextView;
                if (appCompatTextView2 != null) {
                    appCompatTextView2.setVisibility(8);
                }
                this.placeholderTextView = null;
            }
            this.placeholderEnabled = z;
        }
    }

    public final void updateCounter(int i) {
        boolean z;
        int i2;
        boolean z2;
        BidiFormatter bidiFormatter;
        boolean z3;
        TextDirectionHeuristicsCompat.TextDirectionHeuristicInternal textDirectionHeuristicInternal;
        char c;
        TextDirectionHeuristicsCompat.TextDirectionHeuristicInternal textDirectionHeuristicInternal2;
        String str;
        boolean z4 = this.counterOverflowed;
        int i3 = this.counterMaxLength;
        String str2 = null;
        if (i3 == -1) {
            this.counterView.setText(String.valueOf(i));
            this.counterView.setContentDescription(null);
            this.counterOverflowed = false;
        } else {
            if (i > i3) {
                z = true;
            } else {
                z = false;
            }
            this.counterOverflowed = z;
            Context context = getContext();
            AppCompatTextView appCompatTextView = this.counterView;
            int i4 = this.counterMaxLength;
            if (this.counterOverflowed) {
                i2 = R.string.character_counter_overflowed_content_description;
            } else {
                i2 = R.string.character_counter_content_description;
            }
            appCompatTextView.setContentDescription(context.getString(i2, Integer.valueOf(i), Integer.valueOf(i4)));
            if (z4 != this.counterOverflowed) {
                updateCounterTextAppearanceAndColor();
            }
            TextDirectionHeuristicsCompat.TextDirectionHeuristicInternal textDirectionHeuristicInternal3 = BidiFormatter.DEFAULT_TEXT_DIRECTION_HEURISTIC;
            Locale locale = Locale.getDefault();
            int i5 = TextUtilsCompat.$r8$clinit;
            if (TextUtils.getLayoutDirectionFromLocale(locale) == 1) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (z2) {
                bidiFormatter = BidiFormatter.DEFAULT_RTL_INSTANCE;
            } else {
                bidiFormatter = BidiFormatter.DEFAULT_LTR_INSTANCE;
            }
            AppCompatTextView appCompatTextView2 = this.counterView;
            String string = getContext().getString(R.string.character_counter_pattern, Integer.valueOf(i), Integer.valueOf(this.counterMaxLength));
            TextDirectionHeuristicCompat textDirectionHeuristicCompat = bidiFormatter.mDefaultTextDirectionHeuristicCompat;
            if (string != null) {
                boolean isRtl = ((TextDirectionHeuristicsCompat.TextDirectionHeuristicImpl) textDirectionHeuristicCompat).isRtl(string, string.length());
                SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
                if ((bidiFormatter.mFlags & 2) != 0) {
                    z3 = true;
                } else {
                    z3 = false;
                }
                String str3 = "";
                if (z3) {
                    if (isRtl) {
                        textDirectionHeuristicInternal2 = TextDirectionHeuristicsCompat.RTL;
                    } else {
                        textDirectionHeuristicInternal2 = TextDirectionHeuristicsCompat.LTR;
                    }
                    boolean isRtl2 = textDirectionHeuristicInternal2.isRtl(string, string.length());
                    if (!bidiFormatter.mIsRtlContext && (isRtl2 || BidiFormatter.getEntryDir(string) == 1)) {
                        str = BidiFormatter.LRM_STRING;
                    } else if (!bidiFormatter.mIsRtlContext || (isRtl2 && BidiFormatter.getEntryDir(string) != -1)) {
                        str = str3;
                    } else {
                        str = BidiFormatter.RLM_STRING;
                    }
                    spannableStringBuilder.append((CharSequence) str);
                }
                if (isRtl != bidiFormatter.mIsRtlContext) {
                    if (isRtl) {
                        c = 8235;
                    } else {
                        c = 8234;
                    }
                    spannableStringBuilder.append(c);
                    spannableStringBuilder.append((CharSequence) string);
                    spannableStringBuilder.append((char) 8236);
                } else {
                    spannableStringBuilder.append((CharSequence) string);
                }
                if (isRtl) {
                    textDirectionHeuristicInternal = TextDirectionHeuristicsCompat.RTL;
                } else {
                    textDirectionHeuristicInternal = TextDirectionHeuristicsCompat.LTR;
                }
                boolean isRtl3 = textDirectionHeuristicInternal.isRtl(string, string.length());
                if (!bidiFormatter.mIsRtlContext && (isRtl3 || BidiFormatter.getExitDir(string) == 1)) {
                    str3 = BidiFormatter.LRM_STRING;
                } else if (bidiFormatter.mIsRtlContext && (!isRtl3 || BidiFormatter.getExitDir(string) == -1)) {
                    str3 = BidiFormatter.RLM_STRING;
                }
                spannableStringBuilder.append((CharSequence) str3);
                str2 = spannableStringBuilder.toString();
            }
            appCompatTextView2.setText(str2);
        }
        if (this.editText != null && z4 != this.counterOverflowed) {
            updateLabelState(false, false);
            updateTextInputBoxState();
            updateEditTextBackground();
        }
    }

    public final void updateCounterTextAppearanceAndColor() {
        int i;
        ColorStateList colorStateList;
        ColorStateList colorStateList2;
        AppCompatTextView appCompatTextView = this.counterView;
        if (appCompatTextView != null) {
            if (this.counterOverflowed) {
                i = this.counterOverflowTextAppearance;
            } else {
                i = this.counterTextAppearance;
            }
            setTextAppearanceCompatWithErrorFallback(appCompatTextView, i);
            if (!this.counterOverflowed && (colorStateList2 = this.counterTextColor) != null) {
                this.counterView.setTextColor(colorStateList2);
            }
            if (this.counterOverflowed && (colorStateList = this.counterOverflowTextColor) != null) {
                this.counterView.setTextColor(colorStateList);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x008b, code lost:
        if (isEndIconVisible() != false) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x008f, code lost:
        if (r10.suffixText != null) goto L39;
     */
    /* JADX WARN: Removed duplicated region for block: B:44:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x011f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean updateDummyDrawables() {
        /*
            Method dump skipped, instructions count: 322
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.textfield.TextInputLayout.updateDummyDrawables():boolean");
    }

    public final void updateEditTextBackground() {
        Drawable background;
        AppCompatTextView appCompatTextView;
        int i;
        EditText editText = this.editText;
        if (editText != null && this.boxBackgroundMode == 0 && (background = editText.getBackground()) != null) {
            if (DrawableUtils.canSafelyMutateDrawable(background)) {
                background = background.mutate();
            }
            if (this.indicatorViewController.errorShouldBeShown()) {
                AppCompatTextView appCompatTextView2 = this.indicatorViewController.errorView;
                if (appCompatTextView2 != null) {
                    i = appCompatTextView2.getCurrentTextColor();
                } else {
                    i = -1;
                }
                background.setColorFilter(AppCompatDrawableManager.getPorterDuffColorFilter(i, PorterDuff.Mode.SRC_IN));
            } else if (!this.counterOverflowed || (appCompatTextView = this.counterView) == null) {
                background.clearColorFilter();
                this.editText.refreshDrawableState();
            } else {
                background.setColorFilter(AppCompatDrawableManager.getPorterDuffColorFilter(appCompatTextView.getCurrentTextColor(), PorterDuff.Mode.SRC_IN));
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x004a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void updateEndLayoutVisibility() {
        /*
            r5 = this;
            android.widget.FrameLayout r0 = r5.endIconFrame
            com.google.android.material.internal.CheckableImageButton r1 = r5.endIconView
            int r1 = r1.getVisibility()
            r2 = 1
            r3 = 0
            r4 = 8
            if (r1 != 0) goto L1d
            com.google.android.material.internal.CheckableImageButton r1 = r5.errorIconView
            int r1 = r1.getVisibility()
            if (r1 != 0) goto L18
            r1 = r2
            goto L19
        L18:
            r1 = r3
        L19:
            if (r1 != 0) goto L1d
            r1 = r3
            goto L1e
        L1d:
            r1 = r4
        L1e:
            r0.setVisibility(r1)
            java.lang.CharSequence r0 = r5.suffixText
            if (r0 == 0) goto L2d
            boolean r0 = r5.isHintExpanded()
            if (r0 != 0) goto L2d
            r0 = r3
            goto L2e
        L2d:
            r0 = r4
        L2e:
            boolean r1 = r5.isEndIconVisible()
            if (r1 != 0) goto L45
            com.google.android.material.internal.CheckableImageButton r1 = r5.errorIconView
            int r1 = r1.getVisibility()
            if (r1 != 0) goto L3e
            r1 = r2
            goto L3f
        L3e:
            r1 = r3
        L3f:
            if (r1 != 0) goto L45
            if (r0 != 0) goto L44
            goto L45
        L44:
            r2 = r3
        L45:
            android.widget.LinearLayout r5 = r5.endLayout
            if (r2 == 0) goto L4a
            goto L4b
        L4a:
            r3 = r4
        L4b:
            r5.setVisibility(r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.textfield.TextInputLayout.updateEndLayoutVisibility():void");
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x001d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x001f  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x002f  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:20:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void updateErrorIconVisibility() {
        /*
            r4 = this;
            com.google.android.material.internal.CheckableImageButton r0 = r4.errorIconView
            android.graphics.drawable.Drawable r0 = r0.getDrawable()
            r1 = 1
            r2 = 0
            if (r0 == 0) goto L18
            com.google.android.material.textfield.IndicatorViewController r0 = r4.indicatorViewController
            boolean r3 = r0.errorEnabled
            if (r3 == 0) goto L18
            boolean r0 = r0.errorShouldBeShown()
            if (r0 == 0) goto L18
            r0 = r1
            goto L19
        L18:
            r0 = r2
        L19:
            com.google.android.material.internal.CheckableImageButton r3 = r4.errorIconView
            if (r0 == 0) goto L1f
            r0 = r2
            goto L21
        L1f:
            r0 = 8
        L21:
            r3.setVisibility(r0)
            r4.updateEndLayoutVisibility()
            r4.updateSuffixTextViewPadding()
            int r0 = r4.endIconMode
            if (r0 == 0) goto L2f
            goto L30
        L2f:
            r1 = r2
        L30:
            if (r1 != 0) goto L35
            r4.updateDummyDrawables()
        L35:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.textfield.TextInputLayout.updateErrorIconVisibility():void");
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

    public final void updatePlaceholderText(int i) {
        if (i != 0 || this.hintExpanded) {
            AppCompatTextView appCompatTextView = this.placeholderTextView;
            if (appCompatTextView != null && this.placeholderEnabled) {
                appCompatTextView.setText((CharSequence) null);
                TransitionManager.beginDelayedTransition(this.inputFrame, this.placeholderFadeOut);
                this.placeholderTextView.setVisibility(4);
            }
        } else if (this.placeholderTextView != null && this.placeholderEnabled && !TextUtils.isEmpty(this.placeholderText)) {
            this.placeholderTextView.setText(this.placeholderText);
            TransitionManager.beginDelayedTransition(this.inputFrame, this.placeholderFadeIn);
            this.placeholderTextView.setVisibility(0);
            this.placeholderTextView.bringToFront();
            announceForAccessibility(this.placeholderText);
        }
    }

    public final void updatePrefixTextViewPadding() {
        boolean z;
        if (this.editText != null) {
            int i = 0;
            if (this.startIconView.getVisibility() == 0) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                EditText editText = this.editText;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                i = ViewCompat.Api17Impl.getPaddingStart(editText);
            }
            AppCompatTextView appCompatTextView = this.prefixTextView;
            int compoundPaddingTop = this.editText.getCompoundPaddingTop();
            int dimensionPixelSize = getContext().getResources().getDimensionPixelSize(R.dimen.material_input_text_to_prefix_suffix_padding);
            int compoundPaddingBottom = this.editText.getCompoundPaddingBottom();
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api17Impl.setPaddingRelative(appCompatTextView, i, compoundPaddingTop, dimensionPixelSize, compoundPaddingBottom);
        }
    }

    public final void updatePrefixTextVisibility() {
        int i;
        if (this.prefixText == null || isHintExpanded()) {
            i = 8;
        } else {
            i = 0;
        }
        updateStartLayoutVisibility();
        this.prefixTextView.setVisibility(i);
        updateDummyDrawables();
    }

    public final void updateStartLayoutVisibility() {
        boolean z;
        boolean z2;
        int i = 8;
        if (this.prefixText == null || isHintExpanded()) {
            z = true;
        } else {
            z = false;
        }
        if (this.startIconView.getVisibility() == 0 || !z) {
            z2 = true;
        } else {
            z2 = false;
        }
        LinearLayout linearLayout = this.startLayout;
        if (z2) {
            i = 0;
        }
        linearLayout.setVisibility(i);
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
        boolean z;
        if (this.editText != null) {
            int i = 0;
            if (!isEndIconVisible()) {
                if (this.errorIconView.getVisibility() == 0) {
                    z = true;
                } else {
                    z = false;
                }
                if (!z) {
                    EditText editText = this.editText;
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    i = ViewCompat.Api17Impl.getPaddingEnd(editText);
                }
            }
            AppCompatTextView appCompatTextView = this.suffixTextView;
            int dimensionPixelSize = getContext().getResources().getDimensionPixelSize(R.dimen.material_input_text_to_prefix_suffix_padding);
            int paddingTop = this.editText.getPaddingTop();
            int paddingBottom = this.editText.getPaddingBottom();
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api17Impl.setPaddingRelative(appCompatTextView, dimensionPixelSize, paddingTop, i, paddingBottom);
        }
    }

    public final void updateSuffixTextVisibility() {
        int i;
        int visibility = this.suffixTextView.getVisibility();
        boolean z = false;
        if (this.suffixText == null || isHintExpanded()) {
            i = 8;
        } else {
            i = 0;
        }
        if (visibility != i) {
            EndIconDelegate endIconDelegate = getEndIconDelegate();
            if (i == 0) {
                z = true;
            }
            endIconDelegate.onSuffixVisibilityChanged(z);
        }
        updateEndLayoutVisibility();
        this.suffixTextView.setVisibility(i);
        updateDummyDrawables();
    }

    public final void updateTextInputBoxState() {
        boolean z;
        AppCompatTextView appCompatTextView;
        int i;
        EditText editText;
        EditText editText2;
        if (this.boxBackground != null && this.boxBackgroundMode != 0) {
            boolean z2 = false;
            if (isFocused() || ((editText2 = this.editText) != null && editText2.hasFocus())) {
                z = true;
            } else {
                z = false;
            }
            if (isHovered() || ((editText = this.editText) != null && editText.isHovered())) {
                z2 = true;
            }
            int i2 = -1;
            if (!isEnabled()) {
                this.boxStrokeColor = this.disabledColor;
            } else if (this.indicatorViewController.errorShouldBeShown()) {
                if (this.strokeErrorColor != null) {
                    updateStrokeErrorColor(z, z2);
                } else {
                    AppCompatTextView appCompatTextView2 = this.indicatorViewController.errorView;
                    if (appCompatTextView2 != null) {
                        i = appCompatTextView2.getCurrentTextColor();
                    } else {
                        i = -1;
                    }
                    this.boxStrokeColor = i;
                }
            } else if (!this.counterOverflowed || (appCompatTextView = this.counterView) == null) {
                if (z) {
                    this.boxStrokeColor = this.focusedStrokeColor;
                } else if (z2) {
                    this.boxStrokeColor = this.hoveredStrokeColor;
                } else {
                    this.boxStrokeColor = this.defaultStrokeColor;
                }
            } else if (this.strokeErrorColor != null) {
                updateStrokeErrorColor(z, z2);
            } else {
                this.boxStrokeColor = appCompatTextView.getCurrentTextColor();
            }
            updateErrorIconVisibility();
            refreshIconDrawableState(this.errorIconView, this.errorIconTintList);
            refreshIconDrawableState(this.startIconView, this.startIconTintList);
            refreshIconDrawableState(this.endIconView, this.endIconTintList);
            EndIconDelegate endIconDelegate = getEndIconDelegate();
            endIconDelegate.getClass();
            if (endIconDelegate instanceof DropdownMenuEndIconDelegate) {
                if (!this.indicatorViewController.errorShouldBeShown() || this.endIconView.getDrawable() == null) {
                    applyIconTint(this.endIconView, this.endIconTintList, this.endIconTintMode);
                } else {
                    Drawable mutate = this.endIconView.getDrawable().mutate();
                    AppCompatTextView appCompatTextView3 = this.indicatorViewController.errorView;
                    if (appCompatTextView3 != null) {
                        i2 = appCompatTextView3.getCurrentTextColor();
                    }
                    mutate.setTint(i2);
                    this.endIconView.setImageDrawable(mutate);
                }
            }
            if (this.boxBackgroundMode == 2) {
                int i3 = this.boxStrokeWidthPx;
                if (!z || !isEnabled()) {
                    this.boxStrokeWidthPx = this.boxStrokeWidthDefaultPx;
                } else {
                    this.boxStrokeWidthPx = this.boxStrokeWidthFocusedPx;
                }
                if (this.boxStrokeWidthPx != i3 && cutoutEnabled() && !this.hintExpanded) {
                    if (cutoutEnabled()) {
                        ((CutoutDrawable) this.boxBackground).setCutout(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    }
                    openCutout();
                }
            }
            if (this.boxBackgroundMode == 1) {
                if (!isEnabled()) {
                    this.boxBackgroundColor = this.disabledFilledBackgroundColor;
                } else if (z2 && !z) {
                    this.boxBackgroundColor = this.hoveredFilledBackgroundColor;
                } else if (z) {
                    this.boxBackgroundColor = this.focusedFilledBackgroundColor;
                } else {
                    this.boxBackgroundColor = this.defaultFilledBackgroundColor;
                }
            }
            applyBoxAttributes();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0573  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x0582  */
    /* JADX WARN: Removed duplicated region for block: B:144:0x058d  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x05ac  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x05b5  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x05d9  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x0603  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x062c  */
    /* JADX WARN: Removed duplicated region for block: B:176:0x0699  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x06a2  */
    /* JADX WARN: Removed duplicated region for block: B:182:0x06ab  */
    /* JADX WARN: Removed duplicated region for block: B:185:0x06b9  */
    /* JADX WARN: Removed duplicated region for block: B:188:0x06ca  */
    /* JADX WARN: Removed duplicated region for block: B:194:0x06e1  */
    /* JADX WARN: Removed duplicated region for block: B:204:0x0708  */
    /* JADX WARN: Removed duplicated region for block: B:207:0x0713  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x076a  */
    /* JADX WARN: Removed duplicated region for block: B:231:0x077b  */
    /* JADX WARN: Removed duplicated region for block: B:234:0x07ce  */
    /* JADX WARN: Removed duplicated region for block: B:245:0x0829  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x0835  */
    /* JADX WARN: Removed duplicated region for block: B:249:0x0837  */
    /* JADX WARN: Removed duplicated region for block: B:252:0x0849  */
    /* JADX WARN: Removed duplicated region for block: B:253:0x084b  */
    /* JADX WARN: Type inference failed for: r3v36, types: [int, boolean] */
    /* JADX WARN: Type inference failed for: r3v66 */
    /* JADX WARN: Type inference failed for: r3v67 */
    /* JADX WARN: Type inference failed for: r3v87 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public TextInputLayout(android.content.Context r34, android.util.AttributeSet r35, int r36) {
        /*
            Method dump skipped, instructions count: 2182
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.textfield.TextInputLayout.<init>(android.content.Context, android.util.AttributeSet, int):void");
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

    public final void applyIconTint(CheckableImageButton checkableImageButton, ColorStateList colorStateList, PorterDuff.Mode mode) {
        Drawable drawable = checkableImageButton.getDrawable();
        if (drawable != null) {
            drawable = drawable.mutate();
            if (colorStateList == null || !colorStateList.isStateful()) {
                drawable.setTintList(colorStateList);
            } else {
                int[] drawableState = getDrawableState();
                int[] drawableState2 = checkableImageButton.getDrawableState();
                int length = drawableState.length;
                int[] copyOf = Arrays.copyOf(drawableState, drawableState.length + drawableState2.length);
                System.arraycopy(drawableState2, 0, copyOf, length, drawableState2.length);
                drawable.setTintList(ColorStateList.valueOf(colorStateList.getColorForState(copyOf, colorStateList.getDefaultColor())));
            }
            if (mode != null) {
                drawable.setTintMode(mode);
            }
        }
        if (checkableImageButton.getDrawable() != drawable) {
            checkableImageButton.setImageDrawable(drawable);
        }
    }

    public boolean cutoutIsOpen() {
        if (!cutoutEnabled() || !(!((CutoutDrawable) this.boxBackground).cutoutBounds.isEmpty())) {
            return false;
        }
        return true;
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        MaterialShapeDrawable materialShapeDrawable;
        super.draw(canvas);
        if (this.hintEnabled) {
            this.collapsingTextHelper.draw(canvas);
        }
        if (this.boxUnderlineFocused != null && (materialShapeDrawable = this.boxUnderlineDefault) != null) {
            materialShapeDrawable.draw(canvas);
            if (this.editText.isFocused()) {
                Rect bounds = this.boxUnderlineFocused.getBounds();
                Rect bounds2 = this.boxUnderlineDefault.getBounds();
                float f = this.collapsingTextHelper.expandedFraction;
                int centerX = bounds2.centerX();
                bounds.left = AnimationUtils.lerp(centerX, bounds2.left, f);
                bounds.right = AnimationUtils.lerp(centerX, bounds2.right, f);
                this.boxUnderlineFocused.draw(canvas);
            }
        }
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.collapsingTextHelper.maybeUpdateFontWeightAdjustment(configuration);
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        boolean z2;
        boolean z3;
        int i5;
        boolean z4;
        int i6;
        boolean z5;
        super.onLayout(z, i, i2, i3, i4);
        EditText editText = this.editText;
        if (editText != null) {
            Rect rect = this.tmpRect;
            DescendantOffsetUtils.getDescendantRect(this, editText, rect);
            MaterialShapeDrawable materialShapeDrawable = this.boxUnderlineDefault;
            if (materialShapeDrawable != null) {
                int i7 = rect.bottom;
                materialShapeDrawable.setBounds(rect.left, i7 - this.boxStrokeWidthDefaultPx, rect.right, i7);
            }
            MaterialShapeDrawable materialShapeDrawable2 = this.boxUnderlineFocused;
            if (materialShapeDrawable2 != null) {
                int i8 = rect.bottom;
                materialShapeDrawable2.setBounds(rect.left, i8 - this.boxStrokeWidthFocusedPx, rect.right, i8);
            }
            if (this.hintEnabled) {
                CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
                float textSize = this.editText.getTextSize();
                if (collapsingTextHelper.expandedTextSize != textSize) {
                    collapsingTextHelper.expandedTextSize = textSize;
                    collapsingTextHelper.recalculate(false);
                }
                int gravity = this.editText.getGravity();
                CollapsingTextHelper collapsingTextHelper2 = this.collapsingTextHelper;
                int i9 = (gravity & (-113)) | 48;
                if (collapsingTextHelper2.collapsedTextGravity != i9) {
                    collapsingTextHelper2.collapsedTextGravity = i9;
                    collapsingTextHelper2.recalculate(false);
                }
                CollapsingTextHelper collapsingTextHelper3 = this.collapsingTextHelper;
                if (collapsingTextHelper3.expandedTextGravity != gravity) {
                    collapsingTextHelper3.expandedTextGravity = gravity;
                    collapsingTextHelper3.recalculate(false);
                }
                CollapsingTextHelper collapsingTextHelper4 = this.collapsingTextHelper;
                if (this.editText != null) {
                    Rect rect2 = this.tmpBoundsRect;
                    boolean isLayoutRtl = ViewUtils.isLayoutRtl(this);
                    rect2.bottom = rect.bottom;
                    int i10 = this.boxBackgroundMode;
                    if (i10 == 1) {
                        int compoundPaddingLeft = this.editText.getCompoundPaddingLeft() + rect.left;
                        if (this.prefixText != null && !isLayoutRtl) {
                            compoundPaddingLeft = (compoundPaddingLeft - this.prefixTextView.getMeasuredWidth()) + this.prefixTextView.getPaddingLeft();
                        }
                        rect2.left = compoundPaddingLeft;
                        rect2.top = rect.top + this.boxCollapsedPaddingTopPx;
                        int compoundPaddingRight = rect.right - this.editText.getCompoundPaddingRight();
                        if (this.prefixText != null && isLayoutRtl) {
                            compoundPaddingRight += this.prefixTextView.getMeasuredWidth() - this.prefixTextView.getPaddingRight();
                        }
                        rect2.right = compoundPaddingRight;
                    } else if (i10 != 2) {
                        int compoundPaddingLeft2 = this.editText.getCompoundPaddingLeft() + rect.left;
                        if (this.prefixText != null && !isLayoutRtl) {
                            compoundPaddingLeft2 = (compoundPaddingLeft2 - this.prefixTextView.getMeasuredWidth()) + this.prefixTextView.getPaddingLeft();
                        }
                        rect2.left = compoundPaddingLeft2;
                        rect2.top = getPaddingTop();
                        int compoundPaddingRight2 = rect.right - this.editText.getCompoundPaddingRight();
                        if (this.prefixText != null && isLayoutRtl) {
                            compoundPaddingRight2 += this.prefixTextView.getMeasuredWidth() - this.prefixTextView.getPaddingRight();
                        }
                        rect2.right = compoundPaddingRight2;
                    } else {
                        rect2.left = this.editText.getPaddingLeft() + rect.left;
                        rect2.top = rect.top - calculateLabelMarginTop();
                        rect2.right = rect.right - this.editText.getPaddingRight();
                    }
                    collapsingTextHelper4.getClass();
                    int i11 = rect2.left;
                    int i12 = rect2.top;
                    int i13 = rect2.right;
                    int i14 = rect2.bottom;
                    Rect rect3 = collapsingTextHelper4.collapsedBounds;
                    if (rect3.left == i11 && rect3.top == i12 && rect3.right == i13 && rect3.bottom == i14) {
                        z2 = true;
                    } else {
                        z2 = false;
                    }
                    if (!z2) {
                        rect3.set(i11, i12, i13, i14);
                        collapsingTextHelper4.boundsChanged = true;
                        collapsingTextHelper4.onBoundsChanged();
                    }
                    CollapsingTextHelper collapsingTextHelper5 = this.collapsingTextHelper;
                    if (this.editText != null) {
                        Rect rect4 = this.tmpBoundsRect;
                        TextPaint textPaint = collapsingTextHelper5.tmpPaint;
                        textPaint.setTextSize(collapsingTextHelper5.expandedTextSize);
                        textPaint.setTypeface(collapsingTextHelper5.expandedTypeface);
                        textPaint.setLetterSpacing(collapsingTextHelper5.expandedLetterSpacing);
                        float f = -collapsingTextHelper5.tmpPaint.ascent();
                        rect4.left = this.editText.getCompoundPaddingLeft() + rect.left;
                        if (this.boxBackgroundMode != 1 || this.editText.getMinLines() > 1) {
                            z3 = false;
                        } else {
                            z3 = true;
                        }
                        if (z3) {
                            i5 = (int) (rect.centerY() - (f / 2.0f));
                        } else {
                            i5 = rect.top + this.editText.getCompoundPaddingTop();
                        }
                        rect4.top = i5;
                        rect4.right = rect.right - this.editText.getCompoundPaddingRight();
                        if (this.boxBackgroundMode != 1 || this.editText.getMinLines() > 1) {
                            z4 = false;
                        } else {
                            z4 = true;
                        }
                        if (z4) {
                            i6 = (int) (rect4.top + f);
                        } else {
                            i6 = rect.bottom - this.editText.getCompoundPaddingBottom();
                        }
                        rect4.bottom = i6;
                        int i15 = rect4.left;
                        int i16 = rect4.top;
                        int i17 = rect4.right;
                        Rect rect5 = collapsingTextHelper5.expandedBounds;
                        if (rect5.left == i15 && rect5.top == i16 && rect5.right == i17 && rect5.bottom == i6) {
                            z5 = true;
                        } else {
                            z5 = false;
                        }
                        if (!z5) {
                            rect5.set(i15, i16, i17, i6);
                            collapsingTextHelper5.boundsChanged = true;
                            collapsingTextHelper5.onBoundsChanged();
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
    public final void onMeasure(int i, int i2) {
        boolean z;
        EditText editText;
        int max;
        super.onMeasure(i, i2);
        if (this.editText != null && this.editText.getMeasuredHeight() < (max = Math.max(this.endLayout.getMeasuredHeight(), this.startLayout.getMeasuredHeight()))) {
            this.editText.setMinimumHeight(max);
            z = true;
        } else {
            z = false;
        }
        boolean updateDummyDrawables = updateDummyDrawables();
        if (z || updateDummyDrawables) {
            this.editText.post(new Runnable() { // from class: com.google.android.material.textfield.TextInputLayout.3
                @Override // java.lang.Runnable
                public final void run() {
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

    @Override // android.widget.LinearLayout, android.view.View
    public final void onRtlPropertiesChanged(int i) {
        boolean z;
        float f;
        float f2;
        float f3;
        float f4;
        super.onRtlPropertiesChanged(i);
        boolean z2 = false;
        if (i == 1) {
            z = true;
        } else {
            z = false;
        }
        boolean z3 = this.areCornerRadiiRtl;
        if (z != z3) {
            if (z && !z3) {
                z2 = true;
            }
            float cornerSize = this.shapeAppearanceModel.topLeftCornerSize.getCornerSize(this.tmpRectF);
            float cornerSize2 = this.shapeAppearanceModel.topRightCornerSize.getCornerSize(this.tmpRectF);
            float cornerSize3 = this.shapeAppearanceModel.bottomLeftCornerSize.getCornerSize(this.tmpRectF);
            float cornerSize4 = this.shapeAppearanceModel.bottomRightCornerSize.getCornerSize(this.tmpRectF);
            if (z2) {
                f = cornerSize;
            } else {
                f = cornerSize2;
            }
            if (z2) {
                cornerSize = cornerSize2;
            }
            if (z2) {
                f2 = cornerSize3;
            } else {
                f2 = cornerSize4;
            }
            if (z2) {
                cornerSize3 = cornerSize4;
            }
            boolean isLayoutRtl = ViewUtils.isLayoutRtl(this);
            this.areCornerRadiiRtl = isLayoutRtl;
            if (isLayoutRtl) {
                f3 = cornerSize;
            } else {
                f3 = f;
            }
            if (!isLayoutRtl) {
                f = cornerSize;
            }
            if (isLayoutRtl) {
                f4 = cornerSize3;
            } else {
                f4 = f2;
            }
            if (!isLayoutRtl) {
                f2 = cornerSize3;
            }
            MaterialShapeDrawable materialShapeDrawable = this.boxBackground;
            if (materialShapeDrawable != null && materialShapeDrawable.drawableState.shapeAppearanceModel.topLeftCornerSize.getCornerSize(materialShapeDrawable.getBoundsAsRectF()) == f3) {
                MaterialShapeDrawable materialShapeDrawable2 = this.boxBackground;
                if (materialShapeDrawable2.drawableState.shapeAppearanceModel.topRightCornerSize.getCornerSize(materialShapeDrawable2.getBoundsAsRectF()) == f) {
                    MaterialShapeDrawable materialShapeDrawable3 = this.boxBackground;
                    if (materialShapeDrawable3.drawableState.shapeAppearanceModel.bottomLeftCornerSize.getCornerSize(materialShapeDrawable3.getBoundsAsRectF()) == f4) {
                        MaterialShapeDrawable materialShapeDrawable4 = this.boxBackground;
                        if (materialShapeDrawable4.drawableState.shapeAppearanceModel.bottomRightCornerSize.getCornerSize(materialShapeDrawable4.getBoundsAsRectF()) == f2) {
                            return;
                        }
                    }
                }
            }
            ShapeAppearanceModel shapeAppearanceModel = this.shapeAppearanceModel;
            shapeAppearanceModel.getClass();
            ShapeAppearanceModel.Builder builder = new ShapeAppearanceModel.Builder(shapeAppearanceModel);
            builder.topLeftCornerSize = new AbsoluteCornerSize(f3);
            builder.topRightCornerSize = new AbsoluteCornerSize(f);
            builder.bottomLeftCornerSize = new AbsoluteCornerSize(f4);
            builder.bottomRightCornerSize = new AbsoluteCornerSize(f2);
            this.shapeAppearanceModel = new ShapeAppearanceModel(builder);
            applyBoxAttributes();
        }
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        boolean z;
        CharSequence charSequence;
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        if (this.indicatorViewController.errorShouldBeShown()) {
            savedState.error = getError();
        }
        boolean z2 = true;
        if (this.endIconMode != 0) {
            z = true;
        } else {
            z = false;
        }
        if (!z || !this.endIconView.isChecked()) {
            z2 = false;
        }
        savedState.isEndIconChecked = z2;
        savedState.hintText = getHint();
        IndicatorViewController indicatorViewController = this.indicatorViewController;
        CharSequence charSequence2 = null;
        if (indicatorViewController.helperTextEnabled) {
            charSequence = indicatorViewController.helperText;
        } else {
            charSequence = null;
        }
        savedState.helperText = charSequence;
        if (this.placeholderEnabled) {
            charSequence2 = this.placeholderText;
        }
        savedState.placeholderText = charSequence2;
        return savedState;
    }

    public final void openCutout() {
        float f;
        float f2;
        int i;
        float f3;
        float f4;
        int i2;
        if (cutoutEnabled()) {
            RectF rectF = this.tmpRectF;
            CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
            int width = this.editText.getWidth();
            int gravity = this.editText.getGravity();
            boolean calculateIsRtl = collapsingTextHelper.calculateIsRtl(collapsingTextHelper.text);
            collapsingTextHelper.isRtl = calculateIsRtl;
            if (gravity == 17 || (gravity & 7) == 1) {
                f4 = width / 2.0f;
                f3 = collapsingTextHelper.collapsedTextWidth / 2.0f;
            } else {
                if ((gravity & 8388613) == 8388613 || (gravity & 5) == 5) {
                    Rect rect = collapsingTextHelper.collapsedBounds;
                    if (calculateIsRtl) {
                        i2 = rect.left;
                        f = i2;
                    } else {
                        f4 = rect.right;
                        f3 = collapsingTextHelper.collapsedTextWidth;
                    }
                } else {
                    Rect rect2 = collapsingTextHelper.collapsedBounds;
                    if (calculateIsRtl) {
                        f4 = rect2.right;
                        f3 = collapsingTextHelper.collapsedTextWidth;
                    } else {
                        i2 = rect2.left;
                        f = i2;
                    }
                }
                rectF.left = f;
                Rect rect3 = collapsingTextHelper.collapsedBounds;
                float f5 = rect3.top;
                rectF.top = f5;
                if (gravity != 17 || (gravity & 7) == 1) {
                    f2 = (width / 2.0f) + (collapsingTextHelper.collapsedTextWidth / 2.0f);
                } else if ((gravity & 8388613) == 8388613 || (gravity & 5) == 5) {
                    if (calculateIsRtl) {
                        f2 = collapsingTextHelper.collapsedTextWidth + f;
                    } else {
                        i = rect3.right;
                        f2 = i;
                    }
                } else if (calculateIsRtl) {
                    i = rect3.right;
                    f2 = i;
                } else {
                    f2 = collapsingTextHelper.collapsedTextWidth + f;
                }
                rectF.right = f2;
                rectF.bottom = collapsingTextHelper.getCollapsedTextHeight() + f5;
                float f6 = rectF.left;
                float f7 = this.boxLabelCutoutPaddingPx;
                rectF.left = f6 - f7;
                rectF.right += f7;
                rectF.offset(-getPaddingLeft(), ((-getPaddingTop()) - (rectF.height() / 2.0f)) + this.boxStrokeWidthPx);
                CutoutDrawable cutoutDrawable = (CutoutDrawable) this.boxBackground;
                cutoutDrawable.getClass();
                cutoutDrawable.setCutout(rectF.left, rectF.top, rectF.right, rectF.bottom);
            }
            f = f4 - f3;
            rectF.left = f;
            Rect rect32 = collapsingTextHelper.collapsedBounds;
            float f52 = rect32.top;
            rectF.top = f52;
            if (gravity != 17) {
            }
            f2 = (width / 2.0f) + (collapsingTextHelper.collapsedTextWidth / 2.0f);
            rectF.right = f2;
            rectF.bottom = collapsingTextHelper.getCollapsedTextHeight() + f52;
            float f62 = rectF.left;
            float f72 = this.boxLabelCutoutPaddingPx;
            rectF.left = f62 - f72;
            rectF.right += f72;
            rectF.offset(-getPaddingLeft(), ((-getPaddingTop()) - (rectF.height() / 2.0f)) + this.boxStrokeWidthPx);
            CutoutDrawable cutoutDrawable2 = (CutoutDrawable) this.boxBackground;
            cutoutDrawable2.getClass();
            cutoutDrawable2.setCutout(rectF.left, rectF.top, rectF.right, rectF.bottom);
        }
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
    public final void setEnabled(boolean z) {
        recursiveSetEnabled(this, z);
        super.setEnabled(z);
    }

    public final void setEndIconVisible(boolean z) {
        int i;
        if (isEndIconVisible() != z) {
            CheckableImageButton checkableImageButton = this.endIconView;
            if (z) {
                i = 0;
            } else {
                i = 8;
            }
            checkableImageButton.setVisibility(i);
            updateEndLayoutVisibility();
            updateSuffixTextViewPadding();
            updateDummyDrawables();
        }
    }

    public final void setHelperText(CharSequence charSequence) {
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

    public final void updateLabelState(boolean z, boolean z2) {
        boolean z3;
        boolean z4;
        ColorStateList colorStateList;
        AppCompatTextView appCompatTextView;
        ColorStateList colorStateList2;
        int i;
        boolean isEnabled = isEnabled();
        EditText editText = this.editText;
        int i2 = 0;
        if (editText == null || TextUtils.isEmpty(editText.getText())) {
            z3 = false;
        } else {
            z3 = true;
        }
        EditText editText2 = this.editText;
        if (editText2 == null || !editText2.hasFocus()) {
            z4 = false;
        } else {
            z4 = true;
        }
        boolean errorShouldBeShown = this.indicatorViewController.errorShouldBeShown();
        ColorStateList colorStateList3 = this.defaultHintTextColor;
        if (colorStateList3 != null) {
            this.collapsingTextHelper.setCollapsedTextColor(colorStateList3);
            CollapsingTextHelper collapsingTextHelper = this.collapsingTextHelper;
            ColorStateList colorStateList4 = this.defaultHintTextColor;
            if (collapsingTextHelper.expandedTextColor != colorStateList4) {
                collapsingTextHelper.expandedTextColor = colorStateList4;
                collapsingTextHelper.recalculate(false);
            }
        }
        if (!isEnabled) {
            ColorStateList colorStateList5 = this.defaultHintTextColor;
            if (colorStateList5 != null) {
                i = colorStateList5.getColorForState(new int[]{-16842910}, this.disabledColor);
            } else {
                i = this.disabledColor;
            }
            this.collapsingTextHelper.setCollapsedTextColor(ColorStateList.valueOf(i));
            CollapsingTextHelper collapsingTextHelper2 = this.collapsingTextHelper;
            ColorStateList valueOf = ColorStateList.valueOf(i);
            if (collapsingTextHelper2.expandedTextColor != valueOf) {
                collapsingTextHelper2.expandedTextColor = valueOf;
                collapsingTextHelper2.recalculate(false);
            }
        } else if (errorShouldBeShown) {
            CollapsingTextHelper collapsingTextHelper3 = this.collapsingTextHelper;
            AppCompatTextView appCompatTextView2 = this.indicatorViewController.errorView;
            if (appCompatTextView2 != null) {
                colorStateList2 = appCompatTextView2.getTextColors();
            } else {
                colorStateList2 = null;
            }
            collapsingTextHelper3.setCollapsedTextColor(colorStateList2);
        } else if (this.counterOverflowed && (appCompatTextView = this.counterView) != null) {
            this.collapsingTextHelper.setCollapsedTextColor(appCompatTextView.getTextColors());
        } else if (z4 && (colorStateList = this.focusedTextColor) != null) {
            this.collapsingTextHelper.setCollapsedTextColor(colorStateList);
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
                    i2 = editText3.getText().length();
                }
                updatePlaceholderText(i2);
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
            AppCompatTextView appCompatTextView3 = this.placeholderTextView;
            if (appCompatTextView3 != null && this.placeholderEnabled) {
                appCompatTextView3.setText((CharSequence) null);
                TransitionManager.beginDelayedTransition(this.inputFrame, this.placeholderFadeOut);
                this.placeholderTextView.setVisibility(4);
            }
            updatePrefixTextVisibility();
            updateSuffixTextVisibility();
        }
    }

    public final boolean isHintExpanded() {
        return this.hintExpanded;
    }
}
