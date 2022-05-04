.class public Lcom/android/volley/toolbox/HurlStack;
.super Lcom/android/volley/toolbox/BaseHttpStack;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/toolbox/HurlStack$UrlConnectionInputStream;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/volley/toolbox/BaseHttpStack;-><init>()V

    return-void
.end method

.method public static convertHeaders(Ljava/util/Map;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 3
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 4
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 5
    new-instance v4, Lcom/android/volley/Header;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {v4, v5, v3}, Lcom/android/volley/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method public final addBody(Ljava/net/HttpURLConnection;Lcom/android/volley/Request;[B)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            "Lcom/android/volley/Request<",
            "*>;[B)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p0, 0x1

    .line 1
    invoke-virtual {p1, p0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 2
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object p0

    const-string v0, "Content-Type"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 3
    invoke-virtual {p2}, Lcom/android/volley/Request;->getBodyContentType()Ljava/lang/String;

    move-result-object p0

    .line 4
    invoke-virtual {p1, v0, p0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    :cond_0
    new-instance p0, Ljava/io/DataOutputStream;

    .line 6
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 8
    invoke-virtual {p0, p3}, Ljava/io/DataOutputStream;->write([B)V

    .line 9
    invoke-virtual {p0}, Ljava/io/DataOutputStream;->close()V

    return-void
.end method

.method public final addBodyIfExists(Ljava/net/HttpURLConnection;Lcom/android/volley/Request;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/android/volley/Request;->getBody()[B

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/volley/toolbox/HurlStack;->addBody(Ljava/net/HttpURLConnection;Lcom/android/volley/Request;[B)V

    :cond_0
    return-void
.end method

.method public executeRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lcom/android/volley/toolbox/HttpResponse;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/android/volley/toolbox/HttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/android/volley/Request;->mUrl:Ljava/lang/String;

    .line 2
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 3
    invoke-virtual {v1, p2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 4
    invoke-virtual {p1}, Lcom/android/volley/Request;->getHeaders()Ljava/util/Map;

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 5
    new-instance p2, Ljava/net/URL;

    invoke-direct {p2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 6
    invoke-virtual {p2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 7
    invoke-static {}, Ljava/net/HttpURLConnection;->getFollowRedirects()Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 8
    iget-object v2, p1, Lcom/android/volley/Request;->mRetryPolicy:Lcom/android/volley/DefaultRetryPolicy;

    .line 9
    iget v2, v2, Lcom/android/volley/DefaultRetryPolicy;->mCurrentTimeoutMs:I

    .line 10
    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 11
    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    const/4 v3, 0x1

    .line 13
    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 14
    invoke-virtual {p2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object p2

    const-string v4, "https"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    :try_start_0
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 16
    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0, v0, p1}, Lcom/android/volley/toolbox/HurlStack;->setConnectionParametersForRequest(Ljava/net/HttpURLConnection;Lcom/android/volley/Request;)V

    .line 18
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p0

    const/4 p2, -0x1

    if-eq p0, p2, :cond_4

    .line 19
    iget p1, p1, Lcom/android/volley/Request;->mMethod:I

    const/4 v1, 0x4

    if-eq p1, v1, :cond_2

    const/16 p1, 0x64

    if-gt p1, p0, :cond_1

    const/16 p1, 0xc8

    if-lt p0, p1, :cond_2

    :cond_1
    const/16 p1, 0xcc

    if-eq p0, p1, :cond_2

    const/16 p1, 0x130

    if-eq p0, p1, :cond_2

    move p1, v3

    goto :goto_1

    :cond_2
    move p1, v2

    :goto_1
    if-nez p1, :cond_3

    .line 20
    new-instance p1, Lcom/android/volley/toolbox/HttpResponse;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v1

    invoke-static {v1}, Lcom/android/volley/toolbox/HurlStack;->convertHeaders(Ljava/util/Map;)Ljava/util/List;

    move-result-object v1

    const/4 v3, 0x0

    .line 21
    invoke-direct {p1, p0, v1, p2, v3}, Lcom/android/volley/toolbox/HttpResponse;-><init>(ILjava/util/List;ILjava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 22
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object p1

    .line 23
    :cond_3
    :try_start_1
    new-instance p1, Lcom/android/volley/toolbox/HttpResponse;

    .line 24
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object p2

    invoke-static {p2}, Lcom/android/volley/toolbox/HurlStack;->convertHeaders(Ljava/util/Map;)Ljava/util/List;

    move-result-object p2

    .line 25
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v1

    .line 26
    new-instance v2, Lcom/android/volley/toolbox/HurlStack$UrlConnectionInputStream;

    invoke-direct {v2, v0}, Lcom/android/volley/toolbox/HurlStack$UrlConnectionInputStream;-><init>(Ljava/net/HttpURLConnection;)V

    .line 27
    invoke-direct {p1, p0, p2, v1, v2}, Lcom/android/volley/toolbox/HttpResponse;-><init>(ILjava/util/List;ILjava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object p1

    :catchall_0
    move-exception p0

    move v2, v3

    goto :goto_2

    .line 28
    :cond_4
    :try_start_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Could not retrieve response code from HttpUrlConnection."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception p0

    :goto_2
    if-nez v2, :cond_5

    .line 29
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 30
    :cond_5
    throw p0
.end method

.method public setConnectionParametersForRequest(Ljava/net/HttpURLConnection;Lcom/android/volley/Request;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 1
    iget v0, p2, Lcom/android/volley/Request;->mMethod:I

    packed-switch v0, :pswitch_data_0

    .line 2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Unknown method type."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    const-string v0, "PATCH"

    .line 3
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/android/volley/toolbox/HurlStack;->addBodyIfExists(Ljava/net/HttpURLConnection;Lcom/android/volley/Request;)V

    goto :goto_0

    :pswitch_1
    const-string p0, "TRACE"

    .line 5
    invoke-virtual {p1, p0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_2
    const-string p0, "OPTIONS"

    .line 6
    invoke-virtual {p1, p0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_3
    const-string p0, "HEAD"

    .line 7
    invoke-virtual {p1, p0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_4
    const-string p0, "DELETE"

    .line 8
    invoke-virtual {p1, p0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_5
    const-string v0, "PUT"

    .line 9
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/android/volley/toolbox/HurlStack;->addBodyIfExists(Ljava/net/HttpURLConnection;Lcom/android/volley/Request;)V

    goto :goto_0

    :pswitch_6
    const-string v0, "POST"

    .line 11
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/android/volley/toolbox/HurlStack;->addBodyIfExists(Ljava/net/HttpURLConnection;Lcom/android/volley/Request;)V

    goto :goto_0

    :pswitch_7
    const-string p0, "GET"

    .line 13
    invoke-virtual {p1, p0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    :goto_0
    :pswitch_8
    return-void

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
