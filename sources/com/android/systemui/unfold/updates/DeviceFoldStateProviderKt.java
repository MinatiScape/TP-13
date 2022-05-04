package com.android.systemui.unfold.updates;

import org.jetbrains.annotations.NotNull;
/* compiled from: DeviceFoldStateProvider.kt */
/* loaded from: classes.dex */
public final class DeviceFoldStateProviderKt {
    private static final boolean DEBUG = false;
    public static final float FULLY_OPEN_THRESHOLD_DEGREES = 15.0f;
    public static final long HALF_OPENED_TIMEOUT_MILLIS = 1000;
    @NotNull
    private static final String TAG = "DeviceFoldProvider";

    public static /* synthetic */ void getFULLY_OPEN_THRESHOLD_DEGREES$annotations() {
    }

    public static /* synthetic */ void getHALF_OPENED_TIMEOUT_MILLIS$annotations() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String stateToString(int i) {
        return i != 0 ? i != 1 ? i != 2 ? i != 3 ? i != 4 ? i != 5 ? "UNKNOWN" : "FINISH_CLOSED" : "FINISH_FULL_OPEN" : "FINISH_HALF_OPEN" : "UNFOLDED_SCREEN_AVAILABLE" : "START_CLOSING" : "START_OPENING";
    }
}
