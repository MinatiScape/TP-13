.class public final synthetic Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/LivePreviewFragment;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7

    iget p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;->$r8$classId:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;

    sget-object p1, Lcom/android/wallpaper/picker/ImagePreviewFragment;->sExecutor:Ljava/util/concurrent/Executor;

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    if-eqz p0, :cond_1

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 3
    iget p1, p1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->state:I

    const/4 p2, 0x4

    if-ne p1, p2, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    if-nez p1, :cond_1

    .line 4
    invoke-virtual {p0}, Lcom/android/wallpaper/widget/BottomActionBar;->hideBottomSheetAndDeselectButtonIfExpanded()V

    move v0, v1

    :cond_1
    return v0

    .line 5
    :pswitch_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p1, :cond_4

    .line 7
    iget-object p1, p1, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    if-eqz p1, :cond_4

    .line 8
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    .line 9
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getWidth()I

    move-result p1

    int-to-float p1, p1

    iget-object v2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mScreenSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    div-float/2addr p1, v2

    .line 10
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-nez v2, :cond_2

    .line 11
    iget-object v3, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 12
    invoke-virtual {v3}, Lcom/android/wallpaper/widget/BottomActionBar;->hideBottomSheetAndDeselectButtonIfExpanded()V

    .line 13
    :cond_2
    invoke-static {p2}, Landroid/view/MotionEvent;->obtainNoHistory(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v3

    .line 14
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    div-float/2addr v4, p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    div-float/2addr v5, p1

    invoke-virtual {v3, v4, v5}, Landroid/view/MotionEvent;->setLocation(FF)V

    .line 15
    :try_start_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 16
    iget-object p1, p1, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    .line 17
    invoke-interface {p1, v3}, Landroid/service/wallpaper/IWallpaperEngine;->dispatchPointer(Landroid/view/MotionEvent;)V

    if-ne v2, v1, :cond_3

    .line 18
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 19
    iget-object v1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    const-string v2, "android.wallpaper.tap"

    .line 20
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p0

    float-to-int v3, p0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p0

    float-to-int v4, p0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 21
    invoke-interface/range {v1 .. v6}, Landroid/service/wallpaper/IWallpaperEngine;->dispatchWallpaperCommand(Ljava/lang/String;IIILandroid/os/Bundle;)V

    goto :goto_1

    :cond_3
    const/4 p1, 0x6

    if-ne v2, p1, :cond_4

    .line 22
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result p1

    .line 23
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 24
    iget-object v1, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;

    const-string v2, "android.wallpaper.secondaryTap"

    .line 25
    invoke-virtual {p2, p1}, Landroid/view/MotionEvent;->getX(I)F

    move-result p0

    float-to-int v3, p0

    invoke-virtual {p2, p1}, Landroid/view/MotionEvent;->getY(I)F

    move-result p0

    float-to-int v4, p0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 26
    invoke-interface/range {v1 .. v6}, Landroid/service/wallpaper/IWallpaperEngine;->dispatchWallpaperCommand(Ljava/lang/String;IIILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string p0, "LivePreviewFragment"

    const-string p1, "Remote exception of wallpaper connection"

    .line 27
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    :goto_1
    return v0

    .line 28
    :goto_2
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;

    sget p1, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->$r8$clinit:I

    .line 29
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-nez p1, :cond_5

    goto :goto_4

    .line 30
    :cond_5
    monitor-enter p1

    .line 31
    :try_start_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 32
    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mEngine:Landroid/service/wallpaper/IWallpaperEngine;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p0, :cond_6

    .line 33
    :try_start_2
    invoke-static {p2}, Landroid/view/MotionEvent;->obtainNoHistory(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p2

    invoke-interface {p0, p2}, Landroid/service/wallpaper/IWallpaperEngine;->dispatchPointer(Landroid/view/MotionEvent;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    :catch_1
    move-exception p0

    :try_start_3
    const-string p2, "MicropaperPreviewFragmentGoogle"

    const-string v0, "Could not communicate with Engine: "

    .line 34
    invoke-static {p2, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 35
    :goto_3
    monitor-exit p1

    move v0, v1

    goto :goto_4

    .line 36
    :cond_6
    monitor-exit p1

    :goto_4
    return v0

    :catchall_0
    move-exception p0

    .line 37
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
