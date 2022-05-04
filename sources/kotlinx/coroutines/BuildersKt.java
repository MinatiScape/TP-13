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
import kotlinx.atomicfu.AtomicInt;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.internal.ScopeCoroutine;
import kotlinx.coroutines.internal.ThreadContextKt;
import kotlinx.coroutines.intrinsics.CancellableKt;
import kotlinx.coroutines.intrinsics.UndispatchedKt;
import kotlinx.coroutines.scheduling.LimitingDispatcher;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class BuildersKt {
    public static void launch$default(CoroutineScope coroutineScope, MainCoroutineDispatcher mainCoroutineDispatcher, Function2 function2, int i) {
        CoroutineStart start;
        boolean z;
        AbstractCoroutine abstractCoroutine;
        CoroutineContext context = mainCoroutineDispatcher;
        if ((i & 1) != 0) {
            context = EmptyCoroutineContext.INSTANCE;
        }
        if ((i & 2) != 0) {
            start = CoroutineStart.DEFAULT;
        } else {
            start = null;
        }
        Intrinsics.checkNotNullParameter(coroutineScope, "<this>");
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(start, "start");
        CoroutineContext newCoroutineContext = CoroutineContextKt.newCoroutineContext(coroutineScope, context);
        if (start == CoroutineStart.LAZY) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            abstractCoroutine = new LazyStandaloneCoroutine(newCoroutineContext, function2);
        } else {
            abstractCoroutine = new StandaloneCoroutine(newCoroutineContext, true);
        }
        abstractCoroutine.start(start, abstractCoroutine, function2);
    }

    public static Object runBlocking$default(Function2 function2) throws InterruptedException {
        long j;
        EmptyCoroutineContext context = EmptyCoroutineContext.INSTANCE;
        Intrinsics.checkNotNullParameter(context, "context");
        Thread currentThread = Thread.currentThread();
        CompletedExceptionally completedExceptionally = null;
        EventLoop eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines = ThreadLocalEventLoop.getEventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines();
        CoroutineContext newCoroutineContext = CoroutineContextKt.newCoroutineContext(GlobalScope.INSTANCE, eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines);
        Intrinsics.checkNotNullExpressionValue(currentThread, "currentThread");
        BlockingCoroutine blockingCoroutine = new BlockingCoroutine(newCoroutineContext, currentThread, eventLoop$external__kotlinx_coroutines__android_common__kotlinx_coroutines);
        blockingCoroutine.start(CoroutineStart.DEFAULT, blockingCoroutine, function2);
        EventLoop eventLoop = blockingCoroutine.eventLoop;
        if (eventLoop != null) {
            int i = EventLoop.$r8$clinit;
            eventLoop.incrementUseCount(false);
        }
        while (!Thread.interrupted()) {
            EventLoop eventLoop2 = blockingCoroutine.eventLoop;
            if (eventLoop2 == null) {
                j = RecyclerView.FOREVER_NS;
            } else {
                j = eventLoop2.processNextEvent();
            }
            if (!(blockingCoroutine.getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines() instanceof Incomplete)) {
                EventLoop eventLoop3 = blockingCoroutine.eventLoop;
                if (eventLoop3 != null) {
                    int i2 = EventLoop.$r8$clinit;
                    eventLoop3.decrementUseCount(false);
                }
                Object unboxState = JobSupportKt.unboxState(blockingCoroutine.getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines());
                if (unboxState instanceof CompletedExceptionally) {
                    completedExceptionally = (CompletedExceptionally) unboxState;
                }
                if (completedExceptionally == null) {
                    return unboxState;
                }
                throw completedExceptionally.cause;
            }
            LockSupport.parkNanos(blockingCoroutine, j);
        }
        InterruptedException interruptedException = new InterruptedException();
        blockingCoroutine.cancelImpl$external__kotlinx_coroutines__android_common__kotlinx_coroutines(interruptedException);
        throw interruptedException;
    }

    @Nullable
    public static final Object withContext(@NotNull LimitingDispatcher limitingDispatcher, @NotNull Function2 function2, @NotNull Continuation continuation) {
        boolean z;
        CoroutineContext context = continuation.getContext();
        CoroutineContext plus = context.plus(limitingDispatcher);
        Intrinsics.checkNotNullParameter(plus, "<this>");
        Job job = (Job) plus.get(Job.Key.$$INSTANCE);
        if (job != null && !job.isActive()) {
            throw job.getCancellationException();
        } else if (plus == context) {
            ScopeCoroutine scopeCoroutine = new ScopeCoroutine(plus, continuation);
            return UndispatchedKt.startUndispatchedOrReturn(scopeCoroutine, scopeCoroutine, function2);
        } else {
            ContinuationInterceptor.Key key = ContinuationInterceptor.Key.$$INSTANCE;
            if (Intrinsics.areEqual(plus.get(key), context.get(key))) {
                UndispatchedCoroutine undispatchedCoroutine = new UndispatchedCoroutine(plus, continuation);
                Object updateThreadContext = ThreadContextKt.updateThreadContext(plus, null);
                try {
                    return UndispatchedKt.startUndispatchedOrReturn(undispatchedCoroutine, undispatchedCoroutine, function2);
                } finally {
                    ThreadContextKt.restoreThreadContext(plus, updateThreadContext);
                }
            } else {
                DispatchedCoroutine dispatchedCoroutine = new DispatchedCoroutine(plus, continuation);
                CancellableKt.startCoroutineCancellable$default(function2, dispatchedCoroutine, dispatchedCoroutine);
                AtomicInt atomicInt = dispatchedCoroutine._decision;
                while (true) {
                    int i = atomicInt.value;
                    z = false;
                    if (i == 0) {
                        if (dispatchedCoroutine._decision.compareAndSet(0, 1)) {
                            z = true;
                            break;
                        }
                    } else if (i != 2) {
                        throw new IllegalStateException("Already suspended".toString());
                    }
                }
                if (z) {
                    return CoroutineSingletons.COROUTINE_SUSPENDED;
                }
                Object unboxState = JobSupportKt.unboxState(dispatchedCoroutine.getState$external__kotlinx_coroutines__android_common__kotlinx_coroutines());
                if (!(unboxState instanceof CompletedExceptionally)) {
                    return unboxState;
                }
                throw ((CompletedExceptionally) unboxState).cause;
            }
        }
    }
}
