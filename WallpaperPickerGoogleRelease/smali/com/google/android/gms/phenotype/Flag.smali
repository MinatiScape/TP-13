.class public Lcom/google/android/gms/phenotype/Flag;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzbkv;",
        "Ljava/lang/Comparable<",
        "Lcom/google/android/gms/phenotype/Flag;",
        ">;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/phenotype/Flag;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final flagStorageType:I

.field public final flagValueType:I

.field public final name:Ljava/lang/String;

.field public final zza:J

.field public final zzb:Z

.field public final zzc:D

.field public final zzd:Ljava/lang/String;

.field public final zze:[B


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/phenotype/zzk;

    invoke-direct {v0}, Lcom/google/android/gms/phenotype/zzk;-><init>()V

    sput-object v0, Lcom/google/android/gms/phenotype/Flag;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JZDLjava/lang/String;[BII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    .line 3
    iput-wide p2, p0, Lcom/google/android/gms/phenotype/Flag;->zza:J

    .line 4
    iput-boolean p4, p0, Lcom/google/android/gms/phenotype/Flag;->zzb:Z

    .line 5
    iput-wide p5, p0, Lcom/google/android/gms/phenotype/Flag;->zzc:D

    .line 6
    iput-object p7, p0, Lcom/google/android/gms/phenotype/Flag;->zzd:Ljava/lang/String;

    .line 7
    iput-object p8, p0, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    .line 8
    iput p9, p0, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    .line 9
    iput p10, p0, Lcom/google/android/gms/phenotype/Flag;->flagStorageType:I

    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 7

    .line 1
    check-cast p1, Lcom/google/android/gms/phenotype/Flag;

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    iget-object v1, p1, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    goto/16 :goto_6

    .line 3
    :cond_0
    iget v0, p0, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    iget v2, p1, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-ge v0, v2, :cond_1

    move v2, v3

    goto :goto_0

    :cond_1
    if-ne v0, v2, :cond_2

    move v2, v4

    goto :goto_0

    :cond_2
    move v2, v1

    :goto_0
    if-eqz v2, :cond_3

    :goto_1
    move v0, v2

    goto/16 :goto_6

    :cond_3
    if-eq v0, v1, :cond_12

    const/4 v2, 0x2

    if-eq v0, v2, :cond_10

    const/4 v2, 0x3

    if-eq v0, v2, :cond_f

    const/4 v2, 0x4

    if-eq v0, v2, :cond_b

    const/4 v2, 0x5

    if-ne v0, v2, :cond_a

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    iget-object v2, p1, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    if-ne v0, v2, :cond_4

    goto/16 :goto_4

    :cond_4
    if-nez v0, :cond_5

    goto/16 :goto_3

    :cond_5
    if-nez v2, :cond_6

    goto/16 :goto_5

    :cond_6
    move v0, v4

    .line 5
    :goto_2
    iget-object v2, p0, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    array-length v2, v2

    iget-object v5, p1, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    array-length v5, v5

    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v0, v2, :cond_8

    .line 6
    iget-object v2, p0, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    aget-byte v2, v2, v0

    iget-object v5, p1, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    aget-byte v5, v5, v0

    sub-int/2addr v2, v5

    if-eqz v2, :cond_7

    goto :goto_1

    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 7
    :cond_8
    iget-object p0, p0, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    array-length p0, p0

    iget-object p1, p1, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    array-length p1, p1

    if-ge p0, p1, :cond_9

    goto :goto_3

    :cond_9
    if-ne p0, p1, :cond_15

    goto :goto_4

    .line 8
    :cond_a
    new-instance p1, Ljava/lang/AssertionError;

    iget p0, p0, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    const/16 v0, 0x1f

    const-string v1, "Invalid enum value: "

    invoke-static {v0, v1, p0}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 9
    :cond_b
    iget-object p0, p0, Lcom/google/android/gms/phenotype/Flag;->zzd:Ljava/lang/String;

    iget-object p1, p1, Lcom/google/android/gms/phenotype/Flag;->zzd:Ljava/lang/String;

    if-ne p0, p1, :cond_c

    goto :goto_4

    :cond_c
    if-nez p0, :cond_d

    goto :goto_3

    :cond_d
    if-nez p1, :cond_e

    goto :goto_5

    .line 10
    :cond_e
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_6

    .line 11
    :cond_f
    iget-wide v0, p0, Lcom/google/android/gms/phenotype/Flag;->zzc:D

    iget-wide p0, p1, Lcom/google/android/gms/phenotype/Flag;->zzc:D

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    goto :goto_6

    .line 12
    :cond_10
    iget-boolean p0, p0, Lcom/google/android/gms/phenotype/Flag;->zzb:Z

    iget-boolean p1, p1, Lcom/google/android/gms/phenotype/Flag;->zzb:Z

    if-ne p0, p1, :cond_11

    goto :goto_4

    :cond_11
    if-eqz p0, :cond_13

    goto :goto_5

    .line 13
    :cond_12
    iget-wide v5, p0, Lcom/google/android/gms/phenotype/Flag;->zza:J

    iget-wide p0, p1, Lcom/google/android/gms/phenotype/Flag;->zza:J

    cmp-long p0, v5, p0

    if-gez p0, :cond_14

    :cond_13
    :goto_3
    move v0, v3

    goto :goto_6

    :cond_14
    if-nez p0, :cond_15

    :goto_4
    move v0, v4

    goto :goto_6

    :cond_15
    :goto_5
    move v0, v1

    :goto_6
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/phenotype/Flag;

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 2
    check-cast p1, Lcom/google/android/gms/phenotype/Flag;

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    invoke-static {v0, v2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    iget v0, p0, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    iget v2, p1, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    if-ne v0, v2, :cond_8

    iget v2, p0, Lcom/google/android/gms/phenotype/Flag;->flagStorageType:I

    iget v3, p1, Lcom/google/android/gms/phenotype/Flag;->flagStorageType:I

    if-eq v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    if-eq v0, v2, :cond_7

    const/4 v3, 0x2

    if-eq v0, v3, :cond_5

    const/4 v3, 0x3

    if-eq v0, v3, :cond_3

    const/4 v1, 0x4

    if-eq v0, v1, :cond_2

    const/4 v1, 0x5

    if-ne v0, v1, :cond_1

    .line 4
    iget-object p0, p0, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    iget-object p1, p1, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p0

    return p0

    .line 5
    :cond_1
    new-instance p1, Ljava/lang/AssertionError;

    iget p0, p0, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    const/16 v0, 0x1f

    const-string v1, "Invalid enum value: "

    invoke-static {v0, v1, p0}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 6
    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/phenotype/Flag;->zzd:Ljava/lang/String;

    iget-object p1, p1, Lcom/google/android/gms/phenotype/Flag;->zzd:Ljava/lang/String;

    invoke-static {p0, p1}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 7
    :cond_3
    iget-wide v3, p0, Lcom/google/android/gms/phenotype/Flag;->zzc:D

    iget-wide p0, p1, Lcom/google/android/gms/phenotype/Flag;->zzc:D

    cmpl-double p0, v3, p0

    if-nez p0, :cond_4

    return v2

    :cond_4
    return v1

    .line 8
    :cond_5
    iget-boolean p0, p0, Lcom/google/android/gms/phenotype/Flag;->zzb:Z

    iget-boolean p1, p1, Lcom/google/android/gms/phenotype/Flag;->zzb:Z

    if-ne p0, p1, :cond_6

    return v2

    :cond_6
    return v1

    .line 9
    :cond_7
    iget-wide v3, p0, Lcom/google/android/gms/phenotype/Flag;->zza:J

    iget-wide p0, p1, Lcom/google/android/gms/phenotype/Flag;->zza:J

    cmp-long p0, v3, p0

    if-nez p0, :cond_8

    return v2

    :cond_8
    :goto_0
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/phenotype/Flag;->toString(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public toString(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 5

    const-string v0, "Flag("

    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    iget v1, p0, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_5

    const/4 v2, 0x2

    if-eq v1, v2, :cond_4

    const/4 v2, 0x3

    if-eq v1, v2, :cond_3

    const/4 v3, 0x4

    const-string v4, "\'"

    if-eq v1, v3, :cond_2

    const/4 v3, 0x5

    if-ne v1, v3, :cond_1

    .line 7
    iget-object v1, p0, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    if-nez v1, :cond_0

    const-string v1, "null"

    .line 8
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    iget-object v1, p0, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    invoke-static {v1, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 12
    :cond_1
    new-instance p1, Ljava/lang/AssertionError;

    iget-object v1, p0, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    iget p0, p0, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    const/16 v2, 0x1b

    invoke-static {v1, v2}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Invalid type: "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 13
    :cond_2
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    iget-object v1, p0, Lcom/google/android/gms/phenotype/Flag;->zzd:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 16
    :cond_3
    iget-wide v1, p0, Lcom/google/android/gms/phenotype/Flag;->zzc:D

    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 17
    :cond_4
    iget-boolean v1, p0, Lcom/google/android/gms/phenotype/Flag;->zzb:Z

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 18
    :cond_5
    iget-wide v1, p0, Lcom/google/android/gms/phenotype/Flag;->zza:J

    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    iget v1, p0, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    iget p0, p0, Lcom/google/android/gms/phenotype/Flag;->flagStorageType:I

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 6

    const/16 p2, 0x4f45

    .line 1
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x2

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x3

    .line 3
    iget-wide v3, p0, Lcom/google/android/gms/phenotype/Flag;->zza:J

    const/16 v1, 0x8

    .line 4
    invoke-static {p1, v0, v1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 5
    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    .line 6
    iget-boolean v0, p0, Lcom/google/android/gms/phenotype/Flag;->zzb:Z

    const/4 v3, 0x4

    .line 7
    invoke-static {p1, v3, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x5

    .line 9
    iget-wide v4, p0, Lcom/google/android/gms/phenotype/Flag;->zzc:D

    .line 10
    invoke-static {p1, v0, v1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 11
    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeDouble(D)V

    const/4 v0, 0x6

    .line 12
    iget-object v4, p0, Lcom/google/android/gms/phenotype/Flag;->zzd:Ljava/lang/String;

    invoke-static {p1, v0, v4, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x7

    .line 13
    iget-object v4, p0, Lcom/google/android/gms/phenotype/Flag;->zze:[B

    invoke-static {p1, v0, v4, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[BZ)V

    .line 14
    iget v0, p0, Lcom/google/android/gms/phenotype/Flag;->flagValueType:I

    .line 15
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 16
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    const/16 v0, 0x9

    .line 17
    iget p0, p0, Lcom/google/android/gms/phenotype/Flag;->flagStorageType:I

    .line 18
    invoke-static {p1, v0, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 19
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 20
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
