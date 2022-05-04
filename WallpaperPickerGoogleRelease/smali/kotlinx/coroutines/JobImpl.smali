.class public Lkotlinx/coroutines/JobImpl;
.super Lkotlinx/coroutines/JobSupport;
.source "SourceFile"

# interfaces
.implements Lkotlinx/coroutines/CompletableJob;


# instance fields
.field public final handlesException:Z


# direct methods
.method public constructor <init>(Lkotlinx/coroutines/Job;)V
    .locals 4
    .param p1    # Lkotlinx/coroutines/Job;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, v0}, Lkotlinx/coroutines/JobSupport;-><init>(Z)V

    .line 2
    invoke-virtual {p0, p1}, Lkotlinx/coroutines/JobSupport;->initParentJobInternal$kotlinx_coroutines_core(Lkotlinx/coroutines/Job;)V

    .line 3
    iget-object p1, p0, Lkotlinx/coroutines/JobSupport;->parentHandle:Lkotlinx/coroutines/ChildHandle;

    instance-of v1, p1, Lkotlinx/coroutines/ChildHandleNode;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move-object p1, v2

    :cond_0
    check-cast p1, Lkotlinx/coroutines/ChildHandleNode;

    const/4 v1, 0x0

    if-eqz p1, :cond_3

    iget-object p1, p1, Lkotlinx/coroutines/JobNode;->job:Lkotlinx/coroutines/Job;

    check-cast p1, Lkotlinx/coroutines/JobSupport;

    if-eqz p1, :cond_3

    .line 4
    :goto_0
    invoke-virtual {p1}, Lkotlinx/coroutines/JobSupport;->getHandlesException$kotlinx_coroutines_core()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    .line 5
    :cond_1
    iget-object p1, p1, Lkotlinx/coroutines/JobSupport;->parentHandle:Lkotlinx/coroutines/ChildHandle;

    instance-of v3, p1, Lkotlinx/coroutines/ChildHandleNode;

    if-nez v3, :cond_2

    move-object p1, v2

    :cond_2
    check-cast p1, Lkotlinx/coroutines/ChildHandleNode;

    if-eqz p1, :cond_3

    iget-object p1, p1, Lkotlinx/coroutines/JobNode;->job:Lkotlinx/coroutines/Job;

    check-cast p1, Lkotlinx/coroutines/JobSupport;

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    move v0, v1

    .line 6
    :goto_1
    iput-boolean v0, p0, Lkotlinx/coroutines/JobImpl;->handlesException:Z

    return-void
.end method


# virtual methods
.method public getHandlesException$kotlinx_coroutines_core()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lkotlinx/coroutines/JobImpl;->handlesException:Z

    return p0
.end method

.method public getOnCancelComplete$kotlinx_coroutines_core()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
