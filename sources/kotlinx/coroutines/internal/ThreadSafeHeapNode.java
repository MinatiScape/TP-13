package kotlinx.coroutines.internal;

import kotlinx.coroutines.EventLoopImplBase;
import org.jetbrains.annotations.Nullable;
/* compiled from: ThreadSafeHeap.kt */
/* loaded from: classes.dex */
public interface ThreadSafeHeapNode {
    void setHeap(@Nullable EventLoopImplBase.DelayedTaskQueue delayedTaskQueue);

    void setIndex(int i);
}
