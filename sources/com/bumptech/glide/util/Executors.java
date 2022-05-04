package com.bumptech.glide.util;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public final class Executors {
    public static final AnonymousClass1 MAIN_THREAD_EXECUTOR = new Executor() { // from class: com.bumptech.glide.util.Executors.1
        @Override // java.util.concurrent.Executor
        public final void execute(Runnable runnable) {
            Util.getUiThreadHandler().post(runnable);
        }
    };
    public static final AnonymousClass2 DIRECT_EXECUTOR = new Executor() { // from class: com.bumptech.glide.util.Executors.2
        @Override // java.util.concurrent.Executor
        public final void execute(Runnable runnable) {
            runnable.run();
        }
    };

    public static void shutdownAndAwaitTermination(ExecutorService executorService) {
        executorService.shutdownNow();
        try {
            TimeUnit timeUnit = TimeUnit.SECONDS;
            if (!executorService.awaitTermination(5L, timeUnit)) {
                executorService.shutdownNow();
                if (!executorService.awaitTermination(5L, timeUnit)) {
                    throw new RuntimeException("Failed to shutdown");
                }
            }
        } catch (InterruptedException e) {
            executorService.shutdownNow();
            Thread.currentThread().interrupt();
            throw new RuntimeException(e);
        }
    }
}
