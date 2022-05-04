.class public Lcom/android/wallpaper/model/WallpaperSectionController;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CustomizationSectionController;
.implements Landroidx/lifecycle/LifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/wallpaper/model/CustomizationSectionController<",
        "Lcom/android/wallpaper/picker/WallpaperSectionView;",
        ">;",
        "Landroidx/lifecycle/LifecycleObserver;"
    }
.end annotation


# instance fields
.field public final mActivity:Landroid/app/Activity;

.field public final mAppContext:Landroid/content/Context;

.field public mHomePreviewCard:Landroidx/cardview/widget/CardView;

.field public mHomePreviewProgress:Landroidx/core/widget/ContentLoadingProgressBar;

.field public mHomePreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

.field public mHomeWallpaperSurface:Landroid/view/SurfaceView;

.field public mHomeWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

.field public final mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

.field public mLockPreviewContainer:Landroid/view/ViewGroup;

.field public mLockPreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

.field public mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

.field public mLockWallpaperSurface:Landroid/view/SurfaceView;

.field public mLockWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

.field public mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

.field public mLockscreenPreviewProgress:Landroidx/core/widget/ContentLoadingProgressBar;

.field public final mPermissionRequester:Lcom/android/wallpaper/model/PermissionRequester;

.field public final mSavedInstanceState:Landroid/os/Bundle;

.field public final mSectionNavigationController:Lcom/android/wallpaper/model/CustomizationSectionController$CustomizationSectionNavigationController;

.field public final mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;

.field public mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

.field public final mWallpaperPreviewNavigator:Lcom/android/wallpaper/model/WallpaperPreviewNavigator;

.field public mWorkspaceSurface:Landroid/view/SurfaceView;

.field public mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

.field public final mWorkspaceViewModel:Lcom/android/wallpaper/model/WorkspaceViewModel;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroidx/lifecycle/LifecycleOwner;Lcom/android/wallpaper/model/PermissionRequester;Lcom/android/wallpaper/model/WallpaperColorsViewModel;Lcom/android/wallpaper/model/WorkspaceViewModel;Lcom/android/wallpaper/model/CustomizationSectionController$CustomizationSectionNavigationController;Lcom/android/wallpaper/model/WallpaperPreviewNavigator;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mActivity:Landroid/app/Activity;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    .line 4
    iput-object p3, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mPermissionRequester:Lcom/android/wallpaper/model/PermissionRequester;

    .line 5
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    .line 6
    iput-object p4, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    .line 7
    iput-object p5, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceViewModel:Lcom/android/wallpaper/model/WorkspaceViewModel;

    .line 8
    iput-object p6, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mSectionNavigationController:Lcom/android/wallpaper/model/CustomizationSectionController$CustomizationSectionNavigationController;

    .line 9
    iput-object p7, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperPreviewNavigator:Lcom/android/wallpaper/model/WallpaperPreviewNavigator;

    .line 10
    iput-object p8, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mSavedInstanceState:Landroid/os/Bundle;

    return-void
.end method

.method public static access$300(Lcom/android/wallpaper/model/WallpaperSectionController;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurface:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0, p1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurface:Landroid/view/SurfaceView;

    if-eqz v0, :cond_1

    .line 4
    invoke-virtual {v0, p1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 5
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurface:Landroid/view/SurfaceView;

    if-eqz v0, :cond_2

    .line 6
    invoke-virtual {v0, p1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 7
    :cond_2
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockPreviewContainer:Landroid/view/ViewGroup;

    if-eqz p0, :cond_3

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    :cond_3
    return-void
.end method


# virtual methods
.method public createView(Landroid/content/Context;)Lcom/android/wallpaper/picker/SectionView;
    .locals 13

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d00f0

    const/4 v2, 0x0

    .line 2
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/picker/WallpaperSectionView;

    const v1, 0x7f0a011a

    .line 3
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/cardview/widget/CardView;

    iput-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    .line 4
    iget-object v2, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    const v3, 0x7f110148

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    const v2, 0x7f0a029e

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/SurfaceView;

    iput-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurface:Landroid/view/SurfaceView;

    .line 6
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    const v3, 0x7f0a0298

    invoke-virtual {v1, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/core/widget/ContentLoadingProgressBar;

    iput-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewProgress:Landroidx/core/widget/ContentLoadingProgressBar;

    .line 7
    new-instance v1, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    iget-object v4, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurface:Landroid/view/SurfaceView;

    iget-object v5, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    const/4 v6, 0x0

    .line 8
    invoke-direct {v1, v4, v5, v6}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;-><init>(Landroid/view/SurfaceView;Landroid/content/Context;Z)V

    .line 9
    iput-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    .line 10
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    const v4, 0x7f0a029a

    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/SurfaceView;

    iput-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurface:Landroid/view/SurfaceView;

    .line 11
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mActivity:Landroid/app/Activity;

    const v5, 0x1010530

    .line 12
    invoke-static {v1, v5}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 13
    invoke-static {v1}, Ljava/util/concurrent/CompletableFuture;->completedFuture(Ljava/lang/Object;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v1

    .line 14
    new-instance v5, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    iget-object v8, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mActivity:Landroid/app/Activity;

    iget-object v9, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    iget-object v10, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurface:Landroid/view/SurfaceView;

    new-instance v12, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;

    invoke-direct {v12, p0, v6}, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;I)V

    move-object v7, v5

    move-object v11, v1

    invoke-direct/range {v7 .. v12}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;-><init>(Landroid/content/Context;Landroid/view/View;Landroid/view/SurfaceView;Ljava/util/concurrent/Future;Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;)V

    iput-object v5, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    const v5, 0x7f0a013d

    .line 15
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroidx/cardview/widget/CardView;

    iput-object v5, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    .line 16
    iget-object v7, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    const v8, 0x7f1100a8

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 17
    iget-object v5, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    invoke-virtual {v5, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/core/widget/ContentLoadingProgressBar;

    iput-object v3, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockscreenPreviewProgress:Landroidx/core/widget/ContentLoadingProgressBar;

    .line 18
    iget-object v3, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 19
    iget-object v2, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Landroid/view/SurfaceView;

    iput-object v10, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurface:Landroid/view/SurfaceView;

    .line 20
    new-instance v2, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    iget-object v8, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mActivity:Landroid/app/Activity;

    iget-object v9, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    new-instance v12, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;

    const/4 v3, 0x1

    invoke-direct {v12, p0, v3}, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;I)V

    move-object v7, v2

    invoke-direct/range {v7 .. v12}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;-><init>(Landroid/content/Context;Landroid/view/View;Landroid/view/SurfaceView;Ljava/util/concurrent/Future;Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;)V

    iput-object v2, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 21
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    const v2, 0x7f0a013e

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockPreviewContainer:Landroid/view/ViewGroup;

    const/4 v2, 0x4

    .line 22
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 23
    new-instance v1, Lcom/android/wallpaper/widget/LockScreenPreviewer;

    iget-object v2, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    invoke-interface {v2}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v2

    iget-object v4, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockPreviewContainer:Landroid/view/ViewGroup;

    invoke-direct {v1, v2, p1, v4}, Lcom/android/wallpaper/widget/LockScreenPreviewer;-><init>(Landroidx/lifecycle/Lifecycle;Landroid/content/Context;Landroid/view/ViewGroup;)V

    iput-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 24
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    const-string v1, "android.permission.READ_WALLPAPER_INTERNAL"

    invoke-virtual {p0, p1, v1}, Lcom/android/wallpaper/model/WallpaperSectionController;->isPermissionGranted(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    .line 25
    invoke-virtual {p0, p1, v1}, Lcom/android/wallpaper/model/WallpaperSectionController;->isPermissionGranted(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    move p1, v6

    goto :goto_1

    :cond_1
    :goto_0
    move p1, v3

    :goto_1
    if-eqz p1, :cond_2

    .line 26
    invoke-virtual {p0, v0, v3}, Lcom/android/wallpaper/model/WallpaperSectionController;->showCurrentWallpaper(Landroid/view/View;Z)V

    goto :goto_2

    .line 27
    :cond_2
    invoke-virtual {p0, v0, v6}, Lcom/android/wallpaper/model/WallpaperSectionController;->showCurrentWallpaper(Landroid/view/View;Z)V

    const p1, 0x7f0a01a2

    .line 28
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 29
    new-instance v1, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0}, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;Landroid/view/View;)V

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f110033

    .line 31
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f1100ff

    new-array v4, v3, [Ljava/lang/Object;

    aput-object v1, v4, v6

    .line 32
    invoke-virtual {p1, v2, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const v1, 0x7f0a01a3

    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 34
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    :goto_2
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 v1, 0x10e0000

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    .line 36
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    iget-object v2, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewProgress:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-virtual {p0, v1, v2, p1, v3}, Lcom/android/wallpaper/model/WallpaperSectionController;->setupFade(Landroidx/cardview/widget/CardView;Landroidx/core/widget/ContentLoadingProgressBar;IZ)V

    .line 37
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    iget-object v2, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockscreenPreviewProgress:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-virtual {p0, v1, v2, p1, v3}, Lcom/android/wallpaper/model/WallpaperSectionController;->setupFade(Landroidx/cardview/widget/CardView;Landroidx/core/widget/ContentLoadingProgressBar;IZ)V

    .line 38
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    invoke-interface {p1}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 39
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-interface {p1, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 40
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1, v3}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 41
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-interface {p1, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 42
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1, v3}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 43
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1, v3}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 44
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-interface {p1, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    const p1, 0x7f0a0292

    .line 45
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v1, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceViewModel:Lcom/android/wallpaper/model/WorkspaceViewModel;

    .line 47
    iget-object p1, p1, Lcom/android/wallpaper/model/WorkspaceViewModel;->updateWorkspace$delegate:Lkotlin/Lazy;

    invoke-interface {p1}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/lifecycle/MutableLiveData;

    .line 48
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    new-instance v2, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;

    const/4 v3, 0x2

    invoke-direct {v2, p0, v3}, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;I)V

    invoke-virtual {p1, v1, v2}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    return-object v0
.end method

.method public final isActivityAlive()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isAvailable(Landroid/content/Context;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final isPermissionGranted(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    .line 3
    invoke-virtual {p0, p2, p1}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final maybeLoadThumbnail(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/util/WallpaperSurfaceCallback;)Lcom/android/wallpaper/asset/Asset;
    .locals 2

    .line 1
    iget-object p2, p2, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    .line 2
    new-instance v0, Lcom/android/wallpaper/asset/BitmapCachingAsset;

    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    .line 3
    invoke-virtual {p1, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lcom/android/wallpaper/asset/BitmapCachingAsset;-><init>(Landroid/content/Context;Lcom/android/wallpaper/asset/Asset;)V

    if-eqz p2, :cond_0

    .line 4
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p1, :cond_0

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mActivity:Landroid/app/Activity;

    const p1, 0x1010530

    .line 6
    invoke-static {p0, p1}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result p1

    .line 7
    iget-object v1, v0, Lcom/android/wallpaper/asset/BitmapCachingAsset;->mOriginalAsset:Lcom/android/wallpaper/asset/Asset;

    invoke-virtual {v1, p0, p2, p1}, Lcom/android/wallpaper/asset/Asset;->loadPreviewImage(Landroid/app/Activity;Landroid/widget/ImageView;I)V

    :cond_0
    return-object v0
.end method

.method public final onHomeWallpaperColorsChanged(Landroid/app/WallpaperColors;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    .line 2
    invoke-virtual {v0}, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->getHomeWallpaperColors()Landroidx/lifecycle/MutableLiveData;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 3
    invoke-virtual {p1, v0}, Landroid/app/WallpaperColors;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    invoke-virtual {p0}, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->getHomeWallpaperColors()Landroidx/lifecycle/MutableLiveData;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public final onLockWallpaperColorsChanged(Landroid/app/WallpaperColors;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    .line 2
    invoke-virtual {v0}, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->getLockWallpaperColors()Landroidx/lifecycle/MutableLiveData;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 3
    invoke-virtual {p1, v0}, Landroid/app/WallpaperColors;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    invoke-virtual {v0}, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->getLockWallpaperColors()Landroidx/lifecycle/MutableLiveData;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    if-eqz p0, :cond_1

    .line 6
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setColor(Landroid/app/WallpaperColors;)V

    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 1
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_PAUSE:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    .line 3
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/util/WallpaperConnection;->setEngineVisibility(Z)V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 4
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_RESUME:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mSavedInstanceState:Landroid/os/Bundle;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v2

    iget-object v3, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    .line 3
    invoke-interface {v2, v3}, Lcom/android/wallpaper/module/Injector;->getCurrentWallpaperFactory(Landroid/content/Context;)Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;

    move-result-object v2

    .line 4
    new-instance v3, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;)V

    check-cast v2, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;

    invoke-virtual {v2, v3, v0}, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->createCurrentWallpaperInfos(Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;Z)V

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p0, :cond_1

    .line 6
    iput-boolean v1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    .line 7
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/util/WallpaperConnection;->setEngineVisibility(Z)V

    :cond_1
    return-void
.end method

.method public onStop()V
    .locals 1
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_STOP:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    :cond_0
    return-void
.end method

.method public onTransitionOut()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurface:Landroid/view/SurfaceView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Landroid/view/SurfaceView;->setUseAlpha()V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setAlpha(F)V

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurface:Landroid/view/SurfaceView;

    if-eqz v0, :cond_1

    .line 5
    invoke-virtual {v0}, Landroid/view/SurfaceView;->setUseAlpha()V

    .line 6
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setAlpha(F)V

    .line 7
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurface:Landroid/view/SurfaceView;

    if-eqz v0, :cond_2

    .line 8
    invoke-virtual {v0}, Landroid/view/SurfaceView;->setUseAlpha()V

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setAlpha(F)V

    .line 10
    :cond_2
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockPreviewContainer:Landroid/view/ViewGroup;

    if-eqz p0, :cond_3

    .line 11
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    :cond_3
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->release()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    if-eqz v0, :cond_1

    .line 5
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->cleanUp()V

    .line 6
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    if-eqz v0, :cond_2

    .line 7
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->cleanUp()V

    .line 8
    :cond_2
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    if-eqz v0, :cond_3

    .line 9
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->cleanUp()V

    .line 10
    :cond_3
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    invoke-interface {v0}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v0

    check-cast v0, Landroidx/lifecycle/LifecycleRegistry;

    const-string v1, "removeObserver"

    .line 11
    invoke-virtual {v0, v1}, Landroidx/lifecycle/LifecycleRegistry;->enforceMainThreadIfNeeded(Ljava/lang/String;)V

    .line 12
    iget-object v0, v0, Landroidx/lifecycle/LifecycleRegistry;->mObserverMap:Landroidx/arch/core/internal/FastSafeIterableMap;

    invoke-virtual {v0, p0}, Landroidx/arch/core/internal/FastSafeIterableMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final setupFade(Landroidx/cardview/widget/CardView;Landroidx/core/widget/ContentLoadingProgressBar;IZ)V
    .locals 5

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz p4, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 1
    :goto_0
    invoke-virtual {p1, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 2
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    if-eqz p4, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    move v2, v0

    .line 3
    :goto_1
    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    int-to-long v2, p3

    .line 4
    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v4, Lcom/android/wallpaper/model/WallpaperSectionController$3;

    invoke-direct {v4, p0, p2}, Lcom/android/wallpaper/model/WallpaperSectionController$3;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;Landroidx/core/widget/ContentLoadingProgressBar;)V

    .line 5
    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 6
    invoke-virtual {p2}, Landroid/widget/ProgressBar;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    if-eqz p4, :cond_2

    move v0, v1

    .line 7
    :cond_2
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    mul-int/lit8 p3, p3, 0x2

    int-to-long p3, p3

    .line 8
    invoke-virtual {p0, p3, p4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    .line 9
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    .line 10
    new-instance p1, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;

    const/4 p3, 0x4

    invoke-direct {p1, p2, p3}, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;-><init>(Landroidx/core/widget/ContentLoadingProgressBar;I)V

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    .line 11
    new-instance p1, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;

    const/4 p3, 0x5

    invoke-direct {p1, p2, p3}, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;-><init>(Landroidx/core/widget/ContentLoadingProgressBar;I)V

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final showCurrentWallpaper(Landroid/view/View;Z)V
    .locals 3

    const p0, 0x7f0a011a

    .line 1
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p2, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 2
    :goto_0
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    const p0, 0x7f0a013d

    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_1

    move v2, v0

    goto :goto_1

    :cond_1
    move v2, v1

    .line 4
    :goto_1
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    const p0, 0x7f0a01a1

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_2

    move v0, v1

    .line 6
    :cond_2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final updatePreview(Lcom/android/wallpaper/model/WallpaperInfo;Z)V
    .locals 10

    if-nez p1, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-virtual {p0}, Lcom/android/wallpaper/model/WallpaperSectionController;->isActivityAlive()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 2
    :cond_1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v0

    if-eqz p2, :cond_2

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 4
    :goto_0
    invoke-virtual {p0, p1, v1}, Lcom/android/wallpaper/model/WallpaperSectionController;->maybeLoadThumbnail(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/util/WallpaperSurfaceCallback;)Lcom/android/wallpaper/asset/Asset;

    if-eqz p2, :cond_6

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 6
    invoke-virtual {v1}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    .line 7
    iput-object v2, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 8
    :cond_3
    instance-of v1, p1, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    if-eqz v1, :cond_6

    .line 9
    invoke-virtual {p0}, Lcom/android/wallpaper/model/WallpaperSectionController;->isActivityAlive()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_1

    .line 10
    :cond_4
    invoke-static {}, Lcom/android/wallpaper/util/WallpaperConnection;->isPreviewAvailable()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 11
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockPreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    instance-of v1, v1, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    .line 12
    new-instance v9, Lcom/android/wallpaper/util/WallpaperConnection;

    .line 13
    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object v3

    .line 14
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.service.wallpaper.WallpaperService"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 15
    invoke-virtual {v3}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v5, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    .line 16
    iget-object v5, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mActivity:Landroid/app/Activity;

    new-instance v6, Lcom/android/wallpaper/model/WallpaperSectionController$2;

    invoke-direct {v6, p0, v1}, Lcom/android/wallpaper/model/WallpaperSectionController$2;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;Z)V

    iget-object v7, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurface:Landroid/view/SurfaceView;

    if-eqz v1, :cond_5

    .line 17
    iget-object v2, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurface:Landroid/view/SurfaceView;

    :cond_5
    move-object v8, v2

    move-object v3, v9

    invoke-direct/range {v3 .. v8}, Lcom/android/wallpaper/util/WallpaperConnection;-><init>(Landroid/content/Intent;Landroid/content/Context;Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;Landroid/view/SurfaceView;Landroid/view/SurfaceView;)V

    iput-object v9, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    const/4 v1, 0x1

    .line 18
    iput-boolean v1, v9, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    .line 19
    invoke-virtual {v9, v1}, Lcom/android/wallpaper/util/WallpaperConnection;->setEngineVisibility(Z)V

    .line 20
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurface:Landroid/view/SurfaceView;

    new-instance v2, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;)V

    invoke-virtual {v1, v2}, Landroid/view/SurfaceView;->post(Ljava/lang/Runnable;)Z

    :cond_6
    :goto_1
    if-eqz p2, :cond_7

    .line 21
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    goto :goto_2

    :cond_7
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    .line 22
    :goto_2
    new-instance v2, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, p1, p2, v0}, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda2;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;Lcom/android/wallpaper/model/WallpaperInfo;ZLcom/android/wallpaper/module/UserEventLogger;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
