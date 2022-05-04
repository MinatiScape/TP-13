.class public Lcom/bumptech/glide/load/engine/DataCacheWriter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/cache/DiskCache$Writer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<DataType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/cache/DiskCache$Writer;"
    }
.end annotation


# instance fields
.field public final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TDataType;"
        }
    .end annotation
.end field

.field public final encoder:Lcom/bumptech/glide/load/Encoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/Encoder<",
            "TDataType;>;"
        }
    .end annotation
.end field

.field public final options:Lcom/bumptech/glide/load/Options;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/Encoder;Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "encoder",
            "data",
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Encoder<",
            "TDataType;>;TDataType;",
            "Lcom/bumptech/glide/load/Options;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DataCacheWriter;->encoder:Lcom/bumptech/glide/load/Encoder;

    .line 3
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/DataCacheWriter;->data:Ljava/lang/Object;

    .line 4
    iput-object p3, p0, Lcom/bumptech/glide/load/engine/DataCacheWriter;->options:Lcom/bumptech/glide/load/Options;

    return-void
.end method
