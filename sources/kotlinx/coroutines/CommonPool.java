package kotlinx.coroutines;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CommonPool.kt */
/* loaded from: classes.dex */
public final class CommonPool extends ExecutorCoroutineDispatcher {
    @NotNull
    public static final CommonPool INSTANCE = new CommonPool();
    @Nullable
    public static volatile ExecutorService pool;
    public static final int requestedParallelism;

    @Override // kotlinx.coroutines.CoroutineDispatcher
    @NotNull
    public final String toString() {
        return "CommonPool";
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x0080, code lost:
        if (r0.intValue() < 1) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0082, code lost:
        r2 = r0.intValue();
     */
    /* JADX WARN: Removed duplicated region for block: B:27:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x006e A[SYNTHETIC] */
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
            if (r1 != 0) goto L15
            goto L86
        L15:
            int r3 = r1.length()
            r4 = 1
            if (r3 != 0) goto L1e
            goto L7a
        L1e:
            r5 = 0
            char r6 = r1.charAt(r5)
            r7 = 48
            if (r6 >= r7) goto L28
            goto L2d
        L28:
            if (r6 != r7) goto L2c
            r2 = r5
            goto L2d
        L2c:
            r2 = r4
        L2d:
            r7 = -2147483647(0xffffffff80000001, float:-1.4E-45)
            if (r2 >= 0) goto L44
            if (r3 != r4) goto L35
            goto L7a
        L35:
            r2 = 45
            if (r6 != r2) goto L3d
            r7 = -2147483648(0xffffffff80000000, float:-0.0)
            r2 = r4
            goto L45
        L3d:
            r2 = 43
            if (r6 != r2) goto L7a
            r2 = r4
            r6 = r5
            goto L46
        L44:
            r2 = r5
        L45:
            r6 = r2
        L46:
            r8 = -59652323(0xfffffffffc71c71d, float:-5.0215282E36)
            r9 = r8
        L4a:
            if (r2 >= r3) goto L6e
            int r10 = r2 + 1
            char r2 = r1.charAt(r2)
            r11 = 10
            int r2 = java.lang.Character.digit(r2, r11)
            if (r2 >= 0) goto L5b
            goto L7a
        L5b:
            if (r5 >= r9) goto L64
            if (r9 != r8) goto L7a
            int r9 = r7 / 10
            if (r5 >= r9) goto L64
            goto L7a
        L64:
            int r5 = r5 * 10
            int r11 = r7 + r2
            if (r5 >= r11) goto L6b
            goto L7a
        L6b:
            int r5 = r5 - r2
            r2 = r10
            goto L4a
        L6e:
            if (r6 == 0) goto L75
            java.lang.Integer r0 = java.lang.Integer.valueOf(r5)
            goto L7a
        L75:
            int r0 = -r5
            java.lang.Integer r0 = java.lang.Integer.valueOf(r0)
        L7a:
            if (r0 == 0) goto L89
            int r2 = r0.intValue()
            if (r2 < r4) goto L89
            int r2 = r0.intValue()
        L86:
            kotlinx.coroutines.CommonPool.requestedParallelism = r2
            return
        L89:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r2 = "Expected positive number in kotlinx.coroutines.default.parallelism, but has "
            java.lang.String r1 = kotlin.jvm.internal.Intrinsics.stringPlus(r2, r1)
            java.lang.String r1 = r1.toString()
            r0.<init>(r1)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.CommonPool.<clinit>():void");
    }

    public static ExecutorService createPlainPool() {
        final AtomicInteger atomicInteger = new AtomicInteger();
        ExecutorService newFixedThreadPool = Executors.newFixedThreadPool(getParallelism(), new ThreadFactory() { // from class: kotlinx.coroutines.CommonPool$createPlainPool$1
            @Override // java.util.concurrent.ThreadFactory
            public final Thread newThread(Runnable runnable) {
                Thread thread = new Thread(runnable, Intrinsics.stringPlus("CommonPool-worker-", Integer.valueOf(atomicInteger.incrementAndGet())));
                thread.setDaemon(true);
                return thread;
            }
        });
        Intrinsics.checkNotNullExpressionValue(newFixedThreadPool, "val threadId = AtomicInt…Daemon = true }\n        }");
        return newFixedThreadPool;
    }

    public static int getParallelism() {
        boolean z;
        Integer valueOf = Integer.valueOf(requestedParallelism);
        if (valueOf.intValue() > 0) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            valueOf = null;
        }
        if (valueOf != null) {
            return valueOf.intValue();
        }
        int availableProcessors = Runtime.getRuntime().availableProcessors() - 1;
        if (availableProcessors < 1) {
            return 1;
        }
        return availableProcessors;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        throw new IllegalStateException("Close cannot be invoked on CommonPool".toString());
    }

    @Override // kotlinx.coroutines.CoroutineDispatcher
    public final void dispatch(@NotNull CoroutineContext context, @NotNull Runnable block) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(block, "block");
        try {
            ExecutorService executorService = pool;
            if (executorService == null) {
                synchronized (this) {
                    executorService = pool;
                    if (executorService == null) {
                        executorService = createPool();
                        pool = executorService;
                    }
                }
            }
            executorService.execute(block);
        } catch (RejectedExecutionException unused) {
            DefaultExecutor.INSTANCE.enqueue(block);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x006d A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.concurrent.ExecutorService createPool() {
        /*
            java.lang.SecurityManager r0 = java.lang.System.getSecurityManager()
            if (r0 == 0) goto Lb
            java.util.concurrent.ExecutorService r0 = createPlainPool()
            return r0
        Lb:
            r0 = 0
            java.lang.String r1 = "java.util.concurrent.ForkJoinPool"
            java.lang.Class r1 = java.lang.Class.forName(r1)     // Catch: java.lang.Throwable -> L13
            goto L14
        L13:
            r1 = r0
        L14:
            if (r1 != 0) goto L1b
            java.util.concurrent.ExecutorService r0 = createPlainPool()
            return r0
        L1b:
            int r2 = kotlinx.coroutines.CommonPool.requestedParallelism
            r3 = 1
            r4 = 0
            if (r2 >= 0) goto L6e
            java.lang.String r2 = "commonPool"
            java.lang.Class[] r5 = new java.lang.Class[r4]     // Catch: java.lang.Throwable -> L36
            java.lang.reflect.Method r2 = r1.getMethod(r2, r5)     // Catch: java.lang.Throwable -> L36
            java.lang.Object[] r5 = new java.lang.Object[r4]     // Catch: java.lang.Throwable -> L36
            java.lang.Object r2 = r2.invoke(r0, r5)     // Catch: java.lang.Throwable -> L36
            boolean r5 = r2 instanceof java.util.concurrent.ExecutorService     // Catch: java.lang.Throwable -> L36
            if (r5 == 0) goto L36
            java.util.concurrent.ExecutorService r2 = (java.util.concurrent.ExecutorService) r2     // Catch: java.lang.Throwable -> L36
            goto L37
        L36:
            r2 = r0
        L37:
            if (r2 != 0) goto L3a
            goto L6e
        L3a:
            kotlinx.coroutines.CommonPool r5 = kotlinx.coroutines.CommonPool.INSTANCE
            r5.getClass()
            kotlinx.coroutines.CommonPool$isGoodCommonPool$1 r5 = kotlinx.coroutines.CommonPool$isGoodCommonPool$1.INSTANCE
            r2.submit(r5)
            java.lang.String r5 = "getPoolSize"
            java.lang.Class[] r6 = new java.lang.Class[r4]     // Catch: java.lang.Throwable -> L59
            java.lang.reflect.Method r5 = r1.getMethod(r5, r6)     // Catch: java.lang.Throwable -> L59
            java.lang.Object[] r6 = new java.lang.Object[r4]     // Catch: java.lang.Throwable -> L59
            java.lang.Object r5 = r5.invoke(r2, r6)     // Catch: java.lang.Throwable -> L59
            boolean r6 = r5 instanceof java.lang.Integer     // Catch: java.lang.Throwable -> L59
            if (r6 == 0) goto L59
            java.lang.Integer r5 = (java.lang.Integer) r5     // Catch: java.lang.Throwable -> L59
            goto L5a
        L59:
            r5 = r0
        L5a:
            if (r5 != 0) goto L5d
            goto L65
        L5d:
            int r5 = r5.intValue()
            if (r5 < r3) goto L65
            r5 = r3
            goto L66
        L65:
            r5 = r4
        L66:
            if (r5 == 0) goto L69
            goto L6a
        L69:
            r2 = r0
        L6a:
            if (r2 != 0) goto L6d
            goto L6e
        L6d:
            return r2
        L6e:
            java.lang.Class[] r2 = new java.lang.Class[r3]     // Catch: java.lang.Throwable -> L94
            java.lang.Class r5 = java.lang.Integer.TYPE     // Catch: java.lang.Throwable -> L94
            r2[r4] = r5     // Catch: java.lang.Throwable -> L94
            java.lang.reflect.Constructor r1 = r1.getConstructor(r2)     // Catch: java.lang.Throwable -> L94
            java.lang.Object[] r2 = new java.lang.Object[r3]     // Catch: java.lang.Throwable -> L94
            kotlinx.coroutines.CommonPool r3 = kotlinx.coroutines.CommonPool.INSTANCE     // Catch: java.lang.Throwable -> L94
            r3.getClass()     // Catch: java.lang.Throwable -> L94
            int r3 = getParallelism()     // Catch: java.lang.Throwable -> L94
            java.lang.Integer r3 = java.lang.Integer.valueOf(r3)     // Catch: java.lang.Throwable -> L94
            r2[r4] = r3     // Catch: java.lang.Throwable -> L94
            java.lang.Object r1 = r1.newInstance(r2)     // Catch: java.lang.Throwable -> L94
            boolean r2 = r1 instanceof java.util.concurrent.ExecutorService     // Catch: java.lang.Throwable -> L94
            if (r2 == 0) goto L94
            java.util.concurrent.ExecutorService r1 = (java.util.concurrent.ExecutorService) r1     // Catch: java.lang.Throwable -> L94
            r0 = r1
        L94:
            if (r0 != 0) goto L9a
            java.util.concurrent.ExecutorService r0 = createPlainPool()
        L9a:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.CommonPool.createPool():java.util.concurrent.ExecutorService");
    }
}
