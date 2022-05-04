package kotlinx.coroutines;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CoroutineContext.kt */
/* loaded from: classes.dex */
public final class CoroutineContextKt {
    public static final boolean useCoroutinesScheduler;

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0027, code lost:
        if (r0.equals("on") != false) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0030, code lost:
        if (r0.equals("") != false) goto L19;
     */
    static {
        /*
            java.lang.String r0 = "kotlinx.coroutines.scheduler"
            java.lang.String r0 = kotlinx.coroutines.internal.SystemPropsKt.systemProp(r0)
            if (r0 == 0) goto L53
            int r1 = r0.hashCode()
            if (r1 == 0) goto L2a
            r2 = 3551(0xddf, float:4.976E-42)
            if (r1 == r2) goto L21
            r2 = 109935(0x1ad6f, float:1.54052E-40)
            if (r1 != r2) goto L33
            java.lang.String r1 = "off"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L33
            r0 = 0
            goto L54
        L21:
            java.lang.String r1 = "on"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L33
            goto L53
        L2a:
            java.lang.String r1 = ""
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L33
            goto L53
        L33:
            java.lang.IllegalStateException r1 = new java.lang.IllegalStateException
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.String r3 = "System property 'kotlinx.coroutines.scheduler' has unrecognized value '"
            r2.append(r3)
            r2.append(r0)
            r0 = 39
            r2.append(r0)
            java.lang.String r0 = r2.toString()
            java.lang.String r0 = r0.toString()
            r1.<init>(r0)
            throw r1
        L53:
            r0 = 1
        L54:
            kotlinx.coroutines.CoroutineContextKt.useCoroutinesScheduler = r0
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.CoroutineContextKt.<clinit>():void");
    }

    @NotNull
    public static final CoroutineContext newCoroutineContext(@NotNull CoroutineScope coroutineScope, @NotNull CoroutineContext context) {
        CoroutineContext coroutineContext;
        Intrinsics.checkNotNullParameter(coroutineScope, "<this>");
        Intrinsics.checkNotNullParameter(context, "context");
        CoroutineContext plus = coroutineScope.getCoroutineContext().plus(context);
        if (DebugKt.DEBUG) {
            coroutineContext = plus.plus(new CoroutineId(DebugKt.COROUTINE_ID.incrementAndGet()));
        } else {
            coroutineContext = plus;
        }
        ExecutorCoroutineDispatcher executorCoroutineDispatcher = Dispatchers.Default;
        if (plus == executorCoroutineDispatcher || plus.get(ContinuationInterceptor.Key.$$INSTANCE) != null) {
            return coroutineContext;
        }
        return coroutineContext.plus(executorCoroutineDispatcher);
    }

    @Nullable
    public static final UndispatchedCoroutine<?> updateUndispatchedCompletion(@NotNull Continuation<?> continuation, @NotNull CoroutineContext coroutineContext, @Nullable Object obj) {
        boolean z;
        UndispatchedCoroutine<?> undispatchedCoroutine = null;
        if (!(continuation instanceof CoroutineStackFrame)) {
            return null;
        }
        if (coroutineContext.get(UndispatchedMarker.INSTANCE) != null) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            return null;
        }
        CoroutineStackFrame coroutineStackFrame = (CoroutineStackFrame) continuation;
        while (true) {
            if (!(coroutineStackFrame instanceof DispatchedCoroutine) && (coroutineStackFrame = coroutineStackFrame.getCallerFrame()) != null) {
                if (coroutineStackFrame instanceof UndispatchedCoroutine) {
                    undispatchedCoroutine = (UndispatchedCoroutine) coroutineStackFrame;
                    break;
                }
            } else {
                break;
            }
        }
        if (undispatchedCoroutine != null) {
            undispatchedCoroutine.savedContext = coroutineContext;
            undispatchedCoroutine.savedOldValue = obj;
        }
        return undispatchedCoroutine;
    }
}
