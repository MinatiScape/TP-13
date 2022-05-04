.class public abstract Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sInstance:Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;
    .locals 2

    const-class v0, Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;

    monitor-enter v0

    .line 1
    :try_start_0
    sget-object v1, Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;

    if-nez v1, :cond_0

    .line 2
    new-instance v1, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$Factory;

    invoke-direct {v1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationInitializer$Factory;-><init>()V

    sput-object v1, Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;

    .line 3
    :cond_0
    sget-object v1, Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;->sInstance:Lcom/google/android/apps/wallpaper/backdrop/WallpaperRotationInitializerFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
