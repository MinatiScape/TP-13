.class public final Lcom/google/android/gms/internal/zzelu;
.super Lcom/google/android/gms/common/internal/zzl;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/signin/zzd;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/zzl<",
        "Lcom/google/android/gms/internal/zzels;",
        ">;",
        "Lcom/google/android/gms/signin/zzd;"
    }
.end annotation


# instance fields
.field public final zzc:Z

.field public final zzd:Lcom/google/android/gms/common/internal/ClientSettings;

.field public final zze:Landroid/os/Bundle;

.field public zzf:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/ClientSettings;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 11

    move-object v7, p0

    move-object v8, p3

    .line 1
    iget-object v0, v8, Lcom/google/android/gms/common/internal/ClientSettings;->zzi:Lcom/google/android/gms/signin/SignInOptions;

    .line 2
    iget-object v1, v8, Lcom/google/android/gms/common/internal/ClientSettings;->zzj:Ljava/lang/Integer;

    .line 3
    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    .line 4
    iget-object v2, v8, Lcom/google/android/gms/common/internal/ClientSettings;->zza:Landroid/accounts/Account;

    const-string v3, "com.google.android.gms.signin.internal.clientRequestedAccount"

    .line 5
    invoke-virtual {v9, v3, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    if-eqz v1, :cond_0

    .line 6
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "com.google.android.gms.common.internal.ClientSettings.sessionId"

    invoke-virtual {v9, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_0
    const/4 v10, 0x1

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    const-string v1, "com.google.android.gms.signin.internal.offlineAccessRequested"

    .line 7
    invoke-virtual {v9, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "com.google.android.gms.signin.internal.idTokenRequested"

    .line 8
    invoke-virtual {v9, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const/4 v1, 0x0

    const-string v2, "com.google.android.gms.signin.internal.serverClientId"

    .line 9
    invoke-virtual {v9, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "com.google.android.gms.signin.internal.usePromptModeForAuthCode"

    .line 10
    invoke-virtual {v9, v2, v10}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "com.google.android.gms.signin.internal.forceCodeForRefreshToken"

    .line 11
    invoke-virtual {v9, v2, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "com.google.android.gms.signin.internal.hostedDomain"

    .line 12
    invoke-virtual {v9, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "com.google.android.gms.signin.internal.waitForAccessTokenRefresh"

    .line 13
    invoke-virtual {v9, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_1
    const/16 v3, 0x2c

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    .line 14
    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/common/internal/zzl;-><init>(Landroid/content/Context;Landroid/os/Looper;ILcom/google/android/gms/common/internal/ClientSettings;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    .line 15
    iput-boolean v10, v7, Lcom/google/android/gms/internal/zzelu;->zzc:Z

    .line 16
    iput-object v8, v7, Lcom/google/android/gms/internal/zzelu;->zzd:Lcom/google/android/gms/common/internal/ClientSettings;

    .line 17
    iput-object v9, v7, Lcom/google/android/gms/internal/zzelu;->zze:Landroid/os/Bundle;

    .line 18
    iget-object v0, v8, Lcom/google/android/gms/common/internal/ClientSettings;->zzj:Ljava/lang/Integer;

    .line 19
    iput-object v0, v7, Lcom/google/android/gms/internal/zzelu;->zzf:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final getServiceDescriptor()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.signin.internal.ISignInService"

    return-object p0
.end method

.method public final getStartServiceAction()Ljava/lang/String;
    .locals 0

    const-string p0, "com.google.android.gms.signin.service.START"

    return-object p0
.end method

.method public final requiresSignIn()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/google/android/gms/internal/zzelu;->zzc:Z

    return p0
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
    const-string p0, "com.google.android.gms.signin.internal.ISignInService"

    .line 13
    invoke-interface {p1, p0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object p0

    .line 14
    instance-of v0, p0, Lcom/google/android/gms/internal/zzels;

    if-eqz v0, :cond_1

    .line 15
    check-cast p0, Lcom/google/android/gms/internal/zzels;

    return-object p0

    .line 16
    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/zzelt;

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzelt;-><init>(Landroid/os/IBinder;)V

    return-object p0
.end method

.method public final zza(Lcom/google/android/gms/internal/zzelq;)V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzelu;->zzd:Lcom/google/android/gms/common/internal/ClientSettings;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/internal/ClientSettings;->zza:Landroid/accounts/Account;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "<<default account>>"

    if-eqz v0, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    :try_start_1
    new-instance v0, Landroid/accounts/Account;

    const-string v2, "com.google"

    invoke-direct {v0, v1, v2}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 v2, 0x0

    .line 4
    iget-object v3, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 5
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzi:Landroid/content/Context;

    .line 6
    invoke-static {v1}, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zza(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/internal/zzaa;

    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zza()Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v2

    .line 8
    :cond_1
    new-instance v1, Lcom/google/android/gms/common/internal/zzav;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzelu;->zzf:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v1, v0, v3, v2}, Lcom/google/android/gms/common/internal/zzav;-><init>(Landroid/accounts/Account;ILcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzag()Landroid/os/IInterface;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzels;

    new-instance v0, Lcom/google/android/gms/internal/zzelv;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzelv;-><init>(Lcom/google/android/gms/common/internal/zzav;)V

    invoke-interface {p0, v0, p1}, Lcom/google/android/gms/internal/zzels;->zza(Lcom/google/android/gms/internal/zzelv;Lcom/google/android/gms/internal/zzelq;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p0

    const-string v0, "SignInClientImpl"

    const-string v1, "Remote service probably died when signIn is called"

    .line 10
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    :try_start_2
    new-instance v1, Lcom/google/android/gms/internal/zzelx;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzelx;-><init>()V

    invoke-interface {p1, v1}, Lcom/google/android/gms/internal/zzelq;->zza(Lcom/google/android/gms/internal/zzelx;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    return-void

    :catch_1
    const-string p1, "ISignInCallbacks#onSignInComplete should be executed from the same process, unexpected RemoteException."

    .line 12
    invoke-static {v0, p1, p0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public final zzb()Landroid/os/Bundle;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzelu;->zzd:Lcom/google/android/gms/common/internal/ClientSettings;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/common/internal/ClientSettings;->zzg:Ljava/lang/String;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzi:Landroid/content/Context;

    .line 4
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzelu;->zze:Landroid/os/Bundle;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzelu;->zzd:Lcom/google/android/gms/common/internal/ClientSettings;

    .line 6
    iget-object v1, v1, Lcom/google/android/gms/common/internal/ClientSettings;->zzg:Ljava/lang/String;

    const-string v2, "com.google.android.gms.signin.internal.realClientPackageName"

    .line 7
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/zzelu;->zze:Landroid/os/Bundle;

    return-object p0
.end method

.method public final zzd()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->connect(Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;)V

    return-void
.end method
