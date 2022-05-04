package com.android.wallpaper.widget;

import com.android.wallpaper.widget.BottomActionBar;
import java.util.function.BiConsumer;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class BottomActionBar$$ExternalSyntheticLambda3 implements BiConsumer {
    public final /* synthetic */ BottomActionBar.BottomAction f$0;

    @Override // java.util.function.BiConsumer
    public final void accept(Object obj, Object obj2) {
        int i;
        BottomActionBar.BottomAction bottomAction = this.f$0;
        BottomActionBar.BottomSheetContent bottomSheetContent = (BottomActionBar.BottomSheetContent) obj2;
        int i2 = BottomActionBar.$r8$clinit;
        boolean equals = ((BottomActionBar.BottomAction) obj).equals(bottomAction);
        bottomSheetContent.mIsVisible = equals;
        T t = bottomSheetContent.mContentView;
        if (equals) {
            i = 0;
        } else {
            i = 8;
        }
        t.setVisibility(i);
    }
}
