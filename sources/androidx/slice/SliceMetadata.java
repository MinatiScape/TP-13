package androidx.slice;

import android.content.Context;
import android.os.Bundle;
import androidx.slice.core.SliceActionImpl;
import androidx.slice.core.SliceQuery;
import androidx.slice.widget.ListContent;
import androidx.slice.widget.RowContent;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class SliceMetadata {
    public Context mContext;
    public long mExpiry;
    public RowContent mHeaderContent;
    public long mLastUpdated;
    public ListContent mListContent;
    public SliceActionImpl mPrimaryAction;
    public Slice mSlice;
    public ArrayList mSliceActions;

    public final int getLoadingState() {
        boolean z;
        if (SliceQuery.find(this.mSlice, (String) null, "partial") != null) {
            z = true;
        } else {
            z = false;
        }
        if (!this.mListContent.isValid()) {
            return 0;
        }
        if (z) {
            return 1;
        }
        return 2;
    }

    public SliceMetadata(Context context, Slice slice) {
        ArrayList arrayList;
        RowContent rowContent;
        this.mSlice = slice;
        this.mContext = context;
        SliceItem find = SliceQuery.find(slice, "long", "ttl");
        if (find != null) {
            this.mExpiry = find.getLong();
        }
        SliceItem find2 = SliceQuery.find(slice, "long", "last_updated");
        if (find2 != null) {
            this.mLastUpdated = find2.getLong();
        }
        SliceItem findSubtype = SliceQuery.findSubtype(slice, "bundle", "host_extras");
        if (findSubtype != null) {
            Object obj = findSubtype.mObj;
            if (obj instanceof Bundle) {
                Bundle bundle = (Bundle) obj;
                ListContent listContent = new ListContent(slice);
                this.mListContent = listContent;
                RowContent rowContent2 = listContent.mHeaderContent;
                this.mHeaderContent = rowContent2;
                ListContent.getRowType(rowContent2, true, listContent.mSliceActions);
                this.mPrimaryAction = (SliceActionImpl) this.mListContent.getShortcut(this.mContext);
                arrayList = this.mListContent.mSliceActions;
                this.mSliceActions = arrayList;
                if (arrayList == null && (rowContent = this.mHeaderContent) != null && SliceQuery.hasHints(rowContent.mSliceItem, "list_item")) {
                    ArrayList<SliceItem> arrayList2 = this.mHeaderContent.mEndItems;
                    ArrayList arrayList3 = new ArrayList();
                    for (int i = 0; i < arrayList2.size(); i++) {
                        if (SliceQuery.find(arrayList2.get(i), "action", (String[]) null, (String[]) null) != null) {
                            arrayList3.add(new SliceActionImpl(arrayList2.get(i)));
                        }
                    }
                    if (arrayList3.size() > 0) {
                        this.mSliceActions = arrayList3;
                        return;
                    }
                    return;
                }
                return;
            }
        }
        Bundle bundle2 = Bundle.EMPTY;
        ListContent listContent2 = new ListContent(slice);
        this.mListContent = listContent2;
        RowContent rowContent22 = listContent2.mHeaderContent;
        this.mHeaderContent = rowContent22;
        ListContent.getRowType(rowContent22, true, listContent2.mSliceActions);
        this.mPrimaryAction = (SliceActionImpl) this.mListContent.getShortcut(this.mContext);
        arrayList = this.mListContent.mSliceActions;
        this.mSliceActions = arrayList;
        if (arrayList == null) {
        }
    }

    public final boolean isExpired() {
        long currentTimeMillis = System.currentTimeMillis();
        long j = this.mExpiry;
        if (j == 0 || j == -1 || currentTimeMillis <= j) {
            return false;
        }
        return true;
    }
}
