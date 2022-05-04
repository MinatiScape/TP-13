.class public Lcom/bumptech/glide/load/engine/cache/DiskLruCacheFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/cache/DiskLruCacheFactory$CacheDirectoryGetter;
    }
.end annotation


# instance fields
.field public final cacheDirectoryGetter:Lcom/bumptech/glide/load/engine/cache/DiskLruCacheFactory$CacheDirectoryGetter;

.field public final diskCacheSize:J


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/cache/DiskLruCacheFactory$CacheDirectoryGetter;J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "cacheDirectoryGetter",
            "diskCacheSize"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-wide p2, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheFactory;->diskCacheSize:J

    .line 3
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheFactory;->cacheDirectoryGetter:Lcom/bumptech/glide/load/engine/cache/DiskLruCacheFactory$CacheDirectoryGetter;

    return-void
.end method
