.class public final Lcom/google/android/gms/internal/zzgsy;
.super Lcom/google/android/gms/internal/zzgrt;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzgrt<",
        "Lcom/google/android/gms/internal/zzgsy;",
        ">;"
    }
.end annotation


# static fields
.field public static volatile zzc:[Lcom/google/android/gms/internal/zzgsy;


# instance fields
.field public zza:J

.field public zzb:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgrt;-><init>()V

    const-wide/16 v0, 0x0

    .line 2
    iput-wide v0, p0, Lcom/google/android/gms/internal/zzgsy;->zza:J

    .line 3
    iput-wide v0, p0, Lcom/google/android/gms/internal/zzgsy;->zzb:J

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/google/android/gms/internal/zzgrz;->zzaz:I

    return-void
.end method


# virtual methods
.method public final computeSerializedSize()I
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/google/android/gms/internal/zzgrt;->computeSerializedSize()I

    .line 2
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsy;->zza:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    .line 3
    invoke-static {v4, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zzf(IJ)I

    move-result v0

    add-int/2addr v5, v0

    .line 4
    :cond_0
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsy;->zzb:J

    cmp-long p0, v0, v2

    if-eqz p0, :cond_1

    const/4 p0, 0x2

    .line 5
    invoke-static {p0, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zzf(IJ)I

    move-result p0

    add-int/2addr v5, p0

    :cond_1
    return v5
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/zzgsy;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzgsy;

    .line 3
    iget-wide v3, p0, Lcom/google/android/gms/internal/zzgsy;->zza:J

    iget-wide v5, p1, Lcom/google/android/gms/internal/zzgsy;->zza:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_2

    return v2

    .line 4
    :cond_2
    iget-wide v3, p0, Lcom/google/android/gms/internal/zzgsy;->zzb:J

    iget-wide v5, p1, Lcom/google/android/gms/internal/zzgsy;->zzb:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_3

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
    .locals 7

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsy;->zza:J

    const/16 v2, 0x20

    ushr-long v3, v0, v2

    xor-long/2addr v0, v3

    long-to-int v0, v0

    const v1, -0x4806d053

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 2
    iget-wide v3, p0, Lcom/google/android/gms/internal/zzgsy;->zzb:J

    ushr-long v5, v3, v2

    xor-long v2, v3, v5

    long-to-int v0, v2

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->hashCode()I

    move-result p0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    add-int/2addr v1, p0

    return v1
.end method

.method public final writeTo(Lcom/google/android/gms/internal/zzgrr;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsy;->zza:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    .line 2
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zzb(IJ)V

    .line 3
    :cond_0
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzgsy;->zzb:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    const/4 v2, 0x2

    .line 4
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/android/gms/internal/zzgrr;->zzb(IJ)V

    .line 5
    :cond_1
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzgrt;->writeTo(Lcom/google/android/gms/internal/zzgrr;)V

    return-void
.end method
