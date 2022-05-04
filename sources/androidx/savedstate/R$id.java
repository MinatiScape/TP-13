package androidx.savedstate;

import android.net.Uri;
/* loaded from: classes.dex */
public final class R$id {
    public static boolean isMediaStoreUri(Uri uri) {
        if (uri == null || !"content".equals(uri.getScheme()) || !"media".equals(uri.getAuthority())) {
            return false;
        }
        return true;
    }
}
