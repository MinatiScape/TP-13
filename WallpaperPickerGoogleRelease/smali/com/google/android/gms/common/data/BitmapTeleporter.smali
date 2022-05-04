.class public Lcom/google/android/gms/common/data/BitmapTeleporter;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/internal/ReflectedParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/common/data/BitmapTeleporter;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public zzb:Landroid/os/ParcelFileDescriptor;

.field public final zzc:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/common/data/zza;

    invoke-direct {v0}, Lcom/google/android/gms/common/data/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/data/BitmapTeleporter;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILandroid/os/ParcelFileDescriptor;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zza:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzb:Landroid/os/ParcelFileDescriptor;

    .line 4
    iput p3, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzc:I

    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzb:Landroid/os/ParcelFileDescriptor;

    .line 2
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    or-int/2addr p2, v0

    const/16 v1, 0x4f45

    .line 3
    invoke-static {p1, v1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v1

    .line 4
    iget v2, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zza:I

    const/4 v3, 0x4

    .line 5
    invoke-static {p1, v0, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 6
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x2

    .line 7
    iget-object v2, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzb:Landroid/os/ParcelFileDescriptor;

    const/4 v4, 0x0

    invoke-static {p1, v0, v2, p2, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    const/4 p2, 0x3

    .line 8
    iget v0, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzc:I

    .line 9
    invoke-static {p1, p2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 10
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 11
    invoke-static {p1, v1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lcom/google/android/gms/common/data/BitmapTeleporter;->zzb:Landroid/os/ParcelFileDescriptor;

    return-void
.end method
