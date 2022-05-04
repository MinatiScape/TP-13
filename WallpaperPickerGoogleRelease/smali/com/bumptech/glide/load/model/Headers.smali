.class public interface abstract Lcom/bumptech/glide/load/model/Headers;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DEFAULT:Lcom/bumptech/glide/load/model/Headers;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/model/LazyHeaders$Builder;

    invoke-direct {v0}, Lcom/bumptech/glide/load/model/LazyHeaders$Builder;-><init>()V

    .line 2
    new-instance v1, Lcom/bumptech/glide/load/model/LazyHeaders;

    iget-object v0, v0, Lcom/bumptech/glide/load/model/LazyHeaders$Builder;->headers:Ljava/util/Map;

    invoke-direct {v1, v0}, Lcom/bumptech/glide/load/model/LazyHeaders;-><init>(Ljava/util/Map;)V

    .line 3
    sput-object v1, Lcom/bumptech/glide/load/model/Headers;->DEFAULT:Lcom/bumptech/glide/load/model/Headers;

    return-void
.end method


# virtual methods
.method public abstract getHeaders()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method
