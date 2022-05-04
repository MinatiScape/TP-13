.class public Lcom/android/wallpaper/asset/ResourceAssetLoader$ResourceAssetFetcher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/data/DataFetcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/ResourceAssetLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResourceAssetFetcher"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/data/DataFetcher<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field public mResourceAsset:Lcom/android/wallpaper/asset/ResourceAsset;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/ResourceAsset;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/asset/ResourceAssetLoader$ResourceAssetFetcher;->mResourceAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    return-void
.end method

.method public cleanup()V
    .locals 0

    return-void
.end method

.method public getDataClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Ljava/io/InputStream;

    return-object p0
.end method

.method public getDataSource()Lcom/bumptech/glide/load/DataSource;
    .locals 0

    .line 1
    sget-object p0, Lcom/bumptech/glide/load/DataSource;->LOCAL:Lcom/bumptech/glide/load/DataSource;

    return-object p0
.end method

.method public loadData(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/Priority;",
            "Lcom/bumptech/glide/load/data/DataFetcher$DataCallback<",
            "-",
            "Ljava/io/InputStream;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/asset/ResourceAssetLoader$ResourceAssetFetcher;->mResourceAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mRes:Landroid/content/res/Resources;

    .line 3
    iget p0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mResId:I

    .line 4
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p0

    .line 5
    invoke-interface {p2, p0}, Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;->onDataReady(Ljava/lang/Object;)V

    return-void
.end method
