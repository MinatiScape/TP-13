package kotlinx.coroutines.internal;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.atomicfu.AtomicFU;
import kotlinx.atomicfu.AtomicRef;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: LockFreeLinkedList.kt */
/* loaded from: classes.dex */
public class LockFreeLinkedListNode {
    @NotNull
    public final AtomicRef<Object> _next = AtomicFU.atomic(this);
    @NotNull
    public final AtomicRef<LockFreeLinkedListNode> _prev = AtomicFU.atomic(this);
    @NotNull
    public final AtomicRef<Removed> _removedRef = AtomicFU.atomic(null);

    /* compiled from: LockFreeLinkedList.kt */
    /* loaded from: classes.dex */
    public static abstract class CondAddOp extends AtomicOp<LockFreeLinkedListNode> {
        @NotNull
        public final LockFreeLinkedListNode newNode;
        @Nullable
        public LockFreeLinkedListNode oldNext;

        public CondAddOp(@NotNull LockFreeLinkedListNode lockFreeLinkedListNode) {
            this.newNode = lockFreeLinkedListNode;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0040, code lost:
        if (r3._next.compareAndSet(r2, ((kotlinx.coroutines.internal.Removed) r4).ref) != false) goto L24;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final kotlinx.coroutines.internal.LockFreeLinkedListNode correctPrev() {
        /*
            r7 = this;
        L0:
            kotlinx.atomicfu.AtomicRef<kotlinx.coroutines.internal.LockFreeLinkedListNode> r0 = r7._prev
            T r0 = r0.value
            kotlinx.coroutines.internal.LockFreeLinkedListNode r0 = (kotlinx.coroutines.internal.LockFreeLinkedListNode) r0
            r1 = 0
            r2 = r0
        L8:
            r3 = r1
        L9:
            kotlinx.atomicfu.AtomicRef<java.lang.Object> r4 = r2._next
            T r4 = r4.value
            if (r4 != r7) goto L1c
            if (r0 != r2) goto L12
            return r2
        L12:
            kotlinx.atomicfu.AtomicRef<kotlinx.coroutines.internal.LockFreeLinkedListNode> r1 = r7._prev
            boolean r0 = r1.compareAndSet(r0, r2)
            if (r0 != 0) goto L1b
            goto L0
        L1b:
            return r2
        L1c:
            boolean r5 = r7.isRemoved()
            if (r5 == 0) goto L23
            return r1
        L23:
            if (r4 != 0) goto L26
            return r2
        L26:
            boolean r5 = r4 instanceof kotlinx.coroutines.internal.OpDescriptor
            if (r5 == 0) goto L30
            kotlinx.coroutines.internal.OpDescriptor r4 = (kotlinx.coroutines.internal.OpDescriptor) r4
            r4.perform(r2)
            goto L0
        L30:
            boolean r5 = r4 instanceof kotlinx.coroutines.internal.Removed
            if (r5 == 0) goto L4c
            if (r3 == 0) goto L45
            kotlinx.atomicfu.AtomicRef<java.lang.Object> r5 = r3._next
            kotlinx.coroutines.internal.Removed r4 = (kotlinx.coroutines.internal.Removed) r4
            kotlinx.coroutines.internal.LockFreeLinkedListNode r4 = r4.ref
            boolean r2 = r5.compareAndSet(r2, r4)
            if (r2 != 0) goto L43
            goto L0
        L43:
            r2 = r3
            goto L8
        L45:
            kotlinx.atomicfu.AtomicRef<kotlinx.coroutines.internal.LockFreeLinkedListNode> r2 = r2._prev
            T r2 = r2.value
            kotlinx.coroutines.internal.LockFreeLinkedListNode r2 = (kotlinx.coroutines.internal.LockFreeLinkedListNode) r2
            goto L9
        L4c:
            r3 = r4
            kotlinx.coroutines.internal.LockFreeLinkedListNode r3 = (kotlinx.coroutines.internal.LockFreeLinkedListNode) r3
            r6 = r3
            r3 = r2
            r2 = r6
            goto L9
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.internal.LockFreeLinkedListNode.correctPrev():kotlinx.coroutines.internal.LockFreeLinkedListNode");
    }

    public final void finishAdd(LockFreeLinkedListNode lockFreeLinkedListNode) {
        LockFreeLinkedListNode lockFreeLinkedListNode2;
        AtomicRef<LockFreeLinkedListNode> atomicRef = lockFreeLinkedListNode._prev;
        do {
            lockFreeLinkedListNode2 = atomicRef.value;
            if (getNext() != lockFreeLinkedListNode) {
                return;
            }
        } while (!lockFreeLinkedListNode._prev.compareAndSet(lockFreeLinkedListNode2, this));
        if (isRemoved()) {
            lockFreeLinkedListNode.correctPrev();
        }
    }

    @NotNull
    public final Object getNext() {
        AtomicRef<Object> atomicRef = this._next;
        while (true) {
            Object obj = atomicRef.value;
            if (!(obj instanceof OpDescriptor)) {
                return obj;
            }
            ((OpDescriptor) obj).perform(this);
        }
    }

    @NotNull
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append((Object) getClass().getSimpleName());
        sb.append('@');
        sb.append((Object) Integer.toHexString(System.identityHashCode(this)));
        return sb.toString();
    }

    @NotNull
    public final LockFreeLinkedListNode getNextNode() {
        Removed removed;
        Object next = getNext();
        Symbol symbol = LockFreeLinkedListKt.CONDITION_FALSE;
        Intrinsics.checkNotNullParameter(next, "<this>");
        LockFreeLinkedListNode lockFreeLinkedListNode = null;
        if (next instanceof Removed) {
            removed = (Removed) next;
        } else {
            removed = null;
        }
        if (removed != null) {
            lockFreeLinkedListNode = removed.ref;
        }
        if (lockFreeLinkedListNode == null) {
            return (LockFreeLinkedListNode) next;
        }
        return lockFreeLinkedListNode;
    }

    @NotNull
    public final LockFreeLinkedListNode getPrevNode() {
        LockFreeLinkedListNode correctPrev = correctPrev();
        if (correctPrev == null) {
            correctPrev = this._prev.value;
            while (correctPrev.isRemoved()) {
                correctPrev = correctPrev._prev.value;
            }
        }
        return correctPrev;
    }

    public boolean isRemoved() {
        return getNext() instanceof Removed;
    }
}
