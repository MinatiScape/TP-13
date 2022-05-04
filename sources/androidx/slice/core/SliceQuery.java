package androidx.slice.core;

import android.text.TextUtils;
import androidx.slice.Slice;
import androidx.slice.SliceItem;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Deque;
import java.util.List;
/* loaded from: classes.dex */
public class SliceQuery {
    public static boolean checkFormat(SliceItem item, String format) {
        return format == null || format.equals(item.mFormat);
    }

    public static boolean checkSubtype(SliceItem item, String subtype) {
        return subtype == null || subtype.equals(item.mSubType);
    }

    public static SliceItem find(Slice s, String format, String hints, String nonHints) {
        return find(s, format, new String[]{hints}, new String[]{null});
    }

    public static List<SliceItem> findAll(SliceItem s, final String format, final String[] hints, final String[] nonHints) {
        ArrayList arrayList = new ArrayList();
        Deque<SliceItem> queue = toQueue(s);
        while (true) {
            ArrayDeque arrayDeque = (ArrayDeque) queue;
            if (arrayDeque.isEmpty()) {
                return arrayList;
            }
            SliceItem sliceItem = (SliceItem) arrayDeque.poll();
            if (checkFormat(sliceItem, format) && hasHints(sliceItem, hints) && !hasAnyHints(sliceItem, nonHints)) {
                arrayList.add(sliceItem);
            }
            if ("slice".equals(sliceItem.mFormat) || "action".equals(sliceItem.mFormat)) {
                Collections.addAll(queue, sliceItem.getSlice().mItems);
            }
        }
    }

    public static SliceItem findSubtype(SliceItem s, final String format, final String subtype) {
        if (s == null) {
            return null;
        }
        Deque<SliceItem> queue = toQueue(s);
        while (true) {
            ArrayDeque arrayDeque = (ArrayDeque) queue;
            if (arrayDeque.isEmpty()) {
                return null;
            }
            SliceItem sliceItem = (SliceItem) arrayDeque.poll();
            if (checkFormat(sliceItem, format) && checkSubtype(sliceItem, subtype)) {
                return sliceItem;
            }
            if ("slice".equals(sliceItem.mFormat) || "action".equals(sliceItem.mFormat)) {
                Collections.addAll(queue, sliceItem.getSlice().mItems);
            }
        }
    }

    public static SliceItem findTopLevelItem(Slice s, final String format, final String subtype, final String[] hints, final String[] nonHints) {
        SliceItem[] sliceItemArr;
        for (SliceItem sliceItem : s.mItems) {
            if (checkFormat(sliceItem, format) && checkSubtype(sliceItem, subtype) && hasHints(sliceItem, hints) && !hasAnyHints(sliceItem, null)) {
                return sliceItem;
            }
        }
        return null;
    }

    public static boolean hasAnyHints(SliceItem item, String... hints) {
        if (hints == null) {
            return false;
        }
        for (String str : hints) {
            if (item.hasHint(str)) {
                return true;
            }
        }
        return false;
    }

    public static boolean hasHints(SliceItem item, String... hints) {
        if (hints == null) {
            return true;
        }
        for (String str : hints) {
            if (!(TextUtils.isEmpty(str) || item.hasHint(str))) {
                return false;
            }
        }
        return true;
    }

    public static Deque<SliceItem> toQueue(SliceItem item) {
        ArrayDeque arrayDeque = new ArrayDeque();
        arrayDeque.add(item);
        return arrayDeque;
    }

    public static SliceItem find(SliceItem s, String format) {
        return find(s, format, (String[]) null, (String[]) null);
    }

    public static SliceItem find(SliceItem s, String format, String hints, String nonHints) {
        return find(s, format, new String[]{hints}, new String[]{null});
    }

    public static SliceItem find(SliceItem s, final String format, final String[] hints, final String[] nonHints) {
        if (s == null) {
            return null;
        }
        Deque<SliceItem> queue = toQueue(s);
        while (!queue.isEmpty()) {
            SliceItem poll = queue.poll();
            if (checkFormat(poll, format) && hasHints(poll, hints) && !hasAnyHints(poll, nonHints)) {
                return poll;
            }
            if ("slice".equals(poll.mFormat) || "action".equals(poll.mFormat)) {
                Collections.addAll(queue, poll.getSlice().mItems);
            }
        }
        return null;
    }

    public static SliceItem findSubtype(Slice s, final String format, final String subtype) {
        if (s == null) {
            return null;
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        Collections.addAll(arrayDeque, s.mItems);
        while (!arrayDeque.isEmpty()) {
            SliceItem sliceItem = (SliceItem) arrayDeque.poll();
            if (checkFormat(sliceItem, format) && checkSubtype(sliceItem, subtype)) {
                return sliceItem;
            }
            if ("slice".equals(sliceItem.mFormat) || "action".equals(sliceItem.mFormat)) {
                Collections.addAll(arrayDeque, sliceItem.getSlice().mItems);
            }
        }
        return null;
    }

    public static SliceItem find(Slice s, final String format, final String[] hints, final String[] nonHints) {
        if (s == null) {
            return null;
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        Collections.addAll(arrayDeque, s.mItems);
        while (!arrayDeque.isEmpty()) {
            SliceItem sliceItem = (SliceItem) arrayDeque.poll();
            if (checkFormat(sliceItem, format) && hasHints(sliceItem, hints) && !hasAnyHints(sliceItem, nonHints)) {
                return sliceItem;
            }
            if ("slice".equals(sliceItem.mFormat) || "action".equals(sliceItem.mFormat)) {
                Collections.addAll(arrayDeque, sliceItem.getSlice().mItems);
            }
        }
        return null;
    }
}
