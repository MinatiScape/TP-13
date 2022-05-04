.class public Lkotlinx/coroutines/scheduling/ExperimentalCoroutineDispatcher;
.super Lkotlinx/coroutines/ExecutorCoroutineDispatcher;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDispatcher.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Dispatcher.kt\nkotlinx/coroutines/scheduling/ExperimentalCoroutineDispatcher\n*L\n1#1,229:1\n*E\n"
.end annotation


# instance fields
.field public final corePoolSize:I

.field public coroutineScheduler:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

.field public final idleWorkerKeepAliveNs:J

.field public final maxPoolSize:I

.field public final schedulerName:Ljava/lang/String;


# direct methods
.method public constructor <init>(IILjava/lang/String;I)V
    .locals 6

    and-int/lit8 p3, p4, 0x1

    if-eqz p3, :cond_0

    .line 1
    sget p1, Lkotlinx/coroutines/scheduling/TasksKt;->CORE_POOL_SIZE:I

    :cond_0
    move v1, p1

    and-int/lit8 p1, p4, 0x2

    if-eqz p1, :cond_1

    .line 2
    sget p2, Lkotlinx/coroutines/scheduling/TasksKt;->MAX_POOL_SIZE:I

    :cond_1
    move v2, p2

    and-int/lit8 p1, p4, 0x4

    if-eqz p1, :cond_2

    const-string p1, "DefaultDispatcher"

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    move-object v5, p1

    const-string p1, "schedulerName"

    .line 3
    invoke-static {v5, p1}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    sget-wide v3, Lkotlinx/coroutines/scheduling/TasksKt;->IDLE_WORKER_KEEP_ALIVE_NS:J

    .line 5
    invoke-direct {p0}, Lkotlinx/coroutines/ExecutorCoroutineDispatcher;-><init>()V

    iput v1, p0, Lkotlinx/coroutines/scheduling/ExperimentalCoroutineDispatcher;->corePoolSize:I

    iput v2, p0, Lkotlinx/coroutines/scheduling/ExperimentalCoroutineDispatcher;->maxPoolSize:I

    iput-wide v3, p0, Lkotlinx/coroutines/scheduling/ExperimentalCoroutineDispatcher;->idleWorkerKeepAliveNs:J

    iput-object v5, p0, Lkotlinx/coroutines/scheduling/ExperimentalCoroutineDispatcher;->schedulerName:Ljava/lang/String;

    .line 6
    new-instance p1, Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Lkotlinx/coroutines/scheduling/CoroutineScheduler;-><init>(IIJLjava/lang/String;)V

    .line 7
    iput-object p1, p0, Lkotlinx/coroutines/scheduling/ExperimentalCoroutineDispatcher;->coroutineScheduler:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    return-void
.end method


# virtual methods
.method public dispatch(Lkotlin/coroutines/CoroutineContext;Ljava/lang/Runnable;)V
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
    :try_start_0
    iget-object p0, p0, Lkotlinx/coroutines/scheduling/ExperimentalCoroutineDispatcher;->coroutineScheduler:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    sget-object p1, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->parkedWorkersStack$FU:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    sget-object p1, Lkotlinx/coroutines/scheduling/NonBlockingContext;->INSTANCE:Lkotlinx/coroutines/scheduling/NonBlockingContext;

    const/4 v0, 0x0

    invoke-virtual {p0, p2, p1, v0}, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->dispatch(Ljava/lang/Runnable;Lkotlinx/coroutines/scheduling/TaskContext;Z)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 3
    :catch_0
    sget-object p0, Lkotlinx/coroutines/DefaultExecutor;->INSTANCE:Lkotlinx/coroutines/DefaultExecutor;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    invoke-virtual {p0, p2}, Lkotlinx/coroutines/EventLoopImplBase;->enqueue(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method public final dispatchWithContext$kotlinx_coroutines_core(Ljava/lang/Runnable;Lkotlinx/coroutines/scheduling/TaskContext;Z)V
    .locals 1
    .param p1    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlinx/coroutines/scheduling/TaskContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "block"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    :try_start_0
    iget-object v0, p0, Lkotlinx/coroutines/scheduling/ExperimentalCoroutineDispatcher;->coroutineScheduler:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    invoke-virtual {v0, p1, p2, p3}, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->dispatch(Ljava/lang/Runnable;Lkotlinx/coroutines/scheduling/TaskContext;Z)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2
    :catch_0
    sget-object p3, Lkotlinx/coroutines/DefaultExecutor;->INSTANCE:Lkotlinx/coroutines/DefaultExecutor;

    iget-object p0, p0, Lkotlinx/coroutines/scheduling/ExperimentalCoroutineDispatcher;->coroutineScheduler:Lkotlinx/coroutines/scheduling/CoroutineScheduler;

    invoke-virtual {p0, p1, p2}, Lkotlinx/coroutines/scheduling/CoroutineScheduler;->createTask$kotlinx_coroutines_core(Ljava/lang/Runnable;Lkotlinx/coroutines/scheduling/TaskContext;)Lkotlinx/coroutines/scheduling/Task;

    move-result-object p0

    invoke-virtual {p3, p0}, Lkotlinx/coroutines/EventLoopImplBase;->enqueue(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method
