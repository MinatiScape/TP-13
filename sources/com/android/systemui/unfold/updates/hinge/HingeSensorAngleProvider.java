package com.android.systemui.unfold.updates.hinge;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import androidx.core.util.Consumer;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class HingeSensorAngleProvider implements HingeAngleProvider {
    @NotNull
    private final SensorManager sensorManager;
    @NotNull
    private final HingeAngleSensorListener sensorListener = new HingeAngleSensorListener(this);
    @NotNull
    private final List<Consumer<Float>> listeners = new ArrayList();

    /* loaded from: classes.dex */
    public final class HingeAngleSensorListener implements SensorEventListener {
        public final /* synthetic */ HingeSensorAngleProvider this$0;

        public HingeAngleSensorListener(HingeSensorAngleProvider this$0) {
            Intrinsics.checkNotNullParameter(this$0, "this$0");
            this.this$0 = this$0;
        }

        @Override // android.hardware.SensorEventListener
        public void onAccuracyChanged(@Nullable Sensor sensor, int i) {
        }

        @Override // android.hardware.SensorEventListener
        public void onSensorChanged(@NotNull SensorEvent event) {
            Intrinsics.checkNotNullParameter(event, "event");
            for (Consumer consumer : this.this$0.listeners) {
                consumer.accept(Float.valueOf(event.values[0]));
            }
        }
    }

    public HingeSensorAngleProvider(@NotNull SensorManager sensorManager) {
        Intrinsics.checkNotNullParameter(sensorManager, "sensorManager");
        this.sensorManager = sensorManager;
    }

    @Override // com.android.systemui.unfold.updates.hinge.HingeAngleProvider
    public void start() {
        this.sensorManager.registerListener(this.sensorListener, this.sensorManager.getDefaultSensor(36), 0);
    }

    @Override // com.android.systemui.unfold.updates.hinge.HingeAngleProvider
    public void stop() {
        this.sensorManager.unregisterListener(this.sensorListener);
    }

    public void addCallback(@NotNull Consumer<Float> listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.listeners.add(listener);
    }

    public void removeCallback(@NotNull Consumer<Float> listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.listeners.remove(listener);
    }
}
