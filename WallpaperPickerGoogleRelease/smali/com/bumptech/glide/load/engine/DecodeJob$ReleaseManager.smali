.class public Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/DecodeJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReleaseManager"
.end annotation


# instance fields
.field public isEncodeComplete:Z

.field public isFailed:Z

.field public isReleased:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final isComplete(Z)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "isRemovedFromQueue"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isFailed:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isEncodeComplete:Z

    if-eqz p1, :cond_1

    :cond_0
    iget-boolean p0, p0, Lcom/bumptech/glide/load/engine/DecodeJob$ReleaseManager;->isReleased:Z

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
