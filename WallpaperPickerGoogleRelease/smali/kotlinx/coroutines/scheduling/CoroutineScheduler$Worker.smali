.class public final Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlinx/coroutines/scheduling/CoroutineScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Worker"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCoroutineScheduler.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CoroutineScheduler.kt\nkotlinx/coroutines/scheduling/CoroutineScheduler$Worker\n+ 2 CoroutineScheduler.kt\nkotlinx/coroutines/scheduling/CoroutineScheduler\n+ 3 Synchronized.kt\nkotlinx/coroutines/internal/SynchronizedKt\n*L\n1#1,1020:1\n244#2:1021\n245#2:1022\n242#2:1024\n237#2:1025\n20#3:1023\n*E\n*S KotlinDebug\n*F\n+ 1 CoroutineScheduler.kt\nkotlinx/coroutines/scheduling/CoroutineScheduler$Worker\n*L\n753#1:1021\n777#1:1022\n856#1:1024\n856#1:1025\n856#1:1023\n*E\n"
.end annotation


# static fields
.field public static final terminationState$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;


# instance fields
.field public volatile indexInArray:I

.field public lastExhaustionTime:J

.field public lastStealIndex:I

.field public final localQueue:Lkotlinx/coroutines/scheduling/WorkQueue;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public volatile nextParkedWorker:Ljava/lang/Object;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public parkTimeNs:I

.field public rngState:I

.field public volatile spins:I

.field public volatile state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public terminationDeadline:J

.field public volatile terminationState:I

.field public final synthetic this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-class v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;

    const-string v1, "terminationState"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->terminationState$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lkotlinx/coroutines/scheduling/CoroutineScheduler;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 3
    new-instance v0, Lkotlinx/coroutines/scheduling/WorkQueue;

    invoke-direct {v0}, Lkotlinx/coroutines/scheduling/WorkQueue;-><init>()V

    iput-object v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->localQueue:Lkotlinx/coroutines/scheduling/WorkQueue;

    .line 4
    sget-object v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;->RETIRING:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    iput-object v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->terminationState:I

    .line 6
    sget-object v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->NOT_IN_STACK:Lkotlinx/coroutines/internal/Symbol;

    .line 7
    iput-object v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->nextParkedWorker:Ljava/lang/Object;

    .line 8
    sget v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->MIN_PARK_TIME_NS:I

    .line 9
    iput v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->parkTimeNs:I

    .line 10
    iget-object p1, p1, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->random:Ljava/util/Random;

    .line 11
    invoke-virtual {p1}, Ljava/util/Random;->nextInt()I

    move-result p1

    iput p1, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->rngState:I

    .line 12
    invoke-virtual {p0, p2}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->setIndexInArray(I)V

    return-void
.end method


# virtual methods
.method public final blockingQuiescence()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 2
    iget-object v0, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->globalQueue:Lkotlinx/coroutines/scheduling/GlobalQueue;

    .line 3
    sget-object v1, Lkotlinx/coroutines/scheduling/TaskMode;->PROBABLY_BLOCKING:Lkotlinx/coroutines/scheduling/TaskMode;

    invoke-virtual {v0, v1}, Lkotlinx/coroutines/scheduling/GlobalQueue;->removeFirstWithModeOrNull(Lkotlinx/coroutines/scheduling/TaskMode;)Lkotlinx/coroutines/scheduling/Task;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4
    iget-object v1, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->localQueue:Lkotlinx/coroutines/scheduling/WorkQueue;

    iget-object p0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 5
    iget-object p0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->globalQueue:Lkotlinx/coroutines/scheduling/GlobalQueue;

    .line 6
    invoke-virtual {v1, v0, p0}, Lkotlinx/coroutines/scheduling/WorkQueue;->add(Lkotlinx/coroutines/scheduling/Task;Lkotlinx/coroutines/scheduling/GlobalQueue;)Z

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public final doPark(J)Z
    .locals 9

    .line 1
    iget-object v6, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    sget-object v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->parkedWorkersStack$FU:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-object v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->nextParkedWorker:Ljava/lang/Object;

    .line 4
    sget-object v1, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->NOT_IN_STACK:Lkotlinx/coroutines/internal/Symbol;

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    iget-wide v2, v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->parkedWorkersStack:J

    const-wide/32 v0, 0x1fffff

    and-long/2addr v0, v2

    long-to-int v0, v0

    const-wide/32 v4, 0x200000

    add-long/2addr v4, v2

    const-wide/32 v7, -0x200000

    and-long/2addr v4, v7

    .line 6
    iget v1, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->indexInArray:I

    .line 7
    sget-boolean v7, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    .line 8
    iget-object v7, v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->workers:[Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;

    aget-object v0, v7, v0

    .line 9
    iput-object v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->nextParkedWorker:Ljava/lang/Object;

    .line 10
    sget-object v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->parkedWorkersStack$FU:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    int-to-long v7, v1

    or-long/2addr v4, v7

    move-object v1, v6

    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 11
    :goto_0
    invoke-virtual {p0}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->blockingQuiescence()Z

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x0

    return p0

    .line 12
    :cond_1
    invoke-static {p1, p2}, Ljava/util/concurrent/locks/LockSupport;->parkNanos(J)V

    const/4 p0, 0x1

    return p0
.end method

.method public final findTask$kotlinx_coroutines_core()Lkotlinx/coroutines/scheduling/Task;
    .locals 18
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    move-object/from16 v0, p0

    .line 1
    invoke-virtual/range {p0 .. p0}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->tryAcquireCpuPermit()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 2
    iget-object v1, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 3
    iget v1, v1, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->corePoolSize:I

    const/4 v2, 0x2

    mul-int/2addr v1, v2

    .line 4
    invoke-virtual {v0, v1}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->nextInt$kotlinx_coroutines_core(I)I

    move-result v1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v1, :cond_0

    move v1, v4

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    if-eqz v1, :cond_1

    .line 5
    iget-object v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 6
    iget-object v5, v5, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->globalQueue:Lkotlinx/coroutines/scheduling/GlobalQueue;

    .line 7
    sget-object v6, Lkotlinx/coroutines/scheduling/TaskMode;->NON_BLOCKING:Lkotlinx/coroutines/scheduling/TaskMode;

    invoke-virtual {v5, v6}, Lkotlinx/coroutines/scheduling/GlobalQueue;->removeFirstWithModeOrNull(Lkotlinx/coroutines/scheduling/TaskMode;)Lkotlinx/coroutines/scheduling/Task;

    move-result-object v5

    if-eqz v5, :cond_1

    goto/16 :goto_7

    .line 8
    :cond_1
    iget-object v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->localQueue:Lkotlinx/coroutines/scheduling/WorkQueue;

    invoke-virtual {v5}, Lkotlinx/coroutines/scheduling/WorkQueue;->poll()Lkotlinx/coroutines/scheduling/Task;

    move-result-object v5

    if-eqz v5, :cond_2

    goto/16 :goto_7

    :cond_2
    if-nez v1, :cond_3

    .line 9
    iget-object v1, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 10
    iget-object v1, v1, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->globalQueue:Lkotlinx/coroutines/scheduling/GlobalQueue;

    .line 11
    invoke-virtual {v1}, Lkotlinx/coroutines/internal/LockFreeTaskQueue;->removeFirstOrNull()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lkotlinx/coroutines/scheduling/Task;

    if-eqz v5, :cond_3

    goto/16 :goto_7

    .line 12
    :cond_3
    iget-object v1, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 13
    iget-wide v5, v1, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->controlState:J

    const-wide/32 v7, 0x1fffff

    and-long/2addr v5, v7

    long-to-int v1, v5

    const/4 v5, 0x0

    if-ge v1, v2, :cond_4

    goto/16 :goto_7

    .line 14
    :cond_4
    iget v6, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->lastStealIndex:I

    if-nez v6, :cond_5

    .line 15
    invoke-virtual {v0, v1}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->nextInt$kotlinx_coroutines_core(I)I

    move-result v6

    :cond_5
    add-int/2addr v6, v4

    if-le v6, v1, :cond_6

    move v6, v4

    .line 16
    :cond_6
    iput v6, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->lastStealIndex:I

    .line 17
    iget-object v1, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 18
    iget-object v7, v1, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->workers:[Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;

    .line 19
    aget-object v6, v7, v6

    if-eqz v6, :cond_11

    if-eq v6, v0, :cond_11

    .line 20
    iget-object v7, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->localQueue:Lkotlinx/coroutines/scheduling/WorkQueue;

    iget-object v6, v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->localQueue:Lkotlinx/coroutines/scheduling/WorkQueue;

    .line 21
    iget-object v1, v1, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->globalQueue:Lkotlinx/coroutines/scheduling/GlobalQueue;

    .line 22
    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "victim"

    .line 23
    invoke-static {v6, v8}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v8, "globalQueue"

    invoke-static {v1, v8}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    sget-object v8, Lkotlinx/coroutines/scheduling/TasksKt;->schedulerTimeSource:Lkotlinx/coroutines/scheduling/TimeSource;

    check-cast v8, Lkotlinx/coroutines/scheduling/NanoTimeSource;

    invoke-static {v8}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 26
    invoke-virtual {v6}, Lkotlinx/coroutines/scheduling/WorkQueue;->getBufferSize$kotlinx_coroutines_core()I

    move-result v10

    if-nez v10, :cond_8

    .line 27
    iget-object v2, v6, Lkotlinx/coroutines/scheduling/WorkQueue;->lastScheduledTask:Ljava/lang/Object;

    check-cast v2, Lkotlinx/coroutines/scheduling/Task;

    if-eqz v2, :cond_10

    .line 28
    iget-wide v10, v2, Lkotlinx/coroutines/scheduling/Task;->submissionTime:J

    sub-long/2addr v8, v10

    sget-wide v10, Lkotlinx/coroutines/scheduling/TasksKt;->WORK_STEALING_TIME_RESOLUTION_NS:J

    cmp-long v8, v8, v10

    if-gez v8, :cond_7

    goto/16 :goto_6

    .line 29
    :cond_7
    sget-object v8, Lkotlinx/coroutines/scheduling/WorkQueue;->lastScheduledTask$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v8, v6, v2, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_10

    .line 30
    invoke-virtual {v7, v2, v1}, Lkotlinx/coroutines/scheduling/WorkQueue;->add(Lkotlinx/coroutines/scheduling/Task;Lkotlinx/coroutines/scheduling/GlobalQueue;)Z

    move v3, v4

    goto :goto_6

    .line 31
    :cond_8
    div-int/2addr v10, v2

    if-ge v10, v4, :cond_9

    move v10, v4

    :cond_9
    move v2, v3

    move v11, v2

    :goto_1
    if-ge v2, v10, :cond_f

    .line 32
    :cond_a
    iget v12, v6, Lkotlinx/coroutines/scheduling/WorkQueue;->consumerIndex:I

    .line 33
    iget v13, v6, Lkotlinx/coroutines/scheduling/WorkQueue;->producerIndex:I

    sub-int v13, v12, v13

    if-nez v13, :cond_b

    goto :goto_4

    :cond_b
    and-int/lit8 v13, v12, 0x7f

    .line 34
    iget-object v14, v6, Lkotlinx/coroutines/scheduling/WorkQueue;->buffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 35
    invoke-virtual {v14, v13}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lkotlinx/coroutines/scheduling/Task;

    if-eqz v14, :cond_a

    .line 36
    iget-wide v14, v14, Lkotlinx/coroutines/scheduling/Task;->submissionTime:J

    sub-long v14, v8, v14

    sget-wide v16, Lkotlinx/coroutines/scheduling/TasksKt;->WORK_STEALING_TIME_RESOLUTION_NS:J

    cmp-long v14, v14, v16

    if-gez v14, :cond_d

    invoke-virtual {v6}, Lkotlinx/coroutines/scheduling/WorkQueue;->getBufferSize$kotlinx_coroutines_core()I

    move-result v14

    sget v15, Lkotlinx/coroutines/scheduling/TasksKt;->QUEUE_SIZE_OFFLOAD_THRESHOLD:I

    if-le v14, v15, :cond_c

    goto :goto_2

    :cond_c
    move v14, v3

    goto :goto_3

    :cond_d
    :goto_2
    move v14, v4

    :goto_3
    if-nez v14, :cond_e

    :goto_4
    move-object v12, v5

    goto :goto_5

    .line 37
    :cond_e
    sget-object v14, Lkotlinx/coroutines/scheduling/WorkQueue;->consumerIndex$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    add-int/lit8 v15, v12, 0x1

    invoke-virtual {v14, v6, v12, v15}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 38
    iget-object v12, v6, Lkotlinx/coroutines/scheduling/WorkQueue;->buffer:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 39
    invoke-virtual {v12, v13, v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lkotlinx/coroutines/scheduling/Task;

    :goto_5
    if-eqz v12, :cond_f

    .line 40
    invoke-virtual {v7, v12, v1}, Lkotlinx/coroutines/scheduling/WorkQueue;->add(Lkotlinx/coroutines/scheduling/Task;Lkotlinx/coroutines/scheduling/GlobalQueue;)Z

    add-int/lit8 v2, v2, 0x1

    move v11, v4

    goto :goto_1

    :cond_f
    move v3, v11

    :cond_10
    :goto_6
    if-eqz v3, :cond_11

    .line 41
    iget-object v0, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->localQueue:Lkotlinx/coroutines/scheduling/WorkQueue;

    invoke-virtual {v0}, Lkotlinx/coroutines/scheduling/WorkQueue;->poll()Lkotlinx/coroutines/scheduling/Task;

    move-result-object v0

    move-object v5, v0

    :cond_11
    :goto_7
    return-object v5

    .line 42
    :cond_12
    iget-object v1, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->localQueue:Lkotlinx/coroutines/scheduling/WorkQueue;

    invoke-virtual {v1}, Lkotlinx/coroutines/scheduling/WorkQueue;->poll()Lkotlinx/coroutines/scheduling/Task;

    move-result-object v1

    if-eqz v1, :cond_13

    goto :goto_8

    :cond_13
    iget-object v0, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 43
    iget-object v0, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->globalQueue:Lkotlinx/coroutines/scheduling/GlobalQueue;

    .line 44
    sget-object v1, Lkotlinx/coroutines/scheduling/TaskMode;->PROBABLY_BLOCKING:Lkotlinx/coroutines/scheduling/TaskMode;

    invoke-virtual {v0, v1}, Lkotlinx/coroutines/scheduling/GlobalQueue;->removeFirstWithModeOrNull(Lkotlinx/coroutines/scheduling/TaskMode;)Lkotlinx/coroutines/scheduling/Task;

    move-result-object v1

    :goto_8
    return-object v1
.end method

.method public final nextInt$kotlinx_coroutines_core(I)I
    .locals 2

    .line 1
    iget v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->rngState:I

    shl-int/lit8 v1, v0, 0xd

    xor-int/2addr v0, v1

    iput v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->rngState:I

    shr-int/lit8 v1, v0, 0x11

    xor-int/2addr v0, v1

    .line 2
    iput v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->rngState:I

    shl-int/lit8 v1, v0, 0x5

    xor-int/2addr v0, v1

    .line 3
    iput v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->rngState:I

    add-int/lit8 p0, p1, -0x1

    and-int v1, p0, p1

    if-nez v1, :cond_0

    and-int/2addr p0, v0

    return p0

    :cond_0
    const p0, 0x7fffffff

    and-int/2addr p0, v0

    .line 4
    rem-int/2addr p0, p1

    return p0
.end method

.method public run()V
    .locals 17

    move-object/from16 v0, p0

    .line 1
    sget-object v1, Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;->BLOCKING:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    sget-object v2, Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;->TERMINATED:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    sget-object v3, Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;->PARKING:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    const/4 v4, 0x0

    move v5, v4

    .line 2
    :goto_0
    iget-object v6, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 3
    iget v6, v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->_isTerminated:I

    const/4 v7, 0x1

    if-eqz v6, :cond_0

    move v6, v7

    goto :goto_1

    :cond_0
    move v6, v4

    :goto_1
    if-nez v6, :cond_18

    .line 4
    iget-object v6, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    if-eq v6, v2, :cond_18

    .line 5
    invoke-virtual/range {p0 .. p0}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->findTask$kotlinx_coroutines_core()Lkotlinx/coroutines/scheduling/Task;

    move-result-object v6

    const-wide/16 v8, 0x0

    if-nez v6, :cond_10

    .line 6
    iget-object v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    sget-object v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;->CPU_ACQUIRED:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    if-ne v5, v6, :cond_4

    .line 7
    iget v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->spins:I

    .line 8
    sget v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->MAX_YIELDS:I

    if-gt v5, v6, :cond_1

    add-int/lit8 v6, v5, 0x1

    .line 9
    iput v6, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->spins:I

    .line 10
    sget v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->MAX_SPINS:I

    if-lt v5, v6, :cond_f

    .line 11
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto/16 :goto_5

    .line 12
    :cond_1
    iget v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->parkTimeNs:I

    .line 13
    sget v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->MAX_PARK_TIME_NS:I

    if-ge v5, v6, :cond_3

    mul-int/lit8 v5, v5, 0x3

    ushr-int/2addr v5, v7

    if-le v5, v6, :cond_2

    goto :goto_2

    :cond_2
    move v6, v5

    .line 14
    :goto_2
    iput v6, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->parkTimeNs:I

    .line 15
    :cond_3
    invoke-virtual {v0, v3}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->tryReleaseCpu$kotlinx_coroutines_core(Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;)Z

    .line 16
    iget v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->parkTimeNs:I

    int-to-long v5, v5

    invoke-virtual {v0, v5, v6}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->doPark(J)Z

    goto/16 :goto_5

    .line 17
    :cond_4
    invoke-virtual {v0, v3}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->tryReleaseCpu$kotlinx_coroutines_core(Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;)Z

    .line 18
    invoke-virtual/range {p0 .. p0}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->blockingQuiescence()Z

    move-result v5

    if-nez v5, :cond_5

    goto/16 :goto_5

    .line 19
    :cond_5
    iput v4, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->terminationState:I

    .line 20
    iget-wide v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->terminationDeadline:J

    cmp-long v5, v5, v8

    if-nez v5, :cond_6

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    iget-object v10, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 21
    iget-wide v10, v10, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->idleWorkerKeepAliveNs:J

    add-long/2addr v5, v10

    .line 22
    iput-wide v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->terminationDeadline:J

    .line 23
    :cond_6
    iget-object v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 24
    iget-wide v5, v5, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->idleWorkerKeepAliveNs:J

    .line 25
    invoke-virtual {v0, v5, v6}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->doPark(J)Z

    move-result v5

    if-nez v5, :cond_7

    goto/16 :goto_5

    .line 26
    :cond_7
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    iget-wide v10, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->terminationDeadline:J

    sub-long/2addr v5, v10

    cmp-long v5, v5, v8

    if-ltz v5, :cond_f

    .line 27
    iput-wide v8, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->terminationDeadline:J

    .line 28
    iget-object v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 29
    iget-object v5, v5, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->workers:[Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;

    .line 30
    monitor-enter v5

    .line 31
    :try_start_0
    iget-object v6, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 32
    iget v6, v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->_isTerminated:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v6, :cond_8

    move v6, v7

    goto :goto_3

    :cond_8
    move v6, v4

    :goto_3
    if-eqz v6, :cond_9

    .line 33
    monitor-exit v5

    goto :goto_5

    .line 34
    :cond_9
    :try_start_1
    iget-object v6, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 35
    iget-wide v8, v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->controlState:J

    const-wide/32 v10, 0x1fffff

    and-long/2addr v8, v10

    long-to-int v6, v8

    .line 36
    iget-object v8, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 37
    iget v8, v8, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->corePoolSize:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-gt v6, v8, :cond_a

    .line 38
    monitor-exit v5

    goto :goto_5

    .line 39
    :cond_a
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->blockingQuiescence()Z

    move-result v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v6, :cond_b

    monitor-exit v5

    goto :goto_5

    .line 40
    :cond_b
    :try_start_3
    sget-object v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->terminationState$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v6, v0, v4, v7}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez v6, :cond_c

    monitor-exit v5

    goto :goto_5

    .line 41
    :cond_c
    :try_start_4
    iget v6, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->indexInArray:I

    .line 42
    invoke-virtual {v0, v4}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->setIndexInArray(I)V

    .line 43
    iget-object v8, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    invoke-static {v8, v0, v6, v4}, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->access$parkedWorkersStackTopUpdate(Lkotlinx/coroutines/scheduling/CoroutineScheduler;Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;II)V

    .line 44
    iget-object v8, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 45
    sget-object v9, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->controlState$FU:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v9, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndDecrement(Ljava/lang/Object;)J

    move-result-wide v8

    and-long/2addr v8, v10

    long-to-int v8, v8

    const/4 v9, 0x0

    if-eq v8, v6, :cond_e

    .line 46
    iget-object v10, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 47
    iget-object v10, v10, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->workers:[Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;

    .line 48
    aget-object v11, v10, v8

    if-eqz v11, :cond_d

    .line 49
    aput-object v11, v10, v6

    .line 50
    invoke-virtual {v11, v6}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->setIndexInArray(I)V

    .line 51
    iget-object v10, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    invoke-static {v10, v11, v8, v6}, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->access$parkedWorkersStackTopUpdate(Lkotlinx/coroutines/scheduling/CoroutineScheduler;Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;II)V

    goto :goto_4

    .line 52
    :cond_d
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v9

    .line 53
    :cond_e
    :goto_4
    iget-object v6, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 54
    iget-object v6, v6, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->workers:[Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;

    .line 55
    aput-object v9, v6, v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 56
    monitor-exit v5

    .line 57
    iput-object v2, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    goto :goto_5

    :catchall_0
    move-exception v0

    .line 58
    monitor-exit v5

    throw v0

    :cond_f
    :goto_5
    move v5, v7

    goto/16 :goto_8

    .line 59
    :cond_10
    invoke-virtual {v6}, Lkotlinx/coroutines/scheduling/Task;->getMode()Lkotlinx/coroutines/scheduling/TaskMode;

    move-result-object v7

    if-eqz v5, :cond_12

    .line 60
    iput-wide v8, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->terminationDeadline:J

    .line 61
    iput v4, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->lastStealIndex:I

    .line 62
    iget-object v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    if-ne v5, v3, :cond_11

    .line 63
    sget-boolean v5, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    .line 64
    iput-object v1, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    .line 65
    sget v5, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->MIN_PARK_TIME_NS:I

    .line 66
    iput v5, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->parkTimeNs:I

    .line 67
    :cond_11
    iput v4, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->spins:I

    move v5, v4

    .line 68
    :cond_12
    iget-wide v8, v6, Lkotlinx/coroutines/scheduling/Task;->submissionTime:J

    .line 69
    sget-object v10, Lkotlinx/coroutines/scheduling/TaskMode;->NON_BLOCKING:Lkotlinx/coroutines/scheduling/TaskMode;

    if-eq v7, v10, :cond_14

    .line 70
    iget-object v8, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 71
    sget-object v9, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->controlState$FU:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-wide/32 v11, 0x200000

    invoke-virtual {v9, v8, v11, v12}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    .line 72
    invoke-virtual {v0, v1}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->tryReleaseCpu$kotlinx_coroutines_core(Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;)Z

    move-result v8

    if-eqz v8, :cond_13

    .line 73
    iget-object v8, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 74
    invoke-virtual {v8}, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->requestCpuWorker()V

    :cond_13
    :goto_6
    move/from16 v16, v5

    goto :goto_7

    .line 75
    :cond_14
    iget-object v11, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 76
    iget-object v11, v11, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->cpuPermits:Ljava/util/concurrent/Semaphore;

    .line 77
    invoke-virtual {v11}, Ljava/util/concurrent/Semaphore;->availablePermits()I

    move-result v11

    if-nez v11, :cond_15

    goto :goto_6

    .line 78
    :cond_15
    sget-object v11, Lkotlinx/coroutines/scheduling/TasksKt;->schedulerTimeSource:Lkotlinx/coroutines/scheduling/TimeSource;

    check-cast v11, Lkotlinx/coroutines/scheduling/NanoTimeSource;

    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v11

    sub-long v8, v11, v8

    .line 80
    sget-wide v13, Lkotlinx/coroutines/scheduling/TasksKt;->WORK_STEALING_TIME_RESOLUTION_NS:J

    cmp-long v8, v8, v13

    if-ltz v8, :cond_13

    .line 81
    iget-wide v8, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->lastExhaustionTime:J

    sub-long v8, v11, v8

    const/4 v15, 0x5

    move/from16 v16, v5

    int-to-long v4, v15

    mul-long/2addr v13, v4

    cmp-long v4, v8, v13

    if-ltz v4, :cond_16

    .line 82
    iput-wide v11, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->lastExhaustionTime:J

    .line 83
    iget-object v4, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 84
    invoke-virtual {v4}, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->requestCpuWorker()V

    .line 85
    :cond_16
    :goto_7
    iget-object v4, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 86
    invoke-virtual {v4, v6}, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->runSafely(Lkotlinx/coroutines/scheduling/Task;)V

    if-eq v7, v10, :cond_17

    .line 87
    iget-object v4, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 88
    sget-object v5, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->controlState$FU:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    const-wide/32 v6, -0x200000

    invoke-virtual {v5, v4, v6, v7}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    .line 89
    iget-object v4, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    if-eq v4, v2, :cond_17

    .line 90
    sget-boolean v4, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    .line 91
    sget-object v4, Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;->RETIRING:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    iput-object v4, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    :cond_17
    move/from16 v5, v16

    :goto_8
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 92
    :cond_18
    invoke-virtual {v0, v2}, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->tryReleaseCpu$kotlinx_coroutines_core(Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;)Z

    return-void
.end method

.method public final setIndexInArray(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 2
    iget-object v1, v1, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->schedulerName:Ljava/lang/String;

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "-worker-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_0

    const-string v1, "TERMINATED"

    goto :goto_0

    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 4
    iput p1, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->indexInArray:I

    return-void
.end method

.method public final tryAcquireCpuPermit()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    sget-object v1, Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;->CPU_ACQUIRED:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 3
    iget-object v0, v0, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->cpuPermits:Ljava/util/concurrent/Semaphore;

    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 5
    iput-object v1, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method public final tryReleaseCpu$kotlinx_coroutines_core(Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;)Z
    .locals 3
    .param p1    # Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    .line 2
    sget-object v1, Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;->CPU_ACQUIRED:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    if-ne v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 3
    iget-object v2, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->this$0:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    .line 4
    iget-object v2, v2, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->cpuPermits:Ljava/util/concurrent/Semaphore;

    .line 5
    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    :cond_1
    if-eq v0, p1, :cond_2

    .line 6
    iput-object p1, p0, Lkotlinx/coroutines/scheduling/CoroutineScheduler$Worker;->state:Lkotlinx/coroutines/scheduling/CoroutineScheduler$WorkerState;

    :cond_2
    return v1
.end method
