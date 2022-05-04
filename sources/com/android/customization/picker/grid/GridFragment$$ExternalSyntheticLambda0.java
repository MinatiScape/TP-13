package com.android.customization.picker.grid;

import android.view.View;
import android.view.WindowInsets;
import com.android.wallpaper.picker.CategorySelectorFragment;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class GridFragment$$ExternalSyntheticLambda0 implements View.OnApplyWindowInsetsListener {
    public static final /* synthetic */ GridFragment$$ExternalSyntheticLambda0 INSTANCE = new GridFragment$$ExternalSyntheticLambda0(0);
    public static final /* synthetic */ GridFragment$$ExternalSyntheticLambda0 INSTANCE$1 = new GridFragment$$ExternalSyntheticLambda0(1);
    public final /* synthetic */ int $r8$classId;

    public /* synthetic */ GridFragment$$ExternalSyntheticLambda0(int i) {
        this.$r8$classId = i;
    }

    @Override // android.view.View.OnApplyWindowInsetsListener
    public final WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
        switch (this.$r8$classId) {
            case 0:
                int i = GridFragment.$r8$clinit;
                view.setPadding(view.getPaddingLeft(), windowInsets.getSystemWindowInsetTop(), view.getPaddingRight(), windowInsets.getSystemWindowInsetBottom());
                return windowInsets.consumeSystemWindowInsets();
            default:
                int i2 = CategorySelectorFragment.$r8$clinit;
                view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), windowInsets.getSystemWindowInsetBottom());
                return windowInsets.consumeSystemWindowInsets();
        }
    }
}
