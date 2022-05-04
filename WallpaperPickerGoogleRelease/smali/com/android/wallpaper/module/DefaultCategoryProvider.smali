.class public Lcom/android/wallpaper/module/DefaultCategoryProvider;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CategoryProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;
    }
.end annotation


# static fields
.field public static sSystemCategories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/Category;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final mAppContext:Landroid/content/Context;

.field public mCategories:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/wallpaper/model/Category;",
            ">;"
        }
    .end annotation
.end field

.field public mFetchedCategories:Z

.field public mLocale:Ljava/util/Locale;

.field public mNetworkStatus:I

.field public mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mAppContext:Landroid/content/Context;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    .line 4
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getNetworkStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/NetworkStatusNotifier;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mNetworkStatus:I

    return-void
.end method


# virtual methods
.method public fetchCategories(Lcom/android/wallpaper/model/CategoryReceiver;Z)V
    .locals 5

    if-nez p2, :cond_1

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mFetchedCategories:Z

    if-eqz v0, :cond_1

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/wallpaper/model/Category;

    .line 3
    invoke-interface {p1, p2}, Lcom/android/wallpaper/model/CategoryReceiver;->onCategoryReceived(Lcom/android/wallpaper/model/Category;)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-interface {p1}, Lcom/android/wallpaper/model/CategoryReceiver;->doneFetchingCategories()V

    return-void

    :cond_1
    const/4 v0, 0x0

    if-eqz p2, :cond_2

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 6
    iput-boolean v0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mFetchedCategories:Z

    .line 7
    :cond_2
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    check-cast v1, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-virtual {v1}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->getNetworkStatus()I

    move-result v1

    iput v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mNetworkStatus:I

    .line 8
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->getLocale()Ljava/util/Locale;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mLocale:Ljava/util/Locale;

    .line 9
    check-cast p0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;

    const/4 v1, 0x1

    new-array v2, v1, [I

    aput v0, v2, v0

    .line 10
    new-instance v3, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;

    invoke-direct {v3, p0, p1, v2}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;-><init>(Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;Lcom/android/wallpaper/model/CategoryReceiver;[I)V

    .line 11
    new-instance p1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;

    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mAppContext:Landroid/content/Context;

    invoke-direct {p1, v3, v2, p2}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;-><init>(Lcom/android/wallpaper/model/CategoryReceiver;Landroid/content/Context;Z)V

    new-array p2, v0, [Ljava/lang/Void;

    invoke-virtual {p1, p2}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 12
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mAppContext:Landroid/content/Context;

    .line 13
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    .line 14
    invoke-interface {p1, p0}, Lcom/android/wallpaper/module/Injector;->getNetworkStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/NetworkStatusNotifier;

    move-result-object p2

    .line 15
    check-cast p2, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-virtual {p2}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->getNetworkStatus()I

    move-result p2

    if-nez p2, :cond_3

    .line 16
    invoke-virtual {v3}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$1;->doneFetchingCategories()V

    goto :goto_1

    .line 17
    :cond_3
    check-cast p1, Lcom/android/wallpaper/module/GoogleWallpapersInjector;

    invoke-interface {p1, p0}, Lcom/android/wallpaper/module/GoogleWallpapersInjector;->getServerFetcher(Landroid/content/Context;)Lcom/android/wallpaper/network/ServerFetcher;

    move-result-object p1

    .line 18
    new-instance p2, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;

    const/16 v0, 0xc9

    invoke-direct {p2, v0, v3, p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropCategory$1;-><init>(ILcom/android/wallpaper/model/CategoryReceiver;Landroid/content/Context;)V

    check-cast p1, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    new-instance v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;

    invoke-direct {v0}, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;-><init>()V

    .line 20
    new-instance v2, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$1;

    invoke-direct {v2, p1, p2}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher$1;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;Lcom/android/wallpaper/network/ServerFetcher$ResultsCallback;)V

    .line 21
    invoke-static {}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsRequest;->newBuilder()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsRequest$Builder;

    move-result-object p2

    .line 22
    invoke-virtual {p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->getLanguage()Ljava/lang/String;

    move-result-object v3

    .line 23
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 24
    iget-object v4, p2, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v4, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsRequest;

    invoke-static {v4, v3}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsRequest;->access$4400(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsRequest;Ljava/lang/String;)V

    .line 25
    invoke-virtual {p1, p0}, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->getFilteringLabelList(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    .line 26
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 27
    iget-object v3, p2, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v3, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsRequest;

    invoke-static {v3, p0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsRequest;->access$5200(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsRequest;Ljava/lang/Iterable;)V

    const-string p0, "https://clients3.google.com/cast/chromecast/home/wallpaper/collections?rt=b"

    .line 28
    iput-object p0, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->url:Ljava/lang/String;

    .line 29
    iput v1, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->requestMethod:I

    .line 30
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsRequest;

    .line 31
    iput-object p0, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->requestBody:Lcom/google/protobuf/MessageLite;

    .line 32
    iput-object v2, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->callback:Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;

    .line 33
    invoke-static {}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetCollectionsResponse;->parser()Lcom/google/protobuf/Parser;

    move-result-object p0

    .line 34
    iput-object p0, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->responseParser:Lcom/google/protobuf/Parser;

    .line 35
    iget-object p0, v0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->headers:Ljava/util/HashMap;

    const-string p2, "Accept"

    const-string v1, "application/x-protobuf"

    .line 36
    invoke-interface {p0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    iget-object p0, p1, Lcom/google/android/apps/wallpaper/backdrop/BackdropFetcher;->mRequester:Lcom/google/android/gms/common/internal/zzam;

    .line 38
    new-instance p1, Lcom/google/android/apps/common/volley/request/ProtoRequest;

    invoke-direct {p1, v0}, Lcom/google/android/apps/common/volley/request/ProtoRequest;-><init>(Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;)V

    .line 39
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/zzam;->addToRequestQueue(Lcom/android/volley/Request;)V

    :goto_1
    return-void
.end method

.method public getCategory(I)Lcom/android/wallpaper/model/Category;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mFetchedCategories:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/model/Category;

    return-object p0

    .line 3
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Categories are not available"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getCategory(Ljava/lang/String;)Lcom/android/wallpaper/model/Category;
    .locals 3

    const/4 v0, 0x0

    .line 4
    :goto_0
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/model/Category;

    .line 6
    iget-object v2, v1, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 7
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getLocale()Ljava/util/Locale;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mAppContext:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object p0

    return-object p0
.end method

.method public resetIfNeeded()Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mNetworkStatus:I

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    check-cast v1, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-virtual {v1}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->getNetworkStatus()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mLocale:Ljava/util/Locale;

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->getLocale()Ljava/util/Locale;

    move-result-object v1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    return v2

    .line 3
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    iput-boolean v2, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mFetchedCategories:Z

    const/4 p0, 0x1

    return p0
.end method
