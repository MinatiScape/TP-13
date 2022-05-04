package kotlinx.atomicfu;

import com.android.systemui.flags.FlagManager;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.atomicfu.TraceBase;
import org.jetbrains.annotations.NotNull;
/* compiled from: AtomicFU.kt */
/* loaded from: classes.dex */
public final class AtomicInt {
    @Deprecated
    public static final AtomicIntegerFieldUpdater<AtomicInt> FU = AtomicIntegerFieldUpdater.newUpdater(AtomicInt.class, FlagManager.EXTRA_VALUE);
    @NotNull
    public final TraceBase trace = TraceBase.None.INSTANCE;
    public volatile int value = 0;

    public final boolean compareAndSet(int i, int i2) {
        TraceBase traceBase;
        int i3 = InterceptorKt.$r8$clinit;
        boolean compareAndSet = FU.compareAndSet(this, i, i2);
        if (compareAndSet && (traceBase = this.trace) != TraceBase.None.INSTANCE) {
            traceBase.getClass();
            TraceBase.append("CAS(" + i + ", " + i2 + ')');
        }
        return compareAndSet;
    }

    public final int decrementAndGet() {
        int i = InterceptorKt.$r8$clinit;
        int decrementAndGet = FU.decrementAndGet(this);
        TraceBase traceBase = this.trace;
        if (traceBase != TraceBase.None.INSTANCE) {
            String stringPlus = Intrinsics.stringPlus("decAndGet():", Integer.valueOf(decrementAndGet));
            traceBase.getClass();
            TraceBase.append(stringPlus);
        }
        return decrementAndGet;
    }

    public final int incrementAndGet() {
        int i = InterceptorKt.$r8$clinit;
        int incrementAndGet = FU.incrementAndGet(this);
        TraceBase traceBase = this.trace;
        if (traceBase != TraceBase.None.INSTANCE) {
            String stringPlus = Intrinsics.stringPlus("incAndGet():", Integer.valueOf(incrementAndGet));
            traceBase.getClass();
            TraceBase.append(stringPlus);
        }
        return incrementAndGet;
    }

    public final void setValue(int i) {
        int i2 = InterceptorKt.$r8$clinit;
        this.value = i;
        TraceBase traceBase = this.trace;
        if (traceBase != TraceBase.None.INSTANCE) {
            traceBase.getClass();
            TraceBase.append("set(" + i + ')');
        }
    }

    @NotNull
    public final String toString() {
        return String.valueOf(this.value);
    }
}
