package com.google.android.apps.wallpaper.picker;

import android.app.Application;
import android.content.Context;
import androidx.lifecycle.runtime.R$id;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.module.UserEventLogger;
import com.android.wallpaper.module.WallpaperPreferences;
import com.android.wallpaper.module.WallpapersInjector;
import java.lang.Thread;
import java.util.Objects;
/* loaded from: classes.dex */
public class WallpapersApplication extends Application {
    public static final /* synthetic */ int $r8$clinit = 0;
    public Thread.UncaughtExceptionHandler mWrappedHandler;

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        final WallpapersInjector wallpapersInjector = new WallpapersInjector();
        InjectorProvider.sInjector = wallpapersInjector;
        Objects.requireNonNull(wallpapersInjector.getFormFactorChecker(this));
        final Context applicationContext = getApplicationContext();
        this.mWrappedHandler = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: com.google.android.apps.wallpaper.picker.WallpapersApplication$$ExternalSyntheticLambda0
            /* JADX WARN: Type inference failed for: r1v1, types: [int, boolean] */
            @Override // java.lang.Thread.UncaughtExceptionHandler
            public final void uncaughtException(Thread thread, Throwable th) {
                WallpapersApplication wallpapersApplication = WallpapersApplication.this;
                Injector injector = wallpapersInjector;
                Context context = applicationContext;
                int i = WallpapersApplication.$r8$clinit;
                Objects.requireNonNull(wallpapersApplication);
                UserEventLogger userEventLogger = injector.getUserEventLogger(context);
                WallpaperPreferences preferences = injector.getPreferences(context);
                ?? isOOM = R$id.isOOM(th);
                if (preferences.getPendingWallpaperSetStatus() == 1) {
                    userEventLogger.logWallpaperSetResult(1);
                    userEventLogger.logWallpaperSetFailureReason(isOOM);
                    preferences.setPendingWallpaperSetStatusSync(0);
                }
                if (preferences.getPendingDailyWallpaperUpdateStatus() == 1) {
                    userEventLogger.logDailyWallpaperSetNextWallpaperResult(4);
                    userEventLogger.logDailyWallpaperSetNextWallpaperCrash(isOOM == true ? 1 : 0);
                    preferences.setPendingDailyWallpaperUpdateStatusSync(0);
                }
                wallpapersApplication.mWrappedHandler.uncaughtException(thread, th);
            }
        });
    }
}
