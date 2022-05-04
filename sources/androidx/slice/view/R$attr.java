package androidx.slice.view;

import android.app.AppOpsManager;
import android.content.Context;
import android.os.Binder;
import android.os.Process;
import com.android.systemui.shared.R;
import java.util.Objects;
/* loaded from: classes.dex */
public final class R$attr {
    public static final int[] CoordinatorLayout = {R.attr.keylines, R.attr.statusBarBackground};
    public static final int[] CoordinatorLayout_Layout = {16842931, R.attr.layout_anchor, R.attr.layout_anchorGravity, R.attr.layout_behavior, R.attr.layout_dodgeInsetEdges, R.attr.layout_insetEdge, R.attr.layout_keyline};

    public static int checkPermission(Context context, String str, int i, int i2, String str2) {
        boolean z;
        int i3;
        if (context.checkPermission(str, i, i2) == -1) {
            return -1;
        }
        String permissionToOp = AppOpsManager.permissionToOp(str);
        if (permissionToOp == null) {
            return 0;
        }
        if (str2 == null) {
            String[] packagesForUid = context.getPackageManager().getPackagesForUid(i2);
            if (packagesForUid == null || packagesForUid.length <= 0) {
                return -1;
            }
            str2 = packagesForUid[0];
        }
        int myUid = Process.myUid();
        String packageName = context.getPackageName();
        int i4 = 1;
        if (myUid != i2 || !Objects.equals(packageName, str2)) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            AppOpsManager appOpsManager = (AppOpsManager) context.getSystemService(AppOpsManager.class);
            int callingUid = Binder.getCallingUid();
            if (appOpsManager == null) {
                i3 = 1;
            } else {
                i3 = appOpsManager.checkOpNoThrow(permissionToOp, callingUid, str2);
            }
            if (i3 == 0) {
                String opPackageName = context.getOpPackageName();
                if (appOpsManager != null) {
                    i4 = appOpsManager.checkOpNoThrow(permissionToOp, i2, opPackageName);
                }
                i3 = i4;
            }
        } else {
            i3 = ((AppOpsManager) context.getSystemService(AppOpsManager.class)).noteProxyOpNoThrow(permissionToOp, str2);
        }
        if (i3 == 0) {
            return 0;
        }
        return -2;
    }
}
