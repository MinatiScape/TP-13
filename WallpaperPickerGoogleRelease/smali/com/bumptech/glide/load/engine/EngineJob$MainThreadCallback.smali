.class public Lcom/bumptech/glide/load/engine/EngineJob$MainThreadCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/EngineJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MainThreadCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "message"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Lcom/bumptech/glide/load/engine/EngineJob;

    .line 2
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_9

    const/4 v3, 0x2

    if-eq v0, v3, :cond_2

    const/4 v3, 0x3

    if-ne v0, v3, :cond_1

    .line 3
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {p1}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 4
    iget-boolean p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->isCancelled:Z

    if-eqz p1, :cond_0

    .line 5
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->listener:Lcom/bumptech/glide/load/engine/EngineJobListener;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/Key;

    check-cast p1, Lcom/bumptech/glide/load/engine/Engine;

    invoke-virtual {p1, p0, v0}, Lcom/bumptech/glide/load/engine/Engine;->onEngineJobCancelled(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;)V

    .line 6
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->release(Z)V

    goto/16 :goto_4

    .line 7
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Not cancelled"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 8
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x21

    const-string v1, "Unrecognized message: "

    invoke-static {v0, v1, p1}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 9
    :cond_2
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {p1}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 10
    iget-boolean p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->isCancelled:Z

    if-eqz p1, :cond_3

    .line 11
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->release(Z)V

    goto/16 :goto_4

    .line 12
    :cond_3
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->cbs:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_8

    .line 13
    iget-boolean p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->hasLoadFailed:Z

    if-nez p1, :cond_7

    .line 14
    iput-boolean v2, p0, Lcom/bumptech/glide/load/engine/EngineJob;->hasLoadFailed:Z

    .line 15
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->listener:Lcom/bumptech/glide/load/engine/EngineJobListener;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/Key;

    const/4 v3, 0x0

    check-cast p1, Lcom/bumptech/glide/load/engine/Engine;

    invoke-virtual {p1, p0, v0, v3}, Lcom/bumptech/glide/load/engine/Engine;->onEngineJobComplete(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V

    .line 16
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->cbs:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/ResourceCallback;

    .line 17
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->ignoredCallbacks:Ljava/util/List;

    if-eqz v3, :cond_5

    invoke-interface {v3, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    move v3, v2

    goto :goto_1

    :cond_5
    move v3, v1

    :goto_1
    if-nez v3, :cond_4

    .line 18
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->exception:Lcom/bumptech/glide/load/engine/GlideException;

    invoke-interface {v0, v3}, Lcom/bumptech/glide/request/ResourceCallback;->onLoadFailed(Lcom/bumptech/glide/load/engine/GlideException;)V

    goto :goto_0

    .line 19
    :cond_6
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->release(Z)V

    goto/16 :goto_4

    .line 20
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Already failed once"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 21
    :cond_8
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Received an exception without any callbacks to notify"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 22
    :cond_9
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->stateVerifier:Lcom/bumptech/glide/util/pool/StateVerifier;

    invoke-virtual {p1}, Lcom/bumptech/glide/util/pool/StateVerifier;->throwIfRecycled()V

    .line 23
    iget-boolean p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->isCancelled:Z

    if-eqz p1, :cond_a

    .line 24
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->resource:Lcom/bumptech/glide/load/engine/Resource;

    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/Resource;->recycle()V

    .line 25
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->release(Z)V

    goto :goto_4

    .line 26
    :cond_a
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->cbs:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_f

    .line 27
    iget-boolean p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->hasResource:Z

    if-nez p1, :cond_e

    .line 28
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->engineResourceFactory:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->resource:Lcom/bumptech/glide/load/engine/Resource;

    iget-boolean v3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->isCacheable:Z

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    new-instance p1, Lcom/bumptech/glide/load/engine/EngineResource;

    invoke-direct {p1, v0, v3, v2}, Lcom/bumptech/glide/load/engine/EngineResource;-><init>(Lcom/bumptech/glide/load/engine/Resource;ZZ)V

    .line 30
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->engineResource:Lcom/bumptech/glide/load/engine/EngineResource;

    .line 31
    iput-boolean v2, p0, Lcom/bumptech/glide/load/engine/EngineJob;->hasResource:Z

    .line 32
    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/EngineResource;->acquire()V

    .line 33
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->listener:Lcom/bumptech/glide/load/engine/EngineJobListener;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/Key;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->engineResource:Lcom/bumptech/glide/load/engine/EngineResource;

    check-cast p1, Lcom/bumptech/glide/load/engine/Engine;

    invoke-virtual {p1, p0, v0, v3}, Lcom/bumptech/glide/load/engine/Engine;->onEngineJobComplete(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V

    .line 34
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->cbs:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    move v0, v1

    :goto_2
    if-ge v0, p1, :cond_d

    .line 35
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->cbs:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/request/ResourceCallback;

    .line 36
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/EngineJob;->ignoredCallbacks:Ljava/util/List;

    if-eqz v4, :cond_b

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    move v4, v2

    goto :goto_3

    :cond_b
    move v4, v1

    :goto_3
    if-nez v4, :cond_c

    .line 37
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/EngineJob;->engineResource:Lcom/bumptech/glide/load/engine/EngineResource;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/EngineResource;->acquire()V

    .line 38
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/EngineJob;->engineResource:Lcom/bumptech/glide/load/engine/EngineResource;

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/EngineJob;->dataSource:Lcom/bumptech/glide/load/DataSource;

    invoke-interface {v3, v4, v5}, Lcom/bumptech/glide/request/ResourceCallback;->onResourceReady(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/DataSource;)V

    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 39
    :cond_d
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->engineResource:Lcom/bumptech/glide/load/engine/EngineResource;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/EngineResource;->release()V

    .line 40
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->release(Z)V

    :goto_4
    return v2

    .line 41
    :cond_e
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Already have resource"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 42
    :cond_f
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Received a resource without any callbacks to notify"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
