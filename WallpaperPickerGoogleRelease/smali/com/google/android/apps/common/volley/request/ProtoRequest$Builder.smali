.class public final Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/common/volley/request/ProtoRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ReqT::",
        "Lcom/google/protobuf/MessageLite;",
        "ResT::",
        "Lcom/google/protobuf/MessageLite;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public callback:Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/apps/common/volley/request/ProtoRequest$Callback<",
            "TResT;>;"
        }
    .end annotation
.end field

.field public final headers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public requestBody:Lcom/google/protobuf/MessageLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TReqT;"
        }
    .end annotation
.end field

.field public requestMethod:I

.field public responseParser:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "TResT;>;"
        }
    .end annotation
.end field

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->headers:Ljava/util/HashMap;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lcom/google/android/apps/common/volley/request/ProtoRequest$Builder;->requestMethod:I

    return-void
.end method
