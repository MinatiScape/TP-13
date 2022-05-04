.class public Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/module/ThemesUserEventLogger;


# instance fields
.field public final mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

.field public final mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;


# direct methods
.method public constructor <init>(Lcom/android/customization/module/ThemesUserEventLogger;Lcom/android/customization/module/ThemesUserEventLogger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    .line 3
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    return-void
.end method


# virtual methods
.method public logActionClicked(Ljava/lang/String;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1, p2}, Lcom/android/wallpaper/module/UserEventLogger;->logActionClicked(Ljava/lang/String;I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1, p2}, Lcom/android/wallpaper/module/UserEventLogger;->logActionClicked(Ljava/lang/String;I)V

    return-void
.end method

.method public logAppLaunched(Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logAppLaunched(Landroid/content/Intent;)V

    return-void
.end method

.method public logCategorySelected(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logCategorySelected(Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logCategorySelected(Ljava/lang/String;)V

    return-void
.end method

.method public logColorApplied(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1, p2}, Lcom/android/customization/module/ThemesUserEventLogger;->logColorApplied(II)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1, p2}, Lcom/android/customization/module/ThemesUserEventLogger;->logColorApplied(II)V

    return-void
.end method

.method public logCurrentWallpaperPreviewed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logCurrentWallpaperPreviewed()V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logCurrentWallpaperPreviewed()V

    return-void
.end method

.method public logDailyRefreshTurnedOn()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyRefreshTurnedOn()V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyRefreshTurnedOn()V

    return-void
.end method

.method public logDailyWallpaperMetadataRequestFailure(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperMetadataRequestFailure(I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperMetadataRequestFailure(I)V

    return-void
.end method

.method public logDailyWallpaperRotationHour(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperRotationHour(I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperRotationHour(I)V

    return-void
.end method

.method public logDailyWallpaperRotationStatus(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperRotationStatus(I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperRotationStatus(I)V

    return-void
.end method

.method public logDailyWallpaperSetNextWallpaperCrash(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperSetNextWallpaperCrash(I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperSetNextWallpaperCrash(I)V

    return-void
.end method

.method public logDailyWallpaperSetNextWallpaperResult(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperSetNextWallpaperResult(I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperSetNextWallpaperResult(I)V

    return-void
.end method

.method public logGridApplied(Lcom/android/customization/model/grid/GridOption;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/customization/module/ThemesUserEventLogger;->logGridApplied(Lcom/android/customization/model/grid/GridOption;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/customization/module/ThemesUserEventLogger;->logGridApplied(Lcom/android/customization/model/grid/GridOption;)V

    return-void
.end method

.method public logGridSelected(Lcom/android/customization/model/grid/GridOption;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/customization/module/ThemesUserEventLogger;->logGridSelected(Lcom/android/customization/model/grid/GridOption;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/customization/module/ThemesUserEventLogger;->logGridSelected(Lcom/android/customization/model/grid/GridOption;)V

    return-void
.end method

.method public logIndividualWallpaperSelected(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logIndividualWallpaperSelected(Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logIndividualWallpaperSelected(Ljava/lang/String;)V

    return-void
.end method

.method public logNumDailyWallpaperRotationsInLastWeek()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDailyWallpaperRotationsInLastWeek()V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDailyWallpaperRotationsInLastWeek()V

    return-void
.end method

.method public logNumDailyWallpaperRotationsPreviousDay()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDailyWallpaperRotationsPreviousDay()V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDailyWallpaperRotationsPreviousDay()V

    return-void
.end method

.method public logNumDaysDailyRotationFailed(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDaysDailyRotationFailed(I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDaysDailyRotationFailed(I)V

    return-void
.end method

.method public logNumDaysDailyRotationNotAttempted(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDaysDailyRotationNotAttempted(I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logNumDaysDailyRotationNotAttempted(I)V

    return-void
.end method

.method public logRefreshDailyWallpaperButtonClicked()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logRefreshDailyWallpaperButtonClicked()V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logRefreshDailyWallpaperButtonClicked()V

    return-void
.end method

.method public logRestored()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logRestored()V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logRestored()V

    return-void
.end method

.method public logResumed(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1, p2}, Lcom/android/wallpaper/module/UserEventLogger;->logResumed(ZZ)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1, p2}, Lcom/android/wallpaper/module/UserEventLogger;->logResumed(ZZ)V

    return-void
.end method

.method public logSnapshot()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logSnapshot()V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logSnapshot()V

    return-void
.end method

.method public logStandalonePreviewImageUriHasReadPermission(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logStandalonePreviewImageUriHasReadPermission(Z)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logStandalonePreviewImageUriHasReadPermission(Z)V

    return-void
.end method

.method public logStandalonePreviewLaunched()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logStandalonePreviewLaunched()V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logStandalonePreviewLaunched()V

    return-void
.end method

.method public logStandalonePreviewStorageDialogApproved(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logStandalonePreviewImageUriHasReadPermission(Z)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logStandalonePreviewImageUriHasReadPermission(Z)V

    return-void
.end method

.method public logStopped()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logStopped()V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logStopped()V

    return-void
.end method

.method public logWallpaperPresentationMode()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperPresentationMode()V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperPresentationMode()V

    return-void
.end method

.method public logWallpaperSet(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1, p2}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSet(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1, p2}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSet(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public logWallpaperSetFailureReason(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetFailureReason(I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetFailureReason(I)V

    return-void
.end method

.method public logWallpaperSetResult(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger1:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetResult(I)V

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/CompositeUserEventLogger;->mLogger2:Lcom/android/customization/module/ThemesUserEventLogger;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetResult(I)V

    return-void
.end method
