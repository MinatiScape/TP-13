package kotlinx.coroutines;

import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.AbstractCoroutineContextKey;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlinx.coroutines.internal.DispatchedContinuation;
import kotlinx.coroutines.internal.DispatchedContinuationKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CoroutineDispatcher.kt */
/* loaded from: classes.dex */
public abstract class CoroutineDispatcher extends AbstractCoroutineContextElement implements ContinuationInterceptor {
    @NotNull
    public static final Key Key = new Key();

    /* compiled from: CoroutineDispatcher.kt */
    /* loaded from: classes.dex */
    public static final class Key extends AbstractCoroutineContextKey<ContinuationInterceptor, CoroutineDispatcher> {

        /* compiled from: CoroutineDispatcher.kt */
        /* renamed from: kotlinx.coroutines.CoroutineDispatcher$Key$1  reason: invalid class name */
        /* loaded from: classes.dex */
        public static final class AnonymousClass1 extends Lambda implements Function1<CoroutineContext.Element, CoroutineDispatcher> {
            public static final AnonymousClass1 INSTANCE = new AnonymousClass1();

            public AnonymousClass1() {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final CoroutineDispatcher invoke(CoroutineContext.Element element) {
                CoroutineContext.Element it = element;
                Intrinsics.checkNotNullParameter(it, "it");
                if (it instanceof CoroutineDispatcher) {
                    return (CoroutineDispatcher) it;
                }
                return null;
            }
        }

        public Key() {
            super(ContinuationInterceptor.Key.$$INSTANCE, AnonymousClass1.INSTANCE);
        }
    }

    public abstract void dispatch(@NotNull CoroutineContext coroutineContext, @NotNull Runnable runnable);

    public boolean isDispatchNeeded(@NotNull CoroutineContext context) {
        Intrinsics.checkNotNullParameter(context, "context");
        return true;
    }

    public CoroutineDispatcher() {
        super(ContinuationInterceptor.Key.$$INSTANCE);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v5 */
    @Override // kotlin.coroutines.AbstractCoroutineContextElement, kotlin.coroutines.CoroutineContext.Element, kotlin.coroutines.CoroutineContext
    @Nullable
    public final <E extends CoroutineContext.Element> E get(@NotNull CoroutineContext.Key<E> key) {
        ?? r3;
        boolean z;
        Intrinsics.checkNotNullParameter(key, "key");
        if (key instanceof AbstractCoroutineContextKey) {
            AbstractCoroutineContextKey abstractCoroutineContextKey = (AbstractCoroutineContextKey) key;
            CoroutineContext.Key<?> key2 = getKey();
            Intrinsics.checkNotNullParameter(key2, "key");
            if (key2 == abstractCoroutineContextKey || abstractCoroutineContextKey.topmostKey == key2) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                return null;
            }
            CoroutineContext.Element element = (CoroutineContext.Element) abstractCoroutineContextKey.safeCast.invoke(this);
            boolean z2 = element instanceof CoroutineContext.Element;
            r3 = element;
            if (!z2) {
                return null;
            }
        } else {
            this = this;
            if (ContinuationInterceptor.Key.$$INSTANCE != key) {
                r3 = 0;
            }
        }
        return r3;
    }

    @Override // kotlin.coroutines.ContinuationInterceptor
    @NotNull
    public final DispatchedContinuation interceptContinuation(@NotNull Continuation continuation) {
        Intrinsics.checkNotNullParameter(continuation, "continuation");
        return new DispatchedContinuation(this, continuation);
    }

    @Override // kotlin.coroutines.AbstractCoroutineContextElement, kotlin.coroutines.CoroutineContext
    @NotNull
    public final CoroutineContext minusKey(@NotNull CoroutineContext.Key<?> key) {
        boolean z;
        Intrinsics.checkNotNullParameter(key, "key");
        if (key instanceof AbstractCoroutineContextKey) {
            AbstractCoroutineContextKey abstractCoroutineContextKey = (AbstractCoroutineContextKey) key;
            CoroutineContext.Key<?> key2 = getKey();
            Intrinsics.checkNotNullParameter(key2, "key");
            if (key2 == abstractCoroutineContextKey || abstractCoroutineContextKey.topmostKey == key2) {
                z = true;
            } else {
                z = false;
            }
            if (!z || ((CoroutineContext.Element) abstractCoroutineContextKey.safeCast.invoke(this)) == null) {
                return this;
            }
            return EmptyCoroutineContext.INSTANCE;
        } else if (ContinuationInterceptor.Key.$$INSTANCE == key) {
            return EmptyCoroutineContext.INSTANCE;
        } else {
            return this;
        }
    }

    @Override // kotlin.coroutines.ContinuationInterceptor
    public final void releaseInterceptedContinuation(@NotNull Continuation<?> continuation) {
        CancellableContinuationImpl cancellableContinuationImpl;
        DispatchedContinuation dispatchedContinuation = (DispatchedContinuation) continuation;
        do {
        } while (dispatchedContinuation._reusableCancellableContinuation.value == DispatchedContinuationKt.REUSABLE_CLAIMED);
        Object obj = dispatchedContinuation._reusableCancellableContinuation.value;
        if (obj instanceof CancellableContinuationImpl) {
            cancellableContinuationImpl = (CancellableContinuationImpl) obj;
        } else {
            cancellableContinuationImpl = null;
        }
        if (cancellableContinuationImpl != null && cancellableContinuationImpl.parentHandle != null) {
            cancellableContinuationImpl.parentHandle = NonDisposableHandle.INSTANCE;
        }
    }

    @NotNull
    public String toString() {
        return DebugStringsKt.getClassSimpleName(this) + '@' + DebugStringsKt.getHexAddress(this);
    }
}
