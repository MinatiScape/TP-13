.class public interface abstract Lcom/android/wallpaper/module/Injector;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract getAlarmManagerWrapper(Landroid/content/Context;)Landroidx/lifecycle/MethodCallsLogger;
.end method

.method public abstract getBitmapCropper()Lcom/android/wallpaper/module/BitmapCropper;
.end method

.method public abstract getCategoryProvider(Landroid/content/Context;)Lcom/android/wallpaper/model/CategoryProvider;
.end method

.method public abstract getCurrentWallpaperFactory(Landroid/content/Context;)Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;
.end method

.method public abstract getCustomizationSections()Lcom/android/wallpaper/module/CustomizationSections;
.end method

.method public abstract getDeepLinkRedirectIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;
.end method

.method public abstract getDisplayUtils(Landroid/content/Context;)Lcom/android/wallpaper/util/DisplayUtils;
.end method

.method public abstract getDownloadableIntentAction()Ljava/lang/String;
.end method

.method public abstract getDrawableLayerResolver()Lcom/android/wallpaper/module/DrawableLayerResolver;
.end method

.method public abstract getExploreIntentChecker(Landroid/content/Context;)Lcom/android/wallpaper/module/ExploreIntentChecker;
.end method

.method public abstract getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;
.end method

.method public abstract getIndividualPickerFragment(Ljava/lang/String;)Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;
.end method

.method public abstract getLiveWallpaperInfoFactory(Landroid/content/Context;)Lcom/google/android/material/shape/CornerTreatment;
.end method

.method public abstract getLoggingOptInStatusProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/LoggingOptInStatusProvider;
.end method

.method public abstract getNetworkStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/NetworkStatusNotifier;
.end method

.method public abstract getPackageStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/PackageStatusNotifier;
.end method

.method public abstract getPartnerProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/PartnerProvider;
.end method

.method public abstract getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;
.end method

.method public abstract getPreviewFragment(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;IZZZ)Landroidx/fragment/app/Fragment;
.end method

.method public abstract getRequester(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzam;
.end method

.method public abstract getSystemFeatureChecker()Lcom/google/android/material/shape/CornerTreatment;
.end method

.method public abstract getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;
.end method

.method public abstract getWallpaperManagerCompat(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;
.end method

.method public abstract getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;
.end method

.method public abstract getWallpaperRefresher(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperRefresher;
.end method

.method public abstract getWallpaperRotationRefresher()Lcom/android/wallpaper/module/WallpaperRotationRefresher;
.end method

.method public abstract getWallpaperStatusChecker()Lcom/google/android/material/shape/EdgeTreatment;
.end method
