.class public final Lcom/google/android/gms/common/api/internal/zzg;
.super Lcom/google/android/gms/common/api/internal/zzc;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/api/internal/zzc<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field public final zzb:Lcom/google/android/gms/common/api/internal/zzcl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/zzcl<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzcl;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/zzcl<",
            "*>;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x4

    .line 1
    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/common/api/internal/zzc;-><init>(ILcom/google/android/gms/tasks/TaskCompletionSource;)V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzg;->zzb:Lcom/google/android/gms/common/api/internal/zzcl;

    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Lcom/google/android/gms/common/api/internal/zzaf;Z)V
    .locals 0

    return-void
.end method

.method public final zzb(Lcom/google/android/gms/common/api/internal/zzbp;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/zzbp<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbp;->zzh:Ljava/util/Map;

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzg;->zzb:Lcom/google/android/gms/common/api/internal/zzcl;

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/api/internal/zzcw;

    if-nez p1, :cond_0

    .line 3
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzc;->zza:Lcom/google/android/gms/tasks/TaskCompletionSource;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->trySetResult(Ljava/lang/Object;)Z

    return-void

    :cond_0
    const/4 p0, 0x0

    .line 4
    throw p0
.end method
