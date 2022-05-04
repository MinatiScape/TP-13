.class public final Lcom/google/android/gms/common/api/internal/zzbp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<O::",
        "Lcom/google/android/gms/common/api/Api$ApiOptions;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;",
        "Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;"
    }
.end annotation


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/common/api/internal/zzbn;

.field public final zzb:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/google/android/gms/common/api/internal/zzb;",
            ">;"
        }
    .end annotation
.end field

.field public final zzc:Lcom/google/android/gms/common/api/Api$Client;

.field public final zzd:Lcom/google/android/gms/common/api/Api$zzb;

.field public final zze:Lcom/google/android/gms/common/api/internal/zzi;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "TO;>;"
        }
    .end annotation
.end field

.field public final zzf:Lcom/google/android/gms/common/api/internal/zzaf;

.field public final zzg:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/internal/zzk;",
            ">;"
        }
    .end annotation
.end field

.field public final zzh:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/internal/zzcl<",
            "*>;",
            "Lcom/google/android/gms/common/api/internal/zzcw;",
            ">;"
        }
    .end annotation
.end field

.field public final zzi:I

.field public final zzj:Lcom/google/android/gms/common/api/internal/zzdb;

.field public zzk:Z

.field public zzm:Lcom/google/android/gms/common/ConnectionResult;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzbn;Lcom/google/android/gms/common/api/GoogleApi;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApi<",
            "TO;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzb:Ljava/util/Queue;

    .line 3
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzg:Ljava/util/Set;

    .line 4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzh:Ljava/util/Map;

    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzm:Lcom/google/android/gms/common/ConnectionResult;

    .line 6
    iget-object v1, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 7
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {p2, v1, p0}, Lcom/google/android/gms/common/api/GoogleApi;->zza(Landroid/os/Looper;Lcom/google/android/gms/common/api/internal/zzbp;)Lcom/google/android/gms/common/api/Api$Client;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    .line 8
    iput-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzd:Lcom/google/android/gms/common/api/Api$zzb;

    .line 9
    iget-object v2, p2, Lcom/google/android/gms/common/api/GoogleApi;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    .line 10
    iput-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    .line 11
    new-instance v2, Lcom/google/android/gms/common/api/internal/zzaf;

    invoke-direct {v2}, Lcom/google/android/gms/common/api/internal/zzaf;-><init>()V

    iput-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzf:Lcom/google/android/gms/common/api/internal/zzaf;

    .line 12
    iget v2, p2, Lcom/google/android/gms/common/api/GoogleApi;->zzg:I

    .line 13
    iput v2, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzi:I

    .line 14
    invoke-interface {v1}, Lcom/google/android/gms/common/api/Api$Client;->requiresSignIn()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 15
    iget-object v0, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzh:Landroid/content/Context;

    .line 16
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 17
    invoke-virtual {p2, v0, p1}, Lcom/google/android/gms/common/api/GoogleApi;->zza(Landroid/content/Context;Landroid/os/Handler;)Lcom/google/android/gms/common/api/internal/zzdb;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzj:Lcom/google/android/gms/common/api/internal/zzdb;

    return-void

    .line 18
    :cond_0
    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzj:Lcom/google/android/gms/common/api/internal/zzdb;

    return-void
.end method


# virtual methods
.method public final onConnected(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 3
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzn()V

    return-void

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 6
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 7
    new-instance v0, Lcom/google/android/gms/common/api/internal/zzbq;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/common/api/internal/zzbq;-><init>(Lcom/google/android/gms/common/api/internal/zzbp;I)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 3
    invoke-static {v0}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzj:Lcom/google/android/gms/common/api/internal/zzdb;

    if-eqz v0, :cond_0

    .line 5
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzdb;->zzg:Lcom/google/android/gms/signin/zzd;

    if-eqz v0, :cond_0

    .line 6
    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzd()V

    .line 8
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 9
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzj:Lcom/google/android/gms/common/internal/zzv;

    .line 10
    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzv;->zza:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzbp;->zzb(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 12
    iget v0, p1, Lcom/google/android/gms/common/ConnectionResult;->zzc:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 13
    sget-object p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzb:Lcom/google/android/gms/common/api/Status;

    .line 14
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzbp;->zza(Lcom/google/android/gms/common/api/Status;)V

    return-void

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzb:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 16
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzm:Lcom/google/android/gms/common/ConnectionResult;

    return-void

    .line 17
    :cond_2
    sget-object v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzf:Ljava/lang/Object;

    .line 18
    monitor-enter v0

    .line 19
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 20
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    iget v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzi:I

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/common/api/internal/zzbn;->zza(Lcom/google/android/gms/common/ConnectionResult;I)Z

    move-result v0

    if-nez v0, :cond_5

    .line 23
    iget p1, p1, Lcom/google/android/gms/common/ConnectionResult;->zzc:I

    const/16 v0, 0x12

    if-ne p1, v0, :cond_3

    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzk:Z

    .line 25
    :cond_3
    iget-boolean p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzk:Z

    if-eqz p1, :cond_4

    .line 26
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 27
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    const/16 v0, 0x9

    .line 28
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    invoke-static {p1, v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 29
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-wide/16 v1, 0x1388

    .line 30
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void

    .line 31
    :cond_4
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0x11

    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    .line 32
    iget-object v1, v1, Lcom/google/android/gms/common/api/internal/zzi;->zzc:Lcom/google/android/gms/common/api/Api;

    .line 33
    iget-object v1, v1, Lcom/google/android/gms/common/api/Api;->zze:Ljava/lang/String;

    const/16 v2, 0x26

    .line 34
    invoke-static {v1, v2}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "API: "

    const-string v4, " is not available on this device."

    invoke-static {v2, v3, v1, v4}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 35
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzbp;->zza(Lcom/google/android/gms/common/api/Status;)V

    :cond_5
    return-void

    :catchall_0
    move-exception p0

    .line 36
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final onConnectionSuspended(I)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 3
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzo()V

    return-void

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 6
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 7
    new-instance v0, Lcom/google/android/gms/common/api/internal/zzbq;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/common/api/internal/zzbq;-><init>(Lcom/google/android/gms/common/api/internal/zzbp;I)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final zza()V
    .locals 6

    .line 12
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 13
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 14
    invoke-static {v0}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 15
    sget-object v0, Lcom/google/android/gms/common/api/internal/zzbn;->zza:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/internal/zzbp;->zza(Lcom/google/android/gms/common/api/Status;)V

    .line 16
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzf:Lcom/google/android/gms/common/api/internal/zzaf;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x0

    .line 17
    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/common/api/internal/zzaf;->zza(ZLcom/google/android/gms/common/api/Status;)V

    .line 18
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzh:Ljava/util/Map;

    .line 19
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzh:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    new-array v1, v1, [Lcom/google/android/gms/common/api/internal/zzcl;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/common/api/internal/zzcl;

    .line 20
    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 21
    new-instance v4, Lcom/google/android/gms/common/api/internal/zzg;

    new-instance v5, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v5}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    invoke-direct {v4, v3, v5}, Lcom/google/android/gms/common/api/internal/zzg;-><init>(Lcom/google/android/gms/common/api/internal/zzcl;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-virtual {p0, v4}, Lcom/google/android/gms/common/api/internal/zzbp;->zza(Lcom/google/android/gms/common/api/internal/zzb;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 22
    :cond_0
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/ConnectionResult;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzb(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 23
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$Client;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 24
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    new-instance v1, Lcom/google/android/gms/common/api/internal/zzbt;

    invoke-direct {v1, p0}, Lcom/google/android/gms/common/api/internal/zzbt;-><init>(Lcom/google/android/gms/common/api/internal/zzbp;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/common/api/Api$Client;->onUserSignOut(Lcom/google/android/gms/common/internal/BaseGmsClient$SignOutCallbacks;)V

    :cond_1
    return-void
.end method

.method public final zza(Lcom/google/android/gms/common/api/Status;)V
    .locals 2

    .line 25
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 26
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 27
    invoke-static {v0}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 28
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzb:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/api/internal/zzb;

    .line 29
    invoke-virtual {v1, p1}, Lcom/google/android/gms/common/api/internal/zzb;->zza(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_0

    .line 30
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzb:Ljava/util/Queue;

    invoke-interface {p0}, Ljava/util/Queue;->clear()V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/common/api/internal/zzb;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 3
    invoke-static {v0}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$Client;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzbp;->zzb(Lcom/google/android/gms/common/api/internal/zzb;)V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzq()V

    return-void

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzb:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 8
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzm:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz p1, :cond_1

    .line 9
    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzm:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzbp;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void

    .line 11
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzi()V

    return-void
.end method

.method public final zzb(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 4

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzg:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/api/internal/zzk;

    const/4 v2, 0x0

    .line 6
    sget-object v3, Lcom/google/android/gms/common/ConnectionResult;->zza:Lcom/google/android/gms/common/ConnectionResult;

    if-ne p1, v3, :cond_0

    .line 7
    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {v2}, Lcom/google/android/gms/common/api/Api$Client;->zzab()Ljava/lang/String;

    move-result-object v2

    .line 8
    :cond_0
    iget-object v3, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    invoke-virtual {v1, v3, p1, v2}, Lcom/google/android/gms/common/api/internal/zzk;->zza(Lcom/google/android/gms/common/api/internal/zzi;Lcom/google/android/gms/common/ConnectionResult;Ljava/lang/String;)V

    goto :goto_0

    .line 9
    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzg:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    return-void
.end method

.method public final zzb(Lcom/google/android/gms/common/api/internal/zzb;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzf:Lcom/google/android/gms/common/api/internal/zzaf;

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzk()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/common/api/internal/zzb;->zza(Lcom/google/android/gms/common/api/internal/zzaf;Z)V

    .line 2
    :try_start_0
    invoke-virtual {p1, p0}, Lcom/google/android/gms/common/api/internal/zzb;->zza(Lcom/google/android/gms/common/api/internal/zzbp;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    const/4 p1, 0x1

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzbp;->onConnectionSuspended(I)V

    .line 4
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {p0}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    return-void
.end method

.method public final zzd()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 3
    invoke-static {v0}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzm:Lcom/google/android/gms/common/ConnectionResult;

    return-void
.end method

.method public final zzi()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 3
    invoke-static {v0}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$Client;->isConnected()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$Client;->isConnecting()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 6
    iget-object v1, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzj:Lcom/google/android/gms/common/internal/zzv;

    .line 7
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzh:Landroid/content/Context;

    .line 8
    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/common/internal/zzv;->zza(Landroid/content/Context;Lcom/google/android/gms/common/api/Api$Client;)I

    move-result v0

    if-eqz v0, :cond_1

    .line 9
    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    .line 10
    invoke-virtual {p0, v1}, Lcom/google/android/gms/common/api/internal/zzbp;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void

    .line 11
    :cond_1
    new-instance v0, Lcom/google/android/gms/common/api/internal/zzbv;

    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    iget-object v3, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/api/internal/zzbv;-><init>(Lcom/google/android/gms/common/api/internal/zzbn;Lcom/google/android/gms/common/api/Api$Client;Lcom/google/android/gms/common/api/internal/zzi;)V

    .line 12
    invoke-interface {v2}, Lcom/google/android/gms/common/api/Api$Client;->requiresSignIn()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 13
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzj:Lcom/google/android/gms/common/api/internal/zzdb;

    .line 14
    iget-object v2, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zzg:Lcom/google/android/gms/signin/zzd;

    if-eqz v2, :cond_2

    .line 15
    invoke-interface {v2}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    .line 16
    :cond_2
    iget-object v2, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zzf:Lcom/google/android/gms/common/internal/ClientSettings;

    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 17
    iput-object v3, v2, Lcom/google/android/gms/common/internal/ClientSettings;->zzj:Ljava/lang/Integer;

    .line 18
    iget-object v2, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zzd:Lcom/google/android/gms/common/api/Api$zza;

    iget-object v3, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zzb:Landroid/content/Context;

    iget-object v4, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zzc:Landroid/os/Handler;

    .line 19
    invoke-virtual {v4}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v4

    iget-object v5, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zzf:Lcom/google/android/gms/common/internal/ClientSettings;

    .line 20
    iget-object v6, v5, Lcom/google/android/gms/common/internal/ClientSettings;->zzi:Lcom/google/android/gms/signin/SignInOptions;

    move-object v7, v1

    move-object v8, v1

    .line 21
    invoke-virtual/range {v2 .. v8}, Lcom/google/android/gms/common/api/Api$zza;->zza(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/ClientSettings;Ljava/lang/Object;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/Api$Client;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/signin/zzd;

    iput-object v2, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zzg:Lcom/google/android/gms/signin/zzd;

    .line 22
    iput-object v0, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zzh:Lcom/google/android/gms/common/api/internal/zzde;

    .line 23
    iget-object v2, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zze:Ljava/util/Set;

    if-eqz v2, :cond_4

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_0

    .line 24
    :cond_3
    iget-object v1, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zzg:Lcom/google/android/gms/signin/zzd;

    invoke-interface {v1}, Lcom/google/android/gms/signin/zzd;->zzd()V

    goto :goto_1

    .line 25
    :cond_4
    :goto_0
    iget-object v2, v1, Lcom/google/android/gms/common/api/internal/zzdb;->zzc:Landroid/os/Handler;

    new-instance v3, Lcom/google/android/gms/clearcut/zzo;

    invoke-direct {v3, v1}, Lcom/google/android/gms/clearcut/zzo;-><init>(Lcom/google/android/gms/common/api/internal/zzdb;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 26
    :cond_5
    :goto_1
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {p0, v0}, Lcom/google/android/gms/common/api/Api$Client;->connect(Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;)V

    :cond_6
    :goto_2
    return-void
.end method

.method public final zzk()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {p0}, Lcom/google/android/gms/common/api/Api$Client;->requiresSignIn()Z

    move-result p0

    return p0
.end method

.method public final zzn()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzd()V

    .line 2
    sget-object v0, Lcom/google/android/gms/common/ConnectionResult;->zza:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzb(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzp()V

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzh:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :catch_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/api/internal/zzcw;

    .line 5
    :try_start_0
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v1}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x0

    throw p0

    :catch_1
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/internal/zzbp;->onConnectionSuspended(I)V

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    .line 8
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$Client;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzb:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 9
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzb:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/internal/zzb;

    .line 10
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzb(Lcom/google/android/gms/common/api/internal/zzb;)V

    goto :goto_0

    .line 11
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzq()V

    return-void
.end method

.method public final zzo()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzd()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzk:Z

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzf:Lcom/google/android/gms/common/api/internal/zzaf;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    sget-object v2, Lcom/google/android/gms/common/api/internal/zzdr;->zza:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/common/api/internal/zzaf;->zza(ZLcom/google/android/gms/common/api/Status;)V

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 6
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 7
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    const/16 v2, 0x9

    invoke-static {v0, v2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 8
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-wide/16 v2, 0x1388

    .line 9
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 10
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 11
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 12
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    const/16 v2, 0xb

    invoke-static {v0, v2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 13
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-wide/32 v2, 0x1d4c0

    .line 14
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 15
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 16
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzj:Lcom/google/android/gms/common/internal/zzv;

    .line 17
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzv;->zza:Landroid/util/SparseIntArray;

    invoke-virtual {p0}, Landroid/util/SparseIntArray;->clear()V

    return-void
.end method

.method public final zzp()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzk:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 3
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    const/16 v1, 0xb

    .line 4
    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 6
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    const/16 v1, 0x9

    .line 7
    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzk:Z

    :cond_0
    return-void
.end method

.method public final zzq()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    const/16 v2, 0xc

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 5
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 6
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 7
    iget-wide v2, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zze:J

    .line 8
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method
