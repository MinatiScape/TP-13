package com.bumptech.glide.load.resource.bitmap;

import android.util.Log;
import java.io.File;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public final class HardwareConfigState {
    public static final int MIN_HARDWARE_DIMENSION_O = 128;
    public static volatile HardwareConfigState instance;
    public int decodesSinceLastFdCheck;
    public boolean isFdSizeBelowHardwareLimit = true;
    public final AtomicBoolean isHardwareConfigAllowedByAppState = new AtomicBoolean(false);
    public final boolean isHardwareConfigAllowedByDeviceModel = true;
    public final int sdkBasedMaxFdCount = 20000;
    public static final File FD_SIZE_LIST = new File("/proc/self/fd");
    public static volatile int manualOverrideMaxFdCount = -1;

    public final boolean isHardwareConfigAllowed(int i, int i2, boolean z, boolean z2) {
        boolean z3;
        int i3;
        boolean z4;
        if (!z) {
            if (Log.isLoggable("HardwareConfig", 2)) {
                Log.v("HardwareConfig", "Hardware config disallowed by caller");
            }
            return false;
        } else if (!this.isHardwareConfigAllowedByDeviceModel) {
            if (Log.isLoggable("HardwareConfig", 2)) {
                Log.v("HardwareConfig", "Hardware config disallowed by device model");
            }
            return false;
        } else if (z2) {
            if (Log.isLoggable("HardwareConfig", 2)) {
                Log.v("HardwareConfig", "Hardware config disallowed because exif orientation is required");
            }
            return false;
        } else if (i < 0) {
            if (Log.isLoggable("HardwareConfig", 2)) {
                Log.v("HardwareConfig", "Hardware config disallowed because width is too small");
            }
            return false;
        } else if (i2 < 0) {
            if (Log.isLoggable("HardwareConfig", 2)) {
                Log.v("HardwareConfig", "Hardware config disallowed because height is too small");
            }
            return false;
        } else {
            synchronized (this) {
                int i4 = this.decodesSinceLastFdCheck + 1;
                this.decodesSinceLastFdCheck = i4;
                if (i4 >= 50) {
                    this.decodesSinceLastFdCheck = 0;
                    int length = FD_SIZE_LIST.list().length;
                    if (manualOverrideMaxFdCount != -1) {
                        i3 = manualOverrideMaxFdCount;
                    } else {
                        i3 = this.sdkBasedMaxFdCount;
                    }
                    long j = i3;
                    if (length < j) {
                        z4 = true;
                    } else {
                        z4 = false;
                    }
                    this.isFdSizeBelowHardwareLimit = z4;
                    if (!z4 && Log.isLoggable("Downsampler", 5)) {
                        Log.w("Downsampler", "Excluding HARDWARE bitmap config because we're over the file descriptor limit, file descriptors " + length + ", limit " + j);
                    }
                }
                z3 = this.isFdSizeBelowHardwareLimit;
            }
            if (z3) {
                return true;
            }
            if (Log.isLoggable("HardwareConfig", 2)) {
                Log.v("HardwareConfig", "Hardware config disallowed because there are insufficient FDs");
            }
            return false;
        }
    }

    public static HardwareConfigState getInstance() {
        if (instance == null) {
            synchronized (HardwareConfigState.class) {
                if (instance == null) {
                    instance = new HardwareConfigState();
                }
            }
        }
        return instance;
    }
}
