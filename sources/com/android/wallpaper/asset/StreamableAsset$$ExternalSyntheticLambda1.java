package com.android.wallpaper.asset;

import android.os.Bundle;
import com.android.wallpaper.asset.StreamableAsset;
import com.android.wallpaper.picker.CustomizationPickerFragment;
import java.io.InputStream;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class StreamableAsset$$ExternalSyntheticLambda1 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ StreamableAsset$$ExternalSyntheticLambda1(Object obj, Object obj2, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
        this.f$1 = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                ((StreamableAsset.StreamReceiver) this.f$0).onInputStreamOpened((InputStream) this.f$1);
                return;
            default:
                final CustomizationPickerFragment customizationPickerFragment = (CustomizationPickerFragment) this.f$0;
                final Bundle bundle = (Bundle) this.f$1;
                if (bundle != null) {
                    customizationPickerFragment.mNestedScrollView.post(new Runnable() { // from class: com.android.wallpaper.picker.CustomizationPickerFragment$$ExternalSyntheticLambda1
                        @Override // java.lang.Runnable
                        public final void run() {
                            CustomizationPickerFragment.this.mNestedScrollView.setScrollY(bundle.getInt("SCROLL_POSITION_Y"));
                        }
                    });
                    return;
                }
                int i = CustomizationPickerFragment.$r8$clinit;
                customizationPickerFragment.getClass();
                return;
        }
    }
}
