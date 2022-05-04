.class public final Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/bitmap_recycle/Poolable;


# instance fields
.field public final pool:Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$KeyPool;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$KeyPool;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "pool"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;->pool:Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$KeyPool;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1
    instance-of p0, p1, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;

    if-eqz p0, :cond_0

    .line 2
    check-cast p1, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;

    .line 3
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public hashCode()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public offer()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;->pool:Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$KeyPool;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool;->offer(Lcom/bumptech/glide/load/engine/bitmap_recycle/Poolable;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    const-string p0, "[0]"

    return-object p0
.end method
