package com.android.wallpaper.module;

import android.os.SystemProperties;
/* loaded from: classes.dex */
public final class DeviceColorLayerResolver implements DrawableLayerResolver {
    public static final int LAYER_INDEX;

    static {
        int i;
        String str = SystemProperties.get("ro.boot.hardware.color");
        str.getClass();
        if (str.equals("BLK")) {
            i = 1;
        } else if (!str.equals("ORG")) {
            i = 0;
        } else {
            i = 2;
        }
        LAYER_INDEX = i;
    }
}
