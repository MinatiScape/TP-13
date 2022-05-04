.class public Lcom/google/android/gms/common/api/GoogleApi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/GoogleApi$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<O::",
        "Lcom/google/android/gms/common/api/Api$ApiOptions;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final zza:Lcom/google/android/gms/common/api/internal/zzbn;

.field public final zzb:Landroid/content/Context;

.field public final zzc:Lcom/google/android/gms/common/api/Api;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api<",
            "TO;>;"
        }
    .end annotation
.end field

.field public final zzd:Lcom/google/android/gms/common/api/Api$ApiOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TO;"
        }
    .end annotation
.end field

.field public final zze:Lcom/google/android/gms/common/api/internal/zzi;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "TO;>;"
        }
    .end annotation
.end field

.field public final zzf:Landroid/os/Looper;

.field public final zzg:I

.field public final zzh:Lcom/google/android/gms/common/api/GoogleApiClient;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Lcom/google/android/gms/common/api/internal/zzh;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/common/api/Api<",
            "TO;>;TO;",
            "Lcom/google/android/gms/common/api/internal/zzh;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p3

    .line 2
    new-instance p4, Lcom/google/android/gms/common/api/GoogleApi$zza;

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p4, "Null context is not permitted."

    .line 4
    invoke-static {p1, p4}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p4, "Api must not be null."

    .line 5
    invoke-static {p2, p4}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzb:Landroid/content/Context;

    .line 7
    iput-object p2, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzc:Lcom/google/android/gms/common/api/Api;

    const/4 p4, 0x0

    .line 8
    iput-object p4, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzd:Lcom/google/android/gms/common/api/Api$ApiOptions;

    .line 9
    iput-object p3, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzf:Landroid/os/Looper;

    .line 10
    new-instance p3, Lcom/google/android/gms/common/api/internal/zzi;

    invoke-direct {p3, p2, p4}, Lcom/google/android/gms/common/api/internal/zzi;-><init>(Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;)V

    .line 11
    iput-object p3, p0, Lcom/google/android/gms/common/api/GoogleApi;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    .line 12
    new-instance p2, Lcom/google/android/gms/common/api/internal/zzbx;

    invoke-direct {p2, p0}, Lcom/google/android/gms/common/api/internal/zzbx;-><init>(Lcom/google/android/gms/common/api/GoogleApi;)V

    iput-object p2, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzh:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 13
    invoke-static {p1}, Lcom/google/android/gms/common/api/internal/zzbn;->zza(Landroid/content/Context;)Lcom/google/android/gms/common/api/internal/zzbn;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 14
    iget-object p2, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzk:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result p2

    .line 15
    iput p2, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzg:I

    .line 16
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    const/4 p2, 0x7

    invoke-virtual {p1, p2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method


# virtual methods
.method public zza(Landroid/os/Looper;Lcom/google/android/gms/common/api/internal/zzbp;)Lcom/google/android/gms/common/api/Api$Client;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Looper;",
            "Lcom/google/android/gms/common/api/internal/zzbp<",
            "TO;>;)",
            "Lcom/google/android/gms/common/api/Api$Client;"
        }
    .end annotation

    .line 8
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApi;->zza()Lcom/google/android/gms/common/internal/ClientSettings$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zza()Lcom/google/android/gms/common/internal/ClientSettings;

    move-result-object v4

    .line 9
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzc:Lcom/google/android/gms/common/api/Api;

    .line 10
    iget-object v1, v0, Lcom/google/android/gms/common/api/Api;->zza:Lcom/google/android/gms/common/api/Api$zza;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "This API was constructed with a SimpleClientBuilder. Use getSimpleClientBuilder"

    invoke-static {v1, v2}, Landroidx/preference/R$string;->zza(ZLjava/lang/Object;)V

    .line 11
    iget-object v1, v0, Lcom/google/android/gms/common/api/Api;->zza:Lcom/google/android/gms/common/api/Api$zza;

    .line 12
    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzb:Landroid/content/Context;

    iget-object v5, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzd:Lcom/google/android/gms/common/api/Api$ApiOptions;

    move-object v3, p1

    move-object v6, p2

    move-object v7, p2

    .line 13
    invoke-virtual/range {v1 .. v7}, Lcom/google/android/gms/common/api/Api$zza;->zza(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/ClientSettings;Ljava/lang/Object;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/Api$Client;

    move-result-object p0

    return-object p0
.end method

.method public zza(Landroid/content/Context;Landroid/os/Handler;)Lcom/google/android/gms/common/api/internal/zzdb;
    .locals 2

    .line 38
    new-instance v0, Lcom/google/android/gms/common/api/internal/zzdb;

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApi;->zza()Lcom/google/android/gms/common/internal/ClientSettings$zza;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zza()Lcom/google/android/gms/common/internal/ClientSettings;

    move-result-object p0

    .line 39
    sget-object v1, Lcom/google/android/gms/common/api/internal/zzdb;->zza:Lcom/google/android/gms/common/api/Api$zza;

    invoke-direct {v0, p1, p2, p0, v1}, Lcom/google/android/gms/common/api/internal/zzdb;-><init>(Landroid/content/Context;Landroid/os/Handler;Lcom/google/android/gms/common/internal/ClientSettings;Lcom/google/android/gms/common/api/Api$zza;)V

    return-object v0
.end method

.method public final zza(ILcom/google/android/gms/common/api/internal/zzn;)Lcom/google/android/gms/common/api/internal/zzn;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "T:",
            "Lcom/google/android/gms/common/api/internal/zzn<",
            "+",
            "Lcom/google/android/gms/common/api/Result;",
            "TA;>;>(ITT;)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zzg()V

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 3
    new-instance v1, Lcom/google/android/gms/common/api/internal/zzd;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/common/api/internal/zzd;-><init>(ILcom/google/android/gms/common/api/internal/zzn;)V

    .line 4
    iget-object p1, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    new-instance v2, Lcom/google/android/gms/common/api/internal/zzcu;

    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzl:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    invoke-direct {v2, v1, v0, p0}, Lcom/google/android/gms/common/api/internal/zzcu;-><init>(Lcom/google/android/gms/common/api/internal/zzb;ILcom/google/android/gms/common/api/GoogleApi;)V

    const/4 p0, 0x4

    .line 6
    invoke-virtual {p1, p0, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-object p2
.end method

.method public final zza()Lcom/google/android/gms/common/internal/ClientSettings$zza;
    .locals 4

    .line 14
    new-instance v0, Lcom/google/android/gms/common/internal/ClientSettings$zza;

    invoke-direct {v0}, Lcom/google/android/gms/common/internal/ClientSettings$zza;-><init>()V

    .line 15
    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzd:Lcom/google/android/gms/common/api/Api$ApiOptions;

    instance-of v2, v1, Lcom/google/android/gms/common/api/Api$ApiOptions$HasGoogleSignInAccountOptions;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 16
    check-cast v1, Lcom/google/android/gms/common/api/Api$ApiOptions$HasGoogleSignInAccountOptions;

    .line 17
    invoke-interface {v1}, Lcom/google/android/gms/common/api/Api$ApiOptions$HasGoogleSignInAccountOptions;->getGoogleSignInAccount()Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 18
    iget-object v2, v1, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->zze:Ljava/lang/String;

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    new-instance v2, Landroid/accounts/Account;

    iget-object v1, v1, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->zze:Ljava/lang/String;

    const-string v3, "com.google"

    invoke-direct {v2, v1, v3}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v3, v2

    goto :goto_0

    .line 19
    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzd:Lcom/google/android/gms/common/api/Api$ApiOptions;

    instance-of v2, v1, Lcom/google/android/gms/common/api/Api$ApiOptions$HasAccountOptions;

    if-eqz v2, :cond_2

    .line 20
    check-cast v1, Lcom/google/android/gms/common/api/Api$ApiOptions$HasAccountOptions;

    invoke-interface {v1}, Lcom/google/android/gms/common/api/Api$ApiOptions$HasAccountOptions;->getAccount()Landroid/accounts/Account;

    move-result-object v3

    .line 21
    :cond_2
    :goto_0
    iput-object v3, v0, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zza:Landroid/accounts/Account;

    .line 22
    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzd:Lcom/google/android/gms/common/api/Api$ApiOptions;

    instance-of v2, v1, Lcom/google/android/gms/common/api/Api$ApiOptions$HasGoogleSignInAccountOptions;

    if-eqz v2, :cond_3

    .line 23
    check-cast v1, Lcom/google/android/gms/common/api/Api$ApiOptions$HasGoogleSignInAccountOptions;

    .line 24
    invoke-interface {v1}, Lcom/google/android/gms/common/api/Api$ApiOptions$HasGoogleSignInAccountOptions;->getGoogleSignInAccount()Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 25
    invoke-virtual {v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->zzd()Ljava/util/Set;

    move-result-object v1

    goto :goto_1

    .line 26
    :cond_3
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v1

    .line 27
    :goto_1
    iget-object v2, v0, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zzb:Landroidx/collection/ArraySet;

    if-nez v2, :cond_4

    .line 28
    new-instance v2, Landroidx/collection/ArraySet;

    const/4 v3, 0x0

    .line 29
    invoke-direct {v2, v3}, Landroidx/collection/ArraySet;-><init>(I)V

    .line 30
    iput-object v2, v0, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zzb:Landroidx/collection/ArraySet;

    .line 31
    :cond_4
    iget-object v2, v0, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zzb:Landroidx/collection/ArraySet;

    invoke-virtual {v2, v1}, Landroidx/collection/ArraySet;->addAll(Ljava/util/Collection;)Z

    .line 32
    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzb:Landroid/content/Context;

    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zze:Ljava/lang/String;

    .line 35
    iget-object p0, p0, Lcom/google/android/gms/common/api/GoogleApi;->zzb:Landroid/content/Context;

    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    .line 37
    iput-object p0, v0, Lcom/google/android/gms/common/internal/ClientSettings$zza;->zzd:Ljava/lang/String;

    return-object v0
.end method
