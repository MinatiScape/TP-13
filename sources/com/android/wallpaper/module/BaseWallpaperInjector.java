package com.android.wallpaper.module;

import android.content.Context;
import com.android.wallpaper.compat.WallpaperManagerCompat;
import com.android.wallpaper.compat.WallpaperManagerCompatVN;
import com.android.wallpaper.network.WallpaperRequester;
import com.android.wallpaper.util.DisplayUtils;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.gms.common.util.zzh;
/* loaded from: classes.dex */
public abstract class BaseWallpaperInjector implements Injector {
    public DefaultAlarmManagerWrapper mAlarmManagerWrapper;
    public DefaultBitmapCropper mBitmapCropper;
    public DefaultCurrentWallpaperInfoFactory mCurrentWallpaperFactory;
    public DisplayUtils mDisplayUtils;
    public DefaultExploreIntentChecker mExploreIntentChecker;
    public DefaultNetworkStatusNotifier mNetworkStatusNotifier;
    public DefaultPackageStatusNotifier mPackageStatusNotifier;
    public WallpaperRequester mRequester;
    public LaunchUtils mSystemFeatureChecker;
    public WallpaperManagerCompat mWallpaperManagerCompat;
    public DefaultWallpaperPersister mWallpaperPersister;
    public DefaultWallpaperRefresher mWallpaperRefresher;
    public zzh mWallpaperStatusChecker;

    @Override // com.android.wallpaper.module.Injector
    public final synchronized DefaultAlarmManagerWrapper getAlarmManagerWrapper(Context context) {
        if (this.mAlarmManagerWrapper == null) {
            this.mAlarmManagerWrapper = new DefaultAlarmManagerWrapper(context.getApplicationContext());
        }
        return this.mAlarmManagerWrapper;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized BitmapCropper getBitmapCropper() {
        if (this.mBitmapCropper == null) {
            this.mBitmapCropper = new DefaultBitmapCropper();
        }
        return this.mBitmapCropper;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized CurrentWallpaperInfoFactory getCurrentWallpaperFactory(Context context) {
        if (this.mCurrentWallpaperFactory == null) {
            this.mCurrentWallpaperFactory = new DefaultCurrentWallpaperInfoFactory(context.getApplicationContext());
        }
        return this.mCurrentWallpaperFactory;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized ExploreIntentChecker getExploreIntentChecker(Context context) {
        if (this.mExploreIntentChecker == null) {
            this.mExploreIntentChecker = new DefaultExploreIntentChecker(context.getApplicationContext());
        }
        return this.mExploreIntentChecker;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized NetworkStatusNotifier getNetworkStatusNotifier(Context context) {
        if (this.mNetworkStatusNotifier == null) {
            this.mNetworkStatusNotifier = new DefaultNetworkStatusNotifier(context.getApplicationContext());
        }
        return this.mNetworkStatusNotifier;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized PackageStatusNotifier getPackageStatusNotifier(Context context) {
        if (this.mPackageStatusNotifier == null) {
            this.mPackageStatusNotifier = new DefaultPackageStatusNotifier(context.getApplicationContext());
        }
        return this.mPackageStatusNotifier;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized WallpaperRequester getRequester(Context context) {
        if (this.mRequester == null) {
            this.mRequester = new WallpaperRequester(context.getApplicationContext());
        }
        return this.mRequester;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized LaunchUtils getSystemFeatureChecker() {
        if (this.mSystemFeatureChecker == null) {
            this.mSystemFeatureChecker = new LaunchUtils();
        }
        return this.mSystemFeatureChecker;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized WallpaperManagerCompat getWallpaperManagerCompat(Context context) {
        WallpaperManagerCompatVN wallpaperManagerCompatVN;
        if (this.mWallpaperManagerCompat == null) {
            synchronized (WallpaperManagerCompat.sInstanceLock) {
                if (WallpaperManagerCompat.sInstance == null) {
                    WallpaperManagerCompat.sInstance = new WallpaperManagerCompatVN(context.getApplicationContext());
                }
                wallpaperManagerCompatVN = WallpaperManagerCompat.sInstance;
            }
            this.mWallpaperManagerCompat = wallpaperManagerCompatVN;
        }
        return this.mWallpaperManagerCompat;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized WallpaperPersister getWallpaperPersister(Context context) {
        if (this.mWallpaperPersister == null) {
            this.mWallpaperPersister = new DefaultWallpaperPersister(context.getApplicationContext());
        }
        return this.mWallpaperPersister;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized WallpaperRefresher getWallpaperRefresher(Context context) {
        if (this.mWallpaperRefresher == null) {
            this.mWallpaperRefresher = new DefaultWallpaperRefresher(context.getApplicationContext());
        }
        return this.mWallpaperRefresher;
    }

    @Override // com.android.wallpaper.module.Injector
    public final DisplayUtils getDisplayUtils(Context context) {
        if (this.mDisplayUtils == null) {
            this.mDisplayUtils = new DisplayUtils(context.getApplicationContext());
        }
        return this.mDisplayUtils;
    }

    @Override // com.android.wallpaper.module.Injector
    public final zzh getWallpaperStatusChecker() {
        if (this.mWallpaperStatusChecker == null) {
            this.mWallpaperStatusChecker = new zzh();
        }
        return this.mWallpaperStatusChecker;
    }
}
