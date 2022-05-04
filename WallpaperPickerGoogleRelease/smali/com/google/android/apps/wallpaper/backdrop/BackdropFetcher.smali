.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/network/ServerFetcher;


# instance fields
.field public final mLabelProvider:Lcom/google/android/apps/wallpaper/module/FilteringLabelProvider;

.field public final mRequester:Lcom/google/android/gms/common/internal/zzam;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/zzam;Lcom/google/android/apps/wallpaper/module/FilteringLabelProvider;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->mRequester:Lcom/google/android/gms/common/internal/zzam;

    .line 3
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->mLabelProvider:Lcom/google/android/apps/wallpaper/module/FilteringLabelProvider;

    return-void
.end method


# virtual methods
.method public fetchImagesInCollection(Landroid/content/Context;Ljava/lang/String;Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;

    invoke-direct {v0}, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;-><init>()V

    .line 2
    new-instance v1, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$2;

    invoke-direct {v1, p0, p3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$2;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;)V

    .line 3
    invoke-static {}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;->newBuilder()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest$Builder;

    move-result-object p3

    .line 4
    invoke-virtual {p3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 5
    iget-object v2, p3, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;

    invoke-static {v2, p2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;->access$6800(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;Ljava/lang/String;)V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->getLanguage()Ljava/lang/String;

    move-result-object p2

    .line 7
    invoke-virtual {p3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 8
    iget-object v2, p3, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;

    invoke-static {v2, p2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;->access$7100(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;Ljava/lang/String;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->getFilteringLabelList(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    .line 10
    invoke-virtual {p3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 11
    iget-object p2, p3, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;

    invoke-static {p2, p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;->access$7900(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;Ljava/lang/Iterable;)V

    const-string p1, "https://clients3.google.com/cast/chromecast/home/wallpaper/collection-images?rt=b"

    .line 12
    iput-object p1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->url:Ljava/lang/String;

    const/4 p1, 0x1

    .line 13
    iput p1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->requestMethod:I

    .line 14
    invoke-virtual {p3}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionRequest;

    .line 15
    iput-object p1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->requestBody:Lcom/google/protobuf/MessageLite;

    .line 16
    iput-object v1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->callback:Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;

    .line 17
    invoke-static {}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->parser()Lcom/google/protobuf/Parser;

    move-result-object p1

    .line 18
    iput-object p1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->responseParser:Lcom/google/protobuf/Parser;

    .line 19
    iget-object p1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->headers:Ljava/util/HashMap;

    const-string p2, "Accept"

    const-string p3, "application/x-protobuf"

    .line 20
    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->mRequester:Lcom/google/android/gms/common/internal/zzam;

    .line 22
    new-instance p1, Lcom/google/android/apps/common/volley/request/ProtoRequest;

    invoke-direct {p1, v0}, Lcom/google/android/apps/common/volley/request/ProtoRequest;-><init>(Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;)V

    .line 23
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/zzam;->addToRequestQueue(Lcom/android/volley/Request;)V

    return-void
.end method

.method public fetchNextImageInCollection(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;

    invoke-direct {v0}, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;-><init>()V

    .line 2
    new-instance v1, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$3;

    invoke-direct {v1, p0, p4}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$3;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;Lcom/android/wallpaper/network/ServerFetcher$NextImageInCollectionCallback;)V

    .line 3
    invoke-static {}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->newBuilder()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest$Builder;

    move-result-object p4

    .line 4
    invoke-virtual {p4}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 5
    iget-object v2, p4, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    invoke-static {v2, p2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->access$9600(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;Ljava/lang/String;)V

    if-eqz p3, :cond_0

    .line 6
    invoke-virtual {p4}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 7
    iget-object p2, p4, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    invoke-static {p2, p3}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->access$10000(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;Ljava/lang/String;)V

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->getLanguage()Ljava/lang/String;

    move-result-object p2

    .line 9
    invoke-virtual {p4}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 10
    iget-object p3, p4, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p3, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    invoke-static {p3, p2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->access$10300(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;Ljava/lang/String;)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->getFilteringLabelList(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    .line 12
    invoke-virtual {p4}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 13
    iget-object p2, p4, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    invoke-static {p2, p1}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->access$11100(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;Ljava/lang/Iterable;)V

    const-string p1, "https://clients3.google.com/cast/chromecast/home/wallpaper/image?rt=b"

    .line 14
    iput-object p1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->url:Ljava/lang/String;

    const/4 p1, 0x1

    .line 15
    iput p1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->requestMethod:I

    .line 16
    invoke-virtual {p4}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    .line 17
    iput-object p1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->requestBody:Lcom/google/protobuf/MessageLite;

    .line 18
    iput-object v1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->callback:Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;

    .line 19
    invoke-static {}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionResponse;->parser()Lcom/google/protobuf/Parser;

    move-result-object p1

    .line 20
    iput-object p1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->responseParser:Lcom/google/protobuf/Parser;

    .line 21
    iget-object p1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->headers:Ljava/util/HashMap;

    const-string p2, "Accept"

    const-string p3, "application/x-protobuf"

    .line 22
    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    new-instance p1, Lcom/google/android/apps/common/volley/request/ProtoRequest;

    invoke-direct {p1, v0}, Lcom/google/android/apps/common/volley/request/ProtoRequest;-><init>(Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;)V

    .line 24
    new-instance p2, Lcom/android/volley/DefaultRetryPolicy;

    const/16 p3, 0x9c4

    const/4 p4, 0x3

    const/high16 v0, 0x40000000    # 2.0f

    invoke-direct {p2, p3, p4, v0}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    .line 25
    iput-object p2, p1, Lcom/android/volley/Request;->mRetryPolicy:Lcom/android/volley/DefaultRetryPolicy;

    .line 26
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->mRequester:Lcom/google/android/gms/common/internal/zzam;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/zzam;->addToRequestQueue(Lcom/android/volley/Request;)V

    return-void
.end method

.method public final getFilteringLabelList(Landroid/content/Context;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "update1"

    .line 2
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v1, "com.google.android.feature.PIXEL_EXPERIENCE"

    .line 4
    invoke-virtual {p1, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "nexus"

    .line 5
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    const-string v1, "com.google.android.feature.PIXEL_2017_EXPERIENCE"

    .line 6
    invoke-virtual {p1, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "pixel_2017"

    .line 7
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    :cond_1
    sget-object p1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    sget-object p1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "android-sdk-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->mLabelProvider:Lcom/google/android/apps/wallpaper/module/FilteringLabelProvider;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/DeviceConfigFilteringLabelProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    const-string p0, "wallpaper_content"

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/String;

    .line 14
    invoke-static {p0, p1}, Landroid/provider/DeviceConfig;->getProperties(Ljava/lang/String;[Ljava/lang/String;)Landroid/provider/DeviceConfig$Properties;

    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/provider/DeviceConfig$Properties;->getKeyset()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v1, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;-><init>(Landroid/provider/DeviceConfig$Properties;)V

    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    .line 16
    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "DeviceConfigFiltering"

    const-string v1, "Couldn\'t access DeviceConfig properties"

    .line 17
    invoke-static {p1, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x1

    const-string p1, "notargeting"

    .line 18
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    .line 19
    invoke-static {p0}, Lcom/google/common/collect/Sets;->newHashSetWithExpectedSize(I)Ljava/util/HashSet;

    move-result-object p0

    .line 20
    invoke-static {p0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 21
    :goto_0
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public final getLanguage()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 2
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "-"

    .line 4
    invoke-static {p0, v1, v0}, Landroidx/concurrent/futures/AbstractResolvableFuture$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method
