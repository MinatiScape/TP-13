package androidx.recyclerview.widget;

import android.view.View;
import com.android.systemui.shared.R;
/* loaded from: classes.dex */
public class ViewBoundsCheck {
    public BoundFlags mBoundFlags = new BoundFlags();
    public final Callback mCallback;

    /* loaded from: classes.dex */
    public static class BoundFlags {
        public int mBoundFlags = 0;
        public int mChildEnd;
        public int mChildStart;
        public int mRvEnd;
        public int mRvStart;

        public boolean boundsMatch() {
            int i = this.mBoundFlags;
            if ((i & 7) != 0 && (i & (compare(this.mChildStart, this.mRvStart) << 0)) == 0) {
                return false;
            }
            int i2 = this.mBoundFlags;
            if ((i2 & R.styleable.AppCompatTheme_toolbarNavigationButtonStyle) != 0 && (i2 & (compare(this.mChildStart, this.mRvEnd) << 4)) == 0) {
                return false;
            }
            int i3 = this.mBoundFlags;
            if ((i3 & 1792) != 0 && (i3 & (compare(this.mChildEnd, this.mRvStart) << 8)) == 0) {
                return false;
            }
            int i4 = this.mBoundFlags;
            return (i4 & 28672) == 0 || ((compare(this.mChildEnd, this.mRvEnd) << 12) & i4) != 0;
        }

        public int compare(int x, int y) {
            if (x > y) {
                return 1;
            }
            return x == y ? 2 : 4;
        }
    }

    /* loaded from: classes.dex */
    public interface Callback {
        View getChildAt(int index);

        int getChildEnd(View view);

        int getChildStart(View view);

        int getParentEnd();

        int getParentStart();
    }

    public ViewBoundsCheck(Callback callback) {
        this.mCallback = callback;
    }

    public View findOneViewWithinBoundFlags(int fromIndex, int toIndex, int preferredBoundFlags, int acceptableBoundFlags) {
        int parentStart = this.mCallback.getParentStart();
        int parentEnd = this.mCallback.getParentEnd();
        int i = toIndex > fromIndex ? 1 : -1;
        View view = null;
        while (fromIndex != toIndex) {
            View childAt = this.mCallback.getChildAt(fromIndex);
            int childStart = this.mCallback.getChildStart(childAt);
            int childEnd = this.mCallback.getChildEnd(childAt);
            BoundFlags boundFlags = this.mBoundFlags;
            boundFlags.mRvStart = parentStart;
            boundFlags.mRvEnd = parentEnd;
            boundFlags.mChildStart = childStart;
            boundFlags.mChildEnd = childEnd;
            if (preferredBoundFlags != 0) {
                boundFlags.mBoundFlags = 0;
                boundFlags.mBoundFlags = preferredBoundFlags | 0;
                if (boundFlags.boundsMatch()) {
                    return childAt;
                }
            }
            if (acceptableBoundFlags != 0) {
                BoundFlags boundFlags2 = this.mBoundFlags;
                boundFlags2.mBoundFlags = 0;
                boundFlags2.mBoundFlags = acceptableBoundFlags | 0;
                if (boundFlags2.boundsMatch()) {
                    view = childAt;
                }
            }
            fromIndex += i;
        }
        return view;
    }

    public boolean isViewWithinBoundFlags(View child, int boundsFlags) {
        BoundFlags boundFlags = this.mBoundFlags;
        int parentStart = this.mCallback.getParentStart();
        int parentEnd = this.mCallback.getParentEnd();
        int childStart = this.mCallback.getChildStart(child);
        int childEnd = this.mCallback.getChildEnd(child);
        boundFlags.mRvStart = parentStart;
        boundFlags.mRvEnd = parentEnd;
        boundFlags.mChildStart = childStart;
        boundFlags.mChildEnd = childEnd;
        if (boundsFlags == 0) {
            return false;
        }
        BoundFlags boundFlags2 = this.mBoundFlags;
        boundFlags2.mBoundFlags = 0;
        boundFlags2.mBoundFlags = 0 | boundsFlags;
        return boundFlags2.boundsMatch();
    }
}
