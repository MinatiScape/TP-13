.class public final synthetic Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 4

    iget v0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void

    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;

    sget-object v0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->sExecutor:Ljava/util/concurrent/Executor;

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    if-nez p1, :cond_1

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/PreviewFragment;->showLoadWallpaperErrorDialog()V

    goto/16 :goto_2

    .line 3
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundColor(I)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    if-eqz v0, :cond_4

    .line 5
    new-instance v2, Lcom/davemorrissey/labs/subscaleview/ImageSource;

    invoke-direct {v2, p1, v1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;-><init>(Landroid/graphics/Bitmap;Z)V

    .line 6
    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V

    .line 7
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 8
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperAsset:Lcom/android/wallpaper/asset/Asset;

    instance-of p1, p1, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getMeasuredWidth()I

    move-result v0

    .line 10
    iget-object v2, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getMeasuredHeight()I

    move-result v2

    .line 11
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3, v0, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 12
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mRawWallpaperSize:Landroid/graphics/Point;

    .line 13
    invoke-static {v0, v3}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateVisibleRect(Landroid/graphics/Point;Landroid/graphics/Point;)Landroid/graphics/Rect;

    move-result-object v0

    if-eqz p1, :cond_3

    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/wallpaper/util/WallpaperCropUtils;->isRtl(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 15
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mRawWallpaperSize:Landroid/graphics/Point;

    iget p1, p1, Landroid/graphics/Point;->x:I

    .line 16
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    sub-int/2addr p1, v1

    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 17
    invoke-virtual {v0, p1, v1}, Landroid/graphics/Rect;->offsetTo(II)V

    goto :goto_1

    .line 18
    :cond_2
    iget p1, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0, v1, p1}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 19
    :cond_3
    :goto_1
    new-instance p1, Landroid/graphics/PointF;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    int-to-float v1, v1

    .line 20
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {p1, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 21
    new-instance v1, Landroid/graphics/Point;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    .line 22
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-direct {v1, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 23
    invoke-static {v1, v3}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateMinZoom(Landroid/graphics/Point;Landroid/graphics/Point;)F

    move-result v0

    .line 24
    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 25
    iput v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    .line 26
    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 27
    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    const/4 v2, 0x0

    .line 28
    iput-object v2, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 29
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 30
    iput-object p1, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 31
    iput-object p1, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    .line 32
    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    .line 33
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v0, Lcom/android/wallpaper/picker/ImagePreviewFragment$3;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/ImagePreviewFragment$3;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V

    .line 34
    iput-object v0, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onStateChangedListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnStateChangedListener;

    .line 35
    new-instance v0, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_4
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
