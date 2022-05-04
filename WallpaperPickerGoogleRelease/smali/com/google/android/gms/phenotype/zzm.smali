.class public final Lcom/google/android/gms/phenotype/zzm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/gms/phenotype/FlagOverrides;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;)I

    move-result p0

    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    if-ge v1, p0, :cond_1

    .line 3
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    const v2, 0xffff

    and-int/2addr v2, v1

    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    .line 4
    invoke-static {p1, v1}, Lcom/google/android/gms/internal/zzbkw;->zzb(Landroid/os/Parcel;I)V

    goto :goto_0

    .line 5
    :cond_0
    sget-object v0, Lcom/google/android/gms/phenotype/FlagOverride;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 6
    invoke-static {p1, v1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_0

    .line 7
    :cond_1
    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzbkw;->zzae(Landroid/os/Parcel;I)V

    .line 8
    new-instance p0, Lcom/google/android/gms/phenotype/FlagOverrides;

    invoke-direct {p0, v0}, Lcom/google/android/gms/phenotype/FlagOverrides;-><init>(Ljava/util/List;)V

    return-object p0
.end method

.method public final synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/google/android/gms/phenotype/FlagOverrides;

    return-object p0
.end method
