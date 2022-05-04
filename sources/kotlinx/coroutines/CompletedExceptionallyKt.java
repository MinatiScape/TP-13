package kotlinx.coroutines;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class CompletedExceptionallyKt {
    @Nullable
    public static final <T> Object toState(@NotNull Object obj) {
        if (!(obj instanceof Result.Failure)) {
            ResultKt.throwOnFailure(obj);
            return obj;
        }
        Throwable th = Result.m32exceptionOrNullimpl(obj);
        if (th != null) {
            return new CompletedExceptionally(th, false, 2);
        }
        Intrinsics.throwNpe();
        throw null;
    }
}
