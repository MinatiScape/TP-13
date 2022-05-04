.class public abstract Lcom/google/android/gms/common/api/internal/zzn;
.super Lcom/google/android/gms/common/api/internal/BasePendingResult;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R::",
        "Lcom/google/android/gms/common/api/Result;",
        "A::",
        "Lcom/google/android/gms/common/api/Api$zzb;",
        ">",
        "Lcom/google/android/gms/common/api/internal/BasePendingResult<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final zza:Lcom/google/android/gms/common/api/Api$zzc;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zzc<",
            "TA;>;"
        }
    .end annotation
.end field

.field public final zzb:Lcom/google/android/gms/common/api/Api;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Api<",
            "*>;",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ")V"
        }
    .end annotation

    const-string v0, "GoogleApiClient must not be null"

    .line 1
    invoke-static {p2, v0}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p2, Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-direct {p0, p2}, Lcom/google/android/gms/common/api/internal/BasePendingResult;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    const-string p2, "Api must not be null"

    .line 2
    invoke-static {p1, p2}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Api;->zzc()Lcom/google/android/gms/common/api/Api$zzc;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/gms/common/api/internal/zzn;->zza:Lcom/google/android/gms/common/api/Api$zzc;

    .line 4
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzn;->zzb:Lcom/google/android/gms/common/api/Api;

    return-void
.end method


# virtual methods
.method public abstract zza(Lcom/google/android/gms/common/api/Api$zzb;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public final zzb(Lcom/google/android/gms/common/api/Api$zzb;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/DeadObjectException;
        }
    .end annotation

    const/4 v0, 0x0

    const/16 v1, 0x8

    const/4 v2, 0x1

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzn;->zza(Lcom/google/android/gms/common/api/Api$zzb;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 2
    new-instance v3, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p1}, Landroid/os/RemoteException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    .line 3
    invoke-direct {v3, v2, v1, p1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(IILjava/lang/String;Landroid/app/PendingIntent;)V

    .line 4
    invoke-virtual {p0, v3}, Lcom/google/android/gms/common/api/internal/zzn;->zzc(Lcom/google/android/gms/common/api/Status;)V

    return-void

    :catch_1
    move-exception p1

    .line 5
    new-instance v3, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p1}, Landroid/os/RemoteException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    .line 6
    invoke-direct {v3, v2, v1, v4, v0}, Lcom/google/android/gms/common/api/Status;-><init>(IILjava/lang/String;Landroid/app/PendingIntent;)V

    .line 7
    invoke-virtual {p0, v3}, Lcom/google/android/gms/common/api/internal/zzn;->zzc(Lcom/google/android/gms/common/api/Status;)V

    .line 8
    throw p1
.end method

.method public final zzc(Lcom/google/android/gms/common/api/Status;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Failed result must not be success"

    invoke-static {v0, v1}, Landroidx/preference/R$string;->zzb(ZLjava/lang/Object;)V

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;

    move-result-object p1

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zza(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method
