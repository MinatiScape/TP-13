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
import androidx.appcompat.R$bool;
import androidx.cardview.widget.CardView;
import androidx.cardview.widget.RoundRectDrawable;
import androidx.constraintlayout.solver.widgets.analyzer.DependencyGraph$$ExternalSyntheticOutline0;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.picker.TouchForwardingLayout;
/* loaded from: classes.dex */
public final class FullScreenAnimation {
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
    public boolean mShowInFullScreen = false;
    public boolean mScaleIsSet = false;
    public boolean mWorkspaceVisibility = true;
    public boolean mIsHomeSelected = true;
    public FullScreenTextColor mFullScreenTextColor = FullScreenTextColor.DEFAULT;

    /* loaded from: classes.dex */
    public interface FullScreenStatusListener {
        void onFullScreenStatusChange(boolean z);
    }

    /* loaded from: classes.dex */
    public enum FullScreenTextColor {
        DEFAULT,
        DARK,
        LIGHT
    }

    public final void setWorkspaceVisibility(boolean z) {
        int i;
        if (z) {
            SurfaceView surfaceView = this.mWorkspaceSurface;
            int round = Math.round(this.mWorkspaceHeight * 0.2f);
            int i2 = this.mWorkspaceWidth;
            if (this.mShowInFullScreen) {
                i = this.mWorkspaceHeight;
            } else {
                i = this.mWorkspaceHeight + Math.round(this.mFullScreenButtonsTranslation / this.mScale);
            }
            surfaceView.setClipBounds(new Rect(0, round, i2, i));
            this.mView.findViewById(R.id.lock_screen_preview_container).setVisibility(0);
        } else {
            SurfaceView surfaceView2 = this.mWorkspaceSurface;
            int i3 = this.mWorkspaceWidth;
            int i4 = this.mWorkspaceHeight;
            surfaceView2.setClipBounds(new Rect(i3 - 1, i4 - 1, i3, i4));
            this.mView.findViewById(R.id.lock_screen_preview_container).setVisibility(4);
        }
        if (this.mIsHomeSelected) {
            this.mView.findViewById(R.id.lock_screen_preview_container).setVisibility(4);
        }
        this.mWorkspaceVisibility = z;
    }

    public final void animateColor(boolean z) {
        int i;
        FullScreenTextColor fullScreenTextColor;
        final TextView textView = (TextView) this.mView.findViewById(R.id.custom_toolbar_title);
        if (!z || (fullScreenTextColor = this.mFullScreenTextColor) == FullScreenTextColor.DEFAULT) {
            i = R$bool.getColorAttr(this.mView.getContext(), 16842806);
        } else if (fullScreenTextColor == FullScreenTextColor.DARK) {
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
                    if (textView2 != null) {
                        textView2.setTextColor(intValue);
                    }
                    if (imageButton2 != null) {
                        imageButton2.setColorFilter(intValue);
                    }
                }
            });
            ofArgb.start();
            this.mCurrentTextColor = i;
        }
    }

    public final void ensureToolbarIsCorrectlyColored() {
        TextView textView = (TextView) this.mView.findViewById(R.id.custom_toolbar_title);
        if (textView != null) {
            textView.setTextColor(this.mCurrentTextColor);
        }
        ImageButton imageButton = (ImageButton) ((Toolbar) this.mView.findViewById(R.id.toolbar)).getNavigationView();
        if (imageButton != null) {
            imageButton.setColorFilter(this.mCurrentTextColor);
        }
    }

    public final void ensureToolbarIsCorrectlyLocated() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.setMargins(0, this.mStatusBarHeight, 0, 0);
        this.mView.findViewById(R.id.section_header_container).setLayoutParams(layoutParams);
    }

    public final void setViewMargins(int i, float f, float f2, boolean z) {
        int i2;
        if (z) {
            i2 = -2;
        } else {
            i2 = -1;
        }
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, i2);
        layoutParams.setMargins(0, Math.round(f), 0, Math.round(f2));
        if (z) {
            layoutParams.gravity = 80;
        }
        this.mView.findViewById(i).setLayoutParams(layoutParams);
    }

    public final void startAnimation(final boolean z) {
        float f;
        float f2;
        final float f3;
        final float f4;
        final float f5;
        final float f6;
        float f7;
        float f8;
        float f9;
        int[] iArr;
        if (z != this.mIsFullScreen) {
            if (!this.mScaleIsSet) {
                this.mTouchForwardingLayout.getLocationInWindow(new int[2]);
                Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(this.mView.getDisplay());
                int i = screenSize.x;
                int i2 = screenSize.y;
                this.mOffsetY = (float) ((i2 / 2.0d) - ((this.mTouchForwardingLayout.getHeight() / 2.0d) + iArr[1]));
                this.mScale = Math.max(i / this.mTouchForwardingLayout.getWidth(), i2 / this.mTouchForwardingLayout.getHeight());
                int[] iArr2 = CardView.COLOR_BACKGROUND_ATTR;
                this.mDefaultRadius = ((RoundRectDrawable) ((CardView) this.mWorkspaceSurface.getParent()).mCardViewDelegate.mCardBackground).mRadius;
                this.mWorkspaceSurface.setEnableSurfaceClipping(true);
                this.mWorkspaceWidth = this.mWorkspaceSurface.getWidth();
                this.mWorkspaceHeight = this.mWorkspaceSurface.getHeight();
                this.mBottomActionBarTranslation = this.mView.getResources().getDimension(R.dimen.separated_tabs_height) + this.mView.getResources().getDimension(R.dimen.bottom_actions_height) + this.mNavigationBarHeight;
                this.mFullScreenButtonsTranslation = -(this.mView.getResources().getDimension(R.dimen.separated_tabs_height) + this.mView.getResources().getDimension(R.dimen.fullscreen_preview_button_margin_bottom) + this.mNavigationBarHeight);
                this.mScaleIsSet = true;
            }
            float f10 = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            if (z) {
                f = this.mDefaultRadius;
            } else {
                f = 0.0f;
            }
            if (z) {
                f2 = 0.0f;
            } else {
                f2 = this.mDefaultRadius;
            }
            ValueAnimator ofFloat = ValueAnimator.ofFloat(f, f2);
            ofFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.android.wallpaper.util.FullScreenAnimation$$ExternalSyntheticLambda1
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    ((CardView) FullScreenAnimation.this.mWorkspaceSurface.getParent()).setRadius(((Float) valueAnimator.getAnimatedValue()).floatValue());
                }
            });
            if (z) {
                f3 = 0.0f;
            } else {
                f3 = 0.2f;
            }
            if (z) {
                f4 = 0.2f;
            } else {
                f4 = 0.0f;
            }
            if (z) {
                f5 = 0.0f;
            } else {
                f5 = this.mFullScreenButtonsTranslation / this.mScale;
            }
            if (z) {
                f6 = this.mFullScreenButtonsTranslation / this.mScale;
            } else {
                f6 = 0.0f;
            }
            ValueAnimator ofFloat2 = ValueAnimator.ofFloat(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
            ofFloat2.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.android.wallpaper.util.FullScreenAnimation$$ExternalSyntheticLambda2
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    FullScreenAnimation fullScreenAnimation = FullScreenAnimation.this;
                    float f11 = f3;
                    float f12 = f4;
                    float f13 = f5;
                    float f14 = f6;
                    fullScreenAnimation.getClass();
                    float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                    float m = DependencyGraph$$ExternalSyntheticOutline0.m(f12, f11, floatValue, f11);
                    float m2 = DependencyGraph$$ExternalSyntheticOutline0.m(f14, f13, floatValue, f13);
                    SurfaceView surfaceView = fullScreenAnimation.mWorkspaceSurface;
                    int round = Math.round(fullScreenAnimation.mWorkspaceHeight * m);
                    int i3 = fullScreenAnimation.mWorkspaceWidth;
                    boolean z2 = fullScreenAnimation.mShowInFullScreen;
                    int i4 = fullScreenAnimation.mWorkspaceHeight;
                    if (!z2) {
                        i4 += Math.round(m2);
                    }
                    surfaceView.setClipBounds(new Rect(0, round, i3, i4));
                }
            });
            if (z) {
                f7 = this.mScale;
            } else {
                f7 = 1.0f;
            }
            if (z) {
                f8 = this.mOffsetY;
            } else {
                f8 = 0.0f;
            }
            if (z) {
                f9 = this.mBottomActionBarTranslation;
            } else {
                f9 = 0.0f;
            }
            if (z) {
                f10 = this.mFullScreenButtonsTranslation;
            }
            View findViewById = this.mView.findViewById(R.id.screen_preview_layout);
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.playTogether(ObjectAnimator.ofFloat(findViewById, "scaleX", f7), ObjectAnimator.ofFloat(findViewById, "scaleY", f7), ObjectAnimator.ofFloat(findViewById, "translationY", f8), ObjectAnimator.ofFloat(this.mView.findViewById(R.id.bottom_actionbar), "translationY", f9), ObjectAnimator.ofFloat(this.mView.findViewById(R.id.separated_tabs_container), "translationY", f9), ObjectAnimator.ofFloat(this.mView.findViewById(R.id.fullscreen_buttons_container), "translationY", f10), ofFloat, ofFloat2);
            animatorSet.addListener(new Animator.AnimatorListener() { // from class: com.android.wallpaper.util.FullScreenAnimation.1
                @Override // android.animation.Animator.AnimatorListener
                public final void onAnimationCancel(Animator animator) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public final void onAnimationRepeat(Animator animator) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public final void onAnimationStart(Animator animator) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public final void onAnimationEnd(Animator animator) {
                    FullScreenStatusListener fullScreenStatusListener = FullScreenAnimation.this.mFullScreenStatusListener;
                    if (fullScreenStatusListener != null) {
                        fullScreenStatusListener.onFullScreenStatusChange(z);
                    }
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

    public FullScreenAnimation(View view) {
        this.mView = view;
        this.mTouchForwardingLayout = (TouchForwardingLayout) view.findViewById(R.id.touch_forwarding_layout);
        this.mWorkspaceSurface = (SurfaceView) view.findViewById(R.id.workspace_surface);
        this.mCurrentTextColor = R$bool.getColorAttr(view.getContext(), 16842806);
    }
}
