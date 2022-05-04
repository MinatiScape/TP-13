.class public final Lcom/google/android/gms/internal/zzgst;
.super Lcom/google/android/gms/internal/zzgrt;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzgrt<",
        "Lcom/google/android/gms/internal/zzgst;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# instance fields
.field public zza:[Ljava/lang/String;

.field public zzb:[Ljava/lang/String;

.field public zzc:[I

.field public zzd:[J

.field public zze:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgrt;-><init>()V

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/zzgsc;->zzf:[Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zza:[Ljava/lang/String;

    .line 3
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zzb:[Ljava/lang/String;

    .line 4
    sget-object v0, Lcom/google/android/gms/internal/zzgsc;->zza:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zzc:[I

    .line 5
    sget-object v0, Lcom/google/android/gms/internal/zzgsc;->zzb:[J

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zzd:[J

    .line 6
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zze:[J

    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    const/4 v0, -0x1

    .line 8
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

    .line 13
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgst;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgst;

    return-object p0
.end method

.method public final bridge synthetic clone()Lcom/google/android/gms/internal/zzgrz;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgst;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgst;

    return-object p0
.end method

.method public final clone()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-super {p0}, Lcom/google/android/gms/internal/zzgrt;->clone()Lcom/google/android/gms/internal/zzgrt;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgst;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zza:[Ljava/lang/String;

    if-eqz v1, :cond_0

    array-length v2, v1

    if-lez v2, :cond_0

    .line 3
    invoke-virtual {v1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzgst;->zza:[Ljava/lang/String;

    .line 4
    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zzb:[Ljava/lang/String;

    if-eqz v1, :cond_1

    array-length v2, v1

    if-lez v2, :cond_1

    .line 5
    invoke-virtual {v1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzgst;->zzb:[Ljava/lang/String;

    .line 6
    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zzc:[I

    if-eqz v1, :cond_2

    array-length v2, v1

    if-lez v2, :cond_2

    .line 7
    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lcom/google/android/gms/internal/zzgst;->zzc:[I

    .line 8
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zzd:[J

    if-eqz v1, :cond_3

    array-length v2, v1

    if-lez v2, :cond_3

    .line 9
    invoke-virtual {v1}, [J->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [J

    iput-object v1, v0, Lcom/google/android/gms/internal/zzgst;->zzd:[J

    .line 10
    :cond_3
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgst;->zze:[J

    if-eqz p0, :cond_4

    array-length v1, p0

    if-lez v1, :cond_4

    .line 11
    invoke-virtual {p0}, [J->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [J

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgst;->zze:[J

    :cond_4
    return-object v0

    :catch_0
    move-exception p0

    .line 12
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public final computeSerializedSize()I
    .locals 7

    .line 1
    invoke-super {p0}, Lcom/google/android/gms/internal/zzgrt;->computeSerializedSize()I

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zza:[Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    array-length v0, v0

    if-lez v0, :cond_2

    move v0, v1

    move v2, v0

    move v3, v2

    .line 3
    :goto_0
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgst;->zza:[Ljava/lang/String;

    array-length v5, v4

    if-ge v0, v5, :cond_1

    .line 4
    aget-object v4, v4, v0

    if-eqz v4, :cond_0

    add-int/lit8 v3, v3, 0x1

    .line 5
    invoke-static {v4}, Lcom/google/android/gms/internal/zzgrr;->zza(Ljava/lang/CharSequence;)I

    move-result v4

    .line 6
    invoke-static {v4}, Lcom/google/android/gms/internal/zzgrr;->zzd(I)I

    move-result v5

    add-int/2addr v5, v4

    add-int/2addr v2, v5

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    add-int/2addr v2, v1

    mul-int/lit8 v3, v3, 0x1

    add-int/2addr v3, v2

    goto :goto_1

    :cond_2
    move v3, v1

    .line 7
    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zzb:[Ljava/lang/String;

    if-eqz v0, :cond_5

    array-length v0, v0

    if-lez v0, :cond_5

    move v0, v1

    move v2, v0

    move v4, v2

    .line 8
    :goto_2
    iget-object v5, p0, Lcom/google/android/gms/internal/zzgst;->zzb:[Ljava/lang/String;

    array-length v6, v5

    if-ge v0, v6, :cond_4

    .line 9
    aget-object v5, v5, v0

    if-eqz v5, :cond_3

    add-int/lit8 v4, v4, 0x1

    .line 10
    invoke-static {v5}, Lcom/google/android/gms/internal/zzgrr;->zza(Ljava/lang/CharSequence;)I

    move-result v5

    .line 11
    invoke-static {v5}, Lcom/google/android/gms/internal/zzgrr;->zzd(I)I

    move-result v6

    add-int/2addr v6, v5

    add-int/2addr v2, v6

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_4
    add-int/2addr v3, v2

    mul-int/lit8 v4, v4, 0x1

    add-int/2addr v3, v4

    .line 12
    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zzc:[I

    if-eqz v0, :cond_7

    array-length v0, v0

    if-lez v0, :cond_7

    move v0, v1

    move v2, v0

    .line 13
    :goto_3
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgst;->zzc:[I

    array-length v5, v4

    if-ge v0, v5, :cond_6

    .line 14
    aget v4, v4, v0

    .line 15
    invoke-static {v4}, Lcom/google/android/gms/internal/zzgrr;->zza(I)I

    move-result v4

    add-int/2addr v2, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_6
    add-int/2addr v3, v2

    .line 16
    array-length v0, v4

    mul-int/lit8 v0, v0, 0x1

    add-int/2addr v3, v0

    .line 17
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zzd:[J

    if-eqz v0, :cond_9

    array-length v0, v0

    if-lez v0, :cond_9

    move v0, v1

    move v2, v0

    .line 18
    :goto_4
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgst;->zzd:[J

    array-length v5, v4

    if-ge v0, v5, :cond_8

    .line 19
    aget-wide v4, v4, v0

    .line 20
    invoke-static {v4, v5}, Lcom/google/android/gms/internal/zzgrr;->zzb(J)I

    move-result v4

    add-int/2addr v2, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_8
    add-int/2addr v3, v2

    .line 21
    array-length v0, v4

    mul-int/lit8 v0, v0, 0x1

    add-int/2addr v3, v0

    .line 22
    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zze:[J

    if-eqz v0, :cond_b

    array-length v0, v0

    if-lez v0, :cond_b

    move v0, v1

    .line 23
    :goto_5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgst;->zze:[J

    array-length v4, v2

    if-ge v1, v4, :cond_a

    .line 24
    aget-wide v4, v2, v1

    .line 25
    invoke-static {v4, v5}, Lcom/google/android/gms/internal/zzgrr;->zzb(J)I

    move-result v2

    add-int/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_a
    add-int/2addr v3, v0

    .line 26
    array-length p0, v2

    mul-int/lit8 p0, p0, 0x1

    add-int/2addr v3, p0

    :cond_b
    return v3
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/zzgst;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzgst;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zza:[Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgst;->zza:[Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzgrx;->zza([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    .line 4
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zzb:[Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgst;->zzb:[Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzgrx;->zza([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    .line 5
    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zzc:[I

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgst;->zzc:[I

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzgrx;->zza([I[I)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    .line 6
    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zzd:[J

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgst;->zzd:[J

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzgrx;->zza([J[J)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    .line 7
    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zze:[J

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgst;->zze:[J

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/zzgrx;->zza([J[J)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    .line 8
    :cond_6
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v1

    if-eqz v1, :cond_7

    goto :goto_0

    .line 9
    :cond_7
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgrv;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 10
    :cond_8
    :goto_0
    iget-object p0, p1, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result p0

    if-eqz p0, :cond_9

    goto :goto_1

    :cond_9
    return v2

    :cond_a
    :goto_1
    return v0
.end method

.method public final hashCode()I
    .locals 4

    .line 1
    const-class v0, Lcom/google/android/gms/internal/zzgst;

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zza:[Ljava/lang/String;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/internal/zzgrx;->zza([Ljava/lang/Object;)I

    move-result v0

    const v1, -0x4806d0ee

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zzb:[Ljava/lang/String;

    .line 5
    invoke-static {v1}, Lcom/google/android/gms/internal/zzgrx;->zza([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 6
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zzc:[I

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 7
    array-length v3, v1

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([I)I

    move-result v1

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v2

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zzd:[J

    if-eqz v1, :cond_3

    .line 9
    array-length v3, v1

    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([J)I

    move-result v1

    goto :goto_3

    :cond_3
    :goto_2
    move v1, v2

    :goto_3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 10
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgst;->zze:[J

    if-eqz v1, :cond_5

    .line 11
    array-length v3, v1

    if-nez v3, :cond_4

    goto :goto_4

    :cond_4
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([J)I

    move-result v1

    goto :goto_5

    :cond_5
    :goto_4
    move v1, v2

    :goto_5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 12
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v1, :cond_7

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_6

    .line 13
    :cond_6
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->hashCode()I

    move-result v2

    :cond_7
    :goto_6
    add-int/2addr v0, v2

    return v0
.end method

.method public final writeTo(Lcom/google/android/gms/internal/zzgrr;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zza:[Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    array-length v0, v0

    if-lez v0, :cond_1

    move v0, v1

    .line 2
    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgst;->zza:[Ljava/lang/String;

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 3
    aget-object v2, v2, v0

    if-eqz v2, :cond_0

    const/4 v3, 0x1

    .line 4
    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzgrr;->zza(ILjava/lang/String;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 5
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zzb:[Ljava/lang/String;

    if-eqz v0, :cond_3

    array-length v0, v0

    if-lez v0, :cond_3

    move v0, v1

    .line 6
    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgst;->zzb:[Ljava/lang/String;

    array-length v3, v2

    if-ge v0, v3, :cond_3

    .line 7
    aget-object v2, v2, v0

    if-eqz v2, :cond_2

    const/4 v3, 0x2

    .line 8
    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzgrr;->zza(ILjava/lang/String;)V

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 9
    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zzc:[I

    if-eqz v0, :cond_4

    array-length v0, v0

    if-lez v0, :cond_4

    move v0, v1

    .line 10
    :goto_2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgst;->zzc:[I

    array-length v3, v2

    if-ge v0, v3, :cond_4

    const/4 v3, 0x3

    .line 11
    aget v2, v2, v0

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzgrr;->zza(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 12
    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zzd:[J

    if-eqz v0, :cond_5

    array-length v0, v0

    if-lez v0, :cond_5

    move v0, v1

    .line 13
    :goto_3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgst;->zzd:[J

    array-length v3, v2

    if-ge v0, v3, :cond_5

    const/4 v3, 0x4

    .line 14
    aget-wide v4, v2, v0

    invoke-virtual {p1, v3, v4, v5}, Lcom/google/android/gms/internal/zzgrr;->zzb(IJ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 15
    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zze:[J

    if-eqz v0, :cond_6

    array-length v0, v0

    if-lez v0, :cond_6

    .line 16
    :goto_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgst;->zze:[J

    array-length v2, v0

    if-ge v1, v2, :cond_6

    const/4 v2, 0x5

    .line 17
    aget-wide v3, v0, v1

    invoke-virtual {p1, v2, v3, v4}, Lcom/google/android/gms/internal/zzgrr;->zzb(IJ)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 18
    :cond_6
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzgrt;->writeTo(Lcom/google/android/gms/internal/zzgrr;)V

    return-void
.end method
