package kotlin.comparisons;

import org.jetbrains.annotations.Nullable;
/* compiled from: _ComparisonsJvm.kt */
/* loaded from: classes.dex */
public class ComparisonsKt___ComparisonsJvmKt {
    public static final int compareValues(@Nullable Comparable comparable, @Nullable Comparable comparable2) {
        if (comparable == comparable2) {
            return 0;
        }
        if (comparable == null) {
            return -1;
        }
        if (comparable2 == null) {
            return 1;
        }
        return comparable.compareTo(comparable2);
    }
}
