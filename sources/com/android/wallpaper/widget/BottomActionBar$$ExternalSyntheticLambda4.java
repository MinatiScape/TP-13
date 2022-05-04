package com.android.wallpaper.widget;

import android.os.Bundle;
import com.android.systemui.unfold.UnfoldTransitionProgressProvider;
import com.android.systemui.unfold.util.ScopedUnfoldTransitionProgressProvider;
import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.picker.CustomizationPickerFragment;
import com.android.wallpaper.widget.BottomActionBar;
import java.util.function.Consumer;
/* loaded from: classes.dex */
public final /* synthetic */ class BottomActionBar$$ExternalSyntheticLambda4 implements Consumer {
    public final /* synthetic */ int $r8$classId = 2;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ BottomActionBar$$ExternalSyntheticLambda4(ScopedUnfoldTransitionProgressProvider scopedUnfoldTransitionProgressProvider) {
        this.f$0 = scopedUnfoldTransitionProgressProvider;
    }

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        switch (this.$r8$classId) {
            case 0:
                int i = BottomActionBar.$r8$clinit;
                ((BottomActionBar) this.f$0).updateSelectedState((BottomActionBar.BottomAction) obj, false);
                return;
            case 1:
                ((ScopedUnfoldTransitionProgressProvider) this.f$0).lambda$setReadyToHandleTransition$0((UnfoldTransitionProgressProvider.TransitionProgressListener) obj);
                return;
            default:
                int i2 = CustomizationPickerFragment.$r8$clinit;
                ((CustomizationSectionController) obj).onSaveInstanceState((Bundle) this.f$0);
                return;
        }
    }
}
