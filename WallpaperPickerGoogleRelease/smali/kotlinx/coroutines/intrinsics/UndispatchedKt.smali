.class public final Lkotlinx/coroutines/intrinsics/UndispatchedKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nUndispatched.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Undispatched.kt\nkotlinx/coroutines/intrinsics/UndispatchedKt\n+ 2 ProbesSupport.kt\nkotlinx/coroutines/internal/ProbesSupportKt\n+ 3 CoroutineContext.kt\nkotlinx/coroutines/CoroutineContextKt\n*L\n1#1,147:1\n66#1:148\n67#1,11:150\n66#1:161\n67#1,11:163\n66#1:174\n67#1,2:176\n69#1,9:183\n66#1:192\n67#1,2:194\n69#1,9:201\n110#1,4:211\n130#1,15:215\n110#1,4:230\n130#1,15:234\n11#2:149\n11#2:162\n11#2:175\n11#2:193\n11#2:210\n43#3,5:178\n43#3,5:196\n*E\n*S KotlinDebug\n*F\n+ 1 Undispatched.kt\nkotlinx/coroutines/intrinsics/UndispatchedKt\n*L\n18#1:148\n18#1,11:150\n29#1:161\n29#1,11:163\n40#1:174\n40#1,2:176\n40#1,9:183\n53#1:192\n53#1,2:194\n53#1,9:201\n90#1,4:211\n90#1,15:215\n101#1,4:230\n101#1,15:234\n18#1:149\n29#1:162\n40#1:175\n53#1:193\n66#1:210\n40#1,5:178\n53#1,5:196\n*E\n"
.end annotation


# direct methods
.method public static final startUndispatchedOrReturn(Lkotlinx/coroutines/AbstractCoroutine;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;
    .locals 2
    .param p0    # Lkotlinx/coroutines/AbstractCoroutine;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlinx/coroutines/AbstractCoroutine<",
            "-TT;>;TR;",
            "Lkotlin/jvm/functions/Function2<",
            "-TR;-",
            "Lkotlin/coroutines/Continuation<",
            "-TT;>;+",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    const-string v0, "block"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p0}, Lkotlinx/coroutines/AbstractCoroutine;->initParentJob$kotlinx_coroutines_core()V

    const/4 v0, 0x2

    .line 2
    :try_start_0
    invoke-static {p2, v0}, Lkotlin/jvm/internal/TypeIntrinsics;->beforeCheckcastToFunctionOfArity(Ljava/lang/Object;I)Ljava/lang/Object;

    invoke-interface {p2, p1, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 3
    new-instance p2, Lkotlinx/coroutines/CompletedExceptionally;

    const/4 v1, 0x0

    invoke-direct {p2, p1, v1, v0}, Lkotlinx/coroutines/CompletedExceptionally;-><init>(Ljava/lang/Throwable;ZI)V

    move-object p1, p2

    .line 4
    :goto_0
    sget-object p2, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    if-ne p1, p2, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x4

    .line 5
    invoke-virtual {p0, p1, v0}, Lkotlinx/coroutines/JobSupport;->makeCompletingOnce$kotlinx_coroutines_core(Ljava/lang/Object;I)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 6
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object p1

    .line 7
    instance-of p2, p1, Lkotlinx/coroutines/CompletedExceptionally;

    if-nez p2, :cond_1

    .line 8
    invoke-static {p1}, Lkotlinx/coroutines/JobSupportKt;->unboxState(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_1

    .line 9
    :cond_1
    check-cast p1, Lkotlinx/coroutines/CompletedExceptionally;

    iget-object p1, p1, Lkotlinx/coroutines/CompletedExceptionally;->cause:Ljava/lang/Throwable;

    .line 10
    invoke-static {p0, p1}, Lkotlinx/coroutines/internal/ScopesKt;->tryRecover(Lkotlinx/coroutines/AbstractCoroutine;Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p0

    throw p0

    :cond_2
    :goto_1
    return-object p2
.end method
