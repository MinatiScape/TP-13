.class public final Lcom/google/android/gms/internal/zzbly;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/internal/zzbly;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public final zzb:Lcom/google/android/gms/internal/zzbma;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/zzblz;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzblz;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzbly;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILcom/google/android/gms/internal/zzbma;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/internal/zzbly;->zza:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/internal/zzbly;->zzb:Lcom/google/android/gms/internal/zzbma;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzbma;)V
    .locals 1

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/google/android/gms/internal/zzbly;->zza:I

    .line 6
    iput-object p1, p0, Lcom/google/android/gms/internal/zzbly;->zzb:Lcom/google/android/gms/internal/zzbma;

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    .line 2
    iget v2, p0, Lcom/google/android/gms/internal/zzbly;->zza:I

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x2

    .line 5
    iget-object p0, p0, Lcom/google/android/gms/internal/zzbly;->zzb:Lcom/google/android/gms/internal/zzbma;

    const/4 v2, 0x0

    .line 6
    invoke-static {p1, v1, p0, p2, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 7
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
