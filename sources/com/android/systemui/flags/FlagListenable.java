package com.android.systemui.flags;

import org.jetbrains.annotations.NotNull;
/* compiled from: FlagListenable.kt */
/* loaded from: classes.dex */
public interface FlagListenable {

    /* compiled from: FlagListenable.kt */
    /* loaded from: classes.dex */
    public interface FlagEvent {
        int getFlagId();

        void requestNoRestart();
    }

    /* compiled from: FlagListenable.kt */
    /* loaded from: classes.dex */
    public interface Listener {
        void onFlagChanged(@NotNull FlagEvent flagEvent);
    }

    void addListener(@NotNull Flag<?> flag, @NotNull Listener listener);

    void removeListener(@NotNull Listener listener);
}
