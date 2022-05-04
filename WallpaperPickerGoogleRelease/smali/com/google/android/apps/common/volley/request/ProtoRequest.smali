.class public final Lcom/google/android/apps/common/volley/request/ProtoRequest;
.super Lcom/android/volley/Request;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;,
        Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ReqT::",
        "Lcom/google/protobuf/MessageLite;",
        "ResT::",
        "Lcom/google/protobuf/MessageLite;",
        ">",
        "Lcom/android/volley/Request<",
        "TResT;>;"
    }
.end annotation


# instance fields
.field public final mCallback:Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback<",
            "TResT;>;"
        }
    .end annotation
.end field

.field public final mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final mRequestBody:Lcom/google/protobuf/MessageLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TReqT;"
        }
    .end annotation
.end field

.field public final mResponseParser:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "TResT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder<",
            "TReqT;TResT;>;)V"
        }
    .end annotation

    .line 1
    iget v0, p1, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->requestMethod:I

    iget-object v1, p1, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->url:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->callback:Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;

    iget-object v3, p1, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->requestBody:Lcom/google/protobuf/MessageLite;

    iget-object v4, p1, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->responseParser:Lcom/google/protobuf/Parser;

    iget-object p1, p1, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->headers:Ljava/util/HashMap;

    .line 2
    invoke-direct {p0, v0, v1, v2}, Lcom/android/volley/Request;-><init>(ILjava/lang/String;Lcom/android/volley/Response$ErrorListener;)V

    .line 3
    iput-object v2, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest;->mCallback:Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;

    .line 4
    iput-object v3, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest;->mRequestBody:Lcom/google/protobuf/MessageLite;

    .line 5
    iput-object v4, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest;->mResponseParser:Lcom/google/protobuf/Parser;

    .line 6
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest;->mHeaders:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public deliverError(Lcom/android/volley/VolleyError;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest;->mCallback:Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;

    if-eqz p0, :cond_0

    .line 2
    invoke-interface {p0, p1}, Lcom/android/volley/Response$ErrorListener;->onErrorResponse(Lcom/android/volley/VolleyError;)V

    return-void

    .line 3
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p0
.end method

.method public deliverResponse(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/protobuf/MessageLite;

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest;->mCallback:Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;

    if-eqz p0, :cond_0

    .line 3
    invoke-interface {p0, p1}, Lcom/android/volley/Response$Listener;->onResponse(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public getBody()[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest;->mRequestBody:Lcom/google/protobuf/MessageLite;

    if-eqz p0, :cond_0

    .line 2
    invoke-interface {p0}, Lcom/google/protobuf/MessageLite;->toByteArray()[B

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getBodyContentType()Ljava/lang/String;
    .locals 0

    const-string p0, "application/protobuf"

    return-object p0
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

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest;->mHeaders:Ljava/util/Map;

    return-object p0
.end method

.method public getRequestBody()Lcom/google/protobuf/MessageLite;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TReqT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest;->mRequestBody:Lcom/google/protobuf/MessageLite;

    return-object p0
.end method

.method public parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/NetworkResponse;",
            ")",
            "Lcom/android/volley/Response<",
            "TResT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest;->mResponseParser:Lcom/google/protobuf/Parser;

    if-eqz p0, :cond_0

    .line 2
    :try_start_0
    iget-object v0, p1, Lcom/android/volley/NetworkResponse;->data:[B

    invoke-interface {p0, v0}, Lcom/google/protobuf/Parser;->parseFrom([B)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/MessageLite;

    .line 3
    invoke-static {p1}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;

    move-result-object p1

    .line 4
    new-instance v0, Lcom/android/volley/Response;

    invoke-direct {v0, p0, p1}, Lcom/android/volley/Response;-><init>(Ljava/lang/Object;Lcom/android/volley/Cache$Entry;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    .line 5
    new-instance p1, Lcom/android/volley/ParseError;

    invoke-direct {p1, p0}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    .line 6
    new-instance p0, Lcom/android/volley/Response;

    invoke-direct {p0, p1}, Lcom/android/volley/Response;-><init>(Lcom/android/volley/VolleyError;)V

    return-object p0

    .line 7
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "must provide a praser to parse response message"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
