package com.bumptech.glide.load.engine.cache;

import android.app.ActivityManager;
import android.content.Context;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.format.Formatter;
import android.util.DisplayMetrics;
import android.util.Log;
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
    public interface ScreenDimensions {
    }

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

    public MemorySizeCalculator(Builder builder) {
        int i;
        ActivityManager activityManager;
        boolean z;
        Context context = builder.context;
        this.context = context;
        if (builder.activityManager.isLowRamDevice()) {
            i = QuickStepContract.SYSUI_STATE_DEVICE_DOZING;
        } else {
            i = QuickStepContract.SYSUI_STATE_BACK_DISABLED;
        }
        this.arrayPoolSize = i;
        int round = Math.round(activityManager.getMemoryClass() * QuickStepContract.SYSUI_STATE_SEARCH_DISABLED * QuickStepContract.SYSUI_STATE_SEARCH_DISABLED * (builder.activityManager.isLowRamDevice() ? 0.33f : 0.4f));
        DisplayMetrics displayMetrics = ((DisplayMetricsScreenDimensions) builder.screenDimensions).displayMetrics;
        float f = displayMetrics.widthPixels * displayMetrics.heightPixels * 4;
        int round2 = Math.round(builder.bitmapPoolScreens * f);
        int round3 = Math.round(f * builder.memoryCacheScreens);
        int i2 = round - i;
        int i3 = round3 + round2;
        if (i3 <= i2) {
            this.memoryCacheSize = round3;
            this.bitmapPoolSize = round2;
        } else {
            float f2 = i2;
            float f3 = builder.bitmapPoolScreens;
            float f4 = builder.memoryCacheScreens;
            float f5 = f2 / (f3 + f4);
            this.memoryCacheSize = Math.round(f4 * f5);
            this.bitmapPoolSize = Math.round(f5 * builder.bitmapPoolScreens);
        }
        if (Log.isLoggable("MemorySizeCalculator", 3)) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Calculation complete, Calculated memory cache size: ");
            m.append(Formatter.formatFileSize(context, this.memoryCacheSize));
            m.append(", pool size: ");
            m.append(Formatter.formatFileSize(context, this.bitmapPoolSize));
            m.append(", byte array size: ");
            m.append(Formatter.formatFileSize(context, i));
            m.append(", memory class limited? ");
            if (i3 > round) {
                z = true;
            } else {
                z = false;
            }
            m.append(z);
            m.append(", max size: ");
            m.append(Formatter.formatFileSize(context, round));
            m.append(", memoryClass: ");
            m.append(builder.activityManager.getMemoryClass());
            m.append(", isLowMemoryDevice: ");
            m.append(builder.activityManager.isLowRamDevice());
            Log.d("MemorySizeCalculator", m.toString());
        }
    }
}
