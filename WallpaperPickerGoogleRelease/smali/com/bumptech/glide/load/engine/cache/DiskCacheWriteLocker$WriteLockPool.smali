.class public Lcom/bumptech/glide/load/engine/cache/DiskCacheWriteLocker$WriteLockPool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/cache/DiskCacheWriteLocker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WriteLockPool"
.end annotation


# instance fields
.field public final pool:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/bumptech/glide/load/engine/cache/DiskCacheWriteLocker$WriteLock;",
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
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/cache/DiskCacheWriteLocker$WriteLockPool;->pool:Ljava/util/Queue;

    return-void
.end method
