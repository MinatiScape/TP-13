.class public final Lkotlinx/coroutines/internal/LockFreeTaskQueueCore$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlinx/coroutines/internal/LockFreeTaskQueueCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final updateHead(JI)J
    .locals 2

    const-wide/32 v0, -0x40000000

    and-long p0, p1, v0

    int-to-long p2, p3

    const/4 v0, 0x0

    shl-long/2addr p2, v0

    or-long/2addr p0, p2

    return-wide p0
.end method
