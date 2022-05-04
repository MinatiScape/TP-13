package kotlinx.coroutines;

import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlinx.coroutines.internal.ThreadContextKt;
import kotlinx.coroutines.intrinsics.CancellableKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public abstract class AbstractCoroutine<T> extends JobSupport implements Job, Continuation<T> {
    @NotNull
    public final CoroutineContext context;
    @NotNull
    public final CoroutineContext parentContext;

    public AbstractCoroutine(@NotNull CoroutineContext coroutineContext, boolean z) {
        super(z);
        this.parentContext = coroutineContext;
        this.context = coroutineContext.plus(this);
    }

    @Override // kotlin.coroutines.Continuation
    @NotNull
    public final CoroutineContext getContext() {
        return this.context;
    }

    @NotNull
    public CoroutineContext getCoroutineContext() {
        return this.context;
    }

    public int getDefaultResumeMode$kotlinx_coroutines_core() {
        return 0;
    }

    @Override // kotlinx.coroutines.JobSupport
    public final void handleOnCompletionException$kotlinx_coroutines_core(@NotNull Throwable th) {
        JobKt.handleCoroutineException(this.context, th);
    }

    public final void initParentJob$kotlinx_coroutines_core() {
        initParentJobInternal$kotlinx_coroutines_core((Job) this.parentContext.get(Job.Key));
    }

    @Override // kotlinx.coroutines.JobSupport, kotlinx.coroutines.Job
    public boolean isActive() {
        return super.isActive();
    }

    @Override // kotlinx.coroutines.JobSupport
    @NotNull
    public String nameString$kotlinx_coroutines_core() {
        CoroutineId coroutineId;
        CoroutineContext coroutineName = this.context;
        boolean z = CoroutineContextKt.useCoroutinesScheduler;
        Intrinsics.checkParameterIsNotNull(coroutineName, "$this$coroutineName");
        String str = null;
        if (DebugKt.DEBUG && (coroutineId = (CoroutineId) coroutineName.get(CoroutineId.Key)) != null) {
            CoroutineName coroutineName2 = (CoroutineName) coroutineName.get(CoroutineName.Key);
            str = "coroutine#" + coroutineId.id;
        }
        if (str == null) {
            return super.nameString$kotlinx_coroutines_core();
        }
        return '\"' + str + "\":" + super.nameString$kotlinx_coroutines_core();
    }

    @Override // kotlinx.coroutines.JobSupport
    public final void onCompletionInternal(@Nullable Object obj) {
        if (obj instanceof CompletedExceptionally) {
            CompletedExceptionally completedExceptionally = (CompletedExceptionally) obj;
            Throwable cause = completedExceptionally.cause;
            int i = completedExceptionally._handled;
            Intrinsics.checkParameterIsNotNull(cause, "cause");
        }
    }

    public void onStart() {
    }

    @Override // kotlinx.coroutines.JobSupport
    public final void onStartInternal$kotlinx_coroutines_core() {
        onStart();
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(@NotNull Object obj) {
        makeCompletingOnce$kotlinx_coroutines_core(CompletedExceptionallyKt.toState(obj), getDefaultResumeMode$kotlinx_coroutines_core());
    }

    public final <R> void start(@NotNull CoroutineStart coroutineStart, R r, @NotNull Function2<? super R, ? super Continuation<? super T>, ? extends Object> function2) {
        initParentJob$kotlinx_coroutines_core();
        int ordinal = coroutineStart.ordinal();
        if (ordinal == 0) {
            CancellableKt.startCoroutineCancellable(function2, r, this);
        } else if (ordinal == 1) {
        } else {
            if (ordinal == 2) {
                IntrinsicsKt__IntrinsicsKt.intercepted(IntrinsicsKt__IntrinsicsKt.createCoroutineUnintercepted(function2, r, this)).resumeWith(Unit.INSTANCE);
            } else if (ordinal == 3) {
                try {
                    CoroutineContext coroutineContext = this.context;
                    Object updateThreadContext = ThreadContextKt.updateThreadContext(coroutineContext, null);
                    TypeIntrinsics.beforeCheckcastToFunctionOfArity(function2, 2);
                    Object invoke = function2.invoke(r, this);
                    ThreadContextKt.restoreThreadContext(coroutineContext, updateThreadContext);
                    if (invoke != CoroutineSingletons.COROUTINE_SUSPENDED) {
                        resumeWith(invoke);
                    }
                } catch (Throwable th) {
                    resumeWith(ResultKt.createFailure(th));
                }
            } else {
                throw new NoWhenBranchMatchedException();
            }
        }
    }
}
