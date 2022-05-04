.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->fetchImagesInCollection(Landroid/content/Context;Ljava/lang/String;Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback<",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic val$imagesCallback:Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$2;->val$imagesCallback:Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$2;->val$imagesCallback:Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;->onError(Lcom/android/volley/VolleyError;)V

    return-void
.end method

.method public onResponse(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$2;->val$imagesCallback:Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;

    invoke-virtual {p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->getImagesList()Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;->onSuccess(Ljava/util/List;)V

    return-void
.end method
