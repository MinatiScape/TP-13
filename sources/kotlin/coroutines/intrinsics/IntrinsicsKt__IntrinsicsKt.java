package kotlin.coroutines.intrinsics;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: Intrinsics.kt */
/* loaded from: classes.dex */
public class IntrinsicsKt__IntrinsicsKt {
    @NotNull
    public static final Continuation createCoroutineUnintercepted(@NotNull Function2 function2, Object obj, @NotNull Continuation completion) {
        Intrinsics.checkNotNullParameter(completion, "completion");
        return ((BaseContinuationImpl) function2).create(obj, completion);
    }

    @NotNull
    public static final Continuation intercepted(@NotNull Continuation continuation) {
        ContinuationImpl continuationImpl;
        Intrinsics.checkNotNullParameter(continuation, "<this>");
        if (continuation instanceof ContinuationImpl) {
            continuationImpl = (ContinuationImpl) continuation;
        } else {
            continuationImpl = null;
        }
        if (continuationImpl == null) {
            return continuation;
        }
        return continuationImpl.intercepted();
    }
}
