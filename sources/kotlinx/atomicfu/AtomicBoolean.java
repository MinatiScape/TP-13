package kotlinx.atomicfu;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlinx.atomicfu.TraceBase;
import org.jetbrains.annotations.NotNull;
/* compiled from: AtomicFU.kt */
/* loaded from: classes.dex */
public final class AtomicBoolean {
    @Deprecated
    public static final AtomicIntegerFieldUpdater<AtomicBoolean> FU = AtomicIntegerFieldUpdater.newUpdater(AtomicBoolean.class, "_value");
    public volatile int _value;
    @NotNull
    public final TraceBase trace = TraceBase.None.INSTANCE;

    public AtomicBoolean(boolean z) {
        this._value = z ? 1 : 0;
    }

    public final boolean compareAndSet() {
        TraceBase traceBase;
        int i = InterceptorKt.$r8$clinit;
        boolean compareAndSet = FU.compareAndSet(this, 0, 1);
        if (compareAndSet && (traceBase = this.trace) != TraceBase.None.INSTANCE) {
            traceBase.getClass();
            TraceBase.append("CAS(false, true)");
        }
        return compareAndSet;
    }

    public final void setValue() {
        int i = InterceptorKt.$r8$clinit;
        this._value = 1;
        TraceBase traceBase = this.trace;
        if (traceBase != TraceBase.None.INSTANCE) {
            traceBase.getClass();
            TraceBase.append("set(true)");
        }
    }

    @NotNull
    public final String toString() {
        boolean z;
        if (this._value != 0) {
            z = true;
        } else {
            z = false;
        }
        return String.valueOf(z);
    }
}
