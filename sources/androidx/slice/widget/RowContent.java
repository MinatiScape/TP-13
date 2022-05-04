package androidx.slice.widget;

import android.text.TextUtils;
import android.util.Log;
import androidx.core.R$attr;
import androidx.slice.SliceItem;
import androidx.slice.core.SliceAction;
import androidx.slice.core.SliceActionImpl;
import androidx.slice.core.SliceQuery;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class RowContent extends SliceContent {
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

    public static boolean isValidRow(SliceItem sliceItem) {
        if (sliceItem == null) {
            return false;
        }
        if ("slice".equals(sliceItem.mFormat) || "action".equals(sliceItem.mFormat)) {
            List<SliceItem> items = sliceItem.getSlice().getItems();
            if (sliceItem.hasHint("see_more") && items.isEmpty()) {
                return true;
            }
            for (int i = 0; i < items.size(); i++) {
                if (isValidRowContent(sliceItem, items.get(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    public static ArrayList<SliceItem> filterInvalidItems(SliceItem sliceItem) {
        ArrayList<SliceItem> arrayList = new ArrayList<>();
        for (SliceItem sliceItem2 : sliceItem.getSlice().getItems()) {
            if (isValidRowContent(sliceItem, sliceItem2)) {
                arrayList.add(sliceItem2);
            }
        }
        return arrayList;
    }

    public static boolean isValidRowContent(SliceItem sliceItem, SliceItem sliceItem2) {
        if (sliceItem2.hasAnyHints("keywords", "ttl", "last_updated", "horizontal") || "content_description".equals(sliceItem2.mSubType) || "selection_option_key".equals(sliceItem2.mSubType) || "selection_option_value".equals(sliceItem2.mSubType)) {
            return false;
        }
        String str = sliceItem2.mFormat;
        if ("image".equals(str) || "text".equals(str) || "long".equals(str) || "action".equals(str) || "input".equals(str) || "slice".equals(str) || ("int".equals(str) && "range".equals(sliceItem.mSubType))) {
            return true;
        }
        return false;
    }

    public final SliceItem getInputRangeThumb() {
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

    public final boolean isDefaultSeeMore() {
        if (!"action".equals(this.mSliceItem.mFormat) || !R$attr.contains(this.mSliceItem.getSlice().mHints, "see_more") || !this.mSliceItem.getSlice().getItems().isEmpty()) {
            return false;
        }
        return true;
    }

    public final boolean isValid() {
        boolean z;
        if (this.mSliceItem != null) {
            z = true;
        } else {
            z = false;
        }
        if (!z || (this.mStartItem == null && this.mPrimaryAction == null && this.mTitleItem == null && this.mSubtitleItem == null && this.mEndItems.size() <= 0 && this.mRange == null && this.mSelection == null && !isDefaultSeeMore())) {
            return false;
        }
        return true;
    }

    public RowContent(SliceItem sliceItem, int i) {
        super(sliceItem, i);
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6;
        if (i == 0) {
            z = true;
        } else {
            z = false;
        }
        if (sliceItem.hasHint("end_of_section")) {
            this.mShowBottomDivider = true;
        }
        this.mIsHeader = z;
        if (!isValidRow(sliceItem)) {
            Log.w("RowContent", "Provided SliceItem is invalid for RowContent");
            return;
        }
        ArrayList findAll = SliceQuery.findAll(sliceItem, null, new String[]{"title"}, new String[]{null});
        if (findAll.size() > 0) {
            String str = ((SliceItem) findAll.get(0)).mFormat;
            if (("action".equals(str) && SliceQuery.find((SliceItem) findAll.get(0), "image", (String[]) null, (String[]) null) != null) || "slice".equals(str) || "long".equals(str) || "image".equals(str)) {
                this.mStartItem = (SliceItem) findAll.get(0);
            }
        }
        String[] strArr = {"shortcut", "title"};
        ArrayList findAll2 = SliceQuery.findAll(sliceItem, "slice", strArr, null);
        findAll2.addAll(SliceQuery.findAll(sliceItem, "action", strArr, null));
        if (findAll2.isEmpty() && "action".equals(sliceItem.mFormat) && sliceItem.getSlice().getItems().size() == 1) {
            this.mPrimaryAction = sliceItem;
        } else if (this.mStartItem != null && findAll2.size() > 1 && findAll2.get(0) == this.mStartItem) {
            this.mPrimaryAction = (SliceItem) findAll2.get(1);
        } else if (findAll2.size() > 0) {
            this.mPrimaryAction = (SliceItem) findAll2.get(0);
        }
        ArrayList<SliceItem> filterInvalidItems = filterInvalidItems(sliceItem);
        if (filterInvalidItems.size() != 1 || ((!"action".equals(filterInvalidItems.get(0).mFormat) && !"slice".equals(filterInvalidItems.get(0).mFormat)) || filterInvalidItems.get(0).hasAnyHints("shortcut", "title") || !isValidRow(filterInvalidItems.get(0)))) {
            z2 = false;
        } else {
            sliceItem = filterInvalidItems.get(0);
            filterInvalidItems = filterInvalidItems(sliceItem);
            z2 = true;
        }
        if ("range".equals(sliceItem.mSubType)) {
            if (SliceQuery.findSubtype(sliceItem, "action", "range") == null || z2) {
                this.mRange = sliceItem;
            } else {
                filterInvalidItems.remove(this.mStartItem);
                if (filterInvalidItems.size() != 1) {
                    SliceItem findSubtype = SliceQuery.findSubtype(sliceItem, "action", "range");
                    this.mRange = findSubtype;
                    ArrayList<SliceItem> filterInvalidItems2 = filterInvalidItems(findSubtype);
                    filterInvalidItems2.remove(getInputRangeThumb());
                    filterInvalidItems.remove(this.mRange);
                    filterInvalidItems.addAll(filterInvalidItems2);
                } else if (isValidRow(filterInvalidItems.get(0))) {
                    sliceItem = filterInvalidItems.get(0);
                    filterInvalidItems = filterInvalidItems(sliceItem);
                    this.mRange = sliceItem;
                    filterInvalidItems.remove(getInputRangeThumb());
                }
            }
        }
        if ("selection".equals(sliceItem.mSubType)) {
            this.mSelection = sliceItem;
        }
        if (filterInvalidItems.size() > 0) {
            SliceItem sliceItem2 = this.mStartItem;
            if (sliceItem2 != null) {
                filterInvalidItems.remove(sliceItem2);
            }
            SliceItem sliceItem3 = this.mPrimaryAction;
            if (sliceItem3 != null) {
                filterInvalidItems.remove(sliceItem3);
            }
            ArrayList arrayList = new ArrayList();
            for (int i2 = 0; i2 < filterInvalidItems.size(); i2++) {
                SliceItem sliceItem4 = filterInvalidItems.get(i2);
                if ("text".equals(sliceItem4.mFormat)) {
                    SliceItem sliceItem5 = this.mTitleItem;
                    if ((sliceItem5 == null || !sliceItem5.hasHint("title")) && sliceItem4.hasHint("title") && !sliceItem4.hasHint("summary")) {
                        this.mTitleItem = sliceItem4;
                    } else if (this.mSubtitleItem == null && !sliceItem4.hasHint("summary")) {
                        this.mSubtitleItem = sliceItem4;
                    } else if (this.mSummaryItem == null && sliceItem4.hasHint("summary")) {
                        this.mSummaryItem = sliceItem4;
                    }
                } else {
                    arrayList.add(sliceItem4);
                }
            }
            SliceItem sliceItem6 = this.mTitleItem;
            if (sliceItem6 == null || (!sliceItem6.hasHint("partial") && TextUtils.isEmpty((CharSequence) sliceItem6.mObj))) {
                z3 = false;
            } else {
                z3 = true;
            }
            if (z3) {
                this.mLineCount++;
            }
            SliceItem sliceItem7 = this.mSubtitleItem;
            if (sliceItem7 == null || (!sliceItem7.hasHint("partial") && TextUtils.isEmpty((CharSequence) sliceItem7.mObj))) {
                z4 = false;
            } else {
                z4 = true;
            }
            if (z4) {
                this.mLineCount++;
            }
            SliceItem sliceItem8 = this.mStartItem;
            if (sliceItem8 == null || !"long".equals(sliceItem8.mFormat)) {
                z5 = false;
            } else {
                z5 = true;
            }
            for (int i3 = 0; i3 < arrayList.size(); i3++) {
                SliceItem sliceItem9 = (SliceItem) arrayList.get(i3);
                if (SliceQuery.find(sliceItem9, "action", (String[]) null, (String[]) null) != null) {
                    z6 = true;
                } else {
                    z6 = false;
                }
                if (!"long".equals(sliceItem9.mFormat)) {
                    if (z6) {
                        SliceActionImpl sliceActionImpl = new SliceActionImpl(sliceItem9);
                        if (sliceActionImpl.isToggle()) {
                            this.mToggleItems.add(sliceActionImpl);
                        }
                    }
                    this.mEndItems.add(sliceItem9);
                } else if (!z5) {
                    this.mEndItems.add(sliceItem9);
                    z5 = true;
                }
            }
        }
        isValid();
    }

    @Override // androidx.slice.widget.SliceContent
    public final int getHeight(SliceStyle sliceStyle, SliceViewPolicy sliceViewPolicy) {
        int i;
        int i2;
        SliceItem sliceItem;
        sliceStyle.getClass();
        int i3 = sliceViewPolicy.mMaxSmallHeight;
        if (i3 <= 0) {
            i3 = sliceStyle.mRowMaxHeight;
        }
        SliceItem sliceItem2 = this.mRange;
        if (sliceItem2 == null && this.mSelection == null && sliceViewPolicy.mMode != 2) {
            return i3;
        }
        if (sliceItem2 != null) {
            if (!this.mIsHeader || this.mShowTitleItems) {
                sliceItem = this.mStartItem;
            } else {
                sliceItem = null;
            }
            if (sliceItem != null) {
                return sliceStyle.mRowInlineRangeHeight;
            }
            int i4 = this.mLineCount;
            if (i4 == 0) {
                i2 = 0;
            } else if (i4 > 1) {
                i2 = sliceStyle.mRowTextWithRangeHeight;
            } else {
                i2 = sliceStyle.mRowSingleTextWithRangeHeight;
            }
            i = sliceStyle.mRowRangeHeight;
        } else if (this.mSelection != null) {
            if (this.mLineCount > 1) {
                i2 = sliceStyle.mRowTextWithSelectionHeight;
            } else {
                i2 = sliceStyle.mRowSingleTextWithSelectionHeight;
            }
            i = sliceStyle.mRowSelectionHeight;
        } else if (this.mLineCount > 1 || this.mIsHeader) {
            return i3;
        } else {
            return sliceStyle.mRowMinHeight;
        }
        return i2 + i;
    }
}
