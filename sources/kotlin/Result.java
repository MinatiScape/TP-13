package kotlin;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import java.io.Serializable;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Result.kt */
/* loaded from: classes.dex */
public final class Result<T> implements Serializable {
    @Nullable
    private final Object value;

    /* compiled from: Result.kt */
    /* loaded from: classes.dex */
    public static final class Failure implements Serializable {
        @NotNull
        public final Throwable exception;

        public Failure(@NotNull Throwable exception) {
            Intrinsics.checkNotNullParameter(exception, "exception");
            this.exception = exception;
        }

        public final boolean equals(@Nullable Object obj) {
            if (!(obj instanceof Failure) || !Intrinsics.areEqual(this.exception, ((Failure) obj).exception)) {
                return false;
            }
            return true;
        }

        public final int hashCode() {
            return this.exception.hashCode();
        }

        @NotNull
        public final String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Failure(");
            m.append(this.exception);
            m.append(')');
            return m.toString();
        }
    }

    @Nullable
    /* renamed from: exceptionOrNull-impl  reason: not valid java name */
    public static final Throwable m80exceptionOrNullimpl(Object obj) {
        if (obj instanceof Failure) {
            return ((Failure) obj).exception;
        }
        return null;
    }

    public final boolean equals(Object obj) {
        Object obj2 = this.value;
        if ((obj instanceof Result) && Intrinsics.areEqual(obj2, ((Result) obj).value)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        Object obj = this.value;
        if (obj == null) {
            return 0;
        }
        return obj.hashCode();
    }

    @NotNull
    public final String toString() {
        Object obj = this.value;
        if (obj instanceof Failure) {
            return ((Failure) obj).toString();
        }
        return "Success(" + obj + ')';
    }
}
