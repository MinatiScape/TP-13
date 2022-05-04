package androidx.recyclerview.widget;

import androidx.core.util.Pools$Pool;
import androidx.core.util.Pools$SimplePool;
import androidx.recyclerview.widget.OpReorderer;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class AdapterHelper implements OpReorderer.Callback {
    public final Callback mCallback;
    public Pools$Pool<UpdateOp> mUpdateOpPool = new Pools$SimplePool(30);
    public final ArrayList<UpdateOp> mPendingUpdates = new ArrayList<>();
    public final ArrayList<UpdateOp> mPostponedList = new ArrayList<>();
    public int mExistingUpdateTypes = 0;
    public final OpReorderer mOpReorderer = new OpReorderer(this);

    /* loaded from: classes.dex */
    public interface Callback {
    }

    /* loaded from: classes.dex */
    public static final class UpdateOp {
        public int cmd;
        public int itemCount;
        public Object payload;
        public int positionStart;

        public UpdateOp(int cmd, int positionStart, int itemCount, Object payload) {
            this.cmd = cmd;
            this.positionStart = positionStart;
            this.itemCount = itemCount;
            this.payload = payload;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (!(o instanceof UpdateOp)) {
                return false;
            }
            UpdateOp updateOp = (UpdateOp) o;
            int i = this.cmd;
            if (i != updateOp.cmd) {
                return false;
            }
            if (i == 8 && Math.abs(this.itemCount - this.positionStart) == 1 && this.itemCount == updateOp.positionStart && this.positionStart == updateOp.itemCount) {
                return true;
            }
            if (this.itemCount != updateOp.itemCount || this.positionStart != updateOp.positionStart) {
                return false;
            }
            Object obj = this.payload;
            if (obj != null) {
                if (!obj.equals(updateOp.payload)) {
                    return false;
                }
            } else if (updateOp.payload != null) {
                return false;
            }
            return true;
        }

        public int hashCode() {
            return (((this.cmd * 31) + this.positionStart) * 31) + this.itemCount;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(Integer.toHexString(System.identityHashCode(this)));
            sb.append("[");
            int i = this.cmd;
            sb.append(i != 1 ? i != 2 ? i != 4 ? i != 8 ? "??" : "mv" : "up" : "rm" : "add");
            sb.append(",s:");
            sb.append(this.positionStart);
            sb.append("c:");
            sb.append(this.itemCount);
            sb.append(",p:");
            sb.append(this.payload);
            sb.append("]");
            return sb.toString();
        }
    }

    public AdapterHelper(Callback callback) {
        this.mCallback = callback;
    }

    public final boolean canFindInPreLayout(int position) {
        int size = this.mPostponedList.size();
        for (int i = 0; i < size; i++) {
            UpdateOp updateOp = this.mPostponedList.get(i);
            int i2 = updateOp.cmd;
            if (i2 == 8) {
                if (findPositionOffset(updateOp.itemCount, i + 1) == position) {
                    return true;
                }
            } else if (i2 == 1) {
                int i3 = updateOp.positionStart;
                int i4 = updateOp.itemCount + i3;
                while (i3 < i4) {
                    if (findPositionOffset(i3, i + 1) == position) {
                        return true;
                    }
                    i3++;
                }
                continue;
            } else {
                continue;
            }
        }
        return false;
    }

    public void consumePostponedUpdates() {
        int size = this.mPostponedList.size();
        for (int i = 0; i < size; i++) {
            ((RecyclerView.AnonymousClass6) this.mCallback).dispatchUpdate(this.mPostponedList.get(i));
        }
        recycleUpdateOpsAndClearList(this.mPostponedList);
        this.mExistingUpdateTypes = 0;
    }

    public void consumeUpdatesInOnePass() {
        consumePostponedUpdates();
        int size = this.mPendingUpdates.size();
        for (int i = 0; i < size; i++) {
            UpdateOp updateOp = this.mPendingUpdates.get(i);
            int i2 = updateOp.cmd;
            if (i2 == 1) {
                ((RecyclerView.AnonymousClass6) this.mCallback).dispatchUpdate(updateOp);
                RecyclerView.AnonymousClass6 r4 = (RecyclerView.AnonymousClass6) this.mCallback;
                RecyclerView.this.offsetPositionRecordsForInsert(updateOp.positionStart, updateOp.itemCount);
                RecyclerView.this.mItemsAddedOrRemoved = true;
            } else if (i2 == 2) {
                ((RecyclerView.AnonymousClass6) this.mCallback).dispatchUpdate(updateOp);
                Callback callback = this.mCallback;
                int i3 = updateOp.positionStart;
                int i4 = updateOp.itemCount;
                RecyclerView.AnonymousClass6 r42 = (RecyclerView.AnonymousClass6) callback;
                RecyclerView.this.offsetPositionRecordsForRemove(i3, i4, true);
                RecyclerView recyclerView = RecyclerView.this;
                recyclerView.mItemsAddedOrRemoved = true;
                recyclerView.mState.mDeletedInvisibleItemCountSincePreviousLayout += i4;
            } else if (i2 == 4) {
                ((RecyclerView.AnonymousClass6) this.mCallback).dispatchUpdate(updateOp);
                ((RecyclerView.AnonymousClass6) this.mCallback).markViewHoldersUpdated(updateOp.positionStart, updateOp.itemCount, updateOp.payload);
            } else if (i2 == 8) {
                ((RecyclerView.AnonymousClass6) this.mCallback).dispatchUpdate(updateOp);
                RecyclerView.AnonymousClass6 r43 = (RecyclerView.AnonymousClass6) this.mCallback;
                RecyclerView.this.offsetPositionRecordsForMove(updateOp.positionStart, updateOp.itemCount);
                RecyclerView.this.mItemsAddedOrRemoved = true;
            }
        }
        recycleUpdateOpsAndClearList(this.mPendingUpdates);
        this.mExistingUpdateTypes = 0;
    }

    public final void dispatchAndUpdateViewHolders(UpdateOp op) {
        int i;
        int i2 = op.cmd;
        if (i2 == 1 || i2 == 8) {
            throw new IllegalArgumentException("should not dispatch add or move for pre layout");
        }
        int updatePositionWithPostponed = updatePositionWithPostponed(op.positionStart, i2);
        int i3 = op.positionStart;
        int i4 = op.cmd;
        if (i4 == 2) {
            i = 0;
        } else if (i4 == 4) {
            i = 1;
        } else {
            throw new IllegalArgumentException("op should be remove or update." + op);
        }
        int i5 = 1;
        for (int i6 = 1; i6 < op.itemCount; i6++) {
            int updatePositionWithPostponed2 = updatePositionWithPostponed((i * i6) + op.positionStart, op.cmd);
            int i7 = op.cmd;
            if (i7 == 2 ? updatePositionWithPostponed2 == updatePositionWithPostponed : i7 == 4 && updatePositionWithPostponed2 == updatePositionWithPostponed + 1) {
                i5++;
            } else {
                UpdateOp obtainUpdateOp = obtainUpdateOp(i7, updatePositionWithPostponed, i5, op.payload);
                dispatchFirstPassAndUpdateViewHolders(obtainUpdateOp, i3);
                recycleUpdateOp(obtainUpdateOp);
                if (op.cmd == 4) {
                    i3 += i5;
                }
                i5 = 1;
                updatePositionWithPostponed = updatePositionWithPostponed2;
            }
        }
        Object obj = op.payload;
        recycleUpdateOp(op);
        if (i5 > 0) {
            UpdateOp obtainUpdateOp2 = obtainUpdateOp(op.cmd, updatePositionWithPostponed, i5, obj);
            dispatchFirstPassAndUpdateViewHolders(obtainUpdateOp2, i3);
            recycleUpdateOp(obtainUpdateOp2);
        }
    }

    public void dispatchFirstPassAndUpdateViewHolders(UpdateOp op, int offsetStart) {
        ((RecyclerView.AnonymousClass6) this.mCallback).dispatchUpdate(op);
        int i = op.cmd;
        if (i == 2) {
            Callback callback = this.mCallback;
            int i2 = op.itemCount;
            RecyclerView.AnonymousClass6 r3 = (RecyclerView.AnonymousClass6) callback;
            RecyclerView.this.offsetPositionRecordsForRemove(offsetStart, i2, true);
            RecyclerView recyclerView = RecyclerView.this;
            recyclerView.mItemsAddedOrRemoved = true;
            recyclerView.mState.mDeletedInvisibleItemCountSincePreviousLayout += i2;
        } else if (i == 4) {
            RecyclerView.AnonymousClass6 r32 = (RecyclerView.AnonymousClass6) this.mCallback;
            RecyclerView.this.viewRangeUpdate(offsetStart, op.itemCount, op.payload);
            RecyclerView.this.mItemsChanged = true;
        } else {
            throw new IllegalArgumentException("only remove and update ops can be dispatched in first pass");
        }
    }

    public int findPositionOffset(int position, int firstPostponedItem) {
        int size = this.mPostponedList.size();
        while (firstPostponedItem < size) {
            UpdateOp updateOp = this.mPostponedList.get(firstPostponedItem);
            int i = updateOp.cmd;
            if (i == 8) {
                int i2 = updateOp.positionStart;
                if (i2 == position) {
                    position = updateOp.itemCount;
                } else {
                    if (i2 < position) {
                        position--;
                    }
                    if (updateOp.itemCount <= position) {
                        position++;
                    }
                }
            } else {
                int i3 = updateOp.positionStart;
                if (i3 > position) {
                    continue;
                } else if (i == 2) {
                    int i4 = updateOp.itemCount;
                    if (position < i3 + i4) {
                        return -1;
                    }
                    position -= i4;
                } else if (i == 1) {
                    position += updateOp.itemCount;
                }
            }
            firstPostponedItem++;
        }
        return position;
    }

    public boolean hasPendingUpdates() {
        return this.mPendingUpdates.size() > 0;
    }

    public UpdateOp obtainUpdateOp(int cmd, int positionStart, int itemCount, Object payload) {
        UpdateOp acquire = this.mUpdateOpPool.acquire();
        if (acquire == null) {
            return new UpdateOp(cmd, positionStart, itemCount, payload);
        }
        acquire.cmd = cmd;
        acquire.positionStart = positionStart;
        acquire.itemCount = itemCount;
        acquire.payload = payload;
        return acquire;
    }

    public final void postponeAndUpdateViewHolders(UpdateOp op) {
        this.mPostponedList.add(op);
        int i = op.cmd;
        if (i == 1) {
            Callback callback = this.mCallback;
            RecyclerView.AnonymousClass6 r4 = (RecyclerView.AnonymousClass6) callback;
            RecyclerView.this.offsetPositionRecordsForInsert(op.positionStart, op.itemCount);
            RecyclerView.this.mItemsAddedOrRemoved = true;
        } else if (i == 2) {
            Callback callback2 = this.mCallback;
            RecyclerView.AnonymousClass6 r42 = (RecyclerView.AnonymousClass6) callback2;
            RecyclerView.this.offsetPositionRecordsForRemove(op.positionStart, op.itemCount, false);
            RecyclerView.this.mItemsAddedOrRemoved = true;
        } else if (i == 4) {
            ((RecyclerView.AnonymousClass6) this.mCallback).markViewHoldersUpdated(op.positionStart, op.itemCount, op.payload);
        } else if (i == 8) {
            Callback callback3 = this.mCallback;
            RecyclerView.AnonymousClass6 r43 = (RecyclerView.AnonymousClass6) callback3;
            RecyclerView.this.offsetPositionRecordsForMove(op.positionStart, op.itemCount);
            RecyclerView.this.mItemsAddedOrRemoved = true;
        } else {
            throw new IllegalArgumentException("Unknown update op type for " + op);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:175:0x00a3 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:176:0x00d1 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:180:0x0126 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:183:0x0117 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:187:0x0009 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00fe  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void preProcess() {
        /*
            Method dump skipped, instructions count: 672
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.AdapterHelper.preProcess():void");
    }

    public void recycleUpdateOp(UpdateOp op) {
        op.payload = null;
        this.mUpdateOpPool.release(op);
    }

    public void recycleUpdateOpsAndClearList(List<UpdateOp> ops) {
        int size = ops.size();
        for (int i = 0; i < size; i++) {
            recycleUpdateOp(ops.get(i));
        }
        ops.clear();
    }

    public final int updatePositionWithPostponed(int pos, int cmd) {
        int i;
        int i2;
        for (int size = this.mPostponedList.size() - 1; size >= 0; size--) {
            UpdateOp updateOp = this.mPostponedList.get(size);
            int i3 = updateOp.cmd;
            if (i3 == 8) {
                int i4 = updateOp.positionStart;
                int i5 = updateOp.itemCount;
                if (i4 < i5) {
                    i2 = i4;
                    i = i5;
                } else {
                    i = i4;
                    i2 = i5;
                }
                if (pos < i2 || pos > i) {
                    if (pos < i4) {
                        if (cmd == 1) {
                            updateOp.positionStart = i4 + 1;
                            updateOp.itemCount = i5 + 1;
                        } else if (cmd == 2) {
                            updateOp.positionStart = i4 - 1;
                            updateOp.itemCount = i5 - 1;
                        }
                    }
                } else if (i2 == i4) {
                    if (cmd == 1) {
                        updateOp.itemCount = i5 + 1;
                    } else if (cmd == 2) {
                        updateOp.itemCount = i5 - 1;
                    }
                    pos++;
                } else {
                    if (cmd == 1) {
                        updateOp.positionStart = i4 + 1;
                    } else if (cmd == 2) {
                        updateOp.positionStart = i4 - 1;
                    }
                    pos--;
                }
            } else {
                int i6 = updateOp.positionStart;
                if (i6 <= pos) {
                    if (i3 == 1) {
                        pos -= updateOp.itemCount;
                    } else if (i3 == 2) {
                        pos += updateOp.itemCount;
                    }
                } else if (cmd == 1) {
                    updateOp.positionStart = i6 + 1;
                } else if (cmd == 2) {
                    updateOp.positionStart = i6 - 1;
                }
            }
        }
        for (int size2 = this.mPostponedList.size() - 1; size2 >= 0; size2--) {
            UpdateOp updateOp2 = this.mPostponedList.get(size2);
            if (updateOp2.cmd == 8) {
                int i7 = updateOp2.itemCount;
                if (i7 == updateOp2.positionStart || i7 < 0) {
                    this.mPostponedList.remove(size2);
                    recycleUpdateOp(updateOp2);
                }
            } else if (updateOp2.itemCount <= 0) {
                this.mPostponedList.remove(size2);
                recycleUpdateOp(updateOp2);
            }
        }
        return pos;
    }
}
