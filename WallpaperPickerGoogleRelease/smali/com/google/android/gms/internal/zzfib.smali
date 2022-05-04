.class public Lcom/google/android/gms/internal/zzfib;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final zza:Ljava/util/regex/Pattern;

.field public static final zzb:Ljava/util/regex/Pattern;

.field public static final zzc:Landroid/net/Uri;

.field public static final zzd:Landroid/net/Uri;

.field public static final zze:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static zzf:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final zzg:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final zzh:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final zzi:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final zzj:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public static zzk:Ljava/lang/Object;

.field public static zzl:Z

.field public static zzm:[Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-string v0, "content://com.google.android.gsf.gservices"

    .line 1
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zzc:Landroid/net/Uri;

    const-string v0, "content://com.google.android.gsf.gservices/prefix"

    .line 2
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zzd:Landroid/net/Uri;

    const-string v0, "^(1|true|t|on|yes|y)$"

    const/4 v1, 0x2

    .line 3
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zza:Ljava/util/regex/Pattern;

    const-string v0, "^(0|false|f|off|no|n)$"

    .line 4
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zzb:Ljava/util/regex/Pattern;

    .line 5
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zze:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 6
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zzg:Ljava/util/HashMap;

    .line 7
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zzh:Ljava/util/HashMap;

    .line 8
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zzi:Ljava/util/HashMap;

    .line 9
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zzj:Ljava/util/HashMap;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    .line 10
    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zzm:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static zza(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "TT;>;",
            "Ljava/lang/String;",
            "TT;)TT;"
        }
    .end annotation

    .line 53
    const-class v0, Lcom/google/android/gms/internal/zzfib;

    monitor-enter v0

    .line 54
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 55
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    move-object p2, p0

    .line 56
    :cond_0
    monitor-exit v0

    return-object p2

    .line 57
    :cond_1
    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static zza(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    .locals 14

    .line 15
    const-class v0, Lcom/google/android/gms/internal/zzfib;

    monitor-enter v0

    .line 16
    :try_start_0
    invoke-static {p0}, Lcom/google/android/gms/internal/zzfib;->zza(Landroid/content/ContentResolver;)V

    .line 17
    sget-object v1, Lcom/google/android/gms/internal/zzfib;->zzk:Ljava/lang/Object;

    .line 18
    sget-object v2, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 19
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_0

    move-object v3, p0

    .line 20
    :cond_0
    monitor-exit v0

    return-object v3

    .line 21
    :cond_1
    sget-object v2, Lcom/google/android/gms/internal/zzfib;->zzm:[Ljava/lang/String;

    array-length v4, v2

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    const/4 v7, 0x1

    if-ge v6, v4, :cond_8

    aget-object v8, v2, v6

    .line 22
    invoke-virtual {p1, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 23
    sget-boolean v1, Lcom/google/android/gms/internal/zzfib;->zzl:Z

    if-eqz v1, :cond_2

    sget-object v1, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 24
    :cond_2
    sget-object v12, Lcom/google/android/gms/internal/zzfib;->zzm:[Ljava/lang/String;

    .line 25
    sget-object v1, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    .line 26
    sget-object v9, Lcom/google/android/gms/internal/zzfib;->zzd:Landroid/net/Uri;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    move-object v8, p0

    invoke-virtual/range {v8 .. v13}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 27
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-nez p0, :cond_3

    goto :goto_2

    .line 28
    :cond_3
    :goto_1
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 29
    invoke-interface {p0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v4, v6}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 30
    :cond_4
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 31
    :goto_2
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 32
    sput-boolean v7, Lcom/google/android/gms/internal/zzfib;->zzl:Z

    .line 33
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    .line 34
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_5

    move-object v3, p0

    .line 35
    :cond_5
    monitor-exit v0

    return-object v3

    .line 36
    :cond_6
    monitor-exit v0

    return-object v3

    :catchall_0
    move-exception p1

    .line 37
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw p1

    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 38
    :cond_8
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 39
    sget-object v9, Lcom/google/android/gms/internal/zzfib;->zzc:Landroid/net/Uri;

    const/4 v10, 0x0

    const/4 v11, 0x0

    new-array v12, v7, [Ljava/lang/String;

    aput-object p1, v12, v5

    const/4 v13, 0x0

    move-object v8, p0

    invoke-virtual/range {v8 .. v13}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_c

    .line 40
    :try_start_3
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_3

    .line 41
    :cond_9
    invoke-interface {p0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 42
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    move-object v0, v3

    .line 43
    :cond_a
    invoke-static {v1, p1, v0}, Lcom/google/android/gms/internal/zzfib;->zza(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_b

    move-object v3, v0

    .line 44
    :cond_b
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object v3

    .line 45
    :cond_c
    :goto_3
    :try_start_4
    invoke-static {v1, p1, v3}, Lcom/google/android/gms/internal/zzfib;->zza(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz p0, :cond_d

    .line 46
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_d
    return-object v3

    :catchall_1
    move-exception p1

    if-eqz p0, :cond_e

    .line 47
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_e
    throw p1

    :catchall_2
    move-exception p0

    .line 48
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p0
.end method

.method public static zza(Landroid/content/ContentResolver;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/zzfib;->zze:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    .line 4
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfib;->zzk:Ljava/lang/Object;

    .line 5
    sput-boolean v1, Lcom/google/android/gms/internal/zzfib;->zzl:Z

    .line 6
    sget-object v0, Lcom/google/android/gms/internal/zzfib;->zzc:Landroid/net/Uri;

    const/4 v1, 0x1

    new-instance v2, Lcom/google/android/gms/internal/zzfic;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzfic;-><init>()V

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void

    .line 7
    :cond_0
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zze:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 8
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 9
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zzg:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 10
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zzh:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 11
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zzi:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 12
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zzj:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 13
    new-instance p0, Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sput-object p0, Lcom/google/android/gms/internal/zzfib;->zzk:Ljava/lang/Object;

    .line 14
    sput-boolean v1, Lcom/google/android/gms/internal/zzfib;->zzl:Z

    :cond_1
    return-void
.end method

.method public static zza(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 49
    const-class v0, Lcom/google/android/gms/internal/zzfib;

    monitor-enter v0

    .line 50
    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzfib;->zzk:Ljava/lang/Object;

    if-ne p0, v1, :cond_0

    .line 51
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static zza(Ljava/lang/Object;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "TT;>;",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 58
    const-class v0, Lcom/google/android/gms/internal/zzfib;

    monitor-enter v0

    .line 59
    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzfib;->zzk:Ljava/lang/Object;

    if-ne p0, v1, :cond_0

    .line 60
    invoke-virtual {p1, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object p0, Lcom/google/android/gms/internal/zzfib;->zzf:Ljava/util/HashMap;

    invoke-virtual {p0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
