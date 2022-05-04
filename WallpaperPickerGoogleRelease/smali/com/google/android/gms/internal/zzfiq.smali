.class public final Lcom/google/android/gms/internal/zzfiq;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final zza:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Landroid/net/Uri;",
            "Lcom/google/android/gms/internal/zzfiq;",
            ">;"
        }
    .end annotation
.end field

.field public static final zzg:[Ljava/lang/String;


# instance fields
.field public final zzb:Landroid/content/ContentResolver;

.field public final zzc:Landroid/net/Uri;

.field public final zzd:Landroid/database/ContentObserver;

.field public final zze:Ljava/lang/Object;

.field public volatile zzf:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfiq;->zza:Ljava/util/concurrent/ConcurrentHashMap;

    const-string v0, "key"

    const-string v1, "value"

    .line 2
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzfiq;->zzg:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfiq;->zze:Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/android/gms/internal/zzfiq;->zzb:Landroid/content/ContentResolver;

    .line 4
    iput-object p2, p0, Lcom/google/android/gms/internal/zzfiq;->zzc:Landroid/net/Uri;

    .line 5
    new-instance p1, Lcom/google/android/gms/internal/zzfir;

    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/zzfir;-><init>(Lcom/google/android/gms/internal/zzfiq;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfiq;->zzd:Landroid/database/ContentObserver;

    return-void
.end method


# virtual methods
.method public final zzc()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzfiq;->zzb:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfiq;->zzc:Landroid/net/Uri;

    sget-object v3, Lcom/google/android/gms/internal/zzfiq;->zzg:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_1

    .line 3
    :goto_0
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 4
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 5
    :cond_0
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception v0

    .line 6
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw v0
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_1
    :goto_1
    return-object v0

    :catch_0
    const-string p0, "ConfigurationContentLoader"

    const-string v0, "PhenotypeFlag unable to load ContentProvider, using default values"

    .line 7
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method
