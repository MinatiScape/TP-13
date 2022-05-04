.class public final Lkotlinx/coroutines/BuildersKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;
    .locals 0

    and-int/lit8 p2, p4, 0x1

    if-eqz p2, :cond_0

    .line 1
    sget-object p1, Lkotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lkotlin/coroutines/EmptyCoroutineContext;

    :cond_0
    and-int/lit8 p2, p4, 0x2

    if-eqz p2, :cond_1

    .line 2
    sget-object p2, Lkotlinx/coroutines/CoroutineStart;->DEFAULT:Lkotlinx/coroutines/CoroutineStart;

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_0
    const-string p4, "$this$launch"

    .line 3
    invoke-static {p0, p4}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p4, "context"

    invoke-static {p1, p4}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p4, "start"

    invoke-static {p2, p4}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    invoke-static {p0, p1}, Lkotlinx/coroutines/CoroutineContextKt;->newCoroutineContext(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p0

    .line 5
    sget-object p1, Lkotlinx/coroutines/CoroutineStart;->LAZY:Lkotlinx/coroutines/CoroutineStart;

    const/4 p4, 0x1

    if-ne p2, p1, :cond_2

    move p1, p4

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    if-eqz p1, :cond_3

    .line 6
    new-instance p1, Lkotlinx/coroutines/LazyStandaloneCoroutine;

    invoke-direct {p1, p0, p3}, Lkotlinx/coroutines/LazyStandaloneCoroutine;-><init>(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)V

    goto :goto_2

    .line 7
    :cond_3
    new-instance p1, Lkotlinx/coroutines/StandaloneCoroutine;

    invoke-direct {p1, p0, p4}, Lkotlinx/coroutines/StandaloneCoroutine;-><init>(Lkotlin/coroutines/CoroutineContext;Z)V

    .line 8
    :goto_2
    invoke-virtual {p1, p2, p1, p3}, Lkotlinx/coroutines/AbstractCoroutine;->start(Lkotlinx/coroutines/CoroutineStart;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    return-object p1
.end method

.method public static runBlocking$default(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    and-int/lit8 p0, p2, 0x1

    const/4 p2, 0x0

    if-eqz p0, :cond_0

    .line 1
    sget-object p0, Lkotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lkotlin/coroutines/EmptyCoroutineContext;

    goto :goto_0

    :cond_0
    move-object p0, p2

    :goto_0
    const-string p3, "context"

    .line 2
    invoke-static {p0, p3}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 4
    sget-object v1, Lkotlin/coroutines/ContinuationInterceptor$Key;->$$INSTANCE:Lkotlin/coroutines/ContinuationInterceptor$Key;

    invoke-virtual {p0, v1}, Lkotlin/coroutines/EmptyCoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    .line 5
    sget-object p0, Lkotlinx/coroutines/ThreadLocalEventLoop;->INSTANCE:Lkotlinx/coroutines/ThreadLocalEventLoop;

    invoke-static {}, Lkotlinx/coroutines/ThreadLocalEventLoop;->getEventLoop$kotlinx_coroutines_core()Lkotlinx/coroutines/EventLoop;

    move-result-object p0

    .line 6
    sget-object v1, Lkotlinx/coroutines/GlobalScope;->INSTANCE:Lkotlinx/coroutines/GlobalScope;

    .line 7
    invoke-static {p0, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-static {v1, p0}, Lkotlinx/coroutines/CoroutineContextKt;->newCoroutineContext(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p3

    .line 9
    new-instance v1, Lkotlinx/coroutines/BlockingCoroutine;

    const-string v2, "currentThread"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, p3, v0, p0}, Lkotlinx/coroutines/BlockingCoroutine;-><init>(Lkotlin/coroutines/CoroutineContext;Ljava/lang/Thread;Lkotlinx/coroutines/EventLoop;)V

    .line 10
    sget-object p0, Lkotlinx/coroutines/CoroutineStart;->DEFAULT:Lkotlinx/coroutines/CoroutineStart;

    invoke-virtual {v1, p0, v1, p1}, Lkotlinx/coroutines/AbstractCoroutine;->start(Lkotlinx/coroutines/CoroutineStart;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 11
    :try_start_0
    iget-object p0, v1, Lkotlinx/coroutines/BlockingCoroutine;->eventLoop:Lkotlinx/coroutines/EventLoop;

    const/4 p1, 0x0

    if-eqz p0, :cond_1

    .line 12
    invoke-virtual {p0, p1}, Lkotlinx/coroutines/EventLoop;->incrementUseCount(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    :cond_1
    :goto_1
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result p0

    if-nez p0, :cond_7

    .line 14
    iget-object p0, v1, Lkotlinx/coroutines/BlockingCoroutine;->eventLoop:Lkotlinx/coroutines/EventLoop;

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lkotlinx/coroutines/EventLoop;->processNextEvent()J

    move-result-wide v2

    goto :goto_2

    :cond_2
    const-wide v2, 0x7fffffffffffffffL

    .line 15
    :goto_2
    invoke-virtual {v1}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lkotlinx/coroutines/Incomplete;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    xor-int/lit8 p0, p0, 0x1

    if-eqz p0, :cond_6

    .line 16
    :try_start_2
    iget-object p0, v1, Lkotlinx/coroutines/BlockingCoroutine;->eventLoop:Lkotlinx/coroutines/EventLoop;

    if-eqz p0, :cond_3

    .line 17
    invoke-virtual {p0, p1}, Lkotlinx/coroutines/EventLoop;->decrementUseCount(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 18
    :cond_3
    invoke-virtual {v1}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lkotlinx/coroutines/JobSupportKt;->unboxState(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 19
    instance-of p1, p0, Lkotlinx/coroutines/CompletedExceptionally;

    if-nez p1, :cond_4

    goto :goto_3

    :cond_4
    move-object p2, p0

    :goto_3
    check-cast p2, Lkotlinx/coroutines/CompletedExceptionally;

    if-nez p2, :cond_5

    return-object p0

    :cond_5
    iget-object p0, p2, Lkotlinx/coroutines/CompletedExceptionally;->cause:Ljava/lang/Throwable;

    throw p0

    .line 20
    :cond_6
    :try_start_3
    invoke-static {v1, v2, v3}, Ljava/util/concurrent/locks/LockSupport;->parkNanos(Ljava/lang/Object;J)V

    goto :goto_1

    .line 21
    :cond_7
    new-instance p0, Ljava/lang/InterruptedException;

    invoke-direct {p0}, Ljava/lang/InterruptedException;-><init>()V

    .line 22
    invoke-virtual {v1, p0}, Lkotlinx/coroutines/JobSupport;->cancelImpl$kotlinx_coroutines_core(Ljava/lang/Object;)Z

    .line 23
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p0

    .line 24
    :try_start_4
    iget-object p2, v1, Lkotlinx/coroutines/BlockingCoroutine;->eventLoop:Lkotlinx/coroutines/EventLoop;

    if-eqz p2, :cond_8

    .line 25
    invoke-virtual {p2, p1}, Lkotlinx/coroutines/EventLoop;->decrementUseCount(Z)V

    .line 26
    :cond_8
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p0

    .line 27
    throw p0
.end method

.method public static final withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p0    # Lkotlin/coroutines/CoroutineContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lkotlin/jvm/functions/Function2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/coroutines/CoroutineContext;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Lkotlinx/coroutines/CoroutineScope;",
            "-",
            "Lkotlin/coroutines/Continuation<",
            "-TT;>;+",
            "Ljava/lang/Object;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-TT;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    invoke-interface {p2}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v1

    .line 2
    invoke-interface {v1, p0}, Lkotlin/coroutines/CoroutineContext;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p0

    const-string v2, "$this$checkCompletion"

    .line 3
    invoke-static {p0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    sget-object v2, Lkotlinx/coroutines/Job;->Key:Lkotlinx/coroutines/Job$Key;

    invoke-interface {p0, v2}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v2

    check-cast v2, Lkotlinx/coroutines/Job;

    if-eqz v2, :cond_1

    .line 5
    invoke-interface {v2}, Lkotlinx/coroutines/Job;->isActive()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {v2}, Lkotlinx/coroutines/Job;->getCancellationException()Ljava/util/concurrent/CancellationException;

    move-result-object p0

    throw p0

    :cond_1
    :goto_0
    if-ne p0, v1, :cond_2

    .line 6
    new-instance v0, Lkotlinx/coroutines/internal/ScopeCoroutine;

    invoke-direct {v0, p0, p2}, Lkotlinx/coroutines/internal/ScopeCoroutine;-><init>(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/Continuation;)V

    .line 7
    invoke-static {v0, v0, p1}, Lkotlinx/coroutines/intrinsics/UndispatchedKt;->startUndispatchedOrReturn(Lkotlinx/coroutines/AbstractCoroutine;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_2

    .line 8
    :cond_2
    sget v2, Lkotlin/coroutines/ContinuationInterceptor;->$r8$clinit:I

    sget-object v2, Lkotlin/coroutines/ContinuationInterceptor$Key;->$$INSTANCE:Lkotlin/coroutines/ContinuationInterceptor$Key;

    invoke-interface {p0, v2}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v3

    check-cast v3, Lkotlin/coroutines/ContinuationInterceptor;

    invoke-interface {v1, v2}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/ContinuationInterceptor;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 9
    new-instance v0, Lkotlinx/coroutines/UndispatchedCoroutine;

    invoke-direct {v0, p0, p2}, Lkotlinx/coroutines/UndispatchedCoroutine;-><init>(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/Continuation;)V

    const/4 p2, 0x0

    .line 10
    invoke-static {p0, p2}, Lkotlinx/coroutines/internal/ThreadContextKt;->updateThreadContext(Lkotlin/coroutines/CoroutineContext;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 11
    :try_start_0
    invoke-static {v0, v0, p1}, Lkotlinx/coroutines/intrinsics/UndispatchedKt;->startUndispatchedOrReturn(Lkotlinx/coroutines/AbstractCoroutine;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    invoke-static {p0, p2}, Lkotlinx/coroutines/internal/ThreadContextKt;->restoreThreadContext(Lkotlin/coroutines/CoroutineContext;Ljava/lang/Object;)V

    goto :goto_2

    :catchall_0
    move-exception p1

    invoke-static {p0, p2}, Lkotlinx/coroutines/internal/ThreadContextKt;->restoreThreadContext(Lkotlin/coroutines/CoroutineContext;Ljava/lang/Object;)V

    throw p1

    .line 13
    :cond_3
    new-instance v1, Lkotlinx/coroutines/DispatchedCoroutine;

    invoke-direct {v1, p0, p2}, Lkotlinx/coroutines/DispatchedCoroutine;-><init>(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/Continuation;)V

    .line 14
    invoke-virtual {v1}, Lkotlinx/coroutines/AbstractCoroutine;->initParentJob$kotlinx_coroutines_core()V

    .line 15
    invoke-static {p1, v1, v1}, Lkotlinx/coroutines/intrinsics/CancellableKt;->startCoroutineCancellable(Lkotlin/jvm/functions/Function2;Ljava/lang/Object;Lkotlin/coroutines/Continuation;)V

    .line 16
    :cond_4
    iget p0, v1, Lkotlinx/coroutines/DispatchedCoroutine;->_decision:I

    const/4 p1, 0x0

    if-eqz p0, :cond_6

    const/4 p2, 0x2

    if-ne p0, p2, :cond_5

    goto :goto_1

    .line 17
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Already suspended"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 18
    :cond_6
    sget-object p0, Lkotlinx/coroutines/DispatchedCoroutine;->_decision$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 p2, 0x1

    invoke-virtual {p0, v1, p1, p2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result p0

    if-eqz p0, :cond_4

    move p1, p2

    :goto_1
    if-eqz p1, :cond_7

    goto :goto_2

    .line 19
    :cond_7
    invoke-virtual {v1}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lkotlinx/coroutines/JobSupportKt;->unboxState(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 20
    instance-of p0, v0, Lkotlinx/coroutines/CompletedExceptionally;

    if-nez p0, :cond_8

    :goto_2
    return-object v0

    :cond_8
    check-cast v0, Lkotlinx/coroutines/CompletedExceptionally;

    iget-object p0, v0, Lkotlinx/coroutines/CompletedExceptionally;->cause:Ljava/lang/Throwable;

    throw p0
.end method
