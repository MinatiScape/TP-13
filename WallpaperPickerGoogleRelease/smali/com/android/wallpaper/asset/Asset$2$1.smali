.class public Lcom/android/wallpaper/asset/Asset$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/asset/Asset$2;->onBitmapDecoded(Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$1:Lcom/android/wallpaper/asset/Asset$2;

.field public final synthetic val$resources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/Asset$2;Landroid/content/res/Resources;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/asset/Asset$2$1;->this$1:Lcom/android/wallpaper/asset/Asset$2;

    iput-object p2, p0, Lcom/android/wallpaper/asset/Asset$2$1;->val$resources:Landroid/content/res/Resources;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 5

    const/4 v0, 0x2

    new-array v0, v0, [Landroid/graphics/drawable/Drawable;

    .line 1
    iget-object v1, p0, Lcom/android/wallpaper/asset/Asset$2$1;->this$1:Lcom/android/wallpaper/asset/Asset$2;

    iget-object v1, v1, Lcom/android/wallpaper/asset/Asset$2;->val$imageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 2
    instance-of v2, v1, Landroid/graphics/drawable/TransitionDrawable;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_0

    .line 3
    check-cast v1, Landroid/graphics/drawable/TransitionDrawable;

    .line 4
    invoke-virtual {v1, v4}, Landroid/graphics/drawable/TransitionDrawable;->getId(I)I

    move-result v2

    .line 5
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/TransitionDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    aput-object v1, v0, v3

    goto :goto_0

    :cond_0
    aput-object v1, v0, v3

    .line 6
    :goto_0
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lcom/android/wallpaper/asset/Asset$2$1;->val$resources:Landroid/content/res/Resources;

    invoke-direct {v1, v2, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    aput-object v1, v0, v4

    .line 7
    new-instance p1, Landroid/graphics/drawable/TransitionDrawable;

    invoke-direct {p1, v0}, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 8
    invoke-virtual {p1, v4}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/asset/Asset$2$1;->this$1:Lcom/android/wallpaper/asset/Asset$2;

    iget-object v0, v0, Lcom/android/wallpaper/asset/Asset$2;->val$imageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 10
    iget-object v0, p0, Lcom/android/wallpaper/asset/Asset$2$1;->this$1:Lcom/android/wallpaper/asset/Asset$2;

    iget v0, v0, Lcom/android/wallpaper/asset/Asset$2;->val$transitionDurationMillis:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 11
    iget-object p0, p0, Lcom/android/wallpaper/asset/Asset$2$1;->this$1:Lcom/android/wallpaper/asset/Asset$2;

    iget-object p0, p0, Lcom/android/wallpaper/asset/Asset$2;->val$drawableLoadedListener:Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;

    if-eqz p0, :cond_1

    .line 12
    invoke-interface {p0}, Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;->onDrawableLoaded()V

    :cond_1
    return-void
.end method
