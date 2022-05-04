package kotlinx.coroutines;

import androidx.recyclerview.widget.RecyclerView;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.LockSupport;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: DefaultExecutor.kt */
/* loaded from: classes.dex */
public final class DefaultExecutor extends EventLoopImplBase implements Runnable {
    @NotNull
    public static final DefaultExecutor INSTANCE;
    public static final long KEEP_ALIVE_NANOS;
    @Nullable
    public static volatile Thread _thread;
    public static volatile int debugStatus;

    public final synchronized void acknowledgeShutdownIfNeeded() {
        boolean z;
        int i = debugStatus;
        if (i == 2 || i == 3) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            debugStatus = 3;
            this._queue.setValue(null);
            this._delayed.setValue(null);
            notifyAll();
        }
    }

    static {
        Long l;
        DefaultExecutor defaultExecutor = new DefaultExecutor();
        INSTANCE = defaultExecutor;
        defaultExecutor.incrementUseCount(false);
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        try {
            l = Long.getLong("kotlinx.coroutines.DefaultExecutor.keepAlive", 1000L);
        } catch (SecurityException unused) {
            l = 1000L;
        }
        Intrinsics.checkNotNullExpressionValue(l, "try {\n            java.l…AULT_KEEP_ALIVE\n        }");
        KEEP_ALIVE_NANOS = timeUnit.toNanos(l.longValue());
    }

    @Override // kotlinx.coroutines.EventLoopImplPlatform
    @NotNull
    public final Thread getThread() {
        Thread thread = _thread;
        if (thread == null) {
            synchronized (this) {
                thread = _thread;
                if (thread == null) {
                    thread = new Thread(this, "kotlinx.coroutines.DefaultExecutor");
                    _thread = thread;
                    thread.setDaemon(true);
                    thread.start();
                }
            }
        }
        return thread;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z;
        boolean z2;
        boolean z3;
        ThreadLocalEventLoop.ref.set(this);
        try {
            synchronized (this) {
                int i = debugStatus;
                if (i == 2 || i == 3) {
                    z = true;
                } else {
                    z = false;
                }
                if (z) {
                    z2 = false;
                } else {
                    debugStatus = 1;
                    notifyAll();
                    z2 = true;
                }
            }
            if (!z2) {
                _thread = null;
                acknowledgeShutdownIfNeeded();
                if (!isEmpty()) {
                    getThread();
                    return;
                }
                return;
            }
            long j = Long.MAX_VALUE;
            while (true) {
                Thread.interrupted();
                long processNextEvent = processNextEvent();
                if (processNextEvent == RecyclerView.FOREVER_NS) {
                    long nanoTime = System.nanoTime();
                    if (j == RecyclerView.FOREVER_NS) {
                        j = KEEP_ALIVE_NANOS + nanoTime;
                    }
                    long j2 = j - nanoTime;
                    if (j2 <= 0) {
                        _thread = null;
                        acknowledgeShutdownIfNeeded();
                        if (!isEmpty()) {
                            getThread();
                            return;
                        }
                        return;
                    } else if (processNextEvent > j2) {
                        processNextEvent = j2;
                    }
                } else {
                    j = Long.MAX_VALUE;
                }
                if (processNextEvent > 0) {
                    int i2 = debugStatus;
                    if (i2 == 2 || i2 == 3) {
                        z3 = true;
                    } else {
                        z3 = false;
                    }
                    if (z3) {
                        _thread = null;
                        acknowledgeShutdownIfNeeded();
                        if (!isEmpty()) {
                            getThread();
                            return;
                        }
                        return;
                    }
                    LockSupport.parkNanos(this, processNextEvent);
                }
            }
        } catch (Throwable th) {
            _thread = null;
            acknowledgeShutdownIfNeeded();
            if (!isEmpty()) {
                getThread();
            }
            throw th;
        }
    }
}
