.class public Lcom/android/wallpaper/asset/Asset$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/asset/Asset;->loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic val$context:Landroid/content/Context;

.field public final synthetic val$imageView:Landroid/widget/ImageView;

.field public final synthetic val$needsTransition:Z

.field public final synthetic val$placeholderDrawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/Asset;ZLandroid/widget/ImageView;Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/android/wallpaper/asset/Asset$1;->val$needsTransition:Z

    iput-object p3, p0, Lcom/android/wallpaper/asset/Asset$1;->val$imageView:Landroid/widget/ImageView;

    iput-object p4, p0, Lcom/android/wallpaper/asset/Asset$1;->val$context:Landroid/content/Context;

    iput-object p5, p0, Lcom/android/wallpaper/asset/Asset$1;->val$placeholderDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/asset/Asset$1;->val$needsTransition:Z

    if-nez v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/Asset$1;->val$imageView:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/asset/Asset$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    .line 4
    iget-object v3, p0, Lcom/android/wallpaper/asset/Asset$1;->val$placeholderDrawable:Landroid/graphics/drawable/Drawable;

    aput-object v3, v1, v2

    .line 5
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2, v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    const/4 p1, 0x1

    aput-object v2, v1, p1

    .line 6
    new-instance v2, Landroid/graphics/drawable/TransitionDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 7
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 8
    iget-object p0, p0, Lcom/android/wallpaper/asset/Asset$1;->val$imageView:Landroid/widget/ImageView;

    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/high16 p0, 0x10e0000

    .line 9
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p0

    invoke-virtual {v2, p0}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    return-void
.end method
