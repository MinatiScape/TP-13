package com.android.wallpaper.module;

import android.content.Context;
import android.os.Bundle;
import com.android.customization.module.DefaultCustomizationInjector;
import com.android.customization.module.StatsLogUserEventLogger;
import com.android.customization.module.ThemesUserEventLogger;
import com.android.wallpaper.model.CategoryProvider;
import com.android.wallpaper.network.ServerFetcher;
import com.android.wallpaper.picker.individual.IndividualPickerFragment;
import com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment;
import com.google.android.apps.wallpaper.backdrop.BackdropFetcher;
import com.google.android.apps.wallpaper.backdrop.BackdropWallpaperRotationRefresher;
import com.google.android.apps.wallpaper.module.AlwaysLoggingOptInStatusProvider;
import com.google.android.apps.wallpaper.module.ClearcutUserEventLogger;
import com.google.android.apps.wallpaper.module.CompositeUserEventLogger;
import com.google.android.apps.wallpaper.module.DefaultGoogleWallpaperPreferences;
import com.google.android.apps.wallpaper.module.DeviceConfigFilteringLabelProvider;
import com.google.android.apps.wallpaper.module.GooglePartnerProvider;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import com.google.android.apps.wallpaper.module.WallpaperCategoryProvider;
import com.google.android.material.shape.CornerTreatment;
import java.util.Objects;
/* loaded from: classes.dex */
public class WallpapersInjector extends DefaultCustomizationInjector implements GoogleWallpapersInjector {
    public BackdropFetcher mBackdropFetcher;
    public CategoryProvider mCategoryProvider;
    public CustomizationSections mCustomizationSections;
    public DrawableLayerResolver mDrawableLayerResolver;
    public CornerTreatment mLiveWallpaperInfoFactory;
    public LoggingOptInStatusProvider mLoggingOptInStatusProvider;
    public GooglePartnerProvider mPartnerProvider;
    public GoogleWallpaperPreferences mPrefs;
    public ThemesUserEventLogger mUserEventLogger;
    public WallpaperRotationRefresher mWallpaperRotationRefresher;

    @Override // com.android.wallpaper.module.Injector
    public synchronized CategoryProvider getCategoryProvider(Context context) {
        if (this.mCategoryProvider == null) {
            this.mCategoryProvider = new WallpaperCategoryProvider(context.getApplicationContext());
        }
        return this.mCategoryProvider;
    }

    @Override // com.android.wallpaper.module.Injector
    public CustomizationSections getCustomizationSections() {
        if (this.mCustomizationSections == null) {
            this.mCustomizationSections = new GoogleCustomizationSections();
        }
        return this.mCustomizationSections;
    }

    @Override // com.android.wallpaper.module.Injector
    public String getDownloadableIntentAction() {
        return "com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER";
    }

    @Override // com.android.wallpaper.module.Injector
    public DrawableLayerResolver getDrawableLayerResolver() {
        if (this.mDrawableLayerResolver == null) {
            this.mDrawableLayerResolver = new DeviceColorLayerResolver();
        }
        return this.mDrawableLayerResolver;
    }

    @Override // com.android.wallpaper.module.GoogleWallpapersInjector
    public GoogleWallpaperPreferences getGooglePreferences(Context context) {
        return (GoogleWallpaperPreferences) getPreferences(context);
    }

    @Override // com.android.wallpaper.module.Injector
    public synchronized IndividualPickerFragment getIndividualPickerFragment(String str) {
        IndividualPickerUnlockableFragment individualPickerUnlockableFragment;
        int i = IndividualPickerUnlockableFragment.$r8$clinit;
        Bundle bundle = new Bundle();
        bundle.putString("category_collection_id", str);
        individualPickerUnlockableFragment = new IndividualPickerUnlockableFragment();
        individualPickerUnlockableFragment.setArguments(bundle);
        return individualPickerUnlockableFragment;
    }

    @Override // com.android.wallpaper.module.Injector
    public CornerTreatment getLiveWallpaperInfoFactory(Context context) {
        if (this.mLiveWallpaperInfoFactory == null) {
            this.mLiveWallpaperInfoFactory = new CornerTreatment(2);
        }
        return this.mLiveWallpaperInfoFactory;
    }

    @Override // com.android.wallpaper.module.Injector
    public synchronized LoggingOptInStatusProvider getLoggingOptInStatusProvider(Context context) {
        if (this.mLoggingOptInStatusProvider == null) {
            Objects.requireNonNull(getFormFactorChecker(context));
            this.mLoggingOptInStatusProvider = new AlwaysLoggingOptInStatusProvider();
        }
        return this.mLoggingOptInStatusProvider;
    }

    @Override // com.android.wallpaper.module.Injector
    public synchronized PartnerProvider getPartnerProvider(Context context) {
        if (this.mPartnerProvider == null) {
            this.mPartnerProvider = new GooglePartnerProvider(context.getApplicationContext());
        }
        return this.mPartnerProvider;
    }

    @Override // com.android.wallpaper.module.Injector
    public synchronized WallpaperPreferences getPreferences(Context context) {
        if (this.mPrefs == null) {
            this.mPrefs = new DefaultGoogleWallpaperPreferences(context.getApplicationContext());
        }
        return this.mPrefs;
    }

    /* JADX WARN: Code restructure failed: missing block: B:47:0x0121, code lost:
        if (r1 == false) goto L48;
     */
    /* JADX WARN: Removed duplicated region for block: B:42:0x010b  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x012d  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0136  */
    @Override // com.android.wallpaper.module.Injector
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public androidx.fragment.app.Fragment getPreviewFragment(android.content.Context r17, com.android.wallpaper.model.WallpaperInfo r18, int r19, boolean r20, boolean r21, boolean r22) {
        /*
            Method dump skipped, instructions count: 374
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.module.WallpapersInjector.getPreviewFragment(android.content.Context, com.android.wallpaper.model.WallpaperInfo, int, boolean, boolean, boolean):androidx.fragment.app.Fragment");
    }

    @Override // com.android.wallpaper.module.GoogleWallpapersInjector
    public ServerFetcher getServerFetcher(Context context) {
        if (this.mBackdropFetcher == null) {
            this.mBackdropFetcher = new BackdropFetcher(getRequester(context), new DeviceConfigFilteringLabelProvider());
        }
        return this.mBackdropFetcher;
    }

    @Override // com.android.wallpaper.module.Injector
    public UserEventLogger getUserEventLogger(Context context) {
        ThemesUserEventLogger themesUserEventLogger;
        synchronized (this) {
            if (this.mUserEventLogger == null) {
                this.mUserEventLogger = new CompositeUserEventLogger(new StatsLogUserEventLogger(), new ClearcutUserEventLogger(context.getApplicationContext()));
            }
            themesUserEventLogger = this.mUserEventLogger;
        }
        return themesUserEventLogger;
    }

    @Override // com.android.wallpaper.module.Injector
    public synchronized WallpaperRotationRefresher getWallpaperRotationRefresher() {
        if (this.mWallpaperRotationRefresher == null) {
            this.mWallpaperRotationRefresher = new BackdropWallpaperRotationRefresher();
        }
        return this.mWallpaperRotationRefresher;
    }
}
