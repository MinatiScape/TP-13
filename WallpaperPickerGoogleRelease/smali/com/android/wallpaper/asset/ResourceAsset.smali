.class public Lcom/android/wallpaper/asset/ResourceAsset;
.super Lcom/android/wallpaper/asset/StreamableAsset;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;
    }
.end annotation


# instance fields
.field public mKey:Lcom/bumptech/glide/load/Key;

.field public final mRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

.field public final mRes:Landroid/content/res/Resources;

.field public final mResId:I


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/bumptech/glide/request/RequestOptions;->centerCropTransform()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 2
    invoke-direct {p0}, Lcom/android/wallpaper/asset/StreamableAsset;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mRes:Landroid/content/res/Resources;

    .line 4
    iput p2, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mResId:I

    .line 5
    iput-object v0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/wallpaper/asset/ResourceAsset;

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/android/wallpaper/asset/ResourceAsset;

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ResourceAsset;->getKey()Lcom/bumptech/glide/load/Key;

    move-result-object p0

    invoke-virtual {p1}, Lcom/android/wallpaper/asset/ResourceAsset;->getKey()Lcom/bumptech/glide/load/Key;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/bumptech/glide/load/Key;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public getKey()Lcom/bumptech/glide/load/Key;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mKey:Lcom/bumptech/glide/load/Key;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;

    iget-object v1, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mRes:Landroid/content/res/Resources;

    iget v2, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mResId:I

    invoke-direct {v0, v1, v2}, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;-><init>(Landroid/content/res/Resources;I)V

    iput-object v0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mKey:Lcom/bumptech/glide/load/Key;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mKey:Lcom/bumptech/glide/load/Key;

    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ResourceAsset;->getKey()Lcom/bumptech/glide/load/Key;

    move-result-object p0

    invoke-interface {p0}, Lcom/bumptech/glide/load/Key;->hashCode()I

    move-result p0

    return p0
.end method

.method public loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    .line 3
    iput-object p0, p1, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p1, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 6
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 8
    invoke-static {}, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;->withCrossFade()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestBuilder;->transition(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;

    .line 9
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public openInputStream()Ljava/io/InputStream;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mRes:Landroid/content/res/Resources;

    iget p0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mResId:I

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method
