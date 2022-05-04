.class public final Lcom/google/android/gms/clearcut/internal/zzg;
.super Lcom/google/android/gms/common/api/internal/zzn;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/api/internal/zzn<",
        "Lcom/google/android/gms/common/api/Status;",
        "Lcom/google/android/gms/clearcut/internal/zzi;",
        ">;"
    }
.end annotation


# instance fields
.field public final zza:Lcom/google/android/gms/clearcut/LogEventParcelable;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/clearcut/LogEventParcelable;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/clearcut/ClearcutLogger;->API:Lcom/google/android/gms/common/api/Api;

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/common/api/internal/zzn;-><init>(Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/clearcut/internal/zzg;->zza:Lcom/google/android/gms/clearcut/LogEventParcelable;

    return-void
.end method


# virtual methods
.method public final synthetic zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 0

    return-object p1
.end method

.method public final zza(Lcom/google/android/gms/common/api/Api$zzb;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/clearcut/internal/zzi;

    .line 2
    new-instance v0, Lcom/google/android/gms/clearcut/internal/zzh;

    invoke-direct {v0, p0}, Lcom/google/android/gms/clearcut/internal/zzh;-><init>(Lcom/google/android/gms/clearcut/internal/zzg;)V

    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/zzg;->zza:Lcom/google/android/gms/clearcut/LogEventParcelable;

    .line 4
    iget-object v2, v1, Lcom/google/android/gms/clearcut/LogEventParcelable;->extensionProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    if-eqz v2, :cond_0

    iget-object v3, v1, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEvent:Lcom/google/android/gms/internal/zzgsv;

    iget-object v4, v3, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    array-length v4, v4

    if-nez v4, :cond_0

    .line 5
    check-cast v2, Lcom/google/android/gms/clearcut/Counters$zzb;

    .line 6
    invoke-virtual {v2}, Lcom/google/android/gms/clearcut/Counters$zzb;->zza()Lcom/google/android/gms/internal/zzgta;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgrz;->toByteArray(Lcom/google/android/gms/internal/zzgrz;)[B

    move-result-object v2

    .line 7
    iput-object v2, v3, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    .line 8
    :cond_0
    iget-object v2, v1, Lcom/google/android/gms/clearcut/LogEventParcelable;->clientVisualElementsProducer:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    if-eqz v2, :cond_1

    iget-object v3, v1, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEvent:Lcom/google/android/gms/internal/zzgsv;

    iget-object v4, v3, Lcom/google/android/gms/internal/zzgsv;->zzh:[B

    array-length v4, v4

    if-nez v4, :cond_1

    .line 9
    check-cast v2, Lcom/google/android/gms/clearcut/Counters$zzb;

    .line 10
    invoke-virtual {v2}, Lcom/google/android/gms/clearcut/Counters$zzb;->zza()Lcom/google/android/gms/internal/zzgta;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgrz;->toByteArray(Lcom/google/android/gms/internal/zzgrz;)[B

    move-result-object v2

    .line 11
    iput-object v2, v3, Lcom/google/android/gms/internal/zzgsv;->zzh:[B

    .line 12
    :cond_1
    iget-object v2, v1, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEvent:Lcom/google/android/gms/internal/zzgsv;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgrz;->toByteArray(Lcom/google/android/gms/internal/zzgrz;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/google/android/gms/clearcut/LogEventParcelable;->logEventBytes:[B
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzag()Landroid/os/IInterface;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/clearcut/internal/zzq;

    iget-object p0, p0, Lcom/google/android/gms/clearcut/internal/zzg;->zza:Lcom/google/android/gms/clearcut/LogEventParcelable;

    invoke-interface {p1, v0, p0}, Lcom/google/android/gms/clearcut/internal/zzq;->zza(Lcom/google/android/gms/clearcut/internal/zzo;Lcom/google/android/gms/clearcut/LogEventParcelable;)V

    return-void

    :catch_0
    move-exception p1

    const-string v0, "ClearcutLoggerApiImpl"

    const-string v1, "derived ClearcutLogger.MessageProducer "

    .line 14
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v0, 0xa

    const-string v1, "MessageProducer"

    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzn;->zzc(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method
