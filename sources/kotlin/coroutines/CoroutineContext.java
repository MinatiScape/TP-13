package kotlin.coroutines;

import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CoroutineContext.kt */
/* loaded from: classes.dex */
public interface CoroutineContext {

    /* compiled from: CoroutineContext.kt */
    /* loaded from: classes.dex */
    public static final class DefaultImpls {
        @NotNull
        public static CoroutineContext plus(@NotNull CoroutineContext coroutineContext, @NotNull CoroutineContext context) {
            Intrinsics.checkNotNullParameter(coroutineContext, "this");
            Intrinsics.checkNotNullParameter(context, "context");
            if (context == EmptyCoroutineContext.INSTANCE) {
                return coroutineContext;
            }
            return (CoroutineContext) context.fold(coroutineContext, CoroutineContext$plus$1.INSTANCE);
        }
    }

    /* compiled from: CoroutineContext.kt */
    /* loaded from: classes.dex */
    public interface Element extends CoroutineContext {

        /* compiled from: CoroutineContext.kt */
        /* loaded from: classes.dex */
        public static final class DefaultImpls {
            public static <R> R fold(@NotNull Element element, R r, @NotNull Function2<? super R, ? super Element, ? extends R> operation) {
                Intrinsics.checkNotNullParameter(element, "this");
                Intrinsics.checkNotNullParameter(operation, "operation");
                return operation.invoke(r, element);
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Nullable
            public static <E extends Element> E get(@NotNull Element element, @NotNull Key<E> key) {
                Intrinsics.checkNotNullParameter(element, "this");
                Intrinsics.checkNotNullParameter(key, "key");
                if (Intrinsics.areEqual(element.getKey(), key)) {
                    return element;
                }
                return null;
            }

            @NotNull
            public static CoroutineContext minusKey(@NotNull Element element, @NotNull Key<?> key) {
                Intrinsics.checkNotNullParameter(element, "this");
                Intrinsics.checkNotNullParameter(key, "key");
                if (Intrinsics.areEqual(element.getKey(), key)) {
                    return EmptyCoroutineContext.INSTANCE;
                }
                return element;
            }
        }

        @Override // kotlin.coroutines.CoroutineContext
        @Nullable
        <E extends Element> E get(@NotNull Key<E> key);

        @NotNull
        Key<?> getKey();
    }

    /* compiled from: CoroutineContext.kt */
    /* loaded from: classes.dex */
    public interface Key<E extends Element> {
    }

    <R> R fold(R r, @NotNull Function2<? super R, ? super Element, ? extends R> function2);

    @Nullable
    <E extends Element> E get(@NotNull Key<E> key);

    @NotNull
    CoroutineContext minusKey(@NotNull Key<?> key);

    @NotNull
    CoroutineContext plus(@NotNull CoroutineContext coroutineContext);
}
