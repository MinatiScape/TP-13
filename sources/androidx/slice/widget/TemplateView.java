package androidx.slice.widget;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.slice.SliceItem;
import androidx.slice.core.SliceAction;
import androidx.slice.widget.SliceViewPolicy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
public final class TemplateView extends SliceChildView implements SliceViewPolicy.PolicyChangeListener {
    public SliceAdapter mAdapter;
    public final View mForeground;
    public ListContent mListContent;
    public SliceView mParent;
    public final RecyclerView mRecyclerView;
    public List<SliceContent> mDisplayedItems = new ArrayList();
    public int mDisplayedItemsHeight = 0;
    public int[] mLoc = new int[2];

    @Override // androidx.slice.widget.SliceChildView
    public final void resetView() {
        this.mDisplayedItemsHeight = 0;
        this.mDisplayedItems.clear();
        this.mAdapter.setSliceItems(null, getMode());
        this.mListContent = null;
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setSliceActionListener() {
        this.mObserver = null;
        SliceAdapter sliceAdapter = this.mAdapter;
        if (sliceAdapter != null) {
            sliceAdapter.mSliceObserver = null;
        }
    }

    @Override // androidx.slice.widget.SliceChildView
    public final Set<SliceItem> getLoadingActions() {
        return this.mAdapter.mLoadingActions;
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setActionLoading(SliceItem sliceItem) {
        this.mAdapter.onSliceActionLoading(sliceItem, 0);
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setAllowTwoLines(boolean z) {
        SliceAdapter sliceAdapter = this.mAdapter;
        sliceAdapter.mAllowTwoLines = z;
        sliceAdapter.notifyHeaderChanged();
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setLastUpdated(long j) {
        this.mLastUpdated = j;
        SliceAdapter sliceAdapter = this.mAdapter;
        if (sliceAdapter.mLastUpdated != j) {
            sliceAdapter.mLastUpdated = j;
            sliceAdapter.notifyHeaderChanged();
        }
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setLoadingActions(Set<SliceItem> set) {
        SliceAdapter sliceAdapter = this.mAdapter;
        if (set == null) {
            sliceAdapter.mLoadingActions.clear();
        } else {
            sliceAdapter.mLoadingActions = set;
        }
        sliceAdapter.notifyDataSetChanged();
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setPolicy(SliceViewPolicy sliceViewPolicy) {
        this.mViewPolicy = sliceViewPolicy;
        this.mAdapter.mPolicy = sliceViewPolicy;
        sliceViewPolicy.mListener = this;
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setShowLastUpdated(boolean z) {
        this.mShowLastUpdated = z;
        SliceAdapter sliceAdapter = this.mAdapter;
        if (sliceAdapter.mShowLastUpdated != z) {
            sliceAdapter.mShowLastUpdated = z;
            sliceAdapter.notifyHeaderChanged();
        }
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setSliceActions(List<SliceAction> list) {
        SliceAdapter sliceAdapter = this.mAdapter;
        sliceAdapter.mSliceActions = list;
        sliceAdapter.notifyHeaderChanged();
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setSliceContent(ListContent listContent) {
        this.mListContent = listContent;
        updateDisplayedItems(listContent.getHeight(this.mSliceStyle, this.mViewPolicy));
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setStyle(SliceStyle sliceStyle, RowStyle rowStyle) {
        this.mSliceStyle = sliceStyle;
        this.mRowStyle = rowStyle;
        SliceAdapter sliceAdapter = this.mAdapter;
        sliceAdapter.mSliceStyle = sliceStyle;
        sliceAdapter.notifyDataSetChanged();
        if (rowStyle.mDisableRecyclerViewItemAnimator) {
            this.mRecyclerView.setItemAnimator(null);
        }
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setTint(int i) {
        this.mTintColor = i;
        updateDisplayedItems(getMeasuredHeight());
    }

    public final void updateDisplayedItems(int i) {
        DisplayedListItems displayedListItems;
        ListContent listContent = this.mListContent;
        if (listContent == null || !listContent.isValid()) {
            resetView();
            return;
        }
        ListContent listContent2 = this.mListContent;
        SliceStyle sliceStyle = this.mSliceStyle;
        SliceViewPolicy sliceViewPolicy = this.mViewPolicy;
        listContent2.getClass();
        int i2 = 1;
        boolean z = false;
        if (sliceViewPolicy.mMode == 1) {
            displayedListItems = new DisplayedListItems(new ArrayList(Arrays.asList(listContent2.mHeaderContent)), listContent2.mRowItems.size() - 1);
        } else if (sliceViewPolicy.mScrollable || i <= 0) {
            sliceStyle.getClass();
            ArrayList<SliceContent> arrayList = listContent2.mRowItems;
            int size = arrayList.size();
            List<SliceContent> list = arrayList;
            if (size > 0) {
                boolean shouldSkipFirstListItem = sliceStyle.shouldSkipFirstListItem(arrayList);
                list = arrayList;
                if (shouldSkipFirstListItem) {
                    list = arrayList.subList(1, arrayList.size());
                }
            }
            displayedListItems = new DisplayedListItems(list, 0);
        } else {
            displayedListItems = sliceStyle.getListItemsForNonScrollingList(listContent2, i, sliceViewPolicy);
        }
        List<SliceContent> list2 = displayedListItems.mDisplayedItems;
        this.mDisplayedItems = list2;
        this.mDisplayedItemsHeight = this.mSliceStyle.getListItemsHeight(list2, this.mViewPolicy);
        this.mAdapter.setSliceItems(this.mDisplayedItems, this.mViewPolicy.mMode);
        if (this.mDisplayedItemsHeight > getMeasuredHeight()) {
            z = true;
        }
        RecyclerView recyclerView = this.mRecyclerView;
        if (!this.mViewPolicy.mScrollable || !z) {
            i2 = 2;
        }
        recyclerView.setOverScrollMode(i2);
    }

    public TemplateView(Context context) {
        super(context);
        RecyclerView recyclerView = new RecyclerView(getContext());
        this.mRecyclerView = recyclerView;
        getContext();
        recyclerView.setLayoutManager(new LinearLayoutManager(1));
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

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        SliceView sliceView = (SliceView) getParent();
        this.mParent = sliceView;
        SliceAdapter sliceAdapter = this.mAdapter;
        sliceAdapter.mParent = sliceView;
        sliceAdapter.mTemplateView = this;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i, int i2) {
        int size = View.MeasureSpec.getSize(i2);
        if (!this.mViewPolicy.mScrollable && this.mDisplayedItems.size() > 0 && this.mDisplayedItemsHeight != size) {
            updateDisplayedItems(size);
        }
        super.onMeasure(i, i2);
    }

    @Override // androidx.slice.widget.SliceChildView
    public final void setInsets(int i, int i2, int i3, int i4) {
        super.setInsets(i, i2, i3, i4);
        SliceAdapter sliceAdapter = this.mAdapter;
        sliceAdapter.mInsetStart = i;
        sliceAdapter.mInsetTop = i2;
        sliceAdapter.mInsetEnd = i3;
        sliceAdapter.mInsetBottom = i4;
    }
}
