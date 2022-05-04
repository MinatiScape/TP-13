.class public final Lcom/google/android/gms/internal/zzbkw;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static zza(Landroid/os/Parcel;)I
    .locals 5

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 6
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result v1

    .line 7
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    const v3, 0xffff

    and-int/2addr v3, v0

    const/16 v4, 0x4f45

    if-eq v3, v4, :cond_1

    .line 8
    new-instance v1, Lcom/google/android/gms/internal/zzbkx;

    const-string v2, "Expected object header. Got 0x"

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-direct {v1, v0, p0}, Lcom/google/android/gms/internal/zzbkx;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    throw v1

    :cond_1
    add-int/2addr v1, v2

    if-lt v1, v2, :cond_2

    .line 9
    invoke-virtual {p0}, Landroid/os/Parcel;->dataSize()I

    move-result v0

    if-gt v1, v0, :cond_2

    return v1

    .line 10
    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/zzbkx;

    const/16 v3, 0x36

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "Size read is invalid start="

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " end="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/internal/zzbkx;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    throw v0
.end method

.method public static zza(Landroid/os/Parcel;I)I
    .locals 2

    const/high16 v0, -0x10000

    and-int v1, p1, v0

    if-eq v1, v0, :cond_0

    shr-int/lit8 p0, p1, 0x10

    const p1, 0xffff

    and-int/2addr p0, p1

    return p0

    .line 1
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result p0

    return p0
.end method

.method public static zza(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(",
            "Landroid/os/Parcel;",
            "I",
            "Landroid/os/Parcelable$Creator<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 11
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 12
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 13
    :cond_0
    invoke-interface {p2, p0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/os/Parcelable;

    add-int/2addr v0, p1

    .line 14
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object p2
.end method

.method public static zza(Landroid/os/Parcel;II)V
    .locals 5

    .line 2
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    if-ne p1, p2, :cond_0

    return-void

    .line 3
    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzbkx;

    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    invoke-static {v1, v2}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "Expected size "

    const-string v4, " got "

    invoke-static {v2, v3, p2, v4, p1}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " (0x"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Lcom/google/android/gms/internal/zzbkx;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    throw v0
.end method

.method public static zzaa(Landroid/os/Parcel;I)[Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v1

    add-int/2addr v0, p1

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object v1
.end method

.method public static zzad(Landroid/os/Parcel;I)Landroid/os/Parcel;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 4
    invoke-virtual {v1, p0, v0, p1}, Landroid/os/Parcel;->appendFrom(Landroid/os/Parcel;II)V

    add-int/2addr v0, p1

    .line 5
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object v1
.end method

.method public static zzae(Landroid/os/Parcel;I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-ne v0, p1, :cond_0

    return-void

    .line 2
    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzbkx;

    const/16 v1, 0x25

    const-string v2, "Overread allowed size end="

    invoke-static {v1, v2, p1}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Lcom/google/android/gms/internal/zzbkx;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    throw v0
.end method

.method public static zzb(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-void
.end method

.method public static zzb(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/os/Parcel;",
            "I",
            "Landroid/os/Parcelable$Creator<",
            "TT;>;)[TT;"
        }
    .end annotation

    .line 3
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 4
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->createTypedArray(Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object p2

    add-int/2addr v0, p1

    .line 6
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object p2
.end method

.method public static zzc(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/os/Parcel;",
            "I",
            "Landroid/os/Parcelable$Creator<",
            "TT;>;)",
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation

    .line 3
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 4
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object p2

    add-int/2addr v0, p1

    .line 6
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object p2
.end method

.method public static zzc(Landroid/os/Parcel;I)Z
    .locals 1

    const/4 v0, 0x4

    .line 1
    invoke-static {p0, p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;II)V

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static zzg(Landroid/os/Parcel;I)I
    .locals 1

    const/4 v0, 0x4

    .line 1
    invoke-static {p0, p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;II)V

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result p0

    return p0
.end method

.method public static zzi(Landroid/os/Parcel;I)J
    .locals 1

    const/16 v0, 0x8

    .line 1
    invoke-static {p0, p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;II)V

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->readLong()J

    move-result-wide p0

    return-wide p0
.end method

.method public static zzk(Landroid/os/Parcel;I)Ljava/math/BigInteger;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v1

    add-int/2addr v0, p1

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 5
    new-instance p0, Ljava/math/BigInteger;

    invoke-direct {p0, v1}, Ljava/math/BigInteger;-><init>([B)V

    return-object p0
.end method

.method public static zzl(Landroid/os/Parcel;I)F
    .locals 1

    const/4 v0, 0x4

    .line 1
    invoke-static {p0, p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;II)V

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->readFloat()F

    move-result p0

    return p0
.end method

.method public static zzn(Landroid/os/Parcel;I)D
    .locals 1

    const/16 v0, 0x8

    .line 1
    invoke-static {p0, p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;II)V

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->readDouble()D

    move-result-wide p0

    return-wide p0
.end method

.method public static zzp(Landroid/os/Parcel;I)Ljava/math/BigDecimal;
    .locals 3

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v1

    .line 4
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v2

    add-int/2addr v0, p1

    .line 5
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 6
    new-instance p0, Ljava/math/BigDecimal;

    new-instance p1, Ljava/math/BigInteger;

    invoke-direct {p1, v1}, Ljava/math/BigInteger;-><init>([B)V

    invoke-direct {p0, p1, v2}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;I)V

    return-object p0
.end method

.method public static zzq(Landroid/os/Parcel;I)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    add-int/2addr v0, p1

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object v1
.end method

.method public static zzr(Landroid/os/Parcel;I)Landroid/os/IBinder;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v1

    add-int/2addr v0, p1

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object v1
.end method

.method public static zzs(Landroid/os/Parcel;I)Landroid/os/Bundle;
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v1

    add-int/2addr v0, p1

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object v1
.end method

.method public static zzt(Landroid/os/Parcel;I)[B
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v1

    add-int/2addr v0, p1

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object v1
.end method

.method public static zzu(Landroid/os/Parcel;I)[[B
    .locals 5

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 4
    new-array v2, v1, [[B

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 5
    invoke-virtual {p0}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    add-int/2addr v0, p1

    .line 6
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object v2
.end method

.method public static zzw(Landroid/os/Parcel;I)[I
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result p1

    .line 2
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v1

    add-int/2addr v0, p1

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object v1
.end method
