package kotlinx.coroutines;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.ResultKt;
import kotlin.TypeCastException;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.internal.ConcurrentKt;
import kotlinx.coroutines.internal.LockFreeLinkedListKt;
import kotlinx.coroutines.internal.LockFreeLinkedListNode;
import kotlinx.coroutines.internal.OpDescriptor;
import kotlinx.coroutines.internal.Removed;
import kotlinx.coroutines.internal.StackTraceRecoveryKt;
import kotlinx.coroutines.internal.Symbol;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public class JobSupport implements Job, ChildJob, ParentJob {
    public static final AtomicReferenceFieldUpdater _state$FU = AtomicReferenceFieldUpdater.newUpdater(JobSupport.class, Object.class, "_state");
    public volatile Object _state;
    @Nullable
    public volatile ChildHandle parentHandle;

    /* loaded from: classes.dex */
    public static final class ChildCompletion extends JobNode<Job> {
        public final ChildHandleNode child;
        public final JobSupport parent;
        public final Object proposedUpdate;
        public final Finishing state;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ChildCompletion(@NotNull JobSupport jobSupport, @NotNull Finishing state, @NotNull ChildHandleNode childHandleNode, @Nullable Object obj) {
            super(childHandleNode.childJob);
            Intrinsics.checkParameterIsNotNull(state, "state");
            this.parent = jobSupport;
            this.state = state;
            this.child = childHandleNode;
            this.proposedUpdate = obj;
        }

        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Unit invoke(Throwable th) {
            invoke2(th);
            return Unit.INSTANCE;
        }

        @Override // kotlinx.coroutines.internal.LockFreeLinkedListNode
        @NotNull
        public String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ChildCompletion[");
            m.append(this.child);
            m.append(", ");
            m.append(this.proposedUpdate);
            m.append(']');
            return m.toString();
        }

        @Override // kotlinx.coroutines.CompletionHandlerBase
        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public void invoke2(@Nullable Throwable th) {
            JobSupport jobSupport = this.parent;
            Finishing finishing = this.state;
            ChildHandleNode childHandleNode = this.child;
            Object obj = this.proposedUpdate;
            if (jobSupport.getState$kotlinx_coroutines_core() == finishing) {
                ChildHandleNode nextChild = jobSupport.nextChild(childHandleNode);
                if (nextChild == null || !jobSupport.tryWaitForChild(finishing, nextChild, obj)) {
                    jobSupport.tryFinalizeFinishingState(finishing, obj, 0);
                    return;
                }
                return;
            }
            throw new IllegalArgumentException("Failed requirement.".toString());
        }
    }

    /* loaded from: classes.dex */
    public static final class Finishing implements Incomplete {
        public volatile Object _exceptionsHolder;
        public volatile boolean isCompleting;
        @NotNull
        public final NodeList list;
        @Nullable
        public volatile Throwable rootCause;

        public Finishing(@NotNull NodeList nodeList, boolean z, @Nullable Throwable th) {
            this.list = nodeList;
            this.isCompleting = z;
            this.rootCause = th;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Object] */
        public final void addExceptionLocked(@NotNull Throwable exception) {
            Intrinsics.checkParameterIsNotNull(exception, "exception");
            Throwable th = this.rootCause;
            if (th == null) {
                this.rootCause = exception;
            } else if (exception != th) {
                ?? r0 = this._exceptionsHolder;
                if (r0 == 0) {
                    this._exceptionsHolder = exception;
                } else if (r0 instanceof Throwable) {
                    if (exception != r0) {
                        ArrayList<Throwable> allocateList = allocateList();
                        allocateList.add(r0);
                        allocateList.add(exception);
                        this._exceptionsHolder = allocateList;
                    }
                } else if (r0 instanceof ArrayList) {
                    ((ArrayList) r0).add(exception);
                } else {
                    throw new IllegalStateException(("State is " + ((Object) r0)).toString());
                }
            }
        }

        public final ArrayList<Throwable> allocateList() {
            return new ArrayList<>(4);
        }

        @Override // kotlinx.coroutines.Incomplete
        @NotNull
        public NodeList getList() {
            return this.list;
        }

        @Override // kotlinx.coroutines.Incomplete
        public boolean isActive() {
            return this.rootCause == null;
        }

        public final boolean isCancelling() {
            return this.rootCause != null;
        }

        public final boolean isSealed() {
            return this._exceptionsHolder == JobSupportKt.SEALED;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object] */
        @NotNull
        public final List<Throwable> sealLocked(@Nullable Throwable th) {
            ArrayList<Throwable> arrayList;
            ?? r0 = this._exceptionsHolder;
            if (r0 == 0) {
                arrayList = allocateList();
            } else if (r0 instanceof Throwable) {
                ArrayList<Throwable> allocateList = allocateList();
                allocateList.add(r0);
                arrayList = allocateList;
            } else if (r0 instanceof ArrayList) {
                arrayList = (ArrayList) r0;
            } else {
                throw new IllegalStateException(("State is " + ((Object) r0)).toString());
            }
            Throwable th2 = this.rootCause;
            if (th2 != null) {
                arrayList.add(0, th2);
            }
            if (th != null && (!Intrinsics.areEqual(th, th2))) {
                arrayList.add(th);
            }
            this._exceptionsHolder = JobSupportKt.SEALED;
            return arrayList;
        }

        @NotNull
        public String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Finishing[cancelling=");
            m.append(isCancelling());
            m.append(", completing=");
            m.append(this.isCompleting);
            m.append(", rootCause=");
            m.append(this.rootCause);
            m.append(", exceptions=");
            m.append(this._exceptionsHolder);
            m.append(", list=");
            m.append(this.list);
            m.append(']');
            return m.toString();
        }
    }

    public JobSupport(boolean z) {
        Empty empty;
        if (z) {
            empty = JobSupportKt.EMPTY_ACTIVE;
        } else {
            empty = JobSupportKt.EMPTY_NEW;
        }
        this._state = empty;
    }

    public final boolean addLastAtomic(final Object obj, NodeList nodeList, final JobNode<?> jobNode) {
        boolean z;
        LockFreeLinkedListNode.CondAddOp jobSupport$addLastAtomic$$inlined$addLastIf$1 = new LockFreeLinkedListNode.CondAddOp(jobNode, jobNode, this, obj) { // from class: kotlinx.coroutines.JobSupport$addLastAtomic$$inlined$addLastIf$1
            public final /* synthetic */ Object $expect$inlined;
            public final /* synthetic */ JobSupport this$0;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(jobNode);
                this.this$0 = this;
                this.$expect$inlined = obj;
            }

            @Override // kotlinx.coroutines.internal.AtomicOp
            public Object prepare(LockFreeLinkedListNode lockFreeLinkedListNode) {
                LockFreeLinkedListNode affected = lockFreeLinkedListNode;
                Intrinsics.checkParameterIsNotNull(affected, "affected");
                if (this.this$0.getState$kotlinx_coroutines_core() == this.$expect$inlined) {
                    return null;
                }
                return LockFreeLinkedListKt.CONDITION_FALSE;
            }
        };
        do {
            Object prev = nodeList.getPrev();
            if (prev != null) {
                LockFreeLinkedListNode lockFreeLinkedListNode = (LockFreeLinkedListNode) prev;
                LockFreeLinkedListNode._prev$FU.lazySet(jobNode, lockFreeLinkedListNode);
                AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = LockFreeLinkedListNode._next$FU;
                atomicReferenceFieldUpdater.lazySet(jobNode, nodeList);
                jobSupport$addLastAtomic$$inlined$addLastIf$1.oldNext = nodeList;
                if (!atomicReferenceFieldUpdater.compareAndSet(lockFreeLinkedListNode, nodeList, jobSupport$addLastAtomic$$inlined$addLastIf$1)) {
                    z = false;
                } else {
                    z = jobSupport$addLastAtomic$$inlined$addLastIf$1.perform(lockFreeLinkedListNode) == null ? true : true;
                }
                if (z) {
                    return true;
                }
            } else {
                throw new TypeCastException("null cannot be cast to non-null type kotlinx.coroutines.internal.Node /* = kotlinx.coroutines.internal.LockFreeLinkedListNode */");
            }
        } while (!z);
        return false;
    }

    public final void addSuppressedExceptions(Throwable th, List<? extends Throwable> list) {
        if (list.size() > 1) {
            int size = list.size();
            int i = ConcurrentKt.$r8$clinit;
            Set newSetFromMap = Collections.newSetFromMap(new IdentityHashMap(size));
            Intrinsics.checkExpressionValueIsNotNull(newSetFromMap, "Collections.newSetFromMa…ityHashMap(expectedSize))");
            Throwable unwrap = StackTraceRecoveryKt.unwrap(th);
            for (Throwable th2 : list) {
                Throwable unwrap2 = StackTraceRecoveryKt.unwrap(th2);
                if (unwrap2 != th && unwrap2 != unwrap && !(unwrap2 instanceof CancellationException) && newSetFromMap.add(unwrap2)) {
                    ResultKt.addSuppressed(th, unwrap2);
                }
            }
        }
    }

    public void afterCompletionInternal(@Nullable Object obj, int i) {
    }

    @Override // kotlinx.coroutines.Job
    @NotNull
    public final ChildHandle attachChild(@NotNull ChildJob childJob) {
        DisposableHandle invokeOnCompletion$default = Job.DefaultImpls.invokeOnCompletion$default(this, true, false, new ChildHandleNode(this, childJob), 2, null);
        if (invokeOnCompletion$default != null) {
            return (ChildHandle) invokeOnCompletion$default;
        }
        throw new TypeCastException("null cannot be cast to non-null type kotlinx.coroutines.ChildHandle");
    }

    @Override // kotlinx.coroutines.Job
    public void cancel(@Nullable CancellationException cancellationException) {
        if (cancelImpl$kotlinx_coroutines_core(cancellationException)) {
            getHandlesException$kotlinx_coroutines_core();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:78:0x00de A[EDGE_INSN: B:78:0x00de->B:64:0x00de ?: BREAK  , SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0048 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean cancelImpl$kotlinx_coroutines_core(@org.jetbrains.annotations.Nullable java.lang.Object r11) {
        /*
            Method dump skipped, instructions count: 252
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.JobSupport.cancelImpl$kotlinx_coroutines_core(java.lang.Object):boolean");
    }

    public final boolean cancelParent(Throwable th) {
        if (isScopedCoroutine()) {
            return true;
        }
        boolean z = th instanceof CancellationException;
        ChildHandle childHandle = this.parentHandle;
        return (childHandle == null || childHandle == NonDisposableHandle.INSTANCE) ? z : childHandle.childCancelled(th) || z;
    }

    public boolean childCancelled(@NotNull Throwable th) {
        if (th instanceof CancellationException) {
            return true;
        }
        return cancelImpl$kotlinx_coroutines_core(th) && getHandlesException$kotlinx_coroutines_core();
    }

    public final void completeStateFinalization(Incomplete incomplete, Object obj, int i) {
        ChildHandle childHandle = this.parentHandle;
        if (childHandle != null) {
            childHandle.dispose();
            this.parentHandle = NonDisposableHandle.INSTANCE;
        }
        CompletionHandlerException completionHandlerException = null;
        CompletedExceptionally completedExceptionally = (CompletedExceptionally) (!(obj instanceof CompletedExceptionally) ? null : obj);
        Throwable th = completedExceptionally != null ? completedExceptionally.cause : null;
        if (incomplete instanceof JobNode) {
            try {
                ((JobNode) incomplete).invoke(th);
            } catch (Throwable th2) {
                handleOnCompletionException$kotlinx_coroutines_core(new CompletionHandlerException("Exception in completion handler " + incomplete + " for " + this, th2));
            }
        } else {
            NodeList list = incomplete.getList();
            if (list != null) {
                Object next = list.getNext();
                if (next != null) {
                    for (LockFreeLinkedListNode lockFreeLinkedListNode = (LockFreeLinkedListNode) next; !Intrinsics.areEqual(lockFreeLinkedListNode, list); lockFreeLinkedListNode = lockFreeLinkedListNode.getNextNode()) {
                        if (lockFreeLinkedListNode instanceof JobNode) {
                            JobNode jobNode = (JobNode) lockFreeLinkedListNode;
                            try {
                                jobNode.invoke(th);
                            } catch (Throwable th3) {
                                if (completionHandlerException != null) {
                                    ResultKt.addSuppressed(completionHandlerException, th3);
                                } else {
                                    completionHandlerException = new CompletionHandlerException("Exception in completion handler " + jobNode + " for " + this, th3);
                                }
                            }
                        }
                    }
                    if (completionHandlerException != null) {
                        handleOnCompletionException$kotlinx_coroutines_core(completionHandlerException);
                    }
                } else {
                    throw new TypeCastException("null cannot be cast to non-null type kotlinx.coroutines.internal.Node /* = kotlinx.coroutines.internal.LockFreeLinkedListNode */");
                }
            }
        }
        afterCompletionInternal(obj, i);
    }

    public final Throwable createCauseException(Object obj) {
        if (obj != null ? obj instanceof Throwable : true) {
            return obj != null ? (Throwable) obj : new JobCancellationException("Job was cancelled", null, this);
        }
        if (obj != null) {
            return ((ParentJob) obj).getChildJobCancellationCause();
        }
        throw new TypeCastException("null cannot be cast to non-null type kotlinx.coroutines.ParentJob");
    }

    @Override // kotlin.coroutines.CoroutineContext
    public <R> R fold(R r, @NotNull Function2<? super R, ? super CoroutineContext.Element, ? extends R> operation) {
        Intrinsics.checkParameterIsNotNull(operation, "operation");
        Intrinsics.checkParameterIsNotNull(operation, "operation");
        return (R) CoroutineContext.Element.DefaultImpls.fold(this, r, operation);
    }

    @Override // kotlin.coroutines.CoroutineContext.Element, kotlin.coroutines.CoroutineContext
    @Nullable
    public <E extends CoroutineContext.Element> E get(@NotNull CoroutineContext.Key<E> key) {
        Intrinsics.checkParameterIsNotNull(key, "key");
        Intrinsics.checkParameterIsNotNull(key, "key");
        return (E) CoroutineContext.Element.DefaultImpls.get(this, key);
    }

    @Override // kotlinx.coroutines.Job
    @NotNull
    public final CancellationException getCancellationException() {
        Object state$kotlinx_coroutines_core = getState$kotlinx_coroutines_core();
        if (state$kotlinx_coroutines_core instanceof Finishing) {
            Throwable th = ((Finishing) state$kotlinx_coroutines_core).rootCause;
            if (th != null) {
                StringBuilder sb = new StringBuilder();
                Intrinsics.checkParameterIsNotNull(this, "$this$classSimpleName");
                sb.append(getClass().getSimpleName());
                sb.append(" is cancelling");
                return toCancellationException(th, sb.toString());
            }
            throw new IllegalStateException(("Job is still new or active: " + this).toString());
        } else if (state$kotlinx_coroutines_core instanceof Incomplete) {
            throw new IllegalStateException(("Job is still new or active: " + this).toString());
        } else if (state$kotlinx_coroutines_core instanceof CompletedExceptionally) {
            return toCancellationException(((CompletedExceptionally) state$kotlinx_coroutines_core).cause, null);
        } else {
            StringBuilder sb2 = new StringBuilder();
            Intrinsics.checkParameterIsNotNull(this, "$this$classSimpleName");
            sb2.append(getClass().getSimpleName());
            sb2.append(" has completed normally");
            return new JobCancellationException(sb2.toString(), null, this);
        }
    }

    @Override // kotlinx.coroutines.ParentJob
    @NotNull
    public CancellationException getChildJobCancellationCause() {
        Throwable th;
        Object state$kotlinx_coroutines_core = getState$kotlinx_coroutines_core();
        CancellationException cancellationException = null;
        if (state$kotlinx_coroutines_core instanceof Finishing) {
            th = ((Finishing) state$kotlinx_coroutines_core).rootCause;
        } else if (state$kotlinx_coroutines_core instanceof CompletedExceptionally) {
            th = ((CompletedExceptionally) state$kotlinx_coroutines_core).cause;
        } else if (!(state$kotlinx_coroutines_core instanceof Incomplete)) {
            th = null;
        } else {
            throw new IllegalStateException(("Cannot be cancelling child in this state: " + state$kotlinx_coroutines_core).toString());
        }
        if (th instanceof CancellationException) {
            cancellationException = th;
        }
        CancellationException cancellationException2 = cancellationException;
        if (cancellationException2 != null) {
            return cancellationException2;
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Parent job is ");
        m.append(stateString(state$kotlinx_coroutines_core));
        return new JobCancellationException(m.toString(), th, this);
    }

    public boolean getHandlesException$kotlinx_coroutines_core() {
        return true;
    }

    @Override // kotlin.coroutines.CoroutineContext.Element
    @NotNull
    public final CoroutineContext.Key<?> getKey() {
        return Job.Key;
    }

    public boolean getOnCancelComplete$kotlinx_coroutines_core() {
        return false;
    }

    public final NodeList getOrPromoteCancellingList(Incomplete incomplete) {
        NodeList list = incomplete.getList();
        if (list != null) {
            return list;
        }
        if (incomplete instanceof Empty) {
            return new NodeList();
        }
        if (incomplete instanceof JobNode) {
            promoteSingleToNodeList((JobNode) incomplete);
            return null;
        }
        throw new IllegalStateException(("State should have list: " + incomplete).toString());
    }

    @Nullable
    public final Object getState$kotlinx_coroutines_core() {
        while (true) {
            Object obj = this._state;
            if (!(obj instanceof OpDescriptor)) {
                return obj;
            }
            ((OpDescriptor) obj).perform(this);
        }
    }

    public boolean handleJobException(@NotNull Throwable th) {
        return false;
    }

    public void handleOnCompletionException$kotlinx_coroutines_core(@NotNull Throwable th) {
        throw th;
    }

    public final void initParentJobInternal$kotlinx_coroutines_core(@Nullable Job job) {
        boolean z = DebugKt.DEBUG;
        if (job == null) {
            this.parentHandle = NonDisposableHandle.INSTANCE;
            return;
        }
        job.start();
        ChildHandle attachChild = job.attachChild(this);
        this.parentHandle = attachChild;
        if (!(getState$kotlinx_coroutines_core() instanceof Incomplete)) {
            attachChild.dispose();
            this.parentHandle = NonDisposableHandle.INSTANCE;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v3, types: [kotlinx.coroutines.InactiveNodeList] */
    @Override // kotlinx.coroutines.Job
    @NotNull
    public final DisposableHandle invokeOnCompletion(boolean z, boolean z2, @NotNull Function1<? super Throwable, Unit> handler) {
        Throwable th;
        Intrinsics.checkParameterIsNotNull(handler, "handler");
        Throwable th2 = null;
        JobNode<?> jobNode = null;
        while (true) {
            Object state$kotlinx_coroutines_core = getState$kotlinx_coroutines_core();
            if (state$kotlinx_coroutines_core instanceof Empty) {
                Empty empty = (Empty) state$kotlinx_coroutines_core;
                if (empty.isActive) {
                    if (jobNode == null) {
                        jobNode = makeNode(handler, z);
                    }
                    if (_state$FU.compareAndSet(this, state$kotlinx_coroutines_core, jobNode)) {
                        return jobNode;
                    }
                } else {
                    NodeList nodeList = new NodeList();
                    if (!empty.isActive) {
                        nodeList = new InactiveNodeList(nodeList);
                    }
                    _state$FU.compareAndSet(this, empty, nodeList);
                }
            } else if (state$kotlinx_coroutines_core instanceof Incomplete) {
                NodeList list = ((Incomplete) state$kotlinx_coroutines_core).getList();
                if (list != null) {
                    DisposableHandle disposableHandle = NonDisposableHandle.INSTANCE;
                    if (!z || !(state$kotlinx_coroutines_core instanceof Finishing)) {
                        th = null;
                    } else {
                        synchronized (state$kotlinx_coroutines_core) {
                            th = ((Finishing) state$kotlinx_coroutines_core).rootCause;
                            if (th == null || ((handler instanceof ChildHandleNode) && !((Finishing) state$kotlinx_coroutines_core).isCompleting)) {
                                if (jobNode == null) {
                                    jobNode = makeNode(handler, z);
                                }
                                if (addLastAtomic(state$kotlinx_coroutines_core, list, jobNode)) {
                                    if (th == null) {
                                        return jobNode;
                                    }
                                    disposableHandle = jobNode;
                                }
                            }
                        }
                    }
                    if (th != null) {
                        if (z2) {
                            handler.invoke(th);
                        }
                        return disposableHandle;
                    }
                    if (jobNode == null) {
                        jobNode = makeNode(handler, z);
                    }
                    if (addLastAtomic(state$kotlinx_coroutines_core, list, jobNode)) {
                        return jobNode;
                    }
                } else if (state$kotlinx_coroutines_core != null) {
                    promoteSingleToNodeList((JobNode) state$kotlinx_coroutines_core);
                } else {
                    throw new TypeCastException("null cannot be cast to non-null type kotlinx.coroutines.JobNode<*>");
                }
            } else {
                if (z2) {
                    if (!(state$kotlinx_coroutines_core instanceof CompletedExceptionally)) {
                        state$kotlinx_coroutines_core = null;
                    }
                    CompletedExceptionally completedExceptionally = (CompletedExceptionally) state$kotlinx_coroutines_core;
                    if (completedExceptionally != null) {
                        th2 = completedExceptionally.cause;
                    }
                    handler.invoke(th2);
                }
                return NonDisposableHandle.INSTANCE;
            }
        }
    }

    @Override // kotlinx.coroutines.Job
    public boolean isActive() {
        Object state$kotlinx_coroutines_core = getState$kotlinx_coroutines_core();
        return (state$kotlinx_coroutines_core instanceof Incomplete) && ((Incomplete) state$kotlinx_coroutines_core).isActive();
    }

    public boolean isScopedCoroutine() {
        return this instanceof BlockingCoroutine;
    }

    public final boolean makeCompletingOnce$kotlinx_coroutines_core(@Nullable Object obj, int i) {
        int tryMakeCompleting;
        do {
            tryMakeCompleting = tryMakeCompleting(getState$kotlinx_coroutines_core(), obj, i);
            if (tryMakeCompleting == 0) {
                String str = "Job " + this + " is already complete or completing, but is being completed with " + obj;
                Throwable th = null;
                if (!(obj instanceof CompletedExceptionally)) {
                    obj = null;
                }
                CompletedExceptionally completedExceptionally = (CompletedExceptionally) obj;
                if (completedExceptionally != null) {
                    th = completedExceptionally.cause;
                }
                throw new IllegalStateException(str, th);
            } else if (tryMakeCompleting == 1) {
                return true;
            } else {
                if (tryMakeCompleting == 2) {
                    return false;
                }
            }
        } while (tryMakeCompleting == 3);
        throw new IllegalStateException("unexpected result".toString());
    }

    public final JobNode<?> makeNode(Function1<? super Throwable, Unit> function1, boolean z) {
        boolean z2 = true;
        JobCancellingNode jobCancellingNode = null;
        if (z) {
            if (function1 instanceof JobCancellingNode) {
                jobCancellingNode = function1;
            }
            JobCancellingNode jobCancellingNode2 = jobCancellingNode;
            if (jobCancellingNode2 == null) {
                return new InvokeOnCancelling(this, function1);
            }
            if (jobCancellingNode2.job != this) {
                z2 = false;
            }
            if (z2) {
                return jobCancellingNode2;
            }
            throw new IllegalArgumentException("Failed requirement.".toString());
        }
        if (function1 instanceof JobNode) {
            jobCancellingNode = function1;
        }
        JobNode<?> jobNode = jobCancellingNode;
        if (jobNode == null) {
            return new InvokeOnCompletion(this, function1);
        }
        if (jobNode.job != this || (jobNode instanceof JobCancellingNode)) {
            z2 = false;
        }
        if (z2) {
            return jobNode;
        }
        throw new IllegalArgumentException("Failed requirement.".toString());
    }

    @Override // kotlin.coroutines.CoroutineContext
    @NotNull
    public CoroutineContext minusKey(@NotNull CoroutineContext.Key<?> key) {
        Intrinsics.checkParameterIsNotNull(key, "key");
        Intrinsics.checkParameterIsNotNull(key, "key");
        return CoroutineContext.Element.DefaultImpls.minusKey(this, key);
    }

    @NotNull
    public String nameString$kotlinx_coroutines_core() {
        Intrinsics.checkParameterIsNotNull(this, "$this$classSimpleName");
        return getClass().getSimpleName();
    }

    public final ChildHandleNode nextChild(@NotNull LockFreeLinkedListNode lockFreeLinkedListNode) {
        while (lockFreeLinkedListNode.getNext() instanceof Removed) {
            lockFreeLinkedListNode = LockFreeLinkedListKt.unwrap(lockFreeLinkedListNode.getPrev());
        }
        while (true) {
            lockFreeLinkedListNode = lockFreeLinkedListNode.getNextNode();
            if (!(lockFreeLinkedListNode.getNext() instanceof Removed)) {
                if (lockFreeLinkedListNode instanceof ChildHandleNode) {
                    return (ChildHandleNode) lockFreeLinkedListNode;
                }
                if (lockFreeLinkedListNode instanceof NodeList) {
                    return null;
                }
            }
        }
    }

    public final void notifyCancelling(NodeList nodeList, Throwable th) {
        Object next = nodeList.getNext();
        if (next != null) {
            CompletionHandlerException completionHandlerException = null;
            for (LockFreeLinkedListNode lockFreeLinkedListNode = (LockFreeLinkedListNode) next; !Intrinsics.areEqual(lockFreeLinkedListNode, nodeList); lockFreeLinkedListNode = lockFreeLinkedListNode.getNextNode()) {
                if (lockFreeLinkedListNode instanceof JobCancellingNode) {
                    JobNode jobNode = (JobNode) lockFreeLinkedListNode;
                    try {
                        jobNode.invoke(th);
                    } catch (Throwable th2) {
                        if (completionHandlerException != null) {
                            ResultKt.addSuppressed(completionHandlerException, th2);
                        } else {
                            completionHandlerException = new CompletionHandlerException("Exception in completion handler " + jobNode + " for " + this, th2);
                        }
                    }
                }
            }
            if (completionHandlerException != null) {
                handleOnCompletionException$kotlinx_coroutines_core(completionHandlerException);
            }
            cancelParent(th);
            return;
        }
        throw new TypeCastException("null cannot be cast to non-null type kotlinx.coroutines.internal.Node /* = kotlinx.coroutines.internal.LockFreeLinkedListNode */");
    }

    public void onCompletionInternal(@Nullable Object obj) {
    }

    public void onStartInternal$kotlinx_coroutines_core() {
    }

    @Override // kotlinx.coroutines.ChildJob
    public final void parentCancelled(@NotNull ParentJob parentJob) {
        Intrinsics.checkParameterIsNotNull(parentJob, "parentJob");
        cancelImpl$kotlinx_coroutines_core(parentJob);
    }

    @Override // kotlin.coroutines.CoroutineContext
    @NotNull
    public CoroutineContext plus(@NotNull CoroutineContext context) {
        Intrinsics.checkParameterIsNotNull(context, "context");
        Intrinsics.checkParameterIsNotNull(context, "context");
        return CoroutineContext.Element.DefaultImpls.plus(this, context);
    }

    public final void promoteSingleToNodeList(JobNode<?> jobNode) {
        NodeList nodeList = new NodeList();
        LockFreeLinkedListNode._prev$FU.lazySet(nodeList, jobNode);
        LockFreeLinkedListNode._next$FU.lazySet(nodeList, jobNode);
        while (true) {
            if (jobNode.getNext() == jobNode) {
                if (LockFreeLinkedListNode._next$FU.compareAndSet(jobNode, jobNode, nodeList)) {
                    nodeList.finishAdd(jobNode);
                    break;
                }
            } else {
                break;
            }
        }
        _state$FU.compareAndSet(this, jobNode, jobNode.getNextNode());
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0040 A[SYNTHETIC] */
    @Override // kotlinx.coroutines.Job
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean start() {
        /*
            r6 = this;
        L0:
            java.lang.Object r0 = r6.getState$kotlinx_coroutines_core()
            boolean r1 = r0 instanceof kotlinx.coroutines.Empty
            r2 = -1
            r3 = 0
            r4 = 1
            if (r1 == 0) goto L22
            r1 = r0
            kotlinx.coroutines.Empty r1 = (kotlinx.coroutines.Empty) r1
            boolean r1 = r1.isActive
            if (r1 == 0) goto L13
            goto L39
        L13:
            java.util.concurrent.atomic.AtomicReferenceFieldUpdater r1 = kotlinx.coroutines.JobSupport._state$FU
            kotlinx.coroutines.Empty r5 = kotlinx.coroutines.JobSupportKt.EMPTY_ACTIVE
            boolean r0 = r1.compareAndSet(r6, r0, r5)
            if (r0 != 0) goto L1e
            goto L3a
        L1e:
            r6.onStartInternal$kotlinx_coroutines_core()
            goto L37
        L22:
            boolean r1 = r0 instanceof kotlinx.coroutines.InactiveNodeList
            if (r1 == 0) goto L39
            java.util.concurrent.atomic.AtomicReferenceFieldUpdater r1 = kotlinx.coroutines.JobSupport._state$FU
            r5 = r0
            kotlinx.coroutines.InactiveNodeList r5 = (kotlinx.coroutines.InactiveNodeList) r5
            kotlinx.coroutines.NodeList r5 = r5.list
            boolean r0 = r1.compareAndSet(r6, r0, r5)
            if (r0 != 0) goto L34
            goto L3a
        L34:
            r6.onStartInternal$kotlinx_coroutines_core()
        L37:
            r2 = r4
            goto L3a
        L39:
            r2 = r3
        L3a:
            if (r2 == 0) goto L40
            if (r2 == r4) goto L3f
            goto L0
        L3f:
            return r4
        L40:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.JobSupport.start():boolean");
    }

    public final String stateString(Object obj) {
        if (!(obj instanceof Finishing)) {
            return obj instanceof Incomplete ? ((Incomplete) obj).isActive() ? "Active" : "New" : obj instanceof CompletedExceptionally ? "Cancelled" : "Completed";
        }
        Finishing finishing = (Finishing) obj;
        return finishing.isCancelling() ? "Cancelling" : finishing.isCompleting ? "Completing" : "Active";
    }

    @NotNull
    public final CancellationException toCancellationException(@NotNull Throwable classSimpleName, @Nullable String str) {
        Intrinsics.checkParameterIsNotNull(classSimpleName, "$this$toCancellationException");
        CancellationException cancellationException = (CancellationException) (!(classSimpleName instanceof CancellationException) ? null : classSimpleName);
        if (cancellationException == null) {
            if (str == null) {
                StringBuilder sb = new StringBuilder();
                Intrinsics.checkParameterIsNotNull(classSimpleName, "$this$classSimpleName");
                sb.append(classSimpleName.getClass().getSimpleName());
                sb.append(" was cancelled");
                str = sb.toString();
            }
            cancellationException = new JobCancellationException(str, classSimpleName, this);
        }
        return cancellationException;
    }

    @NotNull
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(nameString$kotlinx_coroutines_core() + '{' + stateString(getState$kotlinx_coroutines_core()) + '}');
        sb.append('@');
        sb.append(TimeSourceKt.getHexAddress(this));
        return sb.toString();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean tryFinalizeFinishingState(Finishing finishing, Object obj, int i) {
        if (!(getState$kotlinx_coroutines_core() == finishing)) {
            throw new IllegalArgumentException("Failed requirement.".toString());
        } else if (!(!finishing.isSealed())) {
            throw new IllegalArgumentException("Failed requirement.".toString());
        } else if (finishing.isCompleting) {
            Throwable th = null;
            CompletedExceptionally completedExceptionally = (CompletedExceptionally) (!(obj instanceof CompletedExceptionally) ? null : obj);
            Throwable th2 = completedExceptionally != null ? completedExceptionally.cause : null;
            synchronized (finishing) {
                List<Throwable> sealLocked = finishing.sealLocked(th2);
                if (!sealLocked.isEmpty()) {
                    Iterator<T> it = sealLocked.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        Object next = it.next();
                        if (!(((Throwable) next) instanceof CancellationException)) {
                            th = next;
                            break;
                        }
                    }
                    th = th;
                    if (th == null) {
                        th = sealLocked.get(0);
                    }
                } else if (finishing.isCancelling()) {
                    th = new JobCancellationException("Job was cancelled", null, this);
                }
                if (th != null) {
                    addSuppressedExceptions(th, sealLocked);
                }
            }
            if (!(th == null || th == th2)) {
                obj = new CompletedExceptionally(th, false, 2);
            }
            if (th != null) {
                if (cancelParent(th) || handleJobException(th)) {
                    if (obj != null) {
                        CompletedExceptionally._handled$FU.compareAndSet((CompletedExceptionally) obj, 0, 1);
                    } else {
                        throw new TypeCastException("null cannot be cast to non-null type kotlinx.coroutines.CompletedExceptionally");
                    }
                }
            }
            onCompletionInternal(obj);
            if (_state$FU.compareAndSet(this, finishing, obj instanceof Incomplete ? new IncompleteStateBox((Incomplete) obj) : obj)) {
                completeStateFinalization(finishing, obj, i);
                return true;
            }
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unexpected state: ");
            m.append(this._state);
            m.append(", expected: ");
            m.append(finishing);
            m.append(", update: ");
            m.append(obj);
            throw new IllegalArgumentException(m.toString().toString());
        } else {
            throw new IllegalArgumentException("Failed requirement.".toString());
        }
    }

    public final int tryMakeCompleting(Object obj, Object obj2, int i) {
        boolean z = false;
        if (!(obj instanceof Incomplete)) {
            return 0;
        }
        if (((obj instanceof Empty) || (obj instanceof JobNode)) && !(obj instanceof ChildHandleNode) && !(obj2 instanceof CompletedExceptionally)) {
            Incomplete incomplete = (Incomplete) obj;
            boolean z2 = DebugKt.DEBUG;
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = _state$FU;
            Symbol symbol = JobSupportKt.SEALED;
            if (atomicReferenceFieldUpdater.compareAndSet(this, incomplete, obj2 instanceof Incomplete ? new IncompleteStateBox((Incomplete) obj2) : obj2)) {
                onCompletionInternal(obj2);
                completeStateFinalization(incomplete, obj2, i);
                z = true;
            }
            return !z ? 3 : 1;
        }
        Incomplete incomplete2 = (Incomplete) obj;
        NodeList orPromoteCancellingList = getOrPromoteCancellingList(incomplete2);
        if (orPromoteCancellingList != null) {
            ChildHandleNode childHandleNode = null;
            Finishing finishing = (Finishing) (!(incomplete2 instanceof Finishing) ? null : incomplete2);
            if (finishing == null) {
                finishing = new Finishing(orPromoteCancellingList, false, null);
            }
            synchronized (finishing) {
                if (finishing.isCompleting) {
                    return 0;
                }
                finishing.isCompleting = true;
                if (finishing == incomplete2 || _state$FU.compareAndSet(this, incomplete2, finishing)) {
                    if (!finishing.isSealed()) {
                        boolean isCancelling = finishing.isCancelling();
                        CompletedExceptionally completedExceptionally = (CompletedExceptionally) (!(obj2 instanceof CompletedExceptionally) ? null : obj2);
                        if (completedExceptionally != null) {
                            finishing.addExceptionLocked(completedExceptionally.cause);
                        }
                        Throwable th = finishing.rootCause;
                        if (!(!isCancelling)) {
                            th = null;
                        }
                        if (th != null) {
                            notifyCancelling(orPromoteCancellingList, th);
                        }
                        ChildHandleNode childHandleNode2 = (ChildHandleNode) (!(incomplete2 instanceof ChildHandleNode) ? null : incomplete2);
                        if (childHandleNode2 != null) {
                            childHandleNode = childHandleNode2;
                        } else {
                            NodeList list = incomplete2.getList();
                            if (list != null) {
                                childHandleNode = nextChild(list);
                            }
                        }
                        if (childHandleNode != null && tryWaitForChild(finishing, childHandleNode, obj2)) {
                            return 2;
                        }
                        tryFinalizeFinishingState(finishing, obj2, i);
                        return 1;
                    }
                    throw new IllegalArgumentException("Failed requirement.".toString());
                }
            }
        }
        return 3;
    }

    public final boolean tryWaitForChild(Finishing finishing, ChildHandleNode childHandleNode, Object obj) {
        while (Job.DefaultImpls.invokeOnCompletion$default(childHandleNode.childJob, false, false, new ChildCompletion(this, finishing, childHandleNode, obj), 1, null) == NonDisposableHandle.INSTANCE) {
            childHandleNode = nextChild(childHandleNode);
            if (childHandleNode == null) {
                return false;
            }
        }
        return true;
    }
}
