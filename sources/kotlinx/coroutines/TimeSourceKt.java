package kotlinx.coroutines;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class TimeSourceKt {
    @NotNull
    public static final String getClassSimpleName(@NotNull Object classSimpleName) {
        Intrinsics.checkParameterIsNotNull(classSimpleName, "$this$classSimpleName");
        return classSimpleName.getClass().getSimpleName();
    }

    @NotNull
    public static final String getHexAddress(@NotNull Object hexAddress) {
        Intrinsics.checkParameterIsNotNull(hexAddress, "$this$hexAddress");
        String hexString = Integer.toHexString(System.identityHashCode(hexAddress));
        Intrinsics.checkExpressionValueIsNotNull(hexString, "Integer.toHexString(System.identityHashCode(this))");
        return hexString;
    }
}
