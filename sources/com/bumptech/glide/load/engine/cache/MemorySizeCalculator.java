package com.bumptech.glide.load.engine.cache;

import android.app.ActivityManager;
import android.content.Context;
import android.text.format.Formatter;
import android.util.DisplayMetrics;
import android.util.Log;
import androidx.recyclerview.R$attr$$ExternalSyntheticOutline0;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public final class MemorySizeCalculator {
    public static final int BYTES_PER_ARGB_8888_PIXEL = 4;
    public final int arrayPoolSize;
    public final int bitmapPoolSize;
    public final Context context;
    public final int memoryCacheSize;

    /* loaded from: classes.dex */
    public static final class Builder {
        public static final int MEMORY_CACHE_TARGET_SCREENS = 2;
        public ActivityManager activityManager;
        public float bitmapPoolScreens;
        public final Context context;
        public float memoryCacheScreens = 2.0f;
        public ScreenDimensions screenDimensions;

        public Builder(Context context) {
            this.bitmapPoolScreens = 1;
            this.context = context;
            this.activityManager = (ActivityManager) context.getSystemService("activity");
            this.screenDimensions = new DisplayMetricsScreenDimensions(context.getResources().getDisplayMetrics());
            if (this.activityManager.isLowRamDevice()) {
                this.bitmapPoolScreens = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            }
        }

        public Builder setActivityManager(ActivityManager activityManager) {
            this.activityManager = activityManager;
            return this;
        }

        public Builder setScreenDimensions(ScreenDimensions screenDimensions) {
            this.screenDimensions = screenDimensions;
            return this;
        }
    }

    /* loaded from: classes.dex */
    public static final class DisplayMetricsScreenDimensions implements ScreenDimensions {
        public final DisplayMetrics displayMetrics;

        public DisplayMetricsScreenDimensions(DisplayMetrics displayMetrics) {
            this.displayMetrics = displayMetrics;
        }
    }

    /* loaded from: classes.dex */
    public interface ScreenDimensions {
    }

    public MemorySizeCalculator(Builder builder) {
        this.context = builder.context;
        int i = builder.activityManager.isLowRamDevice() ? QuickStepContract.SYSUI_STATE_DEVICE_DOZING : QuickStepContract.SYSUI_STATE_BACK_DISABLED;
        this.arrayPoolSize = i;
        ActivityManager activityManager = builder.activityManager;
        float f = 0.4f;
        f = 0.33f;
        float memoryClass = activityManager.getMemoryClass() * QuickStepContract.SYSUI_STATE_SEARCH_DISABLED * QuickStepContract.SYSUI_STATE_SEARCH_DISABLED;
        if (activityManager.isLowRamDevice()) {
        }
        int round = Math.round(memoryClass * f);
        DisplayMetrics displayMetrics = ((DisplayMetricsScreenDimensions) builder.screenDimensions).displayMetrics;
        float f2 = displayMetrics.widthPixels * displayMetrics.heightPixels * 4;
        int round2 = Math.round(builder.bitmapPoolScreens * f2);
        int round3 = Math.round(f2 * builder.memoryCacheScreens);
        int i2 = round - i;
        int i3 = round3 + round2;
        if (i3 <= i2) {
            this.memoryCacheSize = round3;
            this.bitmapPoolSize = round2;
        } else {
            float f3 = i2;
            float f4 = builder.bitmapPoolScreens;
            float f5 = builder.memoryCacheScreens;
            float f6 = f3 / (f4 + f5);
            this.memoryCacheSize = Math.round(f5 * f6);
            this.bitmapPoolSize = Math.round(f6 * builder.bitmapPoolScreens);
        }
        if (Log.isLoggable("MemorySizeCalculator", 3)) {
            String mb = toMb(this.memoryCacheSize);
            String mb2 = toMb(this.bitmapPoolSize);
            String mb3 = toMb(i);
            boolean z = i3 > round;
            String mb4 = toMb(round);
            int memoryClass2 = builder.activityManager.getMemoryClass();
            boolean isLowRamDevice = builder.activityManager.isLowRamDevice();
            StringBuilder m = R$attr$$ExternalSyntheticOutline0.m(XMPPathFactory$$ExternalSyntheticOutline0.m(mb4, XMPPathFactory$$ExternalSyntheticOutline0.m(mb3, XMPPathFactory$$ExternalSyntheticOutline0.m(mb2, XMPPathFactory$$ExternalSyntheticOutline0.m(mb, 177)))), "Calculation complete, Calculated memory cache size: ", mb, ", pool size: ", mb2);
            m.append(", byte array size: ");
            m.append(mb3);
            m.append(", memory class limited? ");
            m.append(z);
            m.append(", max size: ");
            m.append(mb4);
            m.append(", memoryClass: ");
            m.append(memoryClass2);
            m.append(", isLowMemoryDevice: ");
            m.append(isLowRamDevice);
            Log.d("MemorySizeCalculator", m.toString());
        }
    }

    public final String toMb(int bytes) {
        return Formatter.formatFileSize(this.context, bytes);
    }
}
