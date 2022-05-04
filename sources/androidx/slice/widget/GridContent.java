package androidx.slice.widget;

import android.content.Context;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import androidx.core.graphics.drawable.IconCompat;
import androidx.slice.SliceItem;
import androidx.slice.core.SliceActionImpl;
import androidx.slice.core.SliceQuery;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class GridContent extends SliceContent {
    public boolean mAllImages;
    public boolean mIsLastIndex;
    public int mMaxCellLineCount;
    public SliceItem mPrimaryAction;
    public SliceItem mSeeMoreItem;
    public SliceItem mTitleItem;
    public final ArrayList<CellContent> mGridContent = new ArrayList<>();
    public int mLargestImageMode = 5;
    public IconCompat mFirstImage = null;
    public Point mFirstImageSize = null;

    /* loaded from: classes.dex */
    public static class CellContent {
        public final ArrayList<SliceItem> mCellItems;
        public SliceItem mContentDescr;
        public SliceItem mContentIntent;
        public IconCompat mImage;
        public int mImageCount;
        public int mImageMode = -1;
        public SliceItem mOverlayItem;
        public SliceItem mPicker;
        public int mTextCount;
        public SliceItem mTitleItem;
        public SliceItem mToggleItem;

        public final void fillCellItems(List<SliceItem> list) {
            for (int i = 0; i < list.size(); i++) {
                SliceItem sliceItem = list.get(i);
                String str = sliceItem.mFormat;
                if (this.mPicker == null && ("date_picker".equals(sliceItem.mSubType) || "time_picker".equals(sliceItem.mSubType))) {
                    this.mPicker = sliceItem;
                } else if ("content_description".equals(sliceItem.mSubType)) {
                    this.mContentDescr = sliceItem;
                } else if (this.mTextCount < 2 && ("text".equals(str) || "long".equals(str))) {
                    SliceItem sliceItem2 = this.mTitleItem;
                    if (sliceItem2 == null || (!sliceItem2.hasHint("title") && sliceItem.hasHint("title"))) {
                        this.mTitleItem = sliceItem;
                    }
                    if (!sliceItem.hasHint("overlay")) {
                        this.mTextCount++;
                        this.mCellItems.add(sliceItem);
                    } else if (this.mOverlayItem == null) {
                        this.mOverlayItem = sliceItem;
                    }
                } else if (this.mImageCount < 1 && "image".equals(sliceItem.mFormat)) {
                    this.mImageMode = SliceActionImpl.parseImageMode(sliceItem);
                    this.mImageCount++;
                    this.mImage = (IconCompat) sliceItem.mObj;
                    this.mCellItems.add(sliceItem);
                }
            }
        }

        public CellContent(SliceItem sliceItem) {
            boolean z;
            ArrayList<SliceItem> arrayList = new ArrayList<>();
            this.mCellItems = arrayList;
            String str = sliceItem.mFormat;
            boolean z2 = false;
            if (sliceItem.hasHint("shortcut") || (!"slice".equals(str) && !"action".equals(str))) {
                String str2 = sliceItem.mFormat;
                if ("content_description".equals(sliceItem.mSubType) || sliceItem.hasAnyHints("keywords", "ttl", "last_updated")) {
                    z = true;
                } else {
                    z = false;
                }
                if (!z && ("text".equals(str2) || "long".equals(str2) || "image".equals(str2))) {
                    z2 = true;
                }
                if (z2) {
                    arrayList.add(sliceItem);
                }
            } else {
                List<SliceItem> items = sliceItem.getSlice().getItems();
                List<SliceItem> list = null;
                Iterator<SliceItem> it = items.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    SliceItem next = it.next();
                    if ("action".equals(next.mFormat) || "slice".equals(next.mFormat)) {
                        if (!"date_picker".equals(next.mSubType) && !"time_picker".equals(next.mSubType)) {
                            list = next.getSlice().getItems();
                            if (new SliceActionImpl(next).isToggle()) {
                                this.mToggleItem = next;
                            } else {
                                this.mContentIntent = items.get(0);
                            }
                        }
                    }
                }
                if ("action".equals(str)) {
                    this.mContentIntent = sliceItem;
                }
                this.mTextCount = 0;
                this.mImageCount = 0;
                fillCellItems(items);
                if (this.mTextCount == 0 && this.mImageCount == 0 && list != null) {
                    fillCellItems(list);
                }
            }
            if (this.mPicker == null && this.mCellItems.size() > 0) {
                this.mCellItems.size();
            }
        }
    }

    public GridContent(SliceItem sliceItem, int i) {
        super(sliceItem, i);
        boolean z;
        boolean z2;
        List<SliceItem> items;
        SliceItem find = SliceQuery.find(sliceItem, (String) null, "see_more");
        this.mSeeMoreItem = find;
        if (find != null && "slice".equals(find.mFormat) && (items = this.mSeeMoreItem.getSlice().getItems()) != null && items.size() > 0) {
            this.mSeeMoreItem = items.get(0);
        }
        this.mPrimaryAction = SliceQuery.find(sliceItem, "slice", new String[]{"shortcut", "title"}, new String[]{"actions"});
        this.mAllImages = true;
        if ("slice".equals(sliceItem.mFormat)) {
            List<SliceItem> items2 = sliceItem.getSlice().getItems();
            ArrayList arrayList = new ArrayList();
            for (int i2 = 0; i2 < items2.size(); i2++) {
                SliceItem sliceItem2 = items2.get(i2);
                if (SliceQuery.find(sliceItem2, (String) null, "see_more") != null) {
                    z = true;
                } else {
                    z = false;
                }
                if (z || sliceItem2.hasAnyHints("shortcut", "see_more", "keywords", "ttl", "last_updated", "overlay")) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                if ("content_description".equals(sliceItem2.mSubType)) {
                    this.mContentDescr = sliceItem2;
                } else if (!z2) {
                    arrayList.add(sliceItem2);
                }
            }
            for (int i3 = 0; i3 < arrayList.size(); i3++) {
                SliceItem sliceItem3 = (SliceItem) arrayList.get(i3);
                if (!"content_description".equals(sliceItem3.mSubType)) {
                    processContent(new CellContent(sliceItem3));
                }
            }
        } else {
            processContent(new CellContent(sliceItem));
        }
        isValid();
    }

    public final Point getFirstImageSize(Context context) {
        IconCompat iconCompat = this.mFirstImage;
        if (iconCompat == null) {
            return new Point(-1, -1);
        }
        if (this.mFirstImageSize == null) {
            Drawable loadDrawable = iconCompat.loadDrawable(context);
            this.mFirstImageSize = new Point(loadDrawable.getIntrinsicWidth(), loadDrawable.getIntrinsicHeight());
        }
        return this.mFirstImageSize;
    }

    public final boolean isValid() {
        boolean z;
        if (this.mSliceItem != null) {
            z = true;
        } else {
            z = false;
        }
        if (!z || this.mGridContent.size() <= 0) {
            return false;
        }
        return true;
    }

    public final void processContent(CellContent cellContent) {
        boolean z;
        boolean z2;
        int i;
        SliceItem sliceItem;
        boolean z3 = false;
        if (cellContent.mPicker != null || (cellContent.mCellItems.size() > 0 && cellContent.mCellItems.size() <= 3)) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            if (this.mTitleItem == null && (sliceItem = cellContent.mTitleItem) != null) {
                this.mTitleItem = sliceItem;
            }
            this.mGridContent.add(cellContent);
            if (cellContent.mCellItems.size() != 1 || !"image".equals(cellContent.mCellItems.get(0).mFormat)) {
                z2 = false;
            } else {
                z2 = true;
            }
            if (!z2) {
                this.mAllImages = false;
            }
            this.mMaxCellLineCount = Math.max(this.mMaxCellLineCount, cellContent.mTextCount);
            if (this.mFirstImage == null) {
                IconCompat iconCompat = cellContent.mImage;
                if (iconCompat != null) {
                    z3 = true;
                }
                if (z3) {
                    this.mFirstImage = iconCompat;
                }
            }
            int i2 = this.mLargestImageMode;
            if (i2 == 5) {
                i = cellContent.mImageMode;
            } else {
                i = Math.max(i2, cellContent.mImageMode);
            }
            this.mLargestImageMode = i;
        }
    }

    @Override // androidx.slice.widget.SliceContent
    public final int getHeight(SliceStyle sliceStyle, SliceViewPolicy sliceViewPolicy) {
        boolean z;
        int i;
        int i2;
        boolean z2;
        boolean z3;
        boolean z4;
        sliceStyle.getClass();
        int i3 = 1;
        int i4 = 0;
        if (sliceViewPolicy.mMode == 1) {
            z = true;
        } else {
            z = false;
        }
        if (!isValid()) {
            return 0;
        }
        int i5 = this.mLargestImageMode;
        if (!this.mAllImages) {
            if (this.mMaxCellLineCount > 1) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (this.mFirstImage != null) {
                z3 = true;
            } else {
                z3 = false;
            }
            if (i5 == 0 || i5 == 5) {
                z4 = true;
            } else {
                z4 = false;
            }
            if (i5 == 4) {
                int i6 = getFirstImageSize(sliceStyle.mContext).y;
                if (z2) {
                    i3 = 2;
                }
                i = i6 + (i3 * sliceStyle.mGridRawImageTextHeight);
            } else if (!z2 || z) {
                if (z4) {
                    i = sliceStyle.mGridMinHeight;
                } else {
                    i = sliceStyle.mGridImageTextHeight;
                }
            } else if (z3) {
                i = sliceStyle.mGridMaxHeight;
            } else {
                i = sliceStyle.mGridMinHeight;
            }
        } else if (this.mGridContent.size() == 1) {
            if (z) {
                i = sliceStyle.mGridBigPicMinHeight;
            } else {
                i = sliceStyle.mGridBigPicMaxHeight;
            }
        } else if (i5 == 0) {
            i = sliceStyle.mGridMinHeight;
        } else if (i5 == 4) {
            i = getFirstImageSize(sliceStyle.mContext).y;
        } else {
            i = sliceStyle.mGridAllImagesHeight;
        }
        boolean z5 = this.mAllImages;
        if (!z5 || this.mRowIndex != 0) {
            i2 = 0;
        } else {
            i2 = sliceStyle.mGridTopPadding;
        }
        if (z5 && this.mIsLastIndex) {
            i4 = sliceStyle.mGridBottomPadding;
        }
        return i4 + i + i2;
    }
}
