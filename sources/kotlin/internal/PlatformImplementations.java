package kotlin.internal;

import java.lang.reflect.Method;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public class PlatformImplementations {

    /* loaded from: classes.dex */
    public static final class ReflectThrowable {
        @Nullable
        public static final Method addSuppressed;

        /* JADX WARN: Code restructure failed: missing block: B:11:0x003c, code lost:
            if (kotlin.jvm.internal.Intrinsics.areEqual(r6, java.lang.Throwable.class) != false) goto L13;
         */
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
                java.lang.String r5 = "it"
                r6 = 0
                if (r4 >= r2) goto L47
                r7 = r1[r4]
                kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r7, r5)
                java.lang.String r8 = r7.getName()
                java.lang.String r9 = "addSuppressed"
                boolean r8 = kotlin.jvm.internal.Intrinsics.areEqual(r8, r9)
                r9 = 1
                if (r8 == 0) goto L3f
                java.lang.Class[] r8 = r7.getParameterTypes()
                java.lang.String r10 = "it.parameterTypes"
                kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r8, r10)
                java.lang.String r10 = "$this$singleOrNull"
                kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r8, r10)
                int r10 = r8.length
                if (r10 != r9) goto L38
                r6 = r8[r3]
            L38:
                boolean r6 = kotlin.jvm.internal.Intrinsics.areEqual(r6, r0)
                if (r6 == 0) goto L3f
                goto L40
            L3f:
                r9 = r3
            L40:
                if (r9 == 0) goto L44
                r6 = r7
                goto L47
            L44:
                int r4 = r4 + 1
                goto Le
            L47:
                kotlin.internal.PlatformImplementations.ReflectThrowable.addSuppressed = r6
                int r0 = r1.length
            L4a:
                if (r3 >= r0) goto L61
                r2 = r1[r3]
                kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r2, r5)
                java.lang.String r2 = r2.getName()
                java.lang.String r4 = "getSuppressed"
                boolean r2 = kotlin.jvm.internal.Intrinsics.areEqual(r2, r4)
                if (r2 == 0) goto L5e
                goto L61
            L5e:
                int r3 = r3 + 1
                goto L4a
            L61:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: kotlin.internal.PlatformImplementations.ReflectThrowable.<clinit>():void");
        }
    }

    public void addSuppressed(@NotNull Throwable th, @NotNull Throwable th2) {
        Method method = ReflectThrowable.addSuppressed;
        if (method != null) {
            method.invoke(th, th2);
        }
    }
}
