package kotlinx.coroutines.internal;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineScope;
import org.jetbrains.annotations.NotNull;
/* compiled from: Scopes.kt */
/* loaded from: classes.dex */
public final class ContextScope implements CoroutineScope {
    @NotNull
    public final CoroutineContext coroutineContext;

    public ContextScope(@NotNull CoroutineContext context) {
        Intrinsics.checkNotNullParameter(context, "context");
        this.coroutineContext = context;
    }

    @NotNull
    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("CoroutineScope(coroutineContext=");
        m.append(this.coroutineContext);
        m.append(')');
        return m.toString();
    }

    @Override // kotlinx.coroutines.CoroutineScope
    @NotNull
    public final CoroutineContext getCoroutineContext() {
        return this.coroutineContext;
    }
}
