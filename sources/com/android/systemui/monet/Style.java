package com.android.systemui.monet;

import org.jetbrains.annotations.NotNull;
/* JADX WARN: Init of enum EXPRESSIVE can be incorrect */
/* JADX WARN: Init of enum FRUIT_SALAD can be incorrect */
/* JADX WARN: Init of enum RAINBOW can be incorrect */
/* JADX WARN: Init of enum SPRITZ can be incorrect */
/* JADX WARN: Init of enum TONAL_SPOT can be incorrect */
/* JADX WARN: Init of enum VIBRANT can be incorrect */
/* compiled from: ColorScheme.kt */
/* loaded from: classes.dex */
public enum Style {
    SPRITZ(new CoreSpec(new TonalSpec(null, new Chroma(r8, 12.0d), 1, null), new TonalSpec(null, new Chroma(r8, 8.0d), 1, null), new TonalSpec(null, new Chroma(r8, 16.0d), 1, null), new TonalSpec(null, new Chroma(r8, 4.0d), 1, null), new TonalSpec(null, new Chroma(r8, 8.0d), 1, null))),
    TONAL_SPOT(new CoreSpec(r2, r3, new TonalSpec(new Hue(r13, 60.0d), new Chroma(r8, 24.0d)), new TonalSpec(null, new Chroma(r8, 4.0d), 1, null), new TonalSpec(null, new Chroma(r8, 8.0d), 1, null))),
    VIBRANT(new CoreSpec(new TonalSpec(null, new Chroma(r15, 48.0d), 1, null), new TonalSpec(new Hue(r13, 15.0d), new Chroma(r8, 24.0d)), new TonalSpec(new Hue(r13, 30.0d), new Chroma(r15, 32.0d)), new TonalSpec(null, new Chroma(r8, 8.0d), 1, null), new TonalSpec(null, new Chroma(r8, 16.0d), 1, null))),
    EXPRESSIVE(new CoreSpec(new TonalSpec(new Hue(r11, 60.0d), new Chroma(r15, 64.0d)), new TonalSpec(new Hue(r11, 30.0d), new Chroma(r8, 24.0d)), new TonalSpec(null, new Chroma(r15, 48.0d), 1, null), new TonalSpec(null, new Chroma(r8, 12.0d), 1, null), new TonalSpec(null, new Chroma(r8, 16.0d), 1, null))),
    RAINBOW(new CoreSpec(new TonalSpec(null, new Chroma(r15, 48.0d), 1, null), new TonalSpec(null, new Chroma(r8, 16.0d), 1, null), new TonalSpec(new Hue(r13, 60.0d), new Chroma(r8, 24.0d)), new TonalSpec(null, new Chroma(r8, 0.0d), 1, null), new TonalSpec(null, new Chroma(r8, 0.0d), 1, null))),
    FRUIT_SALAD(new CoreSpec(new TonalSpec(new Hue(r11, 50.0d), new Chroma(r15, 48.0d)), new TonalSpec(new Hue(r11, 50.0d), new Chroma(r8, 36.0d)), new TonalSpec(null, new Chroma(r8, 36.0d), 1, null), new TonalSpec(null, new Chroma(r8, 10.0d), 1, null), new TonalSpec(null, new Chroma(r8, 16.0d), 1, null)));
    
    @NotNull
    private final CoreSpec coreSpec;

    static {
        ChromaStrategy chromaStrategy = ChromaStrategy.EQ;
        new TonalSpec(null, new Chroma(ChromaStrategy.GTE, 32.0d), 1, null);
        new TonalSpec(null, new Chroma(chromaStrategy, 16.0d), 1, null);
        HueStrategy hueStrategy = HueStrategy.ADD;
        HueStrategy hueStrategy2 = HueStrategy.SUBTRACT;
    }

    Style(CoreSpec coreSpec) {
        this.coreSpec = coreSpec;
    }

    @NotNull
    public final CoreSpec getCoreSpec$frameworks__base__packages__SystemUI__monet__android_common__monet() {
        return this.coreSpec;
    }
}
