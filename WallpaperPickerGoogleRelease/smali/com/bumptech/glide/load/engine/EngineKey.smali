.class public Lcom/bumptech/glide/load/engine/EngineKey;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/Key;


# instance fields
.field public hashCode:I

.field public final height:I

.field public final model:Ljava/lang/Object;

.field public final options:Lcom/bumptech/glide/load/Options;

.field public final resourceClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public final signature:Lcom/bumptech/glide/load/Key;

.field public final transcodeClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public final transformations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/Transformation<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final width:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/bumptech/glide/load/Key;IILjava/util/Map;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/Options;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "model",
            "signature",
            "width",
            "height",
            "transformations",
            "resourceClass",
            "transcodeClass",
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/bumptech/glide/load/Key;",
            "II",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/Transformation<",
            "*>;>;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/Options;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Argument must not be null"

    .line 2
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/EngineKey;->model:Ljava/lang/Object;

    const-string p1, "Signature must not be null"

    .line 4
    invoke-static {p2, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/EngineKey;->signature:Lcom/bumptech/glide/load/Key;

    .line 6
    iput p3, p0, Lcom/bumptech/glide/load/engine/EngineKey;->width:I

    .line 7
    iput p4, p0, Lcom/bumptech/glide/load/engine/EngineKey;->height:I

    .line 8
    invoke-static {p5, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    iput-object p5, p0, Lcom/bumptech/glide/load/engine/EngineKey;->transformations:Ljava/util/Map;

    const-string p1, "Resource class must not be null"

    .line 10
    invoke-static {p6, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    iput-object p6, p0, Lcom/bumptech/glide/load/engine/EngineKey;->resourceClass:Ljava/lang/Class;

    const-string p1, "Transcode class must not be null"

    .line 12
    invoke-static {p7, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    iput-object p7, p0, Lcom/bumptech/glide/load/engine/EngineKey;->transcodeClass:Ljava/lang/Class;

    .line 14
    invoke-static {p8, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    iput-object p8, p0, Lcom/bumptech/glide/load/engine/EngineKey;->options:Lcom/bumptech/glide/load/Options;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/bumptech/glide/load/engine/EngineKey;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/bumptech/glide/load/engine/EngineKey;

    .line 3
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->model:Ljava/lang/Object;

    iget-object v2, p1, Lcom/bumptech/glide/load/engine/EngineKey;->model:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->signature:Lcom/bumptech/glide/load/Key;

    iget-object v2, p1, Lcom/bumptech/glide/load/engine/EngineKey;->signature:Lcom/bumptech/glide/load/Key;

    .line 4
    invoke-interface {v0, v2}, Lcom/bumptech/glide/load/Key;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->height:I

    iget v2, p1, Lcom/bumptech/glide/load/engine/EngineKey;->height:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->width:I

    iget v2, p1, Lcom/bumptech/glide/load/engine/EngineKey;->width:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->transformations:Ljava/util/Map;

    iget-object v2, p1, Lcom/bumptech/glide/load/engine/EngineKey;->transformations:Ljava/util/Map;

    .line 5
    invoke-interface {v0, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->resourceClass:Ljava/lang/Class;

    iget-object v2, p1, Lcom/bumptech/glide/load/engine/EngineKey;->resourceClass:Ljava/lang/Class;

    .line 6
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->transcodeClass:Ljava/lang/Class;

    iget-object v2, p1, Lcom/bumptech/glide/load/engine/EngineKey;->transcodeClass:Ljava/lang/Class;

    .line 7
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->options:Lcom/bumptech/glide/load/Options;

    iget-object p1, p1, Lcom/bumptech/glide/load/engine/EngineKey;->options:Lcom/bumptech/glide/load/Options;

    .line 8
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/Options;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    if-nez v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->model:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iput v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    mul-int/lit8 v0, v0, 0x1f

    .line 3
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineKey;->signature:Lcom/bumptech/glide/load/Key;

    invoke-interface {v1}, Lcom/bumptech/glide/load/Key;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    iput v1, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    mul-int/lit8 v1, v1, 0x1f

    .line 4
    iget v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->width:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    mul-int/lit8 v1, v1, 0x1f

    .line 5
    iget v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->height:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    mul-int/lit8 v1, v1, 0x1f

    .line 6
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->transformations:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    mul-int/lit8 v0, v0, 0x1f

    .line 7
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineKey;->resourceClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    iput v1, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    mul-int/lit8 v1, v1, 0x1f

    .line 8
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->transcodeClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    mul-int/lit8 v0, v0, 0x1f

    .line 9
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineKey;->options:Lcom/bumptech/glide/load/Options;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/Options;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    iput v1, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    .line 10
    :cond_0
    iget p0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->model:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/bumptech/glide/load/engine/EngineKey;->width:I

    iget v2, p0, Lcom/bumptech/glide/load/engine/EngineKey;->height:I

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/EngineKey;->resourceClass:Ljava/lang/Class;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/EngineKey;->transcodeClass:Ljava/lang/Class;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/EngineKey;->signature:Lcom/bumptech/glide/load/Key;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iget v6, p0, Lcom/bumptech/glide/load/engine/EngineKey;->hashCode:I

    iget-object v7, p0, Lcom/bumptech/glide/load/engine/EngineKey;->transformations:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    iget-object p0, p0, Lcom/bumptech/glide/load/engine/EngineKey;->options:Lcom/bumptech/glide/load/Options;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit16 v8, v8, 0x97

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v9, v8

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v8, v9

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v9, v8

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v8, v9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v9, v8

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v9, "EngineKey{model="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", width="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", height="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", resourceClass="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", transcodeClass="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", signature="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", hashCode="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", transformations="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", options="

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public updateDiskCacheKey(Ljava/security/MessageDigest;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "messageDigest"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method
