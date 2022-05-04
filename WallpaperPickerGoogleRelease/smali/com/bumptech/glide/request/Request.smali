.class public interface abstract Lcom/bumptech/glide/request/Request;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract begin()V
.end method

.method public abstract clear()V
.end method

.method public abstract isCleared()Z
.end method

.method public abstract isComplete()Z
.end method

.method public abstract isEquivalentTo(Lcom/bumptech/glide/request/Request;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "other"
        }
    .end annotation
.end method

.method public abstract isResourceSet()Z
.end method

.method public abstract isRunning()Z
.end method

.method public abstract recycle()V
.end method
