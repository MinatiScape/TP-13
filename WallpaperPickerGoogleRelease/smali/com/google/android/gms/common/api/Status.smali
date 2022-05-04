.class public final Lcom/google/android/gms/common/api/Status;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/Result;
.implements Lcom/google/android/gms/common/internal/ReflectedParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation
.end field

.field public static final zza:Lcom/google/android/gms/common/api/Status;

.field public static final zzb:Lcom/google/android/gms/common/api/Status;

.field public static final zzc:Lcom/google/android/gms/common/api/Status;

.field public static final zzd:Lcom/google/android/gms/common/api/Status;

.field public static final zze:Lcom/google/android/gms/common/api/Status;


# instance fields
.field public final zzh:I

.field public final zzi:I

.field public final zzj:Ljava/lang/String;

.field public final zzk:Landroid/app/PendingIntent;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    sput-object v0, Lcom/google/android/gms/common/api/Status;->zza:Lcom/google/android/gms/common/api/Status;

    .line 2
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    sput-object v0, Lcom/google/android/gms/common/api/Status;->zzb:Lcom/google/android/gms/common/api/Status;

    .line 3
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    sput-object v0, Lcom/google/android/gms/common/api/Status;->zzc:Lcom/google/android/gms/common/api/Status;

    .line 4
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    sput-object v0, Lcom/google/android/gms/common/api/Status;->zzd:Lcom/google/android/gms/common/api/Status;

    .line 5
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    sput-object v0, Lcom/google/android/gms/common/api/Status;->zze:Lcom/google/android/gms/common/api/Status;

    .line 6
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    .line 7
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    .line 8
    new-instance v0, Lcom/google/android/gms/common/api/zzf;

    invoke-direct {v0}, Lcom/google/android/gms/common/api/zzf;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 6
    invoke-direct {p0, v0, p1, v1, v1}, Lcom/google/android/gms/common/api/Status;-><init>(IILjava/lang/String;Landroid/app/PendingIntent;)V

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Landroid/app/PendingIntent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/common/api/Status;->zzh:I

    .line 3
    iput p2, p0, Lcom/google/android/gms/common/api/Status;->zzi:I

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/common/api/Status;->zzj:Ljava/lang/String;

    .line 5
    iput-object p4, p0, Lcom/google/android/gms/common/api/Status;->zzk:Landroid/app/PendingIntent;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 7
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/google/android/gms/common/api/Status;-><init>(IILjava/lang/String;Landroid/app/PendingIntent;)V

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/common/api/Status;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 2
    :cond_0
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    .line 3
    iget v0, p0, Lcom/google/android/gms/common/api/Status;->zzh:I

    iget v2, p1, Lcom/google/android/gms/common/api/Status;->zzh:I

    if-ne v0, v2, :cond_1

    iget v0, p0, Lcom/google/android/gms/common/api/Status;->zzi:I

    iget v2, p1, Lcom/google/android/gms/common/api/Status;->zzi:I

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/common/api/Status;->zzj:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/common/api/Status;->zzj:Ljava/lang/String;

    .line 4
    invoke-static {v0, v2}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/google/android/gms/common/api/Status;->zzk:Landroid/app/PendingIntent;

    iget-object p1, p1, Lcom/google/android/gms/common/api/Status;->zzk:Landroid/app/PendingIntent;

    .line 5
    invoke-static {p0, p1}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method public final getStatus()Lcom/google/android/gms/common/api/Status;
    .locals 0

    return-object p0
.end method

.method public final hashCode()I
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget v1, p0, Lcom/google/android/gms/common/api/Status;->zzh:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/android/gms/common/api/Status;->zzi:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/common/api/Status;->zzj:Ljava/lang/String;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget-object p0, p0, Lcom/google/android/gms/common/api/Status;->zzk:Landroid/app/PendingIntent;

    const/4 v1, 0x3

    aput-object p0, v0, v1

    .line 2
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final isSuccess()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/common/api/Status;->zzi:I

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Landroidx/core/R$id;->zza(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/common/api/Status;->zzj:Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget v1, p0, Lcom/google/android/gms/common/api/Status;->zzi:I

    invoke-static {v1}, Landroidx/fragment/R$id;->getStatusCodeString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    const-string v2, "statusCode"

    .line 4
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    iget-object p0, p0, Lcom/google/android/gms/common/api/Status;->zzk:Landroid/app/PendingIntent;

    const-string v1, "resolution"

    .line 5
    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzam;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 5

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    .line 2
    iget v1, p0, Lcom/google/android/gms/common/api/Status;->zzi:I

    const/4 v2, 0x1

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 5
    iget-object v1, p0, Lcom/google/android/gms/common/api/Status;->zzj:Ljava/lang/String;

    const/4 v2, 0x2

    const/4 v4, 0x0

    .line 6
    invoke-static {p1, v2, v1, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 7
    iget-object v1, p0, Lcom/google/android/gms/common/api/Status;->zzk:Landroid/app/PendingIntent;

    const/4 v2, 0x3

    .line 8
    invoke-static {p1, v2, v1, p2, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 9
    iget p0, p0, Lcom/google/android/gms/common/api/Status;->zzh:I

    const/16 p2, 0x3e8

    .line 10
    invoke-static {p1, p2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 11
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 12
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
