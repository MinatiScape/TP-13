package kotlinx.coroutines;

import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class CoroutineContextKt {
    public static final boolean useCoroutinesScheduler;

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0028, code lost:
        if (r0.equals("on") != false) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0031, code lost:
        if (r0.equals("") != false) goto L17;
     */
    static {
        /*
            java.lang.String r0 = "kotlinx.coroutines.scheduler"
            java.lang.String r0 = kotlinx.coroutines.internal.SystemPropsKt.systemProp(r0)
            if (r0 != 0) goto L9
            goto L33
        L9:
            int r1 = r0.hashCode()
            if (r1 == 0) goto L2b
            r2 = 3551(0xddf, float:4.976E-42)
            if (r1 == r2) goto L22
            r2 = 109935(0x1ad6f, float:1.54052E-40)
            if (r1 != r2) goto L37
            java.lang.String r1 = "off"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L37
            r0 = 0
            goto L34
        L22:
            java.lang.String r1 = "on"
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L37
            goto L33
        L2b:
            java.lang.String r1 = ""
            boolean r1 = r0.equals(r1)
            if (r1 == 0) goto L37
        L33:
            r0 = 1
        L34:
            kotlinx.coroutines.CoroutineContextKt.useCoroutinesScheduler = r0
            return
        L37:
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "System property 'kotlinx.coroutines.scheduler' has unrecognized value '"
            r1.append(r2)
            r1.append(r0)
            r0 = 39
            r1.append(r0)
            java.lang.String r0 = r1.toString()
            java.lang.IllegalStateException r1 = new java.lang.IllegalStateException
            java.lang.String r0 = r0.toString()
            r1.<init>(r0)
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.CoroutineContextKt.<clinit>():void");
    }

    @NotNull
    public static final CoroutineContext newCoroutineContext(@NotNull CoroutineScope coroutineScope, @NotNull CoroutineContext context) {
        Intrinsics.checkParameterIsNotNull(context, "context");
        CoroutineContext plus = coroutineScope.getCoroutineContext().plus(context);
        CoroutineContext plus2 = DebugKt.DEBUG ? plus.plus(new CoroutineId(DebugKt.COROUTINE_ID.incrementAndGet())) : plus;
        CoroutineDispatcher coroutineDispatcher = Dispatchers.Default;
        if (plus == coroutineDispatcher) {
            return plus2;
        }
        int i = ContinuationInterceptor.$r8$clinit;
        return plus.get(ContinuationInterceptor.Key.$$INSTANCE) == null ? plus2.plus(coroutineDispatcher) : plus2;
    }
}
