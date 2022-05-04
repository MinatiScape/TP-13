package kotlinx.coroutines;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.internal.LockFreeLinkedListNode;
import kotlinx.coroutines.internal.Removed;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: JobSupport.kt */
/* loaded from: classes.dex */
public abstract class JobNode extends CompletionHandlerBase implements DisposableHandle, Incomplete {
    public JobSupport job;

    @Override // kotlinx.coroutines.Incomplete
    @Nullable
    public final NodeList getList() {
        return null;
    }

    @Override // kotlinx.coroutines.Incomplete
    public final boolean isActive() {
        return true;
    }

    @NotNull
    public final JobSupport getJob() {
        JobSupport jobSupport = this.job;
        if (jobSupport != null) {
            return jobSupport;
        }
        Intrinsics.throwUninitializedPropertyAccessException("job");
        throw null;
    }

    @Override // kotlinx.coroutines.internal.LockFreeLinkedListNode
    @NotNull
    public final String toString() {
        return DebugStringsKt.getClassSimpleName(this) + '@' + DebugStringsKt.getHexAddress(this) + "[job@" + DebugStringsKt.getHexAddress(getJob()) + ']';
    }

    @Override // kotlinx.coroutines.DisposableHandle
    public final void dispose() {
        Object state$external__kotlinx_coroutines__android_common__kotlinx_coroutines;
        Object next;
        LockFreeLinkedListNode lockFreeLinkedListNode;
        Removed removed;
        JobSupport job = getJob();
        do {
            state$external__kotlinx_coroutines__android_common__kotlinx_coroutines = job.getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines();
            if (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof JobNode) {
                if (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines != this) {
                    return;
                }
            } else if ((state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof Incomplete) && ((Incomplete) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines).getList() != null) {
                do {
                    next = getNext();
                    if (next instanceof Removed) {
                        LockFreeLinkedListNode lockFreeLinkedListNode2 = ((Removed) next).ref;
                        return;
                    } else if (next == this) {
                        LockFreeLinkedListNode lockFreeLinkedListNode3 = (LockFreeLinkedListNode) next;
                        return;
                    } else {
                        lockFreeLinkedListNode = (LockFreeLinkedListNode) next;
                        removed = lockFreeLinkedListNode._removedRef.value;
                        if (removed == null) {
                            removed = new Removed(lockFreeLinkedListNode);
                            lockFreeLinkedListNode._removedRef.lazySet(removed);
                        }
                    }
                } while (!this._next.compareAndSet(next, removed));
                lockFreeLinkedListNode.correctPrev();
                return;
            } else {
                return;
            }
        } while (!job._state.compareAndSet(state$external__kotlinx_coroutines__android_common__kotlinx_coroutines, JobSupportKt.EMPTY_ACTIVE));
    }
}
