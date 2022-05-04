package com.android.systemui.flags;
/* compiled from: FlagManager.kt */
/* loaded from: classes.dex */
public final class NoFlagResultsException extends Exception {
    public NoFlagResultsException() {
        super("SystemUI failed to communicate its flags back successfully");
    }
}
