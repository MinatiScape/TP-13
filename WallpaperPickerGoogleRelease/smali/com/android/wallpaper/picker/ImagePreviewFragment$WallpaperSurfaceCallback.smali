.class public Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/ImagePreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "WallpaperSurfaceCallback"
.end annotation


# instance fields
.field public mHost:Landroid/view/SurfaceControlViewHost;

.field public mLastSurface:Landroid/view/Surface;

.field public final synthetic this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;Lcom/android/wallpaper/picker/ImagePreviewFragment$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->mLastSurface:Landroid/view/Surface;

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    if-eq v0, v1, :cond_6

    .line 2
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->mLastSurface:Landroid/view/Surface;

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 4
    iget-object p1, p1, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 5
    invoke-virtual {p1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 6
    iput-object v1, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    .line 7
    iput-object v1, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    .line 8
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d0069

    invoke-virtual {v2, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 10
    iget-object v3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    const v4, 0x7f0a0104

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 11
    iput-object v4, v3, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 12
    iget-object v3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    const v4, 0x7f0a0140

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 13
    iput-object v4, v3, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLowResImageView:Landroid/widget/ImageView;

    .line 14
    iget-object v3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 15
    iget-object v4, v3, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperAsset:Lcom/android/wallpaper/asset/Asset;

    .line 16
    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    new-instance v5, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback$$ExternalSyntheticLambda0;

    invoke-direct {v5, p0}, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;)V

    invoke-virtual {v4, v3, v5}, Lcom/android/wallpaper/asset/Asset;->decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    .line 17
    invoke-static {p1}, Lcom/android/systemui/shared/system/WallpaperManagerCompat;->getWallpaperZoomOutMaxScale(Landroid/content/Context;)F

    move-result v3

    .line 18
    iget-object v4, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 19
    iget-object v4, v4, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 20
    invoke-virtual {v4}, Landroid/view/SurfaceView;->getWidth()I

    move-result v4

    .line 21
    iget-object v5, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 22
    iget-object v5, v5, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 23
    invoke-virtual {v5}, Landroid/view/SurfaceView;->getHeight()I

    move-result v5

    .line 24
    iget-object v6, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 25
    iget-object v7, v6, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mScreenSize:Landroid/graphics/Point;

    .line 26
    iget-object v6, v6, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperScreenSize:Landroid/graphics/Point;

    .line 27
    invoke-virtual {v7, v6}, Landroid/graphics/Point;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    int-to-float v4, v4

    .line 28
    iget-object v6, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 29
    iget-object v7, v6, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mScreenSize:Landroid/graphics/Point;

    .line 30
    iget v7, v7, Landroid/graphics/Point;->x:I

    int-to-float v7, v7

    div-float/2addr v4, v7

    .line 31
    iget-object v6, v6, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperScreenSize:Landroid/graphics/Point;

    .line 32
    iget v6, v6, Landroid/graphics/Point;->x:I

    int-to-float v6, v6

    mul-float/2addr v6, v4

    float-to-int v4, v6

    :cond_1
    int-to-float v6, v4

    mul-float/2addr v6, v3

    float-to-int v6, v6

    int-to-float v7, v5

    mul-float/2addr v7, v3

    float-to-int v3, v7

    sub-int/2addr v4, v6

    .line 33
    div-int/lit8 v4, v4, 0x2

    sub-int/2addr v5, v3

    .line 34
    div-int/lit8 v5, v5, 0x2

    .line 35
    invoke-static {p1}, Lcom/android/wallpaper/util/WallpaperCropUtils;->isRtl(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_2

    mul-int/lit8 v4, v4, -0x1

    .line 36
    :cond_2
    iget-object v7, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 37
    iget-object v7, v7, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 38
    invoke-virtual {v7}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    .line 39
    iput v6, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 40
    iput v3, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 41
    iget-object v8, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 42
    iget-object v8, v8, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    int-to-float v4, v4

    .line 43
    invoke-virtual {v8, v4}, Landroid/view/SurfaceView;->setX(F)V

    .line 44
    iget-object v4, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 45
    iget-object v4, v4, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    int-to-float v5, v5

    .line 46
    invoke-virtual {v4, v5}, Landroid/view/SurfaceView;->setY(F)V

    .line 47
    iget-object v4, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 48
    iget-object v4, v4, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 49
    invoke-virtual {v4, v7}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    iget-object v4, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 51
    iget-object v4, v4, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 52
    invoke-virtual {v4}, Landroid/view/SurfaceView;->requestLayout()V

    .line 53
    iget-object v4, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    const v5, 0x1010031

    .line 54
    invoke-static {v4, v5}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v5

    .line 55
    iget-object v7, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 56
    iget-object v7, v7, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mPlaceholderColorFuture:Ljava/util/concurrent/Future;

    .line 57
    invoke-interface {v7}, Ljava/util/concurrent/Future;->isDone()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 58
    :try_start_0
    iget-object v7, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    iget-object v7, v7, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v7, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->computePlaceholderColor(Landroid/content/Context;)Ljava/util/concurrent/Future;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v7, :cond_3

    move v5, v7

    .line 59
    :catch_0
    :cond_3
    iget-object v7, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 60
    iget-object v7, v7, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 61
    invoke-virtual {v7, v5}, Landroid/view/SurfaceView;->setResizeBackgroundColor(I)V

    .line 62
    iget-object v7, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 63
    iget-object v7, v7, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 64
    invoke-virtual {v7, v5}, Landroid/view/SurfaceView;->setBackgroundColor(I)V

    .line 65
    iget-object v7, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 66
    iget-object v7, v7, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLowResImageView:Landroid/widget/ImageView;

    .line 67
    invoke-virtual {v7, v5}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 68
    iget-object v7, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 69
    iget-object v8, v7, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperAsset:Lcom/android/wallpaper/asset/Asset;

    .line 70
    iget-object v9, v7, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLowResImageView:Landroid/widget/ImageView;

    .line 71
    iget-object v7, v7, Lcom/android/wallpaper/picker/PreviewFragment;->mPreviewBitmapTransformation:Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;

    invoke-virtual {v8, v4, v9, v5, v7}, Lcom/android/wallpaper/asset/Asset;->loadLowResDrawable(Landroid/app/Activity;Landroid/widget/ImageView;ILcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;)V

    const/high16 v4, 0x40000000    # 2.0f

    .line 72
    invoke-static {v6, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 73
    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 74
    invoke-virtual {v2, v5, v4}, Landroid/view/View;->measure(II)V

    const/4 v4, 0x0

    .line 75
    invoke-virtual {v2, v4, v4, v6, v3}, Landroid/view/View;->layout(IIII)V

    .line 76
    iget-object v3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 77
    iget-object v5, v3, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    .line 78
    iget-object v3, v3, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 79
    iput-object v3, v5, Lcom/android/wallpaper/picker/TouchForwardingLayout;->mView:Landroid/view/View;

    .line 80
    iget-object v3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    if-eqz v3, :cond_4

    .line 81
    invoke-virtual {v3}, Landroid/view/SurfaceControlViewHost;->release()V

    .line 82
    iput-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    .line 83
    :cond_4
    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 84
    iput-boolean v4, v1, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mIsSurfaceCreated:Z

    .line 85
    new-instance v1, Landroid/view/SurfaceControlViewHost;

    .line 86
    invoke-virtual {p1}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    move-result-object v3

    iget-object v5, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 87
    iget-object v5, v5, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 88
    invoke-virtual {v5}, Landroid/view/SurfaceView;->getHostToken()Landroid/os/IBinder;

    move-result-object v5

    invoke-direct {v1, p1, v3, v5}, Landroid/view/SurfaceControlViewHost;-><init>(Landroid/content/Context;Landroid/view/Display;Landroid/os/IBinder;)V

    iput-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    .line 89
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result p1

    .line 90
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v3

    .line 91
    invoke-virtual {v1, v2, p1, v3}, Landroid/view/SurfaceControlViewHost;->setView(Landroid/view/View;II)V

    .line 92
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 93
    iget-object p1, p1, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 94
    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    invoke-virtual {v1}, Landroid/view/SurfaceControlViewHost;->getSurfacePackage()Landroid/view/SurfaceControlViewHost$SurfacePackage;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/view/SurfaceView;->setChildSurfacePackage(Landroid/view/SurfaceControlViewHost$SurfacePackage;)V

    .line 95
    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 96
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mIsSurfaceCreated:Z

    .line 97
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mLastSelectedTabPositionOptional:Ljava/util/Optional;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    :cond_5
    move v0, v4

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/ImagePreviewFragment;->updateScreenPreview(Z)V

    :cond_6
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method
