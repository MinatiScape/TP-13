.class public final Lcom/google/android/gms/internal/zzgsu;
.super Lcom/google/android/gms/internal/zzgrt;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzgrt<",
        "Lcom/google/android/gms/internal/zzgsu;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# instance fields
.field public zzc:[[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgrt;-><init>()V

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/zzgsc;->zzg:[[B

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgsu;->zzc:[[B

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    const/4 v0, -0x1

    .line 4
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

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgsu;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgsu;

    return-object p0
.end method

.method public final bridge synthetic clone()Lcom/google/android/gms/internal/zzgrz;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgsu;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgsu;

    return-object p0
.end method

.method public final clone()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-super {p0}, Lcom/google/android/gms/internal/zzgrt;->clone()Lcom/google/android/gms/internal/zzgrt;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgsu;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgsu;->zzc:[[B

    if-eqz p0, :cond_0

    array-length v1, p0

    if-lez v1, :cond_0

    .line 3
    invoke-virtual {p0}, [[B->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [[B

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgsu;->zzc:[[B

    :cond_0
    return-object v0

    :catch_0
    move-exception p0

    .line 4
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public final computeSerializedSize()I
    .locals 7

    .line 1
    invoke-super {p0}, Lcom/google/android/gms/internal/zzgrt;->computeSerializedSize()I

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/zzgsc;->zzh:[B

    invoke-static {v0, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    .line 3
    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzgrr;->zzb(I[B)I

    move-result v0

    add-int/2addr v0, v3

    goto :goto_0

    :cond_0
    move v0, v3

    .line 4
    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsu;->zzc:[[B

    if-eqz v1, :cond_3

    array-length v1, v1

    if-lez v1, :cond_3

    move v1, v3

    move v4, v1

    .line 5
    :goto_1
    iget-object v5, p0, Lcom/google/android/gms/internal/zzgsu;->zzc:[[B

    array-length v6, v5

    if-ge v3, v6, :cond_2

    .line 6
    aget-object v5, v5, v3

    if-eqz v5, :cond_1

    add-int/lit8 v4, v4, 0x1

    .line 7
    array-length v6, v5

    invoke-static {v6}, Lcom/google/android/gms/internal/zzgrr;->zzd(I)I

    move-result v6

    array-length v5, v5

    add-int/2addr v6, v5

    add-int/2addr v1, v6

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    add-int/2addr v0, v1

    mul-int/2addr v4, v2

    add-int/2addr v0, v4

    :cond_3
    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 10

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/zzgsu;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzgsu;

    .line 3
    sget-object v1, Lcom/google/android/gms/internal/zzgsc;->zzh:[B

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v1, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    .line 4
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsu;->zzc:[[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzgsu;->zzc:[[B

    sget-object v4, Lcom/google/android/gms/internal/zzgrx;->zzb:Ljava/lang/Object;

    if-nez v1, :cond_3

    move v4, v2

    goto :goto_0

    .line 5
    :cond_3
    array-length v4, v1

    :goto_0
    if-nez v3, :cond_4

    move v5, v2

    goto :goto_1

    .line 6
    :cond_4
    array-length v5, v3

    :goto_1
    move v6, v2

    move v7, v6

    :goto_2
    if-ge v6, v4, :cond_5

    .line 7
    aget-object v8, v1, v6

    if-nez v8, :cond_5

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_5
    :goto_3
    if-ge v7, v5, :cond_6

    .line 8
    aget-object v8, v3, v7

    if-nez v8, :cond_6

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_6
    if-lt v6, v4, :cond_7

    move v8, v0

    goto :goto_4

    :cond_7
    move v8, v2

    :goto_4
    if-lt v7, v5, :cond_8

    move v9, v0

    goto :goto_5

    :cond_8
    move v9, v2

    :goto_5
    if-eqz v8, :cond_9

    if-eqz v9, :cond_9

    move v1, v0

    goto :goto_7

    :cond_9
    if-eq v8, v9, :cond_a

    :goto_6
    move v1, v2

    goto :goto_7

    .line 9
    :cond_a
    aget-object v8, v1, v6

    aget-object v9, v3, v7

    invoke-static {v8, v9}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v8

    if-nez v8, :cond_10

    goto :goto_6

    :goto_7
    if-nez v1, :cond_b

    return v2

    .line 10
    :cond_b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v1, :cond_d

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v1

    if-eqz v1, :cond_c

    goto :goto_8

    .line 11
    :cond_c
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgrv;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 12
    :cond_d
    :goto_8
    iget-object p0, p1, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result p0

    if-eqz p0, :cond_e

    goto :goto_9

    :cond_e
    return v2

    :cond_f
    :goto_9
    return v0

    :cond_10
    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v7, v7, 0x1

    goto :goto_2
.end method

.method public final hashCode()I
    .locals 7

    .line 1
    const-class v0, Lcom/google/android/gms/internal/zzgsu;

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/zzgsc;->zzh:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    const v1, -0x4806d0cf

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgsu;->zzc:[[B

    .line 4
    sget-object v3, Lcom/google/android/gms/internal/zzgrx;->zzb:Ljava/lang/Object;

    if-nez v2, :cond_0

    move v3, v1

    goto :goto_0

    .line 5
    :cond_0
    array-length v3, v2

    :goto_0
    move v4, v1

    move v5, v4

    :goto_1
    if-ge v4, v3, :cond_2

    .line 6
    aget-object v6, v2, v4

    if-eqz v6, :cond_1

    mul-int/lit8 v5, v5, 0x1f

    .line 7
    invoke-static {v6}, Ljava/util/Arrays;->hashCode([B)I

    move-result v6

    add-int/2addr v5, v6

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    add-int/2addr v0, v5

    mul-int/lit8 v0, v0, 0x1f

    add-int/lit16 v0, v0, 0x4d5

    mul-int/lit8 v0, v0, 0x1f

    .line 8
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzgrv;->zzb()Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_2

    .line 9
    :cond_3
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->hashCode()I

    move-result v1

    :cond_4
    :goto_2
    add-int/2addr v0, v1

    return v0
.end method

.method public final writeTo(Lcom/google/android/gms/internal/zzgrr;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/zzgsc;->zzh:[B

    invoke-static {v0, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    .line 2
    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/internal/zzgrr;->zza(I[B)V

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgsu;->zzc:[[B

    if-eqz v0, :cond_2

    array-length v0, v0

    if-lez v0, :cond_2

    const/4 v0, 0x0

    .line 4
    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgsu;->zzc:[[B

    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 5
    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    const/4 v2, 0x2

    .line 6
    invoke-virtual {p1, v2, v1}, Lcom/google/android/gms/internal/zzgrr;->zza(I[B)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 7
    :cond_2
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzgrt;->writeTo(Lcom/google/android/gms/internal/zzgrr;)V

    return-void
.end method
