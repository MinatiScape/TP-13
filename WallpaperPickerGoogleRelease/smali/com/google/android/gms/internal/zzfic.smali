.class public final Lcom/google/android/gms/internal/zzfic;
.super Landroid/database/ContentObserver;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public final onChange(Z)V
    .locals 0

    .line 1
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zze:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method
