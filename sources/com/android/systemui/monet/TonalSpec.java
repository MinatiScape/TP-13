package com.android.systemui.monet;

import com.android.internal.graphics.cam.Cam;
import java.util.ArrayList;
import java.util.List;
import kotlin.collections.ArraysUtilJVM;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: ColorScheme.kt */
/* loaded from: classes.dex */
public final class TonalSpec {
    @NotNull
    private final Chroma chroma;
    @NotNull
    private final Hue hue;

    public TonalSpec(@NotNull Hue hue, @NotNull Chroma chroma) {
        Intrinsics.checkNotNullParameter(hue, "hue");
        Intrinsics.checkNotNullParameter(chroma, "chroma");
        this.hue = hue;
        this.chroma = chroma;
    }

    public /* synthetic */ TonalSpec(Hue hue, Chroma chroma, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? new Hue(null, 0.0d, 3, null) : hue, chroma);
    }

    @NotNull
    public final List<Integer> shades(@NotNull Cam sourceColor) {
        Intrinsics.checkNotNullParameter(sourceColor, "sourceColor");
        int[] of = Shades.of((float) this.hue.get(sourceColor.getHue()), (float) this.chroma.get(sourceColor.getChroma()));
        Intrinsics.checkNotNullExpressionValue(of, "of(hue.toFloat(), chroma.toFloat())");
        int length = of.length;
        if (length == 0) {
            return EmptyList.INSTANCE;
        }
        int i = 0;
        if (length == 1) {
            return ArraysUtilJVM.listOf(Integer.valueOf(of[0]));
        }
        ArrayList arrayList = new ArrayList(of.length);
        int length2 = of.length;
        while (i < length2) {
            int i2 = of[i];
            i++;
            arrayList.add(Integer.valueOf(i2));
        }
        return arrayList;
    }

    @NotNull
    public final Chroma getChroma() {
        return this.chroma;
    }

    @NotNull
    public final Hue getHue() {
        return this.hue;
    }
}
