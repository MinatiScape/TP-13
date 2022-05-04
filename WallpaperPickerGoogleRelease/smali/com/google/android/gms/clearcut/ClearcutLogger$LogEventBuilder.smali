.class public Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/clearcut/ClearcutLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LogEventBuilder"
.end annotation


# instance fields
.field public zza:I

.field public zzb:Ljava/lang/String;

.field public zzc:Ljava/lang/String;

.field public zzd:Ljava/lang/String;

.field public final zzf:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

.field public zzm:Z

.field public final zzn:Lcom/google/android/gms/internal/zzgsv;

.field public zzo:Z

.field public final synthetic zzp:Lcom/google/android/gms/clearcut/ClearcutLogger;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/clearcut/ClearcutLogger;[BLcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzp:Lcom/google/android/gms/clearcut/ClearcutLogger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iget v0, p1, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzi:I

    .line 3
    iput v0, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zza:I

    .line 4
    iget-object v0, p1, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzh:Ljava/lang/String;

    .line 5
    iput-object v0, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzb:Ljava/lang/String;

    .line 6
    iget-object v0, p1, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzj:Ljava/lang/String;

    .line 7
    iput-object v0, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzc:Ljava/lang/String;

    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzd:Ljava/lang/String;

    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzm:Z

    .line 10
    new-instance v1, Lcom/google/android/gms/internal/zzgsv;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzgsv;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzn:Lcom/google/android/gms/internal/zzgsv;

    const/4 v2, 0x0

    .line 11
    iput-boolean v2, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzo:Z

    .line 12
    iget-object v2, p1, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzj:Ljava/lang/String;

    .line 13
    iput-object v2, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzc:Ljava/lang/String;

    .line 14
    iput-object v0, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzd:Ljava/lang/String;

    .line 15
    iget-object v0, p1, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzo:Lcom/google/android/gms/common/util/Clock;

    .line 16
    check-cast v0, Lcom/google/android/gms/common/util/zzh;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 18
    iput-wide v2, v1, Lcom/google/android/gms/internal/zzgsv;->zza:J

    .line 19
    iget-object v0, p1, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzo:Lcom/google/android/gms/common/util/Clock;

    .line 20
    check-cast v0, Lcom/google/android/gms/common/util/zzh;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 22
    iput-wide v2, v1, Lcom/google/android/gms/internal/zzgsv;->zzb:J

    .line 23
    iget-object p1, p1, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzp:Lcom/google/android/gms/clearcut/ClearcutLogger$TimeZoneOffsetProvider;

    .line 24
    iget-wide v2, v1, Lcom/google/android/gms/internal/zzgsv;->zza:J

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object p1

    invoke-virtual {p1, v2, v3}, Ljava/util/TimeZone;->getOffset(J)I

    move-result p1

    div-int/lit16 p1, p1, 0x3e8

    int-to-long v2, p1

    .line 26
    iput-wide v2, v1, Lcom/google/android/gms/internal/zzgsv;->zzg:J

    if-eqz p2, :cond_0

    .line 27
    iput-object p2, v1, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    .line 28
    :cond_0
    iput-object p3, p0, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzf:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    return-void
.end method


# virtual methods
.method public logAsync()Lcom/google/android/gms/common/api/PendingResult;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/common/api/PendingResult<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    move-object/from16 v1, p0

    .line 1
    iget-boolean v0, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzo:Z

    if-nez v0, :cond_1f

    const/4 v2, 0x1

    .line 2
    iput-boolean v2, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzo:Z

    .line 3
    new-instance v14, Lcom/google/android/gms/clearcut/LogEventParcelable;

    new-instance v0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    iget-object v3, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzp:Lcom/google/android/gms/clearcut/ClearcutLogger;

    .line 4
    iget-object v4, v3, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzf:Ljava/lang/String;

    .line 5
    iget v5, v3, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzg:I

    .line 6
    iget v6, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zza:I

    iget-object v7, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzb:Ljava/lang/String;

    iget-object v8, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzc:Ljava/lang/String;

    iget-object v9, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzd:Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v3, v0

    .line 7
    invoke-direct/range {v3 .. v11}, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V

    iget-object v5, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzn:Lcom/google/android/gms/internal/zzgsv;

    iget-object v6, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzf:Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    const/4 v7, 0x0

    const/4 v15, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 8
    iget-boolean v13, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzm:Z

    move-object v3, v14

    move-object v4, v0

    invoke-direct/range {v3 .. v13}, Lcom/google/android/gms/clearcut/LogEventParcelable;-><init>(Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;Lcom/google/android/gms/internal/zzgsv;Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;[I[Ljava/lang/String;[I[[B[Lcom/google/android/gms/phenotype/ExperimentTokens;Z)V

    .line 9
    iget-object v0, v14, Lcom/google/android/gms/clearcut/LogEventParcelable;->playLoggerContext:Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    .line 10
    iget-object v3, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzp:Lcom/google/android/gms/clearcut/ClearcutLogger;

    .line 11
    iget-object v3, v3, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzq:Lcom/google/android/gms/clearcut/ClearcutLogger$LogSampler;

    .line 12
    iget-object v4, v0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSourceName:Ljava/lang/String;

    iget v0, v0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSource:I

    check-cast v3, Lcom/google/android/gms/clearcut/internal/zzs;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v4, :cond_0

    .line 13
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    goto :goto_0

    :cond_0
    if-ltz v0, :cond_1

    .line 14
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_1
    move-object v4, v15

    :goto_0
    if-nez v4, :cond_2

    goto/16 :goto_16

    .line 15
    :cond_2
    iget-object v0, v3, Lcom/google/android/gms/clearcut/internal/zzs;->zzc:Landroid/content/Context;

    if-eqz v0, :cond_b

    invoke-static {v0}, Lcom/google/android/gms/clearcut/internal/zzs;->zza(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_3

    .line 16
    :cond_3
    sget-object v0, Lcom/google/android/gms/clearcut/internal/zzs;->zzd:Ljava/util/Map;

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzfis;

    if-nez v0, :cond_4

    .line 17
    sget-object v0, Lcom/google/android/gms/clearcut/internal/zzs;->zzb:Lcom/google/android/gms/internal/zzfiz;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    sget-object v5, Lcom/google/android/gms/internal/zzfis;->zzb:Ljava/lang/Object;

    .line 19
    new-instance v5, Lcom/google/android/gms/internal/zzfix;

    invoke-direct {v5, v0, v4, v15}, Lcom/google/android/gms/internal/zzfix;-><init>(Lcom/google/android/gms/internal/zzfiz;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    sget-object v0, Lcom/google/android/gms/clearcut/internal/zzs;->zzd:Ljava/util/Map;

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v5

    .line 21
    :cond_4
    sget-boolean v4, Lcom/google/android/gms/internal/zzfis;->zzd:Z

    if-eqz v4, :cond_5

    .line 22
    iget-object v0, v0, Lcom/google/android/gms/internal/zzfis;->zzi:Ljava/lang/Object;

    goto :goto_2

    .line 23
    :cond_5
    sget-object v4, Lcom/google/android/gms/internal/zzfis;->zzc:Landroid/content/Context;

    if-eqz v4, :cond_a

    .line 24
    iget-object v4, v0, Lcom/google/android/gms/internal/zzfis;->zzg:Lcom/google/android/gms/internal/zzfiz;

    .line 25
    iget-boolean v4, v4, Lcom/google/android/gms/internal/zzfiz;->zzf:Z

    if-eqz v4, :cond_7

    .line 26
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfis;->zzf()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_6

    goto :goto_1

    .line 27
    :cond_6
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfis;->zze()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_9

    goto :goto_1

    .line 28
    :cond_7
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfis;->zze()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_8

    :goto_1
    move-object v0, v4

    goto :goto_2

    .line 29
    :cond_8
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfis;->zzf()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_9

    goto :goto_1

    .line 30
    :cond_9
    iget-object v0, v0, Lcom/google/android/gms/internal/zzfis;->zzi:Ljava/lang/Object;

    .line 31
    :goto_2
    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    goto :goto_4

    .line 32
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must call PhenotypeFlag.init() first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b
    :goto_3
    move-object v4, v15

    :goto_4
    const/16 v5, 0x48

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    if-nez v4, :cond_c

    goto :goto_7

    :cond_c
    const/16 v0, 0x2c

    .line 33
    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_d

    .line 34
    invoke-virtual {v4, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    add-int/2addr v0, v2

    goto :goto_5

    :cond_d
    const-string v9, ""

    move v0, v6

    :goto_5
    move-object/from16 v17, v9

    const/16 v9, 0x2f

    .line 35
    invoke-virtual {v4, v9, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v9

    const-string v10, "LogSamplerImpl"

    if-gtz v9, :cond_f

    const-string v0, "Failed to parse the rule: "

    .line 36
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_e

    invoke-virtual {v0, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    :cond_e
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v0, v4

    :goto_6
    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_7
    move-object v13, v3

    goto :goto_b

    .line 37
    :cond_f
    :try_start_0
    invoke-virtual {v4, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v11

    add-int/2addr v9, v2

    .line 38
    invoke-virtual {v4, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    move-object v13, v3

    :try_start_1
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    cmp-long v0, v11, v7

    if-ltz v0, :cond_11

    cmp-long v0, v2, v7

    if-gez v0, :cond_10

    goto :goto_8

    .line 39
    :cond_10
    new-instance v0, Lcom/google/android/gms/clearcut/internal/zzt;

    move-object/from16 v16, v0

    move-wide/from16 v18, v11

    move-wide/from16 v20, v2

    invoke-direct/range {v16 .. v21}, Lcom/google/android/gms/clearcut/internal/zzt;-><init>(Ljava/lang/String;JJ)V

    goto :goto_c

    .line 40
    :cond_11
    :goto_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "negative values not supported: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b

    :catch_0
    move-exception v0

    goto :goto_9

    :catch_1
    move-exception v0

    move-object v13, v3

    :goto_9
    const-string v2, "parseLong() failed while parsing: "

    .line 41
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_12

    invoke-virtual {v2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_a

    :cond_12
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v2, v3

    :goto_a
    invoke-static {v10, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_b
    move-object v0, v15

    :goto_c
    if-nez v0, :cond_13

    goto/16 :goto_15

    .line 42
    :cond_13
    iget-object v2, v0, Lcom/google/android/gms/clearcut/internal/zzt;->zza:Ljava/lang/String;

    iget-object v3, v13, Lcom/google/android/gms/clearcut/internal/zzs;->zzc:Landroid/content/Context;

    .line 43
    sget-object v4, Lcom/google/android/gms/clearcut/internal/zzs;->zzf:Ljava/lang/Long;

    if-nez v4, :cond_18

    if-eqz v3, :cond_17

    .line 44
    invoke-static {v3}, Lcom/google/android/gms/clearcut/internal/zzs;->zza(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 45
    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "android_id"

    sget-object v10, Lcom/google/android/gms/internal/zzfib;->zzc:Landroid/net/Uri;

    .line 46
    const-class v10, Lcom/google/android/gms/internal/zzfib;

    monitor-enter v10

    .line 47
    :try_start_2
    invoke-static {v3}, Lcom/google/android/gms/internal/zzfib;->zza(Landroid/content/ContentResolver;)V

    .line 48
    sget-object v11, Lcom/google/android/gms/internal/zzfib;->zzk:Ljava/lang/Object;

    monitor-exit v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    sget-object v10, Lcom/google/android/gms/internal/zzfib;->zzi:Ljava/util/HashMap;

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-static {v10, v4, v12}, Lcom/google/android/gms/internal/zzfib;->zza(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    if-eqz v10, :cond_14

    .line 50
    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    goto :goto_f

    .line 51
    :cond_14
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/zzfib;->zza(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_15

    goto :goto_d

    .line 52
    :cond_15
    :try_start_3
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    .line 53
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_e

    :catch_2
    :goto_d
    move-wide v12, v7

    .line 54
    :goto_e
    sget-object v3, Lcom/google/android/gms/internal/zzfib;->zzi:Ljava/util/HashMap;

    invoke-static {v11, v3, v4, v10}, Lcom/google/android/gms/internal/zzfib;->zza(Ljava/lang/Object;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Object;)V

    move-wide v3, v12

    .line 55
    :goto_f
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    sput-object v3, Lcom/google/android/gms/clearcut/internal/zzs;->zzf:Ljava/lang/Long;

    goto :goto_10

    :catchall_0
    move-exception v0

    .line 56
    :try_start_4
    monitor-exit v10
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    .line 57
    :cond_16
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    sput-object v3, Lcom/google/android/gms/clearcut/internal/zzs;->zzf:Ljava/lang/Long;

    goto :goto_10

    :cond_17
    move-wide v3, v7

    goto :goto_11

    .line 58
    :cond_18
    :goto_10
    sget-object v3, Lcom/google/android/gms/clearcut/internal/zzs;->zzf:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    :goto_11
    const/16 v10, 0x8

    if-eqz v2, :cond_1a

    .line 59
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_19

    goto :goto_12

    .line 60
    :cond_19
    sget-object v11, Lcom/google/android/gms/clearcut/internal/zzs;->zza:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v11}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 61
    array-length v11, v2

    add-int/2addr v11, v10

    invoke-static {v11}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 62
    invoke-virtual {v10, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 63
    invoke-virtual {v10, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 64
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-static {v2}, Lkotlin/text/CharsKt__CharKt;->zza([B)J

    move-result-wide v2

    goto :goto_13

    .line 65
    :cond_1a
    :goto_12
    invoke-static {v10}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-static {v2}, Lkotlin/text/CharsKt__CharKt;->zza([B)J

    move-result-wide v2

    .line 66
    :goto_13
    iget-wide v10, v0, Lcom/google/android/gms/clearcut/internal/zzt;->zzb:J

    iget-wide v12, v0, Lcom/google/android/gms/clearcut/internal/zzt;->zzc:J

    cmp-long v0, v10, v7

    if-ltz v0, :cond_1e

    cmp-long v0, v12, v7

    if-ltz v0, :cond_1e

    if-lez v0, :cond_1c

    cmp-long v0, v2, v7

    if-ltz v0, :cond_1b

    .line 67
    rem-long/2addr v2, v12

    goto :goto_14

    :cond_1b
    const-wide v4, 0x7fffffffffffffffL

    .line 68
    rem-long v7, v4, v12

    const-wide/16 v16, 0x1

    add-long v7, v7, v16

    and-long/2addr v2, v4

    rem-long/2addr v2, v12

    add-long/2addr v2, v7

    rem-long/2addr v2, v12

    :goto_14
    cmp-long v0, v2, v10

    if-gez v0, :cond_1c

    :goto_15
    const/4 v2, 0x1

    goto :goto_16

    :cond_1c
    move v2, v6

    :goto_16
    if-eqz v2, :cond_1d

    .line 69
    iget-object v0, v1, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzp:Lcom/google/android/gms/clearcut/ClearcutLogger;

    .line 70
    iget-object v0, v0, Lcom/google/android/gms/clearcut/ClearcutLogger;->zzn:Lcom/google/android/gms/clearcut/ClearcutLoggerApi;

    .line 71
    check-cast v0, Lcom/google/android/gms/clearcut/internal/zzb;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    new-instance v1, Lcom/google/android/gms/clearcut/internal/zzg;

    .line 73
    iget-object v2, v0, Lcom/google/android/gms/common/api/GoogleApi;->zzh:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 74
    invoke-direct {v1, v14, v2}, Lcom/google/android/gms/clearcut/internal/zzg;-><init>(Lcom/google/android/gms/clearcut/LogEventParcelable;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    const/4 v2, 0x2

    .line 75
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/api/GoogleApi;->zza(ILcom/google/android/gms/common/api/internal/zzn;)Lcom/google/android/gms/common/api/internal/zzn;

    return-object v1

    .line 76
    :cond_1d
    sget-object v0, Lcom/google/android/gms/common/api/Status;->zza:Lcom/google/android/gms/common/api/Status;

    const-string v1, "Result must not be null"

    .line 77
    invoke-static {v0, v1}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    new-instance v1, Lcom/google/android/gms/common/api/internal/zzdh;

    invoke-direct {v1, v15}, Lcom/google/android/gms/common/api/internal/zzdh;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 79
    invoke-virtual {v1, v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zza(Lcom/google/android/gms/common/api/Result;)V

    return-object v1

    .line 80
    :cond_1e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "negative values not supported: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_1f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "do not reuse LogEventBuilder"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
