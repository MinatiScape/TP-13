package kotlinx.atomicfu;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: Trace.common.kt */
/* loaded from: classes.dex */
public class TraceBase {

    /* compiled from: Trace.common.kt */
    /* loaded from: classes.dex */
    public static final class None extends TraceBase {
        @NotNull
        public static final None INSTANCE = new None();
    }

    public static void append(@NotNull String event) {
        Intrinsics.checkNotNullParameter(event, "event");
    }
}
