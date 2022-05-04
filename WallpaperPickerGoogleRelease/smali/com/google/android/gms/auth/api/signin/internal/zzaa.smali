.class public final Lcom/google/android/gms/auth/api/signin/internal/zzaa;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final zza:Ljava/util/concurrent/locks/Lock;

.field public static zzb:Lcom/google/android/gms/auth/api/signin/internal/zzaa;


# instance fields
.field public final zzc:Ljava/util/concurrent/locks/Lock;

.field public final zzd:Landroid/content/SharedPreferences;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    sput-object v0, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zza:Ljava/util/concurrent/locks/Lock;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zzc:Ljava/util/concurrent/locks/Lock;

    const-string v0, "com.google.android.gms.signin"

    const/4 v1, 0x0

    .line 3
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zzd:Landroid/content/SharedPreferences;

    return-void
.end method

.method public static zza(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/internal/zzaa;
    .locals 2

    const-string v0, "null reference"

    .line 1
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2
    sget-object v0, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zza:Ljava/util/concurrent/locks/Lock;

    move-object v1, v0

    check-cast v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 3
    :try_start_0
    sget-object v1, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zzb:Lcom/google/android/gms/auth/api/signin/internal/zzaa;

    if-nez v1, :cond_0

    .line 4
    new-instance v1, Lcom/google/android/gms/auth/api/signin/internal/zzaa;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lcom/google/android/gms/auth/api/signin/internal/zzaa;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zzb:Lcom/google/android/gms/auth/api/signin/internal/zzaa;

    .line 5
    :cond_0
    sget-object p0, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zzb:Lcom/google/android/gms/auth/api/signin/internal/zzaa;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    check-cast v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-object p0

    :catchall_0
    move-exception p0

    .line 7
    sget-object v0, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zza:Ljava/util/concurrent/locks/Lock;

    check-cast v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw p0
.end method


# virtual methods
.method public final zza()Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;
    .locals 4

    const-string v0, "defaultGoogleSignInAccount"

    .line 8
    invoke-virtual {p0, v0}, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v1, 0x14

    .line 10
    invoke-static {v0, v1}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "googleSignInAccount"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 12
    :try_start_0
    invoke-static {p0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->zza(Ljava/lang/String;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    :goto_0
    return-object v2
.end method

.method public final zza(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 13
    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zzc:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 14
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zzd:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    iget-object p0, p0, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zzc:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object p1

    :catchall_0
    move-exception p1

    .line 16
    iget-object p0, p0, Lcom/google/android/gms/auth/api/signin/internal/zzaa;->zzc:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method
