package kotlinx.coroutines;

import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt__IntrinsicsKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.internal.ThreadContextKt;
import kotlinx.coroutines.intrinsics.CancellableKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: AbstractCoroutine.kt */
/* loaded from: classes.dex */
public abstract class AbstractCoroutine<T> extends JobSupport implements Continuation<T>, CoroutineScope {
    @NotNull
    public final CoroutineContext context;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AbstractCoroutine(@NotNull CoroutineContext parentContext, boolean z) {
        super(z);
        Intrinsics.checkNotNullParameter(parentContext, "parentContext");
        initParentJob((Job) parentContext.get(Job.Key.$$INSTANCE));
        this.context = parentContext.plus(this);
    }

    @Override // kotlinx.coroutines.JobSupport
    public final void handleOnCompletionException$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@NotNull CompletionHandlerException completionHandlerException) {
        SupervisorKt.handleCoroutineException(this.context, completionHandlerException);
    }

    @Override // kotlinx.coroutines.JobSupport
    @NotNull
    public final String nameString$external__kotlinx_coroutines__android_common__kotlinx_coroutines() {
        CoroutineId coroutineId;
        CoroutineContext coroutineContext = this.context;
        boolean z = CoroutineContextKt.useCoroutinesScheduler;
        Intrinsics.checkNotNullParameter(coroutineContext, "<this>");
        String str = null;
        if (DebugKt.DEBUG && (coroutineId = (CoroutineId) coroutineContext.get(CoroutineId.Key)) != null) {
            CoroutineName coroutineName = (CoroutineName) coroutineContext.get(CoroutineName.Key);
            str = "coroutine#" + coroutineId.id;
        }
        if (str == null) {
            return DebugStringsKt.getClassSimpleName(this);
        }
        return '\"' + str + "\":" + DebugStringsKt.getClassSimpleName(this);
    }

    @Override // kotlinx.coroutines.JobSupport
    public final void onCompletionInternal(@Nullable Object obj) {
        if (obj instanceof CompletedExceptionally) {
            CompletedExceptionally completedExceptionally = (CompletedExceptionally) obj;
            Throwable cause = completedExceptionally.cause;
            completedExceptionally._handled.getClass();
            Intrinsics.checkNotNullParameter(cause, "cause");
        }
    }

    @Override // kotlinx.coroutines.JobSupport
    @NotNull
    public final String cancellationExceptionMessage() {
        return Intrinsics.stringPlus(DebugStringsKt.getClassSimpleName(this), " was cancelled");
    }

    @Override // kotlinx.coroutines.JobSupport, kotlinx.coroutines.Job
    public final boolean isActive() {
        return super.isActive();
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(@NotNull Object obj) {
        Throwable th = Result.m80exceptionOrNullimpl(obj);
        if (th != null) {
            obj = new CompletedExceptionally(th);
        }
        Object makeCompletingOnce$external__kotlinx_coroutines__android_common__kotlinx_coroutines = makeCompletingOnce$external__kotlinx_coroutines__android_common__kotlinx_coroutines(obj);
        if (makeCompletingOnce$external__kotlinx_coroutines__android_common__kotlinx_coroutines != JobSupportKt.COMPLETING_WAITING_CHILDREN) {
            afterResume(makeCompletingOnce$external__kotlinx_coroutines__android_common__kotlinx_coroutines);
        }
    }

    public final void start(@NotNull CoroutineStart coroutineStart, AbstractCoroutine abstractCoroutine, @NotNull Function2 function2) {
        int ordinal = coroutineStart.ordinal();
        if (ordinal == 0) {
            CancellableKt.startCoroutineCancellable$default(function2, abstractCoroutine, this);
        } else if (ordinal == 1) {
        } else {
            if (ordinal == 2) {
                IntrinsicsKt__IntrinsicsKt.intercepted(IntrinsicsKt__IntrinsicsKt.createCoroutineUnintercepted(function2, abstractCoroutine, this)).resumeWith(Unit.INSTANCE);
            } else if (ordinal == 3) {
                try {
                    CoroutineContext coroutineContext = this.context;
                    Object updateThreadContext = ThreadContextKt.updateThreadContext(coroutineContext, null);
                    TypeIntrinsics.beforeCheckcastToFunctionOfArity(function2);
                    Object invoke = function2.invoke(abstractCoroutine, this);
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

    public void afterResume(@Nullable Object obj) {
        afterCompletion(obj);
    }

    @Override // kotlin.coroutines.Continuation
    @NotNull
    public final CoroutineContext getContext() {
        return this.context;
    }

    @Override // kotlinx.coroutines.CoroutineScope
    @NotNull
    public final CoroutineContext getCoroutineContext() {
        return this.context;
    }
}
