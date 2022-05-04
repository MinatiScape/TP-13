package kotlinx.coroutines;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CompletionState.kt */
/* loaded from: classes.dex */
public final class CompletedWithCancellation {
    @NotNull
    public final Function1<Throwable, Unit> onCancellation;
    @Nullable
    public final Object result;

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CompletedWithCancellation)) {
            return false;
        }
        CompletedWithCancellation completedWithCancellation = (CompletedWithCancellation) obj;
        return Intrinsics.areEqual(this.result, completedWithCancellation.result) && Intrinsics.areEqual(this.onCancellation, completedWithCancellation.onCancellation);
    }

    public final int hashCode() {
        Object obj = this.result;
        return this.onCancellation.hashCode() + ((obj == null ? 0 : obj.hashCode()) * 31);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public CompletedWithCancellation(@Nullable Object obj, @NotNull Function1<? super Throwable, Unit> onCancellation) {
        Intrinsics.checkNotNullParameter(onCancellation, "onCancellation");
        this.result = obj;
        this.onCancellation = onCancellation;
    }

    @NotNull
    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("CompletedWithCancellation(result=");
        m.append(this.result);
        m.append(", onCancellation=");
        m.append(this.onCancellation);
        m.append(')');
        return m.toString();
    }
}
