package kotlinx.coroutines;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.internal.DispatchedContinuation;
import org.jetbrains.annotations.NotNull;
/* compiled from: DebugStrings.kt */
/* loaded from: classes.dex */
public final class DebugStringsKt {
    @NotNull
    public static final String getClassSimpleName(@NotNull Object obj) {
        Intrinsics.checkNotNullParameter(obj, "<this>");
        return obj.getClass().getSimpleName();
    }

    @NotNull
    public static final String getHexAddress(@NotNull Object obj) {
        Intrinsics.checkNotNullParameter(obj, "<this>");
        String hexString = Integer.toHexString(System.identityHashCode(obj));
        Intrinsics.checkNotNullExpressionValue(hexString, "toHexString(System.identityHashCode(this))");
        return hexString;
    }

    @NotNull
    public static final String toDebugString(@NotNull Continuation<?> continuation) {
        String str;
        Intrinsics.checkNotNullParameter(continuation, "<this>");
        if (continuation instanceof DispatchedContinuation) {
            return continuation.toString();
        }
        try {
            str = continuation + '@' + getHexAddress(continuation);
        } catch (Throwable th) {
            str = ResultKt.createFailure(th);
        }
        Throwable th2 = Result.m80exceptionOrNullimpl(str);
        String str2 = str;
        if (th2 != null) {
            str2 = ((Object) continuation.getClass().getName()) + '@' + getHexAddress(continuation);
        }
        return (String) str2;
    }
}
