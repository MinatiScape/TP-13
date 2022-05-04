package com.android.wallpaper.picker;

import android.os.Bundle;
import com.android.wallpaper.model.CustomizationSectionController;
import java.util.function.Consumer;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class CustomizationPickerFragment$$ExternalSyntheticLambda3 implements Consumer {
    public final /* synthetic */ Bundle f$0;

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        Bundle bundle = this.f$0;
        int i = CustomizationPickerFragment.$r8$clinit;
        ((CustomizationSectionController) obj).onSaveInstanceState(bundle);
    }
}
