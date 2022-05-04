.class public final Lcom/google/android/gms/common/api/internal/zzbx;
.super Lcom/google/android/gms/common/api/internal/zzal;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<O::",
        "Lcom/google/android/gms/common/api/Api$ApiOptions;",
        ">",
        "Lcom/google/android/gms/common/api/internal/zzal;"
    }
.end annotation


# instance fields
.field public final zza:Lcom/google/android/gms/common/api/GoogleApi;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/GoogleApi<",
            "TO;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/GoogleApi;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApi<",
            "TO;>;)V"
        }
    .end annotation

    const-string v0, "Method is not supported by connectionless client. APIs supporting connectionless client must not call this method."

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/internal/zzal;-><init>(Ljava/lang/String;)V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbx;->zza:Lcom/google/android/gms/common/api/GoogleApi;

    return-void
.end method


# virtual methods
.method public final zzc()Landroid/os/Looper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbx;->zza:Lcom/google/android/gms/common/api/GoogleApi;

    .line 2
    iget-object p0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzf:Landroid/os/Looper;

    return-object p0
.end method
