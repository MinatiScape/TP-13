.class public final Lcom/google/android/gms/internal/zzgta;
.super Lcom/google/android/gms/internal/zzgrt;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzgrt<",
        "Lcom/google/android/gms/internal/zzgta;",
        ">;"
    }
.end annotation


# instance fields
.field public zza:J

.field public zzb:[Lcom/google/android/gms/internal/zzgsz;

.field public zzc:[B

.field public zze:Ljava/lang/String;

.field public zzf:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgrt;-><init>()V

    const-wide/16 v0, 0x0

    .line 2
    iput-wide v0, p0, Lcom/google/android/gms/internal/zzgta;->zza:J

    .line 3
    sget-object v0, Lcom/google/android/gms/internal/zzgsz;->zzc:[Lcom/google/android/gms/internal/zzgsz;

    if-nez v0, :cond_1

    .line 4
    sget-object v0, Lcom/google/android/gms/internal/zzgrx;->zzb:Ljava/lang/Object;

    monitor-enter v0

    .line 5
    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzgsz;->zzc:[Lcom/google/android/gms/internal/zzgsz;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/android/gms/internal/zzgsz;

    .line 6
    sput-object v1, Lcom/google/android/gms/internal/zzgsz;->zzc:[Lcom/google/android/gms/internal/zzgsz;

    .line 7
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 8
    :cond_1
    :goto_0
    sget-object v0, Lcom/google/android/gms/internal/zzgsz;->zzc:[Lcom/google/android/gms/internal/zzgsz;

    .line 9
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zzb:[Lcom/google/android/gms/internal/zzgsz;

    .line 10
    sget-object v0, Lcom/google/android/gms/internal/zzgsc;->zzh:[B

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zzc:[B

    const-string v0, ""

    .line 11
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zze:Ljava/lang/String;

    const-string v0, ""

    .line 12
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zzf:Ljava/lang/String;

    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    const/4 v0, -0x1

    .line 14
    iput v0, p0, Lcom/google/android/gms/internal/zzgrz;->zzaz:I

    return-void
.end method


# virtual methods
.method public final computeSerializedSize()I
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/google/android/gms/internal/zzgrt;->computeSerializedSize()I

    .line 2
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgta;->zza:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    .line 3
    invoke-static {v2, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zzf(IJ)I

    move-result v0

    add-int/2addr v0, v3

    goto :goto_0

    :cond_0
    move v0, v3

    .line 4
    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzb:[Lcom/google/android/gms/internal/zzgsz;

    if-eqz v1, :cond_2

    array-length v1, v1

    if-lez v1, :cond_2

    .line 5
    :goto_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzb:[Lcom/google/android/gms/internal/zzgsz;

    array-length v2, v1

    if-ge v3, v2, :cond_2

    .line 6
    aget-object v1, v1, v3

    if-eqz v1, :cond_1

    const/4 v2, 0x2

    .line 7
    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILcom/google/android/gms/internal/zzgrz;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 8
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzc:[B

    sget-object v2, Lcom/google/android/gms/internal/zzgsc;->zzh:[B

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_3

    const/4 v1, 0x3

    .line 9
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgta;->zzc:[B

    .line 10
    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzgrr;->zzb(I[B)I

    move-result v1

    add-int/2addr v0, v1

    .line 11
    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zze:Ljava/lang/String;

    const-string v2, ""

    if-eqz v1, :cond_4

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const/4 v1, 0x5

    .line 12
    iget-object v3, p0, Lcom/google/android/gms/internal/zzgta;->zze:Ljava/lang/String;

    .line 13
    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    .line 14
    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzf:Ljava/lang/String;

    if-eqz v1, :cond_5

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const/4 v1, 0x6

    .line 15
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgta;->zzf:Ljava/lang/String;

    .line 16
    invoke-static {v1, p0}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILjava/lang/String;)I

    move-result p0

    add-int/2addr v0, p0

    :cond_5
    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/zzgta;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzgta;

    .line 3
    iget-wide v3, p0, Lcom/google/android/gms/internal/zzgta;->zza:J

    iget-wide v5, p1, Lcom/google/android/gms/internal/zzgta;->zza:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_2

    return v2

    .line 4
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzb:[Lcom/google/android/gms/internal/zzgsz;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgta;->zzb:[Lcom/google/android/gms/internal/zzgsz;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzgrx;->zza([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    .line 5
    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzc:[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgta;->zzc:[B

    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    .line 6
    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zze:Ljava/lang/String;

    if-nez v1, :cond_5

    .line 7
    iget-object v1, p1, Lcom/google/android/gms/internal/zzgta;->zze:Ljava/lang/String;

    if-eqz v1, :cond_6

    return v2

    .line 8
    :cond_5
    iget-object v3, p1, Lcom/google/android/gms/internal/zzgta;->zze:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    .line 9
    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzf:Ljava/lang/String;

    if-nez v1, :cond_7

    .line 10
    iget-object v1, p1, Lcom/google/android/gms/internal/zzgta;->zzf:Ljava/lang/String;

    if-eqz v1, :cond_8

    return v2

    .line 11
    :cond_7
    iget-object v3, p1, Lcom/google/android/gms/internal/zzgta;->zzf:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    .line 12
    :cond_8
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v1, :cond_a

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v1

    if-eqz v1, :cond_9

    goto :goto_0

    .line 13
    :cond_9
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgrv;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 14
    :cond_a
    :goto_0
    iget-object p0, p1, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz p0, :cond_c

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result p0

    if-eqz p0, :cond_b

    goto :goto_1

    :cond_b
    return v2

    :cond_c
    :goto_1
    return v0
.end method

.method public final hashCode()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgta;->zza:J

    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v0, v2

    long-to-int v0, v0

    const v1, -0x4806cf7a

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    const-wide/16 v2, 0x0

    long-to-int v0, v2

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zzb:[Lcom/google/android/gms/internal/zzgsz;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/internal/zzgrx;->zza([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzc:[B

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zze:Ljava/lang/String;

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zzf:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v2

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_1
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    .line 8
    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->hashCode()I

    move-result v2

    :cond_3
    :goto_2
    add-int/2addr v1, v2

    return v1
.end method

.method public final writeTo(Lcom/google/android/gms/internal/zzgrr;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgta;->zza:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    .line 2
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zzb(IJ)V

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zzb:[Lcom/google/android/gms/internal/zzgsz;

    if-eqz v0, :cond_2

    array-length v0, v0

    if-lez v0, :cond_2

    const/4 v0, 0x0

    .line 4
    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzb:[Lcom/google/android/gms/internal/zzgsz;

    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 5
    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    const/4 v2, 0x2

    .line 6
    invoke-virtual {p1, v2, v1}, Lcom/google/android/gms/internal/zzgrr;->zza(ILcom/google/android/gms/internal/zzgrz;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 7
    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zzc:[B

    sget-object v1, Lcom/google/android/gms/internal/zzgsc;->zzh:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x3

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzc:[B

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zza(I[B)V

    .line 9
    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zze:Ljava/lang/String;

    const-string v1, ""

    if-eqz v0, :cond_4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const/4 v0, 0x5

    .line 10
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgta;->zze:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzgrr;->zza(ILjava/lang/String;)V

    .line 11
    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgta;->zzf:Ljava/lang/String;

    if-eqz v0, :cond_5

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v0, 0x6

    .line 12
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgta;->zzf:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zza(ILjava/lang/String;)V

    .line 13
    :cond_5
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzgrt;->writeTo(Lcom/google/android/gms/internal/zzgrr;)V

    return-void
.end method
