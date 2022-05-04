.class public final Lcom/google/android/gms/common/internal/zzax;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/common/internal/zzax;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public zzb:Landroid/os/IBinder;

.field public zzc:Lcom/google/android/gms/common/ConnectionResult;

.field public zzd:Z

.field public zze:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/common/internal/zzay;

    invoke-direct {v0}, Lcom/google/android/gms/common/internal/zzay;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/internal/zzax;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILandroid/os/IBinder;Lcom/google/android/gms/common/ConnectionResult;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/common/internal/zzax;->zza:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/common/internal/zzax;->zzb:Landroid/os/IBinder;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/common/internal/zzax;->zzc:Lcom/google/android/gms/common/ConnectionResult;

    .line 5
    iput-boolean p4, p0, Lcom/google/android/gms/common/internal/zzax;->zzd:Z

    .line 6
    iput-boolean p5, p0, Lcom/google/android/gms/common/internal/zzax;->zze:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/common/internal/zzax;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/common/internal/zzax;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzax;->zzc:Lcom/google/android/gms/common/ConnectionResult;

    iget-object v3, p1, Lcom/google/android/gms/common/internal/zzax;->zzc:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/common/ConnectionResult;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/zzax;->zza()Lcom/google/android/gms/common/internal/IAccountAccessor;

    move-result-object p0

    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/zzax;->zza()Lcom/google/android/gms/common/internal/IAccountAccessor;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 5

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    .line 2
    iget v2, p0, Lcom/google/android/gms/common/internal/zzax;->zza:I

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x2

    .line 5
    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzax;->zzb:Landroid/os/IBinder;

    invoke-static {p1, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/IBinder;)V

    const/4 v1, 0x3

    .line 6
    iget-object v2, p0, Lcom/google/android/gms/common/internal/zzax;->zzc:Lcom/google/android/gms/common/ConnectionResult;

    const/4 v4, 0x0

    .line 7
    invoke-static {p1, v1, v2, p2, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 8
    iget-boolean p2, p0, Lcom/google/android/gms/common/internal/zzax;->zzd:Z

    .line 9
    invoke-static {p1, v3, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 10
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 p2, 0x5

    .line 11
    iget-boolean p0, p0, Lcom/google/android/gms/common/internal/zzax;->zze:Z

    .line 12
    invoke-static {p1, p2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 13
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 14
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public final zza()Lcom/google/android/gms/common/internal/IAccountAccessor;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/internal/zzax;->zzb:Landroid/os/IBinder;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "com.google.android.gms.common.internal.IAccountAccessor"

    .line 2
    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 3
    instance-of v1, v0, Lcom/google/android/gms/common/internal/IAccountAccessor;

    if-eqz v1, :cond_1

    .line 4
    check-cast v0, Lcom/google/android/gms/common/internal/IAccountAccessor;

    return-object v0

    .line 5
    :cond_1
    new-instance v0, Lcom/google/android/gms/common/internal/zzw;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/internal/zzw;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method
