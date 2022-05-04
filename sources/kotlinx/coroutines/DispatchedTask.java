package kotlinx.coroutines;

import java.util.concurrent.CancellationException;
import kotlin.ExceptionsKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.scheduling.Task;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: DispatchedTask.kt */
/* loaded from: classes.dex */
public abstract class DispatchedTask<T> extends Task {
    public int resumeMode = -1;

    public void cancelCompletedResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@Nullable Object obj, @NotNull CancellationException cause) {
        Intrinsics.checkNotNullParameter(cause, "cause");
    }

    @NotNull
    public abstract Continuation<T> getDelegate$external__kotlinx_coroutines__android_common__kotlinx_coroutines();

    /* JADX WARN: Multi-variable type inference failed */
    public <T> T getSuccessfulResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@Nullable Object obj) {
        return obj;
    }

    @Nullable
    public abstract Object takeState$external__kotlinx_coroutines__android_common__kotlinx_coroutines();

    @Nullable
    public Throwable getExceptionalResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(@Nullable Object obj) {
        CompletedExceptionally completedExceptionally;
        if (obj instanceof CompletedExceptionally) {
            completedExceptionally = (CompletedExceptionally) obj;
        } else {
            completedExceptionally = null;
        }
        if (completedExceptionally == null) {
            return null;
        }
        return completedExceptionally.cause;
    }

    public final void handleFatalException(@Nullable Throwable th, @Nullable Throwable th2) {
        if (th != null || th2 != null) {
            if (!(th == null || th2 == null)) {
                ExceptionsKt.addSuppressed(th, th2);
            }
            if (th == null) {
                th = th2;
            }
            Intrinsics.checkNotNull(th);
            SupervisorKt.handleCoroutineException(getDelegate$external__kotlinx_coroutines__android_common__kotlinx_coroutines().getContext(), new CoroutinesInternalError("Fatal exception in coroutines machinery for " + this + ". Please read KDoc to 'handleFatalException' method and report this incident to maintainers", th));
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x003b, code lost:
        r6 = (kotlinx.coroutines.Job) r6.get(kotlinx.coroutines.Job.Key.$$INSTANCE);
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v7, types: [java.lang.Throwable] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void run() {
        /*
            r12 = this;
            boolean r0 = kotlinx.coroutines.DebugKt.DEBUG
            kotlinx.coroutines.scheduling.TaskContext r0 = r12.taskContext
            kotlin.coroutines.Continuation r1 = r12.getDelegate$external__kotlinx_coroutines__android_common__kotlinx_coroutines()     // Catch: java.lang.Throwable -> La9
            kotlinx.coroutines.internal.DispatchedContinuation r1 = (kotlinx.coroutines.internal.DispatchedContinuation) r1     // Catch: java.lang.Throwable -> La9
            kotlin.coroutines.Continuation<T> r2 = r1.continuation     // Catch: java.lang.Throwable -> La9
            java.lang.Object r1 = r1.countOrElement     // Catch: java.lang.Throwable -> La9
            kotlin.coroutines.CoroutineContext r3 = r2.getContext()     // Catch: java.lang.Throwable -> La9
            java.lang.Object r1 = kotlinx.coroutines.internal.ThreadContextKt.updateThreadContext(r3, r1)     // Catch: java.lang.Throwable -> La9
            kotlinx.coroutines.internal.Symbol r4 = kotlinx.coroutines.internal.ThreadContextKt.NO_THREAD_ELEMENTS     // Catch: java.lang.Throwable -> La9
            r5 = 0
            if (r1 == r4) goto L20
            kotlinx.coroutines.UndispatchedCoroutine r4 = kotlinx.coroutines.CoroutineContextKt.updateUndispatchedCompletion(r2, r3, r1)     // Catch: java.lang.Throwable -> La9
            goto L21
        L20:
            r4 = r5
        L21:
            kotlin.coroutines.CoroutineContext r6 = r2.getContext()     // Catch: java.lang.Throwable -> L6c
            java.lang.Object r7 = r12.takeState$external__kotlinx_coroutines__android_common__kotlinx_coroutines()     // Catch: java.lang.Throwable -> L6c
            java.lang.Throwable r8 = r12.getExceptionalResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(r7)     // Catch: java.lang.Throwable -> L6c
            if (r8 != 0) goto L44
            int r9 = r12.resumeMode     // Catch: java.lang.Throwable -> L6c
            r10 = 1
            if (r9 == r10) goto L39
            r11 = 2
            if (r9 != r11) goto L38
            goto L39
        L38:
            r10 = 0
        L39:
            if (r10 == 0) goto L44
            kotlinx.coroutines.Job$Key r9 = kotlinx.coroutines.Job.Key.$$INSTANCE     // Catch: java.lang.Throwable -> L6c
            kotlin.coroutines.CoroutineContext$Element r6 = r6.get(r9)     // Catch: java.lang.Throwable -> L6c
            kotlinx.coroutines.Job r6 = (kotlinx.coroutines.Job) r6     // Catch: java.lang.Throwable -> L6c
            goto L45
        L44:
            r6 = r5
        L45:
            if (r6 == 0) goto L6e
            boolean r9 = r6.isActive()     // Catch: java.lang.Throwable -> L6c
            if (r9 != 0) goto L6e
            java.util.concurrent.CancellationException r6 = r6.getCancellationException()     // Catch: java.lang.Throwable -> L6c
            r12.cancelCompletedResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(r7, r6)     // Catch: java.lang.Throwable -> L6c
            boolean r7 = kotlinx.coroutines.DebugKt.RECOVER_STACK_TRACES     // Catch: java.lang.Throwable -> L6c
            if (r7 == 0) goto L64
            boolean r7 = r2 instanceof kotlin.coroutines.jvm.internal.CoroutineStackFrame     // Catch: java.lang.Throwable -> L6c
            if (r7 != 0) goto L5d
            goto L64
        L5d:
            r7 = r2
            kotlin.coroutines.jvm.internal.CoroutineStackFrame r7 = (kotlin.coroutines.jvm.internal.CoroutineStackFrame) r7     // Catch: java.lang.Throwable -> L6c
            java.lang.Throwable r6 = kotlinx.coroutines.internal.StackTraceRecoveryKt.access$recoverFromStackFrame(r6, r7)     // Catch: java.lang.Throwable -> L6c
        L64:
            kotlin.Result$Failure r6 = kotlin.ResultKt.createFailure(r6)     // Catch: java.lang.Throwable -> L6c
            r2.resumeWith(r6)     // Catch: java.lang.Throwable -> L6c
            goto L7f
        L6c:
            r2 = move-exception
            goto L9d
        L6e:
            if (r8 == 0) goto L78
            kotlin.Result$Failure r6 = kotlin.ResultKt.createFailure(r8)     // Catch: java.lang.Throwable -> L6c
            r2.resumeWith(r6)     // Catch: java.lang.Throwable -> L6c
            goto L7f
        L78:
            java.lang.Object r6 = r12.getSuccessfulResult$external__kotlinx_coroutines__android_common__kotlinx_coroutines(r7)     // Catch: java.lang.Throwable -> L6c
            r2.resumeWith(r6)     // Catch: java.lang.Throwable -> L6c
        L7f:
            kotlin.Unit r2 = kotlin.Unit.INSTANCE     // Catch: java.lang.Throwable -> L6c
            if (r4 == 0) goto L89
            boolean r4 = r4.clearThreadContext()     // Catch: java.lang.Throwable -> La9
            if (r4 == 0) goto L8c
        L89:
            kotlinx.coroutines.internal.ThreadContextKt.restoreThreadContext(r3, r1)     // Catch: java.lang.Throwable -> La9
        L8c:
            r0.afterTask()     // Catch: java.lang.Throwable -> L90
            goto L95
        L90:
            r0 = move-exception
            kotlin.Result$Failure r2 = kotlin.ResultKt.createFailure(r0)
        L95:
            java.lang.Throwable r0 = kotlin.Result.m80exceptionOrNullimpl(r2)
            r12.handleFatalException(r5, r0)
            goto Lbc
        L9d:
            if (r4 == 0) goto La5
            boolean r4 = r4.clearThreadContext()     // Catch: java.lang.Throwable -> La9
            if (r4 == 0) goto La8
        La5:
            kotlinx.coroutines.internal.ThreadContextKt.restoreThreadContext(r3, r1)     // Catch: java.lang.Throwable -> La9
        La8:
            throw r2     // Catch: java.lang.Throwable -> La9
        La9:
            r1 = move-exception
            r0.afterTask()     // Catch: java.lang.Throwable -> Lb0
            kotlin.Unit r0 = kotlin.Unit.INSTANCE     // Catch: java.lang.Throwable -> Lb0
            goto Lb5
        Lb0:
            r0 = move-exception
            kotlin.Result$Failure r0 = kotlin.ResultKt.createFailure(r0)
        Lb5:
            java.lang.Throwable r0 = kotlin.Result.m80exceptionOrNullimpl(r0)
            r12.handleFatalException(r1, r0)
        Lbc:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.DispatchedTask.run():void");
    }
}
