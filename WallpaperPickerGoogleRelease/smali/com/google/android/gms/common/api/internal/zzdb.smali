.class public final Lcom/google/android/gms/common/api/internal/zzdb;
.super Lcom/google/android/gms/internal/zzelp;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# static fields
.field public static zza:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza<",
            "+",
            "Lcom/google/android/gms/signin/zzd;",
            "Lcom/google/android/gms/signin/SignInOptions;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zzb:Landroid/content/Context;

.field public final zzc:Landroid/os/Handler;

.field public final zzd:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza<",
            "+",
            "Lcom/google/android/gms/signin/zzd;",
            "Lcom/google/android/gms/signin/SignInOptions;",
            ">;"
        }
    .end annotation
.end field

.field public zze:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field

.field public zzf:Lcom/google/android/gms/common/internal/ClientSettings;

.field public zzg:Lcom/google/android/gms/signin/zzd;

.field public zzh:Lcom/google/android/gms/common/api/internal/zzde;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/signin/zza;->zza:Lcom/google/android/gms/common/api/Api$zza;

    sput-object v0, Lcom/google/android/gms/common/api/internal/zzdb;->zza:Lcom/google/android/gms/common/api/Api$zza;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Lcom/google/android/gms/common/internal/ClientSettings;Lcom/google/android/gms/common/api/Api$zza;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/os/Handler;",
            "Lcom/google/android/gms/common/internal/ClientSettings;",
            "Lcom/google/android/gms/common/api/Api$zza<",
            "+",
            "Lcom/google/android/gms/signin/zzd;",
            "Lcom/google/android/gms/signin/SignInOptions;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzelp;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzdb;->zzb:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/common/api/internal/zzdb;->zzc:Landroid/os/Handler;

    const-string p1, "ClientSettings must not be null"

    .line 4
    invoke-static {p3, p1}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p3, p0, Lcom/google/android/gms/common/api/internal/zzdb;->zzf:Lcom/google/android/gms/common/internal/ClientSettings;

    .line 5
    iget-object p1, p3, Lcom/google/android/gms/common/internal/ClientSettings;->zzb:Ljava/util/Set;

    .line 6
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzdb;->zze:Ljava/util/Set;

    .line 7
    iput-object p4, p0, Lcom/google/android/gms/common/api/internal/zzdb;->zzd:Lcom/google/android/gms/common/api/Api$zza;

    return-void
.end method


# virtual methods
.method public final onConnected(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzdb;->zzg:Lcom/google/android/gms/signin/zzd;

    invoke-interface {p1, p0}, Lcom/google/android/gms/signin/zzd;->zza(Lcom/google/android/gms/internal/zzelq;)V

    return-void
.end method

.method public final onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzdb;->zzh:Lcom/google/android/gms/common/api/internal/zzde;

    check-cast p0, Lcom/google/android/gms/common/api/internal/zzbv;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzbv;->zza(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method public final onConnectionSuspended(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzdb;->zzg:Lcom/google/android/gms/signin/zzd;

    invoke-interface {p0}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/zzelx;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzdb;->zzc:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/common/api/internal/zzdd;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/common/api/internal/zzdd;-><init>(Lcom/google/android/gms/common/api/internal/zzdb;Lcom/google/android/gms/internal/zzelx;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
