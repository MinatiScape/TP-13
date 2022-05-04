package kotlinx.coroutines.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: ExceptionsConstuctor.kt */
/* loaded from: classes.dex */
public final class ExceptionsConstuctorKt$tryCopyException$4$1 extends Lambda implements Function1 {
    public static final ExceptionsConstuctorKt$tryCopyException$4$1 INSTANCE = new ExceptionsConstuctorKt$tryCopyException$4$1();

    public ExceptionsConstuctorKt$tryCopyException$4$1() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Throwable it = (Throwable) obj;
        Intrinsics.checkNotNullParameter(it, "it");
        return null;
    }
}
