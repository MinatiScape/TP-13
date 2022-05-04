.class public final Lcom/google/android/gms/common/api/internal/zzd;
.super Lcom/google/android/gms/common/api/internal/zzb;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Lcom/google/android/gms/common/api/internal/zzn<",
        "+",
        "Lcom/google/android/gms/common/api/Result;",
        "Lcom/google/android/gms/common/api/Api$zzb;",
        ">;>",
        "Lcom/google/android/gms/common/api/internal/zzb;"
    }
.end annotation


# instance fields
.field public final zza:Lcom/google/android/gms/common/api/internal/zzn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TA;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILcom/google/android/gms/common/api/internal/zzn;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITA;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/internal/zzb;-><init>(I)V

    .line 2
    iput-object p2, p0, Lcom/google/android/gms/common/api/internal/zzd;->zza:Lcom/google/android/gms/common/api/internal/zzn;

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/common/api/Status;)V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzd;->zza:Lcom/google/android/gms/common/api/internal/zzn;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzn;->zzc(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/common/api/internal/zzaf;Z)V
    .locals 1

    .line 8
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzd;->zza:Lcom/google/android/gms/common/api/internal/zzn;

    .line 9
    iget-object v0, p1, Lcom/google/android/gms/common/api/internal/zzaf;->zza:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-interface {v0, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    new-instance p2, Lcom/google/android/gms/common/api/internal/zzag;

    invoke-direct {p2, p1, p0}, Lcom/google/android/gms/common/api/internal/zzag;-><init>(Lcom/google/android/gms/common/api/internal/zzaf;Lcom/google/android/gms/common/api/internal/BasePendingResult;)V

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    const-string v0, "Callback cannot be null."

    .line 11
    invoke-static {p1, v0}, Landroidx/preference/R$string;->zzb(ZLjava/lang/Object;)V

    .line 12
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zza:Ljava/lang/Object;

    monitor-enter p1

    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zze()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 14
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zzj:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p2, p0}, Lcom/google/android/gms/common/api/internal/zzag;->zza(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zzf:Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    :goto_0
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final zza(Lcom/google/android/gms/common/api/internal/zzbp;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/zzbp<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/DeadObjectException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzd;->zza:Lcom/google/android/gms/common/api/internal/zzn;

    .line 2
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/api/internal/zzn;->zzb(Lcom/google/android/gms/common/api/Api$zzb;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 4
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0xa

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/RuntimeException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x2

    invoke-static {p1, v3}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v3

    const-string v4, ": "

    invoke-static {v3, v2, v4, p1}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 6
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzd;->zza:Lcom/google/android/gms/common/api/internal/zzn;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/internal/zzn;->zzc(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method
