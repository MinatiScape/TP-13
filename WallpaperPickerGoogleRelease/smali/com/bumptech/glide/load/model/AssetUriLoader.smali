.class public Lcom/bumptech/glide/load/model/AssetUriLoader;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/model/ModelLoader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/model/AssetUriLoader$FileDescriptorFactory;,
        Lcom/bumptech/glide/load/model/AssetUriLoader$StreamFactory;,
        Lcom/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/ModelLoader<",
        "Landroid/net/Uri;",
        "TData;>;"
    }
.end annotation


# instance fields
.field public final assetManager:Landroid/content/res/AssetManager;

.field public final factory:Lcom/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory<",
            "TData;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/res/AssetManager;Lcom/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "assetManager",
            "factory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/AssetManager;",
            "Lcom/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory<",
            "TData;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/bumptech/glide/load/model/AssetUriLoader;->assetManager:Landroid/content/res/AssetManager;

    .line 3
    iput-object p2, p0, Lcom/bumptech/glide/load/model/AssetUriLoader;->factory:Lcom/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory;

    return-void
.end method


# virtual methods
.method public buildLoadData(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "model",
            "width",
            "height",
            "options"
        }
    .end annotation

    .line 1
    check-cast p1, Landroid/net/Uri;

    .line 2
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    const/16 p3, 0x16

    invoke-virtual {p2, p3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 3
    new-instance p3, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    new-instance p4, Lcom/bumptech/glide/signature/ObjectKey;

    invoke-direct {p4, p1}, Lcom/bumptech/glide/signature/ObjectKey;-><init>(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/bumptech/glide/load/model/AssetUriLoader;->factory:Lcom/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory;

    iget-object p0, p0, Lcom/bumptech/glide/load/model/AssetUriLoader;->assetManager:Landroid/content/res/AssetManager;

    invoke-interface {p1, p0, p2}, Lcom/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory;->buildFetcher(Landroid/content/res/AssetManager;Ljava/lang/String;)Lcom/bumptech/glide/load/data/DataFetcher;

    move-result-object p0

    invoke-direct {p3, p4, p0}, Lcom/bumptech/glide/load/model/ModelLoader$LoadData;-><init>(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/data/DataFetcher;)V

    return-object p3
.end method

.method public handles(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "model"
        }
    .end annotation

    .line 1
    check-cast p1, Landroid/net/Uri;

    .line 2
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    const-string v0, "file"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    const-string p1, "android_asset"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method
