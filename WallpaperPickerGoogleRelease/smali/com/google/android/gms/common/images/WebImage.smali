.class public final Lcom/google/android/gms/common/images/WebImage;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/common/images/WebImage;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public final zzb:Landroid/net/Uri;

.field public final zzc:I

.field public final zzd:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/common/images/zze;

    invoke-direct {v0}, Lcom/google/android/gms/common/images/zze;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/images/WebImage;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILandroid/net/Uri;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/common/images/WebImage;->zza:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/common/images/WebImage;->zzb:Landroid/net/Uri;

    .line 4
    iput p3, p0, Lcom/google/android/gms/common/images/WebImage;->zzc:I

    .line 5
    iput p4, p0, Lcom/google/android/gms/common/images/WebImage;->zzd:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_2

    .line 1
    instance-of v2, p1, Lcom/google/android/gms/common/images/WebImage;

    if-nez v2, :cond_1

    goto :goto_0

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/common/images/WebImage;

    .line 3
    iget-object v2, p0, Lcom/google/android/gms/common/images/WebImage;->zzb:Landroid/net/Uri;

    iget-object v3, p1, Lcom/google/android/gms/common/images/WebImage;->zzb:Landroid/net/Uri;

    invoke-static {v2, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/google/android/gms/common/images/WebImage;->zzc:I

    iget v3, p1, Lcom/google/android/gms/common/images/WebImage;->zzc:I

    if-ne v2, v3, :cond_2

    iget p0, p0, Lcom/google/android/gms/common/images/WebImage;->zzd:I

    iget p1, p1, Lcom/google/android/gms/common/images/WebImage;->zzd:I

    if-ne p0, p1, :cond_2

    return v0

    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget-object v1, p0, Lcom/google/android/gms/common/images/WebImage;->zzb:Landroid/net/Uri;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/android/gms/common/images/WebImage;->zzc:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget p0, p0, Lcom/google/android/gms/common/images/WebImage;->zzd:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v1, 0x2

    aput-object p0, v0, v1

    .line 2
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/google/android/gms/common/images/WebImage;->zzc:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/google/android/gms/common/images/WebImage;->zzd:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget-object p0, p0, Lcom/google/android/gms/common/images/WebImage;->zzb:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x2

    aput-object p0, v1, v2

    const-string p0, "Image %dx%d %s"

    invoke-static {v0, p0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 5

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    .line 2
    iget v2, p0, Lcom/google/android/gms/common/images/WebImage;->zza:I

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x2

    .line 5
    iget-object v2, p0, Lcom/google/android/gms/common/images/WebImage;->zzb:Landroid/net/Uri;

    const/4 v4, 0x0

    .line 6
    invoke-static {p1, v1, v2, p2, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    const/4 p2, 0x3

    .line 7
    iget v1, p0, Lcom/google/android/gms/common/images/WebImage;->zzc:I

    .line 8
    invoke-static {p1, p2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 9
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 10
    iget p0, p0, Lcom/google/android/gms/common/images/WebImage;->zzd:I

    .line 11
    invoke-static {p1, v3, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 12
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 13
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
