.class public Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;
.super Landroid/window/IRemoteTransition$Stub;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/shared/system/RemoteTransitionCompat;-><init>(Lcom/android/systemui/shared/system/RemoteTransitionRunner;Ljava/util/concurrent/Executor;Landroid/app/IApplicationThread;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/systemui/shared/system/RemoteTransitionCompat;

.field public final synthetic val$executor:Ljava/util/concurrent/Executor;

.field public final synthetic val$runner:Lcom/android/systemui/shared/system/RemoteTransitionRunner;


# direct methods
.method public static synthetic $r8$lambda$4bGfLVj4G1PZG6H5jtGC-YBezCc(Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 0

    invoke-static {p0}, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->lambda$startAnimation$0(Landroid/window/IRemoteTransitionFinishedCallback;)V

    return-void
.end method

.method public static synthetic $r8$lambda$aP60ABl4T7pZOMUM80gsj4ATUEI(Lcom/android/systemui/shared/system/RemoteTransitionRunner;Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/os/IBinder;Ljava/lang/Runnable;)V
    .locals 0

    invoke-static/range {p0 .. p5}, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->lambda$mergeAnimation$3(Lcom/android/systemui/shared/system/RemoteTransitionRunner;Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/os/IBinder;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic $r8$lambda$hsPmf7vBlVPyR7fn8VTjavmbzl0(Lcom/android/systemui/shared/system/RemoteTransitionRunner;Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->lambda$startAnimation$1(Lcom/android/systemui/shared/system/RemoteTransitionRunner;Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic $r8$lambda$jwJx2V1LAn-ejviZsZXR1iMLhUc(Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 0

    invoke-static {p0}, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->lambda$mergeAnimation$2(Landroid/window/IRemoteTransitionFinishedCallback;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/systemui/shared/system/RemoteTransitionCompat;Ljava/util/concurrent/Executor;Lcom/android/systemui/shared/system/RemoteTransitionRunner;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->this$0:Lcom/android/systemui/shared/system/RemoteTransitionCompat;

    iput-object p2, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->val$executor:Ljava/util/concurrent/Executor;

    iput-object p3, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->val$runner:Lcom/android/systemui/shared/system/RemoteTransitionRunner;

    invoke-direct {p0}, Landroid/window/IRemoteTransition$Stub;-><init>()V

    return-void
.end method

.method private static synthetic lambda$mergeAnimation$2(Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 2

    const/4 v0, 0x0

    .line 1
    :try_start_0
    invoke-interface {p0, v0, v0}, Landroid/window/IRemoteTransitionFinishedCallback;->onTransitionFinished(Landroid/window/WindowContainerTransaction;Landroid/view/SurfaceControl$Transaction;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "RemoteTransitionCompat"

    const-string v1, "Failed to call transition finished callback"

    .line 2
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method private static synthetic lambda$mergeAnimation$3(Lcom/android/systemui/shared/system/RemoteTransitionRunner;Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/os/IBinder;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface/range {p0 .. p5}, Lcom/android/systemui/shared/system/RemoteTransitionRunner;->mergeAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/os/IBinder;Ljava/lang/Runnable;)V

    return-void
.end method

.method private static synthetic lambda$startAnimation$0(Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 2

    const/4 v0, 0x0

    .line 1
    :try_start_0
    invoke-interface {p0, v0, v0}, Landroid/window/IRemoteTransitionFinishedCallback;->onTransitionFinished(Landroid/window/WindowContainerTransaction;Landroid/view/SurfaceControl$Transaction;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "RemoteTransitionCompat"

    const-string v1, "Failed to call transition finished callback"

    .line 2
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method private static synthetic lambda$startAnimation$1(Lcom/android/systemui/shared/system/RemoteTransitionRunner;Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/android/systemui/shared/system/RemoteTransitionRunner;->startAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public mergeAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/os/IBinder;Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 7

    .line 1
    new-instance v6, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda0;

    const/4 v0, 0x0

    invoke-direct {v6, p5, v0}, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda0;-><init>(Landroid/window/IRemoteTransitionFinishedCallback;I)V

    .line 2
    iget-object p5, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->val$executor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->val$runner:Lcom/android/systemui/shared/system/RemoteTransitionRunner;

    new-instance p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda1;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda1;-><init>(Lcom/android/systemui/shared/system/RemoteTransitionRunner;Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/os/IBinder;Ljava/lang/Runnable;)V

    invoke-interface {p5, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public startAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 6

    .line 1
    new-instance v5, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda0;

    const/4 v0, 0x1

    invoke-direct {v5, p4, v0}, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda0;-><init>(Landroid/window/IRemoteTransitionFinishedCallback;I)V

    .line 2
    iget-object p4, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->val$executor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1;->val$runner:Lcom/android/systemui/shared/system/RemoteTransitionRunner;

    new-instance p0, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda2;

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/systemui/shared/system/RemoteTransitionCompat$1$$ExternalSyntheticLambda2;-><init>(Lcom/android/systemui/shared/system/RemoteTransitionRunner;Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V

    invoke-interface {p4, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
