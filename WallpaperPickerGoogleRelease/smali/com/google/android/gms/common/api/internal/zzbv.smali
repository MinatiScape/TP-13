.class public final Lcom/google/android/gms/common/api/internal/zzbv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/zzde;
.implements Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/common/api/internal/zzbn;

.field public final zzb:Lcom/google/android/gms/common/api/Api$Client;

.field public final zzc:Lcom/google/android/gms/common/api/internal/zzi;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "*>;"
        }
    .end annotation
.end field

.field public zzd:Lcom/google/android/gms/common/internal/IAccountAccessor;

.field public zze:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field

.field public zzf:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzbn;Lcom/google/android/gms/common/api/Api$Client;Lcom/google/android/gms/common/api/internal/zzi;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Api$Client;",
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zzd:Lcom/google/android/gms/common/internal/IAccountAccessor;

    .line 3
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zze:Ljava/util/Set;

    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zzf:Z

    .line 5
    iput-object p2, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zzb:Lcom/google/android/gms/common/api/Api$Client;

    .line 6
    iput-object p3, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zzc:Lcom/google/android/gms/common/api/internal/zzi;

    return-void
.end method


# virtual methods
.method public final onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 3
    new-instance v1, Lcom/google/android/gms/common/api/internal/zzbw;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/common/api/internal/zzbw;-><init>(Lcom/google/android/gms/common/api/internal/zzbv;Lcom/google/android/gms/common/ConnectionResult;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final zza(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    .line 3
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbv;->zzc:Lcom/google/android/gms/common/api/internal/zzi;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/common/api/internal/zzbp;

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 5
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 6
    invoke-static {v0}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    .line 8
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzbp;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method
