.class public final Lcom/google/android/gms/common/api/internal/zzag;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/PendingResult$zza;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/common/api/internal/BasePendingResult;

.field public final synthetic zzb:Lcom/google/android/gms/common/api/internal/zzaf;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzaf;Lcom/google/android/gms/common/api/internal/BasePendingResult;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzag;->zzb:Lcom/google/android/gms/common/api/internal/zzaf;

    iput-object p2, p0, Lcom/google/android/gms/common/api/internal/zzag;->zza:Lcom/google/android/gms/common/api/internal/BasePendingResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/common/api/Status;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzag;->zzb:Lcom/google/android/gms/common/api/internal/zzaf;

    .line 2
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzaf;->zza:Ljava/util/Map;

    .line 3
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzag;->zza:Lcom/google/android/gms/common/api/internal/BasePendingResult;

    invoke-interface {p1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
