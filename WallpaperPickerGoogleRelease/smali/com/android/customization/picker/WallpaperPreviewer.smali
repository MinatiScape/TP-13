.class public Lcom/android/customization/picker/WallpaperPreviewer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/LifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;
    }
.end annotation


# instance fields
.field public final mActivity:Landroid/app/Activity;

.field public final mHomePreview:Landroid/widget/ImageView;

.field public final mLivePreviewLocation:[I

.field public final mPreviewGlobalRect:Landroid/graphics/Rect;

.field public final mPreviewLocalRect:Landroid/graphics/Rect;

.field public mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

.field public mWallpaperColorsListener:Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;

.field public mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

.field public final mWallpaperSurface:Landroid/view/SurfaceView;

.field public mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;


# direct methods
.method public constructor <init>(Landroidx/lifecycle/Lifecycle;Landroid/app/Activity;Landroid/widget/ImageView;Landroid/view/SurfaceView;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mPreviewLocalRect:Landroid/graphics/Rect;

    .line 3
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mPreviewGlobalRect:Landroid/graphics/Rect;

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 4
    iput-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mLivePreviewLocation:[I

    .line 5
    invoke-virtual {p1, p0}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 6
    iput-object p2, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    .line 7
    iput-object p3, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mHomePreview:Landroid/widget/ImageView;

    .line 8
    iput-object p4, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 9
    new-instance p1, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    new-instance v6, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {v6, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Lcom/android/customization/picker/WallpaperPreviewer;)V

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 10
    invoke-direct/range {v1 .. v6}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;-><init>(Landroid/content/Context;Landroid/view/View;Landroid/view/SurfaceView;Ljava/util/concurrent/Future;Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;)V

    .line 11
    iput-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    const/4 p1, 0x1

    .line 12
    invoke-virtual {p4, p1}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 13
    invoke-virtual {p4}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object p2, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-interface {p1, p2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 14
    invoke-virtual {p3}, Landroid/widget/ImageView;->getRootView()Landroid/view/View;

    move-result-object p1

    .line 15
    new-instance p2, Lcom/android/customization/picker/WallpaperPreviewer$1;

    invoke-direct {p2, p0, p1}, Lcom/android/customization/picker/WallpaperPreviewer$1;-><init>(Lcom/android/customization/picker/WallpaperPreviewer;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 2
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_DESTROY:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->cleanUp()V

    .line 5
    iget-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 6
    iget-object p0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p0

    invoke-interface {p0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 7
    invoke-virtual {p0}, Landroid/view/Surface;->release()V

    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 1
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_PAUSE:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

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
    .locals 1
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_RESUME:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    .line 3
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/util/WallpaperConnection;->setEngineVisibility(Z)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_STOP:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    :cond_0
    return-void
.end method
