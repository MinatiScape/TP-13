package kotlin.sequences;

import java.util.Iterator;
import java.util.concurrent.atomic.AtomicReference;
import org.jetbrains.annotations.NotNull;
/* compiled from: SequencesJVM.kt */
/* loaded from: classes.dex */
public final class ConstrainedOnceSequence<T> implements Sequence<T> {
    @NotNull
    public final AtomicReference<Sequence<T>> sequenceRef;

    @Override // kotlin.sequences.Sequence
    @NotNull
    public final Iterator<T> iterator() {
        Sequence<T> andSet = this.sequenceRef.getAndSet(null);
        if (andSet != null) {
            return andSet.iterator();
        }
        throw new IllegalStateException("This sequence can be consumed only once.");
    }

    public ConstrainedOnceSequence(@NotNull SequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1) {
        this.sequenceRef = new AtomicReference<>(sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1);
    }
}
