.class public Lcom/android/wallpaper/asset/ResourceAssetLoader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/model/ModelLoader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/ResourceAssetLoader$ResourceAssetFetcher;,
        Lcom/android/wallpaper/asset/ResourceAssetLoader$ResourceAssetLoaderFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/ModelLoader<",
        "Lcom/android/wallpaper/asset/ResourceAsset;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public buildLoadData(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/wallpaper/asset/ResourceAsset;

    .line 2
    new-instance p0, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    invoke-virtual {p1}, Lcom/android/wallpaper/asset/ResourceAsset;->getKey()Lcom/bumptech/glide/load/Key;

    move-result-object p2

    new-instance p3, Lcom/android/wallpaper/asset/ResourceAssetLoader$ResourceAssetFetcher;

    invoke-direct {p3, p1}, Lcom/android/wallpaper/asset/ResourceAssetLoader$ResourceAssetFetcher;-><init>(Lcom/android/wallpaper/asset/ResourceAsset;)V

    invoke-direct {p0, p2, p3}, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;-><init>(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/data/DataFetcher;)V

    return-object p0
.end method

.method public bridge synthetic handles(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/android/wallpaper/asset/ResourceAsset;

    const/4 p0, 0x1

    return p0
.end method
