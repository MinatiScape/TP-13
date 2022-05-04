package com.android.wallpaper.util;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.graphics.Point;
import android.graphics.Rect;
import android.view.SurfaceView;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toolbar;
import androidx.cardview.widget.CardView;
import androidx.cardview.widget.CardViewApi21Impl;
import androidx.constraintlayout.solver.widgets.analyzer.DependencyGraph$$ExternalSyntheticOutline0;
import androidx.transition.R$id;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.picker.TouchForwardingLayout;
import com.google.android.material.appbar.AppBarLayout;
import java.util.Objects;
/* loaded from: classes.dex */
public class FullScreenAnimation {
    public float mBottomActionBarTranslation;
    public int mCurrentTextColor;
    public float mDefaultRadius;
    public float mFullScreenButtonsTranslation;
    public FullScreenStatusListener mFullScreenStatusListener;
    public int mNavigationBarHeight;
    public float mOffsetY;
    public float mScale;
    public int mStatusBarHeight;
    public final TouchForwardingLayout mTouchForwardingLayout;
    public final View mView;
    public int mWorkspaceHeight;
    public final SurfaceView mWorkspaceSurface;
    public int mWorkspaceWidth;
    public boolean mIsFullScreen = false;
    public boolean mScaleIsSet = false;
    public boolean mWorkspaceVisibility = true;
    public boolean mIsHomeSelected = true;
    public int mFullScreenTextColor = 1;

    /* loaded from: classes.dex */
    public interface FullScreenStatusListener {
        void onFullScreenStatusChange(boolean z);
    }

    public FullScreenAnimation(View view) {
        this.mView = view;
        this.mTouchForwardingLayout = (TouchForwardingLayout) view.findViewById(R.id.touch_forwarding_layout);
        this.mWorkspaceSurface = (SurfaceView) view.findViewById(R.id.workspace_surface);
        this.mCurrentTextColor = R$id.getColorAttr(view.getContext(), 16842806);
    }

    public final void animateColor(boolean z) {
        int i;
        int i2;
        final TextView textView = (TextView) this.mView.findViewById(R.id.custom_toolbar_title);
        if (!z || (i2 = this.mFullScreenTextColor) == 1) {
            i = R$id.getColorAttr(this.mView.getContext(), 16842806);
        } else if (i2 == 2) {
            i = this.mView.getContext().getColor(17170444);
        } else {
            i = this.mView.getContext().getColor(17170443);
        }
        if (i != this.mCurrentTextColor) {
            final ImageButton imageButton = (ImageButton) ((Toolbar) this.mView.findViewById(R.id.toolbar)).getNavigationView();
            ValueAnimator ofArgb = ValueAnimator.ofArgb(this.mCurrentTextColor, i);
            ofArgb.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.android.wallpaper.util.FullScreenAnimation$$ExternalSyntheticLambda0
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    TextView textView2 = textView;
                    ImageButton imageButton2 = imageButton;
                    int intValue = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                    textView2.setTextColor(intValue);
                    if (imageButton2 != null) {
                        imageButton2.setColorFilter(intValue);
                    }
                }
            });
            ofArgb.start();
            this.mCurrentTextColor = i;
        }
    }

    public void ensureToolbarIsCorrectlyColored() {
        ((TextView) this.mView.findViewById(R.id.custom_toolbar_title)).setTextColor(this.mCurrentTextColor);
        ImageButton imageButton = (ImageButton) ((Toolbar) this.mView.findViewById(R.id.toolbar)).getNavigationView();
        if (imageButton != null) {
            imageButton.setColorFilter(this.mCurrentTextColor);
        }
    }

    public void ensureToolbarIsCorrectlyLocated() {
        AppBarLayout.LayoutParams layoutParams = new AppBarLayout.LayoutParams(-1, -1);
        layoutParams.setMargins(0, this.mStatusBarHeight, 0, 0);
        this.mView.findViewById(R.id.toolbar).setLayoutParams(layoutParams);
    }

    public final void setViewMargins(int i, float f, float f2, boolean z) {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, z ? -2 : -1);
        layoutParams.setMargins(0, Math.round(f), 0, Math.round(f2));
        if (z) {
            layoutParams.gravity = 80;
        }
        this.mView.findViewById(i).setLayoutParams(layoutParams);
    }

    public void setWorkspaceVisibility(boolean z) {
        if (z) {
            this.mWorkspaceSurface.setClipBounds(new Rect(0, Math.round(this.mWorkspaceHeight * 0.2f), this.mWorkspaceWidth, Math.round(this.mFullScreenButtonsTranslation / this.mScale) + this.mWorkspaceHeight));
            this.mView.findViewById(R.id.lock_screen_preview_container).setVisibility(0);
        } else {
            SurfaceView surfaceView = this.mWorkspaceSurface;
            int i = this.mWorkspaceWidth;
            int i2 = this.mWorkspaceHeight;
            surfaceView.setClipBounds(new Rect(i - 1, i2 - 1, i, i2));
            this.mView.findViewById(R.id.lock_screen_preview_container).setVisibility(4);
        }
        if (this.mIsHomeSelected) {
            this.mView.findViewById(R.id.lock_screen_preview_container).setVisibility(4);
        }
        this.mWorkspaceVisibility = z;
    }

    public void startAnimation(final boolean z) {
        if (z != this.mIsFullScreen) {
            if (!this.mScaleIsSet) {
                int[] iArr = new int[2];
                this.mTouchForwardingLayout.getLocationInWindow(iArr);
                Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(this.mView.getDisplay());
                int i = screenSize.x;
                int i2 = screenSize.y;
                this.mOffsetY = (float) ((i2 / 2.0d) - ((this.mTouchForwardingLayout.getHeight() / 2.0d) + iArr[1]));
                this.mScale = Math.max(i / this.mTouchForwardingLayout.getWidth(), i2 / this.mTouchForwardingLayout.getHeight());
                this.mDefaultRadius = ((CardViewApi21Impl) CardView.IMPL).getRadius(((CardView) this.mWorkspaceSurface.getParent()).mCardViewDelegate);
                this.mWorkspaceSurface.setEnableSurfaceClipping(true);
                this.mWorkspaceWidth = this.mWorkspaceSurface.getWidth();
                this.mWorkspaceHeight = this.mWorkspaceSurface.getHeight();
                this.mBottomActionBarTranslation = this.mView.getResources().getDimension(R.dimen.separated_tabs_height) + this.mView.getResources().getDimension(R.dimen.bottom_actions_height) + this.mNavigationBarHeight;
                this.mFullScreenButtonsTranslation = -(this.mView.getResources().getDimension(R.dimen.separated_tabs_height) + this.mView.getResources().getDimension(R.dimen.fullscreen_preview_button_margin_bottom) + this.mNavigationBarHeight);
                this.mScaleIsSet = true;
            }
            float f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            ValueAnimator ofFloat = ValueAnimator.ofFloat(z ? this.mDefaultRadius : 0.0f, z ? 0.0f : this.mDefaultRadius);
            ofFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.android.wallpaper.util.FullScreenAnimation$$ExternalSyntheticLambda1
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    ((CardView) FullScreenAnimation.this.mWorkspaceSurface.getParent()).setRadius(((Float) valueAnimator.getAnimatedValue()).floatValue());
                }
            });
            final float f2 = z ? 0.0f : 0.2f;
            final float f3 = z ? 0.2f : 0.0f;
            final float f4 = z ? 0.0f : this.mFullScreenButtonsTranslation / this.mScale;
            final float f5 = z ? this.mFullScreenButtonsTranslation / this.mScale : 0.0f;
            ValueAnimator ofFloat2 = ValueAnimator.ofFloat(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
            ofFloat2.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.android.wallpaper.util.FullScreenAnimation$$ExternalSyntheticLambda2
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    FullScreenAnimation fullScreenAnimation = FullScreenAnimation.this;
                    float f6 = f2;
                    float f7 = f3;
                    float f8 = f4;
                    float f9 = f5;
                    Objects.requireNonNull(fullScreenAnimation);
                    float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                    float m = DependencyGraph$$ExternalSyntheticOutline0.m(f7, f6, floatValue, f6);
                    float m2 = DependencyGraph$$ExternalSyntheticOutline0.m(f9, f8, floatValue, f8);
                    fullScreenAnimation.mWorkspaceSurface.setClipBounds(new Rect(0, Math.round(fullScreenAnimation.mWorkspaceHeight * m), fullScreenAnimation.mWorkspaceWidth, Math.round(m2) + fullScreenAnimation.mWorkspaceHeight));
                }
            });
            float f6 = z ? this.mScale : 1.0f;
            float f7 = z ? this.mOffsetY : 0.0f;
            float f8 = z ? this.mBottomActionBarTranslation : 0.0f;
            if (z) {
                f = this.mFullScreenButtonsTranslation;
            }
            View findViewById = this.mView.findViewById(R.id.screen_preview_layout);
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.playTogether(ObjectAnimator.ofFloat(findViewById, "scaleX", f6), ObjectAnimator.ofFloat(findViewById, "scaleY", f6), ObjectAnimator.ofFloat(findViewById, "translationY", f7), ObjectAnimator.ofFloat(this.mView.findViewById(R.id.bottom_actionbar), "translationY", f8), ObjectAnimator.ofFloat(this.mView.findViewById(R.id.separated_tabs_container), "translationY", f8), ObjectAnimator.ofFloat(this.mView.findViewById(R.id.fullscreen_buttons_container), "translationY", f), ofFloat, ofFloat2);
            animatorSet.addListener(new Animator.AnimatorListener() { // from class: com.android.wallpaper.util.FullScreenAnimation.1
                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animator) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animator) {
                    FullScreenStatusListener fullScreenStatusListener = FullScreenAnimation.this.mFullScreenStatusListener;
                    if (fullScreenStatusListener != null) {
                        fullScreenStatusListener.onFullScreenStatusChange(z);
                    }
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationRepeat(Animator animator) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animator) {
                }
            });
            animatorSet.start();
            animateColor(z);
            this.mWorkspaceVisibility = true;
            if (z) {
                ((Button) this.mView.findViewById(R.id.hide_ui_preview_button)).setText(R.string.hide_ui_preview_text);
            }
            this.mView.findViewById(R.id.lock_screen_preview_container).setVisibility(0);
            if (this.mIsHomeSelected) {
                this.mView.findViewById(R.id.lock_screen_preview_container).setVisibility(4);
            }
            this.mIsFullScreen = z;
        }
    }
}
