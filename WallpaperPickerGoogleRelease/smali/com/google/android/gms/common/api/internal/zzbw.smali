.class public final Lcom/google/android/gms/common/api/internal/zzbw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/common/ConnectionResult;

.field public final synthetic zzb:Lcom/google/android/gms/common/api/internal/zzbv;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzbv;Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbw;->zzb:Lcom/google/android/gms/common/api/internal/zzbv;

    iput-object p2, p0, Lcom/google/android/gms/common/api/internal/zzbw;->zza:Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbw;->zza:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbw;->zzb:Lcom/google/android/gms/common/api/internal/zzbv;

    const/4 v1, 0x1

    .line 3
    iput-boolean v1, v0, Lcom/google/android/gms/common/api/internal/zzbv;->zzf:Z

    .line 4
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbv;->zzb:Lcom/google/android/gms/common/api/Api$Client;

    .line 5
    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$Client;->requiresSignIn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 6
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbw;->zzb:Lcom/google/android/gms/common/api/internal/zzbv;

    .line 7
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zzf:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zzd:Lcom/google/android/gms/common/internal/IAccountAccessor;

    if-eqz v0, :cond_0

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zzb:Lcom/google/android/gms/common/api/Api$Client;

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zze:Ljava/util/Set;

    invoke-interface {v1, v0, p0}, Lcom/google/android/gms/common/api/Api$Client;->getRemoteService(Lcom/google/android/gms/common/internal/IAccountAccessor;Ljava/util/Set;)V

    :cond_0
    return-void

    .line 9
    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbw;->zzb:Lcom/google/android/gms/common/api/internal/zzbv;

    .line 10
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zzb:Lcom/google/android/gms/common/api/Api$Client;

    const/4 v0, 0x0

    .line 11
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v1

    .line 12
    invoke-interface {p0, v0, v1}, Lcom/google/android/gms/common/api/Api$Client;->getRemoteService(Lcom/google/android/gms/common/internal/IAccountAccessor;Ljava/util/Set;)V

    return-void

    .line 13
    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbw;->zzb:Lcom/google/android/gms/common/api/internal/zzbv;

    iget-object v1, v0, Lcom/google/android/gms/common/api/internal/zzbv;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 14
    iget-object v1, v1, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    .line 15
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbv;->zzc:Lcom/google/android/gms/common/api/internal/zzi;

    .line 16
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/internal/zzbp;

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbw;->zza:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/api/internal/zzbp;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method
