package kotlinx.coroutines;

import androidx.recyclerview.widget.RecyclerView;
import java.util.concurrent.locks.LockSupport;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.internal.ScopeCoroutine;
import kotlinx.coroutines.internal.ThreadContextKt;
import kotlinx.coroutines.intrinsics.CancellableKt;
import kotlinx.coroutines.intrinsics.UndispatchedKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class BuildersKt {
    public static Job launch$default(CoroutineScope launch, CoroutineContext context, CoroutineStart coroutineStart, Function2 function2, int i, Object obj) {
        AbstractCoroutine abstractCoroutine;
        if ((i & 1) != 0) {
            context = EmptyCoroutineContext.INSTANCE;
        }
        CoroutineStart start = (i & 2) != 0 ? CoroutineStart.DEFAULT : null;
        Intrinsics.checkParameterIsNotNull(launch, "$this$launch");
        Intrinsics.checkParameterIsNotNull(context, "context");
        Intrinsics.checkParameterIsNotNull(start, "start");
        CoroutineContext newCoroutineContext = CoroutineContextKt.newCoroutineContext(launch, context);
        if (start == CoroutineStart.LAZY) {
            abstractCoroutine = new LazyStandaloneCoroutine(newCoroutineContext, function2);
        } else {
            abstractCoroutine = new StandaloneCoroutine(newCoroutineContext, true);
        }
        abstractCoroutine.start(start, abstractCoroutine, function2);
        return abstractCoroutine;
    }

    public static Object runBlocking$default(CoroutineContext coroutineContext, Function2 function2, int i, Object obj) throws InterruptedException {
        int i2 = i & 1;
        CompletedExceptionally completedExceptionally = null;
        EmptyCoroutineContext context = i2 != 0 ? EmptyCoroutineContext.INSTANCE : null;
        Intrinsics.checkParameterIsNotNull(context, "context");
        Thread currentThread = Thread.currentThread();
        context.get(ContinuationInterceptor.Key.$$INSTANCE);
        ThreadLocalEventLoop threadLocalEventLoop = ThreadLocalEventLoop.INSTANCE;
        EventLoop context2 = ThreadLocalEventLoop.getEventLoop$kotlinx_coroutines_core();
        GlobalScope globalScope = GlobalScope.INSTANCE;
        Intrinsics.checkNotNullParameter(context2, "context");
        CoroutineContext newCoroutineContext = CoroutineContextKt.newCoroutineContext(globalScope, context2);
        Intrinsics.checkExpressionValueIsNotNull(currentThread, "currentThread");
        BlockingCoroutine blockingCoroutine = new BlockingCoroutine(newCoroutineContext, currentThread, context2);
        blockingCoroutine.start(CoroutineStart.DEFAULT, blockingCoroutine, function2);
        EventLoop eventLoop = blockingCoroutine.eventLoop;
        if (eventLoop != null) {
            eventLoop.incrementUseCount(false);
        }
        while (!Thread.interrupted()) {
            EventLoop eventLoop2 = blockingCoroutine.eventLoop;
            long processNextEvent = eventLoop2 != null ? eventLoop2.processNextEvent() : RecyclerView.FOREVER_NS;
            if (!(blockingCoroutine.getState$kotlinx_coroutines_core() instanceof Incomplete)) {
                EventLoop eventLoop3 = blockingCoroutine.eventLoop;
                if (eventLoop3 != null) {
                    eventLoop3.decrementUseCount(false);
                }
                Object unboxState = JobSupportKt.unboxState(blockingCoroutine.getState$kotlinx_coroutines_core());
                if (unboxState instanceof CompletedExceptionally) {
                    completedExceptionally = unboxState;
                }
                CompletedExceptionally completedExceptionally2 = completedExceptionally;
                if (completedExceptionally2 == null) {
                    return unboxState;
                }
                throw completedExceptionally2.cause;
            }
            LockSupport.parkNanos(blockingCoroutine, processNextEvent);
        }
        InterruptedException interruptedException = new InterruptedException();
        blockingCoroutine.cancelImpl$kotlinx_coroutines_core(interruptedException);
        throw interruptedException;
    }

    @Nullable
    public static final <T> Object withContext(@NotNull CoroutineContext coroutineContext, @NotNull Function2<? super CoroutineScope, ? super Continuation<? super T>, ? extends Object> function2, @NotNull Continuation<? super T> continuation) {
        boolean z;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.COROUTINE_SUSPENDED;
        CoroutineContext context = continuation.getContext();
        CoroutineContext checkCompletion = context.plus(coroutineContext);
        Intrinsics.checkParameterIsNotNull(checkCompletion, "$this$checkCompletion");
        Job job = (Job) checkCompletion.get(Job.Key);
        if (job != null && !job.isActive()) {
            throw job.getCancellationException();
        } else if (checkCompletion == context) {
            ScopeCoroutine scopeCoroutine = new ScopeCoroutine(checkCompletion, continuation);
            return UndispatchedKt.startUndispatchedOrReturn(scopeCoroutine, scopeCoroutine, function2);
        } else {
            int i = ContinuationInterceptor.$r8$clinit;
            ContinuationInterceptor.Key key = ContinuationInterceptor.Key.$$INSTANCE;
            if (Intrinsics.areEqual((ContinuationInterceptor) checkCompletion.get(key), (ContinuationInterceptor) context.get(key))) {
                UndispatchedCoroutine undispatchedCoroutine = new UndispatchedCoroutine(checkCompletion, continuation);
                Object updateThreadContext = ThreadContextKt.updateThreadContext(checkCompletion, null);
                try {
                    return UndispatchedKt.startUndispatchedOrReturn(undispatchedCoroutine, undispatchedCoroutine, function2);
                } finally {
                    ThreadContextKt.restoreThreadContext(checkCompletion, updateThreadContext);
                }
            } else {
                DispatchedCoroutine dispatchedCoroutine = new DispatchedCoroutine(checkCompletion, continuation);
                dispatchedCoroutine.initParentJob$kotlinx_coroutines_core();
                CancellableKt.startCoroutineCancellable(function2, dispatchedCoroutine, dispatchedCoroutine);
                while (true) {
                    int i2 = dispatchedCoroutine._decision;
                    z = false;
                    if (i2 == 0) {
                        if (DispatchedCoroutine._decision$FU.compareAndSet(dispatchedCoroutine, 0, 1)) {
                            z = true;
                            break;
                        }
                    } else if (i2 != 2) {
                        throw new IllegalStateException("Already suspended".toString());
                    }
                }
                if (z) {
                    return coroutineSingletons;
                }
                Object unboxState = JobSupportKt.unboxState(dispatchedCoroutine.getState$kotlinx_coroutines_core());
                if (!(unboxState instanceof CompletedExceptionally)) {
                    return unboxState;
                }
                throw ((CompletedExceptionally) unboxState).cause;
            }
        }
    }
}
