.class public interface abstract Lcom/android/wallpaper/module/WallpaperPreferences;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract addDailyRotation(J)V
.end method

.method public abstract clearDailyRotations()V
.end method

.method public abstract clearHomeWallpaperMetadata()V
.end method

.method public abstract clearLockWallpaperMetadata()V
.end method

.method public abstract getAppLaunchCount()I
.end method

.method public abstract getDailyRotationsInLastWeek()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDailyRotationsPreviousDay()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDailyWallpaperEnabledTimestamp()J
.end method

.method public abstract getDailyWallpaperLastRotationStatus()I
.end method

.method public abstract getDailyWallpaperLastRotationStatusTimestamp()J
.end method

.method public abstract getFirstLaunchDateSinceSetup()I
.end method

.method public abstract getFirstWallpaperApplyDateSinceSetup()I
.end method

.method public abstract getHomeWallpaperActionIconRes()I
.end method

.method public abstract getHomeWallpaperActionLabelRes()I
.end method

.method public abstract getHomeWallpaperActionUrl()Ljava/lang/String;
.end method

.method public abstract getHomeWallpaperAttributions()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getHomeWallpaperBackingFileName()Ljava/lang/String;
.end method

.method public abstract getHomeWallpaperBaseImageUrl()Ljava/lang/String;
.end method

.method public abstract getHomeWallpaperCollectionId()Ljava/lang/String;
.end method

.method public abstract getHomeWallpaperHashCode()J
.end method

.method public abstract getHomeWallpaperManagerId()I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation
.end method

.method public abstract getHomeWallpaperPackageName()Ljava/lang/String;
.end method

.method public abstract getHomeWallpaperRemoteId()Ljava/lang/String;
.end method

.method public abstract getHomeWallpaperServiceName()Ljava/lang/String;
.end method

.method public abstract getLastDailyLogTimestamp()J
.end method

.method public abstract getLastDailyRotationTimestamp()J
.end method

.method public abstract getLastSyncTimestamp()J
.end method

.method public abstract getLockWallpaperActionIconRes()I
.end method

.method public abstract getLockWallpaperActionLabelRes()I
.end method

.method public abstract getLockWallpaperActionUrl()Ljava/lang/String;
.end method

.method public abstract getLockWallpaperAttributions()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLockWallpaperBackingFileName()Ljava/lang/String;
.end method

.method public abstract getLockWallpaperCollectionId()Ljava/lang/String;
.end method

.method public abstract getLockWallpaperHashCode()J
.end method

.method public abstract getLockWallpaperId()I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation
.end method

.method public abstract getLockWallpaperRemoteId()Ljava/lang/String;
.end method

.method public abstract getNumDaysDailyRotationFailed()I
.end method

.method public abstract getNumDaysDailyRotationNotAttempted()I
.end method

.method public abstract getPendingDailyWallpaperUpdateStatus()I
.end method

.method public abstract getPendingWallpaperSetStatus()I
.end method

.method public abstract getWallpaperPresentationMode()I
.end method

.method public abstract incrementAppLaunched()V
.end method

.method public abstract incrementNumDaysDailyRotationFailed()V
.end method

.method public abstract incrementNumDaysDailyRotationNotAttempted()V
.end method

.method public abstract resetNumDaysDailyRotationFailed()V
.end method

.method public abstract resetNumDaysDailyRotationNotAttempted()V
.end method

.method public abstract setDailyWallpaperEnabledTimestamp(J)V
.end method

.method public abstract setDailyWallpaperRotationStatus(IJ)V
.end method

.method public abstract setHomeWallpaperActionIconRes(I)V
.end method

.method public abstract setHomeWallpaperActionLabelRes(I)V
.end method

.method public abstract setHomeWallpaperActionUrl(Ljava/lang/String;)V
.end method

.method public abstract setHomeWallpaperAttributions(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setHomeWallpaperBackingFileName(Ljava/lang/String;)V
.end method

.method public abstract setHomeWallpaperBaseImageUrl(Ljava/lang/String;)V
.end method

.method public abstract setHomeWallpaperCollectionId(Ljava/lang/String;)V
.end method

.method public abstract setHomeWallpaperHashCode(J)V
.end method

.method public abstract setHomeWallpaperManagerId(I)V
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation
.end method

.method public abstract setHomeWallpaperPackageName(Ljava/lang/String;)V
.end method

.method public abstract setHomeWallpaperRemoteId(Ljava/lang/String;)V
.end method

.method public abstract setHomeWallpaperServiceName(Ljava/lang/String;)V
.end method

.method public abstract setLastAppActiveTimestamp(J)V
.end method

.method public abstract setLastDailyLogTimestamp(J)V
.end method

.method public abstract setLastSyncTimestamp(J)V
.end method

.method public abstract setLockWallpaperActionIconRes(I)V
.end method

.method public abstract setLockWallpaperActionLabelRes(I)V
.end method

.method public abstract setLockWallpaperActionUrl(Ljava/lang/String;)V
.end method

.method public abstract setLockWallpaperAttributions(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setLockWallpaperCollectionId(Ljava/lang/String;)V
.end method

.method public abstract setLockWallpaperHashCode(J)V
.end method

.method public abstract setLockWallpaperId(I)V
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation
.end method

.method public abstract setLockWallpaperRemoteId(Ljava/lang/String;)V
.end method

.method public abstract setPendingDailyWallpaperUpdateStatus(I)V
.end method

.method public abstract setPendingDailyWallpaperUpdateStatusSync(I)V
.end method

.method public abstract setPendingWallpaperSetStatus(I)V
.end method

.method public abstract setPendingWallpaperSetStatusSync(I)V
.end method

.method public abstract setWallpaperPresentationMode(I)V
.end method

.method public storeLatestHomeWallpaper(Ljava/lang/String;Lcom/android/wallpaper/model/LiveWallpaperInfo;Landroid/app/WallpaperColors;)V
    .locals 0

    return-void
.end method

.method public storeLatestHomeWallpaper(Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Landroid/app/WallpaperColors;)V
    .locals 0

    return-void
.end method

.method public storeLatestHomeWallpaper(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/app/WallpaperColors;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            "Landroid/app/WallpaperColors;",
            ")V"
        }
    .end annotation

    return-void
.end method

.method public abstract updateDailyWallpaperSet(ILjava/lang/String;Ljava/lang/String;)V
.end method
