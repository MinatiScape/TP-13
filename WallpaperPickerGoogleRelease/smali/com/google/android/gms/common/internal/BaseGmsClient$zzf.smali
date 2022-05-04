.class public final Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "zzf"
.end annotation


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/common/internal/BaseGmsClient;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 p1, 0x0

    move-object v0, p0

    check-cast v0, Lcom/google/android/gms/common/internal/zzl;

    .line 3
    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzl;->zzd:Ljava/util/Set;

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getRemoteService(Lcom/google/android/gms/common/internal/IAccountAccessor;Ljava/util/Set;)V

    return-void

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 6
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzu:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    if-eqz p0, :cond_1

    .line 7
    check-cast p0, Lcom/google/android/gms/common/internal/zzn;

    .line 8
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzn;->zza:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    invoke-interface {p0, p1}, Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    :cond_1
    return-void
.end method
