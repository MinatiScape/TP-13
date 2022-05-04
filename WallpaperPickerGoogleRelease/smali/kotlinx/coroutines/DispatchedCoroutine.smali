.class public final Lkotlinx/coroutines/DispatchedCoroutine;
.super Lkotlinx/coroutines/internal/ScopeCoroutine;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lkotlinx/coroutines/internal/ScopeCoroutine<",
        "TT;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBuilders.common.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Builders.common.kt\nkotlinx/coroutines/DispatchedCoroutine\n+ 2 AtomicFU.common.kt\nkotlinx/atomicfu/AtomicFU_commonKt\n*L\n1#1,260:1\n277#2,2:261\n277#2,2:263\n*E\n*S KotlinDebug\n*F\n+ 1 Builders.common.kt\nkotlinx/coroutines/DispatchedCoroutine\n*L\n226#1,2:261\n236#1,2:263\n*E\n"
.end annotation


# static fields
.field public static final _decision$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;


# instance fields
.field public volatile _decision:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-class v0, Lkotlinx/coroutines/DispatchedCoroutine;

    const-string v1, "_decision"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lkotlinx/coroutines/DispatchedCoroutine;->_decision$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .param p1    # Lkotlin/coroutines/CoroutineContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/CoroutineContext;",
            "Lkotlin/coroutines/Continuation<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lkotlinx/coroutines/internal/ScopeCoroutine;-><init>(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/Continuation;)V

    const/4 p1, 0x0

    .line 2
    iput p1, p0, Lkotlinx/coroutines/DispatchedCoroutine;->_decision:I

    return-void
.end method


# virtual methods
.method public afterCompletionInternal(Ljava/lang/Object;I)V
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    :cond_0
    iget v0, p0, Lkotlinx/coroutines/DispatchedCoroutine;->_decision:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    if-ne v0, v2, :cond_1

    goto :goto_0

    .line 2
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Already resumed"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3
    :cond_2
    sget-object v0, Lkotlinx/coroutines/DispatchedCoroutine;->_decision$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v3, 0x2

    invoke-virtual {v0, p0, v1, v3}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    move v1, v2

    :goto_0
    if-eqz v1, :cond_3

    return-void

    .line 4
    :cond_3
    invoke-super {p0, p1, p2}, Lkotlinx/coroutines/internal/ScopeCoroutine;->afterCompletionInternal(Ljava/lang/Object;I)V

    return-void
.end method

.method public getDefaultResumeMode$kotlinx_coroutines_core()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
