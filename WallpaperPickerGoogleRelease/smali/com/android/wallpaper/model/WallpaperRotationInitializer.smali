.class public interface abstract Lcom/android/wallpaper/model/WallpaperRotationInitializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;
    }
.end annotation


# virtual methods
.method public abstract setFirstWallpaperInRotation(Landroid/content/Context;ILcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;)V
.end method

.method public abstract startRotation(Landroid/content/Context;)Z
.end method
