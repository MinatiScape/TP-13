.class public Landroidx/lifecycle/runtime/R$id;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static isOOM(Ljava/lang/Throwable;)Z
    .locals 1

    :goto_0
    if-eqz p0, :cond_1

    .line 1
    instance-of v0, p0, Ljava/lang/OutOfMemoryError;

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 2
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method
