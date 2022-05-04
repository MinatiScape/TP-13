package com.android.wallpaper.module;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.MethodCallsLogger;
import com.android.wallpaper.compat.WallpaperManagerCompatV16;
import com.android.wallpaper.model.CategoryProvider;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.picker.individual.IndividualPickerFragment;
import com.android.wallpaper.util.DisplayUtils;
import com.android.wallpaper.util.DownloadableUtils;
import com.google.android.gms.common.internal.zzam;
import com.google.android.material.shape.CornerTreatment;
import com.google.android.material.shape.EdgeTreatment;
/* loaded from: classes.dex */
public interface Injector {
    MethodCallsLogger getAlarmManagerWrapper(Context context);

    BitmapCropper getBitmapCropper();

    CategoryProvider getCategoryProvider(Context context);

    CurrentWallpaperInfoFactory getCurrentWallpaperFactory(Context context);

    CustomizationSections getCustomizationSections();

    Intent getDeepLinkRedirectIntent(Context context, Uri uri);

    DisplayUtils getDisplayUtils(Context context);

    String getDownloadableIntentAction();

    DrawableLayerResolver getDrawableLayerResolver();

    ExploreIntentChecker getExploreIntentChecker(Context context);

    DownloadableUtils getFormFactorChecker(Context context);

    IndividualPickerFragment getIndividualPickerFragment(String str);

    CornerTreatment getLiveWallpaperInfoFactory(Context context);

    LoggingOptInStatusProvider getLoggingOptInStatusProvider(Context context);

    NetworkStatusNotifier getNetworkStatusNotifier(Context context);

    PackageStatusNotifier getPackageStatusNotifier(Context context);

    PartnerProvider getPartnerProvider(Context context);

    WallpaperPreferences getPreferences(Context context);

    Fragment getPreviewFragment(Context context, WallpaperInfo wallpaperInfo, int i, boolean z, boolean z2, boolean z3);

    zzam getRequester(Context context);

    CornerTreatment getSystemFeatureChecker();

    UserEventLogger getUserEventLogger(Context context);

    WallpaperManagerCompatV16 getWallpaperManagerCompat(Context context);

    WallpaperPersister getWallpaperPersister(Context context);

    WallpaperRefresher getWallpaperRefresher(Context context);

    WallpaperRotationRefresher getWallpaperRotationRefresher();

    EdgeTreatment getWallpaperStatusChecker();
}
