package com.android.wallpaper.widget;

import android.view.View;
import android.view.WindowInsets;
import com.android.wallpaper.picker.individual.IndividualPickerFragment;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class BottomActionBar$$ExternalSyntheticLambda0 implements View.OnApplyWindowInsetsListener {
    public final /* synthetic */ int $r8$classId;
    public static final /* synthetic */ BottomActionBar$$ExternalSyntheticLambda0 INSTANCE$1 = new BottomActionBar$$ExternalSyntheticLambda0(1);
    public static final /* synthetic */ BottomActionBar$$ExternalSyntheticLambda0 INSTANCE = new BottomActionBar$$ExternalSyntheticLambda0(0);

    public /* synthetic */ BottomActionBar$$ExternalSyntheticLambda0(int i) {
        this.$r8$classId = i;
    }

    @Override // android.view.View.OnApplyWindowInsetsListener
    public final WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
        switch (this.$r8$classId) {
            case 0:
                int i = BottomActionBar.$r8$clinit;
                view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), windowInsets.getSystemWindowInsetBottom());
                return windowInsets;
            default:
                int i2 = IndividualPickerFragment.$r8$clinit;
                view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), windowInsets.getSystemWindowInsetBottom());
                return windowInsets.consumeSystemWindowInsets();
        }
    }
}
