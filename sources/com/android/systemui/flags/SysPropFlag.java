package com.android.systemui.flags;

import org.jetbrains.annotations.NotNull;
/* compiled from: Flag.kt */
/* loaded from: classes.dex */
public interface SysPropFlag<T> extends Flag<T> {
    T getDefault();

    @NotNull
    String getName();
}
