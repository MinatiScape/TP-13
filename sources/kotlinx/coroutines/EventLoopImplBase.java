package kotlinx.coroutines;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import java.util.concurrent.locks.LockSupport;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.atomicfu.AtomicBoolean;
import kotlinx.atomicfu.AtomicRef;
import kotlinx.coroutines.internal.ArrayQueue;
import kotlinx.coroutines.internal.LockFreeTaskQueueCore;
import kotlinx.coroutines.internal.Symbol;
import kotlinx.coroutines.internal.ThreadSafeHeap;
import kotlinx.coroutines.internal.ThreadSafeHeapNode;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: EventLoop.common.kt */
/* loaded from: classes.dex */
public abstract class EventLoopImplBase extends EventLoopImplPlatform {
    @NotNull
    public final AtomicRef<Object> _queue = new AtomicRef<>(null);
    @NotNull
    public final AtomicRef<DelayedTaskQueue> _delayed = new AtomicRef<>(null);
    @NotNull
    public final AtomicBoolean _isCompleted = new AtomicBoolean(false);

    /* compiled from: EventLoop.common.kt */
    /* loaded from: classes.dex */
    public static abstract class DelayedTask implements Runnable, Comparable<DelayedTask>, DisposableHandle, ThreadSafeHeapNode {
        @Nullable
        public Object _heap;
        public int index;
        public long nanoTime;

        @Override // kotlinx.coroutines.DisposableHandle
        public final synchronized void dispose() {
            DelayedTaskQueue delayedTaskQueue;
            Object obj = this._heap;
            Symbol symbol = EventLoop_commonKt.DISPOSED_TASK;
            if (obj != symbol) {
                ThreadSafeHeap threadSafeHeap = null;
                if (obj instanceof DelayedTaskQueue) {
                    delayedTaskQueue = (DelayedTaskQueue) obj;
                } else {
                    delayedTaskQueue = null;
                }
                if (delayedTaskQueue != null) {
                    synchronized (delayedTaskQueue) {
                        Object obj2 = this._heap;
                        if (obj2 instanceof ThreadSafeHeap) {
                            threadSafeHeap = (ThreadSafeHeap) obj2;
                        }
                        if (threadSafeHeap != null) {
                            int i = this.index;
                            boolean z = DebugKt.DEBUG;
                            delayedTaskQueue.removeAtImpl(i);
                        }
                    }
                }
                this._heap = symbol;
            }
        }

        @Override // java.lang.Comparable
        public final int compareTo(DelayedTask delayedTask) {
            DelayedTask other = delayedTask;
            Intrinsics.checkNotNullParameter(other, "other");
            int i = ((this.nanoTime - other.nanoTime) > 0L ? 1 : ((this.nanoTime - other.nanoTime) == 0L ? 0 : -1));
            if (i > 0) {
                return 1;
            }
            if (i < 0) {
                return -1;
            }
            return 0;
        }

        @Override // kotlinx.coroutines.internal.ThreadSafeHeapNode
        public final void setHeap(@Nullable DelayedTaskQueue delayedTaskQueue) {
            boolean z;
            if (this._heap != EventLoop_commonKt.DISPOSED_TASK) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                this._heap = delayedTaskQueue;
                return;
            }
            throw new IllegalArgumentException("Failed requirement.".toString());
        }

        @NotNull
        public final String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Delayed[nanos=");
            m.append(this.nanoTime);
            m.append(']');
            return m.toString();
        }

        @Override // kotlinx.coroutines.internal.ThreadSafeHeapNode
        public final void setIndex(int i) {
            this.index = i;
        }
    }

    /* compiled from: EventLoop.common.kt */
    /* loaded from: classes.dex */
    public static final class DelayedTaskQueue extends ThreadSafeHeap<DelayedTask> {
        public long timeNow;

        public DelayedTaskQueue(long j) {
            this.timeNow = j;
        }
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    public final void dispatch(@NotNull CoroutineContext context, @NotNull Runnable block) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(block, "block");
        enqueue(block);
    }

    public final void enqueue(@NotNull Runnable task) {
        Intrinsics.checkNotNullParameter(task, "task");
        if (enqueueImpl(task)) {
            Thread thread = getThread();
            if (Thread.currentThread() != thread) {
                LockSupport.unpark(thread);
                return;
            }
            return;
        }
        DefaultExecutor.INSTANCE.enqueue(task);
    }

    public final boolean enqueueImpl(Runnable runnable) {
        boolean z;
        AtomicRef<Object> atomicRef = this._queue;
        while (true) {
            Object obj = atomicRef.value;
            if (this._isCompleted._value != 0) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                return false;
            }
            if (obj == null) {
                if (this._queue.compareAndSet(null, runnable)) {
                    return true;
                }
            } else if (obj instanceof LockFreeTaskQueueCore) {
                LockFreeTaskQueueCore lockFreeTaskQueueCore = (LockFreeTaskQueueCore) obj;
                int addLast = lockFreeTaskQueueCore.addLast(runnable);
                if (addLast == 0) {
                    return true;
                }
                if (addLast == 1) {
                    this._queue.compareAndSet(obj, lockFreeTaskQueueCore.next());
                } else if (addLast == 2) {
                    return false;
                }
            } else if (obj == EventLoop_commonKt.CLOSED_EMPTY) {
                return false;
            } else {
                LockFreeTaskQueueCore lockFreeTaskQueueCore2 = new LockFreeTaskQueueCore(8, true);
                lockFreeTaskQueueCore2.addLast((Runnable) obj);
                lockFreeTaskQueueCore2.addLast(runnable);
                if (this._queue.compareAndSet(obj, lockFreeTaskQueueCore2)) {
                    return true;
                }
            }
        }
    }

    public final boolean isEmpty() {
        boolean z;
        boolean z2;
        ArrayQueue<DispatchedTask<?>> arrayQueue = this.unconfinedQueue;
        if (arrayQueue == null || arrayQueue.head == arrayQueue.tail) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            return false;
        }
        DelayedTaskQueue delayedTaskQueue = this._delayed.value;
        if (delayedTaskQueue != null) {
            if (delayedTaskQueue._size.value == 0) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (!z2) {
                return false;
            }
        }
        Object obj = this._queue.value;
        if (obj != null) {
            if (obj instanceof LockFreeTaskQueueCore) {
                long j = ((LockFreeTaskQueueCore) obj)._state.value;
                if (((int) ((1073741823 & j) >> 0)) != ((int) ((j & 1152921503533105152L) >> 30))) {
                    return false;
                }
            } else if (obj != EventLoop_commonKt.CLOSED_EMPTY) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0094  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void schedule(long r13, @org.jetbrains.annotations.NotNull kotlinx.coroutines.EventLoopImplBase.DelayedTask r15) {
        /*
            Method dump skipped, instructions count: 197
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.EventLoopImplBase.schedule(long, kotlinx.coroutines.EventLoopImplBase$DelayedTask):void");
    }

    @Override // kotlinx.coroutines.EventLoop
    public final void shutdown() {
        DelayedTask delayedTask;
        DelayedTask delayedTask2;
        ThreadLocalEventLoop.ref.set(null);
        this._isCompleted.setValue();
        boolean z = DebugKt.DEBUG;
        AtomicRef<Object> atomicRef = this._queue;
        while (true) {
            Object obj = atomicRef.value;
            if (obj == null) {
                if (this._queue.compareAndSet(null, EventLoop_commonKt.CLOSED_EMPTY)) {
                    break;
                }
            } else if (obj instanceof LockFreeTaskQueueCore) {
                ((LockFreeTaskQueueCore) obj).close();
                break;
            } else if (obj == EventLoop_commonKt.CLOSED_EMPTY) {
                break;
            } else {
                LockFreeTaskQueueCore lockFreeTaskQueueCore = new LockFreeTaskQueueCore(8, true);
                lockFreeTaskQueueCore.addLast((Runnable) obj);
                if (this._queue.compareAndSet(obj, lockFreeTaskQueueCore)) {
                    break;
                }
            }
        }
        do {
        } while (processNextEvent() <= 0);
        long nanoTime = System.nanoTime();
        while (true) {
            DelayedTaskQueue delayedTaskQueue = this._delayed.value;
            if (delayedTaskQueue == null) {
                delayedTask = null;
            } else {
                synchronized (delayedTaskQueue) {
                    if (delayedTaskQueue._size.value > 0) {
                        delayedTask2 = delayedTaskQueue.removeAtImpl(0);
                    } else {
                        delayedTask2 = null;
                    }
                }
                delayedTask = delayedTask2;
            }
            if (delayedTask != null) {
                boolean z2 = DebugKt.DEBUG;
                DefaultExecutor.INSTANCE.schedule(nanoTime, delayedTask);
            } else {
                return;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:108:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00ae  */
    /* JADX WARN: Type inference failed for: r0v10, types: [T extends kotlinx.coroutines.internal.ThreadSafeHeapNode & java.lang.Comparable<? super T>[]] */
    /* JADX WARN: Type inference failed for: r12v0, types: [kotlinx.coroutines.EventLoopImplBase, kotlinx.coroutines.EventLoop] */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r8v16, types: [T extends kotlinx.coroutines.internal.ThreadSafeHeapNode & java.lang.Comparable<? super T>[]] */
    /* JADX WARN: Type inference failed for: r8v28 */
    @Override // kotlinx.coroutines.EventLoop
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long processNextEvent() {
        /*
            Method dump skipped, instructions count: 260
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.EventLoopImplBase.processNextEvent():long");
    }
}
