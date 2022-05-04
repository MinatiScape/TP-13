package androidx.slice;

import com.android.systemui.shared.R;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.CategoryReceiver;
/* loaded from: classes.dex */
public final class SliceSpecs implements CategoryReceiver {
    public static final SliceSpec BASIC = new SliceSpec("androidx.slice.BASIC", 1);
    public static final SliceSpec LIST = new SliceSpec("androidx.slice.LIST", 1);
    public static final SliceSpec LIST_V2 = new SliceSpec("androidx.slice.LIST", 2);
    public static final int[] PreviewPager = {R.attr.card_style};

    @Override // com.android.wallpaper.model.CategoryReceiver
    public void doneFetchingCategories() {
    }

    @Override // com.android.wallpaper.model.CategoryReceiver
    public void onCategoryReceived(Category category) {
    }
}
