.class public final Lcom/google/android/gms/clearcut/internal/zzs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/clearcut/ClearcutLogger$LogSampler;


# static fields
.field public static final zza:Ljava/nio/charset/Charset;

.field public static final zzb:Lcom/google/android/gms/internal/zzfiz;

.field public static zzd:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzfis<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static zze:Ljava/lang/Boolean;

.field public static zzf:Ljava/lang/Long;


# instance fields
.field public final zzc:Landroid/content/Context;


# direct methods
.method public static constructor <clinit>()V
    .locals 8

    const-string v0, "UTF-8"

    .line 1
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/clearcut/internal/zzs;->zza:Ljava/nio/charset/Charset;

    .line 2
    sget v0, Lcom/google/android/gms/phenotype/Phenotype;->$r8$clinit:I

    const-string v0, "com.google.android.gms.clearcut.public"

    .line 3
    invoke-static {v0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, "content://com.google.android.gms.phenotype/"

    if-eqz v1, :cond_0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v2, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 4
    new-instance v0, Lcom/google/android/gms/internal/zzfiz;

    const-string v4, "gms:playlog:service:sampling_"

    const-string v5, "LogSampling__"

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/internal/zzfiz;-><init>(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 5
    sput-object v0, Lcom/google/android/gms/clearcut/internal/zzs;->zzb:Lcom/google/android/gms/internal/zzfiz;

    const/4 v0, 0x0

    .line 6
    sput-object v0, Lcom/google/android/gms/clearcut/internal/zzs;->zzd:Ljava/util/Map;

    .line 7
    sput-object v0, Lcom/google/android/gms/clearcut/internal/zzs;->zze:Ljava/lang/Boolean;

    .line 8
    sput-object v0, Lcom/google/android/gms/clearcut/internal/zzs;->zzf:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/clearcut/internal/zzs;->zzc:Landroid/content/Context;

    .line 3
    sget-object p0, Lcom/google/android/gms/clearcut/internal/zzs;->zzd:Ljava/util/Map;

    if-nez p0, :cond_0

    .line 4
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    sput-object p0, Lcom/google/android/gms/clearcut/internal/zzs;->zzd:Ljava/util/Map;

    :cond_0
    if-eqz p1, :cond_4

    .line 5
    sget-object p0, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    if-nez p0, :cond_4

    sget-boolean p0, Lcom/google/android/gms/internal/zzfis;->zzd:Z

    if-nez p0, :cond_4

    .line 6
    sget-object p0, Lcom/google/android/gms/internal/zzfis;->zzb:Ljava/lang/Object;

    monitor-enter p0

    .line 7
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->isDeviceProtectedStorage()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 8
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    move-object p1, v0

    .line 9
    :goto_0
    sget-object v0, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    if-eq v0, p1, :cond_3

    const/4 v0, 0x0

    .line 10
    sput-object v0, Lcom/google/android/gms/internal/zzfis;->zze:Ljava/lang/Boolean;

    .line 11
    :cond_3
    sput-object p1, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    .line 12
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p0, 0x0

    .line 13
    sput-boolean p0, Lcom/google/android/gms/internal/zzfis;->zzd:Z

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 14
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_4
    :goto_1
    return-void
.end method

.method public static zza(Landroid/content/Context;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/clearcut/internal/zzs;->zze:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    .line 2
    invoke-static {p0}, Lcom/google/android/gms/internal/zzbmk;->zza(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbmj;

    move-result-object p0

    .line 3
    iget-object p0, p0, Lcom/google/android/gms/internal/zzbmj;->zza:Landroid/content/Context;

    const-string v0, "com.google.android.providers.gsf.permission.READ_GSERVICES"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 4
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    sput-object p0, Lcom/google/android/gms/clearcut/internal/zzs;->zze:Ljava/lang/Boolean;

    .line 5
    :cond_1
    sget-object p0, Lcom/google/android/gms/clearcut/internal/zzs;->zze:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method
