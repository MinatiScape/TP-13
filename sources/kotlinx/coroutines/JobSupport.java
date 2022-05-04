package kotlinx.coroutines;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.CancellationException;
import kotlin.ExceptionsKt;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.atomicfu.AtomicBoolean;
import kotlinx.atomicfu.AtomicFU;
import kotlinx.atomicfu.AtomicRef;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.internal.LockFreeLinkedListKt;
import kotlinx.coroutines.internal.LockFreeLinkedListNode;
import kotlinx.coroutines.internal.OpDescriptor;
import kotlinx.coroutines.internal.StackTraceRecoveryKt;
import kotlinx.coroutines.internal.Symbol;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: JobSupport.kt */
/* loaded from: classes.dex */
public class JobSupport implements Job, ChildJob, ParentJob {
    @NotNull
    public final AtomicRef<ChildHandle> _parentHandle;
    @NotNull
    public final AtomicRef<Object> _state;

    /* compiled from: JobSupport.kt */
    /* loaded from: classes.dex */
    public static final class ChildCompletion extends JobNode {
        @NotNull
        public final ChildHandleNode child;
        @NotNull
        public final JobSupport parent;
        @Nullable
        public final Object proposedUpdate;
        @NotNull
        public final Finishing state;

        @Override // kotlin.jvm.functions.Function1
        public final /* bridge */ /* synthetic */ Unit invoke(Throwable th) {
            invoke2(th);
            return Unit.INSTANCE;
        }

        public ChildCompletion(@NotNull JobSupport parent, @NotNull Finishing state, @NotNull ChildHandleNode childHandleNode, @Nullable Object obj) {
            Intrinsics.checkNotNullParameter(parent, "parent");
            Intrinsics.checkNotNullParameter(state, "state");
            this.parent = parent;
            this.state = state;
            this.child = childHandleNode;
            this.proposedUpdate = obj;
        }

        @Override // kotlinx.coroutines.CompletionHandlerBase
        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(@Nullable Throwable th) {
            JobSupport jobSupport = this.parent;
            Finishing finishing = this.state;
            ChildHandleNode childHandleNode = this.child;
            Object obj = this.proposedUpdate;
            jobSupport.getClass();
            boolean z = DebugKt.DEBUG;
            ChildHandleNode nextChild = JobSupport.nextChild(childHandleNode);
            if (nextChild == null || !jobSupport.tryWaitForChild(finishing, nextChild, obj)) {
                jobSupport.afterCompletion(jobSupport.finalizeFinishingState(finishing, obj));
            }
        }
    }

    /* compiled from: JobSupport.kt */
    /* loaded from: classes.dex */
    public static final class Finishing implements Incomplete {
        @NotNull
        public final AtomicRef<Throwable> _rootCause;
        @NotNull
        public final NodeList list;
        @NotNull
        public final AtomicBoolean _isCompleting = new AtomicBoolean(false);
        @NotNull
        public final AtomicRef<Object> _exceptionsHolder = new AtomicRef<>(null);

        public final void addExceptionLocked(@NotNull Throwable exception) {
            Intrinsics.checkNotNullParameter(exception, "exception");
            Throwable rootCause = getRootCause();
            if (rootCause == null) {
                this._rootCause.setValue(exception);
            } else if (exception != rootCause) {
                Object obj = this._exceptionsHolder.value;
                if (obj == null) {
                    this._exceptionsHolder.setValue(exception);
                } else if (obj instanceof Throwable) {
                    if (exception != obj) {
                        ArrayList arrayList = new ArrayList(4);
                        arrayList.add(obj);
                        arrayList.add(exception);
                        this._exceptionsHolder.setValue(arrayList);
                    }
                } else if (obj instanceof ArrayList) {
                    ((ArrayList) obj).add(exception);
                } else {
                    throw new IllegalStateException(Intrinsics.stringPlus("State is ", obj).toString());
                }
            }
        }

        @Nullable
        public final Throwable getRootCause() {
            return this._rootCause.value;
        }

        @NotNull
        public final ArrayList sealLocked(@Nullable Throwable th) {
            ArrayList arrayList;
            Object obj = this._exceptionsHolder.value;
            if (obj == null) {
                arrayList = new ArrayList(4);
            } else if (obj instanceof Throwable) {
                ArrayList arrayList2 = new ArrayList(4);
                arrayList2.add(obj);
                arrayList = arrayList2;
            } else if (obj instanceof ArrayList) {
                arrayList = (ArrayList) obj;
            } else {
                throw new IllegalStateException(Intrinsics.stringPlus("State is ", obj).toString());
            }
            Throwable rootCause = getRootCause();
            if (rootCause != null) {
                arrayList.add(0, rootCause);
            }
            if (th != null && !Intrinsics.areEqual(th, rootCause)) {
                arrayList.add(th);
            }
            this._exceptionsHolder.setValue(JobSupportKt.SEALED);
            return arrayList;
        }

        @NotNull
        public final String toString() {
            boolean z;
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Finishing[cancelling=");
            m.append(isCancelling());
            m.append(", completing=");
            if (this._isCompleting._value != 0) {
                z = true;
            } else {
                z = false;
            }
            m.append(z);
            m.append(", rootCause=");
            m.append(getRootCause());
            m.append(", exceptions=");
            m.append(this._exceptionsHolder.value);
            m.append(", list=");
            m.append(this.list);
            m.append(']');
            return m.toString();
        }

        public Finishing(@NotNull NodeList nodeList, @Nullable Throwable th) {
            this.list = nodeList;
            this._rootCause = new AtomicRef<>(th);
        }

        @Override // kotlinx.coroutines.Incomplete
        public final boolean isActive() {
            if (getRootCause() == null) {
                return true;
            }
            return false;
        }

        public final boolean isCancelling() {
            if (getRootCause() != null) {
                return true;
            }
            return false;
        }

        @Override // kotlinx.coroutines.Incomplete
        @NotNull
        public final NodeList getList() {
            return this.list;
        }
    }

    public void afterCompletion(@Nullable Object obj) {
    }

    @NotNull
    public String cancellationExceptionMessage() {
        return "Job was cancelled";
    }

    public boolean getHandlesException$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        return true;
    }

    public boolean getOnCancelComplete$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        return false;
    }

    public boolean handleJobException(@NotNull Throwable th) {
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v3, types: [kotlinx.coroutines.InactiveNodeList] */
    @Override // kotlinx.coroutines.Job
    @NotNull
    public final DisposableHandle invokeOnCompletion(boolean z, boolean z2, @NotNull JobNode jobNode) {
        JobNode jobNode2;
        CompletedExceptionally completedExceptionally;
        Throwable th;
        boolean z3;
        Throwable th2 = null;
        if (z) {
            if (jobNode instanceof JobCancellingNode) {
                jobNode2 = (JobCancellingNode) jobNode;
            } else {
                jobNode2 = null;
            }
            if (jobNode2 == null) {
                jobNode2 = new InvokeOnCancelling(jobNode);
            }
        } else {
            boolean z4 = DebugKt.DEBUG;
            jobNode2 = jobNode;
        }
        jobNode2.job = this;
        while (true) {
            Object state$external__kotlinx_coroutines__android_common__kotlinx_coroutines = getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines();
            if (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof Empty) {
                Empty empty = (Empty) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines;
                if (!empty.isActive) {
                    NodeList nodeList = new NodeList();
                    if (!empty.isActive) {
                        nodeList = new InactiveNodeList(nodeList);
                    }
                    this._state.compareAndSet(empty, nodeList);
                } else if (this._state.compareAndSet(state$external__kotlinx_coroutines__android_common__kotlinx_coroutines, jobNode2)) {
                    return jobNode2;
                }
            } else if (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof Incomplete) {
                NodeList list = ((Incomplete) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines).getList();
                if (list != null) {
                    DisposableHandle disposableHandle = NonDisposableHandle.INSTANCE;
                    if (!z || !(state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof Finishing)) {
                        th = null;
                    } else {
                        synchronized (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines) {
                            th = ((Finishing) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines).getRootCause();
                            if (th != null) {
                                if (jobNode instanceof ChildHandleNode) {
                                    if (((Finishing) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines)._isCompleting._value != 0) {
                                        z3 = true;
                                    } else {
                                        z3 = false;
                                    }
                                    if (z3) {
                                    }
                                }
                            }
                            if (addLastAtomic(state$external__kotlinx_coroutines__android_common__kotlinx_coroutines, list, jobNode2)) {
                                if (th == null) {
                                    return jobNode2;
                                }
                                disposableHandle = jobNode2;
                            }
                        }
                    }
                    if (th != null) {
                        if (z2) {
                            jobNode.invoke((JobNode) th);
                        }
                        return disposableHandle;
                    } else if (addLastAtomic(state$external__kotlinx_coroutines__android_common__kotlinx_coroutines, list, jobNode2)) {
                        return jobNode2;
                    }
                } else if (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines != null) {
                    promoteSingleToNodeList((JobNode) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines);
                } else {
                    throw new NullPointerException("null cannot be cast to non-null type kotlinx.coroutines.JobNode");
                }
            } else {
                if (z2) {
                    if (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof CompletedExceptionally) {
                        completedExceptionally = (CompletedExceptionally) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines;
                    } else {
                        completedExceptionally = null;
                    }
                    if (completedExceptionally != null) {
                        th2 = completedExceptionally.cause;
                    }
                    jobNode.invoke((JobNode) th2);
                }
                return NonDisposableHandle.INSTANCE;
            }
        }
    }

    public boolean isScopedCoroutine() {
        return this instanceof BlockingCoroutine;
    }

    public void onCompletionInternal(@Nullable Object obj) {
    }

    public void onStart() {
    }

    public static String stateString(Object obj) {
        boolean z;
        if (obj instanceof Finishing) {
            Finishing finishing = (Finishing) obj;
            if (finishing.isCancelling()) {
                return "Cancelling";
            }
            if (finishing._isCompleting._value != 0) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                return "Completing";
            }
        } else if (obj instanceof Incomplete) {
            if (!((Incomplete) obj).isActive()) {
                return "New";
            }
        } else if (obj instanceof CompletedExceptionally) {
            return "Cancelled";
        } else {
            return "Completed";
        }
        return "Active";
    }

    public final boolean addLastAtomic(final Object obj, NodeList nodeList, final JobNode jobNode) {
        boolean z;
        LockFreeLinkedListNode.CondAddOp jobSupport$addLastAtomic$$inlined$addLastIf$1 = new LockFreeLinkedListNode.CondAddOp(jobNode) { // from class: kotlinx.coroutines.JobSupport$addLastAtomic$$inlined$addLastIf$1
            @Override // kotlinx.coroutines.internal.AtomicOp
            public final Symbol prepare(Object obj2) {
                boolean z2;
                LockFreeLinkedListNode affected = (LockFreeLinkedListNode) obj2;
                Intrinsics.checkNotNullParameter(affected, "affected");
                if (this.getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines() == obj) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                if (z2) {
                    return null;
                }
                return LockFreeLinkedListKt.CONDITION_FALSE;
            }
        };
        do {
            LockFreeLinkedListNode prevNode = nodeList.getPrevNode();
            jobNode._prev.lazySet(prevNode);
            jobNode._next.lazySet(nodeList);
            jobSupport$addLastAtomic$$inlined$addLastIf$1.oldNext = nodeList;
            if (!prevNode._next.compareAndSet(nodeList, jobSupport$addLastAtomic$$inlined$addLastIf$1)) {
                z = false;
            } else if (jobSupport$addLastAtomic$$inlined$addLastIf$1.perform(prevNode) == null) {
                z = true;
            } else {
                z = true;
            }
            if (z) {
                return true;
            }
        } while (!z);
        return false;
    }

    @Override // kotlinx.coroutines.Job
    @NotNull
    public final ChildHandle attachChild(@NotNull JobSupport jobSupport) {
        return (ChildHandle) invokeOnCompletion(true, true, new ChildHandleNode(jobSupport));
    }

    @Override // kotlinx.coroutines.Job
    public final void cancel(@Nullable CancellationException cancellationException) {
        if (cancellationException == null) {
            cancellationException = new JobCancellationException(cancellationExceptionMessage(), null, this);
        }
        cancelImpl$external__kotlinx_coroutines__android_common__kotlinx_coroutines(cancellationException);
    }

    /* JADX WARN: Code restructure failed: missing block: B:70:0x00f1, code lost:
        r0 = r9;
     */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00c7 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0044 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean cancelImpl$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@org.jetbrains.annotations.Nullable java.lang.Object r9) {
        /*
            Method dump skipped, instructions count: 262
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.JobSupport.cancelImpl$external__kotlinx_coroutines__android_common__kotlinx_coroutines(java.lang.Object):boolean");
    }

    public boolean childCancelled(@NotNull Throwable cause) {
        Intrinsics.checkNotNullParameter(cause, "cause");
        if (cause instanceof CancellationException) {
            return true;
        }
        if (!cancelImpl$external__kotlinx_coroutines__android_common__kotlinx_coroutines(cause) || !getHandlesException$external__kotlinx_coroutines__android_common__kotlinx_coroutines()) {
            return false;
        }
        return true;
    }

    public final void completeStateFinalization(Incomplete incomplete, Object obj) {
        CompletedExceptionally completedExceptionally;
        Throwable th;
        CompletionHandlerException completionHandlerException;
        ChildHandle childHandle = this._parentHandle.value;
        if (childHandle != null) {
            childHandle.dispose();
            this._parentHandle.setValue(NonDisposableHandle.INSTANCE);
        }
        if (obj instanceof CompletedExceptionally) {
            completedExceptionally = (CompletedExceptionally) obj;
        } else {
            completedExceptionally = null;
        }
        if (completedExceptionally == null) {
            th = null;
        } else {
            th = completedExceptionally.cause;
        }
        if (incomplete instanceof JobNode) {
            try {
                ((JobNode) incomplete).invoke(th);
            } catch (Throwable th2) {
                handleOnCompletionException$external__kotlinx_coroutines__android_common__kotlinx_coroutines(new CompletionHandlerException("Exception in completion handler " + incomplete + " for " + this, th2));
            }
        } else {
            NodeList list = incomplete.getList();
            if (list != null) {
                CompletionHandlerException completionHandlerException2 = null;
                for (LockFreeLinkedListNode lockFreeLinkedListNode = (LockFreeLinkedListNode) list.getNext(); !Intrinsics.areEqual(lockFreeLinkedListNode, list); lockFreeLinkedListNode = lockFreeLinkedListNode.getNextNode()) {
                    if (lockFreeLinkedListNode instanceof JobNode) {
                        JobNode jobNode = (JobNode) lockFreeLinkedListNode;
                        try {
                            jobNode.invoke(th);
                        } catch (Throwable th3) {
                            if (completionHandlerException2 == null) {
                                completionHandlerException = null;
                            } else {
                                ExceptionsKt.addSuppressed(completionHandlerException2, th3);
                                completionHandlerException = completionHandlerException2;
                            }
                            if (completionHandlerException == null) {
                                completionHandlerException2 = new CompletionHandlerException("Exception in completion handler " + jobNode + " for " + this, th3);
                            }
                        }
                    }
                }
                if (completionHandlerException2 != null) {
                    handleOnCompletionException$external__kotlinx_coroutines__android_common__kotlinx_coroutines(completionHandlerException2);
                }
            }
        }
    }

    public final Throwable createCauseException(Object obj) {
        boolean z;
        if (obj == null) {
            z = true;
        } else {
            z = obj instanceof Throwable;
        }
        if (z) {
            Throwable th = (Throwable) obj;
            if (th == null) {
                return new JobCancellationException(cancellationExceptionMessage(), null, this);
            }
            return th;
        } else if (obj != null) {
            return ((ParentJob) obj).getChildJobCancellationCause();
        } else {
            throw new NullPointerException("null cannot be cast to non-null type kotlinx.coroutines.ParentJob");
        }
    }

    public final Object finalizeFinishingState(Finishing finishing, Object obj) {
        CompletedExceptionally completedExceptionally;
        Throwable finalRootCause;
        Object obj2;
        boolean z = DebugKt.DEBUG;
        Throwable th = null;
        if (obj instanceof CompletedExceptionally) {
            completedExceptionally = (CompletedExceptionally) obj;
        } else {
            completedExceptionally = null;
        }
        if (completedExceptionally != null) {
            th = completedExceptionally.cause;
        }
        synchronized (finishing) {
            finishing.isCancelling();
            ArrayList sealLocked = finishing.sealLocked(th);
            finalRootCause = getFinalRootCause(finishing, sealLocked);
            if (finalRootCause != null) {
                addSuppressedExceptions(finalRootCause, sealLocked);
            }
        }
        boolean z2 = false;
        if (!(finalRootCause == null || finalRootCause == th)) {
            obj = new CompletedExceptionally(finalRootCause);
        }
        if (finalRootCause != null) {
            if (cancelParent(finalRootCause) || handleJobException(finalRootCause)) {
                z2 = true;
            }
            if (z2) {
                if (obj != null) {
                    ((CompletedExceptionally) obj)._handled.compareAndSet();
                } else {
                    throw new NullPointerException("null cannot be cast to non-null type kotlinx.coroutines.CompletedExceptionally");
                }
            }
        }
        onCompletionInternal(obj);
        AtomicRef<Object> atomicRef = this._state;
        if (obj instanceof Incomplete) {
            obj2 = new IncompleteStateBox((Incomplete) obj);
        } else {
            obj2 = obj;
        }
        atomicRef.compareAndSet(finishing, obj2);
        completeStateFinalization(finishing, obj);
        return obj;
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final <R> R fold(R r, @NotNull Function2<? super R, ? super CoroutineContext.Element, ? extends R> operation) {
        Intrinsics.checkNotNullParameter(operation, "operation");
        return (R) CoroutineContext.Element.DefaultImpls.fold(this, r, operation);
    }

    @Override // kotlin.coroutines.CoroutineContext.Element, kotlin.coroutines.CoroutineContext
    @Nullable
    public final <E extends CoroutineContext.Element> E get(@NotNull CoroutineContext.Key<E> key) {
        Intrinsics.checkNotNullParameter(key, "key");
        return (E) CoroutineContext.Element.DefaultImpls.get(this, key);
    }

    @Nullable
    public final Object getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        AtomicRef<Object> atomicRef = this._state;
        while (true) {
            Object obj = atomicRef.value;
            if (!(obj instanceof OpDescriptor)) {
                return obj;
            }
            ((OpDescriptor) obj).perform(this);
        }
    }

    public final void initParentJob(@Nullable Job job) {
        boolean z = DebugKt.DEBUG;
        if (job == null) {
            this._parentHandle.setValue(NonDisposableHandle.INSTANCE);
            return;
        }
        job.start();
        ChildHandle attachChild = job.attachChild(this);
        this._parentHandle.setValue(attachChild);
        if (!(getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines() instanceof Incomplete)) {
            attachChild.dispose();
            this._parentHandle.setValue(NonDisposableHandle.INSTANCE);
        }
    }

    @Override // kotlin.coroutines.CoroutineContext
    @NotNull
    public final CoroutineContext minusKey(@NotNull CoroutineContext.Key<?> key) {
        Intrinsics.checkNotNullParameter(key, "key");
        return CoroutineContext.Element.DefaultImpls.minusKey(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    @NotNull
    public final CoroutineContext plus(@NotNull CoroutineContext context) {
        Intrinsics.checkNotNullParameter(context, "context");
        return CoroutineContext.DefaultImpls.plus(this, context);
    }

    public final void promoteSingleToNodeList(JobNode jobNode) {
        NodeList nodeList = new NodeList();
        jobNode.getClass();
        nodeList._prev.lazySet(jobNode);
        nodeList._next.lazySet(jobNode);
        while (true) {
            if (jobNode.getNext() == jobNode) {
                if (jobNode._next.compareAndSet(jobNode, nodeList)) {
                    nodeList.finishAdd(jobNode);
                    break;
                }
            } else {
                break;
            }
        }
        this._state.compareAndSet(jobNode, jobNode.getNextNode());
    }

    @NotNull
    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(nameString$external__kotlinx_coroutines__android_common__kotlinx_coroutines() + '{' + stateString(getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines()) + '}');
        sb.append('@');
        sb.append(DebugStringsKt.getHexAddress(this));
        return sb.toString();
    }

    public final Object tryMakeCompleting(Object obj, Object obj2) {
        Finishing finishing;
        CompletedExceptionally completedExceptionally;
        ChildHandleNode childHandleNode;
        Object obj3;
        if (!(obj instanceof Incomplete)) {
            return JobSupportKt.COMPLETING_ALREADY;
        }
        boolean z = false;
        if (((obj instanceof Empty) || (obj instanceof JobNode)) && !(obj instanceof ChildHandleNode) && !(obj2 instanceof CompletedExceptionally)) {
            Incomplete incomplete = (Incomplete) obj;
            boolean z2 = DebugKt.DEBUG;
            AtomicRef<Object> atomicRef = this._state;
            Symbol symbol = JobSupportKt.COMPLETING_ALREADY;
            if (obj2 instanceof Incomplete) {
                obj3 = new IncompleteStateBox((Incomplete) obj2);
            } else {
                obj3 = obj2;
            }
            if (atomicRef.compareAndSet(incomplete, obj3)) {
                onCompletionInternal(obj2);
                completeStateFinalization(incomplete, obj2);
                z = true;
            }
            if (z) {
                return obj2;
            }
            return JobSupportKt.COMPLETING_RETRY;
        }
        Incomplete incomplete2 = (Incomplete) obj;
        NodeList orPromoteCancellingList = getOrPromoteCancellingList(incomplete2);
        if (orPromoteCancellingList == null) {
            return JobSupportKt.COMPLETING_RETRY;
        }
        ChildHandleNode childHandleNode2 = null;
        if (incomplete2 instanceof Finishing) {
            finishing = (Finishing) incomplete2;
        } else {
            finishing = null;
        }
        if (finishing == null) {
            finishing = new Finishing(orPromoteCancellingList, null);
        }
        synchronized (finishing) {
            if (finishing._isCompleting._value != 0) {
                z = true;
            }
            if (z) {
                return JobSupportKt.COMPLETING_ALREADY;
            }
            finishing._isCompleting.setValue();
            if (finishing == incomplete2 || this._state.compareAndSet(incomplete2, finishing)) {
                boolean z3 = DebugKt.DEBUG;
                boolean isCancelling = finishing.isCancelling();
                if (obj2 instanceof CompletedExceptionally) {
                    completedExceptionally = (CompletedExceptionally) obj2;
                } else {
                    completedExceptionally = null;
                }
                if (completedExceptionally != null) {
                    finishing.addExceptionLocked(completedExceptionally.cause);
                }
                Throwable rootCause = finishing.getRootCause();
                if (!(!isCancelling)) {
                    rootCause = null;
                }
                if (rootCause != null) {
                    notifyCancelling(orPromoteCancellingList, rootCause);
                }
                if (incomplete2 instanceof ChildHandleNode) {
                    childHandleNode = (ChildHandleNode) incomplete2;
                } else {
                    childHandleNode = null;
                }
                if (childHandleNode == null) {
                    NodeList list = incomplete2.getList();
                    if (list != null) {
                        childHandleNode2 = nextChild(list);
                    }
                } else {
                    childHandleNode2 = childHandleNode;
                }
                if (childHandleNode2 == null || !tryWaitForChild(finishing, childHandleNode2, obj2)) {
                    return finalizeFinishingState(finishing, obj2);
                }
                return JobSupportKt.COMPLETING_WAITING_CHILDREN;
            }
            return JobSupportKt.COMPLETING_RETRY;
        }
    }

    public final boolean tryWaitForChild(Finishing finishing, ChildHandleNode childHandleNode, Object obj) {
        while (childHandleNode.childJob.invokeOnCompletion(false, false, new ChildCompletion(this, finishing, childHandleNode, obj)) == NonDisposableHandle.INSTANCE) {
            childHandleNode = nextChild(childHandleNode);
            if (childHandleNode == null) {
                return false;
            }
        }
        return true;
    }

    public JobSupport(boolean z) {
        Empty empty;
        if (z) {
            empty = JobSupportKt.EMPTY_ACTIVE;
        } else {
            empty = JobSupportKt.EMPTY_NEW;
        }
        this._state = AtomicFU.atomic(empty);
        this._parentHandle = AtomicFU.atomic(null);
    }

    public static void addSuppressedExceptions(Throwable th, ArrayList arrayList) {
        Throwable th2;
        if (arrayList.size() > 1) {
            Set newSetFromMap = Collections.newSetFromMap(new IdentityHashMap(arrayList.size()));
            Intrinsics.checkNotNullExpressionValue(newSetFromMap, "newSetFromMap(IdentityHashMap(expectedSize))");
            if (!DebugKt.RECOVER_STACK_TRACES) {
                th2 = th;
            } else {
                th2 = StackTraceRecoveryKt.unwrapImpl(th);
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Throwable th3 = (Throwable) it.next();
                if (DebugKt.RECOVER_STACK_TRACES) {
                    th3 = StackTraceRecoveryKt.unwrapImpl(th3);
                }
                if (th3 != th && th3 != th2 && !(th3 instanceof CancellationException) && newSetFromMap.add(th3)) {
                    ExceptionsKt.addSuppressed(th, th3);
                }
            }
        }
    }

    public static ChildHandleNode nextChild(LockFreeLinkedListNode lockFreeLinkedListNode) {
        while (lockFreeLinkedListNode.isRemoved()) {
            lockFreeLinkedListNode = lockFreeLinkedListNode.getPrevNode();
        }
        while (true) {
            lockFreeLinkedListNode = lockFreeLinkedListNode.getNextNode();
            if (!lockFreeLinkedListNode.isRemoved()) {
                if (lockFreeLinkedListNode instanceof ChildHandleNode) {
                    return (ChildHandleNode) lockFreeLinkedListNode;
                }
                if (lockFreeLinkedListNode instanceof NodeList) {
                    return null;
                }
            }
        }
    }

    public final boolean cancelParent(Throwable th) {
        if (isScopedCoroutine()) {
            return true;
        }
        boolean z = th instanceof CancellationException;
        ChildHandle childHandle = this._parentHandle.value;
        if (childHandle == null || childHandle == NonDisposableHandle.INSTANCE) {
            return z;
        }
        if (childHandle.childCancelled(th) || z) {
            return true;
        }
        return false;
    }

    @Override // kotlinx.coroutines.Job
    @NotNull
    public final CancellationException getCancellationException() {
        Object state$external__kotlinx_coroutines__android_common__kotlinx_coroutines = getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines();
        CancellationException cancellationException = null;
        if (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof Finishing) {
            Throwable rootCause = ((Finishing) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines).getRootCause();
            if (rootCause != null) {
                String stringPlus = Intrinsics.stringPlus(DebugStringsKt.getClassSimpleName(this), " is cancelling");
                if (rootCause instanceof CancellationException) {
                    cancellationException = (CancellationException) rootCause;
                }
                if (cancellationException == null) {
                    if (stringPlus == null) {
                        stringPlus = cancellationExceptionMessage();
                    }
                    cancellationException = new JobCancellationException(stringPlus, rootCause, this);
                }
            }
            if (cancellationException != null) {
                return cancellationException;
            }
            throw new IllegalStateException(Intrinsics.stringPlus("Job is still new or active: ", this).toString());
        } else if (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof Incomplete) {
            throw new IllegalStateException(Intrinsics.stringPlus("Job is still new or active: ", this).toString());
        } else if (!(state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof CompletedExceptionally)) {
            return new JobCancellationException(Intrinsics.stringPlus(DebugStringsKt.getClassSimpleName(this), " has completed normally"), null, this);
        } else {
            Throwable th = ((CompletedExceptionally) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines).cause;
            Intrinsics.checkNotNullParameter(th, "<this>");
            if (th instanceof CancellationException) {
                cancellationException = (CancellationException) th;
            }
            if (cancellationException == null) {
                return new JobCancellationException(cancellationExceptionMessage(), th, this);
            }
            return cancellationException;
        }
    }

    @Override // kotlinx.coroutines.ParentJob
    @NotNull
    public final CancellationException getChildJobCancellationCause() {
        Throwable th;
        Object state$external__kotlinx_coroutines__android_common__kotlinx_coroutines = getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines();
        CancellationException cancellationException = null;
        if (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof Finishing) {
            th = ((Finishing) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines).getRootCause();
        } else if (state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof CompletedExceptionally) {
            th = ((CompletedExceptionally) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines).cause;
        } else if (!(state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof Incomplete)) {
            th = null;
        } else {
            throw new IllegalStateException(Intrinsics.stringPlus("Cannot be cancelling child in this state: ", state$external__kotlinx_coroutines__android_common__kotlinx_coroutines).toString());
        }
        if (th instanceof CancellationException) {
            cancellationException = th;
        }
        if (cancellationException == null) {
            return new JobCancellationException(Intrinsics.stringPlus("Parent job is ", stateString(state$external__kotlinx_coroutines__android_common__kotlinx_coroutines)), th, this);
        }
        return cancellationException;
    }

    public final Throwable getFinalRootCause(Finishing finishing, ArrayList arrayList) {
        Object obj;
        boolean z;
        Object obj2 = null;
        if (!arrayList.isEmpty()) {
            Iterator it = arrayList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    obj = null;
                    break;
                }
                obj = it.next();
                if (!(((Throwable) obj) instanceof CancellationException)) {
                    break;
                }
            }
            Throwable th = (Throwable) obj;
            if (th != null) {
                return th;
            }
            Throwable th2 = (Throwable) arrayList.get(0);
            if (th2 instanceof TimeoutCancellationException) {
                Iterator it2 = arrayList.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    Object next = it2.next();
                    Throwable th3 = (Throwable) next;
                    if (th3 == th2 || !(th3 instanceof TimeoutCancellationException)) {
                        z = false;
                        continue;
                    } else {
                        z = true;
                        continue;
                    }
                    if (z) {
                        obj2 = next;
                        break;
                    }
                }
                Throwable th4 = (Throwable) obj2;
                if (th4 != null) {
                    return th4;
                }
            }
            return th2;
        } else if (finishing.isCancelling()) {
            return new JobCancellationException(cancellationExceptionMessage(), null, this);
        } else {
            return null;
        }
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
        throw new IllegalStateException(Intrinsics.stringPlus("State should have list: ", incomplete).toString());
    }

    @Override // kotlinx.coroutines.Job
    public boolean isActive() {
        Object state$external__kotlinx_coroutines__android_common__kotlinx_coroutines = getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines();
        if (!(state$external__kotlinx_coroutines__android_common__kotlinx_coroutines instanceof Incomplete) || !((Incomplete) state$external__kotlinx_coroutines__android_common__kotlinx_coroutines).isActive()) {
            return false;
        }
        return true;
    }

    @Nullable
    public final Object makeCompletingOnce$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@Nullable Object obj) {
        Object tryMakeCompleting;
        CompletedExceptionally completedExceptionally;
        do {
            tryMakeCompleting = tryMakeCompleting(getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines(), obj);
            if (tryMakeCompleting == JobSupportKt.COMPLETING_ALREADY) {
                String str = "Job " + this + " is already complete or completing, but is being completed with " + obj;
                Throwable th = null;
                if (obj instanceof CompletedExceptionally) {
                    completedExceptionally = (CompletedExceptionally) obj;
                } else {
                    completedExceptionally = null;
                }
                if (completedExceptionally != null) {
                    th = completedExceptionally.cause;
                }
                throw new IllegalStateException(str, th);
            }
        } while (tryMakeCompleting == JobSupportKt.COMPLETING_RETRY);
        return tryMakeCompleting;
    }

    @NotNull
    public String nameString$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        return DebugStringsKt.getClassSimpleName(this);
    }

    public final void notifyCancelling(NodeList nodeList, Throwable th) {
        CompletionHandlerException completionHandlerException;
        CompletionHandlerException completionHandlerException2 = null;
        for (LockFreeLinkedListNode lockFreeLinkedListNode = (LockFreeLinkedListNode) nodeList.getNext(); !Intrinsics.areEqual(lockFreeLinkedListNode, nodeList); lockFreeLinkedListNode = lockFreeLinkedListNode.getNextNode()) {
            if (lockFreeLinkedListNode instanceof JobCancellingNode) {
                JobNode jobNode = (JobNode) lockFreeLinkedListNode;
                try {
                    jobNode.invoke(th);
                } catch (Throwable th2) {
                    if (completionHandlerException2 == null) {
                        completionHandlerException = null;
                    } else {
                        ExceptionsKt.addSuppressed(completionHandlerException2, th2);
                        completionHandlerException = completionHandlerException2;
                    }
                    if (completionHandlerException == null) {
                        completionHandlerException2 = new CompletionHandlerException("Exception in completion handler " + jobNode + " for " + this, th2);
                    }
                }
            }
        }
        if (completionHandlerException2 != null) {
            handleOnCompletionException$external__kotlinx_coroutines__android_common__kotlinx_coroutines(completionHandlerException2);
        }
        cancelParent(th);
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
            java.lang.Object r0 = r6.getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines()
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
            kotlinx.atomicfu.AtomicRef<java.lang.Object> r1 = r6._state
            kotlinx.coroutines.Empty r5 = kotlinx.coroutines.JobSupportKt.EMPTY_ACTIVE
            boolean r0 = r1.compareAndSet(r0, r5)
            if (r0 != 0) goto L1e
            goto L3a
        L1e:
            r6.onStart()
            goto L37
        L22:
            boolean r1 = r0 instanceof kotlinx.coroutines.InactiveNodeList
            if (r1 == 0) goto L39
            kotlinx.atomicfu.AtomicRef<java.lang.Object> r1 = r6._state
            r5 = r0
            kotlinx.coroutines.InactiveNodeList r5 = (kotlinx.coroutines.InactiveNodeList) r5
            kotlinx.coroutines.NodeList r5 = r5.list
            boolean r0 = r1.compareAndSet(r0, r5)
            if (r0 != 0) goto L34
            goto L3a
        L34:
            r6.onStart()
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

    public void handleOnCompletionException$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@NotNull CompletionHandlerException completionHandlerException) {
        throw completionHandlerException;
    }

    @Override // kotlinx.coroutines.ChildJob
    public final void parentCancelled(@NotNull JobSupport jobSupport) {
        cancelImpl$external__kotlinx_coroutines__android_common__kotlinx_coroutines(jobSupport);
    }

    @Override // kotlin.coroutines.CoroutineContext.Element
    @NotNull
    public final CoroutineContext.Key<?> getKey() {
        return Job.Key.$$INSTANCE;
    }
}
