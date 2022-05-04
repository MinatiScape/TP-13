package com.android.wallpaper.module;

import android.content.Context;
import android.os.Bundle;
import com.android.customization.module.DefaultCustomizationInjector;
import com.android.customization.module.StatsLogUserEventLogger;
import com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda0;
import com.android.wallpaper.model.CategoryProvider;
import com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.apps.wallpaper.backdrop.BackdropFetcher;
import com.google.android.apps.wallpaper.effects.CinematicEffectsController;
import com.google.android.apps.wallpaper.module.ClearcutUserEventLogger;
import com.google.android.apps.wallpaper.module.CompositeUserEventLogger;
import com.google.android.apps.wallpaper.module.DefaultGoogleWallpaperPreferences;
import com.google.android.apps.wallpaper.module.DeviceConfigFilteringLabelProvider;
import com.google.android.apps.wallpaper.module.GooglePartnerProvider;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import com.google.android.apps.wallpaper.module.WallpaperCategoryProvider;
import kotlin.jvm.internal.Intrinsics;
/* loaded from: classes.dex */
public final class WallpapersInjector extends DefaultCustomizationInjector implements GoogleWallpapersInjector {
    public BackdropFetcher mBackdropFetcher;
    public WallpaperCategoryProvider mCategoryProvider;
    public GoogleCustomizationSections mCustomizationSections;
    public DeviceColorLayerResolver mDrawableLayerResolver;
    public Intrinsics mLiveWallpaperInfoFactory;
    public LaunchUtils mLoggingOptInStatusProvider;
    public GooglePartnerProvider mPartnerProvider;
    public DefaultGoogleWallpaperPreferences mPrefs;
    public CompositeUserEventLogger mUserEventLogger;

    @Override // com.android.wallpaper.module.Injector
    public final synchronized CategoryProvider getCategoryProvider(Context context) {
        if (this.mCategoryProvider == null) {
            this.mCategoryProvider = new WallpaperCategoryProvider(context.getApplicationContext());
        }
        return this.mCategoryProvider;
    }

    @Override // com.android.wallpaper.module.Injector
    public final void getDownloadableIntentAction() {
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized IndividualPickerUnlockableFragment getIndividualPickerFragment(String str) {
        IndividualPickerUnlockableFragment individualPickerUnlockableFragment;
        int i = IndividualPickerUnlockableFragment.$r8$clinit;
        Bundle bundle = new Bundle();
        bundle.putString("category_collection_id", str);
        individualPickerUnlockableFragment = new IndividualPickerUnlockableFragment();
        individualPickerUnlockableFragment.setArguments(bundle);
        return individualPickerUnlockableFragment;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized LoggingOptInStatusProvider getLoggingOptInStatusProvider() {
        if (this.mLoggingOptInStatusProvider == null) {
            this.mLoggingOptInStatusProvider = new LaunchUtils();
        }
        return this.mLoggingOptInStatusProvider;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized GooglePartnerProvider getPartnerProvider(Context context) {
        if (this.mPartnerProvider == null) {
            this.mPartnerProvider = new GooglePartnerProvider(context.getApplicationContext());
        }
        return this.mPartnerProvider;
    }

    @Override // com.android.wallpaper.module.Injector
    public final synchronized GoogleWallpaperPreferences getPreferences(Context context) {
        if (this.mPrefs == null) {
            this.mPrefs = new DefaultGoogleWallpaperPreferences(context.getApplicationContext());
        }
        return this.mPrefs;
    }

    @Override // com.android.wallpaper.module.Injector
    public final CompositeUserEventLogger getUserEventLogger(Context context) {
        CompositeUserEventLogger compositeUserEventLogger;
        synchronized (this) {
            if (this.mUserEventLogger == null) {
                this.mUserEventLogger = new CompositeUserEventLogger(new StatsLogUserEventLogger(), new ClearcutUserEventLogger(context.getApplicationContext()));
            }
            compositeUserEventLogger = this.mUserEventLogger;
        }
        return compositeUserEventLogger;
    }

    @Override // com.android.wallpaper.module.Injector
    public final CinematicEffectsController createEffectsController(Context context, WallpaperPreviewer$$ExternalSyntheticLambda0 wallpaperPreviewer$$ExternalSyntheticLambda0) {
        return new CinematicEffectsController(context, wallpaperPreviewer$$ExternalSyntheticLambda0);
    }

    @Override // com.android.wallpaper.module.Injector
    public final CustomizationSections getCustomizationSections() {
        if (this.mCustomizationSections == null) {
            this.mCustomizationSections = new GoogleCustomizationSections();
        }
        return this.mCustomizationSections;
    }

    @Override // com.android.wallpaper.module.Injector
    public final DrawableLayerResolver getDrawableLayerResolver() {
        if (this.mDrawableLayerResolver == null) {
            this.mDrawableLayerResolver = new DeviceColorLayerResolver();
        }
        return this.mDrawableLayerResolver;
    }

    @Override // com.android.wallpaper.module.Injector
    public final Intrinsics getLiveWallpaperInfoFactory() {
        if (this.mLiveWallpaperInfoFactory == null) {
            this.mLiveWallpaperInfoFactory = new Intrinsics();
        }
        return this.mLiveWallpaperInfoFactory;
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
    public final com.android.wallpaper.picker.PreviewFragment getPreviewFragment(android.content.Context r17, com.android.wallpaper.model.WallpaperInfo r18, int r19, boolean r20, boolean r21, boolean r22) {
        /*
            Method dump skipped, instructions count: 374
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.module.WallpapersInjector.getPreviewFragment(android.content.Context, com.android.wallpaper.model.WallpaperInfo, int, boolean, boolean, boolean):com.android.wallpaper.picker.PreviewFragment");
    }

    @Override // com.android.wallpaper.module.GoogleWallpapersInjector
    public final BackdropFetcher getServerFetcher(Context context) {
        if (this.mBackdropFetcher == null) {
            this.mBackdropFetcher = new BackdropFetcher(getRequester(context), new DeviceConfigFilteringLabelProvider());
        }
        return this.mBackdropFetcher;
    }

    @Override // com.android.wallpaper.module.GoogleWallpapersInjector
    public final GoogleWallpaperPreferences getGooglePreferences(Context context) {
        return getPreferences(context);
    }
}
