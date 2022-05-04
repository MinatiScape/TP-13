package kotlin.collections;

import java.util.Map;
import kotlin.Pair;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public class MapsKt___MapsKt extends ArraysUtilJVM {
    @NotNull
    public static final <K, V, M extends Map<? super K, ? super V>> M toMap(@NotNull Iterable<? extends Pair<? extends K, ? extends V>> iterable, @NotNull M m) {
        for (Pair<? extends K, ? extends V> pair : iterable) {
            m.put(pair.component1(), pair.component2());
        }
        return m;
    }
}
