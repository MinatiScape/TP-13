package kotlin.collections;

import java.util.Collection;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: IteratorsJVM.kt */
/* loaded from: classes.dex */
public class CollectionsKt__IteratorsJVMKt extends ArraysUtilJVM {
    public static final int collectionSizeOrDefault(@NotNull Iterable iterable) {
        Intrinsics.checkNotNullParameter(iterable, "<this>");
        if (iterable instanceof Collection) {
            return ((Collection) iterable).size();
        }
        return 10;
    }
}
