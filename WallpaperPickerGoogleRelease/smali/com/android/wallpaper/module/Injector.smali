.class public interface abstract Lcom/android/wallpaper/module/Injector;
.super Ljava/lang/Object;
.source "Injector.java"


# virtual methods
.method public abstract createEffectsController(Landroid/content/Context;Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda0;)Lcom/google/android/apps/wallpaper/effects/CinematicEffectsController;
.end method

.method public abstract getAlarmManagerWrapper(Landroid/content/Context;)Lcom/android/wallpaper/module/DefaultAlarmManagerWrapper;
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

.method public abstract getDownloadableIntentAction()V
.end method

.method public abstract getDrawableLayerResolver()Lcom/android/wallpaper/module/DrawableLayerResolver;
.end method

.method public abstract getExploreIntentChecker(Landroid/content/Context;)Lcom/android/wallpaper/module/ExploreIntentChecker;
.end method

.method public abstract getIndividualPickerFragment(Ljava/lang/String;)Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;
.end method

.method public abstract getLiveWallpaperInfoFactory()Lkotlin/jvm/internal/Intrinsics;
.end method

.method public abstract getLoggingOptInStatusProvider()Lcom/android/wallpaper/module/LoggingOptInStatusProvider;
.end method

.method public abstract getNetworkStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/NetworkStatusNotifier;
.end method

.method public abstract getPackageStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/PackageStatusNotifier;
.end method

.method public abstract getPartnerProvider(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/module/GooglePartnerProvider;
.end method

.method public abstract getPreferences(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;
.end method

.method public abstract getPreviewFragment(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;IZZZ)Lcom/android/wallpaper/picker/PreviewFragment;
.end method

.method public abstract getRequester(Landroid/content/Context;)Lcom/android/wallpaper/network/WallpaperRequester;
.end method

.method public abstract getSystemFeatureChecker()Lcom/android/wallpaper/util/LaunchUtils;
.end method

.method public abstract getUserEventLogger(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;
.end method

.method public abstract getWallpaperManagerCompat(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompat;
.end method

.method public abstract getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;
.end method

.method public abstract getWallpaperRefresher(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperRefresher;
.end method

.method public abstract getWallpaperStatusChecker()Lcom/google/android/gms/common/util/zzh;
.end method
