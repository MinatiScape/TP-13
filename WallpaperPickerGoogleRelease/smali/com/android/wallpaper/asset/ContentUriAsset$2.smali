.class public Lcom/android/wallpaper/asset/ContentUriAsset$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/request/RequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/asset/ContentUriAsset;->loadDrawableWithTransition(Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/RequestListener<",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic val$drawableLoadedListener:Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/ContentUriAsset;Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/wallpaper/asset/ContentUriAsset$2;->val$drawableLoadedListener:Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/GlideException;",
            "Ljava/lang/Object;",
            "Lcom/bumptech/glide/request/target/Target<",
            "Landroid/graphics/drawable/Drawable;",
            ">;Z)Z"
        }
    .end annotation

    const/4 p0, 0x0

    return p0
.end method

.method public onResourceReady(Ljava/lang/Object;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/load/DataSource;Z)Z
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/drawable/Drawable;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/ContentUriAsset$2;->val$drawableLoadedListener:Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;

    if-eqz p0, :cond_0

    .line 3
    invoke-interface {p0}, Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;->onDrawableLoaded()V

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
