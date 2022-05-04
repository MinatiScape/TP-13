.class public Lkotlin/jvm/internal/TypeIntrinsics;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static beforeCheckcastToFunctionOfArity(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1
    instance-of v2, p0, Lkotlin/jvm/internal/FunctionBase;

    if-eqz v2, :cond_0

    .line 2
    move-object v2, p0

    check-cast v2, Lkotlin/jvm/internal/FunctionBase;

    invoke-interface {v2}, Lkotlin/jvm/internal/FunctionBase;->getArity()I

    move-result v2

    goto :goto_0

    .line 3
    :cond_0
    instance-of v2, p0, Lkotlin/jvm/functions/Function0;

    if-eqz v2, :cond_1

    move v2, v1

    goto :goto_0

    .line 4
    :cond_1
    instance-of v2, p0, Lkotlin/jvm/functions/Function1;

    if-eqz v2, :cond_2

    move v2, v0

    goto :goto_0

    :cond_2
    const/4 v2, 0x2

    :goto_0
    if-ne v2, p1, :cond_3

    goto :goto_1

    :cond_3
    move v0, v1

    :goto_1
    if-eqz v0, :cond_4

    return-object p0

    :cond_4
    const-string v0, "kotlin.jvm.functions.Function"

    .line 5
    invoke-static {v0, p1}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, " cannot be cast to "

    .line 7
    invoke-static {p0, v0, p1}, Landroidx/concurrent/futures/AbstractResolvableFuture$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 8
    new-instance p1, Ljava/lang/ClassCastException;

    invoke-direct {p1, p0}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    .line 9
    const-class p0, Lkotlin/jvm/internal/TypeIntrinsics;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->sanitizeStackTrace(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/Throwable;

    .line 10
    throw p1
.end method
