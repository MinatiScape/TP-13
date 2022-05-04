.class public final Lkotlinx/coroutines/internal/ThreadContextKt$restoreState$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlinx/coroutines/internal/ThreadContextKt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/internal/ThreadState;",
        "Lkotlin/coroutines/CoroutineContext$Element;",
        "Lkotlinx/coroutines/internal/ThreadState;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lkotlinx/coroutines/internal/ThreadContextKt$restoreState$1;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lkotlinx/coroutines/internal/ThreadContextKt$restoreState$1;

    invoke-direct {v0}, Lkotlinx/coroutines/internal/ThreadContextKt$restoreState$1;-><init>()V

    sput-object v0, Lkotlinx/coroutines/internal/ThreadContextKt$restoreState$1;->INSTANCE:Lkotlinx/coroutines/internal/ThreadContextKt$restoreState$1;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    check-cast p1, Lkotlinx/coroutines/internal/ThreadState;

    check-cast p2, Lkotlin/coroutines/CoroutineContext$Element;

    const-string p0, "state"

    .line 1
    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "element"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    instance-of p0, p2, Lkotlinx/coroutines/ThreadContextElement;

    if-eqz p0, :cond_0

    .line 3
    check-cast p2, Lkotlinx/coroutines/ThreadContextElement;

    .line 4
    iget-object p0, p1, Lkotlinx/coroutines/internal/ThreadState;->context:Lkotlin/coroutines/CoroutineContext;

    .line 5
    iget-object v0, p1, Lkotlinx/coroutines/internal/ThreadState;->a:[Ljava/lang/Object;

    iget v1, p1, Lkotlinx/coroutines/internal/ThreadState;->i:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p1, Lkotlinx/coroutines/internal/ThreadState;->i:I

    aget-object v0, v0, v1

    .line 6
    invoke-interface {p2, p0, v0}, Lkotlinx/coroutines/ThreadContextElement;->restoreThreadContext(Lkotlin/coroutines/CoroutineContext;Ljava/lang/Object;)V

    :cond_0
    return-object p1
.end method
