package androidx.core.content;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Process;
@SuppressLint({"PrivateConstructorForUtilityClass"})
/* loaded from: classes.dex */
public class ContextCompat {
    public static final Object sLock = new Object();

    public static int checkSelfPermission(Context context, String str) {
        if (str != null) {
            return context.checkPermission(str, Process.myPid(), Process.myUid());
        }
        throw new NullPointerException("permission must be non-null");
    }
}
