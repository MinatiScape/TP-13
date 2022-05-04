package kotlin.collections;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: _Maps.kt */
/* loaded from: classes.dex */
public class MapsKt___MapsKt extends MapsKt__MapsJVMKt {
    @NotNull
    public static final void toMap(@NotNull ArrayList arrayList, @NotNull LinkedHashMap linkedHashMap) {
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Pair pair = (Pair) it.next();
            linkedHashMap.put(pair.component1(), pair.component2());
        }
    }

    @NotNull
    public static final Map toMap(@NotNull ArrayList arrayList) {
        int size = arrayList.size();
        if (size == 0) {
            return EmptyMap.INSTANCE;
        }
        if (size != 1) {
            LinkedHashMap linkedHashMap = new LinkedHashMap(MapsKt__MapsJVMKt.mapCapacity(arrayList.size()));
            toMap(arrayList, linkedHashMap);
            return linkedHashMap;
        }
        Pair pair = (Pair) arrayList.get(0);
        Intrinsics.checkNotNullParameter(pair, "pair");
        Map singletonMap = Collections.singletonMap(pair.getFirst(), pair.getSecond());
        Intrinsics.checkNotNullExpressionValue(singletonMap, "singletonMap(pair.first, pair.second)");
        return singletonMap;
    }
}
