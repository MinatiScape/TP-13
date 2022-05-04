.class public final Lcom/google/android/gms/internal/zzeln;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/Result;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/internal/zzeln;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public zzb:I

.field public zzc:Landroid/content/Intent;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/zzelo;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzelo;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzeln;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    const/4 v0, 0x2

    .line 2
    iput v0, p0, Lcom/google/android/gms/internal/zzeln;->zza:I

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lcom/google/android/gms/internal/zzeln;->zzb:I

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/google/android/gms/internal/zzeln;->zzc:Landroid/content/Intent;

    return-void
.end method

.method public constructor <init>(IILandroid/content/Intent;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 6
    iput p1, p0, Lcom/google/android/gms/internal/zzeln;->zza:I

    .line 7
    iput p2, p0, Lcom/google/android/gms/internal/zzeln;->zzb:I

    .line 8
    iput-object p3, p0, Lcom/google/android/gms/internal/zzeln;->zzc:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final getStatus()Lcom/google/android/gms/common/api/Status;
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/zzeln;->zzb:I

    if-nez p0, :cond_0

    .line 2
    sget-object p0, Lcom/google/android/gms/common/api/Status;->zza:Lcom/google/android/gms/common/api/Status;

    return-object p0

    .line 3
    :cond_0
    sget-object p0, Lcom/google/android/gms/common/api/Status;->zze:Lcom/google/android/gms/common/api/Status;

    return-object p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    .line 2
    iget v2, p0, Lcom/google/android/gms/internal/zzeln;->zza:I

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x2

    .line 5
    iget v2, p0, Lcom/google/android/gms/internal/zzeln;->zzb:I

    .line 6
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 7
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x3

    .line 8
    iget-object p0, p0, Lcom/google/android/gms/internal/zzeln;->zzc:Landroid/content/Intent;

    const/4 v2, 0x0

    .line 9
    invoke-static {p1, v1, p0, p2, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 10
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
