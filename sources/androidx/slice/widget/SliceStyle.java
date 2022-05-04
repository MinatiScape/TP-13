package androidx.slice.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.SparseArray;
import androidx.slice.SliceItem;
import androidx.slice.view.R$styleable;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class SliceStyle {
    public final Context mContext;
    public final int mDefaultRowStyleRes;
    public final boolean mExpandToAvailableHeight;
    public final int mGridAllImagesHeight;
    public final int mGridBigPicMaxHeight;
    public final int mGridBigPicMinHeight;
    public final int mGridBottomPadding;
    public final int mGridImageTextHeight;
    public final int mGridMaxHeight;
    public final int mGridMinHeight;
    public final int mGridRawImageTextHeight;
    public final int mGridSubtitleSize;
    public final int mGridTitleSize;
    public final int mGridTopPadding;
    public final int mHeaderSubtitleSize;
    public final int mHeaderTitleSize;
    public final boolean mHideHeaderRow;
    public final float mImageCornerRadius;
    public final int mListLargeHeight;
    public final int mListMinScrollHeight;
    public final SparseArray<RowStyle> mResourceToRowStyle = new SparseArray<>();
    public final int mRowInlineRangeHeight;
    public final int mRowMaxHeight;
    public final int mRowMinHeight;
    public final int mRowRangeHeight;
    public final int mRowSelectionHeight;
    public final int mRowSingleTextWithRangeHeight;
    public final int mRowSingleTextWithSelectionHeight;
    public final int mRowTextWithRangeHeight;
    public final int mRowTextWithSelectionHeight;
    public final int mSubtitleColor;
    public final int mSubtitleSize;
    public int mTintColor;
    public final int mTitleColor;
    public final int mTitleSize;
    public final int mVerticalGridTextPadding;
    public final int mVerticalHeaderTextPadding;
    public final int mVerticalTextPadding;

    /* JADX WARN: Finally extract failed */
    public SliceStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mTintColor = -1;
        TypedArray obtainStyledAttributes = context.getTheme().obtainStyledAttributes(attrs, R$styleable.SliceView, defStyleAttr, defStyleRes);
        try {
            int color = obtainStyledAttributes.getColor(20, -1);
            if (color == -1) {
                color = this.mTintColor;
            }
            this.mTintColor = color;
            this.mTitleColor = obtainStyledAttributes.getColor(21, 0);
            this.mSubtitleColor = obtainStyledAttributes.getColor(17, 0);
            this.mHeaderTitleSize = (int) obtainStyledAttributes.getDimension(8, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mHeaderSubtitleSize = (int) obtainStyledAttributes.getDimension(6, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mVerticalHeaderTextPadding = (int) obtainStyledAttributes.getDimension(7, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mTitleSize = (int) obtainStyledAttributes.getDimension(22, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mSubtitleSize = (int) obtainStyledAttributes.getDimension(18, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mVerticalTextPadding = (int) obtainStyledAttributes.getDimension(19, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mGridTitleSize = (int) obtainStyledAttributes.getDimension(4, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mGridSubtitleSize = (int) obtainStyledAttributes.getDimension(2, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mVerticalGridTextPadding = (int) obtainStyledAttributes.getDimension(3, context.getResources().getDimensionPixelSize(R.dimen.abc_slice_grid_text_inner_padding));
            this.mGridTopPadding = (int) obtainStyledAttributes.getDimension(5, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mGridBottomPadding = (int) obtainStyledAttributes.getDimension(1, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            this.mDefaultRowStyleRes = obtainStyledAttributes.getResourceId(16, 0);
            this.mRowMinHeight = (int) obtainStyledAttributes.getDimension(13, context.getResources().getDimensionPixelSize(R.dimen.abc_slice_row_min_height));
            this.mRowMaxHeight = (int) obtainStyledAttributes.getDimension(12, context.getResources().getDimensionPixelSize(R.dimen.abc_slice_row_max_height));
            this.mRowRangeHeight = (int) obtainStyledAttributes.getDimension(14, context.getResources().getDimensionPixelSize(R.dimen.abc_slice_row_range_height));
            this.mRowSingleTextWithRangeHeight = (int) obtainStyledAttributes.getDimension(15, context.getResources().getDimensionPixelSize(R.dimen.abc_slice_row_range_single_text_height));
            this.mRowInlineRangeHeight = (int) obtainStyledAttributes.getDimension(11, context.getResources().getDimensionPixelSize(R.dimen.abc_slice_row_range_inline_height));
            this.mExpandToAvailableHeight = obtainStyledAttributes.getBoolean(0, false);
            this.mHideHeaderRow = obtainStyledAttributes.getBoolean(9, false);
            this.mContext = context;
            this.mImageCornerRadius = obtainStyledAttributes.getDimension(10, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            obtainStyledAttributes.recycle();
            Resources resources = context.getResources();
            this.mRowTextWithRangeHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_row_range_multi_text_height);
            this.mRowSelectionHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_row_selection_height);
            this.mRowTextWithSelectionHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_row_selection_multi_text_height);
            this.mRowSingleTextWithSelectionHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_row_selection_single_text_height);
            this.mGridBigPicMinHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_big_pic_min_height);
            this.mGridBigPicMaxHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_big_pic_max_height);
            this.mGridAllImagesHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_grid_image_only_height);
            this.mGridImageTextHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_grid_image_text_height);
            this.mGridRawImageTextHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_grid_raw_image_text_offset);
            this.mGridMinHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_grid_min_height);
            this.mGridMaxHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_grid_max_height);
            this.mListMinScrollHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_row_min_height);
            this.mListLargeHeight = resources.getDimensionPixelSize(R.dimen.abc_slice_large_height);
        } catch (Throwable th) {
            obtainStyledAttributes.recycle();
            throw th;
        }
    }

    public DisplayedListItems getListItemsForNonScrollingList(ListContent list, int availableHeight, SliceViewPolicy policy) {
        int i;
        ArrayList arrayList = new ArrayList();
        ArrayList<SliceContent> arrayList2 = list.mRowItems;
        if (arrayList2 == null || arrayList2.size() == 0) {
            return new DisplayedListItems(arrayList, 0);
        }
        boolean shouldSkipFirstListItem = shouldSkipFirstListItem(list.mRowItems);
        int size = list.mRowItems.size();
        int i2 = 0;
        int i3 = 0;
        while (true) {
            if (i2 >= size) {
                i = 0;
                break;
            }
            SliceContent sliceContent = list.mRowItems.get(i2);
            if (i2 != 0 || !shouldSkipFirstListItem) {
                int height = sliceContent.getHeight(this, policy);
                if (availableHeight > 0 && i3 + height > availableHeight) {
                    i = size - i2;
                    break;
                }
                i3 += height;
                arrayList.add(sliceContent);
            }
            i2++;
        }
        int i4 = shouldSkipFirstListItem ? 1 : 2;
        if (list.mSeeMoreContent != null && arrayList.size() >= i4 && i > 0) {
            int height2 = list.mSeeMoreContent.getHeight(this, policy) + i3;
            while (height2 > availableHeight && arrayList.size() >= i4) {
                int size2 = arrayList.size() - 1;
                height2 -= ((SliceContent) arrayList.get(size2)).getHeight(this, policy);
                arrayList.remove(size2);
                i++;
            }
            if (arrayList.size() >= i4) {
                arrayList.add(list.mSeeMoreContent);
            }
        }
        if (arrayList.size() == 0) {
            arrayList.add(list.mRowItems.get(0));
        }
        return new DisplayedListItems(arrayList, i);
    }

    public int getListItemsHeight(List<SliceContent> listItems, SliceViewPolicy policy) {
        if (listItems == null) {
            return 0;
        }
        int i = 0;
        for (int i2 = 0; i2 < listItems.size(); i2++) {
            SliceContent sliceContent = listItems.get(i2);
            if (i2 != 0 || !shouldSkipFirstListItem(listItems)) {
                i = sliceContent.getHeight(this, policy) + i;
            }
        }
        return i;
    }

    public RowStyle getRowStyle(SliceItem sliceItem) {
        int i = this.mDefaultRowStyleRes;
        if (i == 0) {
            return new RowStyle(this.mContext, this);
        }
        RowStyle rowStyle = this.mResourceToRowStyle.get(i);
        if (rowStyle != null) {
            return rowStyle;
        }
        RowStyle rowStyle2 = new RowStyle(this.mContext, i, this);
        this.mResourceToRowStyle.put(i, rowStyle2);
        return rowStyle2;
    }

    public final boolean shouldSkipFirstListItem(List<SliceContent> rowItems) {
        return this.mHideHeaderRow && rowItems.size() > 1 && (rowItems.get(0) instanceof RowContent) && ((RowContent) rowItems.get(0)).mIsHeader;
    }
}
