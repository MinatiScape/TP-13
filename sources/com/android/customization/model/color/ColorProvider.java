package com.android.customization.model.color;

import android.app.WallpaperColors;
import android.content.Context;
import android.content.res.ColorStateList;
import androidx.core.graphics.ColorUtils;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleCoroutineScopeImpl;
import androidx.lifecycle.LifecycleCoroutineScopeImpl$register$1;
import androidx.lifecycle.LifecycleOwner;
import com.android.customization.model.ResourcesApkProvider;
import com.android.customization.model.color.ColorSeedOption;
import com.android.systemui.monet.ColorScheme;
import com.android.wallpaper.compat.WallpaperManagerCompatV16;
import com.android.wallpaper.module.InjectorProvider;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import kotlin.collections.CollectionsKt__CollectionsKt;
import kotlin.collections.CollectionsKt___CollectionsKt;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CompletableJob;
import kotlinx.coroutines.CoroutineDispatcher;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.Dispatchers;
import kotlinx.coroutines.JobSupport;
import kotlinx.coroutines.MainCoroutineDispatcher;
import kotlinx.coroutines.SupervisorKt;
import kotlinx.coroutines.internal.MainDispatcherLoader;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class ColorProvider extends ResourcesApkProvider implements ColorOptionsProvider {
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

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v10, types: [java.lang.Object, androidx.lifecycle.LifecycleCoroutineScopeImpl, kotlinx.coroutines.CoroutineScope] */
    /* JADX WARN: Type inference failed for: r10v3, types: [kotlinx.coroutines.CoroutineScope] */
    /* JADX WARN: Type inference failed for: r10v5, types: [kotlinx.coroutines.CoroutineScope] */
    /* JADX WARN: Type inference failed for: r10v9, types: [androidx.lifecycle.LifecycleCoroutineScopeImpl] */
    public ColorProvider(@NotNull Context context, @NotNull String stubPackageName) {
        super(context, stubPackageName);
        ?? r10;
        Intrinsics.checkNotNullParameter(stubPackageName, "stubPackageName");
        this.monetEnabled = ColorUtils.isMonetEnabled(context);
        if (context instanceof LifecycleOwner) {
            Lifecycle lifecycle = ((LifecycleOwner) context).getLifecycle();
            Intrinsics.checkNotNullExpressionValue(lifecycle, "lifecycle");
            while (true) {
                r10 = (LifecycleCoroutineScopeImpl) lifecycle.mInternalScopeRef.get();
                if (r10 == 0) {
                    CompletableJob SupervisorJob$default = SupervisorKt.SupervisorJob$default(null, 1);
                    CoroutineDispatcher coroutineDispatcher = Dispatchers.Default;
                    MainCoroutineDispatcher mainCoroutineDispatcher = MainDispatcherLoader.dispatcher;
                    r10 = new LifecycleCoroutineScopeImpl(lifecycle, ((JobSupport) SupervisorJob$default).plus(mainCoroutineDispatcher.getImmediate()));
                    if (lifecycle.mInternalScopeRef.compareAndSet(null, r10)) {
                        BuildersKt.launch$default(r10, mainCoroutineDispatcher.getImmediate(), null, new LifecycleCoroutineScopeImpl$register$1(r10, null), 2, null);
                        break;
                    }
                } else {
                    break;
                }
            }
        } else {
            Dispatchers dispatchers = Dispatchers.INSTANCE;
            r10 = CoroutineScopeKt.CoroutineScope(Dispatchers.Default.plus(SupervisorKt.SupervisorJob$default(null, 1)));
        }
        this.scope = r10;
        this.colorsAvailable = true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void access$loadSeedColors(ColorProvider colorProvider, WallpaperColors wallpaperColors, WallpaperColors wallpaperColors2) {
        EmptyList emptyList;
        Objects.requireNonNull(colorProvider);
        if (wallpaperColors != null) {
            ArrayList arrayList = new ArrayList();
            int i = 4;
            if (wallpaperColors2 != null) {
                i = 2;
            }
            if (wallpaperColors2 != null) {
                WallpaperManagerCompatV16 wallpaperManagerCompat = InjectorProvider.getInjector().getWallpaperManagerCompat(colorProvider.mContext);
                boolean z = true;
                if (wallpaperManagerCompat.getWallpaperId(2) <= wallpaperManagerCompat.getWallpaperId(1)) {
                    z = false;
                }
                boolean z2 = z;
                colorProvider.buildColorSeeds(z2 ? wallpaperColors2 : wallpaperColors, i, z2 ? "lock_wallpaper" : "home_wallpaper", true, arrayList);
                colorProvider.buildColorSeeds(z2 ? wallpaperColors : wallpaperColors2, 4 - arrayList.size(), z2 ? "home_wallpaper" : "lock_wallpaper", false, arrayList);
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

    public final void buildBundle(int i, int i2, boolean z, String str, List<ColorOption> list) {
        HashMap hashMap = new HashMap();
        ColorScheme colorScheme = new ColorScheme(i, false);
        ColorScheme colorScheme2 = new ColorScheme(i, true);
        int[] iArr = {ColorUtils.setAlphaComponent(colorScheme.getAccent1().get(2).intValue(), 255), ColorUtils.setAlphaComponent(colorScheme.getAccent1().get(2).intValue(), 255), ColorStateList.valueOf(colorScheme.getAccent3().get(6).intValue()).withLStar(85.0f).getColors()[0], ColorUtils.setAlphaComponent(colorScheme.getAccent1().get(6).intValue(), 255)};
        int[] iArr2 = {ColorUtils.setAlphaComponent(colorScheme2.getAccent1().get(2).intValue(), 255), ColorUtils.setAlphaComponent(colorScheme2.getAccent1().get(2).intValue(), 255), ColorStateList.valueOf(colorScheme2.getAccent3().get(6).intValue()).withLStar(85.0f).getColors()[0], ColorUtils.setAlphaComponent(colorScheme2.getAccent1().get(6).intValue(), 255)};
        String str2 = "";
        hashMap.put("android.theme.customization.system_palette", z ? str2 : ColorUtils.toColorString(i));
        if (!z) {
            str2 = ColorUtils.toColorString(i);
        }
        hashMap.put("android.theme.customization.accent_color", str2);
        list.add(new ColorSeedOption(null, hashMap, z, str, 1 + i2, new ColorSeedOption.PreviewInfo(iArr, iArr2, null)));
    }

    public final void buildColorSeeds(WallpaperColors wallpaperColors, int i, String str, boolean z, List<ColorOption> list) {
        List<Number> list2;
        List<Integer> seedColors = ColorScheme.Companion.getSeedColors(wallpaperColors);
        buildBundle(((Number) CollectionsKt___CollectionsKt.first(seedColors)).intValue(), 0, z, str, list);
        List<Object> take = CollectionsKt___CollectionsKt.drop(seedColors, 1);
        int i2 = i - 1;
        Intrinsics.checkNotNullParameter(take, "$this$take");
        int i3 = 0;
        if (i2 >= 0) {
            if (i2 == 0) {
                list2 = EmptyList.INSTANCE;
            } else if (i2 >= take.size()) {
                list2 = CollectionsKt___CollectionsKt.toList(take);
            } else if (i2 == 1) {
                list2 = CollectionsKt__CollectionsKt.listOf(CollectionsKt___CollectionsKt.first(take));
            } else {
                ArrayList arrayList = new ArrayList(i2);
                int i4 = 0;
                for (Object obj : take) {
                    arrayList.add(obj);
                    i4++;
                    if (i4 == i2) {
                        break;
                    }
                }
                list2 = CollectionsKt__CollectionsKt.optimizeReadOnlyList(arrayList);
            }
            for (Number number : list2) {
                i3++;
                buildBundle(number.intValue(), i3, false, str, list);
            }
            return;
        }
        throw new IllegalArgumentException(("Requested element count " + i2 + " is less than zero.").toString());
    }
}
