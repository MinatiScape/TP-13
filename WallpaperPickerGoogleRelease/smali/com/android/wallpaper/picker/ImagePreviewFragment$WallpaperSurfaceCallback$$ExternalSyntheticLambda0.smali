.class public final synthetic Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;

    return-void
.end method


# virtual methods
.method public final onDimensionsDecoded(Landroid/graphics/Point;)V
    .locals 3

    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    if-nez p1, :cond_1

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/PreviewFragment;->showLoadWallpaperErrorDialog()V

    goto :goto_1

    .line 3
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    if-eqz v0, :cond_2

    .line 4
    invoke-virtual {v0}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions()V

    .line 5
    :cond_2
    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 6
    iput-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mRawWallpaperSize:Landroid/graphics/Point;

    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mRawWallpaperSize:Landroid/graphics/Point;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    if-eqz p1, :cond_4

    .line 9
    iget-boolean v0, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    if-eqz v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v0, 0x3

    .line 10
    invoke-virtual {p1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMinimumScaleType(I)V

    .line 11
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setPanLimit(I)V

    .line 12
    new-instance p1, Landroid/graphics/Point;

    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mRawWallpaperSize:Landroid/graphics/Point;

    invoke-direct {p1, v0}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    .line 13
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperAsset:Lcom/android/wallpaper/asset/Asset;

    iget v1, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    new-instance v2, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V

    invoke-virtual {v0, v1, p1, v2}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    .line 14
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    monitor-exit p0

    goto :goto_1

    .line 16
    :cond_4
    :goto_0
    monitor-exit p0

    :goto_1
    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
