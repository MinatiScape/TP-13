.class public interface abstract Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/network/ServerFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "NextImageInCollectionCallback"
.end annotation


# virtual methods
.method public abstract onError(Lcom/android/volley/VolleyError;)V
.end method

.method public abstract onSuccess(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;Ljava/lang/String;)V
.end method
