.class public Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator$PoolableDigestContainer;
    }
.end annotation


# instance fields
.field public final digestPool:Landroidx/core/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator$PoolableDigestContainer;",
            ">;"
        }
    .end annotation
.end field

.field public final loadIdToSafeHash:Lcom/bumptech/glide/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/util/LruCache<",
            "Lcom/bumptech/glide/load/Key;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/bumptech/glide/util/LruCache;

    const-wide/16 v1, 0x3e8

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/util/LruCache;-><init>(J)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->loadIdToSafeHash:Lcom/bumptech/glide/util/LruCache;

    .line 3
    new-instance v0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator$1;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator$1;-><init>()V

    .line 4
    new-instance v1, Landroidx/core/util/Pools$SynchronizedPool;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Landroidx/core/util/Pools$SynchronizedPool;-><init>(I)V

    .line 5
    sget-object v2, Lcom/bumptech/glide/util/pool/FactoryPools;->EMPTY_RESETTER:Lcom/bumptech/glide/util/pool/FactoryPools$Resetter;

    .line 6
    new-instance v3, Lcom/bumptech/glide/util/pool/FactoryPools$FactoryPool;

    invoke-direct {v3, v1, v0, v2}, Lcom/bumptech/glide/util/pool/FactoryPools$FactoryPool;-><init>(Landroidx/core/util/Pools$Pool;Lcom/bumptech/glide/util/pool/FactoryPools$Factory;Lcom/bumptech/glide/util/pool/FactoryPools$Resetter;)V

    .line 7
    iput-object v3, p0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->digestPool:Landroidx/core/util/Pools$Pool;

    return-void
.end method


# virtual methods
.method public getSafeKey(Lcom/bumptech/glide/load/Key;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->loadIdToSafeHash:Lcom/bumptech/glide/util/LruCache;

    monitor-enter v0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->loadIdToSafeHash:Lcom/bumptech/glide/util/LruCache;

    invoke-virtual {v1, p1}, Lcom/bumptech/glide/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    if-nez v1, :cond_1

    .line 4
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->digestPool:Landroidx/core/util/Pools$Pool;

    invoke-interface {v0}, Landroidx/core/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator$PoolableDigestContainer;

    const-string v1, "Argument must not be null"

    .line 5
    invoke-static {v0, v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    :try_start_1
    iget-object v1, v0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator$PoolableDigestContainer;->messageDigest:Ljava/security/MessageDigest;

    invoke-interface {p1, v1}, Lcom/bumptech/glide/load/Key;->updateDiskCacheKey(Ljava/security/MessageDigest;)V

    .line 7
    iget-object v1, v0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator$PoolableDigestContainer;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 8
    sget-object v2, Lcom/bumptech/glide/util/Util;->SHA_256_CHARS:[C

    monitor-enter v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/4 v3, 0x0

    .line 9
    :goto_0
    :try_start_2
    array-length v4, v1

    if-ge v3, v4, :cond_0

    .line 10
    aget-byte v4, v1, v3

    and-int/lit16 v4, v4, 0xff

    mul-int/lit8 v5, v3, 0x2

    .line 11
    sget-object v6, Lcom/bumptech/glide/util/Util;->HEX_CHAR_ARRAY:[C

    ushr-int/lit8 v7, v4, 0x4

    aget-char v7, v6, v7

    aput-char v7, v2, v5

    add-int/lit8 v5, v5, 0x1

    and-int/lit8 v4, v4, 0xf

    .line 12
    aget-char v4, v6, v4

    aput-char v4, v2, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 13
    :cond_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([C)V

    .line 14
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 15
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->digestPool:Landroidx/core/util/Pools$Pool;

    invoke-interface {v2, v0}, Landroidx/core/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 16
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p1

    .line 17
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->digestPool:Landroidx/core/util/Pools$Pool;

    invoke-interface {p0, v0}, Landroidx/core/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    throw p1

    .line 18
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->loadIdToSafeHash:Lcom/bumptech/glide/util/LruCache;

    monitor-enter v2

    .line 19
    :try_start_5
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/cache/SafeKeyGenerator;->loadIdToSafeHash:Lcom/bumptech/glide/util/LruCache;

    invoke-virtual {p0, p1, v1}, Lcom/bumptech/glide/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    monitor-exit v2

    return-object v1

    :catchall_2
    move-exception p0

    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p0

    :catchall_3
    move-exception p0

    .line 21
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw p0
.end method
