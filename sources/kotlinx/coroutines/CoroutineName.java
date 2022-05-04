package kotlinx.coroutines;

import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CoroutineName.kt */
/* loaded from: classes.dex */
public final class CoroutineName extends AbstractCoroutineContextElement {
    @NotNull
    public static final Key Key = new Key();

    /* compiled from: CoroutineName.kt */
    /* loaded from: classes.dex */
    public static final class Key implements CoroutineContext.Key<CoroutineName> {
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CoroutineName)) {
            return false;
        }
        ((CoroutineName) obj).getClass();
        return Intrinsics.areEqual(null, null);
    }

    public final int hashCode() {
        throw null;
    }

    @NotNull
    public final String toString() {
        return "CoroutineName(null)";
    }
}
