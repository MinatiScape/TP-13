.class public final Lkotlinx/coroutines/JobSupport$Finishing;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlinx/coroutines/Incomplete;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlinx/coroutines/JobSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Finishing"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJobSupport.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JobSupport.kt\nkotlinx/coroutines/JobSupport$Finishing\n*L\n1#1,1424:1\n*E\n"
.end annotation


# instance fields
.field public volatile _exceptionsHolder:Ljava/lang/Object;

.field public volatile isCompleting:Z

.field public final list:Lkotlinx/coroutines/NodeList;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public volatile rootCause:Ljava/lang/Throwable;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lkotlinx/coroutines/NodeList;ZLjava/lang/Throwable;)V
    .locals 0
    .param p1    # Lkotlinx/coroutines/NodeList;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlinx/coroutines/JobSupport$Finishing;->list:Lkotlinx/coroutines/NodeList;

    iput-boolean p2, p0, Lkotlinx/coroutines/JobSupport$Finishing;->isCompleting:Z

    iput-object p3, p0, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final addExceptionLocked(Ljava/lang/Throwable;)V
    .locals 2
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "exception"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    iget-object v0, p0, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    .line 2
    iput-object p1, p0, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;

    return-void

    :cond_0
    if-ne p1, v0, :cond_1

    return-void

    .line 3
    :cond_1
    iget-object v0, p0, Lkotlinx/coroutines/JobSupport$Finishing;->_exceptionsHolder:Ljava/lang/Object;

    if-nez v0, :cond_2

    .line 4
    iput-object p1, p0, Lkotlinx/coroutines/JobSupport$Finishing;->_exceptionsHolder:Ljava/lang/Object;

    goto :goto_0

    .line 5
    :cond_2
    instance-of v1, v0, Ljava/lang/Throwable;

    if-eqz v1, :cond_4

    if-ne p1, v0, :cond_3

    return-void

    .line 6
    :cond_3
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport$Finishing;->allocateList()Ljava/util/ArrayList;

    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    iput-object v1, p0, Lkotlinx/coroutines/JobSupport$Finishing;->_exceptionsHolder:Ljava/lang/Object;

    goto :goto_0

    .line 10
    :cond_4
    instance-of p0, v0, Ljava/util/ArrayList;

    if-eqz p0, :cond_5

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void

    .line 11
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "State is "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final allocateList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    return-object p0
.end method

.method public getList()Lkotlinx/coroutines/NodeList;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lkotlinx/coroutines/JobSupport$Finishing;->list:Lkotlinx/coroutines/NodeList;

    return-object p0
.end method

.method public isActive()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final isCancelling()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final isSealed()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lkotlinx/coroutines/JobSupport$Finishing;->_exceptionsHolder:Ljava/lang/Object;

    .line 2
    sget-object v0, Lkotlinx/coroutines/JobSupportKt;->SEALED:Lkotlinx/coroutines/internal/Symbol;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final sealLocked(Ljava/lang/Throwable;)Ljava/util/List;
    .locals 3
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lkotlinx/coroutines/JobSupport$Finishing;->_exceptionsHolder:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport$Finishing;->allocateList()Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_0

    .line 3
    :cond_0
    instance-of v1, v0, Ljava/lang/Throwable;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport$Finishing;->allocateList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v0, v1

    goto :goto_0

    .line 4
    :cond_1
    instance-of v1, v0, Ljava/util/ArrayList;

    if-eqz v1, :cond_4

    check-cast v0, Ljava/util/ArrayList;

    .line 5
    :goto_0
    iget-object v1, p0, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;

    if-eqz v1, :cond_2

    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_2
    if-eqz p1, :cond_3

    .line 7
    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_3

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    :cond_3
    sget-object p1, Lkotlinx/coroutines/JobSupportKt;->SEALED:Lkotlinx/coroutines/internal/Symbol;

    .line 9
    iput-object p1, p0, Lkotlinx/coroutines/JobSupport$Finishing;->_exceptionsHolder:Ljava/lang/Object;

    return-object v0

    .line 10
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "State is "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "Finishing[cancelling="

    .line 1
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport$Finishing;->isCancelling()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", completing="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lkotlinx/coroutines/JobSupport$Finishing;->isCompleting:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", rootCause="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", exceptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lkotlinx/coroutines/JobSupport$Finishing;->_exceptionsHolder:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", list="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2
    iget-object p0, p0, Lkotlinx/coroutines/JobSupport$Finishing;->list:Lkotlinx/coroutines/NodeList;

    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x5d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
