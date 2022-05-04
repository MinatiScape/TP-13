.class public final Lcom/android/volley/toolbox/NetworkUtility;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static attemptRetryOnException(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/VolleyError;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/android/volley/Request;->mRetryPolicy:Lcom/android/volley/DefaultRetryPolicy;

    .line 2
    iget v1, v0, Lcom/android/volley/DefaultRetryPolicy;->mCurrentTimeoutMs:I

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 3
    :try_start_0
    iget v5, v0, Lcom/android/volley/DefaultRetryPolicy;->mCurrentRetryCount:I

    add-int/2addr v5, v4

    iput v5, v0, Lcom/android/volley/DefaultRetryPolicy;->mCurrentRetryCount:I

    int-to-float v6, v1

    .line 4
    iget v7, v0, Lcom/android/volley/DefaultRetryPolicy;->mBackoffMultiplier:F

    mul-float/2addr v6, v7

    float-to-int v6, v6

    add-int/2addr v6, v1

    iput v6, v0, Lcom/android/volley/DefaultRetryPolicy;->mCurrentTimeoutMs:I

    .line 5
    iget v0, v0, Lcom/android/volley/DefaultRetryPolicy;->mMaxNumRetries:I
    :try_end_0
    .catch Lcom/android/volley/VolleyError; {:try_start_0 .. :try_end_0} :catch_0

    if-gt v5, v0, :cond_0

    move v0, v4

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    if-eqz v0, :cond_1

    new-array p2, v2, [Ljava/lang/Object;

    aput-object p0, p2, v3

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, p2, v4

    const-string p0, "%s-retry [timeout=%s]"

    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    return-void

    .line 7
    :cond_1
    :try_start_1
    throw p2
    :try_end_1
    .catch Lcom/android/volley/VolleyError; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception p2

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p0, v0, v3

    .line 8
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v0, v4

    const-string p0, "%s-timeout-giveup [timeout=%s]"

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 10
    throw p2
.end method

.method public static getNotModifiedNetworkResponse(Lcom/android/volley/Request;JLjava/util/List;)Lcom/android/volley/NetworkResponse;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;J",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;)",
            "Lcom/android/volley/NetworkResponse;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/volley/Request;->mCacheEntry:Lcom/android/volley/Cache$Entry;

    if-nez p0, :cond_0

    .line 2
    new-instance p0, Lcom/android/volley/NetworkResponse;

    const/16 v1, 0x130

    const/4 v2, 0x0

    const/4 v3, 0x1

    move-object v0, p0

    move-wide v4, p1

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    return-object p0

    .line 3
    :cond_0
    new-instance v0, Ljava/util/TreeSet;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 4
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 5
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/volley/Header;

    .line 6
    iget-object v2, v2, Lcom/android/volley/Header;->mName:Ljava/lang/String;

    .line 7
    invoke-virtual {v0, v2}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 8
    :cond_1
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 9
    iget-object p3, p0, Lcom/android/volley/Cache$Entry;->allResponseHeaders:Ljava/util/List;

    if-eqz p3, :cond_3

    .line 10
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_5

    .line 11
    iget-object p3, p0, Lcom/android/volley/Cache$Entry;->allResponseHeaders:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_2
    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/volley/Header;

    .line 12
    iget-object v2, v1, Lcom/android/volley/Header;->mName:Ljava/lang/String;

    .line 13
    invoke-virtual {v0, v2}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 14
    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 15
    :cond_3
    iget-object p3, p0, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    invoke-interface {p3}, Ljava/util/Map;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_5

    .line 16
    iget-object p3, p0, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_4
    :goto_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 17
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 18
    new-instance v2, Lcom/android/volley/Header;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v2, v3, v1}, Lcom/android/volley/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 19
    :cond_5
    new-instance p3, Lcom/android/volley/NetworkResponse;

    const/16 v4, 0x130

    iget-object v5, p0, Lcom/android/volley/Cache$Entry;->data:[B

    const/4 v6, 0x1

    move-object v3, p3

    move-wide v7, p1

    invoke-direct/range {v3 .. v9}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    return-object p3
.end method

.method public static inputStreamToBytes(Ljava/io/InputStream;ILcom/android/volley/toolbox/ByteArrayPool;)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Error occurred when closing InputStream"

    .line 1
    new-instance v1, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;

    invoke-direct {v1, p2, p1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;-><init>(Lcom/android/volley/toolbox/ByteArrayPool;I)V

    const/16 p1, 0x400

    const/4 v2, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p2, p1}, Lcom/android/volley/toolbox/ByteArrayPool;->getBuf(I)[B

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    :goto_0
    :try_start_1
    invoke-virtual {p0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 4
    invoke-virtual {v1, p1, v2, v3}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 6
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    new-array p0, v2, [Ljava/lang/Object;

    .line 7
    invoke-static {v0, p0}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 8
    :goto_1
    invoke-virtual {p2, p1}, Lcom/android/volley/toolbox/ByteArrayPool;->returnBuf([B)V

    .line 9
    invoke-virtual {v1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->close()V

    return-object v3

    :catchall_0
    move-exception v3

    goto :goto_2

    :catchall_1
    move-exception v3

    const/4 p1, 0x0

    .line 10
    :goto_2
    :try_start_3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_3

    :catch_1
    new-array p0, v2, [Ljava/lang/Object;

    .line 11
    invoke-static {v0, p0}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 12
    :goto_3
    invoke-virtual {p2, p1}, Lcom/android/volley/toolbox/ByteArrayPool;->returnBuf([B)V

    .line 13
    invoke-virtual {v1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->close()V

    .line 14
    throw v3
.end method

.method public static logSlowRequests(JLcom/android/volley/Request;[BI)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/android/volley/Request<",
            "*>;[BI)V"
        }
    .end annotation

    .line 1
    sget-boolean v0, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-nez v0, :cond_0

    const-wide/16 v0, 0xbb8

    cmp-long v0, p0, v0

    if-lez v0, :cond_2

    :cond_0
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    .line 2
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    aput-object p0, v0, v1

    const/4 p0, 0x2

    if-eqz p3, :cond_1

    .line 3
    array-length p1, p3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_0

    :cond_1
    const-string p1, "null"

    :goto_0
    aput-object p1, v0, p0

    const/4 p0, 0x3

    .line 4
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, p0

    const/4 p0, 0x4

    .line 5
    iget-object p1, p2, Lcom/android/volley/Request;->mRetryPolicy:Lcom/android/volley/DefaultRetryPolicy;

    .line 6
    iget p1, p1, Lcom/android/volley/DefaultRetryPolicy;->mCurrentRetryCount:I

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, p0

    const-string p0, "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]"

    .line 8
    invoke-static {p0, v0}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_2
    return-void
.end method
