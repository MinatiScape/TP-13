.class public abstract Lkotlinx/coroutines/EventLoopImplBase;
.super Lkotlinx/coroutines/EventLoopImplPlatform;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;,
        Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEventLoop.common.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EventLoop.common.kt\nkotlinx/coroutines/EventLoopImplBase\n+ 2 ThreadSafeHeap.common.kt\nkotlinx/coroutines/internal/ThreadSafeHeap\n+ 3 Synchronized.kt\nkotlinx/coroutines/internal/SynchronizedKt\n+ 4 AtomicFU.common.kt\nkotlinx/atomicfu/AtomicFU_commonKt\n*L\n1#1,523:1\n51#2:524\n52#2,7:526\n20#3:525\n93#4,2:533\n93#4,2:535\n93#4,2:537\n*E\n*S KotlinDebug\n*F\n+ 1 EventLoop.common.kt\nkotlinx/coroutines/EventLoopImplBase\n*L\n261#1:524\n261#1,7:526\n261#1:525\n287#1,2:533\n314#1,2:535\n332#1,2:537\n*E\n"
.end annotation


# static fields
.field public static final _delayed$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final _queue$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field public volatile _delayed:Ljava/lang/Object;

.field public volatile _queue:Ljava/lang/Object;

.field public volatile isCompleted:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-class v0, Ljava/lang/Object;

    const-class v1, Lkotlinx/coroutines/EventLoopImplBase;

    const-string v2, "_queue"

    invoke-static {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v2

    sput-object v2, Lkotlinx/coroutines/EventLoopImplBase;->_queue$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v2, "_delayed"

    invoke-static {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lkotlinx/coroutines/EventLoopImplBase;->_delayed$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lkotlinx/coroutines/EventLoopImplPlatform;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_queue:Ljava/lang/Object;

    .line 3
    iput-object v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_delayed:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final dispatch(Lkotlin/coroutines/CoroutineContext;Ljava/lang/Runnable;)V
    .locals 1
    .param p1    # Lkotlin/coroutines/CoroutineContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p0, p2}, Lkotlinx/coroutines/EventLoopImplBase;->enqueue(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final enqueue(Ljava/lang/Runnable;)V
    .locals 1
    .param p1    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Lkotlinx/coroutines/EventLoopImplBase;->enqueueImpl(Ljava/lang/Runnable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lkotlinx/coroutines/EventLoopImplPlatform;->getThread()Ljava/lang/Thread;

    move-result-object p0

    .line 3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    if-eq p1, p0, :cond_1

    .line 4
    invoke-static {p0}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    goto :goto_0

    .line 5
    :cond_0
    sget-object p0, Lkotlinx/coroutines/DefaultExecutor;->INSTANCE:Lkotlinx/coroutines/DefaultExecutor;

    invoke-virtual {p0, p1}, Lkotlinx/coroutines/EventLoopImplBase;->enqueue(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final enqueueImpl(Ljava/lang/Runnable;)Z
    .locals 5

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_queue:Ljava/lang/Object;

    .line 2
    iget-boolean v1, p0, Lkotlinx/coroutines/EventLoopImplBase;->isCompleted:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    return v2

    :cond_1
    const/4 v1, 0x1

    if-nez v0, :cond_2

    .line 3
    sget-object v0, Lkotlinx/coroutines/EventLoopImplBase;->_queue$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v2, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    .line 4
    :cond_2
    instance-of v3, v0, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    if-eqz v3, :cond_6

    .line 5
    move-object v3, v0

    check-cast v3, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    invoke-virtual {v3, p1}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->addLast(Ljava/lang/Object;)I

    move-result v4

    if-eqz v4, :cond_5

    if-eq v4, v1, :cond_4

    const/4 v0, 0x2

    if-eq v4, v0, :cond_3

    goto :goto_0

    :cond_3
    return v2

    .line 6
    :cond_4
    sget-object v1, Lkotlinx/coroutines/EventLoopImplBase;->_queue$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v3}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->next()Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    move-result-object v2

    invoke-virtual {v1, p0, v0, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    return v1

    .line 7
    :cond_6
    sget-object v3, Lkotlinx/coroutines/EventLoop_commonKt;->CLOSED_EMPTY:Lkotlinx/coroutines/internal/Symbol;

    if-ne v0, v3, :cond_7

    return v2

    .line 8
    :cond_7
    new-instance v2, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    const/16 v3, 0x8

    invoke-direct {v2, v3, v1}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;-><init>(IZ)V

    .line 9
    move-object v3, v0

    check-cast v3, Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->addLast(Ljava/lang/Object;)I

    .line 10
    invoke-virtual {v2, p1}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->addLast(Ljava/lang/Object;)I

    .line 11
    sget-object v3, Lkotlinx/coroutines/EventLoopImplBase;->_queue$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v3, p0, v0, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1
.end method

.method public getNextTime()J
    .locals 6

    .line 1
    invoke-super {p0}, Lkotlinx/coroutines/EventLoop;->getNextTime()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-wide v2

    .line 2
    :cond_0
    iget-object v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_queue:Ljava/lang/Object;

    const-wide v4, 0x7fffffffffffffffL

    if-nez v0, :cond_1

    goto :goto_0

    .line 3
    :cond_1
    instance-of v1, v0, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    if-eqz v1, :cond_5

    check-cast v0, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    invoke-virtual {v0}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    return-wide v2

    .line 4
    :cond_2
    :goto_0
    iget-object p0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_delayed:Ljava/lang/Object;

    check-cast p0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;

    if-eqz p0, :cond_4

    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->firstImpl()Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 7
    check-cast v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;

    if-eqz v0, :cond_4

    .line 8
    iget-wide v0, v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;->nanoTime:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long/2addr v0, v4

    cmp-long p0, v0, v2

    if-gez p0, :cond_3

    goto :goto_1

    :cond_3
    move-wide v2, v0

    :goto_1
    return-wide v2

    :catchall_0
    move-exception v0

    .line 9
    monitor-exit p0

    throw v0

    :cond_4
    return-wide v4

    .line 10
    :cond_5
    sget-object p0, Lkotlinx/coroutines/EventLoop_commonKt;->CLOSED_EMPTY:Lkotlinx/coroutines/internal/Symbol;

    if-ne v0, p0, :cond_6

    return-wide v4

    :cond_6
    return-wide v2
.end method

.method public isEmpty()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lkotlinx/coroutines/EventLoop;->unconfinedQueue:Lkotlinx/coroutines/internal/ArrayQueue;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 2
    iget v3, v0, Lkotlinx/coroutines/internal/ArrayQueue;->head:I

    iget v0, v0, Lkotlinx/coroutines/internal/ArrayQueue;->tail:I

    if-ne v3, v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v1

    :goto_1
    if-nez v0, :cond_2

    return v2

    .line 3
    :cond_2
    iget-object v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_delayed:Ljava/lang/Object;

    check-cast v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;

    if-eqz v0, :cond_4

    .line 4
    iget v0, v0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    if-nez v0, :cond_3

    move v0, v1

    goto :goto_2

    :cond_3
    move v0, v2

    :goto_2
    if-nez v0, :cond_4

    return v2

    .line 5
    :cond_4
    iget-object p0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_queue:Ljava/lang/Object;

    if-nez p0, :cond_5

    goto :goto_3

    .line 6
    :cond_5
    instance-of v0, p0, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    if-eqz v0, :cond_6

    check-cast p0, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    invoke-virtual {p0}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->isEmpty()Z

    move-result v1

    goto :goto_3

    .line 7
    :cond_6
    sget-object v0, Lkotlinx/coroutines/EventLoop_commonKt;->CLOSED_EMPTY:Lkotlinx/coroutines/internal/Symbol;

    if-ne p0, v0, :cond_7

    goto :goto_3

    :cond_7
    move v1, v2

    :goto_3
    return v1
.end method

.method public processNextEvent()J
    .locals 15

    .line 1
    invoke-virtual {p0}, Lkotlinx/coroutines/EventLoop;->processUnconfinedEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lkotlinx/coroutines/EventLoopImplBase;->getNextTime()J

    move-result-wide v0

    return-wide v0

    .line 2
    :cond_0
    iget-object v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_delayed:Ljava/lang/Object;

    check-cast v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v0, :cond_6

    .line 3
    iget v5, v0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    const/4 v6, 0x1

    if-nez v5, :cond_1

    move v5, v6

    goto :goto_0

    :cond_1
    move v5, v4

    :goto_0
    if-nez v5, :cond_6

    .line 4
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    .line 5
    :goto_1
    monitor-enter v0

    .line 6
    :try_start_0
    invoke-virtual {v0}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->firstImpl()Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 7
    check-cast v5, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;

    .line 8
    iget-wide v9, v5, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;->nanoTime:J

    sub-long v9, v7, v9

    cmp-long v9, v9, v1

    if-ltz v9, :cond_2

    move v9, v6

    goto :goto_2

    :cond_2
    move v9, v4

    :goto_2
    if-eqz v9, :cond_3

    .line 9
    invoke-virtual {p0, v5}, Lkotlinx/coroutines/EventLoopImplBase;->enqueueImpl(Ljava/lang/Runnable;)Z

    move-result v5

    goto :goto_3

    :cond_3
    move v5, v4

    :goto_3
    if-eqz v5, :cond_4

    .line 10
    invoke-virtual {v0, v4}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->removeAtImpl(I)Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_4

    :cond_4
    move-object v5, v3

    .line 11
    :goto_4
    monitor-exit v0

    goto :goto_5

    .line 12
    :cond_5
    monitor-exit v0

    move-object v5, v3

    .line 13
    :goto_5
    check-cast v5, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;

    if-eqz v5, :cond_6

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0

    throw p0

    .line 15
    :cond_6
    :goto_6
    iget-object v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_queue:Ljava/lang/Object;

    if-nez v0, :cond_7

    goto/16 :goto_c

    .line 16
    :cond_7
    instance-of v5, v0, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    if-eqz v5, :cond_11

    .line 17
    move-object v5, v0

    check-cast v5, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    .line 18
    :cond_8
    :goto_7
    iget-wide v8, v5, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->_state$internal:J

    const-wide/high16 v6, 0x1000000000000000L

    and-long/2addr v6, v8

    cmp-long v6, v6, v1

    if-eqz v6, :cond_9

    .line 19
    sget-object v6, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->REMOVE_FROZEN:Lkotlinx/coroutines/internal/Symbol;

    goto :goto_b

    .line 20
    :cond_9
    sget-object v6, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->Companion:Lkotlinx/coroutines/internal/LockFreeTaskQueueCore$Companion;

    const-wide/32 v10, 0x3fffffff

    and-long/2addr v10, v8

    shr-long/2addr v10, v4

    long-to-int v12, v10

    const-wide v10, 0xfffffffc0000000L

    and-long/2addr v10, v8

    const/16 v7, 0x1e

    shr-long/2addr v10, v7

    long-to-int v7, v10

    .line 21
    iget v10, v5, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->mask:I

    and-int/2addr v7, v10

    and-int/2addr v10, v12

    if-ne v7, v10, :cond_a

    goto :goto_8

    .line 22
    :cond_a
    iget-object v7, v5, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->array$internal:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v13

    if-nez v13, :cond_b

    .line 23
    iget-boolean v6, v5, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->singleConsumer:Z

    if-eqz v6, :cond_8

    goto :goto_8

    .line 24
    :cond_b
    instance-of v7, v13, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore$Placeholder;

    if-eqz v7, :cond_c

    :goto_8
    move-object v6, v3

    goto :goto_b

    :cond_c
    add-int/lit8 v7, v12, 0x1

    const v10, 0x3fffffff    # 1.9999999f

    and-int v14, v7, v10

    .line 25
    sget-object v7, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->_state$FU$internal:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    invoke-virtual {v6, v8, v9, v14}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore$Companion;->updateHead(JI)J

    move-result-wide v10

    move-object v6, v7

    move-object v7, v5

    invoke-virtual/range {v6 .. v11}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 26
    iget-object v6, v5, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->array$internal:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 27
    iget v7, v5, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->mask:I

    and-int/2addr v7, v12

    .line 28
    invoke-virtual {v6, v7, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    goto :goto_a

    .line 29
    :cond_d
    iget-boolean v6, v5, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->singleConsumer:Z

    if-nez v6, :cond_e

    goto :goto_7

    :cond_e
    move-object v6, v5

    .line 30
    :goto_9
    invoke-static {v6, v12, v14}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->access$removeSlowPath(Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;II)Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    move-result-object v6

    if-eqz v6, :cond_f

    goto :goto_9

    :cond_f
    :goto_a
    move-object v6, v13

    .line 31
    :goto_b
    sget-object v7, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->REMOVE_FROZEN:Lkotlinx/coroutines/internal/Symbol;

    if-eq v6, v7, :cond_10

    move-object v3, v6

    check-cast v3, Ljava/lang/Runnable;

    goto :goto_c

    .line 32
    :cond_10
    sget-object v6, Lkotlinx/coroutines/EventLoopImplBase;->_queue$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v5}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->next()Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    move-result-object v5

    invoke-virtual {v6, p0, v0, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    goto/16 :goto_6

    .line 33
    :cond_11
    sget-object v5, Lkotlinx/coroutines/EventLoop_commonKt;->CLOSED_EMPTY:Lkotlinx/coroutines/internal/Symbol;

    if-ne v0, v5, :cond_12

    goto :goto_c

    .line 34
    :cond_12
    sget-object v5, Lkotlinx/coroutines/EventLoopImplBase;->_queue$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v5, p0, v0, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    move-object v3, v0

    check-cast v3, Ljava/lang/Runnable;

    :goto_c
    if-eqz v3, :cond_13

    .line 35
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 36
    :cond_13
    invoke-virtual {p0}, Lkotlinx/coroutines/EventLoopImplBase;->getNextTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public shutdown()V
    .locals 6

    .line 1
    sget-object v0, Lkotlinx/coroutines/ThreadLocalEventLoop;->INSTANCE:Lkotlinx/coroutines/ThreadLocalEventLoop;

    .line 2
    sget-object v0, Lkotlinx/coroutines/ThreadLocalEventLoop;->ref:Ljava/lang/ThreadLocal;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->isCompleted:Z

    .line 4
    sget-boolean v2, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    .line 5
    :cond_0
    iget-object v2, p0, Lkotlinx/coroutines/EventLoopImplBase;->_queue:Ljava/lang/Object;

    if-nez v2, :cond_1

    .line 6
    sget-object v2, Lkotlinx/coroutines/EventLoopImplBase;->_queue$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 7
    sget-object v3, Lkotlinx/coroutines/EventLoop_commonKt;->CLOSED_EMPTY:Lkotlinx/coroutines/internal/Symbol;

    .line 8
    invoke-virtual {v2, p0, v1, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 9
    :cond_1
    instance-of v3, v2, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    if-eqz v3, :cond_2

    .line 10
    check-cast v2, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    invoke-virtual {v2}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->close()Z

    goto :goto_0

    .line 11
    :cond_2
    sget-object v3, Lkotlinx/coroutines/EventLoop_commonKt;->CLOSED_EMPTY:Lkotlinx/coroutines/internal/Symbol;

    if-ne v2, v3, :cond_3

    goto :goto_0

    .line 12
    :cond_3
    new-instance v3, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;

    const/16 v4, 0x8

    invoke-direct {v3, v4, v0}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;-><init>(IZ)V

    .line 13
    move-object v4, v2

    check-cast v4, Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;->addLast(Ljava/lang/Object;)I

    .line 14
    sget-object v4, Lkotlinx/coroutines/EventLoopImplBase;->_queue$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v4, p0, v2, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 15
    :goto_0
    invoke-virtual {p0}, Lkotlinx/coroutines/EventLoopImplBase;->processNextEvent()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-gtz v0, :cond_4

    goto :goto_0

    .line 16
    :cond_4
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 17
    :goto_1
    iget-object v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_delayed:Ljava/lang/Object;

    check-cast v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;

    if-eqz v0, :cond_6

    .line 18
    monitor-enter v0

    .line 19
    :try_start_0
    iget v4, v0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    if-lez v4, :cond_5

    const/4 v4, 0x0

    .line 20
    invoke-virtual {v0, v4}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->removeAtImpl(I)Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :cond_5
    move-object v4, v1

    .line 21
    :goto_2
    monitor-exit v0

    .line 22
    check-cast v4, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;

    if-eqz v4, :cond_6

    .line 23
    invoke-virtual {p0, v2, v3, v4}, Lkotlinx/coroutines/EventLoopImplPlatform;->reschedule(JLkotlinx/coroutines/EventLoopImplBase$DelayedTask;)V

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 24
    monitor-exit v0

    throw p0

    :cond_6
    return-void
.end method
