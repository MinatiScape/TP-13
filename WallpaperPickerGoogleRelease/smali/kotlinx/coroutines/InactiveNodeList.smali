.class public final Lkotlinx/coroutines/InactiveNodeList;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlinx/coroutines/Incomplete;


# instance fields
.field public final list:Lkotlinx/coroutines/NodeList;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lkotlinx/coroutines/NodeList;)V
    .locals 0
    .param p1    # Lkotlinx/coroutines/NodeList;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlinx/coroutines/InactiveNodeList;->list:Lkotlinx/coroutines/NodeList;

    return-void
.end method


# virtual methods
.method public getList()Lkotlinx/coroutines/NodeList;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lkotlinx/coroutines/InactiveNodeList;->list:Lkotlinx/coroutines/NodeList;

    return-object p0
.end method

.method public isActive()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-boolean v0, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lkotlinx/coroutines/InactiveNodeList;->list:Lkotlinx/coroutines/NodeList;

    const-string v0, "New"

    .line 3
    invoke-virtual {p0, v0}, Lkotlinx/coroutines/NodeList;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method
