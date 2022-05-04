package kotlinx.coroutines.internal;

import kotlinx.coroutines.DebugStringsKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Atomic.kt */
/* loaded from: classes.dex */
public abstract class OpDescriptor {
    @Nullable
    public abstract Object perform(@Nullable Object obj);

    @NotNull
    public final String toString() {
        return DebugStringsKt.getClassSimpleName(this) + '@' + DebugStringsKt.getHexAddress(this);
    }
}
