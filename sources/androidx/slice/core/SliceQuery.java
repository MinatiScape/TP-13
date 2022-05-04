package androidx.slice.core;

import android.text.TextUtils;
import androidx.slice.Slice;
import androidx.slice.SliceItem;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
/* loaded from: classes.dex */
public final class SliceQuery {

    /* loaded from: classes.dex */
    public interface Filter<T> {
        boolean filter(SliceItem sliceItem);
    }

    public static SliceItem find(Slice slice, String str, String str2) {
        return find(slice, str, new String[]{str2}, new String[]{null});
    }

    public static SliceItem findSubtype(Slice slice, final String str, final String str2) {
        if (slice == null) {
            return null;
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        Collections.addAll(arrayDeque, slice.mItems);
        return findSliceItem(arrayDeque, new Filter<SliceItem>() { // from class: androidx.slice.core.SliceQuery.5
            @Override // androidx.slice.core.SliceQuery.Filter
            public final boolean filter(SliceItem sliceItem) {
                boolean z;
                if (SliceQuery.checkFormat(sliceItem, str)) {
                    String str3 = str2;
                    if (str3 == null || str3.equals(sliceItem.mSubType)) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (z) {
                        return true;
                    }
                }
                return false;
            }
        });
    }

    public static boolean hasAnyHints(SliceItem sliceItem, String... strArr) {
        if (strArr == null) {
            return false;
        }
        for (String str : strArr) {
            if (sliceItem.hasHint(str)) {
                return true;
            }
        }
        return false;
    }

    public static boolean hasHints(SliceItem sliceItem, String... strArr) {
        if (strArr == null) {
            return true;
        }
        for (String str : strArr) {
            if (!(TextUtils.isEmpty(str) || sliceItem.hasHint(str))) {
                return false;
            }
        }
        return true;
    }

    public static boolean checkFormat(SliceItem sliceItem, String str) {
        if (str == null || str.equals(sliceItem.mFormat)) {
            return true;
        }
        return false;
    }

    public static SliceItem find(SliceItem sliceItem, String str, String str2) {
        return find(sliceItem, str, new String[]{str2}, new String[]{null});
    }

    public static ArrayList findAll(SliceItem sliceItem, String str, String[] strArr, String[] strArr2) {
        boolean z;
        ArrayList arrayList = new ArrayList();
        ArrayDeque arrayDeque = new ArrayDeque();
        arrayDeque.add(sliceItem);
        while (!arrayDeque.isEmpty()) {
            SliceItem sliceItem2 = (SliceItem) arrayDeque.poll();
            if (!checkFormat(sliceItem2, str) || !hasHints(sliceItem2, strArr) || hasAnyHints(sliceItem2, strArr2)) {
                z = false;
            } else {
                z = true;
            }
            if (z) {
                arrayList.add(sliceItem2);
            }
            if ("slice".equals(sliceItem2.mFormat) || "action".equals(sliceItem2.mFormat)) {
                Collections.addAll(arrayDeque, sliceItem2.getSlice().mItems);
            }
        }
        return arrayList;
    }

    public static SliceItem findTopLevelItem(Slice slice, String str, String str2, String[] strArr) {
        SliceItem[] sliceItemArr;
        boolean z;
        for (SliceItem sliceItem : slice.mItems) {
            if (checkFormat(sliceItem, str)) {
                if (str2 == null || str2.equals(sliceItem.mSubType)) {
                    z = true;
                } else {
                    z = false;
                }
                if (z && hasHints(sliceItem, strArr) && !hasAnyHints(sliceItem, null)) {
                    return sliceItem;
                }
            }
        }
        return null;
    }

    public static SliceItem find(Slice slice, final String str, final String[] strArr, final String[] strArr2) {
        if (slice == null) {
            return null;
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        Collections.addAll(arrayDeque, slice.mItems);
        return findSliceItem(arrayDeque, new Filter<SliceItem>() { // from class: androidx.slice.core.SliceQuery.4
            @Override // androidx.slice.core.SliceQuery.Filter
            public final boolean filter(SliceItem sliceItem) {
                if (!SliceQuery.checkFormat(sliceItem, str) || !SliceQuery.hasHints(sliceItem, strArr) || SliceQuery.hasAnyHints(sliceItem, strArr2)) {
                    return false;
                }
                return true;
            }
        });
    }

    public static SliceItem findSliceItem(ArrayDeque arrayDeque, Filter filter) {
        while (!arrayDeque.isEmpty()) {
            SliceItem sliceItem = (SliceItem) arrayDeque.poll();
            if (filter.filter(sliceItem)) {
                return sliceItem;
            }
            if ("slice".equals(sliceItem.mFormat) || "action".equals(sliceItem.mFormat)) {
                Collections.addAll(arrayDeque, sliceItem.getSlice().mItems);
            }
        }
        return null;
    }

    public static SliceItem findSubtype(SliceItem sliceItem, final String str, final String str2) {
        if (sliceItem == null) {
            return null;
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        arrayDeque.add(sliceItem);
        return findSliceItem(arrayDeque, new Filter<SliceItem>() { // from class: androidx.slice.core.SliceQuery.6
            @Override // androidx.slice.core.SliceQuery.Filter
            public final boolean filter(SliceItem sliceItem2) {
                boolean z;
                if (SliceQuery.checkFormat(sliceItem2, str)) {
                    String str3 = str2;
                    if (str3 == null || str3.equals(sliceItem2.mSubType)) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (z) {
                        return true;
                    }
                }
                return false;
            }
        });
    }

    public static SliceItem find(SliceItem sliceItem, final String str, final String[] strArr, final String[] strArr2) {
        if (sliceItem == null) {
            return null;
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        arrayDeque.add(sliceItem);
        return findSliceItem(arrayDeque, new Filter<SliceItem>() { // from class: androidx.slice.core.SliceQuery.7
            @Override // androidx.slice.core.SliceQuery.Filter
            public final boolean filter(SliceItem sliceItem2) {
                if (!SliceQuery.checkFormat(sliceItem2, str) || !SliceQuery.hasHints(sliceItem2, strArr) || SliceQuery.hasAnyHints(sliceItem2, strArr2)) {
                    return false;
                }
                return true;
            }
        });
    }
}
