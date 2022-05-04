package kotlinx.coroutines.internal;

import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.ConstrainedOnceSequence;
import kotlin.sequences.SequencesKt;
import kotlin.sequences.SequencesKt__SequencesKt$asSequence$$inlined$Sequence$1;
import kotlinx.coroutines.MainCoroutineDispatcher;
import org.jetbrains.annotations.NotNull;
/* compiled from: MainDispatchers.kt */
/* loaded from: classes.dex */
public final class MainDispatcherLoader {
    @NotNull
    public static final MainCoroutineDispatcher dispatcher;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v14, types: [kotlin.sequences.ConstrainedOnceSequence] */
    static {
        boolean z;
        MissingMainCoroutineDispatcher missingMainCoroutineDispatcher;
        List<? extends MainDispatcherFactory> list;
        Object obj;
        String systemProp = SystemPropsKt.systemProp("kotlinx.coroutines.fast.service.loader");
        if (systemProp == null) {
            z = true;
        } else {
            z = Boolean.parseBoolean(systemProp);
        }
        try {
            if (z) {
                list = SystemPropsKt.loadMainDispatcherFactory$external__kotlinx_coroutines__android_common__kotlinx_coroutines();
            } else {
                Iterator m = MainDispatcherLoader$$ExternalSyntheticServiceLoad0.m();
                Intrinsics.checkNotNullExpressionValue(m, "load(\n                  …             ).iterator()");
                SequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 = new SequencesKt__SequencesKt$asSequence$$inlined$Sequence$1(m);
                if (!(sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 instanceof ConstrainedOnceSequence)) {
                    sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1 = new ConstrainedOnceSequence(sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1);
                }
                list = SequencesKt.toList(sequencesKt__SequencesKt$asSequence$$inlined$Sequence$1);
            }
            Iterator it = list.iterator();
            if (!it.hasNext()) {
                obj = null;
            } else {
                obj = it.next();
                if (it.hasNext()) {
                    int loadPriority = ((MainDispatcherFactory) obj).getLoadPriority();
                    do {
                        Object next = it.next();
                        int loadPriority2 = ((MainDispatcherFactory) next).getLoadPriority();
                        if (loadPriority < loadPriority2) {
                            obj = next;
                            loadPriority = loadPriority2;
                        }
                    } while (it.hasNext());
                }
            }
            MainDispatcherFactory mainDispatcherFactory = (MainDispatcherFactory) obj;
            if (mainDispatcherFactory == null) {
                missingMainCoroutineDispatcher = null;
            } else {
                missingMainCoroutineDispatcher = mainDispatcherFactory.createDispatcher(list);
            }
            if (missingMainCoroutineDispatcher == null) {
                missingMainCoroutineDispatcher = new MissingMainCoroutineDispatcher(null, null);
            }
        } catch (Throwable th) {
            missingMainCoroutineDispatcher = new MissingMainCoroutineDispatcher(th, null);
        }
        dispatcher = missingMainCoroutineDispatcher;
    }
}
