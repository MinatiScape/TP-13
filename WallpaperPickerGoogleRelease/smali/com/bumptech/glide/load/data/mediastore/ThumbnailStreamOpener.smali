.class public Lcom/bumptech/glide/load/data/mediastore/ThumbnailStreamOpener;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DEFAULT_SERVICE:Lcom/bumptech/glide/load/data/mediastore/FileService;


# instance fields
.field public final byteArrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

.field public final contentResolver:Landroid/content/ContentResolver;

.field public final parsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/ImageHeaderParser;",
            ">;"
        }
    .end annotation
.end field

.field public final query:Lcom/bumptech/glide/load/data/mediastore/ThumbnailQuery;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/data/mediastore/FileService;

    invoke-direct {v0}, Lcom/bumptech/glide/load/data/mediastore/FileService;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/data/mediastore/ThumbnailStreamOpener;->DEFAULT_SERVICE:Lcom/bumptech/glide/load/data/mediastore/FileService;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/bumptech/glide/load/data/mediastore/ThumbnailQuery;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;Landroid/content/ContentResolver;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "parsers",
            "query",
            "byteArrayPool",
            "contentResolver"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/ImageHeaderParser;",
            ">;",
            "Lcom/bumptech/glide/load/data/mediastore/ThumbnailQuery;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;",
            "Landroid/content/ContentResolver;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/bumptech/glide/load/data/mediastore/ThumbnailStreamOpener;->query:Lcom/bumptech/glide/load/data/mediastore/ThumbnailQuery;

    .line 3
    iput-object p3, p0, Lcom/bumptech/glide/load/data/mediastore/ThumbnailStreamOpener;->byteArrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    .line 4
    iput-object p4, p0, Lcom/bumptech/glide/load/data/mediastore/ThumbnailStreamOpener;->contentResolver:Landroid/content/ContentResolver;

    .line 5
    iput-object p1, p0, Lcom/bumptech/glide/load/data/mediastore/ThumbnailStreamOpener;->parsers:Ljava/util/List;

    return-void
.end method
