package kotlin.internal;

import java.lang.reflect.Method;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.FallbackThreadLocalRandom;
import kotlin.random.Random;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: PlatformImplementations.kt */
/* loaded from: classes.dex */
public class PlatformImplementations {

    /* compiled from: PlatformImplementations.kt */
    /* loaded from: classes.dex */
    public static final class ReflectThrowable {
        @Nullable
        public static final Method addSuppressed;

        /* JADX WARN: Removed duplicated region for block: B:20:0x003a A[SYNTHETIC] */
        static {
            /*
                java.lang.Class<java.lang.Throwable> r0 = java.lang.Throwable.class
                java.lang.reflect.Method[] r1 = r0.getMethods()
                java.lang.String r2 = "throwableMethods"
                kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r2)
                int r2 = r1.length
                r3 = 0
                r4 = r3
            Le:
                r5 = 0
                if (r4 >= r2) goto L3b
                r6 = r1[r4]
                int r4 = r4 + 1
                java.lang.String r7 = r6.getName()
                java.lang.String r8 = "addSuppressed"
                boolean r7 = kotlin.jvm.internal.Intrinsics.areEqual(r7, r8)
                r8 = 1
                if (r7 == 0) goto L37
                java.lang.Class[] r7 = r6.getParameterTypes()
                java.lang.String r9 = "it.parameterTypes"
                kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r7, r9)
                int r9 = r7.length
                if (r9 != r8) goto L30
                r5 = r7[r3]
            L30:
                boolean r5 = kotlin.jvm.internal.Intrinsics.areEqual(r5, r0)
                if (r5 == 0) goto L37
                goto L38
            L37:
                r8 = r3
            L38:
                if (r8 == 0) goto Le
                r5 = r6
            L3b:
                kotlin.internal.PlatformImplementations.ReflectThrowable.addSuppressed = r5
                int r0 = r1.length
            L3e:
                if (r3 >= r0) goto L50
                r2 = r1[r3]
                int r3 = r3 + 1
                java.lang.String r2 = r2.getName()
                java.lang.String r4 = "getSuppressed"
                boolean r2 = kotlin.jvm.internal.Intrinsics.areEqual(r2, r4)
                if (r2 == 0) goto L3e
            L50:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: kotlin.internal.PlatformImplementations.ReflectThrowable.<clinit>():void");
        }
    }

    public void addSuppressed(@NotNull Throwable cause, @NotNull Throwable exception) {
        Intrinsics.checkNotNullParameter(cause, "cause");
        Intrinsics.checkNotNullParameter(exception, "exception");
        Method method = ReflectThrowable.addSuppressed;
        if (method != null) {
            method.invoke(cause, exception);
        }
    }

    @NotNull
    public Random defaultPlatformRandom() {
        return new FallbackThreadLocalRandom();
    }
}
