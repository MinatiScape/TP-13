.class public Lcom/google/android/gms/clearcut/Counters;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/clearcut/Counters$TimerHistogram;,
        Lcom/google/android/gms/clearcut/Counters$LongHistogram;,
        Lcom/google/android/gms/clearcut/Counters$zza;,
        Lcom/google/android/gms/clearcut/Counters$Alias;,
        Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;,
        Lcom/google/android/gms/clearcut/Counters$BooleanHistogram;,
        Lcom/google/android/gms/clearcut/Counters$Counter;,
        Lcom/google/android/gms/clearcut/Counters$zzb;,
        Lcom/google/android/gms/clearcut/Counters$AbstractCounter;,
        Lcom/google/android/gms/clearcut/Counters$LogEventModifier;
    }
.end annotation


# static fields
.field public static final zza:Ljava/nio/charset/Charset;

.field public static final zzs:Ljava/util/Comparator;


# instance fields
.field public final zzc:Ljava/lang/String;

.field public final zzd:I

.field public final zze:Lcom/google/android/gms/common/util/Clock;

.field public zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

.field public zzk:J

.field public final zzl:Lcom/google/android/gms/clearcut/ClearcutLogger;

.field public final zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field public zzn:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/clearcut/Counters$AbstractCounter;",
            ">;"
        }
    .end annotation
.end field

.field public zzp:Ljava/lang/Integer;

.field public zzq:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap<",
            "[B",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const-string v0, "UTF-8"

    .line 1
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/clearcut/Counters;->zza:Ljava/nio/charset/Charset;

    .line 2
    new-instance v0, Lcom/google/android/gms/clearcut/zzp;

    invoke-direct {v0}, Lcom/google/android/gms/clearcut/zzp;-><init>()V

    sput-object v0, Lcom/google/android/gms/clearcut/Counters;->zzs:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/clearcut/ClearcutLogger;Ljava/lang/String;ILcom/google/android/gms/common/util/Clock;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 3
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzp:Ljava/lang/Integer;

    .line 5
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Lcom/google/android/gms/clearcut/Counters;->zzs:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    const-string v0, "null reference"

    .line 6
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    if-lez p3, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 8
    :goto_0
    invoke-static {v1}, Landroidx/preference/R$string;->zzb(Z)V

    .line 9
    invoke-static {p4, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    iput-object p1, p0, Lcom/google/android/gms/clearcut/Counters;->zzl:Lcom/google/android/gms/clearcut/ClearcutLogger;

    .line 11
    iput-object p2, p0, Lcom/google/android/gms/clearcut/Counters;->zzc:Ljava/lang/String;

    .line 12
    iput p3, p0, Lcom/google/android/gms/clearcut/Counters;->zzd:I

    .line 13
    iput-object p4, p0, Lcom/google/android/gms/clearcut/Counters;->zze:Lcom/google/android/gms/common/util/Clock;

    .line 14
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    .line 15
    iput-wide p1, p0, Lcom/google/android/gms/clearcut/Counters;->zzk:J

    return-void
.end method


# virtual methods
.method public getCounter(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$Counter;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;

    if-nez v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 4
    :try_start_1
    new-instance v0, Lcom/google/android/gms/clearcut/Counters$Counter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/gms/clearcut/Counters$Counter;-><init>(Lcom/google/android/gms/clearcut/Counters;Ljava/lang/String;Lcom/google/android/gms/clearcut/zzp;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 5
    :try_start_2
    iget-object p1, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 6
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    return-object v0

    :catchall_0
    move-exception p1

    .line 7
    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 8
    :cond_0
    :try_start_4
    check-cast v0, Lcom/google/android/gms/clearcut/Counters$Counter;
    :try_end_4
    .catch Ljava/lang/ClassCastException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 9
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    return-object v0

    .line 10
    :catch_0
    :try_start_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "another type of counter exists with name: "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    .line 11
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw p1
.end method

.method public getIntegerHistogram(Ljava/lang/String;)Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;

    if-nez v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 4
    :try_start_1
    new-instance v0, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;-><init>(Lcom/google/android/gms/clearcut/Counters;Ljava/lang/String;Lcom/google/android/gms/clearcut/zzp;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 5
    :try_start_2
    iget-object p1, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 6
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    return-object v0

    :catchall_0
    move-exception p1

    .line 7
    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 8
    :cond_0
    :try_start_4
    check-cast v0, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;
    :try_end_4
    .catch Ljava/lang/ClassCastException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 9
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    return-object v0

    .line 10
    :catch_0
    :try_start_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "another type of counter exists with name: "

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    .line 11
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw p1
.end method

.method public logAllAsync(Lcom/google/android/gms/clearcut/Counters$LogEventModifier;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/clearcut/Counters;->snapshotAndReset()Lcom/google/android/gms/clearcut/Counters;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 4
    iget-object p0, v0, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    invoke-virtual {p0}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    new-array v2, v1, [Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;

    .line 6
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    add-int/lit8 v6, v4, 0x1

    .line 7
    new-instance v7, Lcom/google/android/gms/clearcut/Counters$zzb;

    invoke-direct {v7, v0, v5}, Lcom/google/android/gms/clearcut/Counters$zzb;-><init>(Lcom/google/android/gms/clearcut/Counters;[B)V

    .line 8
    aput-object v7, v2, v4

    move v4, v6

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    move-object v4, p0

    :goto_1
    if-ge v3, v1, :cond_2

    .line 9
    aget-object v4, v2, v3

    .line 10
    iget-object v5, v0, Lcom/google/android/gms/clearcut/Counters;->zzl:Lcom/google/android/gms/clearcut/ClearcutLogger;

    .line 11
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    new-instance v6, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;

    .line 13
    invoke-direct {v6, v5, p0, v4}, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;-><init>(Lcom/google/android/gms/clearcut/ClearcutLogger;[BLcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;)V

    .line 14
    iget-object v4, v0, Lcom/google/android/gms/clearcut/Counters;->zzc:Ljava/lang/String;

    .line 15
    iput-object v4, v6, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->zzb:Ljava/lang/String;

    if-eqz p1, :cond_1

    .line 16
    invoke-interface {p1, v6}, Lcom/google/android/gms/clearcut/Counters$LogEventModifier;->modify(Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;)Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;

    move-result-object v6

    .line 17
    :cond_1
    invoke-virtual {v6}, Lcom/google/android/gms/clearcut/ClearcutLogger$LogEventBuilder;->logAsync()Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    if-eqz v4, :cond_3

    goto :goto_2

    .line 18
    :cond_3
    sget-object p1, Lcom/google/android/gms/common/api/Status;->zza:Lcom/google/android/gms/common/api/Status;

    const-string v0, "Result must not be null"

    .line 19
    invoke-static {p1, v0}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    new-instance v0, Lcom/google/android/gms/common/api/internal/zzdh;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/api/internal/zzdh;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 21
    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zza(Lcom/google/android/gms/common/api/Result;)V

    :goto_2
    return-void

    :catchall_0
    move-exception p1

    .line 22
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw p1
.end method

.method public snapshotAndReset()Lcom/google/android/gms/clearcut/Counters;
    .locals 7

    .line 1
    new-instance v0, Lcom/google/android/gms/clearcut/Counters;

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters;->zzl:Lcom/google/android/gms/clearcut/ClearcutLogger;

    iget-object v2, p0, Lcom/google/android/gms/clearcut/Counters;->zzc:Ljava/lang/String;

    iget v3, p0, Lcom/google/android/gms/clearcut/Counters;->zzd:I

    iget-object v4, p0, Lcom/google/android/gms/clearcut/Counters;->zze:Lcom/google/android/gms/common/util/Clock;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/gms/clearcut/Counters;-><init>(Lcom/google/android/gms/clearcut/ClearcutLogger;Ljava/lang/String;ILcom/google/android/gms/common/util/Clock;)V

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    .line 4
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 5
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/clearcut/Counters;->zzp:Ljava/lang/Integer;

    iput-object v2, v0, Lcom/google/android/gms/clearcut/Counters;->zzp:Ljava/lang/Integer;

    .line 6
    iget-wide v2, p0, Lcom/google/android/gms/clearcut/Counters;->zzk:J

    iput-wide v2, v0, Lcom/google/android/gms/clearcut/Counters;->zzk:J

    .line 7
    iget-object v2, p0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    iput-object v2, v0, Lcom/google/android/gms/clearcut/Counters;->zzf:Lcom/google/android/gms/clearcut/Counters$LogEventModifier;

    .line 8
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    iput-object v2, v0, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    .line 9
    iget-object v2, p0, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 10
    iget-object v4, v0, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;

    const/4 v6, 0x1

    invoke-virtual {v0, v3, v6}, Lcom/google/android/gms/clearcut/Counters;->zza(Lcom/google/android/gms/clearcut/Counters$AbstractCounter;Z)Lcom/google/android/gms/clearcut/Counters$AbstractCounter;

    move-result-object v3

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 11
    :cond_0
    iget-object v2, v0, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    .line 12
    iget-object v3, p0, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    iput-object v3, v0, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    .line 13
    iput-object v2, p0, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    const/4 v2, 0x0

    .line 14
    iput-object v2, p0, Lcom/google/android/gms/clearcut/Counters;->zzp:Ljava/lang/Integer;

    .line 15
    iget-object v2, v0, Lcom/google/android/gms/clearcut/Counters;->zze:Lcom/google/android/gms/common/util/Clock;

    check-cast v2, Lcom/google/android/gms/common/util/zzh;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 17
    iput-wide v2, p0, Lcom/google/android/gms/clearcut/Counters;->zzk:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_0
    move-exception p0

    .line 19
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    :try_start_0
    const-string v1, "{"

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    invoke-virtual {v1}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 5
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    const-string v2, "null"

    goto :goto_1

    :cond_0
    new-instance v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([B)V

    move-object v2, v3

    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", "

    .line 6
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    const-string v1, "}\n"

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;

    .line 9
    invoke-virtual {v2}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 11
    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 12
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception v0

    .line 13
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v0
.end method

.method public final zza(Lcom/google/android/gms/clearcut/Counters$AbstractCounter;Z)Lcom/google/android/gms/clearcut/Counters$AbstractCounter;
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/clearcut/Counters$Counter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/gms/clearcut/Counters$Counter;

    check-cast p1, Lcom/google/android/gms/clearcut/Counters$Counter;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/google/android/gms/clearcut/Counters$Counter;-><init>(Lcom/google/android/gms/clearcut/Counters;Lcom/google/android/gms/clearcut/Counters$Counter;ZLcom/google/android/gms/clearcut/zzp;)V

    return-object v0

    .line 3
    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/clearcut/Counters$TimerHistogram;

    if-eqz v0, :cond_1

    .line 4
    new-instance v0, Lcom/google/android/gms/clearcut/Counters$TimerHistogram;

    check-cast p1, Lcom/google/android/gms/clearcut/Counters$TimerHistogram;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/google/android/gms/clearcut/Counters$TimerHistogram;-><init>(Lcom/google/android/gms/clearcut/Counters;Lcom/google/android/gms/clearcut/Counters$TimerHistogram;ZLcom/google/android/gms/clearcut/zzp;)V

    return-object v0

    .line 5
    :cond_1
    instance-of v0, p1, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    if-eqz v0, :cond_2

    .line 6
    new-instance v0, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    check-cast p1, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;-><init>(Lcom/google/android/gms/clearcut/Counters;Lcom/google/android/gms/clearcut/Counters$IntegerHistogram;ZLcom/google/android/gms/clearcut/zzp;)V

    return-object v0

    .line 7
    :cond_2
    instance-of v0, p1, Lcom/google/android/gms/clearcut/Counters$LongHistogram;

    if-eqz v0, :cond_3

    .line 8
    new-instance v0, Lcom/google/android/gms/clearcut/Counters$LongHistogram;

    check-cast p1, Lcom/google/android/gms/clearcut/Counters$LongHistogram;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/google/android/gms/clearcut/Counters$LongHistogram;-><init>(Lcom/google/android/gms/clearcut/Counters;Lcom/google/android/gms/clearcut/Counters$LongHistogram;ZLcom/google/android/gms/clearcut/zzp;)V

    return-object v0

    .line 9
    :cond_3
    instance-of v0, p1, Lcom/google/android/gms/clearcut/Counters$BooleanHistogram;

    if-eqz v0, :cond_4

    .line 10
    new-instance v0, Lcom/google/android/gms/clearcut/Counters$BooleanHistogram;

    check-cast p1, Lcom/google/android/gms/clearcut/Counters$BooleanHistogram;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/google/android/gms/clearcut/Counters$BooleanHistogram;-><init>(Lcom/google/android/gms/clearcut/Counters;Lcom/google/android/gms/clearcut/Counters$BooleanHistogram;ZLcom/google/android/gms/clearcut/zzp;)V

    return-object v0

    .line 11
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    add-int/lit8 p2, p2, 0x15

    const-string v0, "Unkown counter type: "

    invoke-static {p2, v0, p1}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
