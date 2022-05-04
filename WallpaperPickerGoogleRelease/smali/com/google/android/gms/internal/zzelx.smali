.class public final Lcom/google/android/gms/internal/zzelx;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/internal/zzelx;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public final zzb:Lcom/google/android/gms/common/ConnectionResult;

.field public final zzc:Lcom/google/android/gms/common/internal/zzax;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/zzely;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzely;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzelx;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 5
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v1, 0x8

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    .line 6
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    const/4 v1, 0x1

    .line 7
    iput v1, p0, Lcom/google/android/gms/internal/zzelx;->zza:I

    .line 8
    iput-object v0, p0, Lcom/google/android/gms/internal/zzelx;->zzb:Lcom/google/android/gms/common/ConnectionResult;

    .line 9
    iput-object v2, p0, Lcom/google/android/gms/internal/zzelx;->zzc:Lcom/google/android/gms/common/internal/zzax;

    return-void
.end method

.method public constructor <init>(ILcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/internal/zzax;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/internal/zzelx;->zza:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/internal/zzelx;->zzb:Lcom/google/android/gms/common/ConnectionResult;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/internal/zzelx;->zzc:Lcom/google/android/gms/common/internal/zzax;

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
    iget v2, p0, Lcom/google/android/gms/internal/zzelx;->zza:I

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x2

    .line 5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzelx;->zzb:Lcom/google/android/gms/common/ConnectionResult;

    const/4 v3, 0x0

    .line 6
    invoke-static {p1, v1, v2, p2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    const/4 v1, 0x3

    .line 7
    iget-object p0, p0, Lcom/google/android/gms/internal/zzelx;->zzc:Lcom/google/android/gms/common/internal/zzax;

    .line 8
    invoke-static {p1, v1, p0, p2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 9
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
