package kotlinx.coroutines;

import androidx.recyclerview.widget.RecyclerView;
import kotlin.collections.ArraysKt___ArraysKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.internal.ArrayQueue;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: EventLoop.common.kt */
/* loaded from: classes.dex */
public abstract class EventLoop extends CoroutineDispatcher {
    public static final /* synthetic */ int $r8$clinit = 0;
    public boolean shared;
    @Nullable
    public ArrayQueue<DispatchedTask<?>> unconfinedQueue;
    public long useCount;

    public void shutdown() {
    }

    public final void decrementUseCount(boolean z) {
        long j;
        long j2 = this.useCount;
        if (z) {
            j = 4294967296L;
        } else {
            j = 1;
        }
        long j3 = j2 - j;
        this.useCount = j3;
        if (j3 <= 0) {
            boolean z2 = DebugKt.DEBUG;
            if (this.shared) {
                shutdown();
            }
        }
    }

    public final void dispatchUnconfined(@NotNull DispatchedTask<?> task) {
        Intrinsics.checkNotNullParameter(task, "task");
        ArrayQueue<DispatchedTask<?>> arrayQueue = this.unconfinedQueue;
        if (arrayQueue == null) {
            arrayQueue = new ArrayQueue<>();
            this.unconfinedQueue = arrayQueue;
        }
        Object[] objArr = arrayQueue.elements;
        int i = arrayQueue.tail;
        objArr[i] = task;
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

    public final void incrementUseCount(boolean z) {
        long j;
        long j2 = this.useCount;
        if (z) {
            j = 4294967296L;
        } else {
            j = 1;
        }
        this.useCount = j + j2;
        if (!z) {
            this.shared = true;
        }
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
                throw new NullPointerException("null cannot be cast to non-null type T of kotlinx.coroutines.internal.ArrayQueue");
            }
        }
        DispatchedTask dispatchedTask2 = dispatchedTask;
        if (dispatchedTask2 == null) {
            return false;
        }
        dispatchedTask2.run();
        return true;
    }

    public long processNextEvent() {
        if (!processUnconfinedEvent()) {
            return RecyclerView.FOREVER_NS;
        }
        return 0L;
    }
}
