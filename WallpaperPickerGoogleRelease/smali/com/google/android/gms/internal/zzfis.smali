.class public abstract Lcom/google/android/gms/internal/zzfis;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final zzb:Ljava/lang/Object;

.field public static zzc:Landroid/content/Context; = null
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field

.field public static zzd:Z = false

.field public static volatile zze:Ljava/lang/Boolean;

.field public static volatile zzf:Ljava/lang/Boolean;


# instance fields
.field public final zza:Ljava/lang/String;

.field public final zzg:Lcom/google/android/gms/internal/zzfiz;

.field public final zzh:Ljava/lang/String;

.field public final zzi:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public volatile zzk:Lcom/google/android/gms/internal/zzfiq;

.field public volatile zzl:Landroid/content/SharedPreferences;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfis;->zzb:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzfiz;Ljava/lang/String;Ljava/lang/Object;Lcom/google/android/gms/internal/zzfiw;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p4, 0x0

    .line 2
    iput-object p4, p0, Lcom/google/android/gms/internal/zzfis;->zzk:Lcom/google/android/gms/internal/zzfiq;

    .line 3
    iput-object p4, p0, Lcom/google/android/gms/internal/zzfis;->zzl:Landroid/content/SharedPreferences;

    .line 4
    iget-object p4, p1, Lcom/google/android/gms/internal/zzfiz;->zza:Ljava/lang/String;

    if-nez p4, :cond_1

    .line 5
    iget-object v0, p1, Lcom/google/android/gms/internal/zzfiz;->zzb:Landroid/net/Uri;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Must pass a valid SharedPreferences file name or ContentProvider URI"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    if-eqz p4, :cond_3

    .line 7
    iget-object p4, p1, Lcom/google/android/gms/internal/zzfiz;->zzb:Landroid/net/Uri;

    if-nez p4, :cond_2

    goto :goto_1

    .line 8
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Must pass one of SharedPreferences file name or ContentProvider URI"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 9
    :cond_3
    :goto_1
    iput-object p1, p0, Lcom/google/android/gms/internal/zzfis;->zzg:Lcom/google/android/gms/internal/zzfiz;

    .line 10
    iget-object p4, p1, Lcom/google/android/gms/internal/zzfiz;->zzc:Ljava/lang/String;

    .line 11
    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    goto :goto_2

    :cond_4
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object p4, v0

    :goto_2
    iput-object p4, p0, Lcom/google/android/gms/internal/zzfis;->zzh:Ljava/lang/String;

    .line 12
    iget-object p1, p1, Lcom/google/android/gms/internal/zzfiz;->zzd:Ljava/lang/String;

    .line 13
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p4

    if-eqz p4, :cond_5

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_3

    :cond_5
    new-instance p2, Ljava/lang/String;

    invoke-direct {p2, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object p1, p2

    :goto_3
    iput-object p1, p0, Lcom/google/android/gms/internal/zzfis;->zza:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lcom/google/android/gms/internal/zzfis;->zzi:Ljava/lang/Object;

    return-void
.end method

.method public static zza(Lcom/google/android/gms/internal/zzfiy;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/zzfiy<",
            "TV;>;)TV;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-interface {p0}, Lcom/google/android/gms/internal/zzfiy;->zza()Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2
    :catch_0
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 3
    :try_start_1
    invoke-interface {p0}, Lcom/google/android/gms/internal/zzfiy;->zza()Ljava/lang/Object;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 4
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    :goto_0
    return-object p0

    :catchall_0
    move-exception p0

    .line 5
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p0
.end method

.method public static zza(Ljava/lang/String;)Z
    .locals 1

    .line 6
    invoke-static {}, Lcom/google/android/gms/internal/zzfis;->zzg()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 7
    new-instance v0, Lcom/google/android/gms/internal/zzfiv;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzfiv;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/google/android/gms/internal/zzfis;->zza(Lcom/google/android/gms/internal/zzfiy;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static zzg()Z
    .locals 6

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zze:Ljava/lang/Boolean;

    if-nez v0, :cond_3

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 3
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v2

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 4
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 5
    :goto_0
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v3

    .line 6
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v4

    const-string v5, "com.google.android.providers.gsf.permission.READ_GSERVICES"

    .line 7
    invoke-static {v0, v5, v3, v4, v2}, Landroidx/core/content/PermissionChecker;->checkPermission(Landroid/content/Context;Ljava/lang/String;IILjava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    const/4 v1, 0x1

    .line 8
    :cond_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzfis;->zze:Ljava/lang/Boolean;

    goto :goto_1

    :cond_2
    return v1

    .line 9
    :cond_3
    :goto_1
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zze:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public abstract zza(Landroid/content/SharedPreferences;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract zza(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

.method public final zze()Ljava/lang/Object;
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    const-string v0, "gms:phenotype:phenotype_flag:debug_bypass_phenotype"

    .line 1
    invoke-static {v0}, Lcom/google/android/gms/internal/zzfis;->zza(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_9

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfis;->zzg:Lcom/google/android/gms/internal/zzfiz;

    .line 3
    iget-object v2, v0, Lcom/google/android/gms/internal/zzfiz;->zzb:Landroid/net/Uri;

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfis;->zzk:Lcom/google/android/gms/internal/zzfiq;

    if-nez v0, :cond_2

    .line 5
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    .line 6
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfis;->zzg:Lcom/google/android/gms/internal/zzfiz;

    .line 7
    iget-object v2, v2, Lcom/google/android/gms/internal/zzfiz;->zzb:Landroid/net/Uri;

    .line 8
    sget-object v4, Lcom/google/android/gms/internal/zzfiq;->zza:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/zzfiq;

    if-nez v5, :cond_1

    .line 9
    new-instance v5, Lcom/google/android/gms/internal/zzfiq;

    invoke-direct {v5, v0, v2}, Lcom/google/android/gms/internal/zzfiq;-><init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 10
    invoke-virtual {v4, v2, v5}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/zzfiq;

    if-nez v4, :cond_0

    .line 11
    iget-object v4, v5, Lcom/google/android/gms/internal/zzfiq;->zzd:Landroid/database/ContentObserver;

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    goto :goto_0

    :cond_0
    move-object v5, v4

    .line 12
    :cond_1
    :goto_0
    iput-object v5, p0, Lcom/google/android/gms/internal/zzfis;->zzk:Lcom/google/android/gms/internal/zzfiq;

    .line 13
    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfis;->zzk:Lcom/google/android/gms/internal/zzfiq;

    .line 14
    new-instance v2, Lcom/google/android/gms/internal/zzfit;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzfit;-><init>(Lcom/google/android/gms/internal/zzfis;Lcom/google/android/gms/internal/zzfiq;)V

    invoke-static {v2}, Lcom/google/android/gms/internal/zzfis;->zza(Lcom/google/android/gms/internal/zzfiy;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 15
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzfis;->zza(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 16
    :cond_3
    iget-object v0, v0, Lcom/google/android/gms/internal/zzfiz;->zza:Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 17
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->isDeviceProtectedStorage()Z

    move-result v0

    if-nez v0, :cond_6

    .line 18
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzf:Ljava/lang/Boolean;

    if-eqz v0, :cond_4

    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzf:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_5

    .line 19
    :cond_4
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    const-class v2, Landroid/os/UserManager;

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    invoke-virtual {v0}, Landroid/os/UserManager;->isUserUnlocked()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzfis;->zzf:Ljava/lang/Boolean;

    .line 20
    :cond_5
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzf:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_1

    :cond_6
    const/4 v0, 0x1

    :goto_1
    if-nez v0, :cond_7

    return-object v1

    .line 21
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfis;->zzl:Landroid/content/SharedPreferences;

    if-nez v0, :cond_8

    .line 22
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfis;->zzg:Lcom/google/android/gms/internal/zzfiz;

    .line 23
    iget-object v2, v2, Lcom/google/android/gms/internal/zzfiz;->zza:Ljava/lang/String;

    .line 24
    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfis;->zzl:Landroid/content/SharedPreferences;

    .line 25
    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfis;->zzl:Landroid/content/SharedPreferences;

    .line 26
    iget-object v2, p0, Lcom/google/android/gms/internal/zzfis;->zza:Ljava/lang/String;

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 27
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzfis;->zza(Landroid/content/SharedPreferences;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_9
    const-string v0, "Bypass reading Phenotype values for flag: "

    .line 28
    iget-object p0, p0, Lcom/google/android/gms/internal/zzfis;->zza:Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_a

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    :cond_a
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_2
    const-string v0, "PhenotypeFlag"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_b
    return-object v1
.end method

.method public final zzf()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfis;->zzg:Lcom/google/android/gms/internal/zzfiz;

    .line 2
    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzfiz;->zze:Z

    if-nez v0, :cond_0

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/zzfis;->zzg()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4
    :try_start_0
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfis;->zzh:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzfib;->zza(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 6
    :catch_0
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 7
    :try_start_1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    sget-object v2, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzfis;->zzh:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzfib;->zza(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_0

    .line 10
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzfis;->zza(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception p0

    .line 11
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method
