.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;,
        Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;,
        Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;
    }
.end annotation


# direct methods
.method public static access$300(Landroid/content/Context;I)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 2
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v1

    .line 3
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object p0

    const/4 v0, 0x0

    .line 4
    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->setPendingDailyWallpaperUpdateStatus(I)V

    .line 5
    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logDailyWallpaperSetNextWallpaperResult(I)V

    return-void
.end method

.method public static fetchAndSetNextWallpaper(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 2
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v7

    const/4 v1, 0x1

    .line 3
    invoke-interface {v7, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setPendingDailyWallpaperUpdateStatus(I)V

    .line 4
    check-cast v0, Lcom/android/wallpaper/module/GoogleWallpapersInjector;

    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/GoogleWallpapersInjector;->getServerFetcher(Landroid/content/Context;)Lcom/android/wallpaper/network/ServerFetcher;

    move-result-object v0

    .line 5
    new-instance v8, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v7}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$NextImageCallback;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;Lcom/android/wallpaper/module/WallpaperPreferences;)V

    check-cast v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;

    invoke-virtual {v0, p0, p1, p3, v8}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->fetchNextImageInCollection(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;)V

    return-void
.end method

.method public static updateWallpaper(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;)V
    .locals 9

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-eqz v0, :cond_1

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;

    move-object v3, v0

    move-object v4, p0

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    move-object v8, p4

    invoke-direct/range {v3 .. v8}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$BackdropRotationAsyncTask;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;)V

    new-array p0, v2, [Ljava/lang/Void;

    .line 3
    invoke-virtual {v0, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    .line 4
    :cond_1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;->fetchAndSetNextWallpaper(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;)V

    return-void
.end method
