package com.android.systemui.monet;

import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: ColorScheme.kt */
/* loaded from: classes.dex */
public final class Hue {
    @NotNull
    private final HueStrategy strategy;
    private final double value;

    /* compiled from: ColorScheme.kt */
    /* loaded from: classes.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[HueStrategy.values().length];
            iArr[HueStrategy.SOURCE.ordinal()] = 1;
            iArr[HueStrategy.ADD.ordinal()] = 2;
            iArr[HueStrategy.SUBTRACT.ordinal()] = 3;
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public Hue() {
        this(null, 0.0d, 3, null);
    }

    public Hue(@NotNull HueStrategy strategy, double d) {
        Intrinsics.checkNotNullParameter(strategy, "strategy");
        this.strategy = strategy;
        this.value = d;
    }

    public /* synthetic */ Hue(HueStrategy hueStrategy, double d, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? HueStrategy.SOURCE : hueStrategy, (i & 2) != 0 ? 0.0d : d);
    }

    public final double get(double d) {
        int i = WhenMappings.$EnumSwitchMapping$0[this.strategy.ordinal()];
        if (i == 1) {
            return d;
        }
        if (i == 2) {
            return ColorScheme.Companion.wrapDegreesDouble(d + this.value);
        }
        if (i == 3) {
            return ColorScheme.Companion.wrapDegreesDouble(d - this.value);
        }
        throw new NoWhenBranchMatchedException();
    }

    @NotNull
    public final HueStrategy getStrategy() {
        return this.strategy;
    }

    public final double getValue() {
        return this.value;
    }
}
