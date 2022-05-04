package com.android.wallpaper.module;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda0;
import com.android.wallpaper.compat.WallpaperManagerCompat;
import com.android.wallpaper.model.CategoryProvider;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.network.WallpaperRequester;
import com.android.wallpaper.picker.PreviewFragment;
import com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment;
import com.android.wallpaper.util.DisplayUtils;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.apps.wallpaper.effects.CinematicEffectsController;
import com.google.android.apps.wallpaper.module.CompositeUserEventLogger;
import com.google.android.apps.wallpaper.module.GooglePartnerProvider;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import com.google.android.gms.common.util.zzh;
import kotlin.jvm.internal.Intrinsics;
/* loaded from: classes.dex */
public interface Injector {
    CinematicEffectsController createEffectsController(Context context, WallpaperPreviewer$$ExternalSyntheticLambda0 wallpaperPreviewer$$ExternalSyntheticLambda0);

    DefaultAlarmManagerWrapper getAlarmManagerWrapper(Context context);

    BitmapCropper getBitmapCropper();

    CategoryProvider getCategoryProvider(Context context);

    CurrentWallpaperInfoFactory getCurrentWallpaperFactory(Context context);

    CustomizationSections getCustomizationSections();

    Intent getDeepLinkRedirectIntent(Context context, Uri uri);

    DisplayUtils getDisplayUtils(Context context);

    void getDownloadableIntentAction();

    DrawableLayerResolver getDrawableLayerResolver();

    ExploreIntentChecker getExploreIntentChecker(Context context);

    IndividualPickerUnlockableFragment getIndividualPickerFragment(String str);

    Intrinsics getLiveWallpaperInfoFactory();

    LoggingOptInStatusProvider getLoggingOptInStatusProvider();

    NetworkStatusNotifier getNetworkStatusNotifier(Context context);

    PackageStatusNotifier getPackageStatusNotifier(Context context);

    GooglePartnerProvider getPartnerProvider(Context context);

    GoogleWallpaperPreferences getPreferences(Context context);

    PreviewFragment getPreviewFragment(Context context, WallpaperInfo wallpaperInfo, int i, boolean z, boolean z2, boolean z3);

    WallpaperRequester getRequester(Context context);

    LaunchUtils getSystemFeatureChecker();

    CompositeUserEventLogger getUserEventLogger(Context context);

    WallpaperManagerCompat getWallpaperManagerCompat(Context context);

    WallpaperPersister getWallpaperPersister(Context context);

    WallpaperRefresher getWallpaperRefresher(Context context);

    zzh getWallpaperStatusChecker();
}
