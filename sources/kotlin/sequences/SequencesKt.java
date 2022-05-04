package kotlin.sequences;

import java.util.ArrayList;
import java.util.List;
import kotlin.collections.ArraysUtilJVM;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class SequencesKt extends SequencesKt___SequencesJvmKt {
    @NotNull
    public static final List toList(@NotNull Sequence sequence) {
        ArrayList arrayList = new ArrayList();
        for (Object obj : sequence) {
            arrayList.add(obj);
        }
        return ArraysUtilJVM.optimizeReadOnlyList(arrayList);
    }
}
