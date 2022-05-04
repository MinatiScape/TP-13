.class public final Lcom/google/android/gms/clearcut/internal/zzi;
.super Lcom/google/android/gms/common/internal/zzl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/zzl<",
        "Lcom/google/android/gms/clearcut/internal/zzq;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/ClientSettings;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 7

    const/16 v3, 0x28

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .line 1
    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/common/internal/zzl;-><init>(Landroid/content/Context;Landroid/os/Looper;ILcom/google/android/gms/common/internal/ClientSettings;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method


# virtual methods
.method public final getServiceDescriptor()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.clearcut.internal.IClearcutLoggerService"

    return-object p0
.end method

.method public final getStartServiceAction()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.clearcut.service.START"

    return-object p0
.end method

.method public final zza()I
    .locals 0

    const p0, 0xbf2d68

    return p0
.end method

.method public final synthetic zza(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 1

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string p0, "com.google.android.gms.clearcut.internal.IClearcutLoggerService"

    .line 1
    invoke-interface {p1, p0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object p0

    .line 2
    instance-of v0, p0, Lcom/google/android/gms/clearcut/internal/zzq;

    if-eqz v0, :cond_1

    .line 3
    check-cast p0, Lcom/google/android/gms/clearcut/internal/zzq;

    return-object p0

    .line 4
    :cond_1
    new-instance p0, Lcom/google/android/gms/clearcut/internal/zzr;

    invoke-direct {p0, p1}, Lcom/google/android/gms/clearcut/internal/zzr;-><init>(Landroid/os/IBinder;)V

    return-object p0
.end method
