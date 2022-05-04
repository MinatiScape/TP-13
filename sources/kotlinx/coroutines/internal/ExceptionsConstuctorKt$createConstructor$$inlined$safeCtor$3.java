package kotlinx.coroutines.internal;

import java.lang.reflect.Constructor;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.TypeCastException;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
/* loaded from: classes.dex */
public final class ExceptionsConstuctorKt$createConstructor$$inlined$safeCtor$3 extends Lambda implements Function1<Throwable, Throwable> {
    public final /* synthetic */ Constructor $constructor$inlined;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ExceptionsConstuctorKt$createConstructor$$inlined$safeCtor$3(Constructor constructor) {
        super(1);
        this.$constructor$inlined = constructor;
    }

    @Override // kotlin.jvm.functions.Function1
    public Throwable invoke(Throwable th) {
        Object obj;
        Object newInstance;
        Throwable e = th;
        Intrinsics.checkParameterIsNotNull(e, "e");
        try {
            newInstance = this.$constructor$inlined.newInstance(e.getMessage());
        } catch (Throwable th2) {
            obj = ResultKt.createFailure(th2);
        }
        if (newInstance != null) {
            Throwable th3 = (Throwable) newInstance;
            th3.initCause(e);
            obj = th3;
            boolean z = obj instanceof Result.Failure;
            Object obj2 = obj;
            if (z) {
                obj2 = null;
            }
            return (Throwable) obj2;
        }
        throw new TypeCastException("null cannot be cast to non-null type kotlin.Throwable");
    }
}
