package androidx.slice.widget;

import android.text.TextUtils;
import android.util.Log;
import androidx.slice.ArrayUtils;
import androidx.slice.SliceItem;
import androidx.slice.core.SliceAction;
import androidx.slice.core.SliceActionImpl;
import androidx.slice.core.SliceQuery;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class RowContent extends SliceContent {
    public boolean mIsHeader;
    public SliceItem mPrimaryAction;
    public SliceItem mRange;
    public SliceItem mSelection;
    public boolean mShowActionDivider;
    public boolean mShowBottomDivider;
    public boolean mShowTitleItems;
    public SliceItem mStartItem;
    public SliceItem mSubtitleItem;
    public SliceItem mSummaryItem;
    public SliceItem mTitleItem;
    public final ArrayList<SliceItem> mEndItems = new ArrayList<>();
    public final ArrayList<SliceAction> mToggleItems = new ArrayList<>();
    public int mLineCount = 0;

    public RowContent(SliceItem rowSlice, int position) {
        super(rowSlice, position);
        boolean z;
        boolean z2 = position == 0;
        if (ArrayUtils.contains(rowSlice.mHints, "end_of_section")) {
            this.mShowBottomDivider = true;
        }
        this.mIsHeader = z2;
        if (!isValidRow(rowSlice)) {
            Log.w("RowContent", "Provided SliceItem is invalid for RowContent");
            return;
        }
        ArrayList arrayList = (ArrayList) SliceQuery.findAll(rowSlice, null, new String[]{"title"}, new String[]{null});
        if (arrayList.size() > 0) {
            String str = ((SliceItem) arrayList.get(0)).mFormat;
            if (("action".equals(str) && SliceQuery.find((SliceItem) arrayList.get(0), "image") != null) || "slice".equals(str) || "long".equals(str) || "image".equals(str)) {
                this.mStartItem = (SliceItem) arrayList.get(0);
            }
        }
        String[] strArr = {"shortcut", "title"};
        ArrayList arrayList2 = (ArrayList) SliceQuery.findAll(rowSlice, "slice", strArr, null);
        arrayList2.addAll(SliceQuery.findAll(rowSlice, "action", strArr, null));
        if (arrayList2.isEmpty() && "action".equals(rowSlice.mFormat) && rowSlice.getSlice().getItems().size() == 1) {
            this.mPrimaryAction = rowSlice;
        } else if (this.mStartItem != null && arrayList2.size() > 1 && arrayList2.get(0) == this.mStartItem) {
            this.mPrimaryAction = (SliceItem) arrayList2.get(1);
        } else if (arrayList2.size() > 0) {
            this.mPrimaryAction = (SliceItem) arrayList2.get(0);
        }
        ArrayList<SliceItem> filterInvalidItems = filterInvalidItems(rowSlice);
        if (filterInvalidItems.size() != 1 || ((!"action".equals(filterInvalidItems.get(0).mFormat) && !"slice".equals(filterInvalidItems.get(0).mFormat)) || filterInvalidItems.get(0).hasAnyHints("shortcut", "title") || !isValidRow(filterInvalidItems.get(0)))) {
            z = false;
        } else {
            rowSlice = filterInvalidItems.get(0);
            filterInvalidItems = filterInvalidItems(rowSlice);
            z = true;
        }
        if ("range".equals(rowSlice.mSubType)) {
            if (SliceQuery.findSubtype(rowSlice, "action", "range") == null || z) {
                this.mRange = rowSlice;
            } else {
                filterInvalidItems.remove(this.mStartItem);
                if (filterInvalidItems.size() != 1) {
                    SliceItem findSubtype = SliceQuery.findSubtype(rowSlice, "action", "range");
                    this.mRange = findSubtype;
                    ArrayList<SliceItem> filterInvalidItems2 = filterInvalidItems(findSubtype);
                    filterInvalidItems2.remove(getInputRangeThumb());
                    filterInvalidItems.remove(this.mRange);
                    filterInvalidItems.addAll(filterInvalidItems2);
                } else if (isValidRow(filterInvalidItems.get(0))) {
                    rowSlice = filterInvalidItems.get(0);
                    filterInvalidItems = filterInvalidItems(rowSlice);
                    this.mRange = rowSlice;
                    filterInvalidItems.remove(getInputRangeThumb());
                }
            }
        }
        if ("selection".equals(rowSlice.mSubType)) {
            this.mSelection = rowSlice;
        }
        if (filterInvalidItems.size() > 0) {
            SliceItem sliceItem = this.mStartItem;
            if (sliceItem != null) {
                filterInvalidItems.remove(sliceItem);
            }
            SliceItem sliceItem2 = this.mPrimaryAction;
            if (sliceItem2 != null) {
                filterInvalidItems.remove(sliceItem2);
            }
            ArrayList arrayList3 = new ArrayList();
            for (int i = 0; i < filterInvalidItems.size(); i++) {
                SliceItem sliceItem3 = filterInvalidItems.get(i);
                if ("text".equals(sliceItem3.mFormat)) {
                    SliceItem sliceItem4 = this.mTitleItem;
                    if ((sliceItem4 == null || !ArrayUtils.contains(sliceItem4.mHints, "title")) && ArrayUtils.contains(sliceItem3.mHints, "title") && !ArrayUtils.contains(sliceItem3.mHints, "summary")) {
                        this.mTitleItem = sliceItem3;
                    } else if (this.mSubtitleItem == null && !ArrayUtils.contains(sliceItem3.mHints, "summary")) {
                        this.mSubtitleItem = sliceItem3;
                    } else if (this.mSummaryItem == null && ArrayUtils.contains(sliceItem3.mHints, "summary")) {
                        this.mSummaryItem = sliceItem3;
                    }
                } else {
                    arrayList3.add(sliceItem3);
                }
            }
            if (hasText(this.mTitleItem)) {
                this.mLineCount++;
            }
            if (hasText(this.mSubtitleItem)) {
                this.mLineCount++;
            }
            SliceItem sliceItem5 = this.mStartItem;
            boolean z3 = sliceItem5 != null && "long".equals(sliceItem5.mFormat);
            for (int i2 = 0; i2 < arrayList3.size(); i2++) {
                SliceItem sliceItem6 = (SliceItem) arrayList3.get(i2);
                boolean z4 = SliceQuery.find(sliceItem6, "action") != null;
                if (!"long".equals(sliceItem6.mFormat)) {
                    if (z4) {
                        SliceActionImpl sliceActionImpl = new SliceActionImpl(sliceItem6);
                        if (sliceActionImpl.isToggle()) {
                            this.mToggleItems.add(sliceActionImpl);
                        }
                    }
                    this.mEndItems.add(sliceItem6);
                } else if (!z3) {
                    this.mEndItems.add(sliceItem6);
                    z3 = true;
                }
            }
        }
        isValid();
    }

    public static ArrayList<SliceItem> filterInvalidItems(SliceItem rowSlice) {
        ArrayList<SliceItem> arrayList = new ArrayList<>();
        for (SliceItem sliceItem : rowSlice.getSlice().getItems()) {
            if (isValidRowContent(rowSlice, sliceItem)) {
                arrayList.add(sliceItem);
            }
        }
        return arrayList;
    }

    public static boolean hasText(SliceItem textSlice) {
        return textSlice != null && (ArrayUtils.contains(textSlice.mHints, "partial") || !TextUtils.isEmpty((CharSequence) textSlice.mObj));
    }

    public static boolean isValidRow(SliceItem rowSlice) {
        if (rowSlice == null) {
            return false;
        }
        if ("slice".equals(rowSlice.mFormat) || "action".equals(rowSlice.mFormat)) {
            List<SliceItem> items = rowSlice.getSlice().getItems();
            if (ArrayUtils.contains(rowSlice.mHints, "see_more") && items.isEmpty()) {
                return true;
            }
            for (int i = 0; i < items.size(); i++) {
                if (isValidRowContent(rowSlice, items.get(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean isValidRowContent(SliceItem slice, SliceItem item) {
        if (!item.hasAnyHints("keywords", "ttl", "last_updated", "horizontal") && !"content_description".equals(item.mSubType) && !"selection_option_key".equals(item.mSubType) && !"selection_option_value".equals(item.mSubType)) {
            String str = item.mFormat;
            if ("image".equals(str) || "text".equals(str) || "long".equals(str) || "action".equals(str) || "input".equals(str) || "slice".equals(str) || ("int".equals(str) && "range".equals(slice.mSubType))) {
                return true;
            }
        }
        return false;
    }

    @Override // androidx.slice.widget.SliceContent
    public int getHeight(SliceStyle style, SliceViewPolicy policy) {
        int i;
        int i2;
        Objects.requireNonNull(style);
        int i3 = policy.mMaxSmallHeight;
        if (i3 <= 0) {
            i3 = style.mRowMaxHeight;
        }
        SliceItem sliceItem = this.mRange;
        if (sliceItem == null && this.mSelection == null && policy.mMode != 2) {
            return i3;
        }
        if (sliceItem != null) {
            if (((!this.mIsHeader || this.mShowTitleItems) ? this.mStartItem : null) != null) {
                return style.mRowInlineRangeHeight;
            }
            int i4 = this.mLineCount;
            if (i4 == 0) {
                i2 = 0;
            } else if (i4 > 1) {
                i2 = style.mRowTextWithRangeHeight;
            } else {
                i2 = style.mRowSingleTextWithRangeHeight;
            }
            i = style.mRowRangeHeight;
        } else if (this.mSelection == null) {
            return (this.mLineCount > 1 || this.mIsHeader) ? i3 : style.mRowMinHeight;
        } else {
            if (this.mLineCount > 1) {
                i2 = style.mRowTextWithSelectionHeight;
            } else {
                i2 = style.mRowSingleTextWithSelectionHeight;
            }
            i = style.mRowSelectionHeight;
        }
        return i2 + i;
    }

    public SliceItem getInputRangeThumb() {
        SliceItem sliceItem = this.mRange;
        if (sliceItem == null) {
            return null;
        }
        List<SliceItem> items = sliceItem.getSlice().getItems();
        for (int i = 0; i < items.size(); i++) {
            if ("image".equals(items.get(i).mFormat)) {
                return items.get(i);
            }
        }
        return null;
    }

    public boolean isDefaultSeeMore() {
        return "action".equals(this.mSliceItem.mFormat) && ArrayUtils.contains(this.mSliceItem.getSlice().mHints, "see_more") && this.mSliceItem.getSlice().getItems().isEmpty();
    }

    @Override // androidx.slice.widget.SliceContent
    public boolean isValid() {
        return super.isValid() && !(this.mStartItem == null && this.mPrimaryAction == null && this.mTitleItem == null && this.mSubtitleItem == null && this.mEndItems.size() <= 0 && this.mRange == null && this.mSelection == null && !isDefaultSeeMore());
    }
}
