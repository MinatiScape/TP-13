package com.android.systemui.flags;
/* loaded from: classes.dex */
public final class NoFlagResultsException extends Exception {
    public NoFlagResultsException() {
        super("SystemUI failed to communicate its flags back successfully");
    }
}
