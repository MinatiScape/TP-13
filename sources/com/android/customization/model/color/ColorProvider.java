package com.android.customization.model.color;

import android.app.WallpaperColors;
import android.content.Context;
import android.content.res.ColorStateList;
import androidx.cardview.R$style;
import androidx.core.graphics.ColorUtils;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleOwnerKt;
import com.android.customization.model.ResourcesApkProvider;
import com.android.customization.model.color.ColorSeedOption;
import com.android.systemui.monet.ColorScheme;
import com.android.systemui.monet.Style;
import com.android.wallpaper.compat.WallpaperManagerCompat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import kotlin.collections.ArraysUtilJVM;
import kotlin.collections.CollectionsKt___CollectionsKt;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.Dispatchers;
import kotlinx.coroutines.SupervisorKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: ColorProvider.kt */
/* loaded from: classes.dex */
public final class ColorProvider extends ResourcesApkProvider implements ColorOptionsProvider {
    public static final int styleSize = Style.values().length;
    @Nullable
    public List<? extends ColorOption> colorBundles;
    public boolean colorsAvailable;
    @Nullable
    public WallpaperColors homeWallpaperColors;
    @Nullable
    public WallpaperColors lockWallpaperColors;
    public final boolean monetEnabled;
    @NotNull
    public final CoroutineScope scope;
    @NotNull
    public Style[] styleList = {Style.TONAL_SPOT, Style.SPRITZ, Style.VIBRANT, Style.EXPRESSIVE};

    /* compiled from: ColorProvider.kt */
    /* loaded from: classes.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[Style.values().length];
            iArr[Style.FRUIT_SALAD.ordinal()] = 1;
            iArr[Style.TONAL_SPOT.ordinal()] = 2;
            $EnumSwitchMapping$0 = iArr;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ColorProvider(@NotNull Context context, @NotNull String stubPackageName) {
        super(context, stubPackageName);
        CoroutineScope coroutineScope;
        Intrinsics.checkNotNullParameter(stubPackageName, "stubPackageName");
        this.monetEnabled = ColorUtils.isMonetEnabled(context);
        if (context instanceof LifecycleOwner) {
            coroutineScope = LifecycleOwnerKt.getLifecycleScope((LifecycleOwner) context);
        } else {
            coroutineScope = CoroutineScopeKt.CoroutineScope(Dispatchers.Default.plus(SupervisorKt.SupervisorJob$default()));
        }
        this.scope = coroutineScope;
        this.colorsAvailable = true;
    }

    public final void buildBundle(int i, int i2, boolean z, String str, ArrayList arrayList) {
        String str2;
        Style[] styleArr = this.styleList;
        int length = styleArr.length;
        int i3 = 0;
        while (i3 < length) {
            Style style = styleArr[i3];
            int i4 = i3 + 1;
            Style style2 = Style.SPRITZ;
            HashMap hashMap = new HashMap();
            ColorScheme colorScheme = new ColorScheme(i, false, style);
            ColorScheme colorScheme2 = new ColorScheme(i, true, style);
            int[] iArr = {ColorUtils.setAlphaComponent(colorScheme.getAccent1().get(2).intValue(), 255), ColorUtils.setAlphaComponent(colorScheme.getAccent1().get(2).intValue(), 255), ColorStateList.valueOf(colorScheme.getAccent3().get(6).intValue()).withLStar(85.0f).getColors()[0], ColorUtils.setAlphaComponent(colorScheme.getAccent1().get(6).intValue(), 255)};
            int[] iArr2 = {ColorUtils.setAlphaComponent(colorScheme2.getAccent1().get(2).intValue(), 255), ColorUtils.setAlphaComponent(colorScheme2.getAccent1().get(2).intValue(), 255), ColorStateList.valueOf(colorScheme2.getAccent3().get(6).intValue()).withLStar(85.0f).getColors()[0], ColorUtils.setAlphaComponent(colorScheme2.getAccent1().get(6).intValue(), 255)};
            String str3 = "";
            if (z) {
                str2 = str3;
            } else {
                str2 = ColorUtils.toColorString(i);
            }
            hashMap.put("android.theme.customization.system_palette", str2);
            if (!z) {
                str3 = ColorUtils.toColorString(i);
            }
            hashMap.put("android.theme.customization.accent_color", str3);
            arrayList.add(new ColorSeedOption(null, hashMap, z, str, style, i2 + 1, new ColorSeedOption.PreviewInfo(iArr, iArr2)));
            i3 = i4;
        }
    }

    public final void buildColorSeeds(WallpaperColors wallpaperColors, int i, String str, boolean z, ArrayList arrayList) {
        boolean z2;
        List<Number> list;
        List<Integer> seedColors = ColorScheme.Companion.getSeedColors(wallpaperColors);
        buildBundle(((Number) CollectionsKt___CollectionsKt.first(seedColors)).intValue(), 0, z, str, arrayList);
        List<Object> drop = CollectionsKt___CollectionsKt.drop(seedColors, 1);
        int i2 = i - 1;
        Intrinsics.checkNotNullParameter(drop, "<this>");
        int i3 = 0;
        if (i2 >= 0) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (z2) {
            if (i2 == 0) {
                list = EmptyList.INSTANCE;
            } else if (i2 >= drop.size()) {
                list = CollectionsKt___CollectionsKt.toList(drop);
            } else if (i2 == 1) {
                list = ArraysUtilJVM.listOf(CollectionsKt___CollectionsKt.first(drop));
            } else {
                ArrayList arrayList2 = new ArrayList(i2);
                int i4 = 0;
                for (Object obj : drop) {
                    arrayList2.add(obj);
                    i4++;
                    if (i4 == i2) {
                        break;
                    }
                }
                list = ArraysUtilJVM.optimizeReadOnlyList(arrayList2);
            }
            for (Number number : list) {
                i3++;
                buildBundle(number.intValue(), i3, false, str, arrayList);
            }
            return;
        }
        throw new IllegalArgumentException(("Requested element count " + i2 + " is less than zero.").toString());
    }

    public static final int[] access$getPresetColorPreview(ColorProvider colorProvider, ColorScheme colorScheme, int i) {
        colorProvider.getClass();
        int i2 = WhenMappings.$EnumSwitchMapping$0[colorScheme.getStyle().ordinal()];
        return i2 != 1 ? i2 != 2 ? new int[]{colorScheme.getAccent1().get(2).intValue(), colorScheme.getAccent1().get(2).intValue()} : new int[]{colorScheme.getAccentColor(), colorScheme.getAccentColor()} : new int[]{i, colorScheme.getAccent1().get(2).intValue()};
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void access$loadSeedColors(ColorProvider colorProvider, WallpaperColors wallpaperColors, WallpaperColors wallpaperColors2) {
        int i;
        EmptyList emptyList;
        WallpaperColors wallpaperColors3;
        String str;
        WallpaperColors wallpaperColors4;
        String str2;
        colorProvider.getClass();
        if (wallpaperColors != null) {
            ArrayList arrayList = new ArrayList();
            if (wallpaperColors2 == null) {
                i = 4;
            } else {
                i = 2;
            }
            if (wallpaperColors2 != null) {
                WallpaperManagerCompat wallpaperManagerCompat = R$style.getInjector().getWallpaperManagerCompat(colorProvider.mContext);
                boolean z = true;
                if (wallpaperManagerCompat.getWallpaperId(2) <= wallpaperManagerCompat.getWallpaperId(1)) {
                    z = false;
                }
                boolean z2 = z;
                if (z2) {
                    wallpaperColors3 = wallpaperColors2;
                } else {
                    wallpaperColors3 = wallpaperColors;
                }
                if (z2) {
                    str = "lock_wallpaper";
                } else {
                    str = "home_wallpaper";
                }
                colorProvider.buildColorSeeds(wallpaperColors3, i, str, true, arrayList);
                if (z2) {
                    wallpaperColors4 = wallpaperColors;
                } else {
                    wallpaperColors4 = wallpaperColors2;
                }
                int size = 4 - (arrayList.size() / styleSize);
                if (z2) {
                    str2 = "home_wallpaper";
                } else {
                    str2 = "lock_wallpaper";
                }
                colorProvider.buildColorSeeds(wallpaperColors4, size, str2, false, arrayList);
            } else {
                colorProvider.buildColorSeeds(wallpaperColors, i, "home_wallpaper", true, arrayList);
            }
            List<? extends ColorOption> list = colorProvider.colorBundles;
            if (list == null) {
                emptyList = null;
            } else {
                ArrayList arrayList2 = new ArrayList();
                for (Object obj : list) {
                    if (!(((ColorOption) obj) instanceof ColorSeedOption)) {
                        arrayList2.add(obj);
                    }
                }
                emptyList = arrayList2;
            }
            if (emptyList == null) {
                emptyList = EmptyList.INSTANCE;
            }
            arrayList.addAll(emptyList);
            colorProvider.colorBundles = arrayList;
        }
    }
}
