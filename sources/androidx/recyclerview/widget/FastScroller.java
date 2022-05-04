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
/* loaded from: classes.dex */
public class FastScroller extends RecyclerView.ItemDecoration implements RecyclerView.OnItemTouchListener {
    public float mHorizontalDragX;
    public int mHorizontalThumbCenterX;
    public final StateListDrawable mHorizontalThumbDrawable;
    public final int mHorizontalThumbHeight;
    public int mHorizontalThumbWidth;
    public final Drawable mHorizontalTrackDrawable;
    public final int mHorizontalTrackHeight;
    public final int mMargin;
    public final RecyclerView.OnScrollListener mOnScrollListener;
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
    public final Runnable mHideRunnable = new Runnable() { // from class: androidx.recyclerview.widget.FastScroller.1
        @Override // java.lang.Runnable
        public void run() {
            FastScroller.this.hide(500);
        }
    };

    /* loaded from: classes.dex */
    public class AnimatorListener extends AnimatorListenerAdapter {
        public boolean mCanceled = false;

        public AnimatorListener() {
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationCancel(Animator animation) {
            this.mCanceled = true;
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
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
        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            int floatValue = (int) (((Float) valueAnimator.getAnimatedValue()).floatValue() * 255.0f);
            FastScroller.this.mVerticalThumbDrawable.setAlpha(floatValue);
            FastScroller.this.mVerticalTrackDrawable.setAlpha(floatValue);
            FastScroller.this.mRecyclerView.invalidate();
        }
    }

    public FastScroller(RecyclerView recyclerView, StateListDrawable verticalThumbDrawable, Drawable verticalTrackDrawable, StateListDrawable horizontalThumbDrawable, Drawable horizontalTrackDrawable, int defaultWidth, int scrollbarMinimumRange, int margin) {
        ValueAnimator ofFloat = ValueAnimator.ofFloat(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f);
        this.mShowHideAnimator = ofFloat;
        RecyclerView.OnScrollListener onScrollListener = new RecyclerView.OnScrollListener() { // from class: androidx.recyclerview.widget.FastScroller.2
            @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView2, int dx, int dy) {
                FastScroller fastScroller = FastScroller.this;
                int computeHorizontalScrollOffset = recyclerView2.computeHorizontalScrollOffset();
                int computeVerticalScrollOffset = recyclerView2.computeVerticalScrollOffset();
                int computeVerticalScrollRange = fastScroller.mRecyclerView.computeVerticalScrollRange();
                int i = fastScroller.mRecyclerViewHeight;
                fastScroller.mNeedVerticalScrollbar = computeVerticalScrollRange - i > 0 && i >= fastScroller.mScrollbarMinimumRange;
                int computeHorizontalScrollRange = fastScroller.mRecyclerView.computeHorizontalScrollRange();
                int i2 = fastScroller.mRecyclerViewWidth;
                boolean z = computeHorizontalScrollRange - i2 > 0 && i2 >= fastScroller.mScrollbarMinimumRange;
                fastScroller.mNeedHorizontalScrollbar = z;
                boolean z2 = fastScroller.mNeedVerticalScrollbar;
                if (z2 || z) {
                    if (z2) {
                        float f = i;
                        fastScroller.mVerticalThumbCenterY = (int) ((((f / 2.0f) + computeVerticalScrollOffset) * f) / computeVerticalScrollRange);
                        fastScroller.mVerticalThumbHeight = Math.min(i, (i * i) / computeVerticalScrollRange);
                    }
                    if (fastScroller.mNeedHorizontalScrollbar) {
                        float f2 = computeHorizontalScrollOffset;
                        float f3 = i2;
                        fastScroller.mHorizontalThumbCenterX = (int) ((((f3 / 2.0f) + f2) * f3) / computeHorizontalScrollRange);
                        fastScroller.mHorizontalThumbWidth = Math.min(i2, (i2 * i2) / computeHorizontalScrollRange);
                    }
                    int i3 = fastScroller.mState;
                    if (i3 == 0 || i3 == 1) {
                        fastScroller.setState(1);
                    }
                } else if (fastScroller.mState != 0) {
                    fastScroller.setState(0);
                }
            }
        };
        this.mOnScrollListener = onScrollListener;
        this.mVerticalThumbDrawable = verticalThumbDrawable;
        this.mVerticalTrackDrawable = verticalTrackDrawable;
        this.mHorizontalThumbDrawable = horizontalThumbDrawable;
        this.mHorizontalTrackDrawable = horizontalTrackDrawable;
        this.mVerticalThumbWidth = Math.max(defaultWidth, verticalThumbDrawable.getIntrinsicWidth());
        this.mVerticalTrackWidth = Math.max(defaultWidth, verticalTrackDrawable.getIntrinsicWidth());
        this.mHorizontalThumbHeight = Math.max(defaultWidth, horizontalThumbDrawable.getIntrinsicWidth());
        this.mHorizontalTrackHeight = Math.max(defaultWidth, horizontalTrackDrawable.getIntrinsicWidth());
        this.mScrollbarMinimumRange = scrollbarMinimumRange;
        this.mMargin = margin;
        verticalThumbDrawable.setAlpha(255);
        verticalTrackDrawable.setAlpha(255);
        ofFloat.addListener(new AnimatorListener());
        ofFloat.addUpdateListener(new AnimatorUpdater());
        RecyclerView recyclerView2 = this.mRecyclerView;
        if (recyclerView2 != recyclerView) {
            if (recyclerView2 != null) {
                recyclerView2.removeItemDecoration(this);
                this.mRecyclerView.removeOnItemTouchListener(this);
                this.mRecyclerView.removeOnScrollListener(onScrollListener);
                cancelHide();
            }
            this.mRecyclerView = recyclerView;
            recyclerView.addItemDecoration(this);
            this.mRecyclerView.addOnItemTouchListener(this);
            this.mRecyclerView.addOnScrollListener(onScrollListener);
        }
    }

    public final void cancelHide() {
        this.mRecyclerView.removeCallbacks(this.mHideRunnable);
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

    public void hide(int duration) {
        int i = this.mAnimationState;
        if (i == 1) {
            this.mShowHideAnimator.cancel();
        } else if (i != 2) {
            return;
        }
        this.mAnimationState = 3;
        ValueAnimator valueAnimator = this.mShowHideAnimator;
        valueAnimator.setFloatValues(((Float) valueAnimator.getAnimatedValue()).floatValue(), HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.mShowHideAnimator.setDuration(duration);
        this.mShowHideAnimator.start();
    }

    public boolean isPointInsideHorizontalThumb(float x, float y) {
        if (y >= this.mRecyclerViewHeight - this.mHorizontalThumbHeight) {
            int i = this.mHorizontalThumbCenterX;
            int i2 = this.mHorizontalThumbWidth;
            if (x >= i - (i2 / 2) && x <= (i2 / 2) + i) {
                return true;
            }
        }
        return false;
    }

    public boolean isPointInsideVerticalThumb(float x, float y) {
        RecyclerView recyclerView = this.mRecyclerView;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (recyclerView.getLayoutDirection() == 1) {
            if (x > this.mVerticalThumbWidth) {
                return false;
            }
        } else if (x < this.mRecyclerViewWidth - this.mVerticalThumbWidth) {
            return false;
        }
        int i = this.mVerticalThumbCenterY;
        int i2 = this.mVerticalThumbHeight / 2;
        return y >= ((float) (i - i2)) && y <= ((float) (i2 + i));
    }

    public boolean isVisible() {
        return this.mState == 1;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.ItemDecoration
    public void onDrawOver(Canvas canvas, RecyclerView parent, RecyclerView.State state) {
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
                if (recyclerView.getLayoutDirection() != 1) {
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
    public boolean onInterceptTouchEvent(RecyclerView recyclerView, MotionEvent ev) {
        int i = this.mState;
        if (i == 1) {
            boolean isPointInsideVerticalThumb = isPointInsideVerticalThumb(ev.getX(), ev.getY());
            boolean isPointInsideHorizontalThumb = isPointInsideHorizontalThumb(ev.getX(), ev.getY());
            if (ev.getAction() == 0 && (isPointInsideVerticalThumb || isPointInsideHorizontalThumb)) {
                if (isPointInsideHorizontalThumb) {
                    this.mDragState = 1;
                    this.mHorizontalDragX = (int) ev.getX();
                } else if (isPointInsideVerticalThumb) {
                    this.mDragState = 2;
                    this.mVerticalDragY = (int) ev.getY();
                }
                setState(2);
                return true;
            }
        } else if (i == 2) {
            return true;
        }
        return false;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.OnItemTouchListener
    public void onRequestDisallowInterceptTouchEvent(boolean disallowIntercept) {
    }

    @Override // androidx.recyclerview.widget.RecyclerView.OnItemTouchListener
    public void onTouchEvent(RecyclerView recyclerView, MotionEvent me) {
        if (this.mState != 0) {
            if (me.getAction() == 0) {
                boolean isPointInsideVerticalThumb = isPointInsideVerticalThumb(me.getX(), me.getY());
                boolean isPointInsideHorizontalThumb = isPointInsideHorizontalThumb(me.getX(), me.getY());
                if (isPointInsideVerticalThumb || isPointInsideHorizontalThumb) {
                    if (isPointInsideHorizontalThumb) {
                        this.mDragState = 1;
                        this.mHorizontalDragX = (int) me.getX();
                    } else if (isPointInsideVerticalThumb) {
                        this.mDragState = 2;
                        this.mVerticalDragY = (int) me.getY();
                    }
                    setState(2);
                }
            } else if (me.getAction() == 1 && this.mState == 2) {
                this.mVerticalDragY = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                this.mHorizontalDragX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
                setState(1);
                this.mDragState = 0;
            } else if (me.getAction() == 2 && this.mState == 2) {
                show();
                if (this.mDragState == 1) {
                    float x = me.getX();
                    int[] iArr = this.mHorizontalRange;
                    int i = this.mMargin;
                    iArr[0] = i;
                    iArr[1] = this.mRecyclerViewWidth - i;
                    float max = Math.max(iArr[0], Math.min(iArr[1], x));
                    if (Math.abs(this.mHorizontalThumbCenterX - max) >= 2.0f) {
                        int scrollTo = scrollTo(this.mHorizontalDragX, max, iArr, this.mRecyclerView.computeHorizontalScrollRange(), this.mRecyclerView.computeHorizontalScrollOffset(), this.mRecyclerViewWidth);
                        if (scrollTo != 0) {
                            this.mRecyclerView.scrollBy(scrollTo, 0);
                        }
                        this.mHorizontalDragX = max;
                    }
                }
                if (this.mDragState == 2) {
                    float y = me.getY();
                    int[] iArr2 = this.mVerticalRange;
                    int i2 = this.mMargin;
                    iArr2[0] = i2;
                    iArr2[1] = this.mRecyclerViewHeight - i2;
                    float max2 = Math.max(iArr2[0], Math.min(iArr2[1], y));
                    if (Math.abs(this.mVerticalThumbCenterY - max2) >= 2.0f) {
                        int scrollTo2 = scrollTo(this.mVerticalDragY, max2, iArr2, this.mRecyclerView.computeVerticalScrollRange(), this.mRecyclerView.computeVerticalScrollOffset(), this.mRecyclerViewHeight);
                        if (scrollTo2 != 0) {
                            this.mRecyclerView.scrollBy(0, scrollTo2);
                        }
                        this.mVerticalDragY = max2;
                    }
                }
            }
        }
    }

    public final int scrollTo(float oldDragPos, float newDragPos, int[] scrollbarRange, int scrollRange, int scrollOffset, int viewLength) {
        int i = scrollbarRange[1] - scrollbarRange[0];
        if (i == 0) {
            return 0;
        }
        int i2 = scrollRange - viewLength;
        int i3 = (int) (((newDragPos - oldDragPos) / i) * i2);
        int i4 = scrollOffset + i3;
        if (i4 >= i2 || i4 < 0) {
            return 0;
        }
        return i3;
    }

    public void setState(int state) {
        if (state == 2 && this.mState != 2) {
            this.mVerticalThumbDrawable.setState(PRESSED_STATE_SET);
            cancelHide();
        }
        if (state == 0) {
            this.mRecyclerView.invalidate();
        } else {
            show();
        }
        if (this.mState == 2 && state != 2) {
            this.mVerticalThumbDrawable.setState(EMPTY_STATE_SET);
            cancelHide();
            this.mRecyclerView.postDelayed(this.mHideRunnable, 1200);
        } else if (state == 1) {
            cancelHide();
            this.mRecyclerView.postDelayed(this.mHideRunnable, 1500);
        }
        this.mState = state;
    }

    public void show() {
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
}
