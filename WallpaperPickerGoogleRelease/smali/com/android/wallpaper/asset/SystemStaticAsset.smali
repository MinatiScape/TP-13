.class public final Lcom/android/wallpaper/asset/SystemStaticAsset;
.super Lcom/android/wallpaper/asset/ResourceAsset;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/SystemStaticAsset$PackageResourceKey;
    }
.end annotation


# instance fields
.field public final mResName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/wallpaper/asset/ResourceAsset;-><init>(Landroid/content/res/Resources;I)V

    .line 2
    iput-object p3, p0, Lcom/android/wallpaper/asset/SystemStaticAsset;->mResName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getKey()Lcom/bumptech/glide/load/Key;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mKey:Lcom/bumptech/glide/load/Key;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/asset/SystemStaticAsset$PackageResourceKey;

    iget-object v1, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mRes:Landroid/content/res/Resources;

    iget v2, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mResId:I

    iget-object v3, p0, Lcom/android/wallpaper/asset/SystemStaticAsset;->mResName:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/wallpaper/asset/SystemStaticAsset$PackageResourceKey;-><init>(Landroid/content/res/Resources;ILjava/lang/String;)V

    iput-object v0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mKey:Lcom/bumptech/glide/load/Key;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/asset/ResourceAsset;->mKey:Lcom/bumptech/glide/load/Key;

    return-object p0
.end method

.method public loadLowResDrawable(Landroid/app/Activity;Landroid/widget/ImageView;ILcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/MultiTransformation;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/bumptech/glide/load/Transformation;

    new-instance v2, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;

    invoke-direct {v2}, Lcom/bumptech/glide/load/resource/bitmap/FitCenter;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p4, v1, v2

    invoke-direct {v0, v1}, Lcom/bumptech/glide/load/MultiTransformation;-><init>([Lcom/bumptech/glide/load/Transformation;)V

    .line 2
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;

    move-result-object p1

    .line 3
    invoke-virtual {p1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    .line 4
    iput-object p0, p1, Lcom/bumptech/glide/RequestBuilder;->model:Ljava/lang/Object;

    .line 5
    iput-boolean v2, p1, Lcom/bumptech/glide/RequestBuilder;->isModelSet:Z

    .line 6
    invoke-static {v0}, Lcom/bumptech/glide/request/RequestOptions;->bitmapTransform(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p0

    new-instance p4, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p4, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 7
    invoke-virtual {p0, p4}, Lcom/bumptech/glide/request/BaseRequestOptions;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p0

    .line 8
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 9
    invoke-virtual {p0, p2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method
