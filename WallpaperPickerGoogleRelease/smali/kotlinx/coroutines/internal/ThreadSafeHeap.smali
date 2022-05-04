.class public Lkotlinx/coroutines/internal/ThreadSafeHeap;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lkotlinx/coroutines/internal/ThreadSafeHeapNode;",
        ":",
        "Ljava/lang/Comparable<",
        "-TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nThreadSafeHeap.common.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ThreadSafeHeap.common.kt\nkotlinx/coroutines/internal/ThreadSafeHeap\n+ 2 Synchronized.kt\nkotlinx/coroutines/internal/SynchronizedKt\n+ 3 ThreadSafeHeap.kt\nkotlinx/coroutines/internal/ThreadSafeHeapKt\n*L\n1#1,161:1\n20#2:162\n20#2:164\n20#2:165\n20#2:166\n20#2:167\n20#2:168\n20#2:169\n8#3:163\n*E\n*S KotlinDebug\n*F\n+ 1 ThreadSafeHeap.common.kt\nkotlinx/coroutines/internal/ThreadSafeHeap\n*L\n35#1:162\n40#1:164\n42#1:165\n51#1:166\n60#1:167\n64#1:168\n73#1:169\n35#1:163\n*E\n"
.end annotation


# instance fields
.field public volatile _size:I

.field public a:[Lkotlinx/coroutines/internal/ThreadSafeHeapNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-class v0, Lkotlinx/coroutines/internal/ThreadSafeHeap;

    const-string v1, "_size"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    return-void
.end method


# virtual methods
.method public final addImpl(Lkotlinx/coroutines/internal/ThreadSafeHeapNode;)V
    .locals 3
    .param p1    # Lkotlinx/coroutines/internal/ThreadSafeHeapNode;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    sget-boolean v0, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    .line 2
    move-object v0, p1

    check-cast v0, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;

    invoke-virtual {v0, p0}, Lkotlinx/coroutines/EventLoopImplBase$DelayedTask;->setHeap(Lkotlinx/coroutines/internal/ThreadSafeHeap;)V

    .line 3
    iget-object v0, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->a:[Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    if-nez v0, :cond_0

    const/4 v0, 0x4

    new-array v0, v0, [Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    .line 4
    iput-object v0, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->a:[Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    goto :goto_0

    .line 5
    :cond_0
    iget v1, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    .line 6
    array-length v2, v0

    if-lt v1, v2, :cond_1

    .line 7
    iget v1, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    mul-int/lit8 v1, v1, 0x2

    .line 8
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v1, "java.util.Arrays.copyOf(this, newSize)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, [Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    iput-object v0, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->a:[Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    .line 9
    :cond_1
    :goto_0
    iget v1, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    add-int/lit8 v2, v1, 0x1

    .line 10
    iput v2, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    .line 11
    aput-object p1, v0, v1

    .line 12
    invoke-virtual {p0, v1}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->siftUpFrom(I)V

    return-void
.end method

.method public final firstImpl()Lkotlinx/coroutines/internal/ThreadSafeHeapNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->a:[Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    aget-object p0, p0, v0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public final removeAtImpl(I)Lkotlinx/coroutines/internal/ThreadSafeHeapNode;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-boolean v0, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    .line 2
    iget-object v0, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->a:[Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    .line 3
    iget v2, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    const/4 v3, -0x1

    add-int/2addr v2, v3

    .line 4
    iput v2, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    .line 5
    iget v2, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    if-ge p1, v2, :cond_b

    .line 6
    iget v2, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    .line 7
    invoke-virtual {p0, p1, v2}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->swap(II)V

    add-int/lit8 v2, p1, -0x1

    .line 8
    div-int/lit8 v2, v2, 0x2

    if-lez p1, :cond_2

    .line 9
    aget-object v4, v0, p1

    if-eqz v4, :cond_1

    check-cast v4, Ljava/lang/Comparable;

    aget-object v5, v0, v2

    if-eqz v5, :cond_0

    invoke-interface {v4, v5}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v4

    if-gez v4, :cond_2

    .line 10
    invoke-virtual {p0, p1, v2}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->swap(II)V

    .line 11
    invoke-virtual {p0, v2}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->siftUpFrom(I)V

    goto :goto_2

    .line 12
    :cond_0
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1

    :cond_1
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1

    :cond_2
    :goto_0
    mul-int/lit8 v2, p1, 0x2

    add-int/lit8 v2, v2, 0x1

    .line 13
    iget v4, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    if-lt v2, v4, :cond_3

    goto :goto_2

    .line 14
    :cond_3
    iget-object v4, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->a:[Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    if-eqz v4, :cond_a

    add-int/lit8 v5, v2, 0x1

    .line 15
    iget v6, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    if-ge v5, v6, :cond_6

    .line 16
    aget-object v6, v4, v5

    if-eqz v6, :cond_5

    check-cast v6, Ljava/lang/Comparable;

    aget-object v7, v4, v2

    if-eqz v7, :cond_4

    invoke-interface {v6, v7}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v6

    if-gez v6, :cond_6

    move v2, v5

    goto :goto_1

    :cond_4
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1

    :cond_5
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1

    .line 17
    :cond_6
    :goto_1
    aget-object v5, v4, p1

    if-eqz v5, :cond_9

    check-cast v5, Ljava/lang/Comparable;

    aget-object v4, v4, v2

    if-eqz v4, :cond_8

    invoke-interface {v5, v4}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v4

    if-gtz v4, :cond_7

    goto :goto_2

    .line 18
    :cond_7
    invoke-virtual {p0, p1, v2}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->swap(II)V

    move p1, v2

    goto :goto_0

    .line 19
    :cond_8
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1

    :cond_9
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1

    .line 20
    :cond_a
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1

    .line 21
    :cond_b
    :goto_2
    iget p1, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    .line 22
    aget-object p1, v0, p1

    if-eqz p1, :cond_c

    .line 23
    sget-boolean v2, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    .line 24
    invoke-interface {p1, v1}, Lkotlinx/coroutines/internal/ThreadSafeHeapNode;->setHeap(Lkotlinx/coroutines/internal/ThreadSafeHeap;)V

    .line 25
    invoke-interface {p1, v3}, Lkotlinx/coroutines/internal/ThreadSafeHeapNode;->setIndex(I)V

    .line 26
    iget p0, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->_size:I

    .line 27
    aput-object v1, v0, p0

    return-object p1

    .line 28
    :cond_c
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1

    .line 29
    :cond_d
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1
.end method

.method public final siftUpFrom(I)V
    .locals 4

    :goto_0
    if-gtz p1, :cond_0

    return-void

    .line 1
    :cond_0
    iget-object v0, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->a:[Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    add-int/lit8 v2, p1, -0x1

    .line 2
    div-int/lit8 v2, v2, 0x2

    .line 3
    aget-object v3, v0, v2

    if-eqz v3, :cond_3

    check-cast v3, Ljava/lang/Comparable;

    aget-object v0, v0, p1

    if-eqz v0, :cond_2

    invoke-interface {v3, v0}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-gtz v0, :cond_1

    return-void

    .line 4
    :cond_1
    invoke-virtual {p0, p1, v2}, Lkotlinx/coroutines/internal/ThreadSafeHeap;->swap(II)V

    move p1, v2

    goto :goto_0

    .line 5
    :cond_2
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1

    :cond_3
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1

    .line 6
    :cond_4
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v1
.end method

.method public final swap(II)V
    .locals 3

    .line 1
    iget-object p0, p0, Lkotlinx/coroutines/internal/ThreadSafeHeap;->a:[Lkotlinx/coroutines/internal/ThreadSafeHeapNode;

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    .line 2
    aget-object v1, p0, p2

    if-eqz v1, :cond_1

    .line 3
    aget-object v2, p0, p1

    if-eqz v2, :cond_0

    .line 4
    aput-object v1, p0, p1

    .line 5
    aput-object v2, p0, p2

    .line 6
    invoke-interface {v1, p1}, Lkotlinx/coroutines/internal/ThreadSafeHeapNode;->setIndex(I)V

    .line 7
    invoke-interface {v2, p2}, Lkotlinx/coroutines/internal/ThreadSafeHeapNode;->setIndex(I)V

    return-void

    .line 8
    :cond_0
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v0

    .line 9
    :cond_1
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v0

    .line 10
    :cond_2
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    throw v0
.end method
