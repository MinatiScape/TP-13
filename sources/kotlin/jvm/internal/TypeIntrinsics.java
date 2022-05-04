package kotlin.jvm.internal;

import androidx.concurrent.futures.AbstractResolvableFuture$$ExternalSyntheticOutline0;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
/* loaded from: classes.dex */
public final class TypeIntrinsics {
    public TypeIntrinsics() {
        throw null;
    }

    public static void beforeCheckcastToFunctionOfArity(Function2 function2) {
        int i;
        if (function2 != null) {
            boolean z = true;
            if (function2 instanceof FunctionBase) {
                i = ((FunctionBase) function2).getArity();
            } else if (function2 instanceof Function0) {
                i = 0;
            } else if (function2 instanceof Function1) {
                i = 1;
            } else {
                i = 2;
            }
            if (i != 2) {
                z = false;
            }
            if (!z) {
                ClassCastException classCastException = new ClassCastException(AbstractResolvableFuture$$ExternalSyntheticOutline0.m(function2.getClass().getName(), " cannot be cast to ", "kotlin.jvm.functions.Function2"));
                Intrinsics.sanitizeStackTrace(classCastException, TypeIntrinsics.class.getName());
                throw classCastException;
            }
        }
    }
}
