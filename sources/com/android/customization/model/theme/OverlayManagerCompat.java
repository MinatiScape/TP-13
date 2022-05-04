package com.android.customization.model.theme;

import android.content.om.OverlayManager;
import androidx.fragment.app.FragmentActivity;
import com.android.customization.model.ResourceConstants;
import com.android.systemui.flags.FlagManager;
import com.android.systemui.shared.R;
import java.util.ArrayList;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class OverlayManagerCompat {
    public final OverlayManager mOverlayManager;

    public OverlayManagerCompat(FragmentActivity fragmentActivity) {
        this.mOverlayManager = (OverlayManager) fragmentActivity.getSystemService(OverlayManager.class);
        ArrayList<String> arrayList = ResourceConstants.sTargetPackages;
        if (arrayList.isEmpty()) {
            arrayList.addAll(Arrays.asList("android", "com.android.settings", FlagManager.RECEIVING_PACKAGE));
            arrayList.add(fragmentActivity.getString(R.string.launcher_overlayable_package));
            arrayList.add(fragmentActivity.getPackageName());
        }
        String[] strArr = (String[]) arrayList.toArray(new String[0]);
    }
}
