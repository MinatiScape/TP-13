package androidx.slice.view;

import android.content.Intent;
import android.net.Uri;
/* loaded from: classes.dex */
public final class R$dimen {
    public static boolean isDeepLink(Intent intent) {
        Uri data = intent.getData();
        if (data == null || !"https".equals(data.getScheme()) || !data.getSchemeSpecificPart().startsWith("//g.co/wallpaper")) {
            return false;
        }
        return true;
    }
}
