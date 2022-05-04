package androidx.lifecycle.runtime;
/* loaded from: classes.dex */
public class R$id {
    public static boolean isOOM(Throwable th) {
        while (th != null) {
            if (th instanceof OutOfMemoryError) {
                return true;
            }
            th = th.getCause();
        }
        return false;
    }
}
