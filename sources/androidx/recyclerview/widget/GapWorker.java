package androidx.recyclerview.widget;

import android.annotation.SuppressLint;
import android.os.Trace;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public final class GapWorker implements Runnable {
    public static final ThreadLocal<GapWorker> sGapWorker = new ThreadLocal<>();
    public static Comparator<Task> sTaskComparator = new Comparator<Task>() { // from class: androidx.recyclerview.widget.GapWorker.1
        /* JADX WARN: Code restructure failed: missing block: B:12:0x0017, code lost:
            if (r5 == null) goto L13;
         */
        /* JADX WARN: Code restructure failed: missing block: B:17:0x0023, code lost:
            if (r5 != false) goto L14;
         */
        /* JADX WARN: Code restructure failed: missing block: B:23:0x0037, code lost:
            return 1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:24:?, code lost:
            return -1;
         */
        @Override // java.util.Comparator
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public int compare(androidx.recyclerview.widget.GapWorker.Task r6, androidx.recyclerview.widget.GapWorker.Task r7) {
            /*
                r5 = this;
                androidx.recyclerview.widget.GapWorker$Task r6 = (androidx.recyclerview.widget.GapWorker.Task) r6
                androidx.recyclerview.widget.GapWorker$Task r7 = (androidx.recyclerview.widget.GapWorker.Task) r7
                androidx.recyclerview.widget.RecyclerView r5 = r6.view
                r0 = 0
                r1 = 1
                if (r5 != 0) goto Lc
                r2 = r1
                goto Ld
            Lc:
                r2 = r0
            Ld:
                androidx.recyclerview.widget.RecyclerView r3 = r7.view
                if (r3 != 0) goto L13
                r3 = r1
                goto L14
            L13:
                r3 = r0
            L14:
                r4 = -1
                if (r2 == r3) goto L1d
                if (r5 != 0) goto L1b
            L19:
                r0 = r1
                goto L37
            L1b:
                r0 = r4
                goto L37
            L1d:
                boolean r5 = r6.immediate
                boolean r2 = r7.immediate
                if (r5 == r2) goto L26
                if (r5 == 0) goto L19
                goto L1b
            L26:
                int r5 = r7.viewVelocity
                int r1 = r6.viewVelocity
                int r5 = r5 - r1
                if (r5 == 0) goto L2f
            L2d:
                r0 = r5
                goto L37
            L2f:
                int r5 = r6.distanceToItem
                int r6 = r7.distanceToItem
                int r5 = r5 - r6
                if (r5 == 0) goto L37
                goto L2d
            L37:
                return r0
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.GapWorker.AnonymousClass1.compare(java.lang.Object, java.lang.Object):int");
        }
    };
    public long mFrameIntervalNs;
    public long mPostTimeNs;
    public ArrayList<RecyclerView> mRecyclerViews = new ArrayList<>();
    public ArrayList<Task> mTasks = new ArrayList<>();

    @SuppressLint({"VisibleForTests"})
    /* loaded from: classes.dex */
    public static class LayoutPrefetchRegistryImpl implements RecyclerView.LayoutManager.LayoutPrefetchRegistry {
        public int mCount;
        public int[] mPrefetchArray;
        public int mPrefetchDx;
        public int mPrefetchDy;

        public void addPosition(int layoutPosition, int pixelDistance) {
            if (layoutPosition < 0) {
                throw new IllegalArgumentException("Layout positions must be non-negative");
            } else if (pixelDistance >= 0) {
                int i = this.mCount * 2;
                int[] iArr = this.mPrefetchArray;
                if (iArr == null) {
                    int[] iArr2 = new int[4];
                    this.mPrefetchArray = iArr2;
                    Arrays.fill(iArr2, -1);
                } else if (i >= iArr.length) {
                    int[] iArr3 = new int[i * 2];
                    this.mPrefetchArray = iArr3;
                    System.arraycopy(iArr, 0, iArr3, 0, iArr.length);
                }
                int[] iArr4 = this.mPrefetchArray;
                iArr4[i] = layoutPosition;
                iArr4[i + 1] = pixelDistance;
                this.mCount++;
            } else {
                throw new IllegalArgumentException("Pixel distance must be non-negative");
            }
        }

        public void collectPrefetchPositionsFromView(RecyclerView view, boolean nested) {
            this.mCount = 0;
            int[] iArr = this.mPrefetchArray;
            if (iArr != null) {
                Arrays.fill(iArr, -1);
            }
            RecyclerView.LayoutManager layoutManager = view.mLayout;
            if (view.mAdapter != null && layoutManager != null && layoutManager.mItemPrefetchEnabled) {
                if (nested) {
                    if (!view.mAdapterHelper.hasPendingUpdates()) {
                        layoutManager.collectInitialPrefetchPositions(view.mAdapter.getItemCount(), this);
                    }
                } else if (!view.hasPendingAdapterUpdates()) {
                    layoutManager.collectAdjacentPrefetchPositions(this.mPrefetchDx, this.mPrefetchDy, view.mState, this);
                }
                int i = this.mCount;
                if (i > layoutManager.mPrefetchMaxCountObserved) {
                    layoutManager.mPrefetchMaxCountObserved = i;
                    layoutManager.mPrefetchMaxObservedInInitialPrefetch = nested;
                    view.mRecycler.updateViewCacheSize();
                }
            }
        }

        public boolean lastPrefetchIncludedPosition(int position) {
            if (this.mPrefetchArray != null) {
                int i = this.mCount * 2;
                for (int i2 = 0; i2 < i; i2 += 2) {
                    if (this.mPrefetchArray[i2] == position) {
                        return true;
                    }
                }
            }
            return false;
        }
    }

    /* loaded from: classes.dex */
    public static class Task {
        public int distanceToItem;
        public boolean immediate;
        public int position;
        public RecyclerView view;
        public int viewVelocity;
    }

    public void postFromTraversal(RecyclerView recyclerView, int prefetchDx, int prefetchDy) {
        if (recyclerView.isAttachedToWindow() && this.mPostTimeNs == 0) {
            this.mPostTimeNs = recyclerView.getNanoTime();
            recyclerView.post(this);
        }
        LayoutPrefetchRegistryImpl layoutPrefetchRegistryImpl = recyclerView.mPrefetchRegistry;
        layoutPrefetchRegistryImpl.mPrefetchDx = prefetchDx;
        layoutPrefetchRegistryImpl.mPrefetchDy = prefetchDy;
    }

    public void prefetch(long deadlineNs) {
        Task task;
        RecyclerView recyclerView;
        RecyclerView recyclerView2;
        Task task2;
        int size = this.mRecyclerViews.size();
        int i = 0;
        for (int i2 = 0; i2 < size; i2++) {
            RecyclerView recyclerView3 = this.mRecyclerViews.get(i2);
            if (recyclerView3.getWindowVisibility() == 0) {
                recyclerView3.mPrefetchRegistry.collectPrefetchPositionsFromView(recyclerView3, false);
                i += recyclerView3.mPrefetchRegistry.mCount;
            }
        }
        this.mTasks.ensureCapacity(i);
        int i3 = 0;
        for (int i4 = 0; i4 < size; i4++) {
            RecyclerView recyclerView4 = this.mRecyclerViews.get(i4);
            if (recyclerView4.getWindowVisibility() == 0) {
                LayoutPrefetchRegistryImpl layoutPrefetchRegistryImpl = recyclerView4.mPrefetchRegistry;
                int abs = Math.abs(layoutPrefetchRegistryImpl.mPrefetchDy) + Math.abs(layoutPrefetchRegistryImpl.mPrefetchDx);
                for (int i5 = 0; i5 < layoutPrefetchRegistryImpl.mCount * 2; i5 += 2) {
                    if (i3 >= this.mTasks.size()) {
                        task2 = new Task();
                        this.mTasks.add(task2);
                    } else {
                        task2 = this.mTasks.get(i3);
                    }
                    int[] iArr = layoutPrefetchRegistryImpl.mPrefetchArray;
                    int i6 = iArr[i5 + 1];
                    task2.immediate = i6 <= abs;
                    task2.viewVelocity = abs;
                    task2.distanceToItem = i6;
                    task2.view = recyclerView4;
                    task2.position = iArr[i5];
                    i3++;
                }
            }
        }
        Collections.sort(this.mTasks, sTaskComparator);
        for (int i7 = 0; i7 < this.mTasks.size() && (recyclerView = (task = this.mTasks.get(i7)).view) != null; i7++) {
            RecyclerView.ViewHolder prefetchPositionWithDeadline = prefetchPositionWithDeadline(recyclerView, task.position, task.immediate ? RecyclerView.FOREVER_NS : deadlineNs);
            if (!(prefetchPositionWithDeadline == null || prefetchPositionWithDeadline.mNestedRecyclerView == null || !prefetchPositionWithDeadline.isBound() || prefetchPositionWithDeadline.isInvalid() || (recyclerView2 = prefetchPositionWithDeadline.mNestedRecyclerView.get()) == null)) {
                if (recyclerView2.mDataSetHasChangedAfterLayout && recyclerView2.mChildHelper.getUnfilteredChildCount() != 0) {
                    recyclerView2.removeAndRecycleViews();
                }
                LayoutPrefetchRegistryImpl layoutPrefetchRegistryImpl2 = recyclerView2.mPrefetchRegistry;
                layoutPrefetchRegistryImpl2.collectPrefetchPositionsFromView(recyclerView2, true);
                if (layoutPrefetchRegistryImpl2.mCount != 0) {
                    try {
                        Trace.beginSection(RecyclerView.TRACE_NESTED_PREFETCH_TAG);
                        RecyclerView.State state = recyclerView2.mState;
                        RecyclerView.Adapter adapter = recyclerView2.mAdapter;
                        state.mLayoutStep = 1;
                        state.mItemCount = adapter.getItemCount();
                        state.mInPreLayout = false;
                        state.mTrackOldChangeHolders = false;
                        state.mIsMeasuring = false;
                        for (int i8 = 0; i8 < layoutPrefetchRegistryImpl2.mCount * 2; i8 += 2) {
                            prefetchPositionWithDeadline(recyclerView2, layoutPrefetchRegistryImpl2.mPrefetchArray[i8], deadlineNs);
                        }
                    } finally {
                        Trace.endSection();
                    }
                } else {
                    continue;
                }
            }
            task.immediate = false;
            task.viewVelocity = 0;
            task.distanceToItem = 0;
            task.view = null;
            task.position = 0;
        }
    }

    public final RecyclerView.ViewHolder prefetchPositionWithDeadline(RecyclerView view, int position, long deadlineNs) {
        boolean z;
        int unfilteredChildCount = view.mChildHelper.getUnfilteredChildCount();
        int i = 0;
        while (true) {
            if (i >= unfilteredChildCount) {
                z = false;
                break;
            }
            RecyclerView.ViewHolder childViewHolderInt = RecyclerView.getChildViewHolderInt(view.mChildHelper.getUnfilteredChildAt(i));
            if (childViewHolderInt.mPosition == position && !childViewHolderInt.isInvalid()) {
                z = true;
                break;
            }
            i++;
        }
        if (z) {
            return null;
        }
        RecyclerView.Recycler recycler = view.mRecycler;
        try {
            view.onEnterLayoutOrScroll();
            RecyclerView.ViewHolder tryGetViewHolderForPositionByDeadline = recycler.tryGetViewHolderForPositionByDeadline(position, false, deadlineNs);
            if (tryGetViewHolderForPositionByDeadline != null) {
                if (!tryGetViewHolderForPositionByDeadline.isBound() || tryGetViewHolderForPositionByDeadline.isInvalid()) {
                    recycler.addViewHolderToRecycledViewPool(tryGetViewHolderForPositionByDeadline, false);
                } else {
                    recycler.recycleView(tryGetViewHolderForPositionByDeadline.itemView);
                }
            }
            return tryGetViewHolderForPositionByDeadline;
        } finally {
            view.onExitLayoutOrScroll(false);
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            Trace.beginSection(RecyclerView.TRACE_PREFETCH_TAG);
            if (!this.mRecyclerViews.isEmpty()) {
                int size = this.mRecyclerViews.size();
                long j = 0;
                for (int i = 0; i < size; i++) {
                    RecyclerView recyclerView = this.mRecyclerViews.get(i);
                    if (recyclerView.getWindowVisibility() == 0) {
                        j = Math.max(recyclerView.getDrawingTime(), j);
                    }
                }
                if (j != 0) {
                    prefetch(TimeUnit.MILLISECONDS.toNanos(j) + this.mFrameIntervalNs);
                }
            }
        } finally {
            this.mPostTimeNs = 0L;
            Trace.endSection();
        }
    }
}
