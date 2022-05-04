.class public interface abstract Lcom/bumptech/glide/request/RequestCoordinator;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract canNotifyCleared(Lcom/bumptech/glide/request/Request;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "request"
        }
    .end annotation
.end method

.method public abstract canNotifyStatusChanged(Lcom/bumptech/glide/request/Request;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "request"
        }
    .end annotation
.end method

.method public abstract canSetImage(Lcom/bumptech/glide/request/Request;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "request"
        }
    .end annotation
.end method

.method public abstract isAnyResourceSet()Z
.end method

.method public abstract onRequestFailed(Lcom/bumptech/glide/request/Request;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "request"
        }
    .end annotation
.end method

.method public abstract onRequestSuccess(Lcom/bumptech/glide/request/Request;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "request"
        }
    .end annotation
.end method
