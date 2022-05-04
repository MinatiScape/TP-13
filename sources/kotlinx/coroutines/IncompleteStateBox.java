package kotlinx.coroutines;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: JobSupport.kt */
/* loaded from: classes.dex */
public final class IncompleteStateBox {
    @NotNull
    public final Incomplete state;

    public IncompleteStateBox(@NotNull Incomplete state) {
        Intrinsics.checkNotNullParameter(state, "state");
        this.state = state;
    }
}
