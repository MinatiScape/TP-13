.class public final Lkotlinx/coroutines/scheduling/WorkQueue;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nWorkQueue.kt\nKotlin\n*S Kotlin\n*F\n+ 1 WorkQueue.kt\nkotlinx/coroutines/scheduling/WorkQueue\n+ 2 WorkQueue.kt\nkotlinx/coroutines/scheduling/WorkQueue$pollExternal$1\n*L\n1#1,203:1\n167#1,7:204\n174#1,5:212\n168#1,11:217\n167#1,7:228\n174#1,5:236\n167#1,7:241\n174#1,5:249\n168#1,14:254\n167#2:211\n167#2:235\n167#2:248\n*E\n*S KotlinDebug\n*F\n+ 1 WorkQueue.kt\nkotlinx/coroutines/scheduling/WorkQueue\n*L\n66#1,7:204\n66#1,5:212\n108#1,11:217\n142#1,7:228\n142#1,5:236\n160#1,7:241\n160#1,5:249\n66#1:211\n142#1:235\n160#1:248\n*E\n"
.end annotation


# static fields
.field public static final consumerIndex$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

.field public static final lastScheduledTask$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final producerIndex$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;


# instance fields
.field public final buffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "Lkotlinx/coroutines/scheduling/Task;",
            ">;"
        }
    .end annotation
.end field

.field public volatile consumerIndex:I

.field public volatile lastScheduledTask:Ljava/lang/Object;

.field public volatile producerIndex:I


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const-class v0, Lkotlinx/coroutines/scheduling/WorkQueue;

    const-class v1, Ljava/lang/Object;

    const-string v2, "lastScheduledTask"

    invoke-static {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v1

    sput-object v1, Lkotlinx/coroutines/scheduling/WorkQueue;->lastScheduledTask$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v1, "producerIndex"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v1

    sput-object v1, Lkotlinx/coroutines/scheduling/WorkQueue;->producerIndex$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const-string v1, "consumerIndex"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lkotlinx/coroutines/scheduling/WorkQueue;->consumerIndex$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    iput-object v0, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->buffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->lastScheduledTask:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->producerIndex:I

    .line 5
    iput v0, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->consumerIndex:I

    return-void
.end method


# virtual methods
.method public final add(Lkotlinx/coroutines/scheduling/Task;Lkotlinx/coroutines/scheduling/GlobalQueue;)Z
    .locals 1
    .param p1    # Lkotlinx/coroutines/scheduling/Task;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlinx/coroutines/scheduling/GlobalQueue;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "globalQueue"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    sget-object v0, Lkotlinx/coroutines/scheduling/WorkQueue;->lastScheduledTask$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->getAndSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkotlinx/coroutines/scheduling/Task;

    if-eqz p1, :cond_0

    .line 2
    invoke-virtual {p0, p1, p2}, Lkotlinx/coroutines/scheduling/WorkQueue;->addLast(Lkotlinx/coroutines/scheduling/Task;Lkotlinx/coroutines/scheduling/GlobalQueue;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public final addLast(Lkotlinx/coroutines/scheduling/Task;Lkotlinx/coroutines/scheduling/GlobalQueue;)Z
    .locals 9
    .param p1    # Lkotlinx/coroutines/scheduling/Task;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlinx/coroutines/scheduling/GlobalQueue;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "globalQueue"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    move v2, v1

    .line 1
    :goto_0
    invoke-virtual {p0}, Lkotlinx/coroutines/scheduling/WorkQueue;->getBufferSize$kotlinx_coroutines_core()I

    move-result v3

    const/16 v4, 0x7f

    if-ne v3, v4, :cond_0

    goto :goto_1

    .line 2
    :cond_0
    iget v3, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->producerIndex:I

    and-int/2addr v3, v4

    .line 3
    iget-object v4, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->buffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    :goto_1
    move v3, v0

    goto :goto_2

    .line 4
    :cond_1
    iget-object v4, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->buffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v4, v3, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->lazySet(ILjava/lang/Object;)V

    .line 5
    sget-object v3, Lkotlinx/coroutines/scheduling/WorkQueue;->producerIndex$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v3, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->incrementAndGet(Ljava/lang/Object;)I

    move v3, v1

    :goto_2
    if-nez v3, :cond_6

    .line 6
    invoke-virtual {p0}, Lkotlinx/coroutines/scheduling/WorkQueue;->getBufferSize$kotlinx_coroutines_core()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    if-ge v2, v1, :cond_2

    move v2, v1

    :cond_2
    move v3, v0

    :goto_3
    if-ge v3, v2, :cond_5

    .line 7
    :cond_3
    iget v4, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->consumerIndex:I

    .line 8
    iget v5, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->producerIndex:I

    sub-int v5, v4, v5

    const/4 v6, 0x0

    if-nez v5, :cond_4

    goto :goto_4

    :cond_4
    and-int/lit8 v5, v4, 0x7f

    .line 9
    iget-object v7, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->buffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 10
    invoke-virtual {v7, v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/coroutines/scheduling/Task;

    if-eqz v7, :cond_3

    .line 11
    sget-object v7, Lkotlinx/coroutines/scheduling/WorkQueue;->consumerIndex$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v7, p0, v4, v8}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 12
    iget-object v4, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->buffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 13
    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Lkotlinx/coroutines/scheduling/Task;

    :goto_4
    if-eqz v6, :cond_5

    .line 14
    invoke-virtual {p0, p2, v6}, Lkotlinx/coroutines/scheduling/WorkQueue;->addToGlobalQueue(Lkotlinx/coroutines/scheduling/GlobalQueue;Lkotlinx/coroutines/scheduling/Task;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_5
    move v2, v0

    goto :goto_0

    :cond_6
    return v2
.end method

.method public final addToGlobalQueue(Lkotlinx/coroutines/scheduling/GlobalQueue;Lkotlinx/coroutines/scheduling/Task;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Lkotlinx/coroutines/internal/LockFreeTaskQueue;->addLast(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "GlobalQueue could not be closed yet"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final getBufferSize$kotlinx_coroutines_core()I
    .locals 1

    .line 1
    iget v0, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->producerIndex:I

    iget p0, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->consumerIndex:I

    sub-int/2addr v0, p0

    return v0
.end method

.method public final poll()Lkotlinx/coroutines/scheduling/Task;
    .locals 5
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lkotlinx/coroutines/scheduling/WorkQueue;->lastScheduledTask$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->getAndSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/coroutines/scheduling/Task;

    if-eqz v0, :cond_0

    move-object v1, v0

    goto :goto_0

    .line 2
    :cond_0
    iget v0, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->consumerIndex:I

    .line 3
    iget v2, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->producerIndex:I

    sub-int v2, v0, v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    and-int/lit8 v2, v0, 0x7f

    .line 4
    iget-object v3, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->buffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 5
    invoke-virtual {v3, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkotlinx/coroutines/scheduling/Task;

    if-eqz v3, :cond_0

    .line 6
    sget-object v3, Lkotlinx/coroutines/scheduling/WorkQueue;->consumerIndex$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, p0, v0, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 7
    iget-object p0, p0, Lkotlinx/coroutines/scheduling/WorkQueue;->buffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 8
    invoke-virtual {p0, v2, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lkotlinx/coroutines/scheduling/Task;

    :goto_0
    return-object v1
.end method
