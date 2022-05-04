.class public final enum Lkotlinx/coroutines/CoroutineStart;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lkotlinx/coroutines/CoroutineStart;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lkotlinx/coroutines/CoroutineStart;

.field public static final enum DEFAULT:Lkotlinx/coroutines/CoroutineStart;

.field public static final enum LAZY:Lkotlinx/coroutines/CoroutineStart;


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x4

    new-array v0, v0, [Lkotlinx/coroutines/CoroutineStart;

    new-instance v1, Lkotlinx/coroutines/CoroutineStart;

    const-string v2, "DEFAULT"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lkotlinx/coroutines/CoroutineStart;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lkotlinx/coroutines/CoroutineStart;->DEFAULT:Lkotlinx/coroutines/CoroutineStart;

    aput-object v1, v0, v3

    new-instance v1, Lkotlinx/coroutines/CoroutineStart;

    const-string v2, "LAZY"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lkotlinx/coroutines/CoroutineStart;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lkotlinx/coroutines/CoroutineStart;->LAZY:Lkotlinx/coroutines/CoroutineStart;

    aput-object v1, v0, v3

    new-instance v1, Lkotlinx/coroutines/CoroutineStart;

    const-string v2, "ATOMIC"

    const/4 v3, 0x2

    invoke-direct {v1, v2, v3}, Lkotlinx/coroutines/CoroutineStart;-><init>(Ljava/lang/String;I)V

    aput-object v1, v0, v3

    new-instance v1, Lkotlinx/coroutines/CoroutineStart;

    const-string v2, "UNDISPATCHED"

    const/4 v3, 0x3

    invoke-direct {v1, v2, v3}, Lkotlinx/coroutines/CoroutineStart;-><init>(Ljava/lang/String;I)V

    aput-object v1, v0, v3

    sput-object v0, Lkotlinx/coroutines/CoroutineStart;->$VALUES:[Lkotlinx/coroutines/CoroutineStart;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lkotlinx/coroutines/CoroutineStart;
    .locals 1

    const-class v0, Lkotlinx/coroutines/CoroutineStart;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkotlinx/coroutines/CoroutineStart;

    return-object p0
.end method

.method public static values()[Lkotlinx/coroutines/CoroutineStart;
    .locals 1

    sget-object v0, Lkotlinx/coroutines/CoroutineStart;->$VALUES:[Lkotlinx/coroutines/CoroutineStart;

    invoke-virtual {v0}, [Lkotlinx/coroutines/CoroutineStart;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkotlinx/coroutines/CoroutineStart;

    return-object v0
.end method
