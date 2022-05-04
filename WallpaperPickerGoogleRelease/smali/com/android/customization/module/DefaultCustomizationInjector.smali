.class public Lcom/android/customization/module/DefaultCustomizationInjector;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/module/CustomizationInjector;
.implements Lcom/android/wallpaper/module/Injector;


# instance fields
.field public mAlarmManagerWrapper:Landroidx/lifecycle/MethodCallsLogger;

.field public mBitmapCropper:Lcom/android/wallpaper/module/BitmapCropper;

.field public mCurrentWallpaperFactory:Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;

.field public mDisplayUtils:Lcom/android/wallpaper/util/DisplayUtils;

.field public mExploreIntentChecker:Lcom/android/wallpaper/module/ExploreIntentChecker;

.field public mFormFactorChecker:Lcom/android/wallpaper/util/DownloadableUtils;

.field public mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

.field public mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

.field public mRequester:Lcom/google/android/gms/common/internal/zzam;

.field public mSystemFeatureChecker:Lcom/google/android/material/shape/CornerTreatment;

.field public mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

.field public mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

.field public mWallpaperRefresher:Lcom/android/wallpaper/module/WallpaperRefresher;

.field public mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized getAlarmManagerWrapper(Landroid/content/Context;)Landroidx/lifecycle/MethodCallsLogger;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mAlarmManagerWrapper:Landroidx/lifecycle/MethodCallsLogger;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Landroidx/lifecycle/MethodCallsLogger;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Landroidx/lifecycle/MethodCallsLogger;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mAlarmManagerWrapper:Landroidx/lifecycle/MethodCallsLogger;

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mAlarmManagerWrapper:Landroidx/lifecycle/MethodCallsLogger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getBitmapCropper()Lcom/android/wallpaper/module/BitmapCropper;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mBitmapCropper:Lcom/android/wallpaper/module/BitmapCropper;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/android/wallpaper/module/DefaultBitmapCropper;

    invoke-direct {v0}, Lcom/android/wallpaper/module/DefaultBitmapCropper;-><init>()V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mBitmapCropper:Lcom/android/wallpaper/module/BitmapCropper;

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mBitmapCropper:Lcom/android/wallpaper/module/BitmapCropper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getCurrentWallpaperFactory(Landroid/content/Context;)Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mCurrentWallpaperFactory:Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;

    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mCurrentWallpaperFactory:Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mCurrentWallpaperFactory:Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getDeepLinkRedirectIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 2
    const-class v0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 3
    invoke-virtual {p0, p2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const p1, 0x10008000

    .line 4
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    return-object p0
.end method

.method public getDisplayUtils(Landroid/content/Context;)Lcom/android/wallpaper/util/DisplayUtils;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mDisplayUtils:Lcom/android/wallpaper/util/DisplayUtils;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/util/DisplayUtils;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/android/wallpaper/util/DisplayUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mDisplayUtils:Lcom/android/wallpaper/util/DisplayUtils;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mDisplayUtils:Lcom/android/wallpaper/util/DisplayUtils;

    return-object p0
.end method

.method public declared-synchronized getExploreIntentChecker(Landroid/content/Context;)Lcom/android/wallpaper/module/ExploreIntentChecker;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mExploreIntentChecker:Lcom/android/wallpaper/module/ExploreIntentChecker;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mExploreIntentChecker:Lcom/android/wallpaper/module/ExploreIntentChecker;

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mExploreIntentChecker:Lcom/android/wallpaper/module/ExploreIntentChecker;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mFormFactorChecker:Lcom/android/wallpaper/util/DownloadableUtils;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/android/wallpaper/util/DownloadableUtils;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lcom/android/wallpaper/util/DownloadableUtils;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mFormFactorChecker:Lcom/android/wallpaper/util/DownloadableUtils;

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mFormFactorChecker:Lcom/android/wallpaper/util/DownloadableUtils;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getNetworkStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/NetworkStatusNotifier;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getPackageStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/PackageStatusNotifier;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getRequester(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzam;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mRequester:Lcom/google/android/gms/common/internal/zzam;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/google/android/gms/common/internal/zzam;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/android/gms/common/internal/zzam;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mRequester:Lcom/google/android/gms/common/internal/zzam;

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mRequester:Lcom/google/android/gms/common/internal/zzam;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getSystemFeatureChecker()Lcom/google/android/material/shape/CornerTreatment;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mSystemFeatureChecker:Lcom/google/android/material/shape/CornerTreatment;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/google/android/material/shape/CornerTreatment;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/android/material/shape/CornerTreatment;-><init>(I)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mSystemFeatureChecker:Lcom/google/android/material/shape/CornerTreatment;

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mSystemFeatureChecker:Lcom/google/android/material/shape/CornerTreatment;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getWallpaperManagerCompat(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    if-nez v0, :cond_0

    .line 3
    invoke-static {p1}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getInstance(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    move-result-object p1

    iput-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getWallpaperRefresher(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperRefresher;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperRefresher:Lcom/android/wallpaper/module/WallpaperRefresher;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/android/wallpaper/module/DefaultWallpaperRefresher;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperRefresher:Lcom/android/wallpaper/module/WallpaperRefresher;

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperRefresher:Lcom/android/wallpaper/module/WallpaperRefresher;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getWallpaperStatusChecker()Lcom/google/android/material/shape/EdgeTreatment;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/material/shape/EdgeTreatment;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/android/material/shape/EdgeTreatment;-><init>(I)V

    iput-object v0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/customization/module/DefaultCustomizationInjector;->mWallpaperStatusChecker:Lcom/google/android/material/shape/EdgeTreatment;

    return-object p0
.end method
