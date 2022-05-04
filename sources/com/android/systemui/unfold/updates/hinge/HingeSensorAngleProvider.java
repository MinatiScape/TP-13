package com.android.systemui.unfold.updates.hinge;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Trace;
import androidx.core.util.Consumer;
import com.android.systemui.unfold.updates.hinge.HingeSensorAngleProvider;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: HingeSensorAngleProvider.kt */
/* loaded from: classes.dex */
public final class HingeSensorAngleProvider implements HingeAngleProvider {
    @NotNull
    private final Executor executor;
    @NotNull
    private final SensorManager sensorManager;
    @NotNull
    private final HingeAngleSensorListener sensorListener = new HingeAngleSensorListener(this);
    @NotNull
    private final List<Consumer<Float>> listeners = new ArrayList();

    /* compiled from: HingeSensorAngleProvider.kt */
    /* loaded from: classes.dex */
    public final class HingeAngleSensorListener implements SensorEventListener {
        public final /* synthetic */ HingeSensorAngleProvider this$0;

        @Override // android.hardware.SensorEventListener
        public void onAccuracyChanged(@Nullable Sensor sensor, int i) {
        }

        public HingeAngleSensorListener(HingeSensorAngleProvider this$0) {
            Intrinsics.checkNotNullParameter(this$0, "this$0");
            this.this$0 = this$0;
        }

        @Override // android.hardware.SensorEventListener
        public void onSensorChanged(@NotNull SensorEvent event) {
            Intrinsics.checkNotNullParameter(event, "event");
            for (Consumer consumer : this.this$0.listeners) {
                consumer.accept(Float.valueOf(event.values[0]));
            }
        }
    }

    public HingeSensorAngleProvider(@NotNull SensorManager sensorManager, @NotNull Executor executor) {
        Intrinsics.checkNotNullParameter(sensorManager, "sensorManager");
        Intrinsics.checkNotNullParameter(executor, "executor");
        this.sensorManager = sensorManager;
        this.executor = executor;
    }

    public void addCallback(@NotNull Consumer<Float> listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.listeners.add(listener);
    }

    public void removeCallback(@NotNull Consumer<Float> listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.listeners.remove(listener);
    }

    @Override // com.android.systemui.unfold.updates.hinge.HingeAngleProvider
    public void start() {
        this.executor.execute(new Runnable() { // from class: com.android.systemui.unfold.updates.hinge.HingeSensorAngleProvider$start$1
            @Override // java.lang.Runnable
            public final void run() {
                SensorManager sensorManager;
                SensorManager sensorManager2;
                HingeSensorAngleProvider.HingeAngleSensorListener hingeAngleSensorListener;
                Trace.beginSection("HingeSensorAngleProvider#start");
                sensorManager = HingeSensorAngleProvider.this.sensorManager;
                Sensor defaultSensor = sensorManager.getDefaultSensor(36);
                sensorManager2 = HingeSensorAngleProvider.this.sensorManager;
                hingeAngleSensorListener = HingeSensorAngleProvider.this.sensorListener;
                sensorManager2.registerListener(hingeAngleSensorListener, defaultSensor, 0);
                Trace.endSection();
            }
        });
    }

    @Override // com.android.systemui.unfold.updates.hinge.HingeAngleProvider
    public void stop() {
        this.executor.execute(new Runnable() { // from class: com.android.systemui.unfold.updates.hinge.HingeSensorAngleProvider$stop$1
            @Override // java.lang.Runnable
            public final void run() {
                SensorManager sensorManager;
                HingeSensorAngleProvider.HingeAngleSensorListener hingeAngleSensorListener;
                sensorManager = HingeSensorAngleProvider.this.sensorManager;
                hingeAngleSensorListener = HingeSensorAngleProvider.this.sensorListener;
                sensorManager.unregisterListener(hingeAngleSensorListener);
            }
        });
    }
}
