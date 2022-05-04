.class public final Landroidx/slice/view/R$layout;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static zza(Landroid/os/Parcel;)I
    .locals 1

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p0, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p0

    return p0
.end method

.method public static zza(Landroid/os/Parcel;ILandroid/os/Bundle;Z)V
    .locals 0

    if-nez p2, :cond_1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 13
    invoke-static {p0, p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    :cond_0
    return-void

    .line 14
    :cond_1
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p1

    .line 15
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 16
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public static zza(Landroid/os/Parcel;ILandroid/os/IBinder;)V
    .locals 0

    if-nez p2, :cond_0

    return-void

    .line 6
    :cond_0
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p1

    .line 7
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 8
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public static zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V
    .locals 0

    if-nez p2, :cond_1

    if-eqz p4, :cond_0

    const/4 p2, 0x0

    .line 9
    invoke-static {p0, p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    :cond_0
    return-void

    .line 10
    :cond_1
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p1

    .line 11
    invoke-interface {p2, p0, p3}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    .line 12
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public static zza(Landroid/os/Parcel;ILjava/lang/String;Z)V
    .locals 0

    if-nez p2, :cond_1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 2
    invoke-static {p0, p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    :cond_0
    return-void

    .line 3
    :cond_1
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p1

    .line 4
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 5
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public static zza(Landroid/os/Parcel;I[BZ)V
    .locals 0

    if-nez p2, :cond_1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 17
    invoke-static {p0, p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    :cond_0
    return-void

    .line 18
    :cond_1
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p1

    .line 19
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeByteArray([B)V

    .line 20
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public static zza(Landroid/os/Parcel;I[IZ)V
    .locals 0

    if-nez p2, :cond_1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 26
    invoke-static {p0, p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    :cond_0
    return-void

    .line 27
    :cond_1
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p1

    .line 28
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 29
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public static zza(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(",
            "Landroid/os/Parcel;",
            "I[TT;IZ)V"
        }
    .end annotation

    if-nez p2, :cond_0

    return-void

    .line 34
    :cond_0
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p1

    .line 35
    array-length v0, p2

    .line 36
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_2

    .line 37
    aget-object v3, p2, v2

    if-nez v3, :cond_1

    .line 38
    invoke-virtual {p0, v1}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_1

    .line 39
    :cond_1
    invoke-static {p0, v3, p3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;Landroid/os/Parcelable;I)V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 40
    :cond_2
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public static zza(Landroid/os/Parcel;I[Ljava/lang/String;Z)V
    .locals 0

    if-nez p2, :cond_1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 30
    invoke-static {p0, p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    :cond_0
    return-void

    .line 31
    :cond_1
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p1

    .line 32
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 33
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public static zza(Landroid/os/Parcel;I[[B)V
    .locals 3

    if-nez p2, :cond_0

    return-void

    .line 21
    :cond_0
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p1

    .line 22
    array-length v0, p2

    .line 23
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 24
    aget-object v2, p2, v1

    invoke-virtual {p0, v2}, Landroid/os/Parcel;->writeByteArray([B)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 25
    :cond_1
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public static zza(Landroid/os/Parcel;Landroid/os/Parcelable;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(",
            "Landroid/os/Parcel;",
            "TT;I)V"
        }
    .end annotation

    .line 41
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    const/4 v1, 0x1

    .line 42
    invoke-virtual {p0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 43
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 44
    invoke-interface {p1, p0, p2}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    .line 45
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result p1

    .line 46
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    sub-int p2, p1, v1

    .line 47
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 48
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->setDataPosition(I)V

    return-void
.end method

.method public static zzb(Landroid/os/Parcel;I)I
    .locals 1

    const/high16 v0, -0x10000

    or-int/2addr p1, v0

    .line 4
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 6
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result p0

    return p0
.end method

.method public static zzb(Landroid/os/Parcel;II)V
    .locals 1

    const v0, 0xffff

    if-lt p2, v0, :cond_0

    const/high16 v0, -0x10000

    or-int/2addr p1, v0

    .line 1
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 2
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void

    :cond_0
    shl-int/lit8 p2, p2, 0x10

    or-int/2addr p1, p2

    .line 3
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method

.method public static zzc(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int v1, v0, p1

    add-int/lit8 p1, p1, -0x4

    .line 2
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 3
    invoke-virtual {p0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-void
.end method

.method public static zzc(Landroid/os/Parcel;ILjava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(",
            "Landroid/os/Parcel;",
            "I",
            "Ljava/util/List<",
            "TT;>;Z)V"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p2, :cond_1

    if-eqz p3, :cond_0

    .line 5
    invoke-static {p0, p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    :cond_0
    return-void

    .line 6
    :cond_1
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p1

    .line 7
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p3

    .line 8
    invoke-virtual {p0, p3}, Landroid/os/Parcel;->writeInt(I)V

    move v1, v0

    :goto_0
    if-ge v1, p3, :cond_3

    .line 9
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Parcelable;

    if-nez v2, :cond_2

    .line 10
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_1

    .line 11
    :cond_2
    invoke-static {p0, v2, v0}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;Landroid/os/Parcelable;I)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 12
    :cond_3
    invoke-static {p0, p1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
