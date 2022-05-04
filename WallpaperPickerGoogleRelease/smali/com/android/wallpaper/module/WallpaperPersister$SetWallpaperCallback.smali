.class public interface abstract Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;
.super Ljava/lang/Object;
.source "WallpaperPersister.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/module/WallpaperPersister;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SetWallpaperCallback"
.end annotation


# virtual methods
.method public abstract onError(Ljava/lang/Throwable;)V
.end method

.method public abstract onSuccess(Lcom/android/wallpaper/model/WallpaperInfo;)V
.end method
