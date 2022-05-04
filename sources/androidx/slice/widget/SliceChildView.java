package androidx.slice.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import androidx.slice.SliceItem;
import androidx.slice.core.SliceAction;
import androidx.slice.widget.SliceActionView;
import androidx.slice.widget.SliceView;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class SliceChildView extends FrameLayout {
    public int mInsetBottom;
    public int mInsetEnd;
    public int mInsetStart;
    public int mInsetTop;
    public long mLastUpdated;
    public SliceActionView.SliceActionLoadingListener mLoadingListener;
    public SliceView.OnSliceActionListener mObserver;
    public RowStyle mRowStyle;
    public boolean mShowLastUpdated;
    public SliceStyle mSliceStyle;
    public int mTintColor;
    public SliceViewPolicy mViewPolicy;

    public SliceChildView(Context context) {
        super(context);
        this.mTintColor = -1;
        this.mLastUpdated = -1L;
    }

    public Set<SliceItem> getLoadingActions() {
        return null;
    }

    public int getMode() {
        SliceViewPolicy sliceViewPolicy = this.mViewPolicy;
        if (sliceViewPolicy != null) {
            return sliceViewPolicy.mMode;
        }
        return 2;
    }

    public abstract void resetView();

    public void setActionLoading(SliceItem item) {
    }

    public void setAllowTwoLines(boolean allowTwoLines) {
    }

    public void setInsets(int l, int t, int r, int b) {
        this.mInsetStart = l;
        this.mInsetTop = t;
        this.mInsetEnd = r;
        this.mInsetBottom = b;
    }

    public void setLastUpdated(long lastUpdated) {
        this.mLastUpdated = lastUpdated;
    }

    public void setLoadingActions(Set<SliceItem> loadingActions) {
    }

    public void setPolicy(SliceViewPolicy policy) {
        this.mViewPolicy = policy;
    }

    public void setShowLastUpdated(boolean showLastUpdated) {
        this.mShowLastUpdated = showLastUpdated;
    }

    public void setSliceActionListener(SliceView.OnSliceActionListener observer) {
        this.mObserver = null;
    }

    public void setSliceActions(List<SliceAction> actions) {
    }

    public void setSliceContent(ListContent content) {
    }

    public void setSliceItem(SliceContent slice, boolean isHeader, int rowIndex, int rowCount, SliceView.OnSliceActionListener observer) {
    }

    public void setStyle(SliceStyle styles, RowStyle rowStyle) {
        this.mSliceStyle = styles;
        this.mRowStyle = rowStyle;
    }

    public void setTint(int tintColor) {
        this.mTintColor = tintColor;
    }

    public SliceChildView(Context context, AttributeSet attributeSet) {
        this(context);
    }
}
