package kotlinx.coroutines;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CancellableContinuationImpl.kt */
/* loaded from: classes.dex */
public final class CompletedContinuation {
    @Nullable
    public final Throwable cancelCause;
    @Nullable
    public final CancelHandler cancelHandler;
    @Nullable
    public final Object idempotentResume;
    @Nullable
    public final Function1<Throwable, Unit> onCancellation;
    @Nullable
    public final Object result;

    public /* synthetic */ CompletedContinuation() {
        throw null;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CompletedContinuation)) {
            return false;
        }
        CompletedContinuation completedContinuation = (CompletedContinuation) obj;
        return Intrinsics.areEqual(this.result, completedContinuation.result) && Intrinsics.areEqual(this.cancelHandler, completedContinuation.cancelHandler) && Intrinsics.areEqual(this.onCancellation, completedContinuation.onCancellation) && Intrinsics.areEqual(this.idempotentResume, completedContinuation.idempotentResume) && Intrinsics.areEqual(this.cancelCause, completedContinuation.cancelCause);
    }

    public final int hashCode() {
        Object obj = this.result;
        int i = 0;
        int hashCode = (obj == null ? 0 : obj.hashCode()) * 31;
        CancelHandler cancelHandler = this.cancelHandler;
        int hashCode2 = (hashCode + (cancelHandler == null ? 0 : cancelHandler.hashCode())) * 31;
        Function1<Throwable, Unit> function1 = this.onCancellation;
        int hashCode3 = (hashCode2 + (function1 == null ? 0 : function1.hashCode())) * 31;
        Object obj2 = this.idempotentResume;
        int hashCode4 = (hashCode3 + (obj2 == null ? 0 : obj2.hashCode())) * 31;
        Throwable th = this.cancelCause;
        if (th != null) {
            i = th.hashCode();
        }
        return hashCode4 + i;
    }

    @NotNull
    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("CompletedContinuation(result=");
        m.append(this.result);
        m.append(", cancelHandler=");
        m.append(this.cancelHandler);
        m.append(", onCancellation=");
        m.append(this.onCancellation);
        m.append(", idempotentResume=");
        m.append(this.idempotentResume);
        m.append(", cancelCause=");
        m.append(this.cancelCause);
        m.append(')');
        return m.toString();
    }
}
