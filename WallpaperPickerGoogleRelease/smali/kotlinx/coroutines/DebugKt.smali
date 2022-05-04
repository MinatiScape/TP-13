.class public final Lkotlinx/coroutines/DebugKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDebug.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Debug.kt\nkotlinx/coroutines/DebugKt\n*L\n1#1,123:1\n*E\n"
.end annotation


# static fields
.field public static final COROUTINE_ID:Ljava/util/concurrent/atomic/AtomicLong;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final DEBUG:Z

.field public static final RECOVER_STACK_TRACES:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 5

    const-string v0, "kotlinx.coroutines.debug"

    .line 1
    invoke-static {v0}, Lkotlinx/coroutines/internal/SystemPropsKt;->systemProp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    if-eqz v3, :cond_3

    const/16 v4, 0xddf

    if-eq v3, v4, :cond_2

    const v4, 0x1ad6f

    if-eq v3, v4, :cond_1

    const v4, 0x2dddaf

    if-ne v3, v4, :cond_6

    const-string v3, "auto"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_0

    :cond_1
    const-string v3, "off"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    :goto_0
    move v0, v2

    goto :goto_2

    :cond_2
    const-string v3, "on"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_1

    :cond_3
    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    :goto_1
    move v0, v1

    .line 3
    :goto_2
    sput-boolean v0, Lkotlinx/coroutines/DebugKt;->DEBUG:Z

    if-eqz v0, :cond_5

    const-string v0, "kotlinx.coroutines.stacktrace.recovery"

    .line 4
    invoke-static {v0}, Lkotlinx/coroutines/internal/SystemPropsKt;->systemProp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    goto :goto_3

    :cond_4
    move v0, v1

    :goto_3
    if-eqz v0, :cond_5

    goto :goto_4

    :cond_5
    move v1, v2

    .line 5
    :goto_4
    sput-boolean v1, Lkotlinx/coroutines/DebugKt;->RECOVER_STACK_TRACES:Z

    .line 6
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    sput-object v0, Lkotlinx/coroutines/DebugKt;->COROUTINE_ID:Ljava/util/concurrent/atomic/AtomicLong;

    return-void

    .line 7
    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "System property \'kotlinx.coroutines.debug\' has unrecognized value \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x27

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
