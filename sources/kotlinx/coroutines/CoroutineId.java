package kotlinx.coroutines;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt__StringsKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CoroutineContext.kt */
/* loaded from: classes.dex */
public final class CoroutineId extends AbstractCoroutineContextElement implements ThreadContextElement<String> {
    @NotNull
    public static final Key Key = new Key();
    public final long id;

    /* compiled from: CoroutineContext.kt */
    /* loaded from: classes.dex */
    public static final class Key implements CoroutineContext.Key<CoroutineId> {
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof CoroutineId) && this.id == ((CoroutineId) obj).id;
    }

    public final int hashCode() {
        return Long.hashCode(this.id);
    }

    public CoroutineId(long j) {
        super(Key);
        this.id = j;
    }

    @Override // kotlinx.coroutines.ThreadContextElement
    public final void restoreThreadContext(CoroutineContext coroutineContext, String str) {
        String oldState = str;
        Intrinsics.checkNotNullParameter(oldState, "oldState");
        Thread.currentThread().setName(oldState);
    }

    @NotNull
    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("CoroutineId(");
        m.append(this.id);
        m.append(')');
        return m.toString();
    }

    @Override // kotlinx.coroutines.ThreadContextElement
    public final String updateThreadContext(CoroutineContext context) {
        Intrinsics.checkNotNullParameter(context, "context");
        CoroutineName coroutineName = (CoroutineName) context.get(CoroutineName.Key);
        Thread currentThread = Thread.currentThread();
        String oldName = currentThread.getName();
        Intrinsics.checkNotNullExpressionValue(oldName, "oldName");
        int lastIndexOf = oldName.lastIndexOf(" @", StringsKt__StringsKt.getLastIndex(oldName));
        if (lastIndexOf < 0) {
            lastIndexOf = oldName.length();
        }
        StringBuilder sb = new StringBuilder(lastIndexOf + 9 + 10);
        String substring = oldName.substring(0, lastIndexOf);
        Intrinsics.checkNotNullExpressionValue(substring, "this as java.lang.String…ing(startIndex, endIndex)");
        sb.append(substring);
        sb.append(" @");
        sb.append("coroutine");
        sb.append('#');
        sb.append(this.id);
        String sb2 = sb.toString();
        Intrinsics.checkNotNullExpressionValue(sb2, "StringBuilder(capacity).…builderAction).toString()");
        currentThread.setName(sb2);
        return oldName;
    }
}
