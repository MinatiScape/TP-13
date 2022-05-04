package kotlinx.coroutines;

import androidx.recyclerview.widget.RecyclerView;
import kotlin.TypeCastException;
import kotlin.collections.ArraysKt___ArraysKt;
import kotlinx.coroutines.internal.ArrayQueue;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public abstract class EventLoop extends CoroutineDispatcher {
    public boolean shared;
    public ArrayQueue<DispatchedTask<?>> unconfinedQueue;
    public long useCount;

    public final void decrementUseCount(boolean z) {
        long delta = this.useCount - delta(z);
        this.useCount = delta;
        if (delta <= 0) {
            boolean z2 = DebugKt.DEBUG;
            if (this.shared) {
                shutdown();
            }
        }
    }

    public final long delta(boolean z) {
        return z ? 4294967296L : 1L;
    }

    public final void dispatchUnconfined(@NotNull DispatchedTask<?> dispatchedTask) {
        ArrayQueue<DispatchedTask<?>> arrayQueue = this.unconfinedQueue;
        if (arrayQueue == null) {
            arrayQueue = new ArrayQueue<>();
            this.unconfinedQueue = arrayQueue;
        }
        Object[] objArr = arrayQueue.elements;
        int i = arrayQueue.tail;
        objArr[i] = dispatchedTask;
        int length = (i + 1) & (objArr.length - 1);
        arrayQueue.tail = length;
        int i2 = arrayQueue.head;
        if (length == i2) {
            int length2 = objArr.length;
            Object[] objArr2 = new Object[length2 << 1];
            ArraysKt___ArraysKt.copyInto$default(objArr, objArr2, 0, i2, 0, 10);
            Object[] objArr3 = arrayQueue.elements;
            int length3 = objArr3.length;
            int i3 = arrayQueue.head;
            ArraysKt___ArraysKt.copyInto$default(objArr3, objArr2, length3 - i3, 0, i3, 4);
            arrayQueue.elements = objArr2;
            arrayQueue.head = 0;
            arrayQueue.tail = length2;
        }
    }

    public long getNextTime() {
        ArrayQueue<DispatchedTask<?>> arrayQueue = this.unconfinedQueue;
        if (arrayQueue != null) {
            if (!(arrayQueue.head == arrayQueue.tail)) {
                return 0L;
            }
        }
        return RecyclerView.FOREVER_NS;
    }

    public final void incrementUseCount(boolean z) {
        this.useCount = delta(z) + this.useCount;
        if (!z) {
            this.shared = true;
        }
    }

    public final boolean isUnconfinedLoopActive() {
        return this.useCount >= delta(true);
    }

    public long processNextEvent() {
        return !processUnconfinedEvent() ? RecyclerView.FOREVER_NS : getNextTime();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v1, types: [java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r5v0 */
    public final boolean processUnconfinedEvent() {
        ArrayQueue<DispatchedTask<?>> arrayQueue = this.unconfinedQueue;
        if (arrayQueue == null) {
            return false;
        }
        int i = arrayQueue.head;
        DispatchedTask dispatchedTask = null;
        if (i != arrayQueue.tail) {
            ?? r2 = arrayQueue.elements;
            ?? r5 = r2[i];
            r2[i] = 0;
            arrayQueue.head = (i + 1) & (r2.length - 1);
            if (r5 != 0) {
                dispatchedTask = r5;
            } else {
                throw new TypeCastException("null cannot be cast to non-null type T");
            }
        }
        DispatchedTask dispatchedTask2 = dispatchedTask;
        if (dispatchedTask2 == null) {
            return false;
        }
        dispatchedTask2.run();
        return true;
    }

    public void shutdown() {
    }
}
