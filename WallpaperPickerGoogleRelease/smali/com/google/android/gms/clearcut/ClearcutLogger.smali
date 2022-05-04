.class public final Lcom/google/android/gms/clearcut/ClearcutLogger;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;,
        Lcom/google/android/gms/clearcut/ClearcutLogger$TimeZoneOffsetProvider;,
        Lcom/google/android/gms/clearcut/ClearcutLogger$LogSampler;,
        Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;
    }
.end annotation


# static fields
.field public static final API:Lcom/google/android/gms/common/api/Api;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api<",
            "*>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final zzc:[Lcom/google/android/gms/phenotype/ExperimentTokens;

.field public static final zzd:[Ljava/lang/String;

.field public static final zze:[[B


# instance fields
.field public final zzf:Ljava/lang/String;

.field public final zzg:I

.field public zzh:Ljava/lang/String;

.field public zzi:I

.field public zzj:Ljava/lang/String;

.field public final zzn:Lcom/google/android/gms/clearcut/ClearcutLoggerApi;

.field public final zzo:Lcom/google/android/gms/common/util/Clock;

.field public zzp:Lcom/google/android/gms/clearcut/ClearcutLogger$TimeZoneOffsetProvider;

.field public final zzq:Lcom/google/android/gms/clearcut/ClearcutLogger$LogSampler;


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/gms/common/api/Api$ClientKey;

    invoke-direct {v0}, Lcom/google/android/gms/common/api/Api$ClientKey;-><init>()V

    .line 2
    new-instance v1, Lcom/google/android/gms/clearcut/zzd;

    invoke-direct {v1}, Lcom/google/android/gms/clearcut/zzd;-><init>()V

    .line 3
    new-instance v2, Lcom/google/android/gms/common/api/Api;

    const-string v3, "ClearcutLogger.API"

    invoke-direct {v2, v3, v1, v0}, Lcom/google/android/gms/common/api/Api;-><init>(Ljava/lang/String;Lcom/google/android/gms/common/api/Api$zza;Lcom/google/android/gms/common/api/Api$ClientKey;)V

    sput-object v2, Lcom/google/android/gms/clearcut/ClearcutLogger;->API:Lcom/google/android/gms/common/api/Api;

    const/4 v0, 0x0

    new-array v1, v0, [Lcom/google/android/gms/phenotype/ExperimentTokens;

    .line 4
    sput-object v1, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzc:[Lcom/google/android/gms/phenotype/ExperimentTokens;

    new-array v1, v0, [Ljava/lang/String;

    .line 5
    sput-object v1, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzd:[Ljava/lang/String;

    new-array v0, v0, [[B

    .line 6
    sput-object v0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zze:[[B

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    new-instance p3, Lcom/google/android/gms/clearcut/internal/zzb;

    invoke-direct {p3, p1}, Lcom/google/android/gms/clearcut/internal/zzb;-><init>(Landroid/content/Context;)V

    .line 2
    sget-object v0, Lcom/google/android/gms/common/util/zzh;->zza:Lcom/google/android/gms/common/util/zzh;

    new-instance v1, Lcom/google/android/gms/clearcut/internal/zzs;

    invoke-direct {v1, p1}, Lcom/google/android/gms/clearcut/internal/zzs;-><init>(Landroid/content/Context;)V

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v2, -0x1

    .line 4
    iput v2, p0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzi:I

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzf:Ljava/lang/String;

    const/4 v3, 0x0

    .line 6
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    iget v3, p1, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v4, "ClearcutLogger"

    const-string v5, "This can\'t happen."

    .line 7
    invoke-static {v4, v5, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 8
    :goto_0
    iput v3, p0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzg:I

    .line 9
    iput v2, p0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzi:I

    .line 10
    iput-object p2, p0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzh:Ljava/lang/String;

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzj:Ljava/lang/String;

    .line 12
    iput-object p3, p0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzn:Lcom/google/android/gms/clearcut/ClearcutLoggerApi;

    .line 13
    iput-object v0, p0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzo:Lcom/google/android/gms/common/util/Clock;

    .line 14
    new-instance p1, Lcom/google/android/gms/clearcut/ClearcutLogger$TimeZoneOffsetProvider;

    invoke-direct {p1}, Lcom/google/android/gms/clearcut/ClearcutLogger$TimeZoneOffsetProvider;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzp:Lcom/google/android/gms/clearcut/ClearcutLogger$TimeZoneOffsetProvider;

    .line 15
    iput-object v1, p0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzq:Lcom/google/android/gms/clearcut/ClearcutLogger$LogSampler;

    return-void
.end method
