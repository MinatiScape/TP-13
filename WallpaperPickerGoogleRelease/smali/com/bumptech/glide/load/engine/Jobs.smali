.class public final Lcom/bumptech/glide/load/engine/Jobs;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final jobs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final onlyCacheJobs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/Jobs;->jobs:Ljava/util/Map;

    .line 3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/Jobs;->onlyCacheJobs:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getAll()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/Jobs;->jobs:Ljava/util/Map;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public final getJobMap(Z)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "onlyRetrieveFromCache"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/Map<",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/Jobs;->onlyCacheJobs:Ljava/util/Map;

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/Jobs;->jobs:Ljava/util/Map;

    :goto_0
    return-object p0
.end method
