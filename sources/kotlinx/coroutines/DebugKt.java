package kotlinx.coroutines;

import java.util.concurrent.atomic.AtomicLong;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class DebugKt {
    @NotNull
    public static final AtomicLong COROUTINE_ID;
    public static final boolean DEBUG;
    public static final boolean RECOVER_STACK_TRACES;

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0038, code lost:
        if (r0.equals("on") != false) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0041, code lost:
        if (r0.equals("") != false) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0043, code lost:
        r0 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0056, code lost:
        if ((r0 != null ? java.lang.Boolean.parseBoolean(r0) : true) != false) goto L30;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0048  */
    static {
        /*
            java.lang.String r0 = "kotlinx.coroutines.debug"
            java.lang.String r0 = kotlinx.coroutines.internal.SystemPropsKt.systemProp(r0)
            r1 = 1
            r2 = 0
            if (r0 != 0) goto Lb
            goto L30
        Lb:
            int r3 = r0.hashCode()
            if (r3 == 0) goto L3b
            r4 = 3551(0xddf, float:4.976E-42)
            if (r3 == r4) goto L32
            r4 = 109935(0x1ad6f, float:1.54052E-40)
            if (r3 == r4) goto L28
            r4 = 3005871(0x2dddaf, float:4.212122E-39)
            if (r3 != r4) goto L66
            java.lang.String r3 = "auto"
            boolean r3 = r0.equals(r3)
            if (r3 == 0) goto L66
            goto L30
        L28:
            java.lang.String r3 = "off"
            boolean r3 = r0.equals(r3)
            if (r3 == 0) goto L66
        L30:
            r0 = r2
            goto L44
        L32:
            java.lang.String r3 = "on"
            boolean r3 = r0.equals(r3)
            if (r3 == 0) goto L66
            goto L43
        L3b:
            java.lang.String r3 = ""
            boolean r3 = r0.equals(r3)
            if (r3 == 0) goto L66
        L43:
            r0 = r1
        L44:
            kotlinx.coroutines.DebugKt.DEBUG = r0
            if (r0 == 0) goto L59
            java.lang.String r0 = "kotlinx.coroutines.stacktrace.recovery"
            java.lang.String r0 = kotlinx.coroutines.internal.SystemPropsKt.systemProp(r0)
            if (r0 == 0) goto L55
            boolean r0 = java.lang.Boolean.parseBoolean(r0)
            goto L56
        L55:
            r0 = r1
        L56:
            if (r0 == 0) goto L59
            goto L5a
        L59:
            r1 = r2
        L5a:
            kotlinx.coroutines.DebugKt.RECOVER_STACK_TRACES = r1
            java.util.concurrent.atomic.AtomicLong r0 = new java.util.concurrent.atomic.AtomicLong
            r1 = 0
            r0.<init>(r1)
            kotlinx.coroutines.DebugKt.COROUTINE_ID = r0
            return
        L66:
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "System property 'kotlinx.coroutines.debug' has unrecognized value '"
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
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.DebugKt.<clinit>():void");
    }
}
