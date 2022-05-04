.class public Lcom/android/wallpaper/picker/ImagePreviewFragment;
.super Lcom/android/wallpaper/picker/PreviewFragment;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;
    }
.end annotation


# static fields
.field public static final sExecutor:Ljava/util/concurrent/Executor;


# instance fields
.field public mContainer:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

.field public final mImageScaleChangeCounter:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final mInjector:Lcom/android/wallpaper/module/Injector;

.field public mIsSurfaceCreated:Z

.field public mLockPreviewContainer:Landroid/view/ViewGroup;

.field public mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

.field public mLowResImageView:Landroid/widget/ImageView;

.field public mPlaceholderColorFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public mRawWallpaperSize:Landroid/graphics/Point;

.field public final mRecalculateColorCounter:Ljava/util/concurrent/atomic/AtomicInteger;

.field public mScreenSize:Landroid/graphics/Point;

.field public mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

.field public mWallpaperAsset:Lcom/android/wallpaper/asset/Asset;

.field public mWallpaperColors:Landroid/app/WallpaperColors;

.field public mWallpaperScreenSize:Landroid/graphics/Point;

.field public mWallpaperSurface:Landroid/view/SurfaceView;

.field public final mWallpaperSurfaceCallback:Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;

.field public mWorkspaceSurface:Landroid/view/SurfaceView;

.field public mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->sExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/PreviewFragment;-><init>()V

    .line 2
    new-instance v0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;Lcom/android/wallpaper/picker/ImagePreviewFragment$1;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;

    .line 3
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mImageScaleChangeCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mRecalculateColorCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mInjector:Lcom/android/wallpaper/module/Injector;

    .line 6
    iput-boolean v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mIsSurfaceCreated:Z

    return-void
.end method


# virtual methods
.method public final calculateCropRect(Landroid/content/Context;)Landroid/graphics/Rect;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 2
    iget v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 4
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 6
    iget-object v0, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-eqz v0, :cond_2

    iget-boolean v0, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v5, v3, v3, v0, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 8
    iget-object v0, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-eqz v0, :cond_2

    iget-boolean v0, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-nez v0, :cond_1

    goto :goto_0

    .line 9
    :cond_1
    iget v0, v5, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    .line 10
    invoke-virtual {p1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v0

    float-to-int v0, v0

    iget v2, v5, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    .line 11
    invoke-virtual {p1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result v2

    float-to-int v2, v2

    iget v4, v5, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    .line 12
    invoke-virtual {p1, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v4

    float-to-int v4, v4

    iget v7, v5, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v7

    .line 13
    invoke-virtual {p1, v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result v7

    float-to-int v7, v7

    .line 14
    invoke-virtual {v5, v0, v2, v4, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 15
    invoke-virtual {p1, v5, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fileSRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 16
    iget v0, v5, Landroid/graphics/Rect;->left:I

    .line 17
    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v2, v5, Landroid/graphics/Rect;->top:I

    .line 18
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget v3, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    iget v4, v5, Landroid/graphics/Rect;->right:I

    .line 19
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iget p1, p1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    iget v4, v5, Landroid/graphics/Rect;->bottom:I

    .line 20
    invoke-static {p1, v4}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 21
    invoke-virtual {v5, v0, v2, v3, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 22
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getMeasuredWidth()I

    move-result p1

    .line 23
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getMeasuredHeight()I

    move-result v0

    .line 24
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 25
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 26
    new-instance v4, Landroid/graphics/Point;

    invoke-direct {v4, p1, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 27
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 28
    invoke-static {v7, v2, v3, p1, v0}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateCropSurfaceSize(Landroid/content/res/Resources;IIII)Landroid/graphics/Point;

    move-result-object v3

    .line 29
    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mRawWallpaperSize:Landroid/graphics/Point;

    move-object v2, v4

    move-object v4, p0

    invoke-static/range {v1 .. v6}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateCropRect(Landroid/content/Context;Landroid/graphics/Point;Landroid/graphics/Point;Landroid/graphics/Point;Landroid/graphics/Rect;F)Landroid/graphics/Rect;

    move-result-object p0

    return-object p0
.end method

.method public getLayoutResId()I
    .locals 0

    const p0, 0x7f0d0062

    return p0
.end method

.method public onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;Landroid/content/Context;)V

    sget-object v1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->INFORMATION:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 4
    invoke-virtual {p1, v0, v1}, Lcom/android/wallpaper/widget/BottomActionBar;->bindBottomSheetContentWithAction(Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->EDIT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v3, 0x1

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->APPLY:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v3, 0x2

    aput-object v1, v0, v3

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->showActionsOnly([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v0, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V

    invoke-virtual {p1, v1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->setActionClickListener(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V

    .line 7
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    const v0, 0x7f0a01f3

    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v1, Lcom/android/wallpaper/picker/ImagePreviewFragment$2;

    invoke-direct {v1, p0, p1}, Lcom/android/wallpaper/picker/ImagePreviewFragment$2;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;Landroid/view/View;)V

    .line 10
    iput-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mAccessibilityCallback:Lcom/android/wallpaper/widget/BottomActionBar$AccessibilityCallback;

    .line 11
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 12
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-virtual {p1}, Lcom/android/wallpaper/widget/BottomActionBar;->disableActions()V

    .line 13
    iget-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mRawWallpaperSize:Landroid/graphics/Point;

    if-eqz p1, :cond_0

    .line 14
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-virtual {p0}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions()V

    :cond_0
    return-void
.end method

.method public onClickOk()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperAsset:Lcom/android/wallpaper/asset/Asset;

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->computePlaceholderColor(Landroid/content/Context;)Ljava/util/concurrent/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mPlaceholderColorFuture:Ljava/util/concurrent/Future;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/wallpaper/picker/PreviewFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    .line 3
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object p3

    .line 4
    invoke-virtual {p2}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 5
    invoke-virtual {p3, v0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mScreenSize:Landroid/graphics/Point;

    .line 6
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mInjector:Lcom/android/wallpaper/module/Injector;

    .line 7
    invoke-interface {v0, p2}, Lcom/android/wallpaper/module/Injector;->getDisplayUtils(Landroid/content/Context;)Lcom/android/wallpaper/util/DisplayUtils;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/wallpaper/util/DisplayUtils;->getWallpaperDisplay()Landroid/view/Display;

    move-result-object v0

    .line 8
    invoke-virtual {p3, v0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p3

    iput-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperScreenSize:Landroid/graphics/Point;

    const p3, 0x7f0a00ab

    .line 9
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mContainer:Landroidx/constraintlayout/widget/ConstraintLayout;

    const v0, 0x7f0a0272

    .line 10
    invoke-virtual {p3, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/android/wallpaper/picker/TouchForwardingLayout;

    iput-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p3, Lcom/android/wallpaper/picker/TouchForwardingLayout;->mForwardingEnabled:Z

    const p3, 0x7f0a01b3

    .line 12
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    const v1, 0x7f0600ef

    .line 13
    invoke-virtual {p2, v1}, Landroid/app/Activity;->getColor(I)I

    move-result v1

    invoke-virtual {p3, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 14
    new-instance p3, Landroidx/constraintlayout/widget/ConstraintSet;

    invoke-direct {p3}, Landroidx/constraintlayout/widget/ConstraintSet;-><init>()V

    .line 15
    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mContainer:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p3, v1}, Landroidx/constraintlayout/widget/ConstraintSet;->clone(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 16
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mScreenSize:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mScreenSize:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->y:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v0

    const-string v3, "%d:%d"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 17
    iget-object v2, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getId()I

    move-result v2

    .line 18
    invoke-virtual {p3, v2}, Landroidx/constraintlayout/widget/ConstraintSet;->get(I)Landroidx/constraintlayout/widget/ConstraintSet$Constraint;

    move-result-object v2

    iget-object v2, v2, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iput-object v1, v2, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->dimensionRatio:Ljava/lang/String;

    .line 19
    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mContainer:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p3, v1}, Landroidx/constraintlayout/widget/ConstraintSet;->applyTo(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 20
    iget-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mContainer:Landroidx/constraintlayout/widget/ConstraintLayout;

    const v1, 0x7f0a029e

    invoke-virtual {p3, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/SurfaceView;

    iput-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    .line 21
    invoke-virtual {p0, p3}, Lcom/android/wallpaper/picker/PreviewFragment;->createWorkspaceSurfaceCallback(Landroid/view/SurfaceView;)Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    move-result-object p3

    iput-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    .line 22
    iget-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mContainer:Landroidx/constraintlayout/widget/ConstraintLayout;

    const v1, 0x7f0a029a

    invoke-virtual {p3, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/SurfaceView;

    iput-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 23
    iget-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mContainer:Landroidx/constraintlayout/widget/ConstraintLayout;

    const v1, 0x7f0a013e

    invoke-virtual {p3, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockPreviewContainer:Landroid/view/ViewGroup;

    .line 24
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p3

    const v1, 0x1010031

    invoke-static {p3, v1}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result p3

    .line 25
    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {v1, p3}, Landroid/view/SurfaceView;->setResizeBackgroundColor(I)V

    .line 26
    new-instance p3, Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 27
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

    .line 28
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockPreviewContainer:Landroid/view/ViewGroup;

    invoke-direct {p3, v1, v2, v3}, Lcom/android/wallpaper/widget/LockScreenPreviewer;-><init>(Landroidx/lifecycle/Lifecycle;Landroid/content/Context;Landroid/view/ViewGroup;)V

    iput-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 29
    iget-object v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 30
    iget-boolean v1, v1, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsFullScreen:Z

    xor-int/2addr v1, v0

    .line 31
    invoke-virtual {p3, v1}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setDateViewVisibility(Z)V

    .line 32
    iget-object p3, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    new-instance v1, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V

    .line 33
    iput-object v1, p3, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenStatusListener:Lcom/android/wallpaper/util/FullScreenAnimation$FullScreenStatusListener;

    const p3, 0x7f0a01f2

    .line 34
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {p0, p3}, Lcom/android/wallpaper/picker/PreviewFragment;->setUpTabs(Lcom/google/android/material/tabs/TabLayout;)V

    .line 35
    new-instance p3, Lcom/android/wallpaper/picker/ImagePreviewFragment$1;

    invoke-direct {p3, p0, p2, p1}, Lcom/android/wallpaper/picker/ImagePreviewFragment$1;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;Landroid/app/Activity;Landroid/view/View;)V

    invoke-virtual {p1, p3}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 36
    iget-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {p3}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p3

    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;

    invoke-interface {p3, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 37
    iget-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {p3, v0}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 38
    iget-object p3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {p3}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p3

    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-interface {p3, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 39
    invoke-static {p2}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object p0

    sget-object p2, Lcom/bumptech/glide/MemoryCategory;->LOW:Lcom/bumptech/glide/MemoryCategory;

    invoke-virtual {p0, p2}, Lcom/bumptech/glide/Glide;->setMemoryCategory(Lcom/bumptech/glide/MemoryCategory;)Lcom/bumptech/glide/MemoryCategory;

    return-object p1
.end method

.method public onDestroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/wallpaper/picker/PreviewFragment;->onDestroy()V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    .line 3
    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 4
    iput-object v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    .line 5
    iput-object v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    if-eqz v0, :cond_1

    .line 7
    invoke-virtual {v0}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->release()V

    .line 8
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;

    .line 9
    iget-object v2, v0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    if-eqz v2, :cond_2

    .line 10
    invoke-virtual {v2}, Landroid/view/SurfaceControlViewHost;->release()V

    .line 11
    iput-object v1, v0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    .line 12
    :cond_2
    iget-object v0, v0, Lcom/android/wallpaper/picker/ImagePreviewFragment$WallpaperSurfaceCallback;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    const/4 v1, 0x0

    .line 13
    iput-boolean v1, v0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mIsSurfaceCreated:Z

    .line 14
    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->cleanUp()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/wallpaper/picker/BottomActionBarFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    return-void
.end method

.method public onWallpaperColorsChanged(Landroid/app/WallpaperColors;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActionButtonsWithBottomSheet(Z)V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperColors:Landroid/app/WallpaperColors;

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    invoke-virtual {v0, p1}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setColor(Landroid/app/WallpaperColors;)V

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    if-eqz p1, :cond_1

    .line 5
    invoke-virtual {p1}, Landroid/app/WallpaperColors;->getColorHints()I

    move-result p1

    and-int/2addr p1, v1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x3

    .line 6
    :goto_1
    iput p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenTextColor:I

    .line 7
    iget-boolean p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsFullScreen:Z

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/util/FullScreenAnimation;->animateColor(Z)V

    return-void
.end method

.method public final recalculateColors()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p0, "ImagePreviewFragment"

    const-string v0, "Got null context, skip recalculating colors"

    .line 2
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 3
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mInjector:Lcom/android/wallpaper/module/Injector;

    invoke-interface {v1}, Lcom/android/wallpaper/module/Injector;->getBitmapCropper()Lcom/android/wallpaper/module/BitmapCropper;

    move-result-object v1

    .line 4
    iget-object v3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperAsset:Lcom/android/wallpaper/asset/Asset;

    iget-object v2, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 5
    iget v4, v2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/ImagePreviewFragment;->calculateCropRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v5

    const/4 v6, 0x0

    new-instance v7, Lcom/android/wallpaper/picker/ImagePreviewFragment$4;

    invoke-direct {v7, p0}, Lcom/android/wallpaper/picker/ImagePreviewFragment$4;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V

    .line 7
    move-object v2, v1

    check-cast v2, Lcom/android/wallpaper/module/DefaultBitmapCropper;

    invoke-virtual/range {v2 .. v7}, Lcom/android/wallpaper/module/DefaultBitmapCropper;->cropAndScaleBitmap(Lcom/android/wallpaper/asset/Asset;FLandroid/graphics/Rect;ZLcom/android/wallpaper/module/BitmapCropper$Callback;)V

    return-void
.end method

.method public setCurrentWallpaper(I)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v3, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperAsset:Lcom/android/wallpaper/asset/Asset;

    iget-object v4, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mFullResImageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 2
    iget v5, v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/wallpaper/picker/ImagePreviewFragment;->calculateCropRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v6

    iget-object v7, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWallpaperColors:Landroid/app/WallpaperColors;

    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mViewModelProvider:Landroidx/lifecycle/ViewModelProvider;

    .line 4
    const-class v4, Lcom/android/wallpaper/model/SetWallpaperViewModel;

    invoke-virtual {p0, v4}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/model/SetWallpaperViewModel;

    .line 5
    new-instance v8, Lcom/android/wallpaper/model/SetWallpaperViewModel$1;

    invoke-direct {v8, p0}, Lcom/android/wallpaper/model/SetWallpaperViewModel$1;-><init>(Lcom/android/wallpaper/model/SetWallpaperViewModel;)V

    move v4, p1

    .line 6
    invoke-virtual/range {v0 .. v8}, Lcom/android/wallpaper/module/WallpaperSetter;->setCurrentWallpaper(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;IFLandroid/graphics/Rect;Landroid/app/WallpaperColors;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    return-void
.end method

.method public updateScreenPreview(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    iget-boolean v2, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mIsSurfaceCreated:Z

    if-eqz v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    const/16 v2, 0x8

    :goto_0
    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockPreviewContainer:Landroid/view/ViewGroup;

    if-eqz p1, :cond_1

    const/4 v1, 0x4

    :cond_1
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 4
    iput-boolean p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsHomeSelected:Z

    return-void
.end method
