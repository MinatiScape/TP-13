.class public final Lcom/google/android/gms/internal/zzgsv;
.super Lcom/google/android/gms/internal/zzgrt;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzgrt<",
        "Lcom/google/android/gms/internal/zzgsv;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# instance fields
.field public zza:J

.field public zzb:J

.field public zzf:[B

.field public zzg:J

.field public zzh:[B

.field public zzk:[Lcom/google/android/gms/internal/zzgsw;

.field public zzl:[B

.field public zzn:Ljava/lang/String;

.field public zzo:Ljava/lang/String;

.field public zzp:Lcom/google/android/gms/internal/zzgst;

.field public zzq:Ljava/lang/String;

.field public zzr:Lcom/google/android/gms/internal/zzgsu;

.field public zzs:Ljava/lang/String;

.field public zzu:[I

.field public zzw:Lcom/google/android/gms/internal/zzgsx;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgrt;-><init>()V

    const-wide/16 v0, 0x0

    .line 2
    iput-wide v0, p0, Lcom/google/android/gms/internal/zzgsv;->zza:J

    .line 3
    iput-wide v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzb:J

    .line 4
    sget-object v0, Lcom/google/android/gms/internal/zzgsw;->zza:[Lcom/google/android/gms/internal/zzgsw;

    if-nez v0, :cond_1

    .line 5
    sget-object v0, Lcom/google/android/gms/internal/zzgrx;->zzb:Ljava/lang/Object;

    monitor-enter v0

    .line 6
    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzgsw;->zza:[Lcom/google/android/gms/internal/zzgsw;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/android/gms/internal/zzgsw;

    .line 7
    sput-object v1, Lcom/google/android/gms/internal/zzgsw;->zza:[Lcom/google/android/gms/internal/zzgsw;

    .line 8
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 9
    :cond_1
    :goto_0
    sget-object v0, Lcom/google/android/gms/internal/zzgsw;->zza:[Lcom/google/android/gms/internal/zzgsw;

    .line 10
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    .line 11
    sget-object v0, Lcom/google/android/gms/internal/zzgsc;->zzh:[B

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzl:[B

    .line 12
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    const-string v1, ""

    .line 13
    iput-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzn:Ljava/lang/String;

    const-string v1, ""

    .line 14
    iput-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzo:Ljava/lang/String;

    const/4 v1, 0x0

    .line 15
    iput-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzp:Lcom/google/android/gms/internal/zzgst;

    const-string v2, ""

    .line 16
    iput-object v2, p0, Lcom/google/android/gms/internal/zzgsv;->zzq:Ljava/lang/String;

    const-wide/32 v2, 0x2bf20

    .line 17
    iput-wide v2, p0, Lcom/google/android/gms/internal/zzgsv;->zzg:J

    .line 18
    iput-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzr:Lcom/google/android/gms/internal/zzgsu;

    .line 19
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzh:[B

    const-string v0, ""

    .line 20
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzs:Ljava/lang/String;

    .line 21
    sget-object v0, Lcom/google/android/gms/internal/zzgsc;->zza:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzu:[I

    .line 22
    iput-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzw:Lcom/google/android/gms/internal/zzgsx;

    .line 23
    iput-object v1, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    const/4 v0, -0x1

    .line 24
    iput v0, p0, Lcom/google/android/gms/internal/zzgrz;->zzaz:I

    return-void
.end method


# virtual methods
.method public final bridge synthetic clone()Lcom/google/android/gms/internal/zzgrt;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 16
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgsv;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgsv;

    return-object p0
.end method

.method public final bridge synthetic clone()Lcom/google/android/gms/internal/zzgrz;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 17
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgsv;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgsv;

    return-object p0
.end method

.method public final clone()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-super {p0}, Lcom/google/android/gms/internal/zzgrt;->clone()Lcom/google/android/gms/internal/zzgrt;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgsv;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    if-eqz v1, :cond_1

    array-length v2, v1

    if-lez v2, :cond_1

    .line 3
    array-length v1, v1

    new-array v1, v1, [Lcom/google/android/gms/internal/zzgsw;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    const/4 v1, 0x0

    .line 4
    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 5
    aget-object v3, v2, v1

    if-eqz v3, :cond_0

    .line 6
    iget-object v3, v0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzgsw;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzgsw;

    aput-object v2, v3, v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 7
    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzp:Lcom/google/android/gms/internal/zzgst;

    if-eqz v1, :cond_2

    .line 8
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgst;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzgst;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzgsv;->zzp:Lcom/google/android/gms/internal/zzgst;

    .line 9
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzr:Lcom/google/android/gms/internal/zzgsu;

    if-eqz v1, :cond_3

    .line 10
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgsu;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzgsu;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzgsv;->zzr:Lcom/google/android/gms/internal/zzgsu;

    .line 11
    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzu:[I

    if-eqz v1, :cond_4

    array-length v2, v1

    if-lez v2, :cond_4

    .line 12
    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lcom/google/android/gms/internal/zzgsv;->zzu:[I

    .line 13
    :cond_4
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgsv;->zzw:Lcom/google/android/gms/internal/zzgsx;

    if-eqz p0, :cond_5

    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgsx;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgsx;

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgsv;->zzw:Lcom/google/android/gms/internal/zzgsx;

    :cond_5
    return-object v0

    :catch_0
    move-exception p0

    .line 15
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public final computeSerializedSize()I
    .locals 12

    .line 1
    invoke-super {p0}, Lcom/google/android/gms/internal/zzgrt;->computeSerializedSize()I

    .line 2
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsv;->zza:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_0

    .line 3
    invoke-static {v5, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zzf(IJ)I

    move-result v0

    add-int/2addr v0, v6

    goto :goto_0

    :cond_0
    move v0, v6

    .line 4
    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    if-eqz v1, :cond_2

    array-length v1, v1

    if-lez v1, :cond_2

    move v1, v6

    .line 5
    :goto_1
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    array-length v7, v4

    if-ge v1, v7, :cond_2

    .line 6
    aget-object v4, v4, v1

    if-eqz v4, :cond_1

    const/4 v7, 0x3

    .line 7
    invoke-static {v7, v4}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILcom/google/android/gms/internal/zzgrz;)I

    move-result v4

    add-int/2addr v0, v4

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 8
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzl:[B

    sget-object v4, Lcom/google/android/gms/internal/zzgsc;->zzh:[B

    invoke-static {v1, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_3

    const/4 v1, 0x4

    .line 9
    iget-object v7, p0, Lcom/google/android/gms/internal/zzgsv;->zzl:[B

    .line 10
    invoke-static {v1, v7}, Lcom/google/android/gms/internal/zzgrr;->zzb(I[B)I

    move-result v1

    add-int/2addr v0, v1

    .line 11
    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    invoke-static {v1, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_4

    const/4 v1, 0x6

    .line 12
    iget-object v7, p0, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    .line 13
    invoke-static {v1, v7}, Lcom/google/android/gms/internal/zzgrr;->zzb(I[B)I

    move-result v1

    add-int/2addr v0, v1

    .line 14
    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzp:Lcom/google/android/gms/internal/zzgst;

    if-eqz v1, :cond_5

    const/4 v7, 0x7

    .line 15
    invoke-static {v7, v1}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILcom/google/android/gms/internal/zzgrz;)I

    move-result v1

    add-int/2addr v0, v1

    .line 16
    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzn:Ljava/lang/String;

    const-string v7, ""

    if-eqz v1, :cond_6

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const/16 v1, 0x8

    .line 17
    iget-object v8, p0, Lcom/google/android/gms/internal/zzgsv;->zzn:Ljava/lang/String;

    .line 18
    invoke-static {v1, v8}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    .line 19
    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzo:Ljava/lang/String;

    if-eqz v1, :cond_7

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    const/16 v1, 0xd

    .line 20
    iget-object v8, p0, Lcom/google/android/gms/internal/zzgsv;->zzo:Ljava/lang/String;

    .line 21
    invoke-static {v1, v8}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    .line 22
    :cond_7
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzq:Ljava/lang/String;

    if-eqz v1, :cond_8

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    const/16 v1, 0xe

    .line 23
    iget-object v8, p0, Lcom/google/android/gms/internal/zzgsv;->zzq:Ljava/lang/String;

    .line 24
    invoke-static {v1, v8}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    .line 25
    :cond_8
    iget-wide v8, p0, Lcom/google/android/gms/internal/zzgsv;->zzg:J

    const-wide/32 v10, 0x2bf20

    cmp-long v1, v8, v10

    if-eqz v1, :cond_9

    const/16 v1, 0xf

    .line 26
    invoke-static {v1}, Lcom/google/android/gms/internal/zzgrr;->zzb(I)I

    move-result v1

    shl-long v10, v8, v5

    const/16 v5, 0x3f

    shr-long/2addr v8, v5

    xor-long/2addr v8, v10

    .line 27
    invoke-static {v8, v9}, Lcom/google/android/gms/internal/zzgrr;->zzb(J)I

    move-result v5

    add-int/2addr v5, v1

    add-int/2addr v0, v5

    .line 28
    :cond_9
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzr:Lcom/google/android/gms/internal/zzgsu;

    if-eqz v1, :cond_a

    const/16 v5, 0x10

    .line 29
    invoke-static {v5, v1}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILcom/google/android/gms/internal/zzgrz;)I

    move-result v1

    add-int/2addr v0, v1

    .line 30
    :cond_a
    iget-wide v8, p0, Lcom/google/android/gms/internal/zzgsv;->zzb:J

    cmp-long v1, v8, v2

    if-eqz v1, :cond_b

    const/16 v1, 0x11

    .line 31
    invoke-static {v1, v8, v9}, Lcom/google/android/gms/internal/zzgrr;->zzf(IJ)I

    move-result v1

    add-int/2addr v0, v1

    .line 32
    :cond_b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzh:[B

    invoke-static {v1, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_c

    const/16 v1, 0x12

    .line 33
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgsv;->zzh:[B

    .line 34
    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzgrr;->zzb(I[B)I

    move-result v1

    add-int/2addr v0, v1

    .line 35
    :cond_c
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzu:[I

    if-eqz v1, :cond_e

    array-length v1, v1

    if-lez v1, :cond_e

    move v1, v6

    .line 36
    :goto_2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgsv;->zzu:[I

    array-length v3, v2

    if-ge v6, v3, :cond_d

    .line 37
    aget v2, v2, v6

    .line 38
    invoke-static {v2}, Lcom/google/android/gms/internal/zzgrr;->zza(I)I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_d
    add-int/2addr v0, v1

    .line 39
    array-length v1, v2

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    .line 40
    :cond_e
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzw:Lcom/google/android/gms/internal/zzgsx;

    if-eqz v1, :cond_f

    const/16 v2, 0x17

    .line 41
    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILcom/google/android/gms/internal/zzgrz;)I

    move-result v1

    add-int/2addr v0, v1

    .line 42
    :cond_f
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzs:Ljava/lang/String;

    if-eqz v1, :cond_10

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    const/16 v1, 0x18

    .line 43
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgsv;->zzs:Ljava/lang/String;

    .line 44
    invoke-static {v1, p0}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILjava/lang/String;)I

    move-result p0

    add-int/2addr v0, p0

    :cond_10
    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/zzgsv;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzgsv;

    .line 3
    iget-wide v3, p0, Lcom/google/android/gms/internal/zzgsv;->zza:J

    iget-wide v5, p1, Lcom/google/android/gms/internal/zzgsv;->zza:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_2

    return v2

    .line 4
    :cond_2
    iget-wide v3, p0, Lcom/google/android/gms/internal/zzgsv;->zzb:J

    iget-wide v5, p1, Lcom/google/android/gms/internal/zzgsv;->zzb:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_3

    return v2

    .line 5
    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzgrx;->zza([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    .line 6
    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzl:[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzl:[B

    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    .line 7
    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    .line 8
    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzn:Ljava/lang/String;

    if-nez v1, :cond_7

    .line 9
    iget-object v1, p1, Lcom/google/android/gms/internal/zzgsv;->zzn:Ljava/lang/String;

    if-eqz v1, :cond_8

    return v2

    .line 10
    :cond_7
    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzn:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    .line 11
    :cond_8
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzo:Ljava/lang/String;

    if-nez v1, :cond_9

    .line 12
    iget-object v1, p1, Lcom/google/android/gms/internal/zzgsv;->zzo:Ljava/lang/String;

    if-eqz v1, :cond_a

    return v2

    .line 13
    :cond_9
    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzo:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    return v2

    .line 14
    :cond_a
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzp:Lcom/google/android/gms/internal/zzgst;

    if-nez v1, :cond_b

    .line 15
    iget-object v1, p1, Lcom/google/android/gms/internal/zzgsv;->zzp:Lcom/google/android/gms/internal/zzgst;

    if-eqz v1, :cond_c

    return v2

    .line 16
    :cond_b
    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzp:Lcom/google/android/gms/internal/zzgst;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/zzgst;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    return v2

    .line 17
    :cond_c
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzq:Ljava/lang/String;

    if-nez v1, :cond_d

    .line 18
    iget-object v1, p1, Lcom/google/android/gms/internal/zzgsv;->zzq:Ljava/lang/String;

    if-eqz v1, :cond_e

    return v2

    .line 19
    :cond_d
    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzq:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    return v2

    .line 20
    :cond_e
    iget-wide v3, p0, Lcom/google/android/gms/internal/zzgsv;->zzg:J

    iget-wide v5, p1, Lcom/google/android/gms/internal/zzgsv;->zzg:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_f

    return v2

    .line 21
    :cond_f
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzr:Lcom/google/android/gms/internal/zzgsu;

    if-nez v1, :cond_10

    .line 22
    iget-object v1, p1, Lcom/google/android/gms/internal/zzgsv;->zzr:Lcom/google/android/gms/internal/zzgsu;

    if-eqz v1, :cond_11

    return v2

    .line 23
    :cond_10
    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzr:Lcom/google/android/gms/internal/zzgsu;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/zzgsu;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    return v2

    .line 24
    :cond_11
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzh:[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzh:[B

    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_12

    return v2

    .line 25
    :cond_12
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzs:Ljava/lang/String;

    if-nez v1, :cond_13

    .line 26
    iget-object v1, p1, Lcom/google/android/gms/internal/zzgsv;->zzs:Ljava/lang/String;

    if-eqz v1, :cond_14

    return v2

    .line 27
    :cond_13
    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzs:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    return v2

    .line 28
    :cond_14
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzu:[I

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzu:[I

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzgrx;->zza([I[I)Z

    move-result v1

    if-nez v1, :cond_15

    return v2

    .line 29
    :cond_15
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzw:Lcom/google/android/gms/internal/zzgsx;

    if-nez v1, :cond_16

    .line 30
    iget-object v1, p1, Lcom/google/android/gms/internal/zzgsv;->zzw:Lcom/google/android/gms/internal/zzgsx;

    if-eqz v1, :cond_17

    return v2

    .line 31
    :cond_16
    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsv;->zzw:Lcom/google/android/gms/internal/zzgsx;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/zzgsx;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    .line 32
    :cond_17
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v1, :cond_19

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v1

    if-eqz v1, :cond_18

    goto :goto_0

    .line 33
    :cond_18
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgrv;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 34
    :cond_19
    :goto_0
    iget-object p0, p1, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result p0

    if-eqz p0, :cond_1a

    goto :goto_1

    :cond_1a
    return v2

    :cond_1b
    :goto_1
    return v0
.end method

.method public final hashCode()I
    .locals 8

    .line 1
    const-class v0, Lcom/google/android/gms/internal/zzgsv;

    .line 2
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsv;->zza:J

    const/16 v2, 0x20

    ushr-long v3, v0, v2

    xor-long/2addr v0, v3

    long-to-int v0, v0

    const v1, -0x4806d0b0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 3
    iget-wide v3, p0, Lcom/google/android/gms/internal/zzgsv;->zzb:J

    ushr-long v5, v3, v2

    xor-long/2addr v3, v5

    long-to-int v1, v3

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    const-wide/16 v3, 0x0

    long-to-int v1, v3

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    const/4 v3, 0x0

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    add-int/lit16 v0, v0, 0x4d5

    mul-int/lit8 v0, v0, 0x1f

    .line 4
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    .line 5
    invoke-static {v4}, Lcom/google/android/gms/internal/zzgrx;->zza([Ljava/lang/Object;)I

    move-result v4

    add-int/2addr v0, v4

    mul-int/lit8 v0, v0, 0x1f

    .line 6
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgsv;->zzl:[B

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([B)I

    move-result v4

    add-int/2addr v4, v0

    mul-int/lit8 v4, v4, 0x1f

    add-int/2addr v4, v3

    mul-int/lit8 v4, v4, 0x1f

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    add-int/2addr v0, v4

    mul-int/lit8 v0, v0, 0x1f

    .line 8
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgsv;->zzn:Ljava/lang/String;

    if-nez v4, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    :goto_0
    add-int/2addr v0, v4

    mul-int/lit8 v0, v0, 0x1f

    .line 9
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgsv;->zzo:Ljava/lang/String;

    if-nez v4, :cond_1

    move v4, v3

    goto :goto_1

    :cond_1
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    :goto_1
    add-int/2addr v0, v4

    .line 10
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgsv;->zzp:Lcom/google/android/gms/internal/zzgst;

    mul-int/lit8 v0, v0, 0x1f

    if-nez v4, :cond_2

    move v4, v3

    goto :goto_2

    .line 11
    :cond_2
    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzgst;->hashCode()I

    move-result v4

    :goto_2
    add-int/2addr v0, v4

    mul-int/lit8 v0, v0, 0x1f

    .line 12
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgsv;->zzq:Ljava/lang/String;

    if-nez v4, :cond_3

    move v4, v3

    goto :goto_3

    :cond_3
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    :goto_3
    add-int/2addr v0, v4

    mul-int/lit8 v0, v0, 0x1f

    .line 13
    iget-wide v4, p0, Lcom/google/android/gms/internal/zzgsv;->zzg:J

    ushr-long v6, v4, v2

    xor-long/2addr v4, v6

    long-to-int v2, v4

    add-int/2addr v0, v2

    .line 14
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgsv;->zzr:Lcom/google/android/gms/internal/zzgsu;

    mul-int/lit8 v0, v0, 0x1f

    if-nez v2, :cond_4

    move v2, v3

    goto :goto_4

    .line 15
    :cond_4
    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzgsu;->hashCode()I

    move-result v2

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 16
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgsv;->zzh:[B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x1f

    .line 17
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzs:Ljava/lang/String;

    if-nez v0, :cond_5

    move v0, v3

    goto :goto_5

    :cond_5
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_5
    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x1f

    add-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x1f

    .line 18
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzu:[I

    if-eqz v0, :cond_7

    .line 19
    array-length v4, v0

    if-nez v4, :cond_6

    goto :goto_6

    :cond_6
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([I)I

    move-result v0

    goto :goto_7

    :cond_7
    :goto_6
    move v0, v3

    :goto_7
    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x1f

    add-int/2addr v2, v1

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzw:Lcom/google/android/gms/internal/zzgsx;

    mul-int/lit8 v2, v2, 0x1f

    if-nez v0, :cond_8

    move v0, v3

    goto :goto_8

    .line 21
    :cond_8
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgsx;->hashCode()I

    move-result v0

    :goto_8
    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x1f

    add-int/lit16 v2, v2, 0x4d5

    mul-int/lit8 v2, v2, 0x1f

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_9

    .line 23
    :cond_9
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->hashCode()I

    move-result v3

    :cond_a
    :goto_9
    add-int/2addr v2, v3

    return v2
.end method

.method public final writeTo(Lcom/google/android/gms/internal/zzgrr;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsv;->zza:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    const/4 v5, 0x1

    if-eqz v4, :cond_0

    .line 2
    invoke-virtual {p1, v5, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zzb(IJ)V

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    array-length v0, v0

    if-lez v0, :cond_2

    move v0, v1

    .line 4
    :goto_0
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgsv;->zzk:[Lcom/google/android/gms/internal/zzgsw;

    array-length v6, v4

    if-ge v0, v6, :cond_2

    .line 5
    aget-object v4, v4, v0

    if-eqz v4, :cond_1

    const/4 v6, 0x3

    .line 6
    invoke-virtual {p1, v6, v4}, Lcom/google/android/gms/internal/zzgrr;->zza(ILcom/google/android/gms/internal/zzgrz;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 7
    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzl:[B

    sget-object v4, Lcom/google/android/gms/internal/zzgsc;->zzh:[B

    invoke-static {v0, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x4

    .line 8
    iget-object v6, p0, Lcom/google/android/gms/internal/zzgsv;->zzl:[B

    invoke-virtual {p1, v0, v6}, Lcom/google/android/gms/internal/zzgrr;->zza(I[B)V

    .line 9
    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    invoke-static {v0, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_4

    const/4 v0, 0x6

    .line 10
    iget-object v6, p0, Lcom/google/android/gms/internal/zzgsv;->zzf:[B

    invoke-virtual {p1, v0, v6}, Lcom/google/android/gms/internal/zzgrr;->zza(I[B)V

    .line 11
    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzp:Lcom/google/android/gms/internal/zzgst;

    if-eqz v0, :cond_5

    const/4 v6, 0x7

    .line 12
    invoke-virtual {p1, v6, v0}, Lcom/google/android/gms/internal/zzgrr;->zza(ILcom/google/android/gms/internal/zzgrz;)V

    .line 13
    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzn:Ljava/lang/String;

    const-string v6, ""

    if-eqz v0, :cond_6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const/16 v0, 0x8

    .line 14
    iget-object v7, p0, Lcom/google/android/gms/internal/zzgsv;->zzn:Ljava/lang/String;

    invoke-virtual {p1, v0, v7}, Lcom/google/android/gms/internal/zzgrr;->zza(ILjava/lang/String;)V

    .line 15
    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzo:Ljava/lang/String;

    if-eqz v0, :cond_7

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    const/16 v0, 0xd

    .line 16
    iget-object v7, p0, Lcom/google/android/gms/internal/zzgsv;->zzo:Ljava/lang/String;

    invoke-virtual {p1, v0, v7}, Lcom/google/android/gms/internal/zzgrr;->zza(ILjava/lang/String;)V

    .line 17
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzq:Ljava/lang/String;

    if-eqz v0, :cond_8

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    const/16 v0, 0xe

    .line 18
    iget-object v7, p0, Lcom/google/android/gms/internal/zzgsv;->zzq:Ljava/lang/String;

    invoke-virtual {p1, v0, v7}, Lcom/google/android/gms/internal/zzgrr;->zza(ILjava/lang/String;)V

    .line 19
    :cond_8
    iget-wide v7, p0, Lcom/google/android/gms/internal/zzgsv;->zzg:J

    const-wide/32 v9, 0x2bf20

    cmp-long v0, v7, v9

    if-eqz v0, :cond_9

    const/16 v0, 0x78

    .line 20
    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzgrr;->zzc(I)V

    shl-long v9, v7, v5

    const/16 v0, 0x3f

    shr-long/2addr v7, v0

    xor-long/2addr v7, v9

    .line 21
    invoke-virtual {p1, v7, v8}, Lcom/google/android/gms/internal/zzgrr;->zza(J)V

    .line 22
    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzr:Lcom/google/android/gms/internal/zzgsu;

    if-eqz v0, :cond_a

    const/16 v5, 0x10

    .line 23
    invoke-virtual {p1, v5, v0}, Lcom/google/android/gms/internal/zzgrr;->zza(ILcom/google/android/gms/internal/zzgrz;)V

    .line 24
    :cond_a
    iget-wide v7, p0, Lcom/google/android/gms/internal/zzgsv;->zzb:J

    cmp-long v0, v7, v2

    if-eqz v0, :cond_b

    const/16 v0, 0x11

    .line 25
    invoke-virtual {p1, v0, v7, v8}, Lcom/google/android/gms/internal/zzgrr;->zzb(IJ)V

    .line 26
    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzh:[B

    invoke-static {v0, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_c

    const/16 v0, 0x12

    .line 27
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgsv;->zzh:[B

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzgrr;->zza(I[B)V

    .line 28
    :cond_c
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzu:[I

    if-eqz v0, :cond_d

    array-length v0, v0

    if-lez v0, :cond_d

    .line 29
    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzu:[I

    array-length v2, v0

    if-ge v1, v2, :cond_d

    const/16 v2, 0x14

    .line 30
    aget v0, v0, v1

    invoke-virtual {p1, v2, v0}, Lcom/google/android/gms/internal/zzgrr;->zza(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 31
    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzw:Lcom/google/android/gms/internal/zzgsx;

    if-eqz v0, :cond_e

    const/16 v1, 0x17

    .line 32
    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/zzgrr;->zza(ILcom/google/android/gms/internal/zzgrz;)V

    .line 33
    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsv;->zzs:Ljava/lang/String;

    if-eqz v0, :cond_f

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    const/16 v0, 0x18

    .line 34
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsv;->zzs:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zza(ILjava/lang/String;)V

    .line 35
    :cond_f
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzgrt;->writeTo(Lcom/google/android/gms/internal/zzgrr;)V

    return-void
.end method
