.class public final Lcom/google/android/gms/internal/zzbmb;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/internal/zzbmb;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:Ljava/lang/String;

.field public final zzb:I

.field public final zzc:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/zzbmd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzbmd;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzbmb;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/internal/zzbmb;->zzc:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/internal/zzbmb;->zza:Ljava/lang/String;

    .line 4
    iput p3, p0, Lcom/google/android/gms/internal/zzbmb;->zzb:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 5
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    const/4 v0, 0x1

    .line 6
    iput v0, p0, Lcom/google/android/gms/internal/zzbmb;->zzc:I

    .line 7
    iput-object p1, p0, Lcom/google/android/gms/internal/zzbmb;->zza:Ljava/lang/String;

    .line 8
    iput p2, p0, Lcom/google/android/gms/internal/zzbmb;->zzb:I

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/16 p2, 0x4f45

    .line 1
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x1

    .line 2
    iget v1, p0, Lcom/google/android/gms/internal/zzbmb;->zzc:I

    const/4 v2, 0x4

    .line 3
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x2

    .line 5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzbmb;->zza:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1, v0, v1, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x3

    .line 6
    iget p0, p0, Lcom/google/android/gms/internal/zzbmb;->zzb:I

    .line 7
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 8
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
