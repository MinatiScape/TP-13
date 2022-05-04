.class public final Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;
.super Lcom/google/android/gms/common/internal/BaseGmsClient$zza;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "zzg"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/BaseGmsClient$zza;"
    }
.end annotation


# instance fields
.field public final zza:Landroid/os/IBinder;

.field public final synthetic zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 2
    invoke-direct {p0, p1, p2, p4}, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/Bundle;)V

    .line 3
    iput-object p3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zza:Landroid/os/IBinder;

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzu:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    if-eqz v0, :cond_0

    .line 3
    check-cast v0, Lcom/google/android/gms/common/internal/zzn;

    .line 4
    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzn;->zza:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method public final zza()Z
    .locals 6

    const-string v0, "GmsClient"

    const/4 v1, 0x0

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zza:Landroid/os/IBinder;

    invoke-interface {v2}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    iget-object v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {v3}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getServiceDescriptor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 8
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getServiceDescriptor()Ljava/lang/String;

    move-result-object p0

    const/16 v3, 0x22

    invoke-static {p0, v3}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v2, v3}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "service descriptor mismatch: "

    const-string v5, " vs. "

    invoke-static {v3, v4, p0, v5, v2}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zza:Landroid/os/IBinder;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Landroid/os/IBinder;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 10
    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v3, 0x2

    const/4 v4, 0x4

    invoke-static {v2, v3, v4, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;IILandroid/os/IInterface;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v3, 0x3

    .line 11
    invoke-static {v2, v3, v4, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;IILandroid/os/IInterface;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 12
    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzb:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzx:Lcom/google/android/gms/common/ConnectionResult;

    .line 14
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzt:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    if-eqz p0, :cond_2

    .line 15
    check-cast p0, Lcom/google/android/gms/common/internal/zzm;

    .line 16
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzm;->zza:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    invoke-interface {p0, v0}, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;->onConnected(Landroid/os/Bundle;)V

    :cond_2
    const/4 p0, 0x1

    return p0

    :cond_3
    return v1

    :catch_0
    const-string p0, "service probably died"

    .line 17
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method
