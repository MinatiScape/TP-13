package androidx.recyclerview.widget;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import androidx.recyclerview.widget.RecyclerView;
/* loaded from: classes.dex */
public abstract class OrientationHelper {
    public final RecyclerView.LayoutManager mLayoutManager;
    public int mLastTotalSpace = RecyclerView.UNDEFINED_DURATION;
    public final Rect mTmpRect = new Rect();

    /* renamed from: androidx.recyclerview.widget.OrientationHelper$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass1 extends OrientationHelper {
        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getEnd() {
            return this.mLayoutManager.mWidth;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getEndAfterPadding() {
            RecyclerView.LayoutManager layoutManager = this.mLayoutManager;
            return layoutManager.mWidth - layoutManager.getPaddingRight();
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getEndPadding() {
            return this.mLayoutManager.getPaddingRight();
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getMode() {
            return this.mLayoutManager.mWidthMode;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getModeInOther() {
            return this.mLayoutManager.mHeightMode;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getStartAfterPadding() {
            return this.mLayoutManager.getPaddingLeft();
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getTotalSpace() {
            RecyclerView.LayoutManager layoutManager = this.mLayoutManager;
            return (layoutManager.mWidth - layoutManager.getPaddingLeft()) - this.mLayoutManager.getPaddingRight();
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getTransformedEndWithDecoration(View view) {
            this.mLayoutManager.getTransformedBoundingBox(view, this.mTmpRect);
            return this.mTmpRect.right;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getTransformedStartWithDecoration(View view) {
            this.mLayoutManager.getTransformedBoundingBox(view, this.mTmpRect);
            return this.mTmpRect.left;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final void offsetChildren(int i) {
            this.mLayoutManager.offsetChildrenHorizontal(i);
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getDecoratedEnd(View view) {
            this.mLayoutManager.getClass();
            return RecyclerView.LayoutManager.getRightDecorationWidth(view) + view.getRight() + ((ViewGroup.MarginLayoutParams) ((RecyclerView.LayoutParams) view.getLayoutParams())).rightMargin;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getDecoratedMeasurement(View view) {
            RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) view.getLayoutParams();
            this.mLayoutManager.getClass();
            Rect rect = ((RecyclerView.LayoutParams) view.getLayoutParams()).mDecorInsets;
            return view.getMeasuredWidth() + rect.left + rect.right + ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin + ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getDecoratedMeasurementInOther(View view) {
            RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) view.getLayoutParams();
            this.mLayoutManager.getClass();
            Rect rect = ((RecyclerView.LayoutParams) view.getLayoutParams()).mDecorInsets;
            return view.getMeasuredHeight() + rect.top + rect.bottom + ((ViewGroup.MarginLayoutParams) layoutParams).topMargin + ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getDecoratedStart(View view) {
            this.mLayoutManager.getClass();
            return (view.getLeft() - RecyclerView.LayoutManager.getLeftDecorationWidth(view)) - ((ViewGroup.MarginLayoutParams) ((RecyclerView.LayoutParams) view.getLayoutParams())).leftMargin;
        }

        public AnonymousClass1(RecyclerView.LayoutManager layoutManager) {
            super(layoutManager);
        }
    }

    /* renamed from: androidx.recyclerview.widget.OrientationHelper$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass2 extends OrientationHelper {
        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getEnd() {
            return this.mLayoutManager.mHeight;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getEndAfterPadding() {
            RecyclerView.LayoutManager layoutManager = this.mLayoutManager;
            return layoutManager.mHeight - layoutManager.getPaddingBottom();
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getEndPadding() {
            return this.mLayoutManager.getPaddingBottom();
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getMode() {
            return this.mLayoutManager.mHeightMode;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getModeInOther() {
            return this.mLayoutManager.mWidthMode;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getStartAfterPadding() {
            return this.mLayoutManager.getPaddingTop();
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getTotalSpace() {
            RecyclerView.LayoutManager layoutManager = this.mLayoutManager;
            return (layoutManager.mHeight - layoutManager.getPaddingTop()) - this.mLayoutManager.getPaddingBottom();
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getTransformedEndWithDecoration(View view) {
            this.mLayoutManager.getTransformedBoundingBox(view, this.mTmpRect);
            return this.mTmpRect.bottom;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getTransformedStartWithDecoration(View view) {
            this.mLayoutManager.getTransformedBoundingBox(view, this.mTmpRect);
            return this.mTmpRect.top;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final void offsetChildren(int i) {
            this.mLayoutManager.offsetChildrenVertical(i);
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getDecoratedEnd(View view) {
            this.mLayoutManager.getClass();
            return RecyclerView.LayoutManager.getBottomDecorationHeight(view) + view.getBottom() + ((ViewGroup.MarginLayoutParams) ((RecyclerView.LayoutParams) view.getLayoutParams())).bottomMargin;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getDecoratedMeasurement(View view) {
            RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) view.getLayoutParams();
            this.mLayoutManager.getClass();
            Rect rect = ((RecyclerView.LayoutParams) view.getLayoutParams()).mDecorInsets;
            return view.getMeasuredHeight() + rect.top + rect.bottom + ((ViewGroup.MarginLayoutParams) layoutParams).topMargin + ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getDecoratedMeasurementInOther(View view) {
            RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) view.getLayoutParams();
            this.mLayoutManager.getClass();
            Rect rect = ((RecyclerView.LayoutParams) view.getLayoutParams()).mDecorInsets;
            return view.getMeasuredWidth() + rect.left + rect.right + ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin + ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin;
        }

        @Override // androidx.recyclerview.widget.OrientationHelper
        public final int getDecoratedStart(View view) {
            this.mLayoutManager.getClass();
            return (view.getTop() - RecyclerView.LayoutManager.getTopDecorationHeight(view)) - ((ViewGroup.MarginLayoutParams) ((RecyclerView.LayoutParams) view.getLayoutParams())).topMargin;
        }

        public AnonymousClass2(RecyclerView.LayoutManager layoutManager) {
            super(layoutManager);
        }
    }

    public abstract int getDecoratedEnd(View view);

    public abstract int getDecoratedMeasurement(View view);

    public abstract int getDecoratedMeasurementInOther(View view);

    public abstract int getDecoratedStart(View view);

    public abstract int getEnd();

    public abstract int getEndAfterPadding();

    public abstract int getEndPadding();

    public abstract int getMode();

    public abstract int getModeInOther();

    public abstract int getStartAfterPadding();

    public abstract int getTotalSpace();

    public abstract int getTransformedEndWithDecoration(View view);

    public abstract int getTransformedStartWithDecoration(View view);

    public abstract void offsetChildren(int i);

    public static OrientationHelper createOrientationHelper(RecyclerView.LayoutManager layoutManager, int i) {
        if (i == 0) {
            return new AnonymousClass1(layoutManager);
        }
        if (i == 1) {
            return new AnonymousClass2(layoutManager);
        }
        throw new IllegalArgumentException("invalid orientation");
    }

    public final int getTotalSpaceChange() {
        if (Integer.MIN_VALUE == this.mLastTotalSpace) {
            return 0;
        }
        return getTotalSpace() - this.mLastTotalSpace;
    }

    public OrientationHelper(RecyclerView.LayoutManager layoutManager) {
        this.mLayoutManager = layoutManager;
    }
}
