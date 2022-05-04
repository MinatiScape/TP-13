.class public abstract Lkotlinx/coroutines/EventLoopImplPlatform;
.super Lkotlinx/coroutines/EventLoop;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEventLoop.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EventLoop.kt\nkotlinx/coroutines/EventLoopImplPlatform\n*L\n1#1,49:1\n*E\n"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lkotlinx/coroutines/EventLoop;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getThread()Ljava/lang/Thread;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method

.method public final reschedule(JLkotlinx/coroutines/EventLoopImplBase$DelayedTask;)V
    .locals 12
    .param p3    # Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget-boolean p0, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    .line 2
    sget-object p0, Lkotlinx/coroutines/DefaultExecutor;->INSTANCE:Lkotlinx/coroutines/DefaultExecutor;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-boolean v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->isCompleted:Z

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 4
    :cond_0
    iget-object v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_delayed:Ljava/lang/Object;

    check-cast v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;

    if-eqz v0, :cond_1

    goto :goto_0

    .line 5
    :cond_1
    sget-object v0, Lkotlinx/coroutines/EventLoopImplBase;->_delayed$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    new-instance v5, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;

    invoke-direct {v5, p1, p2}, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;-><init>(J)V

    invoke-virtual {v0, p0, v4, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    iget-object v0, p0, Lkotlinx/coroutines/EventLoopImplBase;->_delayed:Ljava/lang/Object;

    if-eqz v0, :cond_e

    check-cast v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;

    .line 7
    :goto_0
    monitor-enter p3

    .line 8
    :try_start_0
    iget-object v5, p3, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;->_heap:Ljava/lang/Object;

    .line 9
    sget-object v6, Lkotlinx/coroutines/EventLoop_commonKt;->DISPOSED_TASK:Lkotlinx/coroutines/internal/Symbol;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-ne v5, v6, :cond_2

    .line 10
    monitor-exit p3

    move v0, v2

    goto :goto_3

    .line 11
    :cond_2
    :try_start_1
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 12
    :try_start_2
    invoke-virtual {v0}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->firstImpl()Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    move-result-object v5

    check-cast v5, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;

    .line 13
    iget-boolean v6, p0, Lkotlinx/coroutines/EventLoopImplBase;->isCompleted:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v6, :cond_3

    .line 14
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    monitor-exit p3

    :goto_1
    move v0, v3

    goto :goto_3

    :cond_3
    const-wide/16 v6, 0x0

    if-nez v5, :cond_4

    .line 15
    :try_start_4
    iput-wide p1, v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;->timeNow:J

    goto :goto_2

    .line 16
    :cond_4
    iget-wide v8, v5, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;->nanoTime:J

    sub-long v10, v8, p1

    cmp-long v5, v10, v6

    if-ltz v5, :cond_5

    move-wide v8, p1

    .line 17
    :cond_5
    iget-wide v10, v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;->timeNow:J

    sub-long v10, v8, v10

    cmp-long v5, v10, v6

    if-lez v5, :cond_6

    iput-wide v8, v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;->timeNow:J

    .line 18
    :cond_6
    :goto_2
    iget-wide v8, p3, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;->nanoTime:J

    iget-wide v10, v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;->timeNow:J

    sub-long/2addr v8, v10

    cmp-long v5, v8, v6

    if-gez v5, :cond_7

    iput-wide v10, p3, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;->nanoTime:J

    .line 19
    :cond_7
    invoke-virtual {v0, p3}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->addImpl(Lkotlinx/coroutines/internal/ThreadSafeHeapNode;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 20
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 21
    monitor-exit p3

    move v0, v1

    :goto_3
    if-eqz v0, :cond_a

    if-eq v0, v3, :cond_9

    if-ne v0, v2, :cond_8

    goto :goto_5

    :cond_8
    const-string p0, "unexpected result"

    .line 22
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 23
    :cond_9
    invoke-virtual {p0, p1, p2, p3}, Lkotlinx/coroutines/EventLoopImplPlatform;->reschedule(JLkotlinx/coroutines/EventLoopImplBase$DelayedTask;)V

    goto :goto_5

    .line 24
    :cond_a
    iget-object p1, p0, Lkotlinx/coroutines/EventLoopImplBase;->_delayed:Ljava/lang/Object;

    check-cast p1, Lkotlinx/coroutines/EventLoopImplBase$DelayedTaskQueue;

    if-eqz p1, :cond_b

    .line 25
    monitor-enter p1

    .line 26
    :try_start_6
    invoke-virtual {p1}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->firstImpl()Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    move-result-object p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    monitor-exit p1

    .line 27
    move-object v4, p2

    check-cast v4, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;

    goto :goto_4

    :catchall_0
    move-exception p0

    .line 28
    monitor-exit p1

    throw p0

    :cond_b
    :goto_4
    if-ne v4, p3, :cond_c

    move v1, v3

    :cond_c
    if-eqz v1, :cond_d

    .line 29
    invoke-virtual {p0}, Lkotlinx/coroutines/DefaultExecutor;->getThread()Ljava/lang/Thread;

    move-result-object p0

    .line 30
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    if-eq p1, p0, :cond_d

    .line 31
    invoke-static {p0}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    :cond_d
    :goto_5
    return-void

    :catchall_1
    move-exception p0

    .line 32
    :try_start_7
    monitor-exit v0

    throw p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :catchall_2
    move-exception p0

    monitor-exit p3

    throw p0

    .line 33
    :cond_e
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v4
.end method
