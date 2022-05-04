package androidx.recyclerview.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.view.MotionEvent;
import android.view.View;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.WeakHashMap;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class FastScroller extends RecyclerView.ItemDecoration implements RecyclerView.OnItemTouchListener {
    public final AnonymousClass1 mHideRunnable;
    public float mHorizontalDragX;
    public int mHorizontalThumbCenterX;
    public final StateListDrawable mHorizontalThumbDrawable;
    public final int mHorizontalThumbHeight;
    public int mHorizontalThumbWidth;
    public final Drawable mHorizontalTrackDrawable;
    public final int mHorizontalTrackHeight;
    public final int mMargin;
    public final AnonymousClass2 mOnScrollListener;
    public RecyclerView mRecyclerView;
    public final int mScrollbarMinimumRange;
    public final ValueAnimator mShowHideAnimator;
    public float mVerticalDragY;
    public int mVerticalThumbCenterY;
    public final StateListDrawable mVerticalThumbDrawable;
    public int mVerticalThumbHeight;
    public final int mVerticalThumbWidth;
    public final Drawable mVerticalTrackDrawable;
    public final int mVerticalTrackWidth;
    public static final int[] PRESSED_STATE_SET = {16842919};
    public static final int[] EMPTY_STATE_SET = new int[0];
    public int mRecyclerViewWidth = 0;
    public int mRecyclerViewHeight = 0;
    public boolean mNeedVerticalScrollbar = false;
    public boolean mNeedHorizontalScrollbar = false;
    public int mState = 0;
    public int mDragState = 0;
    public final int[] mVerticalRange = new int[2];
    public final int[] mHorizontalRange = new int[2];
    public int mAnimationState = 0;

    /* loaded from: classes.dex */
    public class AnimatorListener extends AnimatorListenerAdapter {
        public boolean mCanceled = false;

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public final void onAnimationCancel(Animator animator) {
            this.mCanceled = true;
        }

        public AnimatorListener() {
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public final void onAnimationEnd(Animator animator) {
            if (this.mCanceled) {
                this.mCanceled = false;
            } else if (((Float) FastScroller.this.mShowHideAnimator.getAnimatedValue()).floatValue() == HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                FastScroller fastScroller = FastScroller.this;
                fastScroller.mAnimationState = 0;
                fastScroller.setState(0);
            } else {
                FastScroller fastScroller2 = FastScroller.this;
                fastScroller2.mAnimationState = 2;
                fastScroller2.mRecyclerView.invalidate();
            }
        }
    }

    /* loaded from: classes.dex */
    public class AnimatorUpdater implements ValueAnimator.AnimatorUpdateListener {
        public AnimatorUpdater() {
        }

        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
        public final void onAnimationUpdate(ValueAnimator valueAnimator) {
            int floatValue = (int) (((Float) valueAnimator.getAnimatedValue()).floatValue() * 255.0f);
            FastScroller.this.mVerticalThumbDrawable.setAlpha(floatValue);
            FastScroller.this.mVerticalTrackDrawable.setAlpha(floatValue);
            FastScroller.this.mRecyclerView.invalidate();
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.OnItemTouchListener
    public final void onRequestDisallowInterceptTouchEvent() {
    }

    public final void setState(int i) {
        if (i == 2 && this.mState != 2) {
            this.mVerticalThumbDrawable.setState(PRESSED_STATE_SET);
            this.mRecyclerView.removeCallbacks(this.mHideRunnable);
        }
        if (i == 0) {
            this.mRecyclerView.invalidate();
        } else {
            show();
        }
        if (this.mState == 2 && i != 2) {
            this.mVerticalThumbDrawable.setState(EMPTY_STATE_SET);
            this.mRecyclerView.removeCallbacks(this.mHideRunnable);
            this.mRecyclerView.postDelayed(this.mHideRunnable, 1200);
        } else if (i == 1) {
            this.mRecyclerView.removeCallbacks(this.mHideRunnable);
            this.mRecyclerView.postDelayed(this.mHideRunnable, 1500);
        }
        this.mState = i;
    }

    public void hide(int i) {
        int i2 = this.mAnimationState;
        if (i2 == 1) {
            this.mShowHideAnimator.cancel();
        } else if (i2 != 2) {
            return;
        }
        this.mAnimationState = 3;
        ValueAnimator valueAnimator = this.mShowHideAnimator;
        valueAnimator.setFloatValues(((Float) valueAnimator.getAnimatedValue()).floatValue(), HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.mShowHideAnimator.setDuration(i);
        this.mShowHideAnimator.start();
    }

    public boolean isPointInsideHorizontalThumb(float f, float f2) {
        if (f2 >= this.mRecyclerViewHeight - this.mHorizontalThumbHeight) {
            int i = this.mHorizontalThumbCenterX;
            int i2 = this.mHorizontalThumbWidth;
            if (f >= i - (i2 / 2) && f <= (i2 / 2) + i) {
                return true;
            }
        }
        return false;
    }

    public boolean isPointInsideVerticalThumb(float f, float f2) {
        boolean z;
        RecyclerView recyclerView = this.mRecyclerView;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (ViewCompat.Api17Impl.getLayoutDirection(recyclerView) == 1) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            if (f > this.mVerticalThumbWidth) {
                return false;
            }
        } else if (f < this.mRecyclerViewWidth - this.mVerticalThumbWidth) {
            return false;
        }
        int i = this.mVerticalThumbCenterY;
        int i2 = this.mVerticalThumbHeight / 2;
        if (f2 < i - i2 || f2 > i2 + i) {
            return false;
        }
        return true;
    }

    public boolean isVisible() {
        if (this.mState == 1) {
            return true;
        }
        return false;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.ItemDecoration
    public final void onDrawOver(Canvas canvas) {
        int i;
        int i2;
        if (this.mRecyclerViewWidth != this.mRecyclerView.getWidth() || this.mRecyclerViewHeight != this.mRecyclerView.getHeight()) {
            this.mRecyclerViewWidth = this.mRecyclerView.getWidth();
            this.mRecyclerViewHeight = this.mRecyclerView.getHeight();
            setState(0);
        } else if (this.mAnimationState != 0) {
            if (this.mNeedVerticalScrollbar) {
                int i3 = this.mRecyclerViewWidth;
                int i4 = this.mVerticalThumbWidth;
                int i5 = i3 - i4;
                int i6 = this.mVerticalThumbCenterY;
                int i7 = this.mVerticalThumbHeight;
                int i8 = i6 - (i7 / 2);
                this.mVerticalThumbDrawable.setBounds(0, 0, i4, i7);
                this.mVerticalTrackDrawable.setBounds(0, 0, this.mVerticalTrackWidth, this.mRecyclerViewHeight);
                RecyclerView recyclerView = this.mRecyclerView;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                boolean z = true;
                if (ViewCompat.Api17Impl.getLayoutDirection(recyclerView) != 1) {
                    z = false;
                }
                if (z) {
                    this.mVerticalTrackDrawable.draw(canvas);
                    canvas.translate(this.mVerticalThumbWidth, i8);
                    canvas.scale(-1.0f, 1.0f);
                    this.mVerticalThumbDrawable.draw(canvas);
                    canvas.scale(-1.0f, 1.0f);
                    canvas.translate(-this.mVerticalThumbWidth, -i8);
                } else {
                    canvas.translate(i5, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    this.mVerticalTrackDrawable.draw(canvas);
                    canvas.translate(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, i8);
                    this.mVerticalThumbDrawable.draw(canvas);
                    canvas.translate(-i5, -i8);
                }
            }
            if (this.mNeedHorizontalScrollbar) {
                int i9 = this.mRecyclerViewHeight;
                int i10 = this.mHorizontalThumbHeight;
                int i11 = this.mHorizontalThumbCenterX;
                int i12 = this.mHorizontalThumbWidth;
                this.mHorizontalThumbDrawable.setBounds(0, 0, i12, i10);
                this.mHorizontalTrackDrawable.setBounds(0, 0, this.mRecyclerViewWidth, this.mHorizontalTrackHeight);
                canvas.translate(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, i9 - i10);
                this.mHorizontalTrackDrawable.draw(canvas);
                canvas.translate(i11 - (i12 / 2), HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                this.mHorizontalThumbDrawable.draw(canvas);
                canvas.translate(-i2, -i);
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.OnItemTouchListener
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int i = this.mState;
        if (i == 1) {
            boolean isPointInsideVerticalThumb = isPointInsideVerticalThumb(motionEvent.getX(), motionEvent.getY());
            boolean isPointInsideHorizontalThumb = isPointInsideHorizontalThumb(motionEvent.getX(), motionEvent.getY());
            if (motionEvent.getAction() == 0 && (isPointInsideVerticalThumb || isPointInsideHorizontalThumb)) {
                if (isPointInsideHorizontalThumb) {
                    this.mDragState = 1;
                    this.mHorizontalDragX = (int) motionEvent.getX();
                } else if (isPointInsideVerticalThumb) {
                    this.mDragState = 2;
                    this.mVerticalDragY = (int) motionEvent.getY();
                }
                setState(2);
                return true;
            }
        } else if (i == 2) {
            return true;
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x00bb, code lost:
        if (r8 >= 0) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0114, code lost:
        if (r5 >= 0) goto L47;
     */
    @Override // androidx.recyclerview.widget.RecyclerView.OnItemTouchListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onTouchEvent(android.view.MotionEvent r12) {
        /*
            Method dump skipped, instructions count: 288
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.FastScroller.onTouchEvent(android.view.MotionEvent):void");
    }

    public final void show() {
        int i = this.mAnimationState;
        if (i != 0) {
            if (i == 3) {
                this.mShowHideAnimator.cancel();
            } else {
                return;
            }
        }
        this.mAnimationState = 1;
        ValueAnimator valueAnimator = this.mShowHideAnimator;
        valueAnimator.setFloatValues(((Float) valueAnimator.getAnimatedValue()).floatValue(), 1.0f);
        this.mShowHideAnimator.setDuration(500L);
        this.mShowHideAnimator.setStartDelay(0L);
        this.mShowHideAnimator.start();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Runnable, androidx.recyclerview.widget.FastScroller$1] */
    /* JADX WARN: Type inference failed for: r2v2, types: [androidx.recyclerview.widget.RecyclerView$OnScrollListener, androidx.recyclerview.widget.FastScroller$2] */
    public FastScroller(RecyclerView recyclerView, StateListDrawable stateListDrawable, Drawable drawable, StateListDrawable stateListDrawable2, Drawable drawable2, int i, int i2, int i3) {
        ValueAnimator ofFloat = ValueAnimator.ofFloat(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
        this.mShowHideAnimator = ofFloat;
        ?? r0 = new Runnable() { // from class: androidx.recyclerview.widget.FastScroller.1
            @Override // java.lang.Runnable
            public final void run() {
                FastScroller.this.hide(500);
            }
        };
        this.mHideRunnable = r0;
        ?? r2 = new RecyclerView.OnScrollListener() { // from class: androidx.recyclerview.widget.FastScroller.2
            @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
            public final void onScrolled(RecyclerView recyclerView2, int i4, int i5) {
                boolean z;
                boolean z2;
                FastScroller fastScroller = FastScroller.this;
                int computeHorizontalScrollOffset = recyclerView2.computeHorizontalScrollOffset();
                int computeVerticalScrollOffset = recyclerView2.computeVerticalScrollOffset();
                int computeVerticalScrollRange = fastScroller.mRecyclerView.computeVerticalScrollRange();
                int i6 = fastScroller.mRecyclerViewHeight;
                if (computeVerticalScrollRange - i6 <= 0 || i6 < fastScroller.mScrollbarMinimumRange) {
                    z = false;
                } else {
                    z = true;
                }
                fastScroller.mNeedVerticalScrollbar = z;
                int computeHorizontalScrollRange = fastScroller.mRecyclerView.computeHorizontalScrollRange();
                int i7 = fastScroller.mRecyclerViewWidth;
                if (computeHorizontalScrollRange - i7 <= 0 || i7 < fastScroller.mScrollbarMinimumRange) {
                    z2 = false;
                } else {
                    z2 = true;
                }
                fastScroller.mNeedHorizontalScrollbar = z2;
                boolean z3 = fastScroller.mNeedVerticalScrollbar;
                if (z3 || z2) {
                    if (z3) {
                        float f = i6;
                        fastScroller.mVerticalThumbCenterY = (int) ((((f / 2.0f) + computeVerticalScrollOffset) * f) / computeVerticalScrollRange);
                        fastScroller.mVerticalThumbHeight = Math.min(i6, (i6 * i6) / computeVerticalScrollRange);
                    }
                    if (fastScroller.mNeedHorizontalScrollbar) {
                        float f2 = computeHorizontalScrollOffset;
                        float f3 = i7;
                        fastScroller.mHorizontalThumbCenterX = (int) ((((f3 / 2.0f) + f2) * f3) / computeHorizontalScrollRange);
                        fastScroller.mHorizontalThumbWidth = Math.min(i7, (i7 * i7) / computeHorizontalScrollRange);
                    }
                    int i8 = fastScroller.mState;
                    if (i8 == 0 || i8 == 1) {
                        fastScroller.setState(1);
                    }
                } else if (fastScroller.mState != 0) {
                    fastScroller.setState(0);
                }
            }
        };
        this.mOnScrollListener = r2;
        this.mVerticalThumbDrawable = stateListDrawable;
        this.mVerticalTrackDrawable = drawable;
        this.mHorizontalThumbDrawable = stateListDrawable2;
        this.mHorizontalTrackDrawable = drawable2;
        this.mVerticalThumbWidth = Math.max(i, stateListDrawable.getIntrinsicWidth());
        this.mVerticalTrackWidth = Math.max(i, drawable.getIntrinsicWidth());
        this.mHorizontalThumbHeight = Math.max(i, stateListDrawable2.getIntrinsicWidth());
        this.mHorizontalTrackHeight = Math.max(i, drawable2.getIntrinsicWidth());
        this.mScrollbarMinimumRange = i2;
        this.mMargin = i3;
        stateListDrawable.setAlpha(255);
        drawable.setAlpha(255);
        ofFloat.addListener(new AnimatorListener());
        ofFloat.addUpdateListener(new AnimatorUpdater());
        RecyclerView recyclerView2 = this.mRecyclerView;
        if (recyclerView2 != recyclerView) {
            if (recyclerView2 != null) {
                recyclerView2.removeItemDecoration(this);
                this.mRecyclerView.removeOnItemTouchListener(this);
                this.mRecyclerView.removeOnScrollListener(r2);
                this.mRecyclerView.removeCallbacks(r0);
            }
            this.mRecyclerView = recyclerView;
            if (recyclerView != null) {
                recyclerView.addItemDecoration(this);
                this.mRecyclerView.addOnItemTouchListener(this);
                this.mRecyclerView.addOnScrollListener(r2);
            }
        }
    }

    public Drawable getHorizontalThumbDrawable() {
        return this.mHorizontalThumbDrawable;
    }

    public Drawable getHorizontalTrackDrawable() {
        return this.mHorizontalTrackDrawable;
    }

    public Drawable getVerticalThumbDrawable() {
        return this.mVerticalThumbDrawable;
    }

    public Drawable getVerticalTrackDrawable() {
        return this.mVerticalTrackDrawable;
    }
}
