.class public final Lcom/bumptech/glide/load/Options;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/Key;


# instance fields
.field public final values:Landroidx/collection/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArrayMap<",
            "Lcom/bumptech/glide/load/Option<",
            "*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/bumptech/glide/util/CachedHashCodeArrayMap;

    invoke-direct {v0}, Lcom/bumptech/glide/util/CachedHashCodeArrayMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/bumptech/glide/load/Options;

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/bumptech/glide/load/Options;

    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    iget-object p1, p1, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Landroidx/collection/SimpleArrayMap;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public get(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "option"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/Option<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    .line 2
    invoke-virtual {v0, p1}, Landroidx/collection/SimpleArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Landroidx/collection/SimpleArrayMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_1

    .line 5
    :cond_1
    iget-object p0, p1, Lcom/bumptech/glide/load/Option;->defaultValue:Ljava/lang/Object;

    :goto_1
    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    invoke-virtual {p0}, Landroidx/collection/SimpleArrayMap;->hashCode()I

    move-result p0

    return p0
.end method

.method public putAll(Lcom/bumptech/glide/load/Options;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "other"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    iget-object p1, p1, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    invoke-virtual {p0, p1}, Landroidx/collection/SimpleArrayMap;->putAll(Landroidx/collection/SimpleArrayMap;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x10

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v0, "Options{values="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public updateDiskCacheKey(Ljava/security/MessageDigest;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "messageDigest"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    :goto_0
    iget-object v1, p0, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    .line 2
    iget v2, v1, Landroidx/collection/SimpleArrayMap;->mSize:I

    if-ge v0, v2, :cond_1

    .line 3
    invoke-virtual {v1, v0}, Landroidx/collection/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/load/Option;

    .line 4
    iget-object v2, p0, Lcom/bumptech/glide/load/Options;->values:Landroidx/collection/ArrayMap;

    invoke-virtual {v2, v0}, Landroidx/collection/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    .line 5
    iget-object v3, v1, Lcom/bumptech/glide/load/Option;->cacheKeyUpdater:Lcom/bumptech/glide/load/Option$CacheKeyUpdater;

    .line 6
    iget-object v4, v1, Lcom/bumptech/glide/load/Option;->keyBytes:[B

    if-nez v4, :cond_0

    .line 7
    iget-object v4, v1, Lcom/bumptech/glide/load/Option;->key:Ljava/lang/String;

    sget-object v5, Lcom/bumptech/glide/load/Key;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    iput-object v4, v1, Lcom/bumptech/glide/load/Option;->keyBytes:[B

    .line 8
    :cond_0
    iget-object v1, v1, Lcom/bumptech/glide/load/Option;->keyBytes:[B

    .line 9
    invoke-interface {v3, v1, v2, p1}, Lcom/bumptech/glide/load/Option$CacheKeyUpdater;->update([BLjava/lang/Object;Ljava/security/MessageDigest;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
