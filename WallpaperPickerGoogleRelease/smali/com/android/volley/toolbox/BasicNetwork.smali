.class public Lcom/android/volley/toolbox/BasicNetwork;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/volley/Network;


# instance fields
.field public final mBaseHttpStack:Lcom/android/volley/toolbox/BaseHttpStack;

.field public final mPool:Lcom/android/volley/toolbox/ByteArrayPool;


# direct methods
.method public constructor <init>(Lcom/android/volley/toolbox/BaseHttpStack;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/volley/toolbox/ByteArrayPool;

    const/16 v1, 0x1000

    invoke-direct {v0, v1}, Lcom/android/volley/toolbox/ByteArrayPool;-><init>(I)V

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicNetwork;->mBaseHttpStack:Lcom/android/volley/toolbox/BaseHttpStack;

    .line 4
    iput-object v0, p0, Lcom/android/volley/toolbox/BasicNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    return-void
.end method


# virtual methods
.method public performRequest(Lcom/android/volley/Request;)Lcom/android/volley/NetworkResponse;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)",
            "Lcom/android/volley/NetworkResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 2
    :goto_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 3
    :try_start_0
    iget-object v4, p1, Lcom/android/volley/Request;->mCacheEntry:Lcom/android/volley/Cache$Entry;

    .line 4
    invoke-static {v4}, Lcom/android/volley/toolbox/HttpHeaderParser;->getCacheHeaders(Lcom/android/volley/Cache$Entry;)Ljava/util/Map;

    move-result-object v4

    .line 5
    iget-object v5, p0, Lcom/android/volley/toolbox/BasicNetwork;->mBaseHttpStack:Lcom/android/volley/toolbox/BaseHttpStack;

    invoke-virtual {v5, p1, v4}, Lcom/android/volley/toolbox/BaseHttpStack;->executeRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lcom/android/volley/toolbox/HttpResponse;

    move-result-object v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 6
    :try_start_1
    iget v6, v4, Lcom/android/volley/toolbox/HttpResponse;->mStatusCode:I

    .line 7
    invoke-virtual {v4}, Lcom/android/volley/toolbox/HttpResponse;->getHeaders()Ljava/util/List;

    move-result-object v11

    const/16 v5, 0x130

    if-ne v6, v5, :cond_0

    .line 8
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    sub-long/2addr v5, v0

    .line 9
    invoke-static {p1, v5, v6, v11}, Lcom/android/volley/toolbox/NetworkUtility;->getNotModifiedNetworkResponse(Lcom/android/volley/Request;JLjava/util/List;)Lcom/android/volley/NetworkResponse;

    move-result-object p0

    return-object p0

    .line 10
    :cond_0
    iget-object v5, v4, Lcom/android/volley/toolbox/HttpResponse;->mContent:Ljava/io/InputStream;

    if-eqz v5, :cond_1

    goto :goto_1

    :cond_1
    move-object v5, v3

    :goto_1
    if-eqz v5, :cond_2

    .line 11
    iget v7, v4, Lcom/android/volley/toolbox/HttpResponse;->mContentLength:I

    .line 12
    iget-object v8, p0, Lcom/android/volley/toolbox/BasicNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    .line 13
    invoke-static {v5, v7, v8}, Lcom/android/volley/toolbox/NetworkUtility;->inputStreamToBytes(Ljava/io/InputStream;ILcom/android/volley/toolbox/ByteArrayPool;)[B

    move-result-object v3

    goto :goto_2

    :cond_2
    new-array v3, v2, [B

    .line 14
    :goto_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long/2addr v7, v0

    .line 15
    invoke-static {v7, v8, p1, v3, v6}, Lcom/android/volley/toolbox/NetworkUtility;->logSlowRequests(JLcom/android/volley/Request;[BI)V

    const/16 v5, 0xc8

    if-lt v6, v5, :cond_3

    const/16 v5, 0x12b

    if-gt v6, v5, :cond_3

    .line 16
    new-instance v12, Lcom/android/volley/NetworkResponse;

    const/4 v8, 0x0

    .line 17
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    sub-long/2addr v9, v0

    move-object v5, v12

    move-object v7, v3

    invoke-direct/range {v5 .. v11}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    return-object v12

    .line 18
    :cond_3
    new-instance v5, Ljava/io/IOException;

    invoke-direct {v5}, Ljava/io/IOException;-><init>()V

    throw v5
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v5

    move-object v6, v3

    move-object v3, v4

    goto :goto_3

    :catch_1
    move-exception v4

    move-object v5, v4

    move-object v6, v3

    .line 19
    :goto_3
    instance-of v4, v5, Ljava/net/SocketTimeoutException;

    if-eqz v4, :cond_4

    .line 20
    new-instance v2, Lcom/android/volley/TimeoutError;

    invoke-direct {v2}, Lcom/android/volley/TimeoutError;-><init>()V

    const-string v3, "socket"

    invoke-static {v3, p1, v2}, Lcom/android/volley/toolbox/NetworkUtility;->attemptRetryOnException(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    goto :goto_0

    .line 21
    :cond_4
    instance-of v4, v5, Ljava/net/MalformedURLException;

    if-nez v4, :cond_c

    if-eqz v3, :cond_b

    .line 22
    iget v11, v3, Lcom/android/volley/toolbox/HttpResponse;->mStatusCode:I

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    .line 23
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    const/4 v2, 0x1

    .line 24
    iget-object v5, p1, Lcom/android/volley/Request;->mUrl:Ljava/lang/String;

    aput-object v5, v4, v2

    const-string v2, "Unexpected response code %d for %s"

    .line 25
    invoke-static {v2, v4}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v6, :cond_a

    .line 26
    invoke-virtual {v3}, Lcom/android/volley/toolbox/HttpResponse;->getHeaders()Ljava/util/List;

    move-result-object v10

    .line 27
    new-instance v2, Lcom/android/volley/NetworkResponse;

    const/4 v7, 0x0

    .line 28
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long v8, v3, v0

    move-object v4, v2

    move v5, v11

    invoke-direct/range {v4 .. v10}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    const/16 v3, 0x191

    if-eq v11, v3, :cond_9

    const/16 v3, 0x193

    if-ne v11, v3, :cond_5

    goto :goto_5

    :cond_5
    const/16 p0, 0x190

    if-lt v11, p0, :cond_7

    const/16 p0, 0x1f3

    if-le v11, p0, :cond_6

    goto :goto_4

    .line 29
    :cond_6
    new-instance p0, Lcom/android/volley/ClientError;

    invoke-direct {p0, v2}, Lcom/android/volley/ClientError;-><init>(Lcom/android/volley/NetworkResponse;)V

    throw p0

    :cond_7
    :goto_4
    const/16 p0, 0x1f4

    if-lt v11, p0, :cond_8

    const/16 p0, 0x257

    if-gt v11, p0, :cond_8

    .line 30
    new-instance p0, Lcom/android/volley/ServerError;

    invoke-direct {p0, v2}, Lcom/android/volley/ServerError;-><init>(Lcom/android/volley/NetworkResponse;)V

    throw p0

    .line 31
    :cond_8
    new-instance p0, Lcom/android/volley/ServerError;

    invoke-direct {p0, v2}, Lcom/android/volley/ServerError;-><init>(Lcom/android/volley/NetworkResponse;)V

    throw p0

    .line 32
    :cond_9
    :goto_5
    new-instance v3, Lcom/android/volley/AuthFailureError;

    invoke-direct {v3, v2}, Lcom/android/volley/AuthFailureError;-><init>(Lcom/android/volley/NetworkResponse;)V

    const-string v2, "auth"

    invoke-static {v2, p1, v3}, Lcom/android/volley/toolbox/NetworkUtility;->attemptRetryOnException(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    goto/16 :goto_0

    .line 33
    :cond_a
    new-instance v2, Lcom/android/volley/NetworkError;

    invoke-direct {v2}, Lcom/android/volley/NetworkError;-><init>()V

    const-string v3, "network"

    invoke-static {v3, p1, v2}, Lcom/android/volley/toolbox/NetworkUtility;->attemptRetryOnException(Ljava/lang/String;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    goto/16 :goto_0

    .line 34
    :cond_b
    new-instance p0, Lcom/android/volley/NoConnectionError;

    invoke-direct {p0, v5}, Lcom/android/volley/NoConnectionError;-><init>(Ljava/lang/Throwable;)V

    throw p0

    .line 35
    :cond_c
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "Bad URL "

    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 36
    iget-object p1, p1, Lcom/android/volley/Request;->mUrl:Ljava/lang/String;

    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0
.end method
