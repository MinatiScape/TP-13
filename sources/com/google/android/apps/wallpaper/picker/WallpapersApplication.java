package com.google.android.apps.wallpaper.picker;

import android.app.Application;
import android.content.Context;
import androidx.cardview.R$style;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.WallpapersInjector;
import com.google.android.apps.wallpaper.module.CompositeUserEventLogger;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import java.lang.Thread;
/* loaded from: classes.dex */
public class WallpapersApplication extends Application {
    public static final /* synthetic */ int $r8$clinit = 0;
    public Thread.UncaughtExceptionHandler mWrappedHandler;

    @Override // android.app.Application
    public final void onCreate() {
        super.onCreate();
        final WallpapersInjector wallpapersInjector = new WallpapersInjector();
        R$style.sInjector = wallpapersInjector;
        final Context applicationContext = getApplicationContext();
        this.mWrappedHandler = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: com.google.android.apps.wallpaper.picker.WallpapersApplication$$ExternalSyntheticLambda0
            @Override // java.lang.Thread.UncaughtExceptionHandler
            public final void uncaughtException(Thread thread, Throwable th) {
                int i;
                WallpapersApplication wallpapersApplication = WallpapersApplication.this;
                Injector injector = wallpapersInjector;
                Context context = applicationContext;
                int i2 = WallpapersApplication.$r8$clinit;
                wallpapersApplication.getClass();
                CompositeUserEventLogger userEventLogger = injector.getUserEventLogger(context);
                GoogleWallpaperPreferences preferences = injector.getPreferences(context);
                Throwable th2 = th;
                while (true) {
                    if (th2 == null) {
                        i = 0;
                        break;
                    } else if (th2 instanceof OutOfMemoryError) {
                        i = 1;
                        break;
                    } else {
                        th2 = th2.getCause();
                    }
                }
                if (preferences.getPendingWallpaperSetStatus() == 1) {
                    userEventLogger.logWallpaperSetResult(1);
                    userEventLogger.logWallpaperSetFailureReason(i);
                    preferences.setPendingWallpaperSetStatusSync();
                }
                if (preferences.getPendingDailyWallpaperUpdateStatus() == 1) {
                    userEventLogger.logDailyWallpaperSetNextWallpaperResult(4);
                    userEventLogger.logDailyWallpaperSetNextWallpaperCrash(i);
                    preferences.setPendingDailyWallpaperUpdateStatusSync();
                }
                wallpapersApplication.mWrappedHandler.uncaughtException(thread, th);
            }
        });
    }
}
