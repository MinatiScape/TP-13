package kotlinx.coroutines.internal;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.atomicfu.AtomicRef;
import kotlinx.coroutines.DebugKt;
import kotlinx.coroutines.internal.LockFreeLinkedListNode;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Atomic.kt */
/* loaded from: classes.dex */
public abstract class AtomicOp<T> extends OpDescriptor {
    @NotNull
    public final AtomicRef<Object> _consensus = new AtomicRef<>(AtomicKt.NO_DECISION);

    @Nullable
    public abstract Symbol prepare(Object obj);

    @Override // kotlinx.coroutines.internal.OpDescriptor
    @Nullable
    public final Object perform(@Nullable Object obj) {
        boolean z;
        LockFreeLinkedListNode lockFreeLinkedListNode;
        Object obj2 = this._consensus.value;
        Symbol symbol = AtomicKt.NO_DECISION;
        if (obj2 == symbol) {
            obj2 = prepare(obj);
            boolean z2 = DebugKt.DEBUG;
            Object obj3 = this._consensus.value;
            if (obj3 != symbol) {
                obj2 = obj3;
            } else if (!this._consensus.compareAndSet(symbol, obj2)) {
                obj2 = this._consensus.value;
            }
        }
        LockFreeLinkedListNode.CondAddOp condAddOp = (LockFreeLinkedListNode.CondAddOp) this;
        LockFreeLinkedListNode affected = (LockFreeLinkedListNode) obj;
        Intrinsics.checkNotNullParameter(affected, "affected");
        if (obj2 == null) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            lockFreeLinkedListNode = condAddOp.newNode;
        } else {
            lockFreeLinkedListNode = condAddOp.oldNext;
        }
        if (lockFreeLinkedListNode != null && affected._next.compareAndSet(condAddOp, lockFreeLinkedListNode) && z) {
            LockFreeLinkedListNode lockFreeLinkedListNode2 = condAddOp.newNode;
            LockFreeLinkedListNode lockFreeLinkedListNode3 = condAddOp.oldNext;
            Intrinsics.checkNotNull(lockFreeLinkedListNode3);
            lockFreeLinkedListNode2.finishAdd(lockFreeLinkedListNode3);
        }
        return obj2;
    }
}
