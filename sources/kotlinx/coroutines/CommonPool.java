package kotlinx.coroutines;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import java.lang.reflect.Method;
import java.util.Objects;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class CommonPool extends ExecutorCoroutineDispatcher {
    public static final CommonPool INSTANCE = new CommonPool();
    public static volatile Executor pool;
    public static final int requestedParallelism;

    /* JADX WARN: Code restructure failed: missing block: B:41:0x0088, code lost:
        if (r0.intValue() < 1) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x008a, code lost:
        r2 = r0.intValue();
     */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0076 A[SYNTHETIC] */
    static {
        /*
            kotlinx.coroutines.CommonPool r0 = new kotlinx.coroutines.CommonPool
            r0.<init>()
            kotlinx.coroutines.CommonPool.INSTANCE = r0
            r0 = 0
            java.lang.String r1 = "kotlinx.coroutines.default.parallelism"
            java.lang.String r1 = java.lang.System.getProperty(r1)     // Catch: java.lang.Throwable -> Lf
            goto L10
        Lf:
            r1 = r0
        L10:
            r2 = -1
            if (r1 == 0) goto L9f
            java.lang.String r3 = "$this$toIntOrNull"
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r1, r3)
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r1, r3)
            r3 = 10
            kotlin.text.CharsKt__CharKt.checkRadix(r3)
            int r4 = r1.length()
            r5 = 1
            if (r4 != 0) goto L29
            goto L82
        L29:
            r6 = 0
            char r7 = r1.charAt(r6)
            r8 = 48
            if (r7 >= r8) goto L33
            goto L38
        L33:
            if (r7 != r8) goto L37
            r2 = r6
            goto L38
        L37:
            r2 = r5
        L38:
            r8 = -2147483647(0xffffffff80000001, float:-1.4E-45)
            if (r2 >= 0) goto L4f
            if (r4 != r5) goto L40
            goto L82
        L40:
            r2 = 45
            if (r7 != r2) goto L48
            r8 = -2147483648(0xffffffff80000000, float:-0.0)
            r2 = r5
            goto L50
        L48:
            r2 = 43
            if (r7 != r2) goto L82
            r2 = r5
            r7 = r6
            goto L51
        L4f:
            r2 = r6
        L50:
            r7 = r2
        L51:
            r9 = -59652323(0xfffffffffc71c71d, float:-5.0215282E36)
            r10 = r9
        L55:
            if (r2 >= r4) goto L76
            char r11 = r1.charAt(r2)
            int r11 = java.lang.Character.digit(r11, r3)
            if (r11 >= 0) goto L62
            goto L82
        L62:
            if (r6 >= r10) goto L6b
            if (r10 != r9) goto L82
            int r10 = r8 / 10
            if (r6 >= r10) goto L6b
            goto L82
        L6b:
            int r6 = r6 * 10
            int r12 = r8 + r11
            if (r6 >= r12) goto L72
            goto L82
        L72:
            int r6 = r6 - r11
            int r2 = r2 + 1
            goto L55
        L76:
            if (r7 == 0) goto L7d
            java.lang.Integer r0 = java.lang.Integer.valueOf(r6)
            goto L82
        L7d:
            int r0 = -r6
            java.lang.Integer r0 = java.lang.Integer.valueOf(r0)
        L82:
            if (r0 == 0) goto L8f
            int r2 = r0.intValue()
            if (r2 < r5) goto L8f
            int r2 = r0.intValue()
            goto L9f
        L8f:
            java.lang.String r0 = "Expected positive number in kotlinx.coroutines.default.parallelism, but has "
            java.lang.String r0 = androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0.m(r0, r1)
            java.lang.IllegalStateException r1 = new java.lang.IllegalStateException
            java.lang.String r0 = r0.toString()
            r1.<init>(r0)
            throw r1
        L9f:
            kotlinx.coroutines.CommonPool.requestedParallelism = r2
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.CommonPool.<clinit>():void");
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        throw new IllegalStateException("Close cannot be invoked on CommonPool".toString());
    }

    public final ExecutorService createPlainPool() {
        final AtomicInteger atomicInteger = new AtomicInteger();
        ExecutorService newFixedThreadPool = Executors.newFixedThreadPool(getParallelism(), new ThreadFactory() { // from class: kotlinx.coroutines.CommonPool$createPlainPool$1
            @Override // java.util.concurrent.ThreadFactory
            @NotNull
            public final Thread newThread(Runnable runnable) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("CommonPool-worker-");
                m.append(atomicInteger.incrementAndGet());
                Thread thread = new Thread(runnable, m.toString());
                thread.setDaemon(true);
                return thread;
            }
        });
        Intrinsics.checkExpressionValueIsNotNull(newFixedThreadPool, "Executors.newFixedThread…Daemon = true }\n        }");
        return newFixedThreadPool;
    }

    public final ExecutorService createPool() {
        Class<?> fjpClass;
        ExecutorService executor;
        Integer num;
        if (System.getSecurityManager() != null) {
            return createPlainPool();
        }
        ExecutorService executorService = null;
        try {
            fjpClass = Class.forName("java.util.concurrent.ForkJoinPool");
        } catch (Throwable unused) {
            fjpClass = null;
        }
        if (fjpClass == null) {
            return createPlainPool();
        }
        if (requestedParallelism < 0) {
            try {
                Method method = fjpClass.getMethod("commonPool", new Class[0]);
                Object invoke = method != null ? method.invoke(null, new Object[0]) : null;
                if (!(invoke instanceof ExecutorService)) {
                    invoke = null;
                }
                executor = (ExecutorService) invoke;
            } catch (Throwable unused2) {
                executor = null;
            }
            if (executor != null) {
                Objects.requireNonNull(INSTANCE);
                Intrinsics.checkParameterIsNotNull(fjpClass, "fjpClass");
                Intrinsics.checkParameterIsNotNull(executor, "executor");
                executor.submit(CommonPool$isGoodCommonPool$1.INSTANCE);
                try {
                    Object invoke2 = fjpClass.getMethod("getPoolSize", new Class[0]).invoke(executor, new Object[0]);
                    if (!(invoke2 instanceof Integer)) {
                        invoke2 = null;
                    }
                    num = (Integer) invoke2;
                } catch (Throwable unused3) {
                    num = null;
                }
                if (!(num != null && num.intValue() >= 1)) {
                    executor = null;
                }
                if (executor != null) {
                    return executor;
                }
            }
        }
        try {
            Object newInstance = fjpClass.getConstructor(Integer.TYPE).newInstance(Integer.valueOf(INSTANCE.getParallelism()));
            if (!(newInstance instanceof ExecutorService)) {
                newInstance = null;
            }
            executorService = (ExecutorService) newInstance;
        } catch (Throwable unused4) {
        }
        return executorService != null ? executorService : createPlainPool();
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    public void dispatch(@NotNull CoroutineContext context, @NotNull Runnable runnable) {
        Intrinsics.checkParameterIsNotNull(context, "context");
        try {
            Executor executor = pool;
            if (executor == null) {
                synchronized (this) {
                    executor = pool;
                    if (executor == null) {
                        executor = createPool();
                        pool = executor;
                    }
                }
            }
            executor.execute(runnable);
        } catch (RejectedExecutionException unused) {
            DefaultExecutor.INSTANCE.enqueue(runnable);
        }
    }

    public final int getParallelism() {
        Integer valueOf = Integer.valueOf(requestedParallelism);
        int i = 1;
        if (!(valueOf.intValue() > 0)) {
            valueOf = null;
        }
        if (valueOf != null) {
            return valueOf.intValue();
        }
        int availableProcessors = Runtime.getRuntime().availableProcessors() - 1;
        if (availableProcessors >= 1) {
            i = availableProcessors;
        }
        return i;
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    @NotNull
    public String toString() {
        return "CommonPool";
    }
}
