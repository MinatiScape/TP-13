.class public Lcom/android/volley/NetworkDispatcher;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public final mCache:Lcom/android/volley/Cache;

.field public final mDelivery:Lcom/android/volley/ResponseDelivery;

.field public final mNetwork:Lcom/android/volley/Network;

.field public final mQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;"
        }
    .end annotation
.end field

.field public volatile mQuit:Z


# direct methods
.method public constructor <init>(Ljava/util/concurrent/BlockingQueue;Lcom/android/volley/Network;Lcom/android/volley/Cache;Lcom/android/volley/ResponseDelivery;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;",
            "Lcom/android/volley/Network;",
            "Lcom/android/volley/Cache;",
            "Lcom/android/volley/ResponseDelivery;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/volley/NetworkDispatcher;->mQuit:Z

    .line 3
    iput-object p1, p0, Lcom/android/volley/NetworkDispatcher;->mQueue:Ljava/util/concurrent/BlockingQueue;

    .line 4
    iput-object p2, p0, Lcom/android/volley/NetworkDispatcher;->mNetwork:Lcom/android/volley/Network;

    .line 5
    iput-object p3, p0, Lcom/android/volley/NetworkDispatcher;->mCache:Lcom/android/volley/Cache;

    .line 6
    iput-object p4, p0, Lcom/android/volley/NetworkDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    return-void
.end method


# virtual methods
.method public processRequest(Lcom/android/volley/Request;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    const-string v0, "post-error"

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    const/4 v3, 0x3

    .line 2
    invoke-virtual {p1, v3}, Lcom/android/volley/Request;->sendEvent(I)V

    const/4 v3, 0x0

    const/4 v4, 0x4

    :try_start_0
    const-string v5, "network-queue-take"

    .line 3
    invoke-virtual {p1, v5}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 4
    invoke-virtual {p1}, Lcom/android/volley/Request;->isCanceled()Z

    .line 5
    iget v5, p1, Lcom/android/volley/Request;->mDefaultTrafficStatsTag:I

    .line 6
    invoke-static {v5}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 7
    iget-object v5, p0, Lcom/android/volley/NetworkDispatcher;->mNetwork:Lcom/android/volley/Network;

    check-cast v5, Lcom/android/volley/toolbox/BasicNetwork;

    invoke-virtual {v5, p1}, Lcom/android/volley/toolbox/BasicNetwork;->performRequest(Lcom/android/volley/Request;)Lcom/android/volley/NetworkResponse;

    move-result-object v5

    const-string v6, "network-http-complete"

    .line 8
    invoke-virtual {p1, v6}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 9
    iget-boolean v6, v5, Lcom/android/volley/NetworkResponse;->notModified:Z

    if-eqz v6, :cond_0

    invoke-virtual {p1}, Lcom/android/volley/Request;->hasHadResponseDelivered()Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v5, "not-modified"

    .line 10
    invoke-virtual {p1, v5}, Lcom/android/volley/Request;->finish(Ljava/lang/String;)V

    .line 11
    invoke-virtual {p1}, Lcom/android/volley/Request;->notifyListenerResponseNotUsable()V
    :try_end_0
    .catch Lcom/android/volley/VolleyError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    invoke-virtual {p1, v4}, Lcom/android/volley/Request;->sendEvent(I)V

    return-void

    .line 13
    :cond_0
    :try_start_1
    invoke-virtual {p1, v5}, Lcom/android/volley/Request;->parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;

    move-result-object v5

    const-string v6, "network-parse-complete"

    .line 14
    invoke-virtual {p1, v6}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 15
    iget-boolean v6, p1, Lcom/android/volley/Request;->mShouldCache:Z

    if-eqz v6, :cond_1

    .line 16
    iget-object v6, v5, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    if-eqz v6, :cond_1

    .line 17
    iget-object v6, p0, Lcom/android/volley/NetworkDispatcher;->mCache:Lcom/android/volley/Cache;

    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v5, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    check-cast v6, Lcom/android/volley/toolbox/DiskBasedCache;

    invoke-virtual {v6, v7, v8}, Lcom/android/volley/toolbox/DiskBasedCache;->put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V

    const-string v6, "network-cache-written"

    .line 18
    invoke-virtual {p1, v6}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 19
    :cond_1
    invoke-virtual {p1}, Lcom/android/volley/Request;->markDelivered()V

    .line 20
    iget-object v6, p0, Lcom/android/volley/NetworkDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    check-cast v6, Lcom/android/volley/ExecutorDelivery;

    .line 21
    invoke-virtual {v6, p1, v5, v3}, Lcom/android/volley/ExecutorDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V

    .line 22
    invoke-virtual {p1, v5}, Lcom/android/volley/Request;->notifyListenerResponseReceived(Lcom/android/volley/Response;)V
    :try_end_1
    .catch Lcom/android/volley/VolleyError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception v5

    :try_start_2
    const-string v6, "Unhandled exception %s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    .line 23
    invoke-virtual {v5}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    .line 24
    invoke-static {v6, v7}, Lcom/android/volley/VolleyLog;->buildMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "Volley"

    invoke-static {v7, v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    new-instance v6, Lcom/android/volley/VolleyError;

    invoke-direct {v6, v5}, Lcom/android/volley/VolleyError;-><init>(Ljava/lang/Throwable;)V

    .line 26
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long/2addr v7, v1

    invoke-virtual {v6, v7, v8}, Lcom/android/volley/VolleyError;->setNetworkTimeMs(J)V

    .line 27
    iget-object p0, p0, Lcom/android/volley/NetworkDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    check-cast p0, Lcom/android/volley/ExecutorDelivery;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 29
    new-instance v0, Lcom/android/volley/Response;

    invoke-direct {v0, v6}, Lcom/android/volley/Response;-><init>(Lcom/android/volley/VolleyError;)V

    .line 30
    iget-object p0, p0, Lcom/android/volley/ExecutorDelivery;->mResponsePoster:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/android/volley/ExecutorDelivery$ResponseDeliveryRunnable;

    invoke-direct {v1, p1, v0, v3}, Lcom/android/volley/ExecutorDelivery$ResponseDeliveryRunnable;-><init>(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V

    invoke-interface {p0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 31
    invoke-virtual {p1}, Lcom/android/volley/Request;->notifyListenerResponseNotUsable()V

    goto :goto_0

    :catch_1
    move-exception v5

    .line 32
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long/2addr v6, v1

    invoke-virtual {v5, v6, v7}, Lcom/android/volley/VolleyError;->setNetworkTimeMs(J)V

    .line 33
    iget-object p0, p0, Lcom/android/volley/NetworkDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    check-cast p0, Lcom/android/volley/ExecutorDelivery;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 35
    new-instance v0, Lcom/android/volley/Response;

    invoke-direct {v0, v5}, Lcom/android/volley/Response;-><init>(Lcom/android/volley/VolleyError;)V

    .line 36
    iget-object p0, p0, Lcom/android/volley/ExecutorDelivery;->mResponsePoster:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/android/volley/ExecutorDelivery$ResponseDeliveryRunnable;

    invoke-direct {v1, p1, v0, v3}, Lcom/android/volley/ExecutorDelivery$ResponseDeliveryRunnable;-><init>(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V

    invoke-interface {p0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 37
    invoke-virtual {p1}, Lcom/android/volley/Request;->notifyListenerResponseNotUsable()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 38
    :goto_0
    invoke-virtual {p1, v4}, Lcom/android/volley/Request;->sendEvent(I)V

    return-void

    :goto_1
    invoke-virtual {p1, v4}, Lcom/android/volley/Request;->sendEvent(I)V

    .line 39
    throw p0
.end method

.method public run()V
    .locals 2

    const/16 v0, 0xa

    .line 1
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 2
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/volley/NetworkDispatcher;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/Request;

    .line 3
    invoke-virtual {p0, v0}, Lcom/android/volley/NetworkDispatcher;->processRequest(Lcom/android/volley/Request;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 4
    :catch_0
    iget-boolean v0, p0, Lcom/android/volley/NetworkDispatcher;->mQuit:Z

    if-eqz v0, :cond_0

    .line 5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    return-void

    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Ignoring spurious interrupt of NetworkDispatcher thread; use quit() to terminate it"

    .line 6
    invoke-static {v1, v0}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method
