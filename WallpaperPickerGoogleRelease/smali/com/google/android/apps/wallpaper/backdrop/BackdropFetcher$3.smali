.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->fetchNextImageInCollection(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback<",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionResponse;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic val$callback:Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$3;->val$callback:Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$3;->val$callback:Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;->onError(Lcom/android/volley/VolleyError;)V

    return-void
.end method

.method public onResponse(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionResponse;

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$3;->val$callback:Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;

    invoke-virtual {p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionResponse;->getImage()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionResponse;->getResumeToken()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;->onSuccess(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;Ljava/lang/String;)V

    return-void
.end method
