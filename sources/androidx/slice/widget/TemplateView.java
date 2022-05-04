package androidx.slice.widget;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.slice.SliceItem;
import androidx.slice.core.SliceAction;
import androidx.slice.widget.SliceView;
import androidx.slice.widget.SliceViewPolicy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public class TemplateView extends SliceChildView implements SliceViewPolicy.PolicyChangeListener {
    public SliceAdapter mAdapter;
    public final View mForeground;
    public ListContent mListContent;
    public SliceView mParent;
    public final RecyclerView mRecyclerView;
    public List<SliceContent> mDisplayedItems = new ArrayList();
    public int mDisplayedItemsHeight = 0;
    public int[] mLoc = new int[2];

    public TemplateView(Context context) {
        super(context);
        RecyclerView recyclerView = new RecyclerView(getContext());
        this.mRecyclerView = recyclerView;
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        SliceAdapter sliceAdapter = new SliceAdapter(context);
        this.mAdapter = sliceAdapter;
        recyclerView.setAdapter(sliceAdapter);
        SliceAdapter sliceAdapter2 = new SliceAdapter(context);
        this.mAdapter = sliceAdapter2;
        recyclerView.setAdapter(sliceAdapter2);
        addView(recyclerView);
        View view = new View(getContext());
        this.mForeground = view;
        view.setBackground(SliceViewUtil.getDrawable(getContext(), 16843534));
        addView(view);
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) view.getLayoutParams();
        layoutParams.width = -1;
        layoutParams.height = -1;
        view.setLayoutParams(layoutParams);
    }

    @Override // androidx.slice.widget.SliceChildView
    public Set<SliceItem> getLoadingActions() {
        return this.mAdapter.mLoadingActions;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        SliceView sliceView = (SliceView) getParent();
        this.mParent = sliceView;
        SliceAdapter sliceAdapter = this.mAdapter;
        sliceAdapter.mParent = sliceView;
        sliceAdapter.mTemplateView = this;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int size = View.MeasureSpec.getSize(heightMeasureSpec);
        if (!this.mViewPolicy.mScrollable && this.mDisplayedItems.size() > 0 && this.mDisplayedItemsHeight != size) {
            updateDisplayedItems(size);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    @Override // androidx.slice.widget.SliceChildView
    public void resetView() {
        this.mDisplayedItemsHeight = 0;
        this.mDisplayedItems.clear();
        this.mAdapter.setSliceItems(null, -1, getMode());
        this.mListContent = null;
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setActionLoading(SliceItem item) {
        this.mAdapter.onSliceActionLoading(item, 0);
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setAllowTwoLines(boolean allowTwoLines) {
        SliceAdapter sliceAdapter = this.mAdapter;
        sliceAdapter.mAllowTwoLines = allowTwoLines;
        sliceAdapter.notifyHeaderChanged();
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setInsets(int l, int t, int r, int b) {
        this.mInsetStart = l;
        this.mInsetTop = t;
        this.mInsetEnd = r;
        this.mInsetBottom = b;
        SliceAdapter sliceAdapter = this.mAdapter;
        sliceAdapter.mInsetStart = l;
        sliceAdapter.mInsetTop = t;
        sliceAdapter.mInsetEnd = r;
        sliceAdapter.mInsetBottom = b;
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setLastUpdated(long lastUpdated) {
        this.mLastUpdated = lastUpdated;
        SliceAdapter sliceAdapter = this.mAdapter;
        if (sliceAdapter.mLastUpdated != lastUpdated) {
            sliceAdapter.mLastUpdated = lastUpdated;
            sliceAdapter.notifyHeaderChanged();
        }
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setLoadingActions(Set<SliceItem> loadingActions) {
        SliceAdapter sliceAdapter = this.mAdapter;
        if (loadingActions == null) {
            sliceAdapter.mLoadingActions.clear();
        } else {
            sliceAdapter.mLoadingActions = loadingActions;
        }
        sliceAdapter.mObservable.notifyChanged();
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setPolicy(SliceViewPolicy policy) {
        this.mViewPolicy = policy;
        this.mAdapter.mPolicy = policy;
        policy.mListener = this;
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setShowLastUpdated(boolean showLastUpdated) {
        this.mShowLastUpdated = showLastUpdated;
        SliceAdapter sliceAdapter = this.mAdapter;
        if (sliceAdapter.mShowLastUpdated != showLastUpdated) {
            sliceAdapter.mShowLastUpdated = showLastUpdated;
            sliceAdapter.notifyHeaderChanged();
        }
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setSliceActionListener(SliceView.OnSliceActionListener observer) {
        this.mObserver = null;
        SliceAdapter sliceAdapter = this.mAdapter;
        if (sliceAdapter != null) {
            sliceAdapter.mSliceObserver = null;
        }
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setSliceActions(List<SliceAction> actions) {
        SliceAdapter sliceAdapter = this.mAdapter;
        sliceAdapter.mSliceActions = actions;
        sliceAdapter.notifyHeaderChanged();
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setSliceContent(ListContent sliceContent) {
        this.mListContent = sliceContent;
        updateDisplayedItems(sliceContent.getHeight(this.mSliceStyle, this.mViewPolicy));
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setStyle(SliceStyle style, RowStyle rowStyle) {
        this.mSliceStyle = style;
        this.mRowStyle = rowStyle;
        SliceAdapter sliceAdapter = this.mAdapter;
        sliceAdapter.mSliceStyle = style;
        sliceAdapter.mObservable.notifyChanged();
        if (rowStyle.mDisableRecyclerViewItemAnimator) {
            this.mRecyclerView.setItemAnimator(null);
        }
    }

    @Override // androidx.slice.widget.SliceChildView
    public void setTint(int tint) {
        this.mTintColor = tint;
        updateDisplayedItems(getMeasuredHeight());
    }

    public final void updateDisplayedItems(int height) {
        DisplayedListItems displayedListItems;
        ListContent listContent = this.mListContent;
        if (listContent == null || !listContent.isValid()) {
            resetView();
            return;
        }
        ListContent listContent2 = this.mListContent;
        SliceStyle sliceStyle = this.mSliceStyle;
        SliceViewPolicy sliceViewPolicy = this.mViewPolicy;
        Objects.requireNonNull(listContent2);
        int i = 1;
        boolean z = false;
        if (sliceViewPolicy.mMode == 1) {
            displayedListItems = new DisplayedListItems(new ArrayList(Arrays.asList(listContent2.mHeaderContent)), listContent2.mRowItems.size() - 1);
        } else if (sliceViewPolicy.mScrollable || height <= 0) {
            Objects.requireNonNull(sliceStyle);
            List<SliceContent> list = listContent2.mRowItems;
            if (list.size() > 0 && sliceStyle.shouldSkipFirstListItem(list)) {
                list = list.subList(1, list.size());
            }
            displayedListItems = new DisplayedListItems(list, 0);
        } else {
            displayedListItems = sliceStyle.getListItemsForNonScrollingList(listContent2, height, sliceViewPolicy);
        }
        List<SliceContent> list2 = displayedListItems.mDisplayedItems;
        this.mDisplayedItems = list2;
        this.mDisplayedItemsHeight = this.mSliceStyle.getListItemsHeight(list2, this.mViewPolicy);
        this.mAdapter.setSliceItems(this.mDisplayedItems, this.mTintColor, this.mViewPolicy.mMode);
        if (this.mDisplayedItemsHeight > getMeasuredHeight()) {
            z = true;
        }
        RecyclerView recyclerView = this.mRecyclerView;
        if (!this.mViewPolicy.mScrollable || !z) {
            i = 2;
        }
        recyclerView.setOverScrollMode(i);
    }
}
