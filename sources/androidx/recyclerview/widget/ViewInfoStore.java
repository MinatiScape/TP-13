package androidx.recyclerview.widget;

import androidx.collection.LongSparseArray;
import androidx.collection.SimpleArrayMap;
import androidx.core.util.Pools$Pool;
import androidx.core.util.Pools$SimplePool;
import androidx.recyclerview.widget.RecyclerView;
/* loaded from: classes.dex */
public class ViewInfoStore {
    public final SimpleArrayMap<RecyclerView.ViewHolder, InfoRecord> mLayoutHolderMap = new SimpleArrayMap<>();
    public final LongSparseArray<RecyclerView.ViewHolder> mOldChangedHolders = new LongSparseArray<>();

    /* loaded from: classes.dex */
    public static class InfoRecord {
        public static Pools$Pool<InfoRecord> sPool = new Pools$SimplePool(20);
        public int flags;
        public RecyclerView.ItemAnimator.ItemHolderInfo postInfo;
        public RecyclerView.ItemAnimator.ItemHolderInfo preInfo;

        public static InfoRecord obtain() {
            InfoRecord infoRecord = (InfoRecord) ((Pools$SimplePool) sPool).acquire();
            return infoRecord == null ? new InfoRecord() : infoRecord;
        }

        public static void recycle(InfoRecord record) {
            record.flags = 0;
            record.preInfo = null;
            record.postInfo = null;
            ((Pools$SimplePool) sPool).release(record);
        }
    }

    /* loaded from: classes.dex */
    public interface ProcessCallback {
    }

    public void addToDisappearedInLayout(RecyclerView.ViewHolder holder) {
        InfoRecord orDefault = this.mLayoutHolderMap.getOrDefault(holder, null);
        if (orDefault == null) {
            orDefault = InfoRecord.obtain();
            this.mLayoutHolderMap.put(holder, orDefault);
        }
        orDefault.flags |= 1;
    }

    public void addToPostLayout(RecyclerView.ViewHolder holder, RecyclerView.ItemAnimator.ItemHolderInfo info) {
        InfoRecord orDefault = this.mLayoutHolderMap.getOrDefault(holder, null);
        if (orDefault == null) {
            orDefault = InfoRecord.obtain();
            this.mLayoutHolderMap.put(holder, orDefault);
        }
        orDefault.postInfo = info;
        orDefault.flags |= 8;
    }

    public void addToPreLayout(RecyclerView.ViewHolder holder, RecyclerView.ItemAnimator.ItemHolderInfo info) {
        InfoRecord orDefault = this.mLayoutHolderMap.getOrDefault(holder, null);
        if (orDefault == null) {
            orDefault = InfoRecord.obtain();
            this.mLayoutHolderMap.put(holder, orDefault);
        }
        orDefault.preInfo = info;
        orDefault.flags |= 4;
    }

    public boolean isDisappearing(RecyclerView.ViewHolder holder) {
        InfoRecord orDefault = this.mLayoutHolderMap.getOrDefault(holder, null);
        return (orDefault == null || (orDefault.flags & 1) == 0) ? false : true;
    }

    public final RecyclerView.ItemAnimator.ItemHolderInfo popFromLayoutStep(RecyclerView.ViewHolder vh, int flag) {
        InfoRecord valueAt;
        RecyclerView.ItemAnimator.ItemHolderInfo itemHolderInfo;
        int indexOfKey = this.mLayoutHolderMap.indexOfKey(vh);
        if (indexOfKey >= 0 && (valueAt = this.mLayoutHolderMap.valueAt(indexOfKey)) != null) {
            int i = valueAt.flags;
            if ((i & flag) != 0) {
                int i2 = (~flag) & i;
                valueAt.flags = i2;
                if (flag == 4) {
                    itemHolderInfo = valueAt.preInfo;
                } else if (flag == 8) {
                    itemHolderInfo = valueAt.postInfo;
                } else {
                    throw new IllegalArgumentException("Must provide flag PRE or POST");
                }
                if ((i2 & 12) == 0) {
                    this.mLayoutHolderMap.removeAt(indexOfKey);
                    InfoRecord.recycle(valueAt);
                }
                return itemHolderInfo;
            }
        }
        return null;
    }

    public void removeFromDisappearedInLayout(RecyclerView.ViewHolder holder) {
        InfoRecord orDefault = this.mLayoutHolderMap.getOrDefault(holder, null);
        if (orDefault != null) {
            orDefault.flags &= -2;
        }
    }

    public void removeViewHolder(RecyclerView.ViewHolder holder) {
        int size = this.mOldChangedHolders.size() - 1;
        while (true) {
            if (size < 0) {
                break;
            } else if (holder == this.mOldChangedHolders.valueAt(size)) {
                LongSparseArray<RecyclerView.ViewHolder> longSparseArray = this.mOldChangedHolders;
                Object[] objArr = longSparseArray.mValues;
                Object obj = objArr[size];
                Object obj2 = LongSparseArray.DELETED;
                if (obj != obj2) {
                    objArr[size] = obj2;
                    longSparseArray.mGarbage = true;
                }
            } else {
                size--;
            }
        }
        InfoRecord remove = this.mLayoutHolderMap.remove(holder);
        if (remove != null) {
            InfoRecord.recycle(remove);
        }
    }
}
