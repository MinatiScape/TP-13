package com.android.systemui.shared.navigationbar;

import android.view.SurfaceControl;
import com.android.customization.model.themedicon.ThemedIconSectionController$$ExternalSyntheticLambda0;
import com.android.customization.model.themedicon.ThemedIconSwitchProvider;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class RegionSamplingHelper$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ RegionSamplingHelper$$ExternalSyntheticLambda0(Object obj, Object obj2, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
        this.f$1 = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                ((RegionSamplingHelper) this.f$0).lambda$updateSamplingListener$0((SurfaceControl) this.f$1);
                return;
            default:
                ((ThemedIconSectionController$$ExternalSyntheticLambda0) ((ThemedIconSwitchProvider.FetchThemedIconEnabledCallback) this.f$1)).f$0.mThemedIconSectionView.mSwitchView.setChecked(((ThemedIconSwitchProvider) this.f$0).mCustomizationPreferences.getThemedIconEnabled());
                return;
        }
    }
}
