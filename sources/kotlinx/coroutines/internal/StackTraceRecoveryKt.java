package kotlinx.coroutines.internal;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: StackTraceRecovery.kt */
/* loaded from: classes.dex */
public final class StackTraceRecoveryKt {
    public static final String baseContinuationImplClassName;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v3, types: [kotlin.Result$Failure] */
    static {
        String str;
        Object obj;
        String str2 = "kotlin.coroutines.jvm.internal.BaseContinuationImpl";
        try {
            str = Class.forName(str2).getCanonicalName();
        } catch (Throwable th) {
            str = ResultKt.createFailure(th);
        }
        if (Result.m80exceptionOrNullimpl(str) == null) {
            str2 = str;
        }
        baseContinuationImplClassName = str2;
        try {
            obj = StackTraceRecoveryKt.class.getCanonicalName();
        } catch (Throwable th2) {
            obj = ResultKt.createFailure(th2);
        }
        if (Result.m80exceptionOrNullimpl(obj) != null) {
            obj = "kotlinx.coroutines.internal.StackTraceRecoveryKt";
        }
        String str3 = (String) obj;
    }

    public static final boolean isArtificial(@NotNull StackTraceElement stackTraceElement) {
        Intrinsics.checkNotNullParameter(stackTraceElement, "<this>");
        String className = stackTraceElement.getClassName();
        Intrinsics.checkNotNullExpressionValue(className, "className");
        return className.startsWith("\b\b\b");
    }

    @NotNull
    public static final <E extends Throwable> E unwrapImpl(@NotNull E exception) {
        Intrinsics.checkNotNullParameter(exception, "exception");
        E e = (E) exception.getCause();
        if (e != null && Intrinsics.areEqual(e.getClass(), exception.getClass())) {
            StackTraceElement[] stackTrace = exception.getStackTrace();
            Intrinsics.checkNotNullExpressionValue(stackTrace, "exception.stackTrace");
            int length = stackTrace.length;
            boolean z = false;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                StackTraceElement it = stackTrace[i];
                i++;
                Intrinsics.checkNotNullExpressionValue(it, "it");
                if (isArtificial(it)) {
                    z = true;
                    break;
                }
            }
            if (z) {
                return e;
            }
        }
        return exception;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:113:0x01f2  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x0065 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:187:0x017e A[EDGE_INSN: B:187:0x017e->B:81:0x017e ?: BREAK  , SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:206:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x007b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Throwable access$recoverFromStackFrame(java.lang.Throwable r13, kotlin.coroutines.jvm.internal.CoroutineStackFrame r14) {
        /*
            Method dump skipped, instructions count: 782
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.internal.StackTraceRecoveryKt.access$recoverFromStackFrame(java.lang.Throwable, kotlin.coroutines.jvm.internal.CoroutineStackFrame):java.lang.Throwable");
    }
}
