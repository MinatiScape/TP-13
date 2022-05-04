.class public interface abstract Lcom/android/wallpaper/module/GoogleWallpapersInjector;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/module/CustomizationInjector;


# virtual methods
.method public abstract getGooglePreferences(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;
.end method

.method public abstract getServerFetcher(Landroid/content/Context;)Lcom/android/wallpaper/network/ServerFetcher;
.end method
