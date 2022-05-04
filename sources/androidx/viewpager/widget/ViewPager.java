package androidx.viewpager.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.EdgeEffect;
import android.widget.Scroller;
import androidx.core.graphics.Insets;
import androidx.core.view.AccessibilityDelegateCompat;
import androidx.core.view.OnApplyWindowInsetsListener;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.core.widget.EdgeEffectCompat$Api31Impl;
import androidx.customview.view.AbsSavedState;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.widget.PreviewPager$$ExternalSyntheticLambda2;
import com.google.common.math.IntMath;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class ViewPager extends ViewGroup {
    public static final int[] LAYOUT_ATTRS = {16842931};
    public static final AnonymousClass2 sInterpolator = new Interpolator() { // from class: androidx.viewpager.widget.ViewPager.2
        @Override // android.animation.TimeInterpolator
        public final float getInterpolation(float f) {
            float f2 = f - 1.0f;
            return (f2 * f2 * f2 * f2 * f2) + 1.0f;
        }
    };
    public static final ViewPositionComparator sPositionComparator = new ViewPositionComparator();
    public ArrayList mAdapterChangeListeners;
    public boolean mCalledSuper;
    public int mCloseEnough;
    public int mCurItem;
    public int mDecorChildCount;
    public int mDefaultGutterSize;
    public int mDrawingOrder;
    public ArrayList<View> mDrawingOrderedChildren;
    public int mGutterSize;
    public boolean mInLayout;
    public float mInitialMotionX;
    public float mInitialMotionY;
    public boolean mIsBeingDragged;
    public boolean mIsScrollStarted;
    public boolean mIsUnableToDrag;
    public float mLastMotionX;
    public float mLastMotionY;
    public EdgeEffect mLeftEdge;
    public ArrayList mOnPageChangeListeners;
    public int mPageMargin;
    public PageTransformer mPageTransformer;
    public int mPageTransformerLayerType;
    public Parcelable mRestoredAdapterState;
    public EdgeEffect mRightEdge;
    public Scroller mScroller;
    public boolean mScrollingCacheEnabled;
    public int mTouchSlop;
    public VelocityTracker mVelocityTracker;
    public final ArrayList<ItemInfo> mItems = new ArrayList<>();
    public final ItemInfo mTempItem = new ItemInfo();
    public final Rect mTempRect = new Rect();
    public float mFirstOffset = -3.4028235E38f;
    public float mLastOffset = Float.MAX_VALUE;
    public boolean mDragInGutterEnabled = true;
    public int mActivePointerId = -1;
    public boolean mFirstLayout = true;
    public final AnonymousClass3 mEndScrollRunnable = new AnonymousClass3();
    public int mScrollState = 0;

    /* renamed from: androidx.viewpager.widget.ViewPager$3  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass3 implements Runnable {
        public AnonymousClass3() {
        }

        @Override // java.lang.Runnable
        public final void run() {
            ViewPager.this.setScrollState(0);
            ViewPager viewPager = ViewPager.this;
            if (viewPager.mDrawingOrder != 0) {
                ArrayList<View> arrayList = viewPager.mDrawingOrderedChildren;
                if (arrayList == null) {
                    viewPager.mDrawingOrderedChildren = new ArrayList<>();
                } else {
                    arrayList.clear();
                }
                int childCount = viewPager.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    viewPager.mDrawingOrderedChildren.add(viewPager.getChildAt(i));
                }
                Collections.sort(viewPager.mDrawingOrderedChildren, ViewPager.sPositionComparator);
            }
        }
    }

    @Target({ElementType.TYPE})
    @Inherited
    @Retention(RetentionPolicy.RUNTIME)
    /* loaded from: classes.dex */
    public @interface DecorView {
    }

    /* loaded from: classes.dex */
    public static class ItemInfo {
        public float offset;
        public int position;
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends ViewGroup.LayoutParams {
        public int gravity;
        public boolean isDecor;

        public LayoutParams() {
            super(-1, -1);
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ViewPager.LAYOUT_ATTRS);
            this.gravity = obtainStyledAttributes.getInteger(0, 48);
            obtainStyledAttributes.recycle();
        }
    }

    /* loaded from: classes.dex */
    public class MyAccessibilityDelegate extends AccessibilityDelegateCompat {
        public MyAccessibilityDelegate() {
        }

        @Override // androidx.core.view.AccessibilityDelegateCompat
        public final void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
            this.mOriginalDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat.mInfo);
            accessibilityNodeInfoCompat.mInfo.setClassName("androidx.viewpager.widget.ViewPager");
            ViewPager.this.getClass();
            accessibilityNodeInfoCompat.mInfo.setScrollable(false);
            if (ViewPager.this.canScrollHorizontally(1)) {
                accessibilityNodeInfoCompat.addAction(QuickStepContract.SYSUI_STATE_TRACING_ENABLED);
            }
            if (ViewPager.this.canScrollHorizontally(-1)) {
                accessibilityNodeInfoCompat.addAction(QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED);
            }
        }

        @Override // androidx.core.view.AccessibilityDelegateCompat
        public final void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
            super.onInitializeAccessibilityEvent(view, accessibilityEvent);
            accessibilityEvent.setClassName("androidx.viewpager.widget.ViewPager");
            ViewPager.this.getClass();
            accessibilityEvent.setScrollable(false);
            if (accessibilityEvent.getEventType() == 4096) {
                ViewPager.this.getClass();
            }
        }

        @Override // androidx.core.view.AccessibilityDelegateCompat
        public final boolean performAccessibilityAction(View view, int i, Bundle bundle) {
            if (super.performAccessibilityAction(view, i, bundle)) {
                return true;
            }
            if (i != 4096) {
                if (i != 8192 || !ViewPager.this.canScrollHorizontally(-1)) {
                    return false;
                }
                ViewPager viewPager = ViewPager.this;
                int i2 = viewPager.mCurItem;
                viewPager.setScrollingCacheEnabled(false);
                return true;
            } else if (!ViewPager.this.canScrollHorizontally(1)) {
                return false;
            } else {
                ViewPager viewPager2 = ViewPager.this;
                int i3 = viewPager2.mCurItem;
                viewPager2.setScrollingCacheEnabled(false);
                return true;
            }
        }
    }

    /* loaded from: classes.dex */
    public interface OnPageChangeListener {
        void onPageScrollStateChanged(int i);

        void onPageScrolled(int i, float f);
    }

    /* loaded from: classes.dex */
    public interface PageTransformer {
    }

    /* loaded from: classes.dex */
    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SavedState>() { // from class: androidx.viewpager.widget.ViewPager.SavedState.1
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
        public Parcelable adapterState;
        public int position;

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            classLoader = classLoader == null ? getClass().getClassLoader() : classLoader;
            this.position = parcel.readInt();
            this.adapterState = parcel.readParcelable(classLoader);
        }

        public final String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("FragmentPager.SavedState{");
            m.append(Integer.toHexString(System.identityHashCode(this)));
            m.append(" position=");
            m.append(this.position);
            m.append("}");
            return m.toString();
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mSuperState, i);
            parcel.writeInt(this.position);
            parcel.writeParcelable(this.adapterState, i);
        }
    }

    /* loaded from: classes.dex */
    public static class ViewPositionComparator implements Comparator<View> {
        @Override // java.util.Comparator
        public final int compare(View view, View view2) {
            boolean z = ((LayoutParams) view.getLayoutParams()).isDecor;
            if (z == ((LayoutParams) view2.getLayoutParams()).isDecor) {
                return 0;
            }
            if (z) {
                return 1;
            }
            return -1;
        }
    }

    public ViewPager(Context context) {
        super(context);
        initViewPager(context);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addTouchables(ArrayList<View> arrayList) {
        for (int i = 0; i < getChildCount(); i++) {
            if (getChildAt(i).getVisibility() == 0) {
                infoForChild();
            }
        }
    }

    @Override // android.view.View
    public final boolean canScrollHorizontally(int i) {
        return false;
    }

    @Override // android.view.View
    public final void computeScroll() {
        this.mIsScrollStarted = true;
        if (this.mScroller.isFinished() || !this.mScroller.computeScrollOffset()) {
            completeScroll(true);
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int currX = this.mScroller.getCurrX();
        int currY = this.mScroller.getCurrY();
        if (!(scrollX == currX && scrollY == currY)) {
            scrollTo(currX, currY);
            if (!pageScrolled(currX)) {
                this.mScroller.abortAnimation();
                scrollTo(0, currY);
            }
        }
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        ViewCompat.Api16Impl.postInvalidateOnAnimation(this);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return generateDefaultLayoutParams();
    }

    public final ItemInfo infoForPosition(int i) {
        for (int i2 = 0; i2 < this.mItems.size(); i2++) {
            ItemInfo itemInfo = this.mItems.get(i2);
            if (itemInfo.position == i) {
                return itemInfo;
            }
        }
        return null;
    }

    public final void initViewPager(Context context) {
        setWillNotDraw(false);
        setDescendantFocusability(QuickStepContract.SYSUI_STATE_IME_SHOWING);
        setFocusable(true);
        this.mScroller = new Scroller(context, sInterpolator);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        float f = context.getResources().getDisplayMetrics().density;
        this.mTouchSlop = viewConfiguration.getScaledPagingTouchSlop();
        viewConfiguration.getScaledMaximumFlingVelocity();
        this.mLeftEdge = new EdgeEffect(context);
        this.mRightEdge = new EdgeEffect(context);
        this.mCloseEnough = (int) (2.0f * f);
        this.mDefaultGutterSize = (int) (f * 16.0f);
        ViewCompat.setAccessibilityDelegate(this, new MyAccessibilityDelegate());
        if (ViewCompat.Api16Impl.getImportantForAccessibility(this) == 0) {
            ViewCompat.Api16Impl.setImportantForAccessibility(this, 1);
        }
        ViewCompat.Api21Impl.setOnApplyWindowInsetsListener(this, new OnApplyWindowInsetsListener() { // from class: androidx.viewpager.widget.ViewPager.4
            public final Rect mTempRect = new Rect();

            @Override // androidx.core.view.OnApplyWindowInsetsListener
            public final WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
                WindowInsetsCompat onApplyWindowInsets = ViewCompat.onApplyWindowInsets(view, windowInsetsCompat);
                if (onApplyWindowInsets.mImpl.isConsumed()) {
                    return onApplyWindowInsets;
                }
                Rect rect = this.mTempRect;
                rect.left = onApplyWindowInsets.getSystemWindowInsetLeft();
                rect.top = onApplyWindowInsets.getSystemWindowInsetTop();
                rect.right = onApplyWindowInsets.getSystemWindowInsetRight();
                rect.bottom = onApplyWindowInsets.getSystemWindowInsetBottom();
                int childCount = ViewPager.this.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    WindowInsetsCompat dispatchApplyWindowInsets = ViewCompat.dispatchApplyWindowInsets(ViewPager.this.getChildAt(i), onApplyWindowInsets);
                    rect.left = Math.min(dispatchApplyWindowInsets.getSystemWindowInsetLeft(), rect.left);
                    rect.top = Math.min(dispatchApplyWindowInsets.getSystemWindowInsetTop(), rect.top);
                    rect.right = Math.min(dispatchApplyWindowInsets.getSystemWindowInsetRight(), rect.right);
                    rect.bottom = Math.min(dispatchApplyWindowInsets.getSystemWindowInsetBottom(), rect.bottom);
                }
                WindowInsetsCompat.BuilderImpl30 builderImpl30 = new WindowInsetsCompat.BuilderImpl30(onApplyWindowInsets);
                builderImpl30.setSystemWindowInsets(Insets.of(rect.left, rect.top, rect.right, rect.bottom));
                return builderImpl30.build();
            }
        });
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        LayoutParams layoutParams;
        LayoutParams layoutParams2;
        boolean z;
        int i3;
        setMeasuredDimension(View.getDefaultSize(0, i), View.getDefaultSize(0, i2));
        int measuredWidth = getMeasuredWidth();
        this.mGutterSize = Math.min(measuredWidth / 10, this.mDefaultGutterSize);
        int paddingLeft = (measuredWidth - getPaddingLeft()) - getPaddingRight();
        int measuredHeight = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int childCount = getChildCount();
        int i4 = 0;
        while (true) {
            int i5 = IntMath.MAX_SIGNED_POWER_OF_TWO;
            boolean z2 = true;
            if (i4 >= childCount) {
                break;
            }
            View childAt = getChildAt(i4);
            if (!(childAt.getVisibility() == 8 || (layoutParams2 = (LayoutParams) childAt.getLayoutParams()) == null || !layoutParams2.isDecor)) {
                int i6 = layoutParams2.gravity;
                int i7 = i6 & 7;
                int i8 = i6 & R.styleable.AppCompatTheme_toolbarNavigationButtonStyle;
                if (i8 == 48 || i8 == 80) {
                    z = true;
                } else {
                    z = false;
                }
                if (!(i7 == 3 || i7 == 5)) {
                    z2 = false;
                }
                int i9 = RecyclerView.UNDEFINED_DURATION;
                if (z) {
                    i3 = 1073741824;
                } else {
                    i3 = Integer.MIN_VALUE;
                    if (z2) {
                        i9 = 1073741824;
                    }
                }
                int i10 = ((ViewGroup.LayoutParams) layoutParams2).width;
                if (i10 != -2) {
                    if (i10 == -1) {
                        i10 = paddingLeft;
                    }
                    i3 = 1073741824;
                } else {
                    i10 = paddingLeft;
                }
                int i11 = ((ViewGroup.LayoutParams) layoutParams2).height;
                if (i11 == -2) {
                    i11 = measuredHeight;
                    i5 = i9;
                } else if (i11 == -1) {
                    i11 = measuredHeight;
                }
                childAt.measure(View.MeasureSpec.makeMeasureSpec(i10, i3), View.MeasureSpec.makeMeasureSpec(i11, i5));
                if (z) {
                    measuredHeight -= childAt.getMeasuredHeight();
                } else if (z2) {
                    paddingLeft -= childAt.getMeasuredWidth();
                }
            }
            i4++;
        }
        View.MeasureSpec.makeMeasureSpec(paddingLeft, IntMath.MAX_SIGNED_POWER_OF_TWO);
        int makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(measuredHeight, IntMath.MAX_SIGNED_POWER_OF_TWO);
        this.mInLayout = true;
        if (this.mDrawingOrder != 0) {
            ArrayList<View> arrayList = this.mDrawingOrderedChildren;
            if (arrayList == null) {
                this.mDrawingOrderedChildren = new ArrayList<>();
            } else {
                arrayList.clear();
            }
            int childCount2 = getChildCount();
            for (int i12 = 0; i12 < childCount2; i12++) {
                this.mDrawingOrderedChildren.add(getChildAt(i12));
            }
            Collections.sort(this.mDrawingOrderedChildren, sPositionComparator);
        }
        this.mInLayout = false;
        int childCount3 = getChildCount();
        for (int i13 = 0; i13 < childCount3; i13++) {
            View childAt2 = getChildAt(i13);
            if (childAt2.getVisibility() != 8 && ((layoutParams = (LayoutParams) childAt2.getLayoutParams()) == null || !layoutParams.isDecor)) {
                layoutParams.getClass();
                childAt2.measure(View.MeasureSpec.makeMeasureSpec((int) (paddingLeft * HingeAngleProviderKt.FULLY_CLOSED_DEGREES), IntMath.MAX_SIGNED_POWER_OF_TWO), makeMeasureSpec);
            }
        }
    }

    public static boolean canScroll(View view, boolean z, int i, int i2, int i3) {
        int i4;
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int scrollX = view.getScrollX();
            int scrollY = view.getScrollY();
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                int i5 = i2 + scrollX;
                if (i5 >= childAt.getLeft() && i5 < childAt.getRight() && (i4 = i3 + scrollY) >= childAt.getTop() && i4 < childAt.getBottom() && canScroll(childAt, true, i, i5 - childAt.getLeft(), i4 - childAt.getTop())) {
                    return true;
                }
            }
        }
        if (!z || !view.canScrollHorizontally(-i)) {
            return false;
        }
        return true;
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (!(layoutParams instanceof LayoutParams) || !super.checkLayoutParams(layoutParams)) {
            return false;
        }
        return true;
    }

    public final void completeScroll(boolean z) {
        boolean z2;
        if (this.mScrollState == 2) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (z2) {
            setScrollingCacheEnabled(false);
            if (true ^ this.mScroller.isFinished()) {
                this.mScroller.abortAnimation();
                int scrollX = getScrollX();
                int scrollY = getScrollY();
                int currX = this.mScroller.getCurrX();
                int currY = this.mScroller.getCurrY();
                if (!(scrollX == currX && scrollY == currY)) {
                    scrollTo(currX, currY);
                    if (currX != scrollX) {
                        pageScrolled(currX);
                    }
                }
            }
        }
        for (int i = 0; i < this.mItems.size(); i++) {
            this.mItems.get(i).getClass();
        }
        if (!z2) {
            return;
        }
        if (z) {
            AnonymousClass3 r7 = this.mEndScrollRunnable;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.postOnAnimation(this, r7);
            return;
        }
        this.mEndScrollRunnable.run();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup
    public final int getChildDrawingOrder(int i, int i2) {
        if (this.mDrawingOrder == 2) {
            i2 = (i - 1) - i2;
        }
        ((LayoutParams) this.mDrawingOrderedChildren.get(i2).getLayoutParams()).getClass();
        return 0;
    }

    public final Rect getChildRectInPagerCoordinates(Rect rect, View view) {
        if (rect == null) {
            rect = new Rect();
        }
        if (view == null) {
            rect.set(0, 0, 0, 0);
            return rect;
        }
        rect.left = view.getLeft();
        rect.right = view.getRight();
        rect.top = view.getTop();
        rect.bottom = view.getBottom();
        ViewParent parent = view.getParent();
        while ((parent instanceof ViewGroup) && parent != this) {
            ViewGroup viewGroup = (ViewGroup) parent;
            rect.left = viewGroup.getLeft() + rect.left;
            rect.right = viewGroup.getRight() + rect.right;
            rect.top = viewGroup.getTop() + rect.top;
            rect.bottom = viewGroup.getBottom() + rect.bottom;
            parent = viewGroup.getParent();
        }
        return rect;
    }

    public final void infoForChild() {
        if (this.mItems.size() > 0) {
            this.mItems.get(0).getClass();
            throw null;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        removeCallbacks(this.mEndScrollRunnable);
        Scroller scroller = this.mScroller;
        if (scroller != null && !scroller.isFinished()) {
            this.mScroller.abortAnimation();
        }
        super.onDetachedFromWindow();
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x008e  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onLayout(boolean r19, int r20, int r21, int r22, int r23) {
        /*
            Method dump skipped, instructions count: 263
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.viewpager.widget.ViewPager.onLayout(boolean, int, int, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0064  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onPageScrolled(int r12, float r13, int r14) {
        /*
            Method dump skipped, instructions count: 237
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.viewpager.widget.ViewPager.onPageScrolled(int, float, int):void");
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.mSuperState);
        this.mRestoredAdapterState = savedState.adapterState;
    }

    public final boolean pageScrolled(int i) {
        float f;
        float f2;
        int i2;
        if (this.mItems.size() != 0) {
            int clientWidth = getClientWidth();
            if (clientWidth > 0) {
                f = getScrollX() / clientWidth;
            } else {
                f = 0.0f;
            }
            if (clientWidth > 0) {
                f2 = this.mPageMargin / clientWidth;
            } else {
                f2 = 0.0f;
            }
            int i3 = -1;
            int i4 = 0;
            float f3 = 0.0f;
            ItemInfo itemInfo = null;
            boolean z = true;
            while (i4 < this.mItems.size()) {
                ItemInfo itemInfo2 = this.mItems.get(i4);
                if (z || itemInfo2.position == (i2 = i3 + 1)) {
                    f3 = itemInfo2.offset;
                    float f4 = HingeAngleProviderKt.FULLY_CLOSED_DEGREES + f3 + f2;
                    if (!z && f < f3) {
                        break;
                    } else if (f < f4 || i4 == this.mItems.size() - 1) {
                        itemInfo = itemInfo2;
                        break;
                    } else {
                        i3 = itemInfo2.position;
                        i4++;
                        z = false;
                        itemInfo = itemInfo2;
                    }
                } else {
                    ItemInfo itemInfo3 = this.mTempItem;
                    itemInfo3.offset = f3 + HingeAngleProviderKt.FULLY_CLOSED_DEGREES + f2;
                    itemInfo3.position = i2;
                    throw null;
                }
            }
            int clientWidth2 = getClientWidth();
            int i5 = this.mPageMargin;
            int i6 = clientWidth2 + i5;
            float f5 = clientWidth2;
            int i7 = itemInfo.position;
            float f6 = ((i / f5) - itemInfo.offset) / ((i5 / f5) + HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mCalledSuper = false;
            onPageScrolled(i7, f6, (int) (i6 * f6));
            if (this.mCalledSuper) {
                return true;
            }
            throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        } else if (this.mFirstLayout) {
            return false;
        } else {
            this.mCalledSuper = false;
            onPageScrolled(0, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0);
            if (this.mCalledSuper) {
                return false;
            }
            throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        }
    }

    public final void recomputeScrollPosition(int i, int i2, int i3, int i4) {
        float f;
        if (i2 <= 0 || this.mItems.isEmpty()) {
            ItemInfo infoForPosition = infoForPosition(this.mCurItem);
            if (infoForPosition != null) {
                f = Math.min(infoForPosition.offset, this.mLastOffset);
            } else {
                f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            }
            int paddingLeft = (int) (f * ((i - getPaddingLeft()) - getPaddingRight()));
            if (paddingLeft != getScrollX()) {
                completeScroll(false);
                scrollTo(paddingLeft, getScrollY());
            }
        } else if (!this.mScroller.isFinished()) {
            this.mScroller.setFinalX(getClientWidth() * this.mCurItem);
        } else {
            scrollTo((int) ((getScrollX() / (((i2 - getPaddingLeft()) - getPaddingRight()) + i4)) * (((i - getPaddingLeft()) - getPaddingRight()) + i3)), getScrollY());
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void removeView(View view) {
        if (this.mInLayout) {
            removeViewInLayout(view);
        } else {
            super.removeView(view);
        }
    }

    public final void setPageTransformer(PreviewPager$$ExternalSyntheticLambda2 previewPager$$ExternalSyntheticLambda2) {
        boolean z;
        boolean z2;
        if (this.mPageTransformer != null) {
            z = true;
        } else {
            z = false;
        }
        if (true != z) {
            z2 = true;
        } else {
            z2 = false;
        }
        this.mPageTransformer = previewPager$$ExternalSyntheticLambda2;
        setChildrenDrawingOrderEnabled(true);
        this.mDrawingOrder = 1;
        this.mPageTransformerLayerType = 0;
        if (z2 && this.mDrawingOrder != 0) {
            ArrayList<View> arrayList = this.mDrawingOrderedChildren;
            if (arrayList == null) {
                this.mDrawingOrderedChildren = new ArrayList<>();
            } else {
                arrayList.clear();
            }
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                this.mDrawingOrderedChildren.add(getChildAt(i));
            }
            Collections.sort(this.mDrawingOrderedChildren, sPositionComparator);
        }
    }

    public final void setScrollState(int i) {
        boolean z;
        int i2;
        if (this.mScrollState != i) {
            this.mScrollState = i;
            if (this.mPageTransformer != null) {
                if (i != 0) {
                    z = true;
                } else {
                    z = false;
                }
                int childCount = getChildCount();
                for (int i3 = 0; i3 < childCount; i3++) {
                    if (z) {
                        i2 = this.mPageTransformerLayerType;
                    } else {
                        i2 = 0;
                    }
                    getChildAt(i3).setLayerType(i2, null);
                }
            }
            ArrayList arrayList = this.mOnPageChangeListeners;
            if (arrayList != null) {
                int size = arrayList.size();
                for (int i4 = 0; i4 < size; i4++) {
                    OnPageChangeListener onPageChangeListener = (OnPageChangeListener) this.mOnPageChangeListeners.get(i4);
                    if (onPageChangeListener != null) {
                        onPageChangeListener.onPageScrollStateChanged(i);
                    }
                }
            }
        }
    }

    public final void setScrollingCacheEnabled(boolean z) {
        if (this.mScrollingCacheEnabled != z) {
            this.mScrollingCacheEnabled = z;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addFocusables(ArrayList<View> arrayList, int i, int i2) {
        int size = arrayList.size();
        int descendantFocusability = getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i3 = 0; i3 < getChildCount(); i3++) {
                if (getChildAt(i3).getVisibility() == 0) {
                    infoForChild();
                }
            }
        }
        if ((descendantFocusability == 262144 && size != arrayList.size()) || !isFocusable()) {
            return;
        }
        if ((i2 & 1) != 1 || !isInTouchMode() || isFocusableInTouchMode()) {
            arrayList.add(this);
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        if (!checkLayoutParams(layoutParams)) {
            layoutParams = generateLayoutParams(layoutParams);
        }
        LayoutParams layoutParams2 = (LayoutParams) layoutParams;
        boolean z = layoutParams2.isDecor;
        boolean z2 = true;
        if (view.getClass().getAnnotation(DecorView.class) == null) {
            z2 = false;
        }
        boolean z3 = z | z2;
        layoutParams2.isDecor = z3;
        if (!this.mInLayout) {
            super.addView(view, i, layoutParams);
        } else if (!z3) {
            addViewInLayout(view, i, layoutParams);
        } else {
            throw new IllegalStateException("Cannot add pager decor view during layout");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x00c1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean arrowScroll(int r7) {
        /*
            r6 = this;
            android.view.View r0 = r6.findFocus()
            r1 = 0
            r2 = 1
            if (r0 != r6) goto L9
            goto L62
        L9:
            if (r0 == 0) goto L63
            android.view.ViewParent r3 = r0.getParent()
        Lf:
            boolean r4 = r3 instanceof android.view.ViewGroup
            if (r4 == 0) goto L1c
            if (r3 != r6) goto L17
            r3 = r2
            goto L1d
        L17:
            android.view.ViewParent r3 = r3.getParent()
            goto Lf
        L1c:
            r3 = r1
        L1d:
            if (r3 != 0) goto L63
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.Class r4 = r0.getClass()
            java.lang.String r4 = r4.getSimpleName()
            r3.append(r4)
            android.view.ViewParent r0 = r0.getParent()
        L33:
            boolean r4 = r0 instanceof android.view.ViewGroup
            if (r4 == 0) goto L4c
            java.lang.String r4 = " => "
            r3.append(r4)
            java.lang.Class r4 = r0.getClass()
            java.lang.String r4 = r4.getSimpleName()
            r3.append(r4)
            android.view.ViewParent r0 = r0.getParent()
            goto L33
        L4c:
            java.lang.String r0 = "arrowScroll tried to find focus based on non-child current focused view "
            java.lang.StringBuilder r0 = android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(r0)
            java.lang.String r3 = r3.toString()
            r0.append(r3)
            java.lang.String r0 = r0.toString()
            java.lang.String r3 = "ViewPager"
            android.util.Log.e(r3, r0)
        L62:
            r0 = 0
        L63:
            android.view.FocusFinder r3 = android.view.FocusFinder.getInstance()
            android.view.View r3 = r3.findNextFocus(r6, r0, r7)
            r4 = 66
            r5 = 17
            if (r3 == 0) goto Lb3
            if (r3 == r0) goto Lb3
            if (r7 != r5) goto L97
            android.graphics.Rect r4 = r6.mTempRect
            android.graphics.Rect r4 = r6.getChildRectInPagerCoordinates(r4, r3)
            int r4 = r4.left
            android.graphics.Rect r5 = r6.mTempRect
            android.graphics.Rect r5 = r6.getChildRectInPagerCoordinates(r5, r0)
            int r5 = r5.left
            if (r0 == 0) goto L91
            if (r4 < r5) goto L91
            int r0 = r6.mCurItem
            if (r0 <= 0) goto Lbf
            r6.setScrollingCacheEnabled(r1)
            goto Lbe
        L91:
            boolean r0 = r3.requestFocus()
        L95:
            r1 = r0
            goto Lbf
        L97:
            if (r7 != r4) goto Lbf
            android.graphics.Rect r2 = r6.mTempRect
            android.graphics.Rect r2 = r6.getChildRectInPagerCoordinates(r2, r3)
            int r2 = r2.left
            android.graphics.Rect r4 = r6.mTempRect
            android.graphics.Rect r4 = r6.getChildRectInPagerCoordinates(r4, r0)
            int r4 = r4.left
            if (r0 == 0) goto Lae
            if (r2 > r4) goto Lae
            goto Lbf
        Lae:
            boolean r0 = r3.requestFocus()
            goto L95
        Lb3:
            if (r7 == r5) goto Lb7
            if (r7 != r2) goto Lbf
        Lb7:
            int r0 = r6.mCurItem
            if (r0 <= 0) goto Lbf
            r6.setScrollingCacheEnabled(r1)
        Lbe:
            r1 = r2
        Lbf:
            if (r1 == 0) goto Lc8
            int r7 = android.view.SoundEffectConstants.getContantForFocusDirection(r7)
            r6.playSoundEffect(r7)
        Lc8:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.viewpager.widget.ViewPager.arrowScroll(int):boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:32:? A[RETURN, SYNTHETIC] */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean dispatchKeyEvent(android.view.KeyEvent r6) {
        /*
            r5 = this;
            boolean r0 = super.dispatchKeyEvent(r6)
            r1 = 1
            r2 = 0
            if (r0 != 0) goto L5f
            int r0 = r6.getAction()
            if (r0 != 0) goto L5a
            int r0 = r6.getKeyCode()
            r3 = 21
            r4 = 2
            if (r0 == r3) goto L44
            r3 = 22
            if (r0 == r3) goto L36
            r3 = 61
            if (r0 == r3) goto L20
            goto L5a
        L20:
            boolean r0 = r6.hasNoModifiers()
            if (r0 == 0) goto L2b
            boolean r5 = r5.arrowScroll(r4)
            goto L5b
        L2b:
            boolean r6 = r6.hasModifiers(r1)
            if (r6 == 0) goto L5a
            boolean r5 = r5.arrowScroll(r1)
            goto L5b
        L36:
            boolean r6 = r6.hasModifiers(r4)
            if (r6 == 0) goto L3d
            goto L5a
        L3d:
            r6 = 66
            boolean r5 = r5.arrowScroll(r6)
            goto L5b
        L44:
            boolean r6 = r6.hasModifiers(r4)
            if (r6 == 0) goto L53
            int r6 = r5.mCurItem
            if (r6 <= 0) goto L5a
            r5.setScrollingCacheEnabled(r2)
            r5 = r1
            goto L5b
        L53:
            r6 = 17
            boolean r5 = r5.arrowScroll(r6)
            goto L5b
        L5a:
            r5 = r2
        L5b:
            if (r5 == 0) goto L5e
            goto L5f
        L5e:
            r1 = r2
        L5f:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.viewpager.widget.ViewPager.dispatchKeyEvent(android.view.KeyEvent):boolean");
    }

    @Override // android.view.View
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        if (accessibilityEvent.getEventType() == 4096) {
            return super.dispatchPopulateAccessibilityEvent(accessibilityEvent);
        }
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            if (getChildAt(i).getVisibility() == 0) {
                infoForChild();
            }
        }
        return false;
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        super.draw(canvas);
        boolean z = false;
        if (getOverScrollMode() != 0) {
            this.mLeftEdge.finish();
            this.mRightEdge.finish();
        } else {
            if (!this.mLeftEdge.isFinished()) {
                int save = canvas.save();
                int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
                int width = getWidth();
                canvas.rotate(270.0f);
                canvas.translate(getPaddingTop() + (-height), this.mFirstOffset * width);
                this.mLeftEdge.setSize(height, width);
                z = false | this.mLeftEdge.draw(canvas);
                canvas.restoreToCount(save);
            }
            if (!this.mRightEdge.isFinished()) {
                int save2 = canvas.save();
                int width2 = getWidth();
                int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
                canvas.rotate(90.0f);
                canvas.translate(-getPaddingTop(), (-(this.mLastOffset + 1.0f)) * width2);
                this.mRightEdge.setSize(height2, width2);
                z |= this.mRightEdge.draw(canvas);
                canvas.restoreToCount(save2);
            }
        }
        if (z) {
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            ViewCompat.Api16Impl.postInvalidateOnAnimation(this);
        }
    }

    public final int getClientWidth() {
        return (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mFirstLayout = true;
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        float f;
        boolean z;
        float f2;
        boolean z2;
        int action = motionEvent.getAction() & 255;
        int i = 0;
        if (action == 3 || action == 1) {
            this.mActivePointerId = -1;
            this.mIsBeingDragged = false;
            this.mIsUnableToDrag = false;
            VelocityTracker velocityTracker = this.mVelocityTracker;
            if (velocityTracker != null) {
                velocityTracker.recycle();
                this.mVelocityTracker = null;
            }
            this.mLeftEdge.onRelease();
            this.mRightEdge.onRelease();
            if (this.mLeftEdge.isFinished()) {
                this.mRightEdge.isFinished();
            }
            return false;
        }
        if (action != 0) {
            if (this.mIsBeingDragged) {
                return true;
            }
            if (this.mIsUnableToDrag) {
                return false;
            }
        }
        if (action == 0) {
            float x = motionEvent.getX();
            this.mInitialMotionX = x;
            this.mLastMotionX = x;
            float y = motionEvent.getY();
            this.mInitialMotionY = y;
            this.mLastMotionY = y;
            this.mActivePointerId = motionEvent.getPointerId(0);
            this.mIsUnableToDrag = false;
            this.mIsScrollStarted = true;
            this.mScroller.computeScrollOffset();
            if (this.mScrollState == 2 && Math.abs(this.mScroller.getFinalX() - this.mScroller.getCurrX()) > this.mCloseEnough) {
                this.mScroller.abortAnimation();
                if (this.mDrawingOrder != 0) {
                    ArrayList<View> arrayList = this.mDrawingOrderedChildren;
                    if (arrayList == null) {
                        this.mDrawingOrderedChildren = new ArrayList<>();
                    } else {
                        arrayList.clear();
                    }
                    int childCount = getChildCount();
                    while (i < childCount) {
                        this.mDrawingOrderedChildren.add(getChildAt(i));
                        i++;
                    }
                    Collections.sort(this.mDrawingOrderedChildren, sPositionComparator);
                }
                this.mIsBeingDragged = true;
                ViewParent parent = getParent();
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(true);
                }
                setScrollState(1);
            } else if (EdgeEffectCompat$Api31Impl.getDistance(this.mLeftEdge) == HingeAngleProviderKt.FULLY_CLOSED_DEGREES && EdgeEffectCompat$Api31Impl.getDistance(this.mRightEdge) == HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                completeScroll(false);
                this.mIsBeingDragged = false;
            } else {
                this.mIsBeingDragged = true;
                setScrollState(1);
                if (EdgeEffectCompat$Api31Impl.getDistance(this.mLeftEdge) != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                    EdgeEffectCompat$Api31Impl.onPullDistance(this.mLeftEdge, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 1.0f - (this.mLastMotionY / getHeight()));
                }
                if (EdgeEffectCompat$Api31Impl.getDistance(this.mRightEdge) != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                    EdgeEffectCompat$Api31Impl.onPullDistance(this.mRightEdge, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, this.mLastMotionY / getHeight());
                }
            }
        } else if (action == 2) {
            int i2 = this.mActivePointerId;
            if (i2 != -1) {
                int findPointerIndex = motionEvent.findPointerIndex(i2);
                float x2 = motionEvent.getX(findPointerIndex);
                float f3 = x2 - this.mLastMotionX;
                float abs = Math.abs(f3);
                float y2 = motionEvent.getY(findPointerIndex);
                float abs2 = Math.abs(y2 - this.mInitialMotionY);
                int i3 = (f3 > HingeAngleProviderKt.FULLY_CLOSED_DEGREES ? 1 : (f3 == HingeAngleProviderKt.FULLY_CLOSED_DEGREES ? 0 : -1));
                if (i3 != 0) {
                    float f4 = this.mLastMotionX;
                    if (!this.mDragInGutterEnabled && ((f4 < this.mGutterSize && i3 > 0) || (f4 > getWidth() - this.mGutterSize && f3 < HingeAngleProviderKt.FULLY_CLOSED_DEGREES))) {
                        z2 = true;
                    } else {
                        z2 = false;
                    }
                    if (!z2 && canScroll(this, false, (int) f3, (int) x2, (int) y2)) {
                        this.mLastMotionX = x2;
                        this.mLastMotionY = y2;
                        this.mIsUnableToDrag = true;
                        return false;
                    }
                }
                float f5 = this.mTouchSlop;
                if (abs > f5 && abs * 0.5f > abs2) {
                    this.mIsBeingDragged = true;
                    ViewParent parent2 = getParent();
                    if (parent2 != null) {
                        parent2.requestDisallowInterceptTouchEvent(true);
                    }
                    setScrollState(1);
                    if (i3 > 0) {
                        f2 = this.mInitialMotionX + this.mTouchSlop;
                    } else {
                        f2 = this.mInitialMotionX - this.mTouchSlop;
                    }
                    this.mLastMotionX = f2;
                    this.mLastMotionY = y2;
                    setScrollingCacheEnabled(true);
                } else if (abs2 > f5) {
                    this.mIsUnableToDrag = true;
                }
                if (this.mIsBeingDragged) {
                    float f6 = this.mLastMotionX - x2;
                    this.mLastMotionX = x2;
                    float height = y2 / getHeight();
                    float width = f6 / getWidth();
                    if (EdgeEffectCompat$Api31Impl.getDistance(this.mLeftEdge) != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                        f = -EdgeEffectCompat$Api31Impl.onPullDistance(this.mLeftEdge, -width, 1.0f - height);
                    } else if (EdgeEffectCompat$Api31Impl.getDistance(this.mRightEdge) != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                        f = EdgeEffectCompat$Api31Impl.onPullDistance(this.mRightEdge, width, height);
                    } else {
                        f = 0.0f;
                    }
                    float width2 = f * getWidth();
                    float f7 = f6 - width2;
                    if (width2 != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (Math.abs(f7) >= 1.0E-4f) {
                        getScrollX();
                        getClientWidth();
                        ArrayList<ItemInfo> arrayList2 = this.mItems;
                        int i4 = this.mItems.get(0).position;
                        int i5 = arrayList2.get(arrayList2.size() - 1).position;
                        throw null;
                    } else if (z) {
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                        ViewCompat.Api16Impl.postInvalidateOnAnimation(this);
                    }
                }
            }
        } else if (action == 6) {
            int actionIndex = motionEvent.getActionIndex();
            if (motionEvent.getPointerId(actionIndex) == this.mActivePointerId) {
                if (actionIndex == 0) {
                    i = 1;
                }
                this.mLastMotionX = motionEvent.getX(i);
                this.mActivePointerId = motionEvent.getPointerId(i);
                VelocityTracker velocityTracker2 = this.mVelocityTracker;
                if (velocityTracker2 != null) {
                    velocityTracker2.clear();
                }
            }
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        return this.mIsBeingDragged;
    }

    @Override // android.view.ViewGroup
    public final boolean onRequestFocusInDescendants(int i, Rect rect) {
        int i2;
        int i3;
        int childCount = getChildCount();
        int i4 = -1;
        if ((i & 2) != 0) {
            i3 = 1;
            i4 = childCount;
            i2 = 0;
        } else {
            i2 = childCount - 1;
            i3 = -1;
        }
        while (i2 != i4) {
            if (getChildAt(i2).getVisibility() == 0) {
                infoForChild();
            }
            i2 += i3;
        }
        return false;
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.position = this.mCurItem;
        return savedState;
    }

    @Override // android.view.View
    public final void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (i != i3) {
            int i5 = this.mPageMargin;
            recomputeScrollPosition(i, i3, i5, i5);
        }
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            motionEvent.getEdgeFlags();
        }
        return false;
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        if (super.verifyDrawable(drawable) || drawable == null) {
            return true;
        }
        return false;
    }

    public ViewPager(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initViewPager(context);
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
    }
}
