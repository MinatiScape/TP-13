.class public final Lcom/google/android/gms/clearcut/Counters$zzb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/clearcut/ClearcutLogger$MessageProducer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/clearcut/Counters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "zzb"
.end annotation


# instance fields
.field public final zza:[B

.field public final zzb:Ljava/lang/Integer;

.field public final zzc:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/clearcut/Counters$AbstractCounter;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic zzd:Lcom/google/android/gms/clearcut/Counters;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/clearcut/Counters;[B)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/clearcut/Counters$zzb;->zzd:Lcom/google/android/gms/clearcut/Counters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/gms/clearcut/Counters$zzb;->zza:[B

    .line 3
    iget-object v0, p1, Lcom/google/android/gms/clearcut/Counters;->zzq:Ljava/util/TreeMap;

    .line 4
    invoke-virtual {v0, p2}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    iput-object p2, p0, Lcom/google/android/gms/clearcut/Counters$zzb;->zzb:Ljava/lang/Integer;

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    iget-object v1, p1, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    .line 7
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    iget-object p1, p1, Lcom/google/android/gms/clearcut/Counters;->zzn:Ljava/util/Map;

    .line 9
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;

    .line 10
    iget-object v2, v1, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 12
    :cond_1
    iput-object v0, p0, Lcom/google/android/gms/clearcut/Counters$zzb;->zzc:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    .line 1
    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/clearcut/Counters$zzb;

    if-nez v0, :cond_1

    const/4 p0, 0x0

    return p0

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/clearcut/Counters$zzb;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/clearcut/Counters$zzb;->zza()Lcom/google/android/gms/internal/zzgta;

    move-result-object p0

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/clearcut/Counters$zzb;->zza()Lcom/google/android/gms/internal/zzgta;

    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgta;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/clearcut/Counters$zzb;->zza()Lcom/google/android/gms/internal/zzgta;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrz;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final zza()Lcom/google/android/gms/internal/zzgta;
    .locals 14

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/zzgta;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzgta;-><init>()V

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$zzb;->zzd:Lcom/google/android/gms/clearcut/Counters;

    .line 3
    iget-wide v1, v1, Lcom/google/android/gms/clearcut/Counters;->zzk:J

    .line 4
    iput-wide v1, v0, Lcom/google/android/gms/internal/zzgta;->zza:J

    .line 5
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$zzb;->zza:[B

    if-eqz v1, :cond_0

    .line 6
    iput-object v1, v0, Lcom/google/android/gms/internal/zzgta;->zzc:[B

    .line 7
    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$zzb;->zzc:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lcom/google/android/gms/internal/zzgsz;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzgta;->zzb:[Lcom/google/android/gms/internal/zzgsz;

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/clearcut/Counters$zzb;->zzc:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v4, v2, :cond_2

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v4, v4, 0x1

    check-cast v6, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;

    .line 9
    iget-object v7, v0, Lcom/google/android/gms/internal/zzgta;->zzb:[Lcom/google/android/gms/internal/zzgsz;

    .line 10
    iget-object v8, v6, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zza:Ljava/util/Map;

    iget-object v9, p0, Lcom/google/android/gms/clearcut/Counters$zzb;->zzb:Ljava/lang/Integer;

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    .line 11
    new-instance v9, Lcom/google/android/gms/internal/zzgsz;

    invoke-direct {v9}, Lcom/google/android/gms/internal/zzgsz;-><init>()V

    .line 12
    iget-object v6, v6, Lcom/google/android/gms/clearcut/Counters$AbstractCounter;->zzb:Ljava/lang/String;

    :try_start_0
    const-string v10, "MD5"

    .line 13
    invoke-static {v10}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v10

    .line 14
    sget-object v11, Lcom/google/android/gms/clearcut/Counters;->zza:Ljava/nio/charset/Charset;

    invoke-virtual {v6, v11}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    invoke-virtual {v10, v6}, Ljava/security/MessageDigest;->update([B)V

    .line 15
    invoke-virtual {v10}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v6

    invoke-static {v6}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 16
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v10
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    iput-wide v10, v9, Lcom/google/android/gms/internal/zzgsz;->zza:J

    .line 18
    invoke-interface {v8}, Ljava/util/Map;->size()I

    move-result v6

    new-array v6, v6, [Lcom/google/android/gms/internal/zzgsy;

    iput-object v6, v9, Lcom/google/android/gms/internal/zzgsz;->zzb:[Lcom/google/android/gms/internal/zzgsy;

    .line 19
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v8, v3

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 20
    new-instance v11, Lcom/google/android/gms/internal/zzgsy;

    invoke-direct {v11}, Lcom/google/android/gms/internal/zzgsy;-><init>()V

    .line 21
    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Long;

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    iput-wide v12, v11, Lcom/google/android/gms/internal/zzgsy;->zza:J

    .line 22
    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [J

    aget-wide v12, v10, v3

    iput-wide v12, v11, Lcom/google/android/gms/internal/zzgsy;->zzb:J

    .line 23
    iget-object v10, v9, Lcom/google/android/gms/internal/zzgsz;->zzb:[Lcom/google/android/gms/internal/zzgsy;

    add-int/lit8 v12, v8, 0x1

    aput-object v11, v10, v8

    move v8, v12

    goto :goto_1

    .line 24
    :cond_1
    aput-object v9, v7, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 25
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_2
    return-object v0
.end method
