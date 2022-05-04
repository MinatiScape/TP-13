package androidx.recyclerview.widget;

import android.content.Context;
import android.graphics.PointF;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public class LinearSmoothScroller extends RecyclerView.SmoothScroller {
    public final DisplayMetrics mDisplayMetrics;
    public float mMillisPerPixel;
    public PointF mTargetVector;
    public final LinearInterpolator mLinearInterpolator = new LinearInterpolator();
    public final DecelerateInterpolator mDecelerateInterpolator = new DecelerateInterpolator();
    public boolean mHasCalculatedMillisPerPixel = false;
    public int mInterimTargetDx = 0;
    public int mInterimTargetDy = 0;

    public LinearSmoothScroller(Context context) {
        this.mDisplayMetrics = context.getResources().getDisplayMetrics();
    }

    public int calculateDtToFit(int viewStart, int viewEnd, int boxStart, int boxEnd, int snapPreference) {
        if (snapPreference == -1) {
            return boxStart - viewStart;
        }
        if (snapPreference == 0) {
            int i = boxStart - viewStart;
            if (i > 0) {
                return i;
            }
            int i2 = boxEnd - viewEnd;
            if (i2 < 0) {
                return i2;
            }
            return 0;
        } else if (snapPreference == 1) {
            return boxEnd - viewEnd;
        } else {
            throw new IllegalArgumentException("snap preference should be one of the constants defined in SmoothScroller, starting with SNAP_");
        }
    }

    public float calculateSpeedPerPixel(DisplayMetrics displayMetrics) {
        return 25.0f / displayMetrics.densityDpi;
    }

    public int calculateTimeForScrolling(int dx) {
        float abs = Math.abs(dx);
        if (!this.mHasCalculatedMillisPerPixel) {
            this.mMillisPerPixel = calculateSpeedPerPixel(this.mDisplayMetrics);
            this.mHasCalculatedMillisPerPixel = true;
        }
        return (int) Math.ceil(abs * this.mMillisPerPixel);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.SmoothScroller
    public void onTargetFound(View targetView, RecyclerView.State state, RecyclerView.SmoothScroller.Action action) {
        int i;
        int i2;
        int i3;
        PointF pointF = this.mTargetVector;
        int i4 = 0;
        int i5 = (pointF == null || pointF.x == HingeAngleProviderKt.FULLY_CLOSED_DEGREES) ? 0 : i3 > 0 ? 1 : -1;
        RecyclerView.LayoutManager layoutManager = this.mLayoutManager;
        if (layoutManager == null || !layoutManager.canScrollHorizontally()) {
            i = 0;
        } else {
            RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) targetView.getLayoutParams();
            i = calculateDtToFit(layoutManager.getDecoratedLeft(targetView) - ((ViewGroup.MarginLayoutParams) layoutParams).leftMargin, layoutManager.getDecoratedRight(targetView) + ((ViewGroup.MarginLayoutParams) layoutParams).rightMargin, layoutManager.getPaddingLeft(), layoutManager.mWidth - layoutManager.getPaddingRight(), i5);
        }
        PointF pointF2 = this.mTargetVector;
        int i6 = (pointF2 == null || pointF2.y == HingeAngleProviderKt.FULLY_CLOSED_DEGREES) ? 0 : i2 > 0 ? 1 : -1;
        RecyclerView.LayoutManager layoutManager2 = this.mLayoutManager;
        if (layoutManager2 != null && layoutManager2.canScrollVertically()) {
            RecyclerView.LayoutParams layoutParams2 = (RecyclerView.LayoutParams) targetView.getLayoutParams();
            i4 = calculateDtToFit(layoutManager2.getDecoratedTop(targetView) - ((ViewGroup.MarginLayoutParams) layoutParams2).topMargin, layoutManager2.getDecoratedBottom(targetView) + ((ViewGroup.MarginLayoutParams) layoutParams2).bottomMargin, layoutManager2.getPaddingTop(), layoutManager2.mHeight - layoutManager2.getPaddingBottom(), i6);
        }
        int ceil = (int) Math.ceil(calculateTimeForScrolling((int) Math.sqrt((i4 * i4) + (i * i))) / 0.3356d);
        if (ceil > 0) {
            action.update(-i, -i4, ceil, this.mDecelerateInterpolator);
        }
    }
}
