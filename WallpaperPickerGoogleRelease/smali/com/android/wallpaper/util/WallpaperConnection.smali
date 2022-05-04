.class public Lcom/android/wallpaper/util/WallpaperConnection;
.super Landroid/service/wallpaper/IWallpaperConnection$Stub;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;
    }
.end annotation


# instance fields
.field public mConnected:Z

.field public final mContainerView:Landroid/view/SurfaceView;

.field public final mContext:Landroid/content/Context;

.field public mEngine:Landroid/service/wallpaper/IWallpaperEngine;

.field public mEngineReady:Z

.field public final mIntent:Landroid/content/Intent;

.field public mIsEngineVisible:Z

.field public mIsVisible:Z

.field public final mListener:Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;

.field public final mSecondContainerView:Landroid/view/SurfaceView;

.field public mService:Landroid/service/wallpaper/IWallpaperService;


# direct methods
.method public constructor <init>(Landroid/content/Intent;Landroid/content/Context;Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;Landroid/view/SurfaceView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/service/wallpaper/IWallpaperConnection$Stub;-><init>()V

    .line 2
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContext:Landroid/content/Context;

    .line 3
    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIntent:Landroid/content/Intent;

    .line 4
    iput-object p3, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mListener:Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;

    .line 5
    iput-object p4, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mSecondContainerView:Landroid/view/SurfaceView;

    return-void
.end method

.method public constructor <init>(Landroid/content/Intent;Landroid/content/Context;Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;Landroid/view/SurfaceView;Landroid/view/SurfaceView;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Landroid/service/wallpaper/IWallpaperConnection$Stub;-><init>()V

    .line 8
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContext:Landroid/content/Context;

    .line 9
    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIntent:Landroid/content/Intent;

    .line 10
    iput-object p3, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mListener:Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;

    .line 11
    iput-object p4, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    .line 12
    iput-object p5, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mSecondContainerView:Landroid/view/SurfaceView;

    return-void
.end method

.method public static isPreviewAvailable()Z
    .locals 4

    const/4 v0, 0x0

    .line 1
    :try_start_0
    const-class v1, Landroid/service/wallpaper/IWallpaperEngine;

    const-string v2, "mirrorSurfaceControl"

    new-array v3, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :catch_0
    :cond_0
    return v0
.end method


# virtual methods
.method public attachEngine(Landroid/service/wallpaper/IWallpaperEngine;I)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean p2, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mConnected:Z

    if-eqz p2, :cond_1

    .line 3
    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    .line 4
    iget-boolean p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/util/WallpaperConnection;->setEngineVisibility(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    :cond_0
    :try_start_1
    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    invoke-interface {p1}, Landroid/service/wallpaper/IWallpaperEngine;->requestWallpaperColors()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "WallpaperConnection"

    const-string v0, "Failed requesting wallpaper colors"

    .line 7
    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 8
    :cond_1
    :try_start_3
    invoke-interface {p1}, Landroid/service/wallpaper/IWallpaperEngine;->destroy()V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 9
    :catch_1
    :goto_0
    :try_start_4
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p1
.end method

.method public connect()Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mConnected:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 3
    monitor-exit p0

    return v1

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIntent:Landroid/content/Intent;

    const/16 v3, 0x41

    invoke-virtual {v0, v2, p0, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 5
    monitor-exit p0

    return v0

    .line 6
    :cond_1
    iput-boolean v1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mConnected:Z

    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mListener:Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;

    if-eqz p0, :cond_2

    .line 9
    invoke-interface {p0}, Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;->onConnected()V

    :cond_2
    return v1

    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public disconnect()V
    .locals 3

    .line 1
    monitor-enter p0

    const/4 v0, 0x0

    .line 2
    :try_start_0
    iput-boolean v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mConnected:Z

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 4
    :try_start_1
    invoke-interface {v0}, Landroid/service/wallpaper/IWallpaperEngine;->destroy()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 5
    :catch_0
    :try_start_2
    iput-object v1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 6
    :cond_0
    :try_start_3
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :catch_1
    :try_start_4
    const-string v0, "WallpaperConnection"

    const-string v2, "Can\'t unbind wallpaper service. It might have crashed, just ignoring."

    .line 7
    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    :goto_0
    iput-object v1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mService:Landroid/service/wallpaper/IWallpaperService;

    .line 9
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 10
    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mListener:Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;

    if-eqz p0, :cond_1

    .line 11
    invoke-interface {p0}, Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;->onDisconnected()V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    .line 12
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v0
.end method

.method public engineShown(Landroid/service/wallpaper/IWallpaperEngine;)V
    .locals 3

    const/4 p1, 0x1

    .line 1
    iput-boolean p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngineReady:Z

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    .line 3
    new-instance v1, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/util/WallpaperConnection;I)V

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->post(Ljava/lang/Runnable;)Z

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mSecondContainerView:Landroid/view/SurfaceView;

    if-eqz v0, :cond_1

    .line 5
    new-instance v1, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/util/WallpaperConnection;I)V

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->post(Ljava/lang/Runnable;)Z

    .line 6
    :cond_1
    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    new-instance v0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/util/WallpaperConnection;I)V

    invoke-virtual {p1, v0}, Landroid/view/SurfaceView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final getScale(Landroid/view/SurfaceView;)[F
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    const/16 v1, 0x9

    new-array v1, v1, [F

    .line 2
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object p1

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/zzfit;->getInstance()Lcom/google/android/gms/internal/zzfit;

    move-result-object v2

    iget-object v3, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    .line 4
    invoke-virtual {v3}, Landroid/view/SurfaceView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    invoke-virtual {p0}, Landroid/view/SurfaceView;->getDisplay()Landroid/view/Display;

    move-result-object p0

    .line 5
    invoke-virtual {v2, v3, p0}, Lcom/google/android/gms/internal/zzfit;->getDisplayMetrics(Landroid/content/res/Resources;Landroid/view/Display;)Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    .line 7
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-float p1, p1

    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p0, p0

    div-float/2addr p1, p0

    .line 8
    invoke-virtual {v0, v2, p1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    return-object v1
.end method

.method public final mirrorAndReparent(Landroid/view/SurfaceView;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    const-string v1, "WallpaperConnection"

    if-nez v0, :cond_0

    const-string p0, "Engine is null, was the service disconnected?"

    .line 2
    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 3
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getSurfaceControl()Landroid/view/SurfaceControl;

    move-result-object v0

    .line 4
    iget-object v2, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    invoke-interface {v2}, Landroid/service/wallpaper/IWallpaperEngine;->mirrorSurfaceControl()Landroid/view/SurfaceControl;

    move-result-object v2

    if-nez v2, :cond_1

    return-void

    .line 5
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/util/WallpaperConnection;->getScale(Landroid/view/SurfaceView;)[F

    move-result-object p0

    .line 6
    new-instance p1, Landroid/view/SurfaceControl$Transaction;

    invoke-direct {p1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    const/4 v3, 0x0

    .line 7
    aget v5, p0, v3

    const/4 v3, 0x3

    aget v6, p0, v3

    const/4 v3, 0x1

    aget v7, p0, v3

    const/4 v3, 0x4

    aget v8, p0, v3

    move-object v3, p1

    move-object v4, v2

    invoke-virtual/range {v3 .. v8}, Landroid/view/SurfaceControl$Transaction;->setMatrix(Landroid/view/SurfaceControl;FFFF)Landroid/view/SurfaceControl$Transaction;

    .line 8
    invoke-virtual {p1, v2, v0}, Landroid/view/SurfaceControl$Transaction;->reparent(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 9
    invoke-virtual {p1, v2}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 10
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->apply()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "Couldn\'t reparent wallpaper surface"

    .line 11
    invoke-static {v1, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public onLocalWallpaperColorsChanged(Landroid/graphics/RectF;Landroid/app/WallpaperColors;I)V
    .locals 0

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 9

    .line 1
    invoke-static {p2}, Landroid/service/wallpaper/IWallpaperService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/service/wallpaper/IWallpaperService;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mService:Landroid/service/wallpaper/IWallpaperService;

    .line 2
    :try_start_0
    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    move-result v8

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mService:Landroid/service/wallpaper/IWallpaperService;

    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/16 v3, 0x3e9

    const/4 v4, 0x1

    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    .line 4
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getWidth()I

    move-result v5

    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHeight()I

    move-result v6

    new-instance v7, Landroid/graphics/Rect;

    const/4 p1, 0x0

    invoke-direct {v7, p1, p1, p1, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v1, p0

    .line 5
    invoke-interface/range {v0 .. v8}, Landroid/service/wallpaper/IWallpaperService;->attach(Landroid/service/wallpaper/IWallpaperConnection;Landroid/os/IBinder;IZIILandroid/graphics/Rect;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "WallpaperConnection"

    const-string p2, "Failed attaching wallpaper; clearing"

    .line 6
    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mService:Landroid/service/wallpaper/IWallpaperService;

    .line 2
    iput-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Wallpaper service gone: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "WallpaperConnection"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onWallpaperColorsChanged(Landroid/app/WallpaperColors;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    new-instance v1, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/util/WallpaperConnection;Landroid/app/WallpaperColors;I)V

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final reparentWallpaperSurface(Landroid/view/SurfaceView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    const-string v1, "WallpaperConnection"

    if-nez v0, :cond_0

    const-string p0, "Engine is null, was the service disconnected?"

    .line 2
    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 3
    :cond_0
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getSurfaceControl()Landroid/view/SurfaceControl;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/util/WallpaperConnection;->mirrorAndReparent(Landroid/view/SurfaceView;)V

    goto :goto_0

    :cond_1
    const-string v0, "SurfaceView not initialized yet, adding callback"

    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    new-instance v1, Lcom/android/wallpaper/util/WallpaperConnection$1;

    invoke-direct {v1, p0, p1}, Lcom/android/wallpaper/util/WallpaperConnection$1;-><init>(Lcom/android/wallpaper/util/WallpaperConnection;Landroid/view/SurfaceView;)V

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    :goto_0
    return-void
.end method

.method public final setEngineVisibility(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIsEngineVisible:Z

    if-eq p1, v1, :cond_0

    .line 2
    :try_start_0
    invoke-interface {v0, p1}, Landroid/service/wallpaper/IWallpaperEngine;->setVisibility(Z)V

    .line 3
    iput-boolean p1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIsEngineVisible:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "WallpaperConnection"

    const-string v0, "Failure setting wallpaper visibility "

    .line 4
    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public setWallpaper(Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method
