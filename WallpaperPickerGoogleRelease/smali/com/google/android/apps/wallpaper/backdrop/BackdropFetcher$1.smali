.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback<",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsResponse;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic val$collectionsCallback:Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$1;->val$collectionsCallback:Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$1;->val$collectionsCallback:Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;->onError(Lcom/android/volley/VolleyError;)V

    return-void
.end method

.method public onResponse(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsResponse;

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$1;->val$collectionsCallback:Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;

    invoke-virtual {p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsResponse;->getCollectionsList()Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;->onSuccess(Ljava/util/List;)V

    return-void
.end method
