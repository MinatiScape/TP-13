package androidx.transition;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.TypeConverter;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.Property;
import android.view.View;
import android.view.ViewGroup;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import java.util.HashMap;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class ChangeBounds extends Transition {
    public static final String[] sTransitionProperties = {"android:changeBounds:bounds", "android:changeBounds:clip", "android:changeBounds:parent", "android:changeBounds:windowX", "android:changeBounds:windowY"};
    public static final AnonymousClass1 DRAWABLE_ORIGIN_PROPERTY = new Property<Drawable, PointF>(PointF.class) { // from class: androidx.transition.ChangeBounds.1
        public Rect mBounds = new Rect();

        @Override // android.util.Property
        public final PointF get(Drawable drawable) {
            drawable.copyBounds(this.mBounds);
            Rect rect = this.mBounds;
            return new PointF(rect.left, rect.top);
        }

        @Override // android.util.Property
        public final void set(Drawable drawable, PointF pointF) {
            Drawable drawable2 = drawable;
            PointF pointF2 = pointF;
            drawable2.copyBounds(this.mBounds);
            this.mBounds.offsetTo(Math.round(pointF2.x), Math.round(pointF2.y));
            drawable2.setBounds(this.mBounds);
        }
    };
    public static final AnonymousClass2 TOP_LEFT_PROPERTY = new Property<ViewBounds, PointF>(PointF.class) { // from class: androidx.transition.ChangeBounds.2
        @Override // android.util.Property
        public final /* bridge */ /* synthetic */ PointF get(ViewBounds viewBounds) {
            return null;
        }

        @Override // android.util.Property
        public final void set(ViewBounds viewBounds, PointF pointF) {
            ViewBounds viewBounds2 = viewBounds;
            PointF pointF2 = pointF;
            viewBounds2.getClass();
            viewBounds2.mLeft = Math.round(pointF2.x);
            int round = Math.round(pointF2.y);
            viewBounds2.mTop = round;
            int i = viewBounds2.mTopLeftCalls + 1;
            viewBounds2.mTopLeftCalls = i;
            if (i == viewBounds2.mBottomRightCalls) {
                View view = viewBounds2.mView;
                int i2 = viewBounds2.mLeft;
                int i3 = viewBounds2.mRight;
                int i4 = viewBounds2.mBottom;
                ViewUtilsApi29 viewUtilsApi29 = ViewUtils.IMPL;
                view.setLeftTopRightBottom(i2, round, i3, i4);
                viewBounds2.mTopLeftCalls = 0;
                viewBounds2.mBottomRightCalls = 0;
            }
        }
    };
    public static final AnonymousClass3 BOTTOM_RIGHT_PROPERTY = new Property<ViewBounds, PointF>(PointF.class) { // from class: androidx.transition.ChangeBounds.3
        @Override // android.util.Property
        public final /* bridge */ /* synthetic */ PointF get(ViewBounds viewBounds) {
            return null;
        }

        @Override // android.util.Property
        public final void set(ViewBounds viewBounds, PointF pointF) {
            ViewBounds viewBounds2 = viewBounds;
            PointF pointF2 = pointF;
            viewBounds2.getClass();
            viewBounds2.mRight = Math.round(pointF2.x);
            int round = Math.round(pointF2.y);
            viewBounds2.mBottom = round;
            int i = viewBounds2.mBottomRightCalls + 1;
            viewBounds2.mBottomRightCalls = i;
            if (viewBounds2.mTopLeftCalls == i) {
                View view = viewBounds2.mView;
                int i2 = viewBounds2.mLeft;
                int i3 = viewBounds2.mTop;
                int i4 = viewBounds2.mRight;
                ViewUtilsApi29 viewUtilsApi29 = ViewUtils.IMPL;
                view.setLeftTopRightBottom(i2, i3, i4, round);
                viewBounds2.mTopLeftCalls = 0;
                viewBounds2.mBottomRightCalls = 0;
            }
        }
    };
    public static final AnonymousClass4 BOTTOM_RIGHT_ONLY_PROPERTY = new Property<View, PointF>(PointF.class) { // from class: androidx.transition.ChangeBounds.4
        @Override // android.util.Property
        public final /* bridge */ /* synthetic */ PointF get(View view) {
            return null;
        }

        @Override // android.util.Property
        public final void set(View view, PointF pointF) {
            View view2 = view;
            PointF pointF2 = pointF;
            int left = view2.getLeft();
            int top = view2.getTop();
            int round = Math.round(pointF2.x);
            int round2 = Math.round(pointF2.y);
            ViewUtilsApi29 viewUtilsApi29 = ViewUtils.IMPL;
            view2.setLeftTopRightBottom(left, top, round, round2);
        }
    };
    public static final AnonymousClass5 TOP_LEFT_ONLY_PROPERTY = new Property<View, PointF>(PointF.class) { // from class: androidx.transition.ChangeBounds.5
        @Override // android.util.Property
        public final /* bridge */ /* synthetic */ PointF get(View view) {
            return null;
        }

        @Override // android.util.Property
        public final void set(View view, PointF pointF) {
            View view2 = view;
            PointF pointF2 = pointF;
            int round = Math.round(pointF2.x);
            int round2 = Math.round(pointF2.y);
            int right = view2.getRight();
            int bottom = view2.getBottom();
            ViewUtilsApi29 viewUtilsApi29 = ViewUtils.IMPL;
            view2.setLeftTopRightBottom(round, round2, right, bottom);
        }
    };
    public static final AnonymousClass6 POSITION_PROPERTY = new Property<View, PointF>(PointF.class) { // from class: androidx.transition.ChangeBounds.6
        @Override // android.util.Property
        public final /* bridge */ /* synthetic */ PointF get(View view) {
            return null;
        }

        @Override // android.util.Property
        public final void set(View view, PointF pointF) {
            View view2 = view;
            PointF pointF2 = pointF;
            int round = Math.round(pointF2.x);
            int round2 = Math.round(pointF2.y);
            ViewUtilsApi29 viewUtilsApi29 = ViewUtils.IMPL;
            view2.setLeftTopRightBottom(round, round2, view2.getWidth() + round, view2.getHeight() + round2);
        }
    };

    /* loaded from: classes.dex */
    public static class ViewBounds {
        public int mBottom;
        public int mBottomRightCalls;
        public int mLeft;
        public int mRight;
        public int mTop;
        public int mTopLeftCalls;
        public View mView;

        public ViewBounds(View view) {
            this.mView = view;
        }
    }

    public final void captureValues(TransitionValues transitionValues) {
        View view = transitionValues.view;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        if (ViewCompat.Api19Impl.isLaidOut(view) || view.getWidth() != 0 || view.getHeight() != 0) {
            transitionValues.values.put("android:changeBounds:bounds", new Rect(view.getLeft(), view.getTop(), view.getRight(), view.getBottom()));
            transitionValues.values.put("android:changeBounds:parent", transitionValues.view.getParent());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // androidx.transition.Transition
    public final Animator createAnimator(ViewGroup viewGroup, TransitionValues transitionValues, TransitionValues transitionValues2) {
        int i;
        ObjectAnimator objectAnimator;
        ChangeBounds changeBounds;
        if (transitionValues == null || transitionValues2 == null) {
            return null;
        }
        HashMap hashMap = transitionValues.values;
        HashMap hashMap2 = transitionValues2.values;
        ViewGroup viewGroup2 = (ViewGroup) hashMap.get("android:changeBounds:parent");
        ViewGroup viewGroup3 = (ViewGroup) hashMap2.get("android:changeBounds:parent");
        if (viewGroup2 == null || viewGroup3 == null) {
            return null;
        }
        View view = transitionValues2.view;
        Rect rect = (Rect) transitionValues.values.get("android:changeBounds:bounds");
        Rect rect2 = (Rect) transitionValues2.values.get("android:changeBounds:bounds");
        int i2 = rect.left;
        int i3 = rect2.left;
        int i4 = rect.top;
        int i5 = rect2.top;
        int i6 = rect.right;
        int i7 = rect2.right;
        int i8 = rect.bottom;
        int i9 = rect2.bottom;
        int i10 = i6 - i2;
        int i11 = i8 - i4;
        int i12 = i7 - i3;
        int i13 = i9 - i5;
        Rect rect3 = (Rect) transitionValues.values.get("android:changeBounds:clip");
        Rect rect4 = (Rect) transitionValues2.values.get("android:changeBounds:clip");
        if ((i10 == 0 || i11 == 0) && (i12 == 0 || i13 == 0)) {
            i = 0;
        } else {
            if (i2 == i3 && i4 == i5) {
                i = 0;
            } else {
                i = 1;
            }
            if (!(i6 == i7 && i8 == i9)) {
                i++;
            }
        }
        if ((rect3 != null && !rect3.equals(rect4)) || (rect3 == null && rect4 != null)) {
            i++;
        }
        int i14 = i;
        if (i14 <= 0) {
            return null;
        }
        ViewUtilsApi29 viewUtilsApi29 = ViewUtils.IMPL;
        view.setLeftTopRightBottom(i2, i4, i6, i8);
        if (i14 != 2) {
            changeBounds = this;
            if (i2 == i3 && i4 == i5) {
                objectAnimator = ObjectAnimator.ofObject(view, BOTTOM_RIGHT_ONLY_PROPERTY, (TypeConverter) null, changeBounds.mPathMotion.getPath(i6, i8, i7, i9));
            } else {
                objectAnimator = ObjectAnimator.ofObject(view, TOP_LEFT_ONLY_PROPERTY, (TypeConverter) null, changeBounds.mPathMotion.getPath(i2, i4, i3, i5));
            }
        } else if (i10 == i12 && i11 == i13) {
            changeBounds = this;
            objectAnimator = ObjectAnimator.ofObject(view, POSITION_PROPERTY, (TypeConverter) null, changeBounds.mPathMotion.getPath(i2, i4, i3, i5));
        } else {
            changeBounds = this;
            ViewBounds viewBounds = new ViewBounds(view);
            ObjectAnimator ofObject = ObjectAnimator.ofObject(viewBounds, TOP_LEFT_PROPERTY, (TypeConverter) null, changeBounds.mPathMotion.getPath(i2, i4, i3, i5));
            ObjectAnimator ofObject2 = ObjectAnimator.ofObject(viewBounds, BOTTOM_RIGHT_PROPERTY, (TypeConverter) null, changeBounds.mPathMotion.getPath(i6, i8, i7, i9));
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.playTogether(ofObject, ofObject2);
            animatorSet.addListener(new AnimatorListenerAdapter(viewBounds) { // from class: androidx.transition.ChangeBounds.7
                private ViewBounds mViewBounds;

                {
                    this.mViewBounds = viewBounds;
                }
            });
            objectAnimator = animatorSet;
        }
        if (view.getParent() instanceof ViewGroup) {
            final ViewGroup viewGroup4 = (ViewGroup) view.getParent();
            viewGroup4.suppressLayout(true);
            changeBounds.addListener(new TransitionListenerAdapter() { // from class: androidx.transition.ChangeBounds.9
                public boolean mCanceled = false;

                @Override // androidx.transition.TransitionListenerAdapter, androidx.transition.Transition.TransitionListener
                public final void onTransitionCancel() {
                    viewGroup4.suppressLayout(false);
                    this.mCanceled = true;
                }

                @Override // androidx.transition.Transition.TransitionListener
                public final void onTransitionEnd(Transition transition) {
                    if (!this.mCanceled) {
                        viewGroup4.suppressLayout(false);
                    }
                    transition.removeListener(this);
                }

                @Override // androidx.transition.TransitionListenerAdapter, androidx.transition.Transition.TransitionListener
                public final void onTransitionPause() {
                    viewGroup4.suppressLayout(false);
                }

                @Override // androidx.transition.TransitionListenerAdapter, androidx.transition.Transition.TransitionListener
                public final void onTransitionResume() {
                    viewGroup4.suppressLayout(true);
                }
            });
        }
        return objectAnimator;
    }

    @Override // androidx.transition.Transition
    public final void captureEndValues(TransitionValues transitionValues) {
        captureValues(transitionValues);
    }

    @Override // androidx.transition.Transition
    public final void captureStartValues(TransitionValues transitionValues) {
        captureValues(transitionValues);
    }

    @Override // androidx.transition.Transition
    public final String[] getTransitionProperties() {
        return sTransitionProperties;
    }
}
