package kotlin.sequences;

import androidx.savedstate.R$id;
import java.util.Iterator;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public class SequencesKt___SequencesJvmKt extends R$id {
    @NotNull
    public static final <T> Sequence<T> asSequence(@NotNull final Iterator<? extends T> it) {
        Sequence<T> sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 = new Sequence<T>() { // from class: kotlin.sequences.SequencesKt__SequencesKt$asSequence$$inlined$Sequence$1
            @Override // kotlin.sequences.Sequence
            @NotNull
            public Iterator<T> iterator() {
                return it;
            }
        };
        return sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 instanceof ConstrainedOnceSequence ? sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 : new ConstrainedOnceSequence(sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1);
    }
}
