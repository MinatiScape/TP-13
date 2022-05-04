package kotlinx.coroutines.internal;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlinx.coroutines.ThreadContextElement;
/* loaded from: classes.dex */
public final class ThreadContextKt$updateState$1 extends Lambda implements Function2<ThreadState, CoroutineContext.Element, ThreadState> {
    public static final ThreadContextKt$updateState$1 INSTANCE = new ThreadContextKt$updateState$1();

    public ThreadContextKt$updateState$1() {
        super(2);
    }

    @Override // kotlin.jvm.functions.Function2
    public ThreadState invoke(ThreadState threadState, CoroutineContext.Element element) {
        ThreadState state = threadState;
        CoroutineContext.Element element2 = element;
        Intrinsics.checkParameterIsNotNull(state, "state");
        Intrinsics.checkParameterIsNotNull(element2, "element");
        if (element2 instanceof ThreadContextElement) {
            Object updateThreadContext = ((ThreadContextElement) element2).updateThreadContext(state.context);
            Object[] objArr = state.a;
            int i = state.i;
            state.i = i + 1;
            objArr[i] = updateThreadContext;
        }
        return state;
    }
}
