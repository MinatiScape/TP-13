.class public Lcom/android/wallpaper/util/WallpaperSurfaceCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;
    }
.end annotation


# instance fields
.field public mAppStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

.field public final mContainerView:Landroid/view/View;

.field public final mContext:Landroid/content/Context;

.field public mHomeImageWallpaper:Landroid/widget/ImageView;

.field public mHost:Landroid/view/SurfaceControlViewHost;

.field public mLastSurface:Landroid/view/Surface;

.field public final mListener:Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;

.field public mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

.field public final mPlaceholderColor:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public mSurfaceCreated:Z

.field public final mWallpaperSurface:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Landroid/view/SurfaceView;Ljava/util/concurrent/Future;Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/view/View;",
            "Landroid/view/SurfaceView;",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mContext:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mContainerView:Landroid/view/View;

    .line 4
    iput-object p3, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 5
    iput-object p5, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mListener:Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;

    .line 6
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    .line 7
    invoke-interface {p2, p1}, Lcom/android/wallpaper/module/Injector;->getPackageStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/PackageStatusNotifier;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    .line 8
    new-instance p2, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/util/WallpaperSurfaceCallback;)V

    iput-object p2, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mAppStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    .line 9
    check-cast p1, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    const-string p3, "android.service.wallpaper.WallpaperService"

    invoke-virtual {p1, p2, p3}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->addListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;Ljava/lang/String;)V

    .line 10
    iput-object p4, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mPlaceholderColor:Ljava/util/concurrent/Future;

    return-void
.end method


# virtual methods
.method public cleanUp()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Landroid/view/SurfaceControlViewHost;->release()V

    .line 3
    iput-object v1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 6
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mAppStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    check-cast v0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    invoke-virtual {v0, p0}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->removeListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;)V

    return-void
.end method

.method public final setupSurfaceWallpaper(Z)V
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mPlaceholderColor:Ljava/util/concurrent/Future;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isDone()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    :try_start_0
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mPlaceholderColor:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_0
    move-object v0, v1

    .line 4
    :goto_0
    iget-object v2, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_1

    .line 5
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mContext:Landroid/content/Context;

    const v3, 0x1010530

    invoke-static {v0, v3}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v0

    .line 6
    :goto_1
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 7
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mContainerView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    iget-object v4, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mContainerView:Landroid/view/View;

    .line 8
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-static {v4, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 9
    invoke-virtual {v0, v2, v3}, Landroid/widget/ImageView;->measure(II)V

    .line 10
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mContainerView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mContainerView:Landroid/view/View;

    .line 11
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    .line 12
    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/widget/ImageView;->layout(IIII)V

    if-eqz p1, :cond_3

    .line 13
    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    if-eqz p1, :cond_2

    .line 14
    invoke-virtual {p1}, Landroid/view/SurfaceControlViewHost;->release()V

    .line 15
    iput-object v1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    .line 16
    :cond_2
    new-instance p1, Landroid/view/SurfaceControlViewHost;

    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mContainerView:Landroid/view/View;

    .line 17
    invoke-virtual {v1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getHostToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-direct {p1, v0, v1, v2}, Landroid/view/SurfaceControlViewHost;-><init>(Landroid/content/Context;Landroid/view/Display;Landroid/os/IBinder;)V

    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    .line 18
    :cond_3
    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    .line 19
    invoke-virtual {v2}, Landroid/widget/ImageView;->getHeight()I

    move-result v2

    .line 20
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/SurfaceControlViewHost;->setView(Landroid/view/View;II)V

    .line 21
    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mWallpaperSurface:Landroid/view/SurfaceView;

    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    invoke-virtual {p0}, Landroid/view/SurfaceControlViewHost;->getSurfacePackage()Landroid/view/SurfaceControlViewHost$SurfacePackage;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/SurfaceView;->setChildSurfacePackage(Landroid/view/SurfaceControlViewHost$SurfacePackage;)V

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mLastSurface:Landroid/view/Surface;

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    .line 2
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mLastSurface:Landroid/view/Surface;

    .line 3
    invoke-virtual {p0, v2}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->setupSurfaceWallpaper(Z)V

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mListener:Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;

    if-eqz p1, :cond_1

    .line 5
    invoke-interface {p1}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;->onSurfaceCreated()V

    .line 6
    :cond_1
    iput-boolean v2, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mSurfaceCreated:Z

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    const/4 p1, 0x0

    .line 1
    iput-boolean p1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mSurfaceCreated:Z

    return-void
.end method
