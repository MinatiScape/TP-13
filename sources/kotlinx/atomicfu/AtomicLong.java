package kotlinx.atomicfu;

import com.android.systemui.flags.FlagManager;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import kotlinx.atomicfu.TraceBase;
import org.jetbrains.annotations.NotNull;
/* compiled from: AtomicFU.kt */
/* loaded from: classes.dex */
public final class AtomicLong {
    @Deprecated
    public static final AtomicLongFieldUpdater<AtomicLong> FU = AtomicLongFieldUpdater.newUpdater(AtomicLong.class, FlagManager.EXTRA_VALUE);
    @NotNull
    public final TraceBase trace = TraceBase.None.INSTANCE;
    public volatile long value;

    public AtomicLong(long j) {
        this.value = j;
    }

    public final long addAndGet(long j) {
        int i = InterceptorKt.$r8$clinit;
        long addAndGet = FU.addAndGet(this, j);
        TraceBase traceBase = this.trace;
        if (traceBase != TraceBase.None.INSTANCE) {
            traceBase.getClass();
            TraceBase.append("addAndGet(" + j + "):" + addAndGet);
        }
        return addAndGet;
    }

    public final boolean compareAndSet(long j, long j2) {
        TraceBase traceBase;
        int i = InterceptorKt.$r8$clinit;
        boolean compareAndSet = FU.compareAndSet(this, j, j2);
        if (compareAndSet && (traceBase = this.trace) != TraceBase.None.INSTANCE) {
            traceBase.getClass();
            TraceBase.append("CAS(" + j + ", " + j2 + ')');
        }
        return compareAndSet;
    }

    public final void setValue(long j) {
        int i = InterceptorKt.$r8$clinit;
        this.value = j;
        TraceBase traceBase = this.trace;
        if (traceBase != TraceBase.None.INSTANCE) {
            traceBase.getClass();
            TraceBase.append("set(" + j + ')');
        }
    }

    @NotNull
    public final String toString() {
        return String.valueOf(this.value);
    }
}
