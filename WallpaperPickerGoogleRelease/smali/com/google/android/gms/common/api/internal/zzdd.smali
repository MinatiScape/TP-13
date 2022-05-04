.class public final Lcom/google/android/gms/common/api/internal/zzdd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/internal/zzelx;

.field public final synthetic zzb:Lcom/google/android/gms/common/api/internal/zzdb;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzdb;Lcom/google/android/gms/internal/zzelx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzdd;->zzb:Lcom/google/android/gms/common/api/internal/zzdb;

    iput-object p2, p0, Lcom/google/android/gms/common/api/internal/zzdd;->zza:Lcom/google/android/gms/internal/zzelx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzdd;->zzb:Lcom/google/android/gms/common/api/internal/zzdb;

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzdd;->zza:Lcom/google/android/gms/internal/zzelx;

    .line 2
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzelx;->zzb:Lcom/google/android/gms/common/ConnectionResult;

    .line 4
    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 5
    iget-object p0, p0, Lcom/google/android/gms/internal/zzelx;->zzc:Lcom/google/android/gms/common/internal/zzax;

    .line 6
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzax;->zzc:Lcom/google/android/gms/common/ConnectionResult;

    .line 7
    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v2

    if-nez v2, :cond_0

    .line 8
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x30

    const-string v3, "Sign-in succeeded with resolve account failure: "

    invoke-static {v2, v3, p0}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    const-string v3, "SignInCoordinator"

    invoke-static {v3, p0, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 9
    iget-object p0, v0, Lcom/google/android/gms/common/api/internal/zzdb;->zzh:Lcom/google/android/gms/common/api/internal/zzde;

    check-cast p0, Lcom/google/android/gms/common/api/internal/zzbv;

    invoke-virtual {p0, v1}, Lcom/google/android/gms/common/api/internal/zzbv;->zza(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 10
    iget-object p0, v0, Lcom/google/android/gms/common/api/internal/zzdb;->zzg:Lcom/google/android/gms/signin/zzd;

    invoke-interface {p0}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    goto :goto_2

    .line 11
    :cond_0
    iget-object v1, v0, Lcom/google/android/gms/common/api/internal/zzdb;->zzh:Lcom/google/android/gms/common/api/internal/zzde;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzax;->zza()Lcom/google/android/gms/common/internal/IAccountAccessor;

    move-result-object p0

    iget-object v2, v0, Lcom/google/android/gms/common/api/internal/zzdb;->zze:Ljava/util/Set;

    check-cast v1, Lcom/google/android/gms/common/api/internal/zzbv;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p0, :cond_2

    if-nez v2, :cond_1

    goto :goto_0

    .line 12
    :cond_1
    iput-object p0, v1, Lcom/google/android/gms/common/api/internal/zzbv;->zzd:Lcom/google/android/gms/common/internal/IAccountAccessor;

    .line 13
    iput-object v2, v1, Lcom/google/android/gms/common/api/internal/zzbv;->zze:Ljava/util/Set;

    .line 14
    iget-boolean v3, v1, Lcom/google/android/gms/common/api/internal/zzbv;->zzf:Z

    if-eqz v3, :cond_4

    .line 15
    iget-object v1, v1, Lcom/google/android/gms/common/api/internal/zzbv;->zzb:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {v1, p0, v2}, Lcom/google/android/gms/common/api/Api$Client;->getRemoteService(Lcom/google/android/gms/common/internal/IAccountAccessor;Ljava/util/Set;)V

    goto :goto_1

    .line 16
    :cond_2
    :goto_0
    new-instance p0, Ljava/lang/Exception;

    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    const-string v2, "GoogleApiManager"

    const-string v3, "Received null response from onSignInSuccess"

    invoke-static {v2, v3, p0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 17
    new-instance p0, Lcom/google/android/gms/common/ConnectionResult;

    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lcom/google/android/gms/common/ConnectionResult;-><init>(I)V

    invoke-virtual {v1, p0}, Lcom/google/android/gms/common/api/internal/zzbv;->zza(Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_1

    .line 18
    :cond_3
    iget-object p0, v0, Lcom/google/android/gms/common/api/internal/zzdb;->zzh:Lcom/google/android/gms/common/api/internal/zzde;

    check-cast p0, Lcom/google/android/gms/common/api/internal/zzbv;

    invoke-virtual {p0, v1}, Lcom/google/android/gms/common/api/internal/zzbv;->zza(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 19
    :cond_4
    :goto_1
    iget-object p0, v0, Lcom/google/android/gms/common/api/internal/zzdb;->zzg:Lcom/google/android/gms/signin/zzd;

    invoke-interface {p0}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    :goto_2
    return-void
.end method
