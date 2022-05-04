package androidx.slice.widget;

import androidx.slice.Slice;
import androidx.slice.SliceItem;
import androidx.slice.core.SliceQuery;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public class SliceContent {
    public SliceItem mColorItem;
    public SliceItem mContentDescr;
    public SliceItem mLayoutDirItem;
    public int mRowIndex;
    public SliceItem mSliceItem;

    public SliceContent(Slice slice) {
        if (slice != null) {
            List asList = Arrays.asList(slice.mHints);
            init(new SliceItem(slice, "slice", null, (String[]) asList.toArray(new String[asList.size()])));
            this.mRowIndex = -1;
        }
    }

    public int getHeight(SliceStyle style, SliceViewPolicy policy) {
        return 0;
    }

    public int getLayoutDir() {
        SliceItem sliceItem = this.mLayoutDirItem;
        if (sliceItem == null) {
            return -1;
        }
        int i = sliceItem.getInt();
        if (i == 2 || i == 3 || i == 1 || i == 0) {
            return i;
        }
        return -1;
    }

    public final void init(SliceItem item) {
        this.mSliceItem = item;
        if ("slice".equals(item.mFormat) || "action".equals(item.mFormat)) {
            this.mColorItem = SliceQuery.findTopLevelItem(item.getSlice(), "int", "color", null, null);
            this.mLayoutDirItem = SliceQuery.findTopLevelItem(item.getSlice(), "int", "layout_direction", null, null);
        }
        this.mContentDescr = SliceQuery.findSubtype(item, "text", "content_description");
    }

    public boolean isValid() {
        return this.mSliceItem != null;
    }

    public SliceContent(SliceItem item, int rowIndex) {
        if (item != null) {
            init(item);
            this.mRowIndex = rowIndex;
        }
    }
}
