.class public Lcom/android/wallpaper/asset/Asset$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/asset/Asset;->loadDrawableWithTransition(Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic val$context:Landroid/content/Context;

.field public final synthetic val$drawableLoadedListener:Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;

.field public final synthetic val$imageView:Landroid/widget/ImageView;

.field public final synthetic val$transitionDurationMillis:I


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/Asset;Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/wallpaper/asset/Asset$2;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/wallpaper/asset/Asset$2;->val$imageView:Landroid/widget/ImageView;

    iput p4, p0, Lcom/android/wallpaper/asset/Asset$2;->val$transitionDurationMillis:I

    iput-object p5, p0, Lcom/android/wallpaper/asset/Asset$2;->val$drawableLoadedListener:Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/asset/Asset$2;->val$context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 2
    new-instance v1, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;

    iget-object v2, p0, Lcom/android/wallpaper/asset/Asset$2;->val$imageView:Landroid/widget/ImageView;

    new-instance v3, Lcom/android/wallpaper/asset/Asset$2$1;

    invoke-direct {v3, p0, v0}, Lcom/android/wallpaper/asset/Asset$2$1;-><init>(Lcom/android/wallpaper/asset/Asset$2;Landroid/content/res/Resources;)V

    invoke-direct {v1, p1, v2, v3}, Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;-><init>(Landroid/graphics/Bitmap;Landroid/view/View;Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    .line 3
    invoke-virtual {v1, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
