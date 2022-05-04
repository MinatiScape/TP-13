package com.android.wallpaper.model;

import android.app.WallpaperInfo;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import com.android.systemui.shared.plugins.PluginActionManager$$ExternalSyntheticLambda1;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public final class ThirdPartyLiveWallpaperCategory extends WallpaperCategory {
    public static final ExecutorService sExecutorService = Executors.newCachedThreadPool();
    public final Set<String> mExcludedPackages;

    public ThirdPartyLiveWallpaperCategory(String str, String str2, ArrayList arrayList, HashSet hashSet) {
        super(str, str2, arrayList, 300);
        this.mExcludedPackages = hashSet;
    }

    @Override // com.android.wallpaper.model.WallpaperCategory, com.android.wallpaper.model.Category
    public final boolean containsThirdParty(String str) {
        synchronized (this.mWallpapersLock) {
            for (WallpaperInfo wallpaperInfo : this.mWallpapers) {
                WallpaperInfo wallpaperComponent = wallpaperInfo.getWallpaperComponent();
                if (wallpaperComponent != null && wallpaperComponent.getPackageName().equals(str)) {
                    return true;
                }
            }
            return false;
        }
    }

    @Override // com.android.wallpaper.model.WallpaperCategory
    public final void fetchWallpapers(final Context context, final WallpaperReceiver wallpaperReceiver, boolean z) {
        if (z) {
            sExecutorService.execute(new Runnable() { // from class: com.android.wallpaper.model.ThirdPartyLiveWallpaperCategory$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ThirdPartyLiveWallpaperCategory thirdPartyLiveWallpaperCategory = ThirdPartyLiveWallpaperCategory.this;
                    Context context2 = context;
                    WallpaperReceiver wallpaperReceiver2 = wallpaperReceiver;
                    List<WallpaperInfo> list = thirdPartyLiveWallpaperCategory.mWallpapers;
                    ArrayList all = LiveWallpaperInfo.getAll(context2, thirdPartyLiveWallpaperCategory.mExcludedPackages);
                    synchronized (thirdPartyLiveWallpaperCategory.mWallpapersLock) {
                        list.clear();
                        list.addAll(all);
                    }
                    new Handler(Looper.getMainLooper()).post(new PluginActionManager$$ExternalSyntheticLambda1(wallpaperReceiver2, list, 1));
                }
            });
        } else {
            super.fetchWallpapers(context, wallpaperReceiver, z);
        }
    }
}
