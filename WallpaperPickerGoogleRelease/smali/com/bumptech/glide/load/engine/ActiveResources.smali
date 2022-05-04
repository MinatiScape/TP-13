.class public final Lcom/bumptech/glide/load/engine/ActiveResources;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;,
        Lcom/bumptech/glide/load/engine/ActiveResources$DequeuedResourceCallback;
    }
.end annotation


# instance fields
.field public final activeEngineResources:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;",
            ">;"
        }
    .end annotation
.end field

.field public volatile cb:Lcom/bumptech/glide/load/engine/ActiveResources$DequeuedResourceCallback;

.field public cleanReferenceQueueThread:Ljava/lang/Thread;

.field public final isActiveResourceRetentionAllowed:Z

.field public volatile isShutdown:Z

.field public listener:Lcom/bumptech/glide/load/engine/EngineResource$ResourceListener;

.field public final mainHandler:Landroid/os/Handler;

.field public resourceReferenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "Lcom/bumptech/glide/load/engine/EngineResource<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Z)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "isActiveResourceRetentionAllowed"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lcom/bumptech/glide/load/engine/ActiveResources$1;

    invoke-direct {v2, p0}, Lcom/bumptech/glide/load/engine/ActiveResources$1;-><init>(Lcom/bumptech/glide/load/engine/ActiveResources;)V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->mainHandler:Landroid/os/Handler;

    .line 3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->activeEngineResources:Ljava/util/Map;

    .line 4
    iput-boolean p1, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->isActiveResourceRetentionAllowed:Z

    return-void
.end method


# virtual methods
.method public activate(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "resource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/EngineResource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;

    .line 2
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->resourceReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->resourceReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 4
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/bumptech/glide/load/engine/ActiveResources$2;

    invoke-direct {v2, p0}, Lcom/bumptech/glide/load/engine/ActiveResources$2;-><init>(Lcom/bumptech/glide/load/engine/ActiveResources;)V

    const-string v3, "glide-active-resources"

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->cleanReferenceQueueThread:Ljava/lang/Thread;

    .line 5
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->resourceReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 7
    iget-boolean v2, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->isActiveResourceRetentionAllowed:Z

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;-><init>(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;Ljava/lang/ref/ReferenceQueue;Z)V

    .line 8
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->activeEngineResources:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;

    if-eqz p0, :cond_1

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->resource:Lcom/bumptech/glide/load/engine/Resource;

    .line 10
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_1
    return-void
.end method

.method public cleanupActiveReference(Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ref"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->activeEngineResources:Ljava/util/Map;

    iget-object v1, p1, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->key:Lcom/bumptech/glide/load/Key;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-boolean v0, p1, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->isCacheable:Z

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->resource:Lcom/bumptech/glide/load/engine/Resource;

    if-nez v0, :cond_0

    goto :goto_0

    .line 4
    :cond_0
    new-instance v1, Lcom/bumptech/glide/load/engine/EngineResource;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v1, v0, v2, v3}, Lcom/bumptech/glide/load/engine/EngineResource;-><init>(Lcom/bumptech/glide/load/engine/Resource;ZZ)V

    .line 5
    iget-object p1, p1, Lcom/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference;->key:Lcom/bumptech/glide/load/Key;

    iget-object p0, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->listener:Lcom/bumptech/glide/load/engine/EngineResource$ResourceListener;

    .line 6
    iput-object p1, v1, Lcom/bumptech/glide/load/engine/EngineResource;->key:Lcom/bumptech/glide/load/Key;

    .line 7
    iput-object p0, v1, Lcom/bumptech/glide/load/engine/EngineResource;->listener:Lcom/bumptech/glide/load/engine/EngineResource$ResourceListener;

    .line 8
    check-cast p0, Lcom/bumptech/glide/load/engine/Engine;

    invoke-virtual {p0, p1, v1}, Lcom/bumptech/glide/load/engine/Engine;->onResourceReleased(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setDequeuedResourceCallback(Lcom/bumptech/glide/load/engine/ActiveResources$DequeuedResourceCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cb"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->cb:Lcom/bumptech/glide/load/engine/ActiveResources$DequeuedResourceCallback;

    return-void
.end method

.method public shutdown()V
    .locals 4

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->isShutdown:Z

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->cleanReferenceQueueThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    return-void

    .line 3
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->cleanReferenceQueueThread:Ljava/lang/Thread;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x5

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/Thread;->join(J)V

    .line 5
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/ActiveResources;->cleanReferenceQueueThread:Ljava/lang/Thread;

    invoke-virtual {p0}, Ljava/lang/Thread;->isAlive()Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    .line 6
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "Failed to join in time"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    :goto_0
    return-void
.end method
