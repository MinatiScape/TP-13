.class public final Lcom/google/android/gms/common/api/internal/zzcu;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final zza:Lcom/google/android/gms/common/api/internal/zzb;

.field public final zzb:I

.field public final zzc:Lcom/google/android/gms/common/api/GoogleApi;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/GoogleApi<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzb;ILcom/google/android/gms/common/api/GoogleApi;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/zzb;",
            "I",
            "Lcom/google/android/gms/common/api/GoogleApi<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzcu;->zza:Lcom/google/android/gms/common/api/internal/zzb;

    .line 3
    iput p2, p0, Lcom/google/android/gms/common/api/internal/zzcu;->zzb:I

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/common/api/internal/zzcu;->zzc:Lcom/google/android/gms/common/api/GoogleApi;

    return-void
.end method
