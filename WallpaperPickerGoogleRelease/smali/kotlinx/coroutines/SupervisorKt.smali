.class public final Lkotlinx/coroutines/SupervisorKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSupervisor.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Supervisor.kt\nkotlinx/coroutines/SupervisorKt\n*L\n1#1,66:1\n*E\n"
.end annotation


# direct methods
.method public static SupervisorJob$default(Lkotlinx/coroutines/Job;I)Lkotlinx/coroutines/CompletableJob;
    .locals 0

    const/4 p0, 0x0

    .line 1
    new-instance p1, Lkotlinx/coroutines/SupervisorJobImpl;

    invoke-direct {p1, p0}, Lkotlinx/coroutines/SupervisorJobImpl;-><init>(Lkotlinx/coroutines/Job;)V

    return-object p1
.end method
