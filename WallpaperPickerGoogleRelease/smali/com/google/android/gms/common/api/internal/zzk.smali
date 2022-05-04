.class public final Lcom/google/android/gms/common/api/internal/zzk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final zza:Landroidx/collection/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArrayMap<",
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "*>;",
            "Lcom/google/android/gms/common/ConnectionResult;",
            ">;"
        }
    .end annotation
.end field

.field public final zzb:Landroidx/collection/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/ArrayMap<",
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "*>;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzc:Lcom/google/android/gms/tasks/TaskCompletionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "*>;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public zzd:I

.field public zze:Z


# virtual methods
.method public final zza(Lcom/google/android/gms/common/api/internal/zzi;Lcom/google/android/gms/common/ConnectionResult;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "*>;",
            "Lcom/google/android/gms/common/ConnectionResult;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzk;->zza:Landroidx/collection/ArrayMap;

    invoke-virtual {v0, p1, p2}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzk;->zzb:Landroidx/collection/ArrayMap;

    invoke-virtual {v0, p1, p3}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget p1, p0, Lcom/google/android/gms/common/api/internal/zzk;->zzd:I

    const/4 p3, 0x1

    sub-int/2addr p1, p3

    iput p1, p0, Lcom/google/android/gms/common/api/internal/zzk;->zzd:I

    .line 4
    invoke-virtual {p2}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result p1

    if-nez p1, :cond_0

    .line 5
    iput-boolean p3, p0, Lcom/google/android/gms/common/api/internal/zzk;->zze:Z

    .line 6
    :cond_0
    iget p1, p0, Lcom/google/android/gms/common/api/internal/zzk;->zzd:I

    if-nez p1, :cond_2

    .line 7
    iget-boolean p1, p0, Lcom/google/android/gms/common/api/internal/zzk;->zze:Z

    if-eqz p1, :cond_1

    .line 8
    new-instance p1, Lcom/google/android/gms/common/api/AvailabilityException;

    iget-object p2, p0, Lcom/google/android/gms/common/api/internal/zzk;->zza:Landroidx/collection/ArrayMap;

    invoke-direct {p1, p2}, Lcom/google/android/gms/common/api/AvailabilityException;-><init>(Landroidx/collection/ArrayMap;)V

    .line 9
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzk;->zzc:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    return-void

    .line 10
    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzk;->zzc:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzk;->zzb:Landroidx/collection/ArrayMap;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method
