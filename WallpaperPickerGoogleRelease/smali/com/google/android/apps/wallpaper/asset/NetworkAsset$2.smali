.class public Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2;
.super Lcom/bumptech/glide/request/target/SimpleTarget;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->loadDrawableWithTransition(Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/request/target/SimpleTarget<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic val$context:Landroid/content/Context;

.field public final synthetic val$drawableLoadedListener:Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;

.field public final synthetic val$imageView:Landroid/widget/ImageView;

.field public final synthetic val$transitionDurationMillis:I


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/asset/NetworkAsset;Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2;->val$imageView:Landroid/widget/ImageView;

    iput p4, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2;->val$transitionDurationMillis:I

    iput-object p5, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2;->val$drawableLoadedListener:Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;

    invoke-direct {p0}, Lcom/bumptech/glide/request/target/SimpleTarget;-><init>()V

    return-void
.end method


# virtual methods
.method public onResourceReady(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 3

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2;->val$context:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    .line 3
    new-instance v0, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2;->val$imageView:Landroid/widget/ImageView;

    new-instance v2, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2$1;

    invoke-direct {v2, p0, p2}, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2$1;-><init>(Lcom/google/android/apps/wallpaper/asset/NetworkAsset$2;Landroid/content/res/Resources;)V

    invoke-direct {v0, p1, v1, v2}, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;-><init>(Landroid/graphics/Bitmap;Landroid/view/View;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    .line 4
    invoke-virtual {v0, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
