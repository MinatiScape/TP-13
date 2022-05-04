.class public final Lcom/google/android/gms/auth/api/signin/internal/zzo;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/auth/api/signin/internal/zzo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public zzb:I

.field public zzc:Landroid/os/Bundle;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/auth/api/signin/internal/zzn;

    invoke-direct {v0}, Lcom/google/android/gms/auth/api/signin/internal/zzn;-><init>()V

    sput-object v0, Lcom/google/android/gms/auth/api/signin/internal/zzo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IILandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/auth/api/signin/internal/zzo;->zza:I

    .line 3
    iput p2, p0, Lcom/google/android/gms/auth/api/signin/internal/zzo;->zzb:I

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/auth/api/signin/internal/zzo;->zzc:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    const/16 p2, 0x4f45

    .line 1
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x1

    .line 2
    iget v1, p0, Lcom/google/android/gms/auth/api/signin/internal/zzo;->zza:I

    const/4 v2, 0x4

    .line 3
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x2

    .line 5
    iget v1, p0, Lcom/google/android/gms/auth/api/signin/internal/zzo;->zzb:I

    .line 6
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 7
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x3

    .line 8
    iget-object p0, p0, Lcom/google/android/gms/auth/api/signin/internal/zzo;->zzc:Landroid/os/Bundle;

    const/4 v1, 0x0

    .line 9
    invoke-static {p1, v0, p0, v1}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Bundle;Z)V

    .line 10
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
