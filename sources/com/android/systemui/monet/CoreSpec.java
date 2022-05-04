package com.android.systemui.monet;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: ColorScheme.kt */
/* loaded from: classes.dex */
public final class CoreSpec {
    @NotNull
    private final TonalSpec a1;
    @NotNull
    private final TonalSpec a2;
    @NotNull
    private final TonalSpec a3;
    @NotNull
    private final TonalSpec n1;
    @NotNull
    private final TonalSpec n2;

    public CoreSpec(@NotNull TonalSpec a1, @NotNull TonalSpec a2, @NotNull TonalSpec a3, @NotNull TonalSpec n1, @NotNull TonalSpec n2) {
        Intrinsics.checkNotNullParameter(a1, "a1");
        Intrinsics.checkNotNullParameter(a2, "a2");
        Intrinsics.checkNotNullParameter(a3, "a3");
        Intrinsics.checkNotNullParameter(n1, "n1");
        Intrinsics.checkNotNullParameter(n2, "n2");
        this.a1 = a1;
        this.a2 = a2;
        this.a3 = a3;
        this.n1 = n1;
        this.n2 = n2;
    }

    @NotNull
    public final TonalSpec getA1() {
        return this.a1;
    }

    @NotNull
    public final TonalSpec getA2() {
        return this.a2;
    }

    @NotNull
    public final TonalSpec getA3() {
        return this.a3;
    }

    @NotNull
    public final TonalSpec getN1() {
        return this.n1;
    }

    @NotNull
    public final TonalSpec getN2() {
        return this.n2;
    }
}
