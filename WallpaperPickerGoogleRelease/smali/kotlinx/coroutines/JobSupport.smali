.class public Lkotlinx/coroutines/JobSupport;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlinx/coroutines/Job;
.implements Lkotlinx/coroutines/ChildJob;
.implements Lkotlinx/coroutines/ParentJob;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlinx/coroutines/JobSupport$Finishing;,
        Lkotlinx/coroutines/JobSupport$ChildCompletion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJobSupport.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JobSupport.kt\nkotlinx/coroutines/JobSupport\n+ 2 AtomicFU.common.kt\nkotlinx/atomicfu/AtomicFU_commonKt\n+ 3 Synchronized.kt\nkotlinx/coroutines/internal/SynchronizedKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 5 Exceptions.kt\nkotlinx/coroutines/ExceptionsKt\n+ 6 LockFreeLinkedList.kt\nkotlinx/coroutines/internal/LockFreeLinkedListHead\n+ 7 CompletionHandler.common.kt\nkotlinx/coroutines/CompletionHandler_commonKt\n+ 8 CompletionHandler.kt\nkotlinx/coroutines/CompletionHandlerKt\n+ 9 LockFreeLinkedList.kt\nkotlinx/coroutines/internal/LockFreeLinkedListNode\n+ 10 CancellableContinuation.kt\nkotlinx/coroutines/CancellableContinuationKt\n+ 11 StackTraceRecovery.kt\nkotlinx/coroutines/internal/StackTraceRecoveryKt\n*L\n1#1,1424:1\n351#1,2:1431\n353#1,4:1436\n357#1,4:1441\n361#1,2:1448\n351#1,2:1450\n353#1,4:1455\n357#1,4:1460\n361#1,2:1467\n174#1,2:1476\n174#1,2:1478\n174#1,2:1493\n174#1,2:1504\n174#1,2:1507\n174#1,2:1509\n174#1,2:1511\n174#1,2:1514\n174#1,2:1516\n174#1,2:1526\n93#2,2:1425\n20#3:1427\n20#3:1480\n20#3:1513\n20#3:1518\n240#4,2:1428\n85#5:1430\n85#5:1440\n85#5:1459\n85#5:1472\n657#6,3:1433\n660#6,3:1445\n657#6,3:1452\n660#6,3:1464\n657#6,3:1469\n660#6,3:1473\n47#7:1481\n22#8:1482\n22#8:1483\n13#8:1501\n13#8:1506\n13#8:1519\n13#8:1520\n13#8:1525\n13#8:1528\n148#9:1484\n84#9,3:1485\n149#9,5:1488\n197#10,6:1495\n203#10,2:1502\n150#11,4:1521\n*E\n*S KotlinDebug\n*F\n+ 1 JobSupport.kt\nkotlinx/coroutines/JobSupport\n*L\n316#1,2:1431\n316#1,4:1436\n316#1,4:1441\n316#1,2:1448\n348#1,2:1450\n348#1,4:1455\n348#1,4:1460\n348#1,2:1467\n365#1,2:1476\n444#1,2:1478\n535#1,2:1493\n552#1,2:1504\n574#1,2:1507\n654#1,2:1509\n693#1,2:1511\n766#1,2:1514\n786#1,2:1516\n1180#1,2:1526\n164#1,2:1425\n208#1:1427\n444#1:1480\n693#1:1513\n823#1:1518\n248#1,2:1428\n264#1:1430\n316#1:1440\n348#1:1459\n352#1:1472\n316#1,3:1433\n316#1,3:1445\n348#1,3:1452\n348#1,3:1464\n352#1,3:1469\n352#1,3:1473\n444#1:1481\n444#1:1482\n444#1:1483\n541#1:1501\n552#1:1506\n866#1:1519\n915#1:1520\n1162#1:1525\n1180#1:1528\n508#1:1484\n508#1,3:1485\n508#1,5:1488\n541#1,6:1495\n541#1,2:1502\n1152#1,4:1521\n*E\n"
.end annotation


# static fields
.field public static final _state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field public volatile _state:Ljava/lang/Object;

.field public volatile parentHandle:Lkotlinx/coroutines/ChildHandle;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-class v0, Lkotlinx/coroutines/JobSupport;

    const-class v1, Ljava/lang/Object;

    const-string v2, "_state"

    invoke-static {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lkotlinx/coroutines/JobSupport;->_state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 2
    sget-object p1, Lkotlinx/coroutines/JobSupportKt;->EMPTY_ACTIVE:Lkotlinx/coroutines/Empty;

    goto :goto_0

    .line 3
    :cond_0
    sget-object p1, Lkotlinx/coroutines/JobSupportKt;->EMPTY_NEW:Lkotlinx/coroutines/Empty;

    .line 4
    :goto_0
    iput-object p1, p0, Lkotlinx/coroutines/JobSupport;->_state:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final addLastAtomic(Ljava/lang/Object;Lkotlinx/coroutines/NodeList;Lkotlinx/coroutines/JobNode;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlinx/coroutines/NodeList;",
            "Lkotlinx/coroutines/JobNode<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    new-instance v0, Lkotlinx/coroutines/JobSupport$addLastAtomic$$inlined$addLastIf$1;

    invoke-direct {v0, p3, p3, p0, p1}, Lkotlinx/coroutines/JobSupport$addLastAtomic$$inlined$addLastIf$1;-><init>(Lkotlinx/coroutines/internal/LockFreeLinkedListNode;Lkotlinx/coroutines/internal/LockFreeLinkedListNode;Lkotlinx/coroutines/JobSupport;Ljava/lang/Object;)V

    .line 2
    :goto_0
    invoke-virtual {p2}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getPrev()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_4

    check-cast p0, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;

    .line 3
    sget-object p1, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->_prev$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {p1, p3, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->lazySet(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    sget-object p1, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->_next$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {p1, p3, p2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->lazySet(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 5
    iput-object p2, v0, Lkotlinx/coroutines/internal/LockFreeLinkedListNode$CondAddOp;->oldNext:Lkotlinx/coroutines/internal/LockFreeLinkedListNode;

    .line 6
    invoke-virtual {p1, p0, p2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez p1, :cond_0

    move p0, v2

    goto :goto_1

    .line 7
    :cond_0
    invoke-virtual {v0, p0}, Lkotlinx/coroutines/internal/AtomicOp;->perform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_1

    move p0, v3

    goto :goto_1

    :cond_1
    move p0, v1

    :goto_1
    if-eq p0, v3, :cond_2

    if-eq p0, v1, :cond_3

    goto :goto_0

    :cond_2
    move v2, v3

    :cond_3
    return v2

    .line 8
    :cond_4
    new-instance p0, Lkotlin/TypeCastException;

    const-string p1, "null cannot be cast to non-null type kotlinx.coroutines.internal.Node /* = kotlinx.coroutines.internal.LockFreeLinkedListNode */"

    invoke-direct {p0, p1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final addSuppressedExceptions(Ljava/lang/Throwable;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "Ljava/util/List<",
            "+",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p0

    const/4 v0, 0x1

    if-gt p0, v0, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p0

    sget v0, Lkotlinx/coroutines/internal/ConcurrentKt;->$r8$clinit:I

    .line 3
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0, p0}, Ljava/util/IdentityHashMap;-><init>(I)V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object p0

    const-string v0, "Collections.newSetFromMa\u2026ityHashMap(expectedSize))"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    invoke-static {p1}, Lkotlinx/coroutines/internal/StackTraceRecoveryKt;->unwrap(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    .line 5
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    .line 6
    invoke-static {v1}, Lkotlinx/coroutines/internal/StackTraceRecoveryKt;->unwrap(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    if-eq v1, p1, :cond_1

    if-eq v1, v0, :cond_1

    .line 7
    instance-of v2, v1, Ljava/util/concurrent/CancellationException;

    if-nez v2, :cond_1

    invoke-interface {p0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 8
    invoke-static {p1, v1}, Lkotlin/ResultKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public afterCompletionInternal(Ljava/lang/Object;I)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public final attachChild(Lkotlinx/coroutines/ChildJob;)Lkotlinx/coroutines/ChildHandle;
    .locals 6
    .param p1    # Lkotlinx/coroutines/ChildJob;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v3, Lkotlinx/coroutines/ChildHandleNode;

    invoke-direct {v3, p0, p1}, Lkotlinx/coroutines/ChildHandleNode;-><init>(Lkotlinx/coroutines/JobSupport;Lkotlinx/coroutines/ChildJob;)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lkotlinx/coroutines/Job$DefaultImpls;->invokeOnCompletion$default(Lkotlinx/coroutines/Job;ZZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lkotlinx/coroutines/DisposableHandle;

    move-result-object p0

    if-eqz p0, :cond_0

    check-cast p0, Lkotlinx/coroutines/ChildHandle;

    return-object p0

    :cond_0
    new-instance p0, Lkotlin/TypeCastException;

    const-string p1, "null cannot be cast to non-null type kotlinx.coroutines.ChildHandle"

    invoke-direct {p0, p1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public cancel(Ljava/util/concurrent/CancellationException;)V
    .locals 0
    .param p1    # Ljava/util/concurrent/CancellationException;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Lkotlinx/coroutines/JobSupport;->cancelImpl$kotlinx_coroutines_core(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getHandlesException$kotlinx_coroutines_core()Z

    :cond_0
    return-void
.end method

.method public final cancelImpl$kotlinx_coroutines_core(Ljava/lang/Object;)Z
    .locals 10
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getOnCancelComplete$kotlinx_coroutines_core()Z

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v0, :cond_4

    .line 2
    :goto_0
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object v0

    .line 3
    instance-of v5, v0, Lkotlinx/coroutines/Incomplete;

    if-eqz v5, :cond_3

    instance-of v5, v0, Lkotlinx/coroutines/JobSupport$Finishing;

    if-eqz v5, :cond_0

    move-object v5, v0

    check-cast v5, Lkotlinx/coroutines/JobSupport$Finishing;

    iget-boolean v5, v5, Lkotlinx/coroutines/JobSupport$Finishing;->isCompleting:Z

    if-eqz v5, :cond_0

    goto :goto_1

    .line 4
    :cond_0
    new-instance v5, Lkotlinx/coroutines/CompletedExceptionally;

    invoke-virtual {p0, p1}, Lkotlinx/coroutines/JobSupport;->createCauseException(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v6

    invoke-direct {v5, v6, v3, v2}, Lkotlinx/coroutines/CompletedExceptionally;-><init>(Ljava/lang/Throwable;ZI)V

    .line 5
    invoke-virtual {p0, v0, v5, v3}, Lkotlinx/coroutines/JobSupport;->tryMakeCompleting(Ljava/lang/Object;Ljava/lang/Object;I)I

    move-result v0

    if-eqz v0, :cond_3

    if-eq v0, v4, :cond_2

    if-eq v0, v2, :cond_2

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 6
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "unexpected result"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    move v0, v4

    goto :goto_2

    :cond_3
    :goto_1
    move v0, v3

    :goto_2
    if-eqz v0, :cond_4

    return v4

    :cond_4
    const/4 v0, 0x0

    move-object v5, v0

    .line 7
    :cond_5
    :goto_3
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object v6

    .line 8
    instance-of v7, v6, Lkotlinx/coroutines/JobSupport$Finishing;

    if-eqz v7, :cond_b

    .line 9
    monitor-enter v6

    .line 10
    :try_start_0
    move-object v1, v6

    check-cast v1, Lkotlinx/coroutines/JobSupport$Finishing;

    invoke-virtual {v1}, Lkotlinx/coroutines/JobSupport$Finishing;->isSealed()Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_6

    monitor-exit v6

    goto/16 :goto_9

    .line 11
    :cond_6
    :try_start_1
    move-object v1, v6

    check-cast v1, Lkotlinx/coroutines/JobSupport$Finishing;

    invoke-virtual {v1}, Lkotlinx/coroutines/JobSupport$Finishing;->isCancelling()Z

    move-result v1

    if-nez p1, :cond_7

    if-nez v1, :cond_9

    :cond_7
    if-eqz v5, :cond_8

    goto :goto_4

    .line 12
    :cond_8
    invoke-virtual {p0, p1}, Lkotlinx/coroutines/JobSupport;->createCauseException(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v5

    .line 13
    :goto_4
    move-object p1, v6

    check-cast p1, Lkotlinx/coroutines/JobSupport$Finishing;

    invoke-virtual {p1, v5}, Lkotlinx/coroutines/JobSupport$Finishing;->addExceptionLocked(Ljava/lang/Throwable;)V

    .line 14
    :cond_9
    move-object p1, v6

    check-cast p1, Lkotlinx/coroutines/JobSupport$Finishing;

    iget-object p1, p1, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    xor-int/2addr v1, v4

    if-eqz v1, :cond_a

    move-object v0, p1

    :cond_a
    monitor-exit v6

    if-eqz v0, :cond_11

    .line 15
    check-cast v6, Lkotlinx/coroutines/JobSupport$Finishing;

    .line 16
    iget-object p1, v6, Lkotlinx/coroutines/JobSupport$Finishing;->list:Lkotlinx/coroutines/NodeList;

    .line 17
    invoke-virtual {p0, p1, v0}, Lkotlinx/coroutines/JobSupport;->notifyCancelling(Lkotlinx/coroutines/NodeList;Ljava/lang/Throwable;)V

    goto :goto_8

    :catchall_0
    move-exception p0

    .line 18
    monitor-exit v6

    throw p0

    .line 19
    :cond_b
    instance-of v7, v6, Lkotlinx/coroutines/Incomplete;

    if-eqz v7, :cond_13

    if-eqz v5, :cond_c

    goto :goto_5

    .line 20
    :cond_c
    invoke-virtual {p0, p1}, Lkotlinx/coroutines/JobSupport;->createCauseException(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v5

    .line 21
    :goto_5
    move-object v7, v6

    check-cast v7, Lkotlinx/coroutines/Incomplete;

    invoke-interface {v7}, Lkotlinx/coroutines/Incomplete;->isActive()Z

    move-result v8

    if-eqz v8, :cond_f

    .line 22
    sget-boolean v6, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    .line 23
    invoke-virtual {p0, v7}, Lkotlinx/coroutines/JobSupport;->getOrPromoteCancellingList(Lkotlinx/coroutines/Incomplete;)Lkotlinx/coroutines/NodeList;

    move-result-object v6

    if-eqz v6, :cond_e

    .line 24
    new-instance v8, Lkotlinx/coroutines/JobSupport$Finishing;

    invoke-direct {v8, v6, v3, v5}, Lkotlinx/coroutines/JobSupport$Finishing;-><init>(Lkotlinx/coroutines/NodeList;ZLjava/lang/Throwable;)V

    .line 25
    sget-object v9, Lkotlinx/coroutines/JobSupport;->_state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v9, p0, v7, v8}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d

    goto :goto_6

    .line 26
    :cond_d
    invoke-virtual {p0, v6, v5}, Lkotlinx/coroutines/JobSupport;->notifyCancelling(Lkotlinx/coroutines/NodeList;Ljava/lang/Throwable;)V

    move v6, v4

    goto :goto_7

    :cond_e
    :goto_6
    move v6, v3

    :goto_7
    if-eqz v6, :cond_5

    goto :goto_8

    .line 27
    :cond_f
    new-instance v7, Lkotlinx/coroutines/CompletedExceptionally;

    invoke-direct {v7, v5, v3, v2}, Lkotlinx/coroutines/CompletedExceptionally;-><init>(Ljava/lang/Throwable;ZI)V

    invoke-virtual {p0, v6, v7, v3}, Lkotlinx/coroutines/JobSupport;->tryMakeCompleting(Ljava/lang/Object;Ljava/lang/Object;I)I

    move-result v7

    if-eqz v7, :cond_12

    if-eq v7, v4, :cond_11

    if-eq v7, v2, :cond_11

    if-ne v7, v1, :cond_10

    goto/16 :goto_3

    :cond_10
    const-string p0, "unexpected result"

    .line 28
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_11
    :goto_8
    move v3, v4

    goto :goto_9

    .line 29
    :cond_12
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Cannot happen in "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_13
    :goto_9
    return v3
.end method

.method public final cancelParent(Ljava/lang/Throwable;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->isScopedCoroutine()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 2
    :cond_0
    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    .line 3
    iget-object p0, p0, Lkotlinx/coroutines/JobSupport;->parentHandle:Lkotlinx/coroutines/ChildHandle;

    if-eqz p0, :cond_4

    .line 4
    sget-object v2, Lkotlinx/coroutines/NonDisposableHandle;->INSTANCE:Lkotlinx/coroutines/NonDisposableHandle;

    if-ne p0, v2, :cond_1

    goto :goto_1

    .line 5
    :cond_1
    invoke-interface {p0, p1}, Lkotlinx/coroutines/ChildHandle;->childCancelled(Ljava/lang/Throwable;)Z

    move-result p0

    if-nez p0, :cond_3

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :cond_3
    :goto_0
    return v1

    :cond_4
    :goto_1
    return v0
.end method

.method public childCancelled(Ljava/lang/Throwable;)Z
    .locals 2
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 2
    :cond_0
    invoke-virtual {p0, p1}, Lkotlinx/coroutines/JobSupport;->cancelImpl$kotlinx_coroutines_core(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getHandlesException$kotlinx_coroutines_core()Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public final completeStateFinalization(Lkotlinx/coroutines/Incomplete;Ljava/lang/Object;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lkotlinx/coroutines/JobSupport;->parentHandle:Lkotlinx/coroutines/ChildHandle;

    if-eqz v0, :cond_0

    .line 2
    invoke-interface {v0}, Lkotlinx/coroutines/DisposableHandle;->dispose()V

    .line 3
    sget-object v0, Lkotlinx/coroutines/NonDisposableHandle;->INSTANCE:Lkotlinx/coroutines/NonDisposableHandle;

    iput-object v0, p0, Lkotlinx/coroutines/JobSupport;->parentHandle:Lkotlinx/coroutines/ChildHandle;

    .line 4
    :cond_0
    instance-of v0, p2, Lkotlinx/coroutines/CompletedExceptionally;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    move-object v0, p2

    :goto_0
    check-cast v0, Lkotlinx/coroutines/CompletedExceptionally;

    if-eqz v0, :cond_2

    iget-object v0, v0, Lkotlinx/coroutines/CompletedExceptionally;->cause:Ljava/lang/Throwable;

    goto :goto_1

    :cond_2
    move-object v0, v1

    .line 5
    :goto_1
    instance-of v2, p1, Lkotlinx/coroutines/JobNode;

    const-string v3, " for "

    const-string v4, "Exception in completion handler "

    if-eqz v2, :cond_3

    .line 6
    :try_start_0
    move-object v1, p1

    check-cast v1, Lkotlinx/coroutines/JobNode;

    invoke-virtual {v1, v0}, Lkotlinx/coroutines/CompletionHandlerBase;->invoke(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_4

    :catchall_0
    move-exception v0

    .line 7
    new-instance v1, Lkotlinx/coroutines/CompletionHandlerException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Lkotlinx/coroutines/CompletionHandlerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v1}, Lkotlinx/coroutines/JobSupport;->handleOnCompletionException$kotlinx_coroutines_core(Ljava/lang/Throwable;)V

    goto :goto_4

    .line 8
    :cond_3
    invoke-interface {p1}, Lkotlinx/coroutines/Incomplete;->getList()Lkotlinx/coroutines/NodeList;

    move-result-object p1

    if-eqz p1, :cond_8

    .line 9
    invoke-virtual {p1}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getNext()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_7

    check-cast v2, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;

    .line 10
    :goto_2
    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    xor-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_6

    .line 11
    instance-of v5, v2, Lkotlinx/coroutines/JobNode;

    if-eqz v5, :cond_5

    move-object v5, v2

    check-cast v5, Lkotlinx/coroutines/JobNode;

    .line 12
    :try_start_1
    invoke-virtual {v5, v0}, Lkotlinx/coroutines/CompletionHandlerBase;->invoke(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v6

    if-eqz v1, :cond_4

    .line 13
    invoke-static {v1, v6}, Lkotlin/ResultKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 14
    :cond_4
    new-instance v1, Lkotlinx/coroutines/CompletionHandlerException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5, v6}, Lkotlinx/coroutines/CompletionHandlerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    :cond_5
    :goto_3
    invoke-virtual {v2}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getNextNode()Lkotlinx/coroutines/internal/LockFreeLinkedListNode;

    move-result-object v2

    goto :goto_2

    :cond_6
    if-eqz v1, :cond_8

    .line 16
    invoke-virtual {p0, v1}, Lkotlinx/coroutines/JobSupport;->handleOnCompletionException$kotlinx_coroutines_core(Ljava/lang/Throwable;)V

    goto :goto_4

    .line 17
    :cond_7
    new-instance p0, Lkotlin/TypeCastException;

    const-string p1, "null cannot be cast to non-null type kotlinx.coroutines.internal.Node /* = kotlinx.coroutines.internal.LockFreeLinkedListNode */"

    invoke-direct {p0, p1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 18
    :cond_8
    :goto_4
    invoke-virtual {p0, p2, p3}, Lkotlinx/coroutines/JobSupport;->afterCompletionInternal(Ljava/lang/Object;I)V

    return-void
.end method

.method public final createCauseException(Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 2

    if-eqz p1, :cond_0

    .line 1
    instance-of v0, p1, Ljava/lang/Throwable;

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    check-cast p1, Ljava/lang/Throwable;

    goto :goto_1

    .line 2
    :cond_1
    new-instance p1, Lkotlinx/coroutines/JobCancellationException;

    const/4 v0, 0x0

    const-string v1, "Job was cancelled"

    invoke-direct {p1, v1, v0, p0}, Lkotlinx/coroutines/JobCancellationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lkotlinx/coroutines/Job;)V

    goto :goto_1

    :cond_2
    if-eqz p1, :cond_3

    .line 3
    check-cast p1, Lkotlinx/coroutines/ParentJob;

    invoke-interface {p1}, Lkotlinx/coroutines/ParentJob;->getChildJobCancellationCause()Ljava/util/concurrent/CancellationException;

    move-result-object p1

    :goto_1
    return-object p1

    :cond_3
    new-instance p0, Lkotlin/TypeCastException;

    const-string p1, "null cannot be cast to non-null type kotlinx.coroutines.ParentJob"

    invoke-direct {p0, p1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public fold(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;
    .locals 1
    .param p2    # Lkotlin/jvm/functions/Function2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "Lkotlin/jvm/functions/Function2<",
            "-TR;-",
            "Lkotlin/coroutines/CoroutineContext$Element;",
            "+TR;>;)TR;"
        }
    .end annotation

    const-string v0, "operation"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1, p2}, Lkotlin/coroutines/CoroutineContext$Element$DefaultImpls;->fold(Lkotlin/coroutines/CoroutineContext$Element;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;
    .locals 1
    .param p1    # Lkotlin/coroutines/CoroutineContext$Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Lkotlin/coroutines/CoroutineContext$Element;",
            ">(",
            "Lkotlin/coroutines/CoroutineContext$Key<",
            "TE;>;)TE;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lkotlin/coroutines/CoroutineContext$Element$DefaultImpls;->get(Lkotlin/coroutines/CoroutineContext$Element;Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object p0

    return-object p0
.end method

.method public final getCancellationException()Ljava/util/concurrent/CancellationException;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object v0

    .line 2
    instance-of v1, v0, Lkotlinx/coroutines/JobSupport$Finishing;

    const-string v2, "$this$classSimpleName"

    const-string v3, "Job is still new or active: "

    if-eqz v1, :cond_1

    check-cast v0, Lkotlinx/coroutines/JobSupport$Finishing;

    iget-object v0, v0, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3
    invoke-static {p0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    .line 5
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " is cancelling"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lkotlinx/coroutines/JobSupport;->toCancellationException(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/util/concurrent/CancellationException;

    move-result-object p0

    goto :goto_0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7
    :cond_1
    instance-of v1, v0, Lkotlinx/coroutines/Incomplete;

    if-nez v1, :cond_3

    .line 8
    instance-of v1, v0, Lkotlinx/coroutines/CompletedExceptionally;

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    check-cast v0, Lkotlinx/coroutines/CompletedExceptionally;

    iget-object v0, v0, Lkotlinx/coroutines/CompletedExceptionally;->cause:Ljava/lang/Throwable;

    .line 9
    invoke-virtual {p0, v0, v3}, Lkotlinx/coroutines/JobSupport;->toCancellationException(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/util/concurrent/CancellationException;

    move-result-object p0

    goto :goto_0

    .line 10
    :cond_2
    new-instance v0, Lkotlinx/coroutines/JobCancellationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    invoke-static {p0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " has completed normally"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v3, p0}, Lkotlinx/coroutines/JobCancellationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lkotlinx/coroutines/Job;)V

    move-object p0, v0

    :goto_0
    return-object p0

    .line 14
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getChildJobCancellationCause()Ljava/util/concurrent/CancellationException;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object v0

    .line 2
    instance-of v1, v0, Lkotlinx/coroutines/JobSupport$Finishing;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lkotlinx/coroutines/JobSupport$Finishing;

    iget-object v1, v1, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;

    goto :goto_0

    .line 3
    :cond_0
    instance-of v1, v0, Lkotlinx/coroutines/CompletedExceptionally;

    if-eqz v1, :cond_1

    move-object v1, v0

    check-cast v1, Lkotlinx/coroutines/CompletedExceptionally;

    iget-object v1, v1, Lkotlinx/coroutines/CompletedExceptionally;->cause:Ljava/lang/Throwable;

    goto :goto_0

    .line 4
    :cond_1
    instance-of v1, v0, Lkotlinx/coroutines/Incomplete;

    if-nez v1, :cond_4

    move-object v1, v2

    .line 5
    :goto_0
    instance-of v3, v1, Ljava/util/concurrent/CancellationException;

    if-nez v3, :cond_2

    goto :goto_1

    :cond_2
    move-object v2, v1

    :goto_1
    check-cast v2, Ljava/util/concurrent/CancellationException;

    if-eqz v2, :cond_3

    goto :goto_2

    :cond_3
    new-instance v2, Lkotlinx/coroutines/JobCancellationException;

    const-string v3, "Parent job is "

    invoke-static {v3}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v0}, Lkotlinx/coroutines/JobSupport;->stateString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1, p0}, Lkotlinx/coroutines/JobCancellationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lkotlinx/coroutines/Job;)V

    :goto_2
    return-object v2

    .line 6
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Cannot be cancelling child in this state: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getHandlesException$kotlinx_coroutines_core()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final getKey()Lkotlin/coroutines/CoroutineContext$Key;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/coroutines/CoroutineContext$Key<",
            "*>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lkotlinx/coroutines/Job;->Key:Lkotlinx/coroutines/Job$Key;

    return-object p0
.end method

.method public getOnCancelComplete$kotlinx_coroutines_core()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final getOrPromoteCancellingList(Lkotlinx/coroutines/Incomplete;)Lkotlinx/coroutines/NodeList;
    .locals 1

    .line 1
    invoke-interface {p1}, Lkotlinx/coroutines/Incomplete;->getList()Lkotlinx/coroutines/NodeList;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    instance-of v0, p1, Lkotlinx/coroutines/Empty;

    if-eqz v0, :cond_1

    new-instance v0, Lkotlinx/coroutines/NodeList;

    invoke-direct {v0}, Lkotlinx/coroutines/NodeList;-><init>()V

    goto :goto_0

    .line 3
    :cond_1
    instance-of v0, p1, Lkotlinx/coroutines/JobNode;

    if-eqz v0, :cond_2

    .line 4
    check-cast p1, Lkotlinx/coroutines/JobNode;

    invoke-virtual {p0, p1}, Lkotlinx/coroutines/JobSupport;->promoteSingleToNodeList(Lkotlinx/coroutines/JobNode;)V

    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 5
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "State should have list: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final getState$kotlinx_coroutines_core()Ljava/lang/Object;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    :goto_0
    iget-object v0, p0, Lkotlinx/coroutines/JobSupport;->_state:Ljava/lang/Object;

    .line 2
    instance-of v1, v0, Lkotlinx/coroutines/internal/OpDescriptor;

    if-nez v1, :cond_0

    return-object v0

    .line 3
    :cond_0
    check-cast v0, Lkotlinx/coroutines/internal/OpDescriptor;

    invoke-virtual {v0, p0}, Lkotlinx/coroutines/internal/OpDescriptor;->perform(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public handleJobException(Ljava/lang/Throwable;)Z
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 p0, 0x0

    return p0
.end method

.method public handleOnCompletionException$kotlinx_coroutines_core(Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    throw p1
.end method

.method public final initParentJobInternal$kotlinx_coroutines_core(Lkotlinx/coroutines/Job;)V
    .locals 1
    .param p1    # Lkotlinx/coroutines/Job;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-boolean v0, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    if-nez p1, :cond_0

    .line 2
    sget-object p1, Lkotlinx/coroutines/NonDisposableHandle;->INSTANCE:Lkotlinx/coroutines/NonDisposableHandle;

    iput-object p1, p0, Lkotlinx/coroutines/JobSupport;->parentHandle:Lkotlinx/coroutines/ChildHandle;

    return-void

    .line 3
    :cond_0
    invoke-interface {p1}, Lkotlinx/coroutines/Job;->start()Z

    .line 4
    invoke-interface {p1, p0}, Lkotlinx/coroutines/Job;->attachChild(Lkotlinx/coroutines/ChildJob;)Lkotlinx/coroutines/ChildHandle;

    move-result-object p1

    .line 5
    iput-object p1, p0, Lkotlinx/coroutines/JobSupport;->parentHandle:Lkotlinx/coroutines/ChildHandle;

    .line 6
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lkotlinx/coroutines/Incomplete;

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 7
    invoke-interface {p1}, Lkotlinx/coroutines/DisposableHandle;->dispose()V

    .line 8
    sget-object p1, Lkotlinx/coroutines/NonDisposableHandle;->INSTANCE:Lkotlinx/coroutines/NonDisposableHandle;

    iput-object p1, p0, Lkotlinx/coroutines/JobSupport;->parentHandle:Lkotlinx/coroutines/ChildHandle;

    :cond_1
    return-void
.end method

.method public final invokeOnCompletion(ZZLkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/DisposableHandle;
    .locals 7
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Throwable;",
            "Lkotlin/Unit;",
            ">;)",
            "Lkotlinx/coroutines/DisposableHandle;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "handler"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    move-object v1, v0

    .line 1
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object v2

    .line 2
    instance-of v3, v2, Lkotlinx/coroutines/Empty;

    if-eqz v3, :cond_4

    .line 3
    move-object v3, v2

    check-cast v3, Lkotlinx/coroutines/Empty;

    .line 4
    iget-boolean v4, v3, Lkotlinx/coroutines/Empty;->isActive:Z

    if-eqz v4, :cond_2

    if-eqz v1, :cond_1

    goto :goto_1

    .line 5
    :cond_1
    invoke-virtual {p0, p3, p1}, Lkotlinx/coroutines/JobSupport;->makeNode(Lkotlin/jvm/functions/Function1;Z)Lkotlinx/coroutines/JobNode;

    move-result-object v1

    .line 6
    :goto_1
    sget-object v3, Lkotlinx/coroutines/JobSupport;->_state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v3, p0, v2, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    .line 7
    :cond_2
    new-instance v2, Lkotlinx/coroutines/NodeList;

    invoke-direct {v2}, Lkotlinx/coroutines/NodeList;-><init>()V

    .line 8
    iget-boolean v4, v3, Lkotlinx/coroutines/Empty;->isActive:Z

    if-eqz v4, :cond_3

    goto :goto_2

    .line 9
    :cond_3
    new-instance v4, Lkotlinx/coroutines/InactiveNodeList;

    invoke-direct {v4, v2}, Lkotlinx/coroutines/InactiveNodeList;-><init>(Lkotlinx/coroutines/NodeList;)V

    move-object v2, v4

    .line 10
    :goto_2
    sget-object v4, Lkotlinx/coroutines/JobSupport;->_state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v4, p0, v3, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0

    .line 11
    :cond_4
    instance-of v3, v2, Lkotlinx/coroutines/Incomplete;

    if-eqz v3, :cond_10

    .line 12
    move-object v3, v2

    check-cast v3, Lkotlinx/coroutines/Incomplete;

    invoke-interface {v3}, Lkotlinx/coroutines/Incomplete;->getList()Lkotlinx/coroutines/NodeList;

    move-result-object v3

    if-nez v3, :cond_6

    if-eqz v2, :cond_5

    .line 13
    check-cast v2, Lkotlinx/coroutines/JobNode;

    invoke-virtual {p0, v2}, Lkotlinx/coroutines/JobSupport;->promoteSingleToNodeList(Lkotlinx/coroutines/JobNode;)V

    goto :goto_0

    :cond_5
    new-instance p0, Lkotlin/TypeCastException;

    const-string p1, "null cannot be cast to non-null type kotlinx.coroutines.JobNode<*>"

    invoke-direct {p0, p1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 14
    :cond_6
    sget-object v4, Lkotlinx/coroutines/NonDisposableHandle;->INSTANCE:Lkotlinx/coroutines/NonDisposableHandle;

    if-eqz p1, :cond_c

    .line 15
    instance-of v5, v2, Lkotlinx/coroutines/JobSupport$Finishing;

    if-eqz v5, :cond_c

    .line 16
    monitor-enter v2

    .line 17
    :try_start_0
    move-object v5, v2

    check-cast v5, Lkotlinx/coroutines/JobSupport$Finishing;

    iget-object v5, v5, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;

    if-eqz v5, :cond_7

    .line 18
    instance-of v6, p3, Lkotlinx/coroutines/ChildHandleNode;

    if-eqz v6, :cond_b

    move-object v6, v2

    check-cast v6, Lkotlinx/coroutines/JobSupport$Finishing;

    iget-boolean v6, v6, Lkotlinx/coroutines/JobSupport$Finishing;->isCompleting:Z

    if-nez v6, :cond_b

    :cond_7
    if-eqz v1, :cond_8

    goto :goto_3

    .line 19
    :cond_8
    invoke-virtual {p0, p3, p1}, Lkotlinx/coroutines/JobSupport;->makeNode(Lkotlin/jvm/functions/Function1;Z)Lkotlinx/coroutines/JobNode;

    move-result-object v1

    .line 20
    :goto_3
    invoke-virtual {p0, v2, v3, v1}, Lkotlinx/coroutines/JobSupport;->addLastAtomic(Ljava/lang/Object;Lkotlinx/coroutines/NodeList;Lkotlinx/coroutines/JobNode;)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_9

    monitor-exit v2

    goto :goto_0

    :cond_9
    if-nez v5, :cond_a

    .line 21
    monitor-exit v2

    return-object v1

    :cond_a
    move-object v4, v1

    .line 22
    :cond_b
    monitor-exit v2

    goto :goto_4

    :catchall_0
    move-exception p0

    monitor-exit v2

    throw p0

    :cond_c
    move-object v5, v0

    :goto_4
    if-eqz v5, :cond_e

    if-eqz p2, :cond_d

    .line 23
    invoke-interface {p3, v5}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    return-object v4

    :cond_e
    if-eqz v1, :cond_f

    goto :goto_5

    .line 24
    :cond_f
    invoke-virtual {p0, p3, p1}, Lkotlinx/coroutines/JobSupport;->makeNode(Lkotlin/jvm/functions/Function1;Z)Lkotlinx/coroutines/JobNode;

    move-result-object v1

    .line 25
    :goto_5
    invoke-virtual {p0, v2, v3, v1}, Lkotlinx/coroutines/JobSupport;->addLastAtomic(Ljava/lang/Object;Lkotlinx/coroutines/NodeList;Lkotlinx/coroutines/JobNode;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_10
    if-eqz p2, :cond_13

    .line 26
    instance-of p0, v2, Lkotlinx/coroutines/CompletedExceptionally;

    if-nez p0, :cond_11

    move-object v2, v0

    :cond_11
    check-cast v2, Lkotlinx/coroutines/CompletedExceptionally;

    if-eqz v2, :cond_12

    iget-object v0, v2, Lkotlinx/coroutines/CompletedExceptionally;->cause:Ljava/lang/Throwable;

    .line 27
    :cond_12
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    :cond_13
    sget-object p0, Lkotlinx/coroutines/NonDisposableHandle;->INSTANCE:Lkotlinx/coroutines/NonDisposableHandle;

    return-object p0
.end method

.method public isActive()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object p0

    .line 2
    instance-of v0, p0, Lkotlinx/coroutines/Incomplete;

    if-eqz v0, :cond_0

    check-cast p0, Lkotlinx/coroutines/Incomplete;

    invoke-interface {p0}, Lkotlinx/coroutines/Incomplete;->isActive()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isScopedCoroutine()Z
    .locals 0

    instance-of p0, p0, Lkotlinx/coroutines/BlockingCoroutine;

    return p0
.end method

.method public final makeCompletingOnce$kotlinx_coroutines_core(Ljava/lang/Object;I)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    :goto_0
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object v0

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Lkotlinx/coroutines/JobSupport;->tryMakeCompleting(Ljava/lang/Object;Ljava/lang/Object;I)I

    move-result v0

    if-eqz v0, :cond_3

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "unexpected result"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    const/4 p0, 0x0

    return p0

    :cond_2
    return v1

    .line 4
    :cond_3
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Job "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " is already complete or completing, "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "but is being completed with "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 6
    instance-of v0, p1, Lkotlinx/coroutines/CompletedExceptionally;

    const/4 v1, 0x0

    if-nez v0, :cond_4

    move-object p1, v1

    :cond_4
    check-cast p1, Lkotlinx/coroutines/CompletedExceptionally;

    if-eqz p1, :cond_5

    iget-object v1, p1, Lkotlinx/coroutines/CompletedExceptionally;->cause:Ljava/lang/Throwable;

    .line 7
    :cond_5
    invoke-direct {p2, p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public final makeNode(Lkotlin/jvm/functions/Function1;Z)Lkotlinx/coroutines/JobNode;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Throwable;",
            "Lkotlin/Unit;",
            ">;Z)",
            "Lkotlinx/coroutines/JobNode<",
            "*>;"
        }
    .end annotation

    const-string v0, "Failed requirement."

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz p2, :cond_4

    .line 1
    instance-of p2, p1, Lkotlinx/coroutines/JobCancellingNode;

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    move-object v3, p1

    :goto_0
    check-cast v3, Lkotlinx/coroutines/JobCancellingNode;

    if-eqz v3, :cond_3

    iget-object p1, v3, Lkotlinx/coroutines/JobNode;->job:Lkotlinx/coroutines/Job;

    if-ne p1, p0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    if-eqz v1, :cond_2

    goto :goto_4

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2
    :cond_3
    new-instance v3, Lkotlinx/coroutines/InvokeOnCancelling;

    invoke-direct {v3, p0, p1}, Lkotlinx/coroutines/InvokeOnCancelling;-><init>(Lkotlinx/coroutines/Job;Lkotlin/jvm/functions/Function1;)V

    goto :goto_4

    .line 3
    :cond_4
    instance-of p2, p1, Lkotlinx/coroutines/JobNode;

    if-nez p2, :cond_5

    goto :goto_2

    :cond_5
    move-object v3, p1

    :goto_2
    check-cast v3, Lkotlinx/coroutines/JobNode;

    if-eqz v3, :cond_8

    iget-object p1, v3, Lkotlinx/coroutines/JobNode;->job:Lkotlinx/coroutines/Job;

    if-ne p1, p0, :cond_6

    instance-of p0, v3, Lkotlinx/coroutines/JobCancellingNode;

    if-nez p0, :cond_6

    goto :goto_3

    :cond_6
    move v1, v2

    :goto_3
    if-eqz v1, :cond_7

    goto :goto_4

    :cond_7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 4
    :cond_8
    new-instance v3, Lkotlinx/coroutines/InvokeOnCompletion;

    invoke-direct {v3, p0, p1}, Lkotlinx/coroutines/InvokeOnCompletion;-><init>(Lkotlinx/coroutines/Job;Lkotlin/jvm/functions/Function1;)V

    :goto_4
    return-object v3
.end method

.method public minusKey(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext;
    .locals 1
    .param p1    # Lkotlin/coroutines/CoroutineContext$Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/CoroutineContext$Key<",
            "*>;)",
            "Lkotlin/coroutines/CoroutineContext;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lkotlin/coroutines/CoroutineContext$Element$DefaultImpls;->minusKey(Lkotlin/coroutines/CoroutineContext$Element;Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p0

    return-object p0
.end method

.method public nameString$kotlinx_coroutines_core()Ljava/lang/String;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "$this$classSimpleName"

    .line 1
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final nextChild(Lkotlinx/coroutines/internal/LockFreeLinkedListNode;)Lkotlinx/coroutines/ChildHandleNode;
    .locals 0
    .param p1    # Lkotlinx/coroutines/internal/LockFreeLinkedListNode;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    :goto_0
    invoke-virtual {p1}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getNext()Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lkotlinx/coroutines/internal/Removed;

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {p1}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getPrev()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lkotlinx/coroutines/internal/LockFreeLinkedListKt;->unwrap(Ljava/lang/Object;)Lkotlinx/coroutines/internal/LockFreeLinkedListNode;

    move-result-object p1

    goto :goto_0

    .line 3
    :cond_0
    :goto_1
    invoke-virtual {p1}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getNextNode()Lkotlinx/coroutines/internal/LockFreeLinkedListNode;

    move-result-object p1

    .line 4
    invoke-virtual {p1}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getNext()Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lkotlinx/coroutines/internal/Removed;

    if-eqz p0, :cond_1

    goto :goto_1

    .line 5
    :cond_1
    instance-of p0, p1, Lkotlinx/coroutines/ChildHandleNode;

    if-eqz p0, :cond_2

    check-cast p1, Lkotlinx/coroutines/ChildHandleNode;

    return-object p1

    .line 6
    :cond_2
    instance-of p0, p1, Lkotlinx/coroutines/NodeList;

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final notifyCancelling(Lkotlinx/coroutines/NodeList;Ljava/lang/Throwable;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getNext()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_4

    check-cast v0, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;

    const/4 v1, 0x0

    .line 2
    :goto_0
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_2

    .line 3
    instance-of v2, v0, Lkotlinx/coroutines/JobCancellingNode;

    if-eqz v2, :cond_1

    move-object v2, v0

    check-cast v2, Lkotlinx/coroutines/JobNode;

    .line 4
    :try_start_0
    invoke-virtual {v2, p2}, Lkotlinx/coroutines/CompletionHandlerBase;->invoke(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v3

    if-eqz v1, :cond_0

    .line 5
    invoke-static {v1, v3}, Lkotlin/ResultKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 6
    :cond_0
    new-instance v1, Lkotlinx/coroutines/CompletionHandlerException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in completion handler "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " for "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v3}, Lkotlinx/coroutines/CompletionHandlerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 7
    :cond_1
    :goto_1
    invoke-virtual {v0}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getNextNode()Lkotlinx/coroutines/internal/LockFreeLinkedListNode;

    move-result-object v0

    goto :goto_0

    :cond_2
    if-eqz v1, :cond_3

    .line 8
    invoke-virtual {p0, v1}, Lkotlinx/coroutines/JobSupport;->handleOnCompletionException$kotlinx_coroutines_core(Ljava/lang/Throwable;)V

    .line 9
    :cond_3
    invoke-virtual {p0, p2}, Lkotlinx/coroutines/JobSupport;->cancelParent(Ljava/lang/Throwable;)Z

    return-void

    .line 10
    :cond_4
    new-instance p0, Lkotlin/TypeCastException;

    const-string p1, "null cannot be cast to non-null type kotlinx.coroutines.internal.Node /* = kotlinx.coroutines.internal.LockFreeLinkedListNode */"

    invoke-direct {p0, p1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public onCompletionInternal(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onStartInternal$kotlinx_coroutines_core()V
    .locals 0

    return-void
.end method

.method public final parentCancelled(Lkotlinx/coroutines/ParentJob;)V
    .locals 1
    .param p1    # Lkotlinx/coroutines/ParentJob;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "parentJob"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p0, p1}, Lkotlinx/coroutines/JobSupport;->cancelImpl$kotlinx_coroutines_core(Ljava/lang/Object;)Z

    return-void
.end method

.method public plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;
    .locals 1
    .param p1    # Lkotlin/coroutines/CoroutineContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Lkotlin/coroutines/CoroutineContext$Element$DefaultImpls;->plus(Lkotlin/coroutines/CoroutineContext$Element;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p0

    return-object p0
.end method

.method public final promoteSingleToNodeList(Lkotlinx/coroutines/JobNode;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/JobNode<",
            "*>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lkotlinx/coroutines/NodeList;

    invoke-direct {v0}, Lkotlinx/coroutines/NodeList;-><init>()V

    .line 2
    sget-object v1, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->_prev$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->lazySet(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3
    sget-object v1, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->_next$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->lazySet(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    :cond_0
    invoke-virtual {p1}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getNext()Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_1

    goto :goto_0

    .line 5
    :cond_1
    sget-object v1, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->_next$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p1, p1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 6
    invoke-virtual {v0, p1}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->finishAdd(Lkotlinx/coroutines/internal/LockFreeLinkedListNode;)V

    .line 7
    :goto_0
    invoke-virtual {p1}, Lkotlinx/coroutines/internal/LockFreeLinkedListNode;->getNextNode()Lkotlinx/coroutines/internal/LockFreeLinkedListNode;

    move-result-object v0

    .line 8
    sget-object v1, Lkotlinx/coroutines/JobSupport;->_state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0, p1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method

.method public final start()Z
    .locals 6

    .line 1
    :goto_0
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object v0

    .line 2
    instance-of v1, v0, Lkotlinx/coroutines/Empty;

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_2

    .line 3
    move-object v1, v0

    check-cast v1, Lkotlinx/coroutines/Empty;

    .line 4
    iget-boolean v1, v1, Lkotlinx/coroutines/Empty;->isActive:Z

    if-eqz v1, :cond_0

    goto :goto_2

    .line 5
    :cond_0
    sget-object v1, Lkotlinx/coroutines/JobSupport;->_state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 6
    sget-object v5, Lkotlinx/coroutines/JobSupportKt;->EMPTY_ACTIVE:Lkotlinx/coroutines/Empty;

    .line 7
    invoke-virtual {v1, p0, v0, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_3

    .line 8
    :cond_1
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->onStartInternal$kotlinx_coroutines_core()V

    goto :goto_1

    .line 9
    :cond_2
    instance-of v1, v0, Lkotlinx/coroutines/InactiveNodeList;

    if-eqz v1, :cond_4

    .line 10
    sget-object v1, Lkotlinx/coroutines/JobSupport;->_state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-object v5, v0

    check-cast v5, Lkotlinx/coroutines/InactiveNodeList;

    .line 11
    iget-object v5, v5, Lkotlinx/coroutines/InactiveNodeList;->list:Lkotlinx/coroutines/NodeList;

    .line 12
    invoke-virtual {v1, p0, v0, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_3

    .line 13
    :cond_3
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->onStartInternal$kotlinx_coroutines_core()V

    :goto_1
    move v2, v4

    goto :goto_3

    :cond_4
    :goto_2
    move v2, v3

    :goto_3
    if-eqz v2, :cond_6

    if-eq v2, v4, :cond_5

    goto :goto_0

    :cond_5
    return v4

    :cond_6
    return v3
.end method

.method public final stateString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 1
    instance-of p0, p1, Lkotlinx/coroutines/JobSupport$Finishing;

    const-string v0, "Active"

    if-eqz p0, :cond_1

    .line 2
    check-cast p1, Lkotlinx/coroutines/JobSupport$Finishing;

    invoke-virtual {p1}, Lkotlinx/coroutines/JobSupport$Finishing;->isCancelling()Z

    move-result p0

    if-eqz p0, :cond_0

    const-string v0, "Cancelling"

    goto :goto_0

    .line 3
    :cond_0
    iget-boolean p0, p1, Lkotlinx/coroutines/JobSupport$Finishing;->isCompleting:Z

    if-eqz p0, :cond_5

    const-string v0, "Completing"

    goto :goto_0

    .line 4
    :cond_1
    instance-of p0, p1, Lkotlinx/coroutines/Incomplete;

    if-eqz p0, :cond_3

    check-cast p1, Lkotlinx/coroutines/Incomplete;

    invoke-interface {p1}, Lkotlinx/coroutines/Incomplete;->isActive()Z

    move-result p0

    if-eqz p0, :cond_2

    goto :goto_0

    :cond_2
    const-string v0, "New"

    goto :goto_0

    .line 5
    :cond_3
    instance-of p0, p1, Lkotlinx/coroutines/CompletedExceptionally;

    if-eqz p0, :cond_4

    const-string v0, "Cancelled"

    goto :goto_0

    :cond_4
    const-string v0, "Completed"

    :cond_5
    :goto_0
    return-object v0
.end method

.method public final toCancellationException(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/util/concurrent/CancellationException;
    .locals 2
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "$this$toCancellationException"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    check-cast v0, Ljava/util/concurrent/CancellationException;

    if-eqz v0, :cond_1

    goto :goto_2

    .line 2
    :cond_1
    new-instance v0, Lkotlinx/coroutines/JobCancellationException;

    if-eqz p2, :cond_2

    goto :goto_1

    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "$this$classSimpleName"

    .line 3
    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    .line 5
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " was cancelled"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_1
    invoke-direct {v0, p2, p1, p0}, Lkotlinx/coroutines/JobCancellationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lkotlinx/coroutines/Job;)V

    :goto_2
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->nameString$kotlinx_coroutines_core()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x7b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lkotlinx/coroutines/JobSupport;->stateString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x7d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lkotlinx/coroutines/TimeSourceKt;->getHexAddress(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final tryFinalizeFinishingState(Lkotlinx/coroutines/JobSupport$Finishing;Ljava/lang/Object;I)Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Lkotlinx/coroutines/JobSupport;->getState$kotlinx_coroutines_core()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, p1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_13

    .line 2
    invoke-virtual {p1}, Lkotlinx/coroutines/JobSupport$Finishing;->isSealed()Z

    move-result v0

    xor-int/2addr v0, v2

    if-eqz v0, :cond_12

    .line 3
    iget-boolean v0, p1, Lkotlinx/coroutines/JobSupport$Finishing;->isCompleting:Z

    if-eqz v0, :cond_11

    .line 4
    instance-of v0, p2, Lkotlinx/coroutines/CompletedExceptionally;

    const/4 v3, 0x0

    if-nez v0, :cond_1

    move-object v0, v3

    goto :goto_1

    :cond_1
    move-object v0, p2

    :goto_1
    check-cast v0, Lkotlinx/coroutines/CompletedExceptionally;

    if-eqz v0, :cond_2

    iget-object v0, v0, Lkotlinx/coroutines/CompletedExceptionally;->cause:Ljava/lang/Throwable;

    goto :goto_2

    :cond_2
    move-object v0, v3

    .line 5
    :goto_2
    monitor-enter p1

    .line 6
    :try_start_0
    invoke-virtual {p1, v0}, Lkotlinx/coroutines/JobSupport$Finishing;->sealLocked(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v4

    .line 7
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 8
    invoke-virtual {p1}, Lkotlinx/coroutines/JobSupport$Finishing;->isCancelling()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 9
    new-instance v5, Lkotlinx/coroutines/JobCancellationException;

    const-string v6, "Job was cancelled"

    invoke-direct {v5, v6, v3, p0}, Lkotlinx/coroutines/JobCancellationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lkotlinx/coroutines/Job;)V

    move-object v3, v5

    goto :goto_3

    .line 10
    :cond_3
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Ljava/lang/Throwable;

    .line 11
    instance-of v7, v7, Ljava/util/concurrent/CancellationException;

    xor-int/2addr v7, v2

    if-eqz v7, :cond_4

    move-object v3, v6

    .line 12
    :cond_5
    check-cast v3, Ljava/lang/Throwable;

    if-eqz v3, :cond_6

    goto :goto_3

    .line 13
    :cond_6
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Throwable;

    :cond_7
    :goto_3
    if-eqz v3, :cond_8

    .line 14
    invoke-virtual {p0, v3, v4}, Lkotlinx/coroutines/JobSupport;->addSuppressedExceptions(Ljava/lang/Throwable;Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    :cond_8
    monitor-exit p1

    if-nez v3, :cond_9

    goto :goto_4

    :cond_9
    if-ne v3, v0, :cond_a

    goto :goto_4

    .line 16
    :cond_a
    new-instance p2, Lkotlinx/coroutines/CompletedExceptionally;

    const/4 v0, 0x2

    invoke-direct {p2, v3, v1, v0}, Lkotlinx/coroutines/CompletedExceptionally;-><init>(Ljava/lang/Throwable;ZI)V

    :goto_4
    if-eqz v3, :cond_e

    .line 17
    invoke-virtual {p0, v3}, Lkotlinx/coroutines/JobSupport;->cancelParent(Ljava/lang/Throwable;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p0, v3}, Lkotlinx/coroutines/JobSupport;->handleJobException(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_5

    :cond_b
    move v0, v1

    goto :goto_6

    :cond_c
    :goto_5
    move v0, v2

    :goto_6
    if-eqz v0, :cond_e

    if-eqz p2, :cond_d

    .line 18
    move-object v0, p2

    check-cast v0, Lkotlinx/coroutines/CompletedExceptionally;

    .line 19
    sget-object v3, Lkotlinx/coroutines/CompletedExceptionally;->_handled$FU:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v3, v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    goto :goto_7

    .line 20
    :cond_d
    new-instance p0, Lkotlin/TypeCastException;

    const-string p1, "null cannot be cast to non-null type kotlinx.coroutines.CompletedExceptionally"

    invoke-direct {p0, p1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 21
    :cond_e
    :goto_7
    invoke-virtual {p0, p2}, Lkotlinx/coroutines/JobSupport;->onCompletionInternal(Ljava/lang/Object;)V

    .line 22
    sget-object v0, Lkotlinx/coroutines/JobSupport;->_state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 23
    instance-of v1, p2, Lkotlinx/coroutines/Incomplete;

    if-eqz v1, :cond_f

    new-instance v1, Lkotlinx/coroutines/IncompleteStateBox;

    move-object v3, p2

    check-cast v3, Lkotlinx/coroutines/Incomplete;

    invoke-direct {v1, v3}, Lkotlinx/coroutines/IncompleteStateBox;-><init>(Lkotlinx/coroutines/Incomplete;)V

    goto :goto_8

    :cond_f
    move-object v1, p2

    .line 24
    :goto_8
    invoke-virtual {v0, p0, p1, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 25
    invoke-virtual {p0, p1, p2, p3}, Lkotlinx/coroutines/JobSupport;->completeStateFinalization(Lkotlinx/coroutines/Incomplete;Ljava/lang/Object;I)V

    return v2

    :cond_10
    const-string p3, "Unexpected state: "

    .line 26
    invoke-static {p3}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object p0, p0, Lkotlinx/coroutines/JobSupport;->_state:Ljava/lang/Object;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", expected: "

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", update: "

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p0

    .line 27
    monitor-exit p1

    throw p0

    :cond_11
    const-string p0, "Failed requirement."

    .line 28
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_12
    const-string p0, "Failed requirement."

    .line 29
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_13
    const-string p0, "Failed requirement."

    .line 30
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final tryMakeCompleting(Ljava/lang/Object;Ljava/lang/Object;I)I
    .locals 7

    .line 1
    instance-of v0, p1, Lkotlinx/coroutines/Incomplete;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 2
    :cond_0
    instance-of v0, p1, Lkotlinx/coroutines/Empty;

    const/4 v2, 0x3

    const/4 v3, 0x1

    if-nez v0, :cond_1

    instance-of v0, p1, Lkotlinx/coroutines/JobNode;

    if-eqz v0, :cond_5

    :cond_1
    instance-of v0, p1, Lkotlinx/coroutines/ChildHandleNode;

    if-nez v0, :cond_5

    instance-of v0, p2, Lkotlinx/coroutines/CompletedExceptionally;

    if-nez v0, :cond_5

    .line 3
    check-cast p1, Lkotlinx/coroutines/Incomplete;

    .line 4
    sget-boolean v0, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    .line 5
    sget-object v0, Lkotlinx/coroutines/JobSupport;->_state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    sget-object v4, Lkotlinx/coroutines/JobSupportKt;->SEALED:Lkotlinx/coroutines/internal/Symbol;

    .line 6
    instance-of v4, p2, Lkotlinx/coroutines/Incomplete;

    if-eqz v4, :cond_2

    new-instance v4, Lkotlinx/coroutines/IncompleteStateBox;

    move-object v5, p2

    check-cast v5, Lkotlinx/coroutines/Incomplete;

    invoke-direct {v4, v5}, Lkotlinx/coroutines/IncompleteStateBox;-><init>(Lkotlinx/coroutines/Incomplete;)V

    goto :goto_0

    :cond_2
    move-object v4, p2

    .line 7
    :goto_0
    invoke-virtual {v0, p0, p1, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_1

    .line 8
    :cond_3
    invoke-virtual {p0, p2}, Lkotlinx/coroutines/JobSupport;->onCompletionInternal(Ljava/lang/Object;)V

    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lkotlinx/coroutines/JobSupport;->completeStateFinalization(Lkotlinx/coroutines/Incomplete;Ljava/lang/Object;I)V

    move v1, v3

    :goto_1
    if-nez v1, :cond_4

    return v2

    :cond_4
    return v3

    .line 10
    :cond_5
    check-cast p1, Lkotlinx/coroutines/Incomplete;

    .line 11
    invoke-virtual {p0, p1}, Lkotlinx/coroutines/JobSupport;->getOrPromoteCancellingList(Lkotlinx/coroutines/Incomplete;)Lkotlinx/coroutines/NodeList;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 12
    instance-of v4, p1, Lkotlinx/coroutines/JobSupport$Finishing;

    const/4 v5, 0x0

    if-nez v4, :cond_6

    move-object v4, v5

    goto :goto_2

    :cond_6
    move-object v4, p1

    :goto_2
    check-cast v4, Lkotlinx/coroutines/JobSupport$Finishing;

    if-eqz v4, :cond_7

    goto :goto_3

    :cond_7
    new-instance v4, Lkotlinx/coroutines/JobSupport$Finishing;

    invoke-direct {v4, v0, v1, v5}, Lkotlinx/coroutines/JobSupport$Finishing;-><init>(Lkotlinx/coroutines/NodeList;ZLjava/lang/Throwable;)V

    .line 13
    :goto_3
    monitor-enter v4

    .line 14
    :try_start_0
    iget-boolean v6, v4, Lkotlinx/coroutines/JobSupport$Finishing;->isCompleting:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v6, :cond_8

    monitor-exit v4

    goto/16 :goto_9

    .line 15
    :cond_8
    :try_start_1
    iput-boolean v3, v4, Lkotlinx/coroutines/JobSupport$Finishing;->isCompleting:Z

    if-eq v4, p1, :cond_9

    .line 16
    sget-object v1, Lkotlinx/coroutines/JobSupport;->_state$FU:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, p0, p1, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_9

    monitor-exit v4

    goto/16 :goto_8

    .line 17
    :cond_9
    :try_start_2
    invoke-virtual {v4}, Lkotlinx/coroutines/JobSupport$Finishing;->isSealed()Z

    move-result v1

    xor-int/2addr v1, v3

    if-eqz v1, :cond_12

    .line 18
    invoke-virtual {v4}, Lkotlinx/coroutines/JobSupport$Finishing;->isCancelling()Z

    move-result v1

    .line 19
    instance-of v2, p2, Lkotlinx/coroutines/CompletedExceptionally;

    if-nez v2, :cond_a

    move-object v2, v5

    goto :goto_4

    :cond_a
    move-object v2, p2

    :goto_4
    check-cast v2, Lkotlinx/coroutines/CompletedExceptionally;

    if-eqz v2, :cond_b

    iget-object v2, v2, Lkotlinx/coroutines/CompletedExceptionally;->cause:Ljava/lang/Throwable;

    invoke-virtual {v4, v2}, Lkotlinx/coroutines/JobSupport$Finishing;->addExceptionLocked(Ljava/lang/Throwable;)V

    .line 20
    :cond_b
    iget-object v2, v4, Lkotlinx/coroutines/JobSupport$Finishing;->rootCause:Ljava/lang/Throwable;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    xor-int/2addr v1, v3

    if-eqz v1, :cond_c

    goto :goto_5

    :cond_c
    move-object v2, v5

    .line 21
    :goto_5
    monitor-exit v4

    if-eqz v2, :cond_d

    .line 22
    invoke-virtual {p0, v0, v2}, Lkotlinx/coroutines/JobSupport;->notifyCancelling(Lkotlinx/coroutines/NodeList;Ljava/lang/Throwable;)V

    .line 23
    :cond_d
    instance-of v0, p1, Lkotlinx/coroutines/ChildHandleNode;

    if-nez v0, :cond_e

    move-object v0, v5

    goto :goto_6

    :cond_e
    move-object v0, p1

    :goto_6
    check-cast v0, Lkotlinx/coroutines/ChildHandleNode;

    if-eqz v0, :cond_f

    move-object v5, v0

    goto :goto_7

    :cond_f
    invoke-interface {p1}, Lkotlinx/coroutines/Incomplete;->getList()Lkotlinx/coroutines/NodeList;

    move-result-object p1

    if-eqz p1, :cond_10

    invoke-virtual {p0, p1}, Lkotlinx/coroutines/JobSupport;->nextChild(Lkotlinx/coroutines/internal/LockFreeLinkedListNode;)Lkotlinx/coroutines/ChildHandleNode;

    move-result-object v5

    :cond_10
    :goto_7
    if-eqz v5, :cond_11

    .line 24
    invoke-virtual {p0, v4, v5, p2}, Lkotlinx/coroutines/JobSupport;->tryWaitForChild(Lkotlinx/coroutines/JobSupport$Finishing;Lkotlinx/coroutines/ChildHandleNode;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11

    const/4 v1, 0x2

    goto :goto_9

    .line 25
    :cond_11
    invoke-virtual {p0, v4, p2, p3}, Lkotlinx/coroutines/JobSupport;->tryFinalizeFinishingState(Lkotlinx/coroutines/JobSupport$Finishing;Ljava/lang/Object;I)Z

    move v1, v3

    goto :goto_9

    :cond_12
    :try_start_3
    const-string p0, "Failed requirement."

    .line 26
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p0

    .line 27
    monitor-exit v4

    throw p0

    :cond_13
    :goto_8
    move v1, v2

    :goto_9
    return v1
.end method

.method public final tryWaitForChild(Lkotlinx/coroutines/JobSupport$Finishing;Lkotlinx/coroutines/ChildHandleNode;Ljava/lang/Object;)Z
    .locals 6

    .line 1
    :goto_0
    iget-object v0, p2, Lkotlinx/coroutines/ChildHandleNode;->childJob:Lkotlinx/coroutines/ChildJob;

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 2
    new-instance v3, Lkotlinx/coroutines/JobSupport$ChildCompletion;

    invoke-direct {v3, p0, p1, p2, p3}, Lkotlinx/coroutines/JobSupport$ChildCompletion;-><init>(Lkotlinx/coroutines/JobSupport;Lkotlinx/coroutines/JobSupport$Finishing;Lkotlinx/coroutines/ChildHandleNode;Ljava/lang/Object;)V

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 3
    invoke-static/range {v0 .. v5}, Lkotlinx/coroutines/Job$DefaultImpls;->invokeOnCompletion$default(Lkotlinx/coroutines/Job;ZZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lkotlinx/coroutines/DisposableHandle;

    move-result-object v0

    .line 4
    sget-object v1, Lkotlinx/coroutines/NonDisposableHandle;->INSTANCE:Lkotlinx/coroutines/NonDisposableHandle;

    if-eq v0, v1, :cond_0

    const/4 p0, 0x1

    return p0

    .line 5
    :cond_0
    invoke-virtual {p0, p2}, Lkotlinx/coroutines/JobSupport;->nextChild(Lkotlinx/coroutines/internal/LockFreeLinkedListNode;)Lkotlinx/coroutines/ChildHandleNode;

    move-result-object p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method
