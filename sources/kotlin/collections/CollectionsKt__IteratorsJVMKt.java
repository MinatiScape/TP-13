package kotlin.collections;

import java.util.Collection;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public class CollectionsKt__IteratorsJVMKt extends CollectionsKt__CollectionsKt {
    public static final <T> int collectionSizeOrDefault(@NotNull Iterable<? extends T> collectionSizeOrDefault, int i) {
        Intrinsics.checkNotNullParameter(collectionSizeOrDefault, "$this$collectionSizeOrDefault");
        return collectionSizeOrDefault instanceof Collection ? ((Collection) collectionSizeOrDefault).size() : i;
    }
}
