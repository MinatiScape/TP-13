.class public Lcom/android/volley/CacheDispatcher;
.super Ljava/lang/Thread;
.source "SourceFile"


# static fields
.field public static final DEBUG:Z


# instance fields
.field public final mCache:Lcom/android/volley/Cache;

.field public final mCacheQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final mDelivery:Lcom/android/volley/ResponseDelivery;

.field public final mNetworkQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;"
        }
    .end annotation
.end field

.field public volatile mQuit:Z

.field public final mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/volley/VolleyLog;->DEBUG:Z

    sput-boolean v0, Lcom/android/volley/CacheDispatcher;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/BlockingQueue;Lcom/android/volley/Cache;Lcom/android/volley/ResponseDelivery;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;",
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;",
            "Lcom/android/volley/Cache;",
            "Lcom/android/volley/ResponseDelivery;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/volley/CacheDispatcher;->mQuit:Z

    .line 3
    iput-object p1, p0, Lcom/android/volley/CacheDispatcher;->mCacheQueue:Ljava/util/concurrent/BlockingQueue;

    .line 4
    iput-object p2, p0, Lcom/android/volley/CacheDispatcher;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    .line 5
    iput-object p3, p0, Lcom/android/volley/CacheDispatcher;->mCache:Lcom/android/volley/Cache;

    .line 6
    iput-object p4, p0, Lcom/android/volley/CacheDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    .line 7
    new-instance p1, Lcom/android/volley/WaitingRequestManager;

    invoke-direct {p1, p0, p2, p4}, Lcom/android/volley/WaitingRequestManager;-><init>(Lcom/android/volley/CacheDispatcher;Ljava/util/concurrent/BlockingQueue;Lcom/android/volley/ResponseDelivery;)V

    iput-object p1, p0, Lcom/android/volley/CacheDispatcher;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    return-void
.end method


# virtual methods
.method public processRequest(Lcom/android/volley/Request;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const-string v0, "cache-queue-take"

    .line 1
    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->sendEvent(I)V

    const/4 v1, 0x2

    .line 3
    :try_start_0
    invoke-virtual {p1}, Lcom/android/volley/Request;->isCanceled()Z

    .line 4
    iget-object v2, p0, Lcom/android/volley/CacheDispatcher;->mCache:Lcom/android/volley/Cache;

    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v3

    check-cast v2, Lcom/android/volley/toolbox/DiskBasedCache;

    invoke-virtual {v2, v3}, Lcom/android/volley/toolbox/DiskBasedCache;->get(Ljava/lang/String;)Lcom/android/volley/Cache$Entry;

    move-result-object v2

    if-nez v2, :cond_1

    const-string v0, "cache-miss"

    .line 5
    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 6
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v0, p1}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 7
    iget-object p0, p0, Lcom/android/volley/CacheDispatcher;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {p0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 8
    :cond_0
    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    return-void

    .line 9
    :cond_1
    :try_start_1
    iget-wide v3, v2, Lcom/android/volley/Cache$Entry;->ttl:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    cmp-long v3, v3, v5

    const/4 v4, 0x0

    if-gez v3, :cond_2

    move v3, v0

    goto :goto_0

    :cond_2
    move v3, v4

    :goto_0
    if-eqz v3, :cond_4

    const-string v0, "cache-hit-expired"

    .line 10
    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 11
    iput-object v2, p1, Lcom/android/volley/Request;->mCacheEntry:Lcom/android/volley/Cache$Entry;

    .line 12
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v0, p1}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 13
    iget-object p0, p0, Lcom/android/volley/CacheDispatcher;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {p0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 14
    :cond_3
    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    return-void

    :cond_4
    :try_start_2
    const-string v3, "cache-hit"

    .line 15
    invoke-virtual {p1, v3}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 16
    new-instance v3, Lcom/android/volley/NetworkResponse;

    iget-object v5, v2, Lcom/android/volley/Cache$Entry;->data:[B

    iget-object v6, v2, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    invoke-direct {v3, v5, v6}, Lcom/android/volley/NetworkResponse;-><init>([BLjava/util/Map;)V

    .line 17
    invoke-virtual {p1, v3}, Lcom/android/volley/Request;->parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;

    move-result-object v3

    const-string v5, "cache-hit-parsed"

    .line 18
    invoke-virtual {p1, v5}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 19
    iget-object v5, v3, Lcom/android/volley/Response;->error:Lcom/android/volley/VolleyError;

    if-nez v5, :cond_5

    move v5, v0

    goto :goto_1

    :cond_5
    move v5, v4

    :goto_1
    const/4 v6, 0x0

    if-nez v5, :cond_8

    const-string v0, "cache-parsing-failed"

    .line 20
    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 21
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mCache:Lcom/android/volley/Cache;

    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v2

    check-cast v0, Lcom/android/volley/toolbox/DiskBasedCache;

    .line 22
    monitor-enter v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 23
    :try_start_3
    invoke-virtual {v0, v2}, Lcom/android/volley/toolbox/DiskBasedCache;->get(Ljava/lang/String;)Lcom/android/volley/Cache$Entry;

    move-result-object v3

    if-eqz v3, :cond_6

    const-wide/16 v4, 0x0

    .line 24
    iput-wide v4, v3, Lcom/android/volley/Cache$Entry;->softTtl:J

    .line 25
    iput-wide v4, v3, Lcom/android/volley/Cache$Entry;->ttl:J

    .line 26
    invoke-virtual {v0, v2, v3}, Lcom/android/volley/toolbox/DiskBasedCache;->put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 27
    :cond_6
    :try_start_4
    monitor-exit v0

    .line 28
    iput-object v6, p1, Lcom/android/volley/Request;->mCacheEntry:Lcom/android/volley/Cache$Entry;

    .line 29
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v0, p1}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 30
    iget-object p0, p0, Lcom/android/volley/CacheDispatcher;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {p0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 31
    :cond_7
    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    return-void

    :catchall_0
    move-exception p0

    .line 32
    :try_start_5
    monitor-exit v0

    throw p0

    .line 33
    :cond_8
    iget-wide v7, v2, Lcom/android/volley/Cache$Entry;->softTtl:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    cmp-long v5, v7, v9

    if-gez v5, :cond_9

    move v4, v0

    :cond_9
    if-nez v4, :cond_a

    .line 34
    iget-object p0, p0, Lcom/android/volley/CacheDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    check-cast p0, Lcom/android/volley/ExecutorDelivery;

    .line 35
    invoke-virtual {p0, p1, v3, v6}, Lcom/android/volley/ExecutorDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V

    goto :goto_2

    :cond_a
    const-string v4, "cache-hit-refresh-needed"

    .line 36
    invoke-virtual {p1, v4}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 37
    iput-object v2, p1, Lcom/android/volley/Request;->mCacheEntry:Lcom/android/volley/Cache$Entry;

    .line 38
    iput-boolean v0, v3, Lcom/android/volley/Response;->intermediate:Z

    .line 39
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v0, p1}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 40
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    new-instance v2, Lcom/android/volley/CacheDispatcher$1;

    invoke-direct {v2, p0, p1}, Lcom/android/volley/CacheDispatcher$1;-><init>(Lcom/android/volley/CacheDispatcher;Lcom/android/volley/Request;)V

    check-cast v0, Lcom/android/volley/ExecutorDelivery;

    invoke-virtual {v0, p1, v3, v2}, Lcom/android/volley/ExecutorDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V

    goto :goto_2

    .line 41
    :cond_b
    iget-object p0, p0, Lcom/android/volley/CacheDispatcher;->mDelivery:Lcom/android/volley/ResponseDelivery;

    check-cast p0, Lcom/android/volley/ExecutorDelivery;

    .line 42
    invoke-virtual {p0, p1, v3, v6}, Lcom/android/volley/ExecutorDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 43
    :goto_2
    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    return-void

    :catchall_1
    move-exception p0

    invoke-virtual {p1, v1}, Lcom/android/volley/Request;->sendEvent(I)V

    .line 44
    throw p0
.end method

.method public run()V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/android/volley/CacheDispatcher;->DEBUG:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    new-array v0, v1, [Ljava/lang/Object;

    const-string v2, "start new dispatcher"

    invoke-static {v2, v0}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    const/16 v0, 0xa

    .line 2
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 3
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mCache:Lcom/android/volley/Cache;

    check-cast v0, Lcom/android/volley/toolbox/DiskBasedCache;

    invoke-virtual {v0}, Lcom/android/volley/toolbox/DiskBasedCache;->initialize()V

    .line 4
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/volley/CacheDispatcher;->mCacheQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/Request;

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/volley/CacheDispatcher;->processRequest(Lcom/android/volley/Request;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 6
    :catch_0
    iget-boolean v0, p0, Lcom/android/volley/CacheDispatcher;->mQuit:Z

    if-eqz v0, :cond_1

    .line 7
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    return-void

    :cond_1
    new-array v0, v1, [Ljava/lang/Object;

    const-string v2, "Ignoring spurious interrupt of CacheDispatcher thread; use quit() to terminate it"

    .line 8
    invoke-static {v2, v0}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method
