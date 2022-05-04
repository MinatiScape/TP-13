package androidx.slice.widget;

import android.content.Context;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import androidx.core.graphics.drawable.IconCompat;
import androidx.slice.ArrayUtils;
import androidx.slice.SliceItem;
import androidx.slice.core.SliceActionImpl;
import androidx.slice.core.SliceQuery;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class GridContent extends SliceContent {
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

        /* JADX WARN: Removed duplicated region for block: B:52:0x00f3  */
        /* JADX WARN: Removed duplicated region for block: B:64:0x0112  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public CellContent(androidx.slice.SliceItem r17) {
            /*
                Method dump skipped, instructions count: 446
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.slice.widget.GridContent.CellContent.<init>(androidx.slice.SliceItem):void");
        }

        public final void fillCellItems(List<SliceItem> items) {
            for (int i = 0; i < items.size(); i++) {
                SliceItem sliceItem = items.get(i);
                String str = sliceItem.mFormat;
                if (this.mPicker == null && ("date_picker".equals(sliceItem.mSubType) || "time_picker".equals(sliceItem.mSubType))) {
                    this.mPicker = sliceItem;
                } else if ("content_description".equals(sliceItem.mSubType)) {
                    this.mContentDescr = sliceItem;
                } else if (this.mTextCount < 2 && ("text".equals(str) || "long".equals(str))) {
                    SliceItem sliceItem2 = this.mTitleItem;
                    if (sliceItem2 == null || (!ArrayUtils.contains(sliceItem2.mHints, "title") && ArrayUtils.contains(sliceItem.mHints, "title"))) {
                        this.mTitleItem = sliceItem;
                    }
                    if (!ArrayUtils.contains(sliceItem.mHints, "overlay")) {
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

        public boolean isValid() {
            return this.mPicker != null || (this.mCellItems.size() > 0 && this.mCellItems.size() <= 3);
        }
    }

    public GridContent(SliceItem gridItem, int position) {
        super(gridItem, position);
        List<SliceItem> items;
        SliceItem find = SliceQuery.find(gridItem, (String) null, "see_more", (String) null);
        this.mSeeMoreItem = find;
        if (find != null && "slice".equals(find.mFormat) && (items = this.mSeeMoreItem.getSlice().getItems()) != null && items.size() > 0) {
            this.mSeeMoreItem = items.get(0);
        }
        this.mPrimaryAction = SliceQuery.find(gridItem, "slice", new String[]{"shortcut", "title"}, new String[]{"actions"});
        this.mAllImages = true;
        if ("slice".equals(gridItem.mFormat)) {
            List<SliceItem> items2 = gridItem.getSlice().getItems();
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < items2.size(); i++) {
                SliceItem sliceItem = items2.get(i);
                boolean z = (SliceQuery.find(sliceItem, (String) null, "see_more", (String) null) != null) || sliceItem.hasAnyHints("shortcut", "see_more", "keywords", "ttl", "last_updated", "overlay");
                if ("content_description".equals(sliceItem.mSubType)) {
                    this.mContentDescr = sliceItem;
                } else if (!z) {
                    arrayList.add(sliceItem);
                }
            }
            for (int i2 = 0; i2 < arrayList.size(); i2++) {
                SliceItem sliceItem2 = (SliceItem) arrayList.get(i2);
                if (!"content_description".equals(sliceItem2.mSubType)) {
                    processContent(new CellContent(sliceItem2));
                }
            }
        } else {
            processContent(new CellContent(gridItem));
        }
        isValid();
    }

    public Point getFirstImageSize(Context context) {
        IconCompat iconCompat = this.mFirstImage;
        if (iconCompat == null) {
            return new Point(-1, -1);
        }
        if (this.mFirstImageSize == null) {
            iconCompat.checkResource(context);
            Drawable loadDrawable = iconCompat.toIcon(context).loadDrawable(context);
            this.mFirstImageSize = new Point(loadDrawable.getIntrinsicWidth(), loadDrawable.getIntrinsicHeight());
        }
        return this.mFirstImageSize;
    }

    @Override // androidx.slice.widget.SliceContent
    public int getHeight(SliceStyle style, SliceViewPolicy policy) {
        int i;
        Objects.requireNonNull(style);
        int i2 = 0;
        int i3 = 1;
        boolean z = policy.mMode == 1;
        if (!isValid()) {
            return 0;
        }
        int i4 = this.mLargestImageMode;
        if (!this.mAllImages) {
            boolean z2 = this.mMaxCellLineCount > 1;
            boolean z3 = this.mFirstImage != null;
            boolean z4 = i4 == 0 || i4 == 5;
            if (i4 == 4) {
                int i5 = getFirstImageSize(style.mContext).y;
                if (z2) {
                    i3 = 2;
                }
                i = i5 + (i3 * style.mGridRawImageTextHeight);
            } else if (!z2 || z) {
                if (z4) {
                    i = style.mGridMinHeight;
                } else {
                    i = style.mGridImageTextHeight;
                }
            } else if (z3) {
                i = style.mGridMaxHeight;
            } else {
                i = style.mGridMinHeight;
            }
        } else if (this.mGridContent.size() == 1) {
            if (z) {
                i = style.mGridBigPicMinHeight;
            } else {
                i = style.mGridBigPicMaxHeight;
            }
        } else if (i4 == 0) {
            i = style.mGridMinHeight;
        } else if (i4 == 4) {
            i = getFirstImageSize(style.mContext).y;
        } else {
            i = style.mGridAllImagesHeight;
        }
        boolean z5 = this.mAllImages;
        int i6 = (!z5 || this.mRowIndex != 0) ? 0 : style.mGridTopPadding;
        if (z5 && this.mIsLastIndex) {
            i2 = style.mGridBottomPadding;
        }
        return i2 + i + i6;
    }

    @Override // androidx.slice.widget.SliceContent
    public boolean isValid() {
        return super.isValid() && this.mGridContent.size() > 0;
    }

    public final void processContent(CellContent cc) {
        int i;
        SliceItem sliceItem;
        if (cc.isValid()) {
            if (this.mTitleItem == null && (sliceItem = cc.mTitleItem) != null) {
                this.mTitleItem = sliceItem;
            }
            this.mGridContent.add(cc);
            boolean z = true;
            if (!(cc.mCellItems.size() == 1 && "image".equals(cc.mCellItems.get(0).mFormat))) {
                this.mAllImages = false;
            }
            this.mMaxCellLineCount = Math.max(this.mMaxCellLineCount, cc.mTextCount);
            if (this.mFirstImage == null) {
                IconCompat iconCompat = cc.mImage;
                if (iconCompat == null) {
                    z = false;
                }
                if (z) {
                    this.mFirstImage = iconCompat;
                }
            }
            int i2 = this.mLargestImageMode;
            if (i2 == 5) {
                i = cc.mImageMode;
            } else {
                i = Math.max(i2, cc.mImageMode);
            }
            this.mLargestImageMode = i;
        }
    }
}
