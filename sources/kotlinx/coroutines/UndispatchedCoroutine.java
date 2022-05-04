package kotlinx.coroutines;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlinx.coroutines.internal.ScopeCoroutine;
import kotlinx.coroutines.internal.ThreadContextKt;
import org.jetbrains.annotations.Nullable;
/* compiled from: CoroutineContext.kt */
/* loaded from: classes.dex */
public final class UndispatchedCoroutine<T> extends ScopeCoroutine<T> {
    @Nullable
    public CoroutineContext savedContext;
    @Nullable
    public Object savedOldValue;

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public UndispatchedCoroutine(@org.jetbrains.annotations.NotNull kotlin.coroutines.CoroutineContext r3, @org.jetbrains.annotations.NotNull kotlin.coroutines.Continuation<? super T> r4) {
        /*
            r2 = this;
            java.lang.String r0 = "uCont"
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r4, r0)
            kotlinx.coroutines.UndispatchedMarker r0 = kotlinx.coroutines.UndispatchedMarker.INSTANCE
            kotlin.coroutines.CoroutineContext$Element r1 = r3.get(r0)
            if (r1 != 0) goto L11
            kotlin.coroutines.CoroutineContext r3 = r3.plus(r0)
        L11:
            r2.<init>(r3, r4)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.UndispatchedCoroutine.<init>(kotlin.coroutines.CoroutineContext, kotlin.coroutines.Continuation):void");
    }

    @Override // kotlinx.coroutines.internal.ScopeCoroutine, kotlinx.coroutines.AbstractCoroutine
    public final void afterResume(@Nullable Object obj) {
        CoroutineContext coroutineContext = this.savedContext;
        UndispatchedCoroutine<?> undispatchedCoroutine = null;
        if (coroutineContext != null) {
            ThreadContextKt.restoreThreadContext(coroutineContext, this.savedOldValue);
            this.savedContext = null;
            this.savedOldValue = null;
        }
        Object recoverResult = CompletionStateKt.recoverResult(obj, this.uCont);
        Continuation<T> continuation = this.uCont;
        CoroutineContext context = continuation.getContext();
        Object updateThreadContext = ThreadContextKt.updateThreadContext(context, null);
        if (updateThreadContext != ThreadContextKt.NO_THREAD_ELEMENTS) {
            undispatchedCoroutine = CoroutineContextKt.updateUndispatchedCompletion(continuation, context, updateThreadContext);
        }
        try {
            this.uCont.resumeWith(recoverResult);
        } finally {
            if (undispatchedCoroutine == null || undispatchedCoroutine.clearThreadContext()) {
                ThreadContextKt.restoreThreadContext(context, updateThreadContext);
            }
        }
    }

    public final boolean clearThreadContext() {
        if (this.savedContext == null) {
            return false;
        }
        this.savedContext = null;
        this.savedOldValue = null;
        return true;
    }
}
