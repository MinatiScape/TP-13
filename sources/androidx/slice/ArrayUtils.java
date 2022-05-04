package androidx.slice;

import java.util.Objects;
/* loaded from: classes.dex */
public class ArrayUtils {
    public static <T> boolean contains(T[] array, T item) {
        for (T t : array) {
            if (Objects.equals(t, item)) {
                return true;
            }
        }
        return false;
    }
}
