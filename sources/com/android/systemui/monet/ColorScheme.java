package com.android.systemui.monet;

import android.app.WallpaperColors;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.android.internal.graphics.ColorUtils;
import com.android.internal.graphics.cam.Cam;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import kotlin.collections.ArraysKt___ArraysKt;
import kotlin.collections.CollectionsKt___CollectionsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
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

    /* loaded from: classes.dex */
    public static final class Companion {
        private Companion() {
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private final float hueDiff(float f, float f2) {
            return 180.0f - Math.abs(Math.abs(f - f2) - 180.0f);
        }

        private final List<Double> huePopulations(Map<Integer, ? extends Cam> map, Map<Integer, Double> map2) {
            ArrayList arrayList = new ArrayList(360);
            for (int i = 0; i < 360; i++) {
                arrayList.add(Double.valueOf(0.0d));
            }
            List<Double> mutableList = CollectionsKt___CollectionsKt.toMutableList((Collection) arrayList);
            for (Map.Entry<Integer, Double> entry : map2.entrySet()) {
                Double d = map2.get(entry.getKey());
                Intrinsics.checkNotNull(d);
                double doubleValue = d.doubleValue();
                Cam cam = map.get(entry.getKey());
                Intrinsics.checkNotNull(cam);
                float hue = cam.getHue();
                if (!Float.isNaN(hue)) {
                    int round = Math.round(hue) % 360;
                    if (cam.getChroma() > 5.0f) {
                        ArrayList arrayList2 = (ArrayList) mutableList;
                        arrayList2.set(round, Double.valueOf(((Number) arrayList2.get(round)).doubleValue() + doubleValue));
                    }
                } else {
                    throw new IllegalArgumentException("Cannot round NaN value.");
                }
            }
            return mutableList;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final String humanReadable(List<Integer> joinTo) {
            ColorScheme$Companion$humanReadable$1 colorScheme$Companion$humanReadable$1 = ColorScheme$Companion$humanReadable$1.INSTANCE;
            Intrinsics.checkNotNullParameter(joinTo, "$this$joinToString");
            Intrinsics.checkNotNullParameter(", ", "separator");
            Intrinsics.checkNotNullParameter("", "prefix");
            Intrinsics.checkNotNullParameter("", "postfix");
            Intrinsics.checkNotNullParameter("...", "truncated");
            StringBuilder appendElement = new StringBuilder();
            Intrinsics.checkNotNullParameter(joinTo, "$this$joinTo");
            Intrinsics.checkNotNullParameter(appendElement, "buffer");
            Intrinsics.checkNotNullParameter(", ", "separator");
            Intrinsics.checkNotNullParameter("", "prefix");
            Intrinsics.checkNotNullParameter("", "postfix");
            Intrinsics.checkNotNullParameter("...", "truncated");
            appendElement.append((CharSequence) "");
            int i = 0;
            for (Object obj : joinTo) {
                boolean z = true;
                i++;
                if (i > 1) {
                    appendElement.append((CharSequence) ", ");
                }
                Intrinsics.checkNotNullParameter(appendElement, "$this$appendElement");
                if (colorScheme$Companion$humanReadable$1 != null) {
                    appendElement.append(colorScheme$Companion$humanReadable$1.invoke((ColorScheme$Companion$humanReadable$1) obj));
                } else {
                    if (obj != null) {
                        z = obj instanceof CharSequence;
                    }
                    if (z) {
                        appendElement.append((CharSequence) obj);
                    } else if (obj instanceof Character) {
                        appendElement.append(((Character) obj).charValue());
                    } else {
                        appendElement.append((CharSequence) String.valueOf(obj));
                    }
                }
            }
            appendElement.append((CharSequence) "");
            String sb = appendElement.toString();
            Intrinsics.checkNotNullExpressionValue(sb, "joinTo(StringBuilder(), …ed, transform).toString()");
            return sb;
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

        /* JADX INFO: Access modifiers changed from: private */
        public final int wrapDegrees(int i) {
            if (i < 0) {
                return (i % 360) + 360;
            }
            return i >= 360 ? i % 360 : i;
        }

        public final int getSeedColor(@NotNull WallpaperColors wallpaperColors) {
            Intrinsics.checkNotNullParameter(wallpaperColors, "wallpaperColors");
            return ((Number) CollectionsKt___CollectionsKt.first(getSeedColors(wallpaperColors))).intValue();
        }

        /* JADX WARN: Code restructure failed: missing block: B:92:0x0329, code lost:
            if (r2 != 15) goto L97;
         */
        @org.jetbrains.annotations.NotNull
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.util.List<java.lang.Integer> getSeedColors(@org.jetbrains.annotations.NotNull android.app.WallpaperColors r22) {
            /*
                Method dump skipped, instructions count: 836
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.systemui.monet.ColorScheme.Companion.getSeedColors(android.app.WallpaperColors):java.util.List");
        }
    }

    public ColorScheme(int i, boolean z) {
        this.darkTheme = z;
        Cam fromInt = Cam.fromInt(i);
        i = ColorSchemeKt.GOOGLE_BLUE;
        if (i == 0 || fromInt.getChroma() < 5.0f) {
        }
        Cam fromInt2 = Cam.fromInt(i);
        float hue = fromInt2.getHue();
        float chroma = fromInt2.getChroma();
        chroma = chroma < 48.0f ? 48.0f : chroma;
        int wrapDegrees = Companion.wrapDegrees((int) (60.0f + hue));
        int[] of = Shades.of(hue, chroma);
        Intrinsics.checkNotNullExpressionValue(of, "of(hue, chroma)");
        this.accent1 = ArraysKt___ArraysKt.toList(of);
        int[] of2 = Shades.of(hue, 16.0f);
        Intrinsics.checkNotNullExpressionValue(of2, "of(hue, ACCENT2_CHROMA)");
        this.accent2 = ArraysKt___ArraysKt.toList(of2);
        int[] of3 = Shades.of(wrapDegrees, 32.0f);
        Intrinsics.checkNotNullExpressionValue(of3, "of(tertiaryHue.toFloat(), ACCENT3_CHROMA)");
        this.accent3 = ArraysKt___ArraysKt.toList(of3);
        int[] of4 = Shades.of(hue, 4.0f);
        Intrinsics.checkNotNullExpressionValue(of4, "of(hue, NEUTRAL1_CHROMA)");
        this.neutral1 = ArraysKt___ArraysKt.toList(of4);
        int[] of5 = Shades.of(hue, 8.0f);
        Intrinsics.checkNotNullExpressionValue(of5, "of(hue, NEUTRAL2_CHROMA)");
        this.neutral2 = ArraysKt___ArraysKt.toList(of5);
    }

    public static final int getSeedColor(@NotNull WallpaperColors wallpaperColors) {
        return Companion.getSeedColor(wallpaperColors);
    }

    @NotNull
    public static final List<Integer> getSeedColors(@NotNull WallpaperColors wallpaperColors) {
        return Companion.getSeedColors(wallpaperColors);
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

    public final int getAccentColor() {
        return ColorUtils.setAlphaComponent(this.accent1.get(this.darkTheme ? 2 : 6).intValue(), 255);
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
        return ColorUtils.setAlphaComponent(this.neutral1.get(this.darkTheme ? 8 : 0).intValue(), 255);
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
        m.append("\n}");
        return m.toString();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public ColorScheme(@NotNull WallpaperColors wallpaperColors, boolean z) {
        this(Companion.getSeedColor(wallpaperColors), z);
        Intrinsics.checkNotNullParameter(wallpaperColors, "wallpaperColors");
    }
}
