package kotlinx.coroutines;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
/* compiled from: Executors.kt */
/* loaded from: classes.dex */
final class ExecutorCoroutineDispatcher$Key$1 extends Lambda implements Function1<CoroutineContext.Element, ExecutorCoroutineDispatcher> {
    public static final ExecutorCoroutineDispatcher$Key$1 INSTANCE = new ExecutorCoroutineDispatcher$Key$1();

    public ExecutorCoroutineDispatcher$Key$1() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final ExecutorCoroutineDispatcher invoke(CoroutineContext.Element element) {
        CoroutineContext.Element it = element;
        Intrinsics.checkNotNullParameter(it, "it");
        if (it instanceof ExecutorCoroutineDispatcher) {
            return (ExecutorCoroutineDispatcher) it;
        }
        return null;
    }
}
