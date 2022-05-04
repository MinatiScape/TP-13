package kotlinx.coroutines.internal;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.MainCoroutineDispatcher;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: MainDispatchers.kt */
/* loaded from: classes.dex */
public final class MissingMainCoroutineDispatcher extends MainCoroutineDispatcher {
    @Nullable
    public final Throwable cause;
    @Nullable
    public final String errorHint;

    @Override // kotlinx.coroutines.MainCoroutineDispatcher
    @NotNull
    public final MainCoroutineDispatcher getImmediate() {
        return this;
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    public final void dispatch(CoroutineContext context, Runnable block) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(block, "block");
        missing();
        throw null;
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    public final boolean isDispatchNeeded(@NotNull CoroutineContext context) {
        Intrinsics.checkNotNullParameter(context, "context");
        missing();
        throw null;
    }

    public final void missing() {
        String str;
        if (this.cause != null) {
            String str2 = this.errorHint;
            if (str2 == null || (str = Intrinsics.stringPlus(". ", str2)) == null) {
                str = "";
            }
            throw new IllegalStateException(Intrinsics.stringPlus("Module with the Main dispatcher had failed to initialize", str), this.cause);
        }
        throw new IllegalStateException("Module with the Main dispatcher is missing. Add dependency providing the Main dispatcher, e.g. 'kotlinx-coroutines-android' and ensure it has the same version as 'kotlinx-coroutines-core'");
    }

    @Override // kotlinx.coroutines.MainCoroutineDispatcher, kotlinx.coroutines.CoroutineDispatcher
    @NotNull
    public final String toString() {
        String str;
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Dispatchers.Main[missing");
        Throwable th = this.cause;
        if (th != null) {
            str = Intrinsics.stringPlus(", cause=", th);
        } else {
            str = "";
        }
        m.append(str);
        m.append(']');
        return m.toString();
    }

    public MissingMainCoroutineDispatcher(@Nullable Throwable th, @Nullable String str) {
        this.cause = th;
        this.errorHint = str;
    }
}
