package com.bumptech.glide.manager;

import com.android.wallpaper.module.UserEventLogger;
import com.google.android.material.shape.ShapePath;
/* loaded from: classes.dex */
public class ApplicationLifecycle implements UserEventLogger, Lifecycle {
    public void getCornerPath(ShapePath shapePath, float f, float f2) {
        throw null;
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logCurrentWallpaperPreviewed() {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logDailyRefreshTurnedOn() {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logDailyWallpaperMetadataRequestFailure(int i) {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logDailyWallpaperRotationHour(int i) {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logDailyWallpaperRotationStatus(int i) {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logDailyWallpaperSetNextWallpaperCrash(int i) {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logDailyWallpaperSetNextWallpaperResult(int i) {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logNumDailyWallpaperRotationsInLastWeek() {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logNumDailyWallpaperRotationsPreviousDay() {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logNumDaysDailyRotationFailed(int i) {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logNumDaysDailyRotationNotAttempted(int i) {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logRestored() {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logSnapshot() {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logStandalonePreviewImageUriHasReadPermission(boolean z) {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logStandalonePreviewLaunched() {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logStandalonePreviewStorageDialogApproved(boolean z) {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logWallpaperPresentationMode() {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logWallpaperSetFailureReason(int i) {
    }

    @Override // com.android.wallpaper.module.UserEventLogger
    public void logWallpaperSetResult(int i) {
    }

    @Override // com.bumptech.glide.manager.Lifecycle
    public final void removeListener(LifecycleListener lifecycleListener) {
    }

    @Override // com.bumptech.glide.manager.Lifecycle
    public final void addListener(LifecycleListener lifecycleListener) {
        lifecycleListener.onStart();
    }
}
