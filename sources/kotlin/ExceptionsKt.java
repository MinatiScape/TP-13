package kotlin;

import kotlin.internal.PlatformImplementationsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: Exceptions.kt */
/* loaded from: classes.dex */
public final class ExceptionsKt {
    public static final void addSuppressed(@NotNull Throwable th, @NotNull Throwable exception) {
        Intrinsics.checkNotNullParameter(th, "<this>");
        Intrinsics.checkNotNullParameter(exception, "exception");
        if (th != exception) {
            PlatformImplementationsKt.IMPLEMENTATIONS.addSuppressed(th, exception);
        }
    }
}
