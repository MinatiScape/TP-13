package kotlinx.coroutines.internal;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public class LockFreeTaskQueue<E> {
    public static final /* synthetic */ AtomicReferenceFieldUpdater _cur$FU$internal = AtomicReferenceFieldUpdater.newUpdater(LockFreeTaskQueue.class, Object.class, "_cur$internal");
    public volatile /* synthetic */ Object _cur$internal;

    public LockFreeTaskQueue(boolean z) {
        this._cur$internal = new LockFreeTaskQueueCore(8, z);
    }

    public final boolean addLast(@NotNull E element) {
        Intrinsics.checkParameterIsNotNull(element, "element");
        while (true) {
            LockFreeTaskQueueCore lockFreeTaskQueueCore = (LockFreeTaskQueueCore) this._cur$internal;
            int addLast = lockFreeTaskQueueCore.addLast(element);
            if (addLast == 0) {
                return true;
            }
            if (addLast == 1) {
                _cur$FU$internal.compareAndSet(this, lockFreeTaskQueueCore, lockFreeTaskQueueCore.next());
            } else if (addLast == 2) {
                return false;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x006c, code lost:
        r7 = (E) r9;
     */
    @org.jetbrains.annotations.Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final E removeFirstOrNull() {
        /*
            r11 = this;
        L0:
            java.lang.Object r0 = r11._cur$internal
            kotlinx.coroutines.internal.LockFreeTaskQueueCore r0 = (kotlinx.coroutines.internal.LockFreeTaskQueueCore) r0
        L4:
            long r3 = r0._state$internal
            r1 = 1152921504606846976(0x1000000000000000, double:1.2882297539194267E-231)
            long r1 = r1 & r3
            r5 = 0
            int r1 = (r1 > r5 ? 1 : (r1 == r5 ? 0 : -1))
            r7 = 0
            if (r1 == 0) goto L13
            kotlinx.coroutines.internal.Symbol r7 = kotlinx.coroutines.internal.LockFreeTaskQueueCore.REMOVE_FROZEN
            goto L6d
        L13:
            kotlinx.coroutines.internal.LockFreeTaskQueueCore$Companion r1 = kotlinx.coroutines.internal.LockFreeTaskQueueCore.Companion
            r5 = 1073741823(0x3fffffff, double:5.304989472E-315)
            long r5 = r5 & r3
            r2 = 0
            long r5 = r5 >> r2
            int r8 = (int) r5
            r5 = 1152921503533105152(0xfffffffc0000000, double:1.2882296003504729E-231)
            long r5 = r5 & r3
            r2 = 30
            long r5 = r5 >> r2
            int r2 = (int) r5
            int r5 = r0.mask
            r2 = r2 & r5
            r6 = r8 & r5
            if (r2 != r6) goto L2e
            goto L6d
        L2e:
            java.util.concurrent.atomic.AtomicReferenceArray r2 = r0.array$internal
            r5 = r5 & r8
            java.lang.Object r9 = r2.get(r5)
            if (r9 != 0) goto L3c
            boolean r1 = r0.singleConsumer
            if (r1 == 0) goto L4
            goto L6d
        L3c:
            boolean r2 = r9 instanceof kotlinx.coroutines.internal.LockFreeTaskQueueCore.Placeholder
            if (r2 == 0) goto L41
            goto L6d
        L41:
            int r2 = r8 + 1
            r5 = 1073741823(0x3fffffff, float:1.9999999)
            r10 = r2 & r5
            java.util.concurrent.atomic.AtomicLongFieldUpdater r2 = kotlinx.coroutines.internal.LockFreeTaskQueueCore._state$FU$internal
            long r5 = r1.updateHead(r3, r10)
            r1 = r2
            r2 = r0
            boolean r1 = r1.compareAndSet(r2, r3, r5)
            if (r1 == 0) goto L5f
            java.util.concurrent.atomic.AtomicReferenceArray r1 = r0.array$internal
            int r2 = r0.mask
            r2 = r2 & r8
            r1.set(r2, r7)
            goto L6c
        L5f:
            boolean r1 = r0.singleConsumer
            if (r1 != 0) goto L64
            goto L4
        L64:
            r1 = r0
        L65:
            kotlinx.coroutines.internal.LockFreeTaskQueueCore r1 = kotlinx.coroutines.internal.LockFreeTaskQueueCore.access$removeSlowPath(r1, r8, r10)
            if (r1 == 0) goto L6c
            goto L65
        L6c:
            r7 = r9
        L6d:
            kotlinx.coroutines.internal.Symbol r1 = kotlinx.coroutines.internal.LockFreeTaskQueueCore.REMOVE_FROZEN
            if (r7 == r1) goto L72
            return r7
        L72:
            java.util.concurrent.atomic.AtomicReferenceFieldUpdater r1 = kotlinx.coroutines.internal.LockFreeTaskQueue._cur$FU$internal
            kotlinx.coroutines.internal.LockFreeTaskQueueCore r2 = r0.next()
            r1.compareAndSet(r11, r0, r2)
            goto L0
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.internal.LockFreeTaskQueue.removeFirstOrNull():java.lang.Object");
    }
}
