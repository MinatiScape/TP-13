.class public abstract Lcom/android/volley/Request;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/Request$Priority;,
        Lcom/android/volley/Request$NetworkRequestCompleteListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/android/volley/Request<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field public mCacheEntry:Lcom/android/volley/Cache$Entry;

.field public final mDefaultTrafficStatsTag:I

.field public mErrorListener:Lcom/android/volley/Response$ErrorListener;

.field public final mEventLog:Lcom/android/volley/VolleyLog$MarkerLog;

.field public final mLock:Ljava/lang/Object;

.field public final mMethod:I

.field public mRequestCompleteListener:Lcom/android/volley/Request$NetworkRequestCompleteListener;

.field public mRequestQueue:Lcom/android/volley/RequestQueue;

.field public mResponseDelivered:Z

.field public mRetryPolicy:Lcom/android/volley/DefaultRetryPolicy;

.field public mSequence:Ljava/lang/Integer;

.field public mShouldCache:Z

.field public final mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/android/volley/Response$ErrorListener;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget-boolean v0, Lcom/android/volley/VolleyLog$MarkerLog;->ENABLED:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/android/volley/VolleyLog$MarkerLog;

    invoke-direct {v0}, Lcom/android/volley/VolleyLog$MarkerLog;-><init>()V

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    iput-object v0, p0, Lcom/android/volley/Request;->mEventLog:Lcom/android/volley/VolleyLog$MarkerLog;

    .line 3
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/volley/Request;->mLock:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/android/volley/Request;->mShouldCache:Z

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/volley/Request;->mResponseDelivered:Z

    .line 6
    iput-object v1, p0, Lcom/android/volley/Request;->mCacheEntry:Lcom/android/volley/Cache$Entry;

    .line 7
    iput p1, p0, Lcom/android/volley/Request;->mMethod:I

    .line 8
    iput-object p2, p0, Lcom/android/volley/Request;->mUrl:Ljava/lang/String;

    .line 9
    iput-object p3, p0, Lcom/android/volley/Request;->mErrorListener:Lcom/android/volley/Response$ErrorListener;

    .line 10
    new-instance p1, Lcom/android/volley/DefaultRetryPolicy;

    invoke-direct {p1}, Lcom/android/volley/DefaultRetryPolicy;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/android/volley/Request;->mRetryPolicy:Lcom/android/volley/DefaultRetryPolicy;

    .line 12
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 13
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 14
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 16
    :cond_1
    iput v0, p0, Lcom/android/volley/Request;->mDefaultTrafficStatsTag:I

    return-void
.end method


# virtual methods
.method public addMarker(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/android/volley/VolleyLog$MarkerLog;->ENABLED:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/volley/Request;->mEventLog:Lcom/android/volley/VolleyLog$MarkerLog;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/volley/VolleyLog$MarkerLog;->add(Ljava/lang/String;J)V

    :cond_0
    return-void
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/android/volley/Request;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-object p0, p0, Lcom/android/volley/Request;->mSequence:Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    iget-object p1, p1, Lcom/android/volley/Request;->mSequence:Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sub-int/2addr p0, p1

    return p0
.end method

.method public deliverError(Lcom/android/volley/VolleyError;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/volley/Request;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/android/volley/Request;->mErrorListener:Lcom/android/volley/Response$ErrorListener;

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    .line 4
    invoke-interface {p0, p1}, Lcom/android/volley/Response$ErrorListener;->onErrorResponse(Lcom/android/volley/VolleyError;)V

    :cond_0
    return-void

    :catchall_0
    move-exception p0

    .line 5
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public abstract deliverResponse(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public finish(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/volley/Request;->mRequestQueue:Lcom/android/volley/RequestQueue;

    if-eqz v0, :cond_1

    .line 2
    iget-object v1, v0, Lcom/android/volley/RequestQueue;->mCurrentRequests:Ljava/util/Set;

    monitor-enter v1

    .line 3
    :try_start_0
    iget-object v2, v0, Lcom/android/volley/RequestQueue;->mCurrentRequests:Ljava/util/Set;

    invoke-interface {v2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 4
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    iget-object v2, v0, Lcom/android/volley/RequestQueue;->mFinishedListeners:Ljava/util/List;

    monitor-enter v2

    .line 6
    :try_start_1
    iget-object v1, v0, Lcom/android/volley/RequestQueue;->mFinishedListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/volley/RequestQueue$RequestFinishedListener;

    .line 7
    invoke-interface {v3, p0}, Lcom/android/volley/RequestQueue$RequestFinishedListener;->onRequestFinished(Lcom/android/volley/Request;)V

    goto :goto_0

    .line 8
    :cond_0
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v1, 0x5

    .line 9
    invoke-virtual {v0, p0, v1}, Lcom/android/volley/RequestQueue;->sendRequestEvent(Lcom/android/volley/Request;I)V

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 10
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :catchall_1
    move-exception p0

    .line 11
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p0

    .line 12
    :cond_1
    :goto_1
    sget-boolean v0, Lcom/android/volley/VolleyLog$MarkerLog;->ENABLED:Z

    if-eqz v0, :cond_3

    .line 13
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    .line 14
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    if-eq v2, v3, :cond_2

    .line 15
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 16
    new-instance v3, Lcom/android/volley/Request$1;

    invoke-direct {v3, p0, p1, v0, v1}, Lcom/android/volley/Request$1;-><init>(Lcom/android/volley/Request;Ljava/lang/String;J)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 17
    :cond_2
    iget-object v2, p0, Lcom/android/volley/Request;->mEventLog:Lcom/android/volley/VolleyLog$MarkerLog;

    invoke-virtual {v2, p1, v0, v1}, Lcom/android/volley/VolleyLog$MarkerLog;->add(Ljava/lang/String;J)V

    .line 18
    iget-object p1, p0, Lcom/android/volley/Request;->mEventLog:Lcom/android/volley/VolleyLog$MarkerLog;

    invoke-virtual {p0}, Lcom/android/volley/Request;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/android/volley/VolleyLog$MarkerLog;->finish(Ljava/lang/String;)V

    :cond_3
    return-void
.end method

.method public getBody()[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getBodyContentType()Ljava/lang/String;
    .locals 0

    const-string p0, "application/x-www-form-urlencoded; charset=UTF-8"

    return-object p0
.end method

.method public getCacheKey()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/volley/Request;->mUrl:Ljava/lang/String;

    .line 2
    iget p0, p0, Lcom/android/volley/Request;->mMethod:I

    if-eqz p0, :cond_1

    const/4 v1, -0x1

    if-ne p0, v1, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x2d

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    return-object v0
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public hasHadResponseDelivered()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/volley/Request;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget-boolean p0, p0, Lcom/android/volley/Request;->mResponseDelivered:Z

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public isCanceled()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/volley/Request;->mLock:Ljava/lang/Object;

    monitor-enter p0

    const/4 v0, 0x0

    .line 2
    :try_start_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public markDelivered()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/volley/Request;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    .line 2
    :try_start_0
    iput-boolean v1, p0, Lcom/android/volley/Request;->mResponseDelivered:Z

    .line 3
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public notifyListenerResponseNotUsable()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/volley/Request;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/android/volley/Request;->mRequestCompleteListener:Lcom/android/volley/Request$NetworkRequestCompleteListener;

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 4
    check-cast v1, Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {v1, p0}, Lcom/android/volley/WaitingRequestManager;->onNoUsableResponseReceived(Lcom/android/volley/Request;)V

    :cond_0
    return-void

    :catchall_0
    move-exception p0

    .line 5
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public notifyListenerResponseReceived(Lcom/android/volley/Response;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Response<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/volley/Request;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/android/volley/Request;->mRequestCompleteListener:Lcom/android/volley/Request$NetworkRequestCompleteListener;

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_4

    .line 4
    check-cast v1, Lcom/android/volley/WaitingRequestManager;

    .line 5
    iget-object v0, p1, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    if-eqz v0, :cond_3

    .line 6
    iget-wide v2, v0, Lcom/android/volley/Cache$Entry;->ttl:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v0, v2, v4

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-gez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    if-eqz v0, :cond_1

    goto :goto_2

    .line 7
    :cond_1
    invoke-virtual {p0}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object p0

    .line 8
    monitor-enter v1

    .line 9
    :try_start_1
    iget-object v0, v1, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 10
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_4

    .line 11
    sget-boolean v4, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-eqz v4, :cond_2

    const-string v4, "Releasing %d waiting requests for cacheKey=%s."

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    aput-object p0, v5, v2

    .line 13
    invoke-static {v4, v5}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/Request;

    .line 15
    iget-object v2, v1, Lcom/android/volley/WaitingRequestManager;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    check-cast v2, Lcom/android/volley/ExecutorDelivery;

    const/4 v3, 0x0

    .line 16
    invoke-virtual {v2, v0, p1, v3}, Lcom/android/volley/ExecutorDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 17
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    .line 18
    :cond_3
    :goto_2
    invoke-virtual {v1, p0}, Lcom/android/volley/WaitingRequestManager;->onNoUsableResponseReceived(Lcom/android/volley/Request;)V

    :cond_4
    return-void

    :catchall_1
    move-exception p0

    .line 19
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p0
.end method

.method public abstract parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/NetworkResponse;",
            ")",
            "Lcom/android/volley/Response<",
            "TT;>;"
        }
    .end annotation
.end method

.method public sendEvent(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/volley/Request;->mRequestQueue:Lcom/android/volley/RequestQueue;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0, p0, p1}, Lcom/android/volley/RequestQueue;->sendRequestEvent(Lcom/android/volley/Request;I)V

    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    const-string v0, "0x"

    .line 1
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2
    iget v1, p0, Lcom/android/volley/Request;->mDefaultTrafficStatsTag:I

    .line 3
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/volley/Request;->isCanceled()Z

    const-string v2, "[ ] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    iget-object v2, p0, Lcom/android/volley/Request;->mUrl:Ljava/lang/String;

    .line 6
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    sget-object v0, Lcom/android/volley/Request$Priority;->NORMAL:Lcom/android/volley/Request$Priority;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/android/volley/Request;->mSequence:Ljava/lang/Integer;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
