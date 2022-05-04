package kotlinx.coroutines.scheduling;

import kotlinx.atomicfu.AtomicFU;
import kotlinx.atomicfu.AtomicRef;
import kotlinx.coroutines.internal.LockFreeTaskQueueCore;
import org.jetbrains.annotations.NotNull;
/* compiled from: Tasks.kt */
/* loaded from: classes.dex */
public final class GlobalQueue {
    @NotNull
    public final AtomicRef<LockFreeTaskQueueCore<Task>> _cur = AtomicFU.atomic(new LockFreeTaskQueueCore(8, false));

    public final boolean addLast(Task task) {
        AtomicRef<LockFreeTaskQueueCore<Task>> atomicRef = this._cur;
        while (true) {
            LockFreeTaskQueueCore<Task> lockFreeTaskQueueCore = atomicRef.value;
            int addLast = lockFreeTaskQueueCore.addLast(task);
            if (addLast == 0) {
                return true;
            }
            if (addLast == 1) {
                this._cur.compareAndSet(lockFreeTaskQueueCore, lockFreeTaskQueueCore.next());
            } else if (addLast == 2) {
                return false;
            }
        }
    }

    public final int getSize() {
        long j = this._cur.value._state.value;
        return 1073741823 & (((int) ((j & 1152921503533105152L) >> 30)) - ((int) ((1073741823 & j) >> 0)));
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [kotlinx.coroutines.scheduling.Task, java.lang.Object] */
    public final Task removeFirstOrNull() {
        AtomicRef<LockFreeTaskQueueCore<Task>> atomicRef = this._cur;
        while (true) {
            LockFreeTaskQueueCore<Task> lockFreeTaskQueueCore = atomicRef.value;
            ?? removeFirstOrNull = lockFreeTaskQueueCore.removeFirstOrNull();
            if (removeFirstOrNull != LockFreeTaskQueueCore.REMOVE_FROZEN) {
                return removeFirstOrNull;
            }
            this._cur.compareAndSet(lockFreeTaskQueueCore, lockFreeTaskQueueCore.next());
        }
    }
}
