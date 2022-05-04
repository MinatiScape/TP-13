package kotlinx.coroutines.internal;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt__StringsJVMKt;
import kotlinx.coroutines.DebugKt;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class StackTraceRecoveryKt {
    public static final String baseContinuationImplClassName;

    /* JADX WARN: Multi-variable type inference failed */
    static {
        String str;
        Object obj;
        String str2 = "kotlin.coroutines.jvm.internal.BaseContinuationImpl";
        try {
            str = Class.forName(str2).getCanonicalName();
        } catch (Throwable th) {
            str = ResultKt.createFailure(th);
        }
        if (Result.m32exceptionOrNullimpl(str) == null) {
            str2 = str;
        }
        baseContinuationImplClassName = str2;
        try {
            obj = StackTraceRecoveryKt.class.getCanonicalName();
        } catch (Throwable th2) {
            obj = ResultKt.createFailure(th2);
        }
        if (Result.m32exceptionOrNullimpl(obj) != null) {
            obj = "kotlinx.coroutines.internal.StackTraceRecoveryKt";
        }
        String str3 = (String) obj;
    }

    public static final boolean isArtificial(@NotNull StackTraceElement isArtificial) {
        Intrinsics.checkParameterIsNotNull(isArtificial, "$this$isArtificial");
        String className = isArtificial.getClassName();
        Intrinsics.checkExpressionValueIsNotNull(className, "className");
        return StringsKt__StringsJVMKt.startsWith$default(className, "\b\b\b", false, 2);
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:107:0x01e0  */
    /* JADX WARN: Removed duplicated region for block: B:173:0x007a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:186:0x0198 A[EDGE_INSN: B:186:0x0198->B:87:0x0198 ?: BREAK  , SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:206:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0091  */
    @org.jetbrains.annotations.NotNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final <E extends java.lang.Throwable> E recoverStackTrace(@org.jetbrains.annotations.NotNull E r12, @org.jetbrains.annotations.NotNull kotlin.coroutines.Continuation<?> r13) {
        /*
            Method dump skipped, instructions count: 762
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.internal.StackTraceRecoveryKt.recoverStackTrace(java.lang.Throwable, kotlin.coroutines.Continuation):java.lang.Throwable");
    }

    @NotNull
    public static final <E extends Throwable> E unwrap(@NotNull E exception) {
        E e;
        Intrinsics.checkParameterIsNotNull(exception, "exception");
        if (DebugKt.RECOVER_STACK_TRACES && (e = (E) exception.getCause()) != null) {
            boolean z = true;
            if (!(!Intrinsics.areEqual(e.getClass(), exception.getClass()))) {
                StackTraceElement[] stackTrace = exception.getStackTrace();
                Intrinsics.checkExpressionValueIsNotNull(stackTrace, "exception.stackTrace");
                int length = stackTrace.length;
                int i = 0;
                while (true) {
                    if (i >= length) {
                        z = false;
                        break;
                    }
                    StackTraceElement it = stackTrace[i];
                    Intrinsics.checkExpressionValueIsNotNull(it, "it");
                    if (isArtificial(it)) {
                        break;
                    }
                    i++;
                }
                if (z) {
                    return e;
                }
            }
        }
        return exception;
    }
}
