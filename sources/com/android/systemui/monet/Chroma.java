package com.android.systemui.monet;

import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: ColorScheme.kt */
/* loaded from: classes.dex */
public final class Chroma {
    @NotNull
    private final ChromaStrategy strategy;
    private final double value;

    /* compiled from: ColorScheme.kt */
    /* loaded from: classes.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[ChromaStrategy.values().length];
            iArr[ChromaStrategy.EQ.ordinal()] = 1;
            iArr[ChromaStrategy.GTE.ordinal()] = 2;
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public Chroma(@NotNull ChromaStrategy strategy, double d) {
        Intrinsics.checkNotNullParameter(strategy, "strategy");
        this.strategy = strategy;
        this.value = d;
    }

    public final double get(double d) {
        int i = WhenMappings.$EnumSwitchMapping$0[this.strategy.ordinal()];
        if (i == 1) {
            return this.value;
        }
        if (i == 2) {
            double d2 = this.value;
            if (d < d2) {
                return d2;
            }
            return d;
        }
        throw new NoWhenBranchMatchedException();
    }

    @NotNull
    public final ChromaStrategy getStrategy() {
        return this.strategy;
    }

    public final double getValue() {
        return this.value;
    }
}
