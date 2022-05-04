.class public Lcom/android/wallpaper/module/InjectorProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sInjector:Lcom/android/wallpaper/module/Injector;


# direct methods
.method public static declared-synchronized getInjector()Lcom/android/wallpaper/module/Injector;
    .locals 2

    const-class v0, Lcom/android/wallpaper/module/InjectorProvider;

    monitor-enter v0

    .line 1
    :try_start_0
    sget-object v1, Lcom/android/wallpaper/module/InjectorProvider;->sInjector:Lcom/android/wallpaper/module/Injector;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
