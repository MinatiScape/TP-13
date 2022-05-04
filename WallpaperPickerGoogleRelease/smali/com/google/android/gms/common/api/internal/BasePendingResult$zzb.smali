.class public final Lcom/google/android/gms/common/api/internal/BasePendingResult$zzb;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/internal/BasePendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "zzb"
.end annotation


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/common/api/internal/BasePendingResult;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/BasePendingResult;Lcom/google/android/gms/common/api/internal/zzt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult$zzb;->zza:Lcom/google/android/gms/common/api/internal/BasePendingResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult$zzb;->zza:Lcom/google/android/gms/common/api/internal/BasePendingResult;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zzi:Lcom/google/android/gms/common/api/Result;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zzb(Lcom/google/android/gms/common/api/Result;)V

    .line 4
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
