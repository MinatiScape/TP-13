package kotlinx.coroutines.internal;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.ThreadContextElement;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: ThreadContext.kt */
/* loaded from: classes.dex */
public final class ThreadContextKt {
    @NotNull
    public static final Symbol NO_THREAD_ELEMENTS = new Symbol("NO_THREAD_ELEMENTS");
    @NotNull
    public static final Function2<Object, CoroutineContext.Element, Object> countAll = ThreadContextKt$countAll$1.INSTANCE;
    @NotNull
    public static final Function2<ThreadContextElement<?>, CoroutineContext.Element, ThreadContextElement<?>> findOne = ThreadContextKt$findOne$1.INSTANCE;
    @NotNull
    public static final Function2<ThreadState, CoroutineContext.Element, ThreadState> updateState = ThreadContextKt$updateState$1.INSTANCE;

    public static final void restoreThreadContext(@NotNull CoroutineContext coroutineContext, @Nullable Object obj) {
        if (obj != NO_THREAD_ELEMENTS) {
            if (obj instanceof ThreadState) {
                ThreadState threadState = (ThreadState) obj;
                threadState.getClass();
                int length = threadState.elements.length - 1;
                if (length >= 0) {
                    while (true) {
                        int i = length - 1;
                        ThreadContextElement<Object> threadContextElement = threadState.elements[length];
                        Intrinsics.checkNotNull(threadContextElement);
                        threadContextElement.restoreThreadContext(coroutineContext, threadState.values[length]);
                        if (i >= 0) {
                            length = i;
                        } else {
                            return;
                        }
                    }
                }
            } else {
                Object fold = coroutineContext.fold(null, findOne);
                if (fold != null) {
                    ((ThreadContextElement) fold).restoreThreadContext(coroutineContext, obj);
                    return;
                }
                throw new NullPointerException("null cannot be cast to non-null type kotlinx.coroutines.ThreadContextElement<kotlin.Any?>");
            }
        }
    }

    @NotNull
    public static final Object threadContextElements(@NotNull CoroutineContext context) {
        Intrinsics.checkNotNullParameter(context, "context");
        Object fold = context.fold(0, countAll);
        Intrinsics.checkNotNull(fold);
        return fold;
    }

    @Nullable
    public static final Object updateThreadContext(@NotNull CoroutineContext context, @Nullable Object obj) {
        Intrinsics.checkNotNullParameter(context, "context");
        if (obj == null) {
            obj = threadContextElements(context);
        }
        if (obj == 0) {
            return NO_THREAD_ELEMENTS;
        }
        if (obj instanceof Integer) {
            return context.fold(new ThreadState(context, ((Number) obj).intValue()), updateState);
        }
        return ((ThreadContextElement) obj).updateThreadContext(context);
    }
}
