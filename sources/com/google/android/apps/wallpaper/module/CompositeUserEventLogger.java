package com.google.android.apps.wallpaper.module;

import android.content.Intent;
import com.android.customization.model.grid.GridOption;
import com.android.customization.module.StatsLogUserEventLogger;
import com.android.customization.module.ThemesUserEventLogger;
/* loaded from: classes.dex */
public final class CompositeUserEventLogger implements ThemesUserEventLogger {
    public final ThemesUserEventLogger mLogger1;
    public final ThemesUserEventLogger mLogger2;

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logActionClicked(String str, int i) {
        this.mLogger1.logActionClicked(str, i);
        this.mLogger2.logActionClicked(str, i);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logAppLaunched(Intent intent) {
        this.mLogger1.logAppLaunched(intent);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logCategorySelected(String str) {
        this.mLogger1.logCategorySelected(str);
        this.mLogger2.logCategorySelected(str);
    }

    @Override // com.android.customization.module.ThemesUserEventLogger
    public final void logColorApplied(int i, int i2) {
        this.mLogger1.logColorApplied(i, i2);
        this.mLogger2.logColorApplied(i, i2);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logCurrentWallpaperPreviewed() {
        this.mLogger1.logCurrentWallpaperPreviewed();
        this.mLogger2.logCurrentWallpaperPreviewed();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logDailyRefreshTurnedOn() {
        this.mLogger1.logDailyRefreshTurnedOn();
        this.mLogger2.logDailyRefreshTurnedOn();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logDailyWallpaperMetadataRequestFailure(int i) {
        this.mLogger1.logDailyWallpaperMetadataRequestFailure(i);
        this.mLogger2.logDailyWallpaperMetadataRequestFailure(i);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logDailyWallpaperRotationHour(int i) {
        this.mLogger1.logDailyWallpaperRotationHour(i);
        this.mLogger2.logDailyWallpaperRotationHour(i);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logDailyWallpaperRotationStatus(int i) {
        this.mLogger1.logDailyWallpaperRotationStatus(i);
        this.mLogger2.logDailyWallpaperRotationStatus(i);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logDailyWallpaperSetNextWallpaperCrash(int i) {
        this.mLogger1.logDailyWallpaperSetNextWallpaperCrash(i);
        this.mLogger2.logDailyWallpaperSetNextWallpaperCrash(i);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logDailyWallpaperSetNextWallpaperResult(int i) {
        this.mLogger1.logDailyWallpaperSetNextWallpaperResult(i);
        this.mLogger2.logDailyWallpaperSetNextWallpaperResult(i);
    }

    @Override // com.android.customization.module.ThemesUserEventLogger
    public final void logGridApplied(GridOption gridOption) {
        this.mLogger1.logGridApplied(gridOption);
        this.mLogger2.logGridApplied(gridOption);
    }

    @Override // com.android.customization.module.ThemesUserEventLogger
    public final void logGridSelected(GridOption gridOption) {
        this.mLogger1.logGridSelected(gridOption);
        this.mLogger2.logGridSelected(gridOption);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logIndividualWallpaperSelected(String str) {
        this.mLogger1.logIndividualWallpaperSelected(str);
        this.mLogger2.logIndividualWallpaperSelected(str);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logNumDailyWallpaperRotationsInLastWeek() {
        this.mLogger1.logNumDailyWallpaperRotationsInLastWeek();
        this.mLogger2.logNumDailyWallpaperRotationsInLastWeek();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logNumDailyWallpaperRotationsPreviousDay() {
        this.mLogger1.logNumDailyWallpaperRotationsPreviousDay();
        this.mLogger2.logNumDailyWallpaperRotationsPreviousDay();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logNumDaysDailyRotationFailed(int i) {
        this.mLogger1.logNumDaysDailyRotationFailed(i);
        this.mLogger2.logNumDaysDailyRotationFailed(i);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logNumDaysDailyRotationNotAttempted(int i) {
        this.mLogger1.logNumDaysDailyRotationNotAttempted(i);
        this.mLogger2.logNumDaysDailyRotationNotAttempted(i);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logRestored() {
        this.mLogger1.logRestored();
        this.mLogger2.logRestored();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logResumed(boolean z, boolean z2) {
        this.mLogger1.logResumed(z, z2);
        this.mLogger2.logResumed(z, z2);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logSnapshot() {
        this.mLogger1.logSnapshot();
        this.mLogger2.logSnapshot();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logStandalonePreviewImageUriHasReadPermission(boolean z) {
        this.mLogger1.logStandalonePreviewImageUriHasReadPermission(z);
        this.mLogger2.logStandalonePreviewImageUriHasReadPermission(z);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logStandalonePreviewLaunched() {
        this.mLogger1.logStandalonePreviewLaunched();
        this.mLogger2.logStandalonePreviewLaunched();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logStandalonePreviewStorageDialogApproved(boolean z) {
        this.mLogger1.logStandalonePreviewImageUriHasReadPermission(z);
        this.mLogger2.logStandalonePreviewImageUriHasReadPermission(z);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logStopped() {
        this.mLogger1.logStopped();
        this.mLogger2.logStopped();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logWallpaperPresentationMode() {
        this.mLogger1.logWallpaperPresentationMode();
        this.mLogger2.logWallpaperPresentationMode();
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logWallpaperSet(String str, String str2) {
        this.mLogger1.logWallpaperSet(str, str2);
        this.mLogger2.logWallpaperSet(str, str2);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logWallpaperSetFailureReason(int i) {
        this.mLogger1.logWallpaperSetFailureReason(i);
        this.mLogger2.logWallpaperSetFailureReason(i);
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public final void logWallpaperSetResult(int i) {
        this.mLogger1.logWallpaperSetResult(i);
        this.mLogger2.logWallpaperSetResult(i);
    }

    public CompositeUserEventLogger(StatsLogUserEventLogger statsLogUserEventLogger, ClearcutUserEventLogger clearcutUserEventLogger) {
        this.mLogger1 = statsLogUserEventLogger;
        this.mLogger2 = clearcutUserEventLogger;
    }
}
