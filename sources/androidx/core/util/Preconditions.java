package androidx.core.util;
/* loaded from: classes.dex */
public final class Preconditions {
    public static void checkArgumentNonnegative(int i) {
        if (i < 0) {
            throw new IllegalArgumentException();
        }
    }

    public static void checkNotNull(Object obj, String str) {
        if (obj == null) {
            throw new NullPointerException(str);
        }
    }
}
