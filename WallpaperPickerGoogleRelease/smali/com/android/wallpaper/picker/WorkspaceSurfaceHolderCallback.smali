.class public Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback$WorkspaceRenderListener;
    }
.end annotation


# instance fields
.field public mCallback:Landroid/os/Message;

.field public mIsWallpaperColorsReady:Z

.field public mLastSurface:Landroid/view/Surface;

.field public mListener:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback$WorkspaceRenderListener;

.field public mNeedsToCleanUp:Z

.field public final mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;

.field public final mRequestPending:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final mShouldUseWallpaperColors:Z

.field public mWallpaperColors:Landroid/app/WallpaperColors;

.field public final mWorkspaceSurface:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>(Landroid/view/SurfaceView;Landroid/content/Context;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mRequestPending:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 3
    iput-object p1, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mWorkspaceSurface:Landroid/view/SurfaceView;

    .line 4
    new-instance p1, Lcom/android/wallpaper/util/PreviewUtils;

    const v0, 0x7f11008f

    .line 5
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Lcom/android/wallpaper/util/PreviewUtils;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;

    .line 6
    iput-boolean p3, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mShouldUseWallpaperColors:Z

    return-void
.end method


# virtual methods
.method public cleanUp()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mCallback:Landroid/os/Message;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 2
    :try_start_0
    iget-object v2, v0, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    invoke-virtual {v2, v0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mNeedsToCleanUp:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    const-string v2, "WsSurfaceHolderCallback"

    const-string v3, "Couldn\'t call cleanup on workspace preview"

    .line 4
    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 5
    :goto_0
    iput-object v1, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mCallback:Landroid/os/Message;

    goto :goto_2

    :goto_1
    iput-object v1, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mCallback:Landroid/os/Message;

    .line 6
    throw v0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mRequestPending:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mNeedsToCleanUp:Z

    :cond_1
    :goto_2
    return-void
.end method

.method public final maybeRenderPreview()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mShouldUseWallpaperColors:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mIsWallpaperColorsReady:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mLastSurface:Landroid/view/Surface;

    if-nez v0, :cond_2

    :cond_1
    return-void

    .line 2
    :cond_2
    iget-object v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mRequestPending:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mWorkspaceSurface:Landroid/view/SurfaceView;

    new-instance v1, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;)V

    invoke-virtual {p0, v0, v1}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->requestPreview(Landroid/view/SurfaceView;Lcom/android/wallpaper/util/PreviewUtils$WorkspacePreviewCallback;)V

    return-void
.end method

.method public requestPreview(Landroid/view/SurfaceView;Lcom/android/wallpaper/util/PreviewUtils$WorkspacePreviewCallback;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getDisplay()Landroid/view/Display;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p0, "WsSurfaceHolderCallback"

    const-string p1, "No display ID, avoiding asking for workspace preview, lest WallpaperPicker crash"

    .line 2
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 3
    :cond_0
    invoke-static {p1}, Lcom/android/wallpaper/util/SurfaceViewUtils;->createSurfaceViewRequest(Landroid/view/SurfaceView;)Landroid/os/Bundle;

    move-result-object p1

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mWallpaperColors:Landroid/app/WallpaperColors;

    if-eqz v0, :cond_1

    const-string v1, "wallpaper_colors"

    .line 5
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 6
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    sget-object v0, Lcom/android/wallpaper/util/PreviewUtils;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/util/PreviewUtils;Landroid/os/Bundle;Lcom/android/wallpaper/util/PreviewUtils$WorkspacePreviewCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/util/PreviewUtils;->mProviderInfo:Landroid/content/pm/ProviderInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mLastSurface:Landroid/view/Surface;

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    if-eq v0, v1, :cond_1

    .line 4
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mLastSurface:Landroid/view/Surface;

    .line 5
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->maybeRenderPreview()V

    :cond_1
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method
