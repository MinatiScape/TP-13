.class public Lcom/android/volley/ExecutorDelivery;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/volley/ResponseDelivery;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/ExecutorDelivery$ResponseDeliveryRunnable;
    }
.end annotation


# instance fields
.field public final mResponsePoster:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/android/volley/ExecutorDelivery$1;

    invoke-direct {v0, p0, p1}, Lcom/android/volley/ExecutorDelivery$1;-><init>(Lcom/android/volley/ExecutorDelivery;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/volley/ExecutorDelivery;->mResponsePoster:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method public postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/Response<",
            "*>;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/android/volley/Request;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    .line 2
    :try_start_0
    iput-boolean v1, p1, Lcom/android/volley/Request;->mResponseDelivered:Z

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v0, "post-response"

    .line 4
    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 5
    iget-object p0, p0, Lcom/android/volley/ExecutorDelivery;->mResponsePoster:Ljava/util/concurrent/Executor;

    new-instance v0, Lcom/android/volley/ExecutorDelivery$ResponseDeliveryRunnable;

    invoke-direct {v0, p1, p2, p3}, Lcom/android/volley/ExecutorDelivery$ResponseDeliveryRunnable;-><init>(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p0

    .line 6
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
