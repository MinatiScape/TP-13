.class public final Lkotlinx/coroutines/CommonPool;
.super Lkotlinx/coroutines/ExecutorCoroutineDispatcher;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCommonPool.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CommonPool.kt\nkotlinx/coroutines/CommonPool\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,142:1\n56#1:143\n56#1:144\n56#1:145\n56#1:146\n56#1:149\n1587#2,2:147\n*E\n*S KotlinDebug\n*F\n+ 1 CommonPool.kt\nkotlinx/coroutines/CommonPool\n*L\n61#1:143\n65#1:144\n70#1:145\n85#1:146\n37#1:149\n121#1,2:147\n*E\n"
.end annotation


# static fields
.field public static final INSTANCE:Lkotlinx/coroutines/CommonPool;

.field public static volatile pool:Ljava/util/concurrent/Executor;

.field public static final requestedParallelism:I


# direct methods
.method public static constructor <clinit>()V
    .locals 13

    .line 1
    new-instance v0, Lkotlinx/coroutines/CommonPool;

    invoke-direct {v0}, Lkotlinx/coroutines/CommonPool;-><init>()V

    sput-object v0, Lkotlinx/coroutines/CommonPool;->INSTANCE:Lkotlinx/coroutines/CommonPool;

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "kotlinx.coroutines.default.parallelism"

    .line 2
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-object v1, v0

    :goto_0
    const/4 v2, -0x1

    if-eqz v1, :cond_d

    const-string v3, "$this$toIntOrNull"

    .line 3
    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v3, 0xa

    .line 5
    invoke-static {v3}, Lkotlin/text/CharsKt__CharKt;->checkRadix(I)I

    .line 6
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_0

    goto/16 :goto_5

    :cond_0
    const/4 v6, 0x0

    .line 7
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x30

    if-ge v7, v8, :cond_1

    goto :goto_1

    :cond_1
    if-ne v7, v8, :cond_2

    move v2, v6

    goto :goto_1

    :cond_2
    move v2, v5

    :goto_1
    const v8, -0x7fffffff

    if-gez v2, :cond_5

    if-ne v4, v5, :cond_3

    goto :goto_5

    :cond_3
    const/16 v2, 0x2d

    if-ne v7, v2, :cond_4

    const/high16 v8, -0x80000000

    move v2, v5

    goto :goto_2

    :cond_4
    const/16 v2, 0x2b

    if-ne v7, v2, :cond_b

    move v2, v5

    move v7, v6

    goto :goto_3

    :cond_5
    move v2, v6

    :goto_2
    move v7, v2

    :goto_3
    const v9, -0x38e38e3

    move v10, v9

    :goto_4
    if-ge v2, v4, :cond_9

    .line 8
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v11

    .line 9
    invoke-static {v11, v3}, Ljava/lang/Character;->digit(II)I

    move-result v11

    if-gez v11, :cond_6

    goto :goto_5

    :cond_6
    if-ge v6, v10, :cond_7

    if-ne v10, v9, :cond_b

    .line 10
    div-int/lit8 v10, v8, 0xa

    if-ge v6, v10, :cond_7

    goto :goto_5

    :cond_7
    mul-int/lit8 v6, v6, 0xa

    add-int v12, v8, v11

    if-ge v6, v12, :cond_8

    goto :goto_5

    :cond_8
    sub-int/2addr v6, v11

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_9
    if-eqz v7, :cond_a

    .line 11
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_5

    :cond_a
    neg-int v0, v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :cond_b
    :goto_5
    if-eqz v0, :cond_c

    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lt v2, v5, :cond_c

    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_6

    :cond_c
    const-string v0, "Expected positive number in kotlinx.coroutines.default.parallelism, but has "

    .line 14
    invoke-static {v0, v1}, Landroidx/appcompat/view/SupportMenuInflater$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 15
    :cond_d
    :goto_6
    sput v2, Lkotlinx/coroutines/CommonPool;->requestedParallelism:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lkotlinx/coroutines/ExecutorCoroutineDispatcher;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Close cannot be invoked on CommonPool"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final createPlainPool()Ljava/util/concurrent/ExecutorService;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 2
    invoke-virtual {p0}, Lkotlinx/coroutines/CommonPool;->getParallelism()I

    move-result p0

    new-instance v1, Lkotlinx/coroutines/CommonPool$createPlainPool$1;

    invoke-direct {v1, v0}, Lkotlinx/coroutines/CommonPool$createPlainPool$1;-><init>(Ljava/util/concurrent/atomic/AtomicInteger;)V

    invoke-static {p0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    const-string v0, "Executors.newFixedThread\u2026Daemon = true }\n        }"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public final createPool()Ljava/util/concurrent/ExecutorService;
    .locals 7

    .line 1
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lkotlinx/coroutines/CommonPool;->createPlainPool()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "java.util.concurrent.ForkJoinPool"

    .line 2
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_9

    .line 3
    sget v2, Lkotlinx/coroutines/CommonPool;->requestedParallelism:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-gez v2, :cond_6

    :try_start_1
    const-string v2, "commonPool"

    new-array v5, v4, [Ljava/lang/Class;

    .line 4
    invoke-virtual {v1, v2, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    if-eqz v2, :cond_1

    new-array v5, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    :cond_1
    move-object v2, v0

    :goto_1
    instance-of v5, v2, Ljava/util/concurrent/ExecutorService;

    if-nez v5, :cond_2

    move-object v2, v0

    :cond_2
    check-cast v2, Ljava/util/concurrent/ExecutorService;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-object v2, v0

    :goto_2
    if-eqz v2, :cond_6

    .line 5
    sget-object v5, Lkotlinx/coroutines/CommonPool;->INSTANCE:Lkotlinx/coroutines/CommonPool;

    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "fjpClass"

    .line 6
    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v5, "executor"

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    sget-object v5, Lkotlinx/coroutines/CommonPool$isGoodCommonPool$1;->INSTANCE:Lkotlinx/coroutines/CommonPool$isGoodCommonPool$1;

    invoke-interface {v2, v5}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    :try_start_2
    const-string v5, "getPoolSize"

    new-array v6, v4, [Ljava/lang/Class;

    .line 8
    invoke-virtual {v1, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v6, v4, [Ljava/lang/Object;

    invoke-virtual {v5, v2, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    instance-of v6, v5, Ljava/lang/Integer;

    if-nez v6, :cond_3

    move-object v5, v0

    :cond_3
    check-cast v5, Ljava/lang/Integer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_3

    :catchall_2
    move-object v5, v0

    :goto_3
    if-eqz v5, :cond_4

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-lt v5, v3, :cond_4

    move v5, v3

    goto :goto_4

    :cond_4
    move v5, v4

    :goto_4
    if-eqz v5, :cond_5

    goto :goto_5

    :cond_5
    move-object v2, v0

    :goto_5
    if-eqz v2, :cond_6

    return-object v2

    :cond_6
    :try_start_3
    new-array v2, v3, [Ljava/lang/Class;

    .line 9
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    sget-object v3, Lkotlinx/coroutines/CommonPool;->INSTANCE:Lkotlinx/coroutines/CommonPool;

    invoke-virtual {v3}, Lkotlinx/coroutines/CommonPool;->getParallelism()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Ljava/util/concurrent/ExecutorService;

    if-nez v2, :cond_7

    move-object v1, v0

    :cond_7
    check-cast v1, Ljava/util/concurrent/ExecutorService;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    move-object v0, v1

    :catchall_3
    if-eqz v0, :cond_8

    return-object v0

    .line 10
    :cond_8
    invoke-virtual {p0}, Lkotlinx/coroutines/CommonPool;->createPlainPool()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    return-object p0

    .line 11
    :cond_9
    invoke-virtual {p0}, Lkotlinx/coroutines/CommonPool;->createPlainPool()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    return-object p0
.end method

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
    sget-object p1, Lkotlinx/coroutines/CommonPool;->pool:Ljava/util/concurrent/Executor;

    if-eqz p1, :cond_0

    goto :goto_1

    .line 2
    :cond_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3
    :try_start_1
    sget-object p1, Lkotlinx/coroutines/CommonPool;->pool:Ljava/util/concurrent/Executor;

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lkotlinx/coroutines/CommonPool;->createPool()Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    sput-object p1, Lkotlinx/coroutines/CommonPool;->pool:Ljava/util/concurrent/Executor;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    :try_start_2
    monitor-exit p0

    .line 4
    :goto_1
    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_2

    :catchall_0
    move-exception p1

    .line 5
    monitor-exit p0

    throw p1
    :try_end_2
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_2 .. :try_end_2} :catch_0

    .line 6
    :catch_0
    sget-object p0, Lkotlinx/coroutines/DefaultExecutor;->INSTANCE:Lkotlinx/coroutines/DefaultExecutor;

    invoke-virtual {p0, p2}, Lkotlinx/coroutines/EventLoopImplBase;->enqueue(Ljava/lang/Runnable;)V

    :goto_2
    return-void
.end method

.method public final getParallelism()I
    .locals 2

    .line 1
    sget p0, Lkotlinx/coroutines/CommonPool;->requestedParallelism:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :goto_1
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_3

    .line 2
    :cond_2
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result p0

    sub-int/2addr p0, v1

    if-ge p0, v1, :cond_3

    goto :goto_2

    :cond_3
    move v1, p0

    :goto_2
    move p0, v1

    :goto_3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string p0, "CommonPool"

    return-object p0
.end method
