.class public abstract Lcom/android/wallpaper/asset/Asset;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/asset/Asset$CenterCropBitmapTask;,
        Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;,
        Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;,
        Lcom/android/wallpaper/asset/Asset$BitmapReceiver;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPlaceholderDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/wallpaper/asset/Asset;->getViewDimensions(Landroid/view/View;)Landroid/graphics/Point;

    move-result-object p1

    .line 2
    iget v0, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 3
    invoke-static {v0, p1, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 4
    invoke-virtual {p1, p2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 5
    new-instance p2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-direct {p2, p0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object p2
.end method

.method public static getViewDimensions(Landroid/view/View;)Landroid/graphics/Point;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 2
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    goto :goto_1

    .line 3
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result p0

    .line 4
    :goto_1
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1, v0, p0}, Landroid/graphics/Point;-><init>(II)V

    return-object v1
.end method


# virtual methods
.method public adjustCropRect(Landroid/content/Context;Landroid/graphics/Point;Landroid/graphics/Rect;)V
    .locals 0

    const/4 p0, 0x1

    .line 1
    invoke-static {p1, p3, p0}, Lcom/android/wallpaper/util/WallpaperCropUtils;->adjustCropRect(Landroid/content/Context;Landroid/graphics/Rect;Z)V

    return-void
.end method

.method public abstract decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
.end method

.method public abstract decodeBitmapRegion(Landroid/graphics/Rect;IIZLcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
.end method

.method public abstract decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V
.end method

.method public getLowResBitmap(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V
    .locals 8

    .line 1
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move v3, v0

    .line 2
    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v6, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    if-eqz v3, :cond_1

    .line 3
    invoke-virtual {p2, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 4
    :cond_1
    invoke-virtual {p2}, Landroid/widget/ImageView;->getWidth()I

    move-result p3

    if-lez p3, :cond_2

    .line 5
    invoke-virtual {p2}, Landroid/widget/ImageView;->getWidth()I

    move-result p3

    goto :goto_1

    .line 6
    :cond_2
    invoke-virtual {p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    iget p3, p3, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    .line 7
    :goto_1
    invoke-virtual {p2}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    if-lez v0, :cond_3

    .line 8
    invoke-virtual {p2}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    goto :goto_2

    .line 9
    :cond_3
    invoke-virtual {p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 10
    :goto_2
    new-instance v7, Lcom/android/wallpaper/asset/Asset$1;

    move-object v1, v7

    move-object v2, p0

    move-object v4, p2

    move-object v5, p1

    invoke-direct/range {v1 .. v6}, Lcom/android/wallpaper/asset/Asset$1;-><init>(Lcom/android/wallpaper/asset/Asset;ZLandroid/widget/ImageView;Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, p3, v0, v7}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void
.end method

.method public loadDrawableWithTransition(Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;I)V
    .locals 8

    .line 1
    invoke-static {p2}, Lcom/android/wallpaper/asset/Asset;->getViewDimensions(Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v0

    .line 2
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 3
    invoke-static {p1, p2, p5}, Lcom/android/wallpaper/asset/Asset;->getPlaceholderDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)Landroid/graphics/drawable/Drawable;

    move-result-object p5

    .line 4
    invoke-virtual {p2, p5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 5
    :cond_1
    iget p5, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    new-instance v7, Lcom/android/wallpaper/asset/Asset$2;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/android/wallpaper/asset/Asset$2;-><init>(Lcom/android/wallpaper/asset/Asset;Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;)V

    invoke-virtual {p0, p5, v0, v7}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    return-void
.end method

.method public loadLowResDrawable(Landroid/app/Activity;Landroid/widget/ImageView;ILcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;)V
    .locals 0

    return-void
.end method

.method public loadPreviewImage(Landroid/app/Activity;Landroid/widget/ImageView;I)V
    .locals 8

    .line 1
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move v6, v0

    .line 2
    new-instance v7, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v7, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    if-eqz v6, :cond_1

    .line 3
    invoke-virtual {p2, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 4
    :cond_1
    new-instance v0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;

    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-direct/range {v1 .. v7}, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/asset/Asset;Landroid/app/Activity;Landroid/widget/ImageView;IZLandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, p1, v0}, Lcom/android/wallpaper/asset/Asset;->decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    return-void
.end method
