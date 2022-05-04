package com.google.android.material.textfield;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatTextView;
import androidx.collection.ContainerHelpers;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.animation.AnimationUtils;
import com.google.android.material.resources.MaterialResources;
import java.util.ArrayList;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class IndicatorViewController {
    public Animator captionAnimator;
    public FrameLayout captionArea;
    public int captionDisplayed;
    public int captionToShow;
    public final float captionTranslationYPx;
    public final Context context;
    public boolean errorEnabled;
    public CharSequence errorText;
    public int errorTextAppearance;
    public AppCompatTextView errorView;
    public CharSequence errorViewContentDescription;
    public ColorStateList errorViewTextColor;
    public CharSequence helperText;
    public boolean helperTextEnabled;
    public int helperTextTextAppearance;
    public AppCompatTextView helperTextView;
    public ColorStateList helperTextViewTextColor;
    public LinearLayout indicatorArea;
    public int indicatorsAdded;
    public final TextInputLayout textInputView;

    public final TextView getCaptionViewFromDisplayState(int i) {
        if (i == 1) {
            return this.errorView;
        }
        if (i != 2) {
            return null;
        }
        return this.helperTextView;
    }

    public final void hideError() {
        this.errorText = null;
        cancelCaptionAnimator();
        if (this.captionDisplayed == 1) {
            if (!this.helperTextEnabled || TextUtils.isEmpty(this.helperText)) {
                this.captionToShow = 0;
            } else {
                this.captionToShow = 2;
            }
        }
        updateCaptionViewsVisibility(this.captionDisplayed, this.captionToShow, shouldAnimateCaptionView(this.errorView, ""));
    }

    public final void updateCaptionViewsVisibility(final int i, final int i2, boolean z) {
        TextView captionViewFromDisplayState;
        TextView captionViewFromDisplayState2;
        if (i != i2) {
            if (z) {
                AnimatorSet animatorSet = new AnimatorSet();
                this.captionAnimator = animatorSet;
                ArrayList arrayList = new ArrayList();
                createCaptionAnimators(arrayList, this.helperTextEnabled, this.helperTextView, 2, i, i2);
                createCaptionAnimators(arrayList, this.errorEnabled, this.errorView, 1, i, i2);
                ContainerHelpers.playTogether(animatorSet, arrayList);
                final TextView captionViewFromDisplayState3 = getCaptionViewFromDisplayState(i);
                final TextView captionViewFromDisplayState4 = getCaptionViewFromDisplayState(i2);
                animatorSet.addListener(new AnimatorListenerAdapter() { // from class: com.google.android.material.textfield.IndicatorViewController.1
                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public final void onAnimationEnd(Animator animator) {
                        AppCompatTextView appCompatTextView;
                        IndicatorViewController indicatorViewController = IndicatorViewController.this;
                        indicatorViewController.captionDisplayed = i2;
                        indicatorViewController.captionAnimator = null;
                        TextView textView = captionViewFromDisplayState3;
                        if (textView != null) {
                            textView.setVisibility(4);
                            if (i == 1 && (appCompatTextView = IndicatorViewController.this.errorView) != null) {
                                appCompatTextView.setText((CharSequence) null);
                            }
                        }
                        TextView textView2 = captionViewFromDisplayState4;
                        if (textView2 != null) {
                            textView2.setTranslationY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                            captionViewFromDisplayState4.setAlpha(1.0f);
                        }
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public final void onAnimationStart(Animator animator) {
                        TextView textView = captionViewFromDisplayState4;
                        if (textView != null) {
                            textView.setVisibility(0);
                        }
                    }
                });
                animatorSet.start();
            } else if (i != i2) {
                if (!(i2 == 0 || (captionViewFromDisplayState2 = getCaptionViewFromDisplayState(i2)) == null)) {
                    captionViewFromDisplayState2.setVisibility(0);
                    captionViewFromDisplayState2.setAlpha(1.0f);
                }
                if (!(i == 0 || (captionViewFromDisplayState = getCaptionViewFromDisplayState(i)) == null)) {
                    captionViewFromDisplayState.setVisibility(4);
                    if (i == 1) {
                        captionViewFromDisplayState.setText((CharSequence) null);
                    }
                }
                this.captionDisplayed = i2;
            }
            this.textInputView.updateEditTextBackground();
            this.textInputView.updateLabelState(z, false);
            this.textInputView.updateTextInputBoxState();
        }
    }

    public final void addIndicator(TextView textView, int i) {
        boolean z;
        if (this.indicatorArea == null && this.captionArea == null) {
            LinearLayout linearLayout = new LinearLayout(this.context);
            this.indicatorArea = linearLayout;
            linearLayout.setOrientation(0);
            this.textInputView.addView(this.indicatorArea, -1, -2);
            this.captionArea = new FrameLayout(this.context);
            this.indicatorArea.addView(this.captionArea, new LinearLayout.LayoutParams(0, -2, 1.0f));
            if (this.textInputView.editText != null) {
                adjustIndicatorPadding();
            }
        }
        if (i == 0 || i == 1) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            this.captionArea.setVisibility(0);
            this.captionArea.addView(textView);
        } else {
            this.indicatorArea.addView(textView, new LinearLayout.LayoutParams(-2, -2));
        }
        this.indicatorArea.setVisibility(0);
        this.indicatorsAdded++;
    }

    public final void adjustIndicatorPadding() {
        boolean z;
        if (this.indicatorArea == null || this.textInputView.editText == null) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            EditText editText = this.textInputView.editText;
            boolean isFontScaleAtLeast1_3 = MaterialResources.isFontScaleAtLeast1_3(this.context);
            LinearLayout linearLayout = this.indicatorArea;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            int paddingStart = ViewCompat.Api17Impl.getPaddingStart(editText);
            if (isFontScaleAtLeast1_3) {
                paddingStart = this.context.getResources().getDimensionPixelSize(R.dimen.material_helper_text_font_1_3_padding_horizontal);
            }
            int dimensionPixelSize = this.context.getResources().getDimensionPixelSize(R.dimen.material_helper_text_default_padding_top);
            if (isFontScaleAtLeast1_3) {
                dimensionPixelSize = this.context.getResources().getDimensionPixelSize(R.dimen.material_helper_text_font_1_3_padding_top);
            }
            int paddingEnd = ViewCompat.Api17Impl.getPaddingEnd(editText);
            if (isFontScaleAtLeast1_3) {
                paddingEnd = this.context.getResources().getDimensionPixelSize(R.dimen.material_helper_text_font_1_3_padding_horizontal);
            }
            ViewCompat.Api17Impl.setPaddingRelative(linearLayout, paddingStart, dimensionPixelSize, paddingEnd, 0);
        }
    }

    public final void cancelCaptionAnimator() {
        Animator animator = this.captionAnimator;
        if (animator != null) {
            animator.cancel();
        }
    }

    public final void createCaptionAnimators(ArrayList arrayList, boolean z, TextView textView, int i, int i2, int i3) {
        boolean z2;
        float f;
        if (textView != null && z) {
            if (i == i3 || i == i2) {
                if (i3 == i) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                if (z2) {
                    f = 1.0f;
                } else {
                    f = 0.0f;
                }
                ObjectAnimator ofFloat = ObjectAnimator.ofFloat(textView, View.ALPHA, f);
                ofFloat.setDuration(167L);
                ofFloat.setInterpolator(AnimationUtils.LINEAR_INTERPOLATOR);
                arrayList.add(ofFloat);
                if (i3 == i) {
                    ObjectAnimator ofFloat2 = ObjectAnimator.ofFloat(textView, View.TRANSLATION_Y, -this.captionTranslationYPx, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    ofFloat2.setDuration(217L);
                    ofFloat2.setInterpolator(AnimationUtils.LINEAR_OUT_SLOW_IN_INTERPOLATOR);
                    arrayList.add(ofFloat2);
                }
            }
        }
    }

    public final boolean errorShouldBeShown() {
        if (this.captionToShow != 1 || this.errorView == null || TextUtils.isEmpty(this.errorText)) {
            return false;
        }
        return true;
    }

    public final void removeIndicator(TextView textView, int i) {
        FrameLayout frameLayout;
        LinearLayout linearLayout = this.indicatorArea;
        if (linearLayout != null) {
            boolean z = true;
            if (!(i == 0 || i == 1)) {
                z = false;
            }
            if (!z || (frameLayout = this.captionArea) == null) {
                linearLayout.removeView(textView);
            } else {
                frameLayout.removeView(textView);
            }
            int i2 = this.indicatorsAdded - 1;
            this.indicatorsAdded = i2;
            LinearLayout linearLayout2 = this.indicatorArea;
            if (i2 == 0) {
                linearLayout2.setVisibility(8);
            }
        }
    }

    public final boolean shouldAnimateCaptionView(TextView textView, CharSequence charSequence) {
        TextInputLayout textInputLayout = this.textInputView;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (!ViewCompat.Api19Impl.isLaidOut(textInputLayout) || !this.textInputView.isEnabled() || (this.captionToShow == this.captionDisplayed && textView != null && TextUtils.equals(textView.getText(), charSequence))) {
            return false;
        }
        return true;
    }

    public IndicatorViewController(TextInputLayout textInputLayout) {
        Context context = textInputLayout.getContext();
        this.context = context;
        this.textInputView = textInputLayout;
        this.captionTranslationYPx = context.getResources().getDimensionPixelSize(R.dimen.design_textinput_caption_translate_y);
    }
}
