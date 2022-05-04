package kotlinx.coroutines.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class LockFreeLinkedListKt {
    @NotNull
    public static final Object CONDITION_FALSE = new Symbol("CONDITION_FALSE");

    static {
        Intrinsics.checkParameterIsNotNull("ALREADY_REMOVED", "symbol");
        Intrinsics.checkParameterIsNotNull("LIST_EMPTY", "symbol");
        Intrinsics.checkParameterIsNotNull("REMOVE_PREPARED", "symbol");
    }

    @NotNull
    public static final LockFreeLinkedListNode unwrap(@NotNull Object unwrap) {
        LockFreeLinkedListNode lockFreeLinkedListNode;
        Intrinsics.checkParameterIsNotNull(unwrap, "$this$unwrap");
        Removed removed = (Removed) (!(unwrap instanceof Removed) ? null : unwrap);
        return (removed == null || (lockFreeLinkedListNode = removed.ref) == null) ? (LockFreeLinkedListNode) unwrap : lockFreeLinkedListNode;
    }
}
