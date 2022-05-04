package com.android.systemui.monet;

import android.app.WallpaperColors;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.android.internal.graphics.ColorUtils;
import com.android.internal.graphics.cam.Cam;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlin.collections.CollectionsKt___CollectionsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: ColorScheme.kt */
/* loaded from: classes.dex */
public final class ColorScheme {
    @NotNull
    public static final Companion Companion = new Companion(null);
    @NotNull
    private final List<Integer> accent1;
    @NotNull
    private final List<Integer> accent2;
    @NotNull
    private final List<Integer> accent3;
    private final boolean darkTheme;
    @NotNull
    private final List<Integer> neutral1;
    @NotNull
    private final List<Integer> neutral2;
    @NotNull
    private final Style style;

    /* compiled from: ColorScheme.kt */
    /* loaded from: classes.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private final float hueDiff(float f, float f2) {
            return 180.0f - Math.abs(Math.abs(f - f2) - 180.0f);
        }

        public final double wrapDegreesDouble(double d) {
            if (d >= 0.0d) {
                return d >= 360.0d ? d % 360 : d;
            }
            double d2 = 360;
            return (d % d2) + d2;
        }

        private final List<Double> huePopulations(Map<Integer, ? extends Cam> map, Map<Integer, Double> map2) {
            ArrayList arrayList = new ArrayList(360);
            int i = 0;
            while (i < 360) {
                i++;
                arrayList.add(Double.valueOf(0.0d));
            }
            ArrayList arrayList2 = new ArrayList(arrayList);
            for (Map.Entry<Integer, Double> entry : map2.entrySet()) {
                Double d = map2.get(entry.getKey());
                Intrinsics.checkNotNull(d);
                double doubleValue = d.doubleValue();
                Cam cam = map.get(entry.getKey());
                Intrinsics.checkNotNull(cam);
                Cam cam2 = cam;
                float hue = cam2.getHue();
                if (!Float.isNaN(hue)) {
                    int round = Math.round(hue) % 360;
                    if (cam2.getChroma() > 5.0f) {
                        arrayList2.set(round, Double.valueOf(((Number) arrayList2.get(round)).doubleValue() + doubleValue));
                    }
                } else {
                    throw new IllegalArgumentException("Cannot round NaN value.");
                }
            }
            return arrayList2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final String humanReadable(List<Integer> list) {
            ColorScheme$Companion$humanReadable$1 colorScheme$Companion$humanReadable$1 = ColorScheme$Companion$humanReadable$1.INSTANCE;
            Intrinsics.checkNotNullParameter(list, "<this>");
            StringBuilder sb = new StringBuilder();
            sb.append((CharSequence) "");
            int i = 0;
            for (Object obj : list) {
                boolean z = true;
                i++;
                if (i > 1) {
                    sb.append((CharSequence) ", ");
                }
                if (colorScheme$Companion$humanReadable$1 != null) {
                    sb.append(colorScheme$Companion$humanReadable$1.invoke((ColorScheme$Companion$humanReadable$1) obj));
                } else {
                    if (obj != null) {
                        z = obj instanceof CharSequence;
                    }
                    if (z) {
                        sb.append((CharSequence) obj);
                    } else if (obj instanceof Character) {
                        sb.append(((Character) obj).charValue());
                    } else {
                        sb.append((CharSequence) String.valueOf(obj));
                    }
                }
            }
            sb.append((CharSequence) "");
            String sb2 = sb.toString();
            Intrinsics.checkNotNullExpressionValue(sb2, "joinTo(StringBuilder(), …ed, transform).toString()");
            return sb2;
        }

        private final int wrapDegrees(int i) {
            if (i < 0) {
                return (i % 360) + 360;
            }
            if (i >= 360) {
                return i % 360;
            }
            return i;
        }

        public final int getSeedColor(@NotNull WallpaperColors wallpaperColors) {
            Intrinsics.checkNotNullParameter(wallpaperColors, "wallpaperColors");
            return ((Number) CollectionsKt___CollectionsKt.first(getSeedColors(wallpaperColors))).intValue();
        }

        /* JADX WARN: Code restructure failed: missing block: B:92:0x032a, code lost:
            if (r2 != 15) goto L97;
         */
        @org.jetbrains.annotations.NotNull
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.util.List<java.lang.Integer> getSeedColors(@org.jetbrains.annotations.NotNull android.app.WallpaperColors r22) {
            /*
                Method dump skipped, instructions count: 837
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.systemui.monet.ColorScheme.Companion.getSeedColors(android.app.WallpaperColors):java.util.List");
        }

        private final double score(Cam cam, double d) {
            float f;
            double d2;
            double d3 = d * 70.0d;
            if (cam.getChroma() < 48.0f) {
                d2 = 0.1d;
                f = cam.getChroma();
            } else {
                d2 = 0.3d;
                f = cam.getChroma();
            }
            return ((f - 48.0f) * d2) + d3;
        }

        private Companion() {
        }
    }

    public ColorScheme(int i, boolean z, @NotNull Style style) {
        Intrinsics.checkNotNullParameter(style, "style");
        this.darkTheme = z;
        this.style = style;
        Cam fromInt = Cam.fromInt(i);
        i = ColorSchemeKt.GOOGLE_BLUE;
        if (i == 0 || fromInt.getChroma() < 5.0f) {
        }
        Cam camSeed = Cam.fromInt(i);
        TonalSpec a1 = style.getCoreSpec$frameworks__base__packages__SystemUI__monet__android_common__monet().getA1();
        Intrinsics.checkNotNullExpressionValue(camSeed, "camSeed");
        this.accent1 = a1.shades(camSeed);
        this.accent2 = style.getCoreSpec$frameworks__base__packages__SystemUI__monet__android_common__monet().getA2().shades(camSeed);
        this.accent3 = style.getCoreSpec$frameworks__base__packages__SystemUI__monet__android_common__monet().getA3().shades(camSeed);
        this.neutral1 = style.getCoreSpec$frameworks__base__packages__SystemUI__monet__android_common__monet().getN1().shades(camSeed);
        this.neutral2 = style.getCoreSpec$frameworks__base__packages__SystemUI__monet__android_common__monet().getN2().shades(camSeed);
    }

    public static final int getSeedColor(@NotNull WallpaperColors wallpaperColors) {
        return Companion.getSeedColor(wallpaperColors);
    }

    @NotNull
    public static final List<Integer> getSeedColors(@NotNull WallpaperColors wallpaperColors) {
        return Companion.getSeedColors(wallpaperColors);
    }

    public final int getAccentColor() {
        int i;
        boolean z = this.darkTheme;
        List<Integer> list = this.accent1;
        if (z) {
            i = 2;
        } else {
            i = 6;
        }
        return ColorUtils.setAlphaComponent(list.get(i).intValue(), 255);
    }

    @NotNull
    public final List<Integer> getAllAccentColors() {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(this.accent1);
        arrayList.addAll(this.accent2);
        arrayList.addAll(this.accent3);
        return arrayList;
    }

    @NotNull
    public final List<Integer> getAllNeutralColors() {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(this.neutral1);
        arrayList.addAll(this.neutral2);
        return arrayList;
    }

    public final int getBackgroundColor() {
        int i;
        boolean z = this.darkTheme;
        List<Integer> list = this.neutral1;
        if (z) {
            i = 8;
        } else {
            i = 0;
        }
        return ColorUtils.setAlphaComponent(list.get(i).intValue(), 255);
    }

    @NotNull
    public String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ColorScheme {\n  neutral1: ");
        Companion companion = Companion;
        m.append(companion.humanReadable(this.neutral1));
        m.append("\n  neutral2: ");
        m.append(companion.humanReadable(this.neutral2));
        m.append("\n  accent1: ");
        m.append(companion.humanReadable(this.accent1));
        m.append("\n  accent2: ");
        m.append(companion.humanReadable(this.accent2));
        m.append("\n  accent3: ");
        m.append(companion.humanReadable(this.accent3));
        m.append("\n  style: ");
        m.append(this.style);
        m.append("\n}");
        return m.toString();
    }

    public /* synthetic */ ColorScheme(int i, boolean z, Style style, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, z, (i2 & 4) != 0 ? Style.TONAL_SPOT : style);
    }

    public ColorScheme(int i, boolean z) {
        this(i, z, Style.TONAL_SPOT);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ColorScheme(@NotNull WallpaperColors wallpaperColors, boolean z) {
        this(Companion.getSeedColor(wallpaperColors), z);
        Intrinsics.checkNotNullParameter(wallpaperColors, "wallpaperColors");
    }

    @NotNull
    public final List<Integer> getAccent1() {
        return this.accent1;
    }

    @NotNull
    public final List<Integer> getAccent2() {
        return this.accent2;
    }

    @NotNull
    public final List<Integer> getAccent3() {
        return this.accent3;
    }

    public final boolean getDarkTheme() {
        return this.darkTheme;
    }

    @NotNull
    public final List<Integer> getNeutral1() {
        return this.neutral1;
    }

    @NotNull
    public final List<Integer> getNeutral2() {
        return this.neutral2;
    }

    @NotNull
    public final Style getStyle() {
        return this.style;
    }
}
