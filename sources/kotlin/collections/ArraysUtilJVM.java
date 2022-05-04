package kotlin.collections;

import java.util.Collections;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public class ArraysUtilJVM {
    @NotNull
    public static final List listOf(Object obj) {
        List singletonList = Collections.singletonList(obj);
        Intrinsics.checkNotNullExpressionValue(singletonList, "singletonList(element)");
        return singletonList;
    }

    @NotNull
    public static final List optimizeReadOnlyList(@NotNull List list) {
        int size = list.size();
        if (size == 0) {
            return EmptyList.INSTANCE;
        }
        if (size != 1) {
            return list;
        }
        return listOf(list.get(0));
    }
}
