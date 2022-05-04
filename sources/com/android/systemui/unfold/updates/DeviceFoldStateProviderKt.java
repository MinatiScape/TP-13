package com.android.systemui.unfold.updates;

import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public final class DeviceFoldStateProviderKt {
    public static final long ABORT_CLOSING_MILLIS = 1000;
    private static final boolean DEBUG = false;
    public static final float FULLY_OPEN_THRESHOLD_DEGREES = 15.0f;
    @NotNull
    private static final String TAG = "DeviceFoldProvider";

    public static /* synthetic */ void getABORT_CLOSING_MILLIS$annotations() {
    }

    public static /* synthetic */ void getFULLY_OPEN_THRESHOLD_DEGREES$annotations() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String stateToString(int i) {
        switch (i) {
            case 0:
                return "START_OPENING";
            case 1:
                return "HALF_OPEN";
            case 2:
                return "START_CLOSING";
            case 3:
                return "ABORTED";
            case 4:
                return "UNFOLDED_SCREEN_AVAILABLE";
            case 5:
                return "FINISH_HALF_OPEN";
            case 6:
                return "FINISH_FULL_OPEN";
            case 7:
                return "FINISH_CLOSED";
            default:
                return "UNKNOWN";
        }
    }
}
