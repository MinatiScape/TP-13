.class public Lcom/google/android/gms/location/places/PlaceReport;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/internal/ReflectedParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/location/places/PlaceReport;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public final zzb:Ljava/lang/String;

.field public final zzc:Ljava/lang/String;

.field public final zzd:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/location/places/zzm;

    invoke-direct {v0}, Lcom/google/android/gms/location/places/zzm;-><init>()V

    sput-object v0, Lcom/google/android/gms/location/places/PlaceReport;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/location/places/PlaceReport;->zza:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzb:Ljava/lang/String;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzc:Ljava/lang/String;

    .line 5
    iput-object p4, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzd:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/location/places/PlaceReport;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 2
    :cond_0
    check-cast p1, Lcom/google/android/gms/location/places/PlaceReport;

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzb:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/location/places/PlaceReport;->zzb:Ljava/lang/String;

    invoke-static {v0, v2}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzc:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/location/places/PlaceReport;->zzc:Ljava/lang/String;

    .line 4
    invoke-static {v0, v2}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzd:Ljava/lang/String;

    iget-object p1, p1, Lcom/google/android/gms/location/places/PlaceReport;->zzd:Ljava/lang/String;

    .line 5
    invoke-static {p0, p1}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget-object v1, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzb:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzc:Ljava/lang/String;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object p0, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzd:Ljava/lang/String;

    const/4 v1, 0x2

    aput-object p0, v0, v1

    .line 2
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Landroidx/core/R$id;->zza(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzb:Ljava/lang/String;

    const-string v2, "placeId"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzc:Ljava/lang/String;

    const-string v2, "tag"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzd:Ljava/lang/String;

    const-string v2, "unknown"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 5
    iget-object p0, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzd:Ljava/lang/String;

    const-string v1, "source"

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzam;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/16 p2, 0x4f45

    .line 1
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x1

    .line 2
    iget v1, p0, Lcom/google/android/gms/location/places/PlaceReport;->zza:I

    const/4 v2, 0x4

    .line 3
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x2

    .line 5
    iget-object v1, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzb:Ljava/lang/String;

    const/4 v3, 0x0

    .line 6
    invoke-static {p1, v0, v1, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x3

    .line 7
    iget-object v1, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzc:Ljava/lang/String;

    .line 8
    invoke-static {p1, v0, v1, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 9
    iget-object p0, p0, Lcom/google/android/gms/location/places/PlaceReport;->zzd:Ljava/lang/String;

    .line 10
    invoke-static {p1, v2, p0, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 11
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
