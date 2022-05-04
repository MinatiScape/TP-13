.class public interface abstract Lcom/android/wallpaper/module/UserEventLogger;
.super Ljava/lang/Object;
.source "UserEventLogger.java"


# virtual methods
.method public abstract logActionClicked(Ljava/lang/String;I)V
.end method

.method public abstract logAppLaunched(Landroid/content/Intent;)V
.end method

.method public abstract logCategorySelected(Ljava/lang/String;)V
.end method

.method public abstract logCurrentWallpaperPreviewed()V
.end method

.method public abstract logDailyRefreshTurnedOn()V
.end method

.method public abstract logDailyWallpaperMetadataRequestFailure(I)V
.end method

.method public abstract logDailyWallpaperRotationHour(I)V
.end method

.method public abstract logDailyWallpaperRotationStatus(I)V
.end method

.method public abstract logDailyWallpaperSetNextWallpaperCrash(I)V
.end method

.method public abstract logDailyWallpaperSetNextWallpaperResult(I)V
.end method

.method public abstract logIndividualWallpaperSelected(Ljava/lang/String;)V
.end method

.method public abstract logNumDailyWallpaperRotationsInLastWeek()V
.end method

.method public abstract logNumDailyWallpaperRotationsPreviousDay()V
.end method

.method public abstract logNumDaysDailyRotationFailed(I)V
.end method

.method public abstract logNumDaysDailyRotationNotAttempted(I)V
.end method

.method public abstract logRestored()V
.end method

.method public abstract logResumed(ZZ)V
.end method

.method public abstract logSnapshot()V
.end method

.method public abstract logStandalonePreviewImageUriHasReadPermission(Z)V
.end method

.method public abstract logStandalonePreviewLaunched()V
.end method

.method public abstract logStandalonePreviewStorageDialogApproved(Z)V
.end method

.method public abstract logStopped()V
.end method

.method public abstract logWallpaperPresentationMode()V
.end method

.method public abstract logWallpaperSet(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract logWallpaperSetFailureReason(I)V
.end method

.method public abstract logWallpaperSetResult(I)V
.end method
