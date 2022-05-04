.class public final Lcom/bumptech/glide/load/model/ModelCache$ModelKey;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/ModelCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ModelKey"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final KEY_QUEUE:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/bumptech/glide/load/model/ModelCache$ModelKey<",
            "*>;>;"
        }
    .end annotation
.end field


# instance fields
.field public height:I

.field public model:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TA;"
        }
    .end annotation
.end field

.field public width:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/bumptech/glide/util/Util;->HEX_CHAR_ARRAY:[C

    .line 2
    new-instance v0, Ljava/util/ArrayDeque;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    .line 3
    sput-object v0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->KEY_QUEUE:Ljava/util/Queue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Ljava/lang/Object;II)Lcom/bumptech/glide/load/model/ModelCache$ModelKey;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "model",
            "width",
            "height"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            ">(TA;II)",
            "Lcom/bumptech/glide/load/model/ModelCache$ModelKey<",
            "TA;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->KEY_QUEUE:Ljava/util/Queue;

    monitor-enter v0

    .line 2
    :try_start_0
    move-object v1, v0

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;

    .line 3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 4
    new-instance v1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;

    invoke-direct {v1}, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;-><init>()V

    .line 5
    :cond_0
    iput-object p0, v1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->model:Ljava/lang/Object;

    .line 6
    iput p1, v1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->width:I

    .line 7
    iput p2, v1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->height:I

    return-object v1

    .line 8
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
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
    instance-of v0, p1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;

    .line 3
    iget v0, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->width:I

    iget v2, p1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->width:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->height:I

    iget v2, p1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->height:I

    if-ne v0, v2, :cond_0

    iget-object p0, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->model:Ljava/lang/Object;

    iget-object p1, p1, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->model:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->height:I

    mul-int/lit8 v0, v0, 0x1f

    .line 2
    iget v1, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->width:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->model:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    sget-object v0, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->KEY_QUEUE:Ljava/util/Queue;

    monitor-enter v0

    .line 2
    :try_start_0
    move-object v1, v0

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1, p0}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 3
    monitor-exit v0

    return-void

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method
