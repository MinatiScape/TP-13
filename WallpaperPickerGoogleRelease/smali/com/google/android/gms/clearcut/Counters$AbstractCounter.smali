.class public Lcom/google/android/gms/clearcut/Counters$AbstractCounter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/clearcut/Counters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "AbstractCounter"
.end annotation


# instance fields
.field public zza:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "[J>;>;"
        }
    .end annotation
.end field

.field public final zzb:Ljava/lang/String;

.field public zzc:I

.field public final zze:Ljava/lang/Object;

.field public final synthetic zzf:Lcom/google/android/gms/clearcut/Counters;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/clearcut/Counters;Lcom/google/android/gms/clearcut/Counters$AbstractCounter;Z)V
    .locals 8

    .line 1
    iget-object v0, p2, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzb:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;-><init>(Lcom/google/android/gms/clearcut/Counters;Ljava/lang/String;)V

    .line 2
    iget-object p1, p2, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zze:Ljava/lang/Object;

    monitor-enter p1

    .line 3
    :try_start_0
    iget v0, p2, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzc:I

    iput v0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzc:I

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    .line 4
    iget-object p3, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    .line 5
    iget-object v1, p2, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    iput-object v1, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    .line 6
    iput-object p3, p2, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    .line 7
    iput v0, p2, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzc:I

    .line 8
    monitor-exit p1

    return-void

    .line 9
    :cond_0
    new-instance p3, Ljava/util/HashMap;

    iget-object v1, p2, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {p3, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object p3, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    .line 10
    iget-object p2, p2, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Map$Entry;

    .line 11
    new-instance v1, Ljava/util/HashMap;

    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 12
    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 13
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    const/4 v5, 0x1

    new-array v5, v5, [J

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [J

    aget-wide v6, v3, v0

    aput-wide v6, v5, v0

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 14
    :cond_1
    iget-object v2, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-interface {v2, p3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 15
    :cond_2
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public constructor <init>(Lcom/google/android/gms/clearcut/Counters;Ljava/lang/String;)V
    .locals 1

    .line 16
    iput-object p1, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iget v0, p1, Lcom/google/android/gms/clearcut/Counters;->zzd:I

    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    .line 19
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zze:Ljava/lang/Object;

    .line 20
    iget-object v0, p1, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    .line 21
    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 22
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "counter/histogram already exists: "

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/String;

    invoke-direct {p2, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object p1, p2

    :goto_0
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 23
    :cond_1
    iget-object p1, p1, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    .line 24
    invoke-interface {p1, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    iput-object p2, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzb:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final incrementBase(JJ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 5
    iget-object v0, v0, Lcom/google/android/gms/clearcut/Counters;->zzp:Ljava/lang/Integer;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzb(JJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    .line 7
    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 8
    iget-object v1, v1, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 9
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    if-eqz v0, :cond_1

    .line 10
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza(JJ)Z

    .line 11
    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 12
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :catchall_0
    move-exception p1

    .line 13
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 14
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 15
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 16
    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AbstractCounter"

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "("

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzb:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")["

    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zze:Ljava/lang/Object;

    monitor-enter v1

    .line 7
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 8
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " -> ["

    .line 9
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 11
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " = "

    .line 12
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [J

    const/4 v4, 0x0

    aget-wide v3, v3, v4

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ", "

    .line 14
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_0
    const-string v2, "], "

    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 16
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string p0, "]"

    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception p0

    .line 19
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final zza(JJ)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    .line 4
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 5
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 6
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x0

    .line 7
    iget-object v3, v1, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    invoke-virtual {v3, v2}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-nez v3, :cond_0

    .line 8
    iget-object v3, v1, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    invoke-virtual {v3}, Ljava/util/TreeMap;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 9
    iget-object v4, v1, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    invoke-virtual {v4, v2, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    :cond_0
    iput-object v3, v1, Lcom/google/android/gms/clearcut/Counters;->zzp:Ljava/lang/Integer;

    .line 11
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 12
    iget-object v1, v1, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 13
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 14
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 15
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 16
    iget-object v1, v1, Lcom/google/android/gms/clearcut/Counters;->zzm:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 17
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v0

    .line 18
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzb(JJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p0, 0x0

    .line 19
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return p0

    :catchall_0
    move-exception p0

    .line 20
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p0
.end method

.method public final zzb(JJ)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zze:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    iget-object v2, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 3
    iget-object v2, v2, Lcom/google/android/gms/clearcut/Counters;->zzp:Ljava/lang/Integer;

    .line 4
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-nez v1, :cond_0

    .line 5
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 6
    iget-object v2, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    iget-object v3, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 7
    iget-object v3, v3, Lcom/google/android/gms/clearcut/Counters;->zzp:Ljava/lang/Integer;

    .line 8
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    :cond_0
    iget v2, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzc:I

    iget-object v3, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 10
    iget v3, v3, Lcom/google/android/gms/clearcut/Counters;->zzd:I

    const/4 v4, 0x0

    if-lt v2, v3, :cond_3

    if-ne v2, v3, :cond_2

    const-string p1, "Counters"

    const-string p2, "exceeded sample count in "

    .line 11
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzb:Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p3

    if-eqz p3, :cond_1

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, p2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    :cond_2
    monitor-exit v0

    return v4

    :cond_3
    const/4 v3, 0x1

    add-int/2addr v2, v3

    .line 13
    iput v2, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzc:I

    .line 14
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [J

    if-nez v2, :cond_4

    new-array v2, v3, [J

    const-wide/16 v5, 0x0

    aput-wide v5, v2, v4

    .line 15
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    :cond_4
    aget-wide p1, v2, v4

    add-long/2addr p1, p3

    aput-wide p1, v2, v4

    .line 17
    iget-object p0, p0, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzf:Lcom/google/android/gms/clearcut/Counters;

    .line 18
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    monitor-exit v0

    return v4

    :catchall_0
    move-exception p0

    .line 20
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
