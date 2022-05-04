.class public final Lcom/google/android/gms/internal/zzgsz;
.super Lcom/google/android/gms/internal/zzgrt;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzgrt<",
        "Lcom/google/android/gms/internal/zzgsz;",
        ">;"
    }
.end annotation


# static fields
.field public static volatile zzc:[Lcom/google/android/gms/internal/zzgsz;


# instance fields
.field public zza:J

.field public zzb:[Lcom/google/android/gms/internal/zzgsy;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgrt;-><init>()V

    const-wide/16 v0, 0x0

    .line 2
    iput-wide v0, p0, Lcom/google/android/gms/internal/zzgsz;->zza:J

    .line 3
    sget-object v0, Lcom/google/android/gms/internal/zzgsy;->zzc:[Lcom/google/android/gms/internal/zzgsy;

    if-nez v0, :cond_1

    .line 4
    sget-object v0, Lcom/google/android/gms/internal/zzgrx;->zzb:Ljava/lang/Object;

    monitor-enter v0

    .line 5
    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/zzgsy;->zzc:[Lcom/google/android/gms/internal/zzgsy;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/android/gms/internal/zzgsy;

    .line 6
    sput-object v1, Lcom/google/android/gms/internal/zzgsy;->zzc:[Lcom/google/android/gms/internal/zzgsy;

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
    sget-object v0, Lcom/google/android/gms/internal/zzgsy;->zzc:[Lcom/google/android/gms/internal/zzgsy;

    .line 9
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgsz;->zzb:[Lcom/google/android/gms/internal/zzgsy;

    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    const/4 v0, -0x1

    .line 11
    iput v0, p0, Lcom/google/android/gms/internal/zzgrz;->zzaz:I

    return-void
.end method


# virtual methods
.method public final computeSerializedSize()I
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/google/android/gms/internal/zzgrt;->computeSerializedSize()I

    .line 2
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsz;->zza:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/internal/zzgrr;->zzb(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x8

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    move v0, v1

    .line 4
    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgsz;->zzb:[Lcom/google/android/gms/internal/zzgsy;

    if-eqz v2, :cond_2

    array-length v2, v2

    if-lez v2, :cond_2

    .line 5
    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgsz;->zzb:[Lcom/google/android/gms/internal/zzgsy;

    array-length v3, v2

    if-ge v1, v3, :cond_2

    .line 6
    aget-object v2, v2, v1

    if-eqz v2, :cond_1

    const/4 v3, 0x3

    .line 7
    invoke-static {v3, v2}, Lcom/google/android/gms/internal/zzgrr;->zzb(ILcom/google/android/gms/internal/zzgrz;)I

    move-result v2

    add-int/2addr v0, v2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/zzgsz;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzgsz;

    .line 3
    iget-wide v3, p0, Lcom/google/android/gms/internal/zzgsz;->zza:J

    iget-wide v5, p1, Lcom/google/android/gms/internal/zzgsz;->zza:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_2

    return v2

    .line 4
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsz;->zzb:[Lcom/google/android/gms/internal/zzgsy;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsz;->zzb:[Lcom/google/android/gms/internal/zzgsy;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzgrx;->zza([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    .line 5
    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    .line 6
    :cond_4
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgrv;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 7
    :cond_5
    :goto_0
    iget-object p0, p1, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result p0

    if-eqz p0, :cond_6

    goto :goto_1

    :cond_6
    return v2

    :cond_7
    :goto_1
    return v0
.end method

.method public final hashCode()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsz;->zza:J

    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v0, v2

    long-to-int v0, v0

    const v1, -0x4806d034

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    const/4 v0, 0x0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgsz;->zzb:[Lcom/google/android/gms/internal/zzgsy;

    .line 3
    invoke-static {v2}, Lcom/google/android/gms/internal/zzgrx;->zza([Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->hashCode()I

    move-result v0

    :cond_1
    :goto_0
    add-int/2addr v2, v0

    return v2
.end method

.method public final writeTo(Lcom/google/android/gms/internal/zzgrr;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsz;->zza:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    const/16 v2, 0x9

    .line 2
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/zzgrr;->zzc(I)V

    .line 3
    iget-object v2, p1, Lcom/google/android/gms/internal/zzgrr;->zza:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    const/16 v3, 0x8

    if-lt v2, v3, :cond_0

    .line 4
    iget-object v2, p1, Lcom/google/android/gms/internal/zzgrr;->zza:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 5
    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/zzgrs;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzgrr;->zza:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    iget-object p1, p1, Lcom/google/android/gms/internal/zzgrr;->zza:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/zzgrs;-><init>(II)V

    throw p0

    .line 6
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsz;->zzb:[Lcom/google/android/gms/internal/zzgsy;

    if-eqz v0, :cond_3

    array-length v0, v0

    if-lez v0, :cond_3

    const/4 v0, 0x0

    .line 7
    :goto_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsz;->zzb:[Lcom/google/android/gms/internal/zzgsy;

    array-length v2, v1

    if-ge v0, v2, :cond_3

    .line 8
    aget-object v1, v1, v0

    if-eqz v1, :cond_2

    const/4 v2, 0x3

    .line 9
    invoke-virtual {p1, v2, v1}, Lcom/google/android/gms/internal/zzgrr;->zza(ILcom/google/android/gms/internal/zzgrz;)V

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 10
    :cond_3
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzgrt;->writeTo(Lcom/google/android/gms/internal/zzgrr;)V

    return-void
.end method
