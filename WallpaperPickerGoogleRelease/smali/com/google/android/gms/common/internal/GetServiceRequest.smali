.class public Lcom/google/android/gms/common/internal/GetServiceRequest;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/common/internal/GetServiceRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public final zzb:I

.field public zzc:I

.field public zzd:Ljava/lang/String;

.field public zze:Landroid/os/IBinder;

.field public zzf:[Lcom/google/android/gms/common/api/Scope;

.field public zzg:Landroid/os/Bundle;

.field public zzh:Landroid/accounts/Account;

.field public zzi:[Lcom/google/android/gms/common/Feature;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/common/internal/zzk;

    invoke-direct {v0}, Lcom/google/android/gms/common/internal/zzk;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/internal/GetServiceRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    const/4 v0, 0x3

    .line 2
    iput v0, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zza:I

    .line 3
    sget v0, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    iput v0, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzc:I

    .line 4
    iput p1, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzb:I

    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;Landroid/os/IBinder;[Lcom/google/android/gms/common/api/Scope;Landroid/os/Bundle;Landroid/accounts/Account;[Lcom/google/android/gms/common/Feature;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 6
    iput p1, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zza:I

    .line 7
    iput p2, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzb:I

    .line 8
    iput p3, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzc:I

    const-string p2, "com.google.android.gms"

    .line 9
    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 10
    iput-object p2, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzd:Ljava/lang/String;

    goto :goto_0

    .line 11
    :cond_0
    iput-object p4, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzd:Ljava/lang/String;

    :goto_0
    const/4 p2, 0x2

    if-ge p1, p2, :cond_3

    const/4 p1, 0x0

    if-eqz p5, :cond_2

    const-string p2, "com.google.android.gms.common.internal.IAccountAccessor"

    .line 12
    invoke-interface {p5, p2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object p2

    .line 13
    instance-of p3, p2, Lcom/google/android/gms/common/internal/IAccountAccessor;

    if-eqz p3, :cond_1

    .line 14
    check-cast p2, Lcom/google/android/gms/common/internal/IAccountAccessor;

    goto :goto_1

    .line 15
    :cond_1
    new-instance p2, Lcom/google/android/gms/common/internal/zzw;

    invoke-direct {p2, p5}, Lcom/google/android/gms/common/internal/zzw;-><init>(Landroid/os/IBinder;)V

    .line 16
    :goto_1
    sget p3, Lcom/google/android/gms/common/internal/zza;->$r8$clinit:I

    if-eqz p2, :cond_2

    .line 17
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide p3

    .line 18
    :try_start_0
    invoke-interface {p2}, Lcom/google/android/gms/common/internal/IAccountAccessor;->getAccount()Landroid/accounts/Account;

    move-result-object p1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    invoke-static {p3, p4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_3

    :catchall_0
    move-exception p0

    goto :goto_2

    :catch_0
    :try_start_1
    const-string p2, "AccountAccessor"

    const-string p5, "Remote account accessor probably died"

    .line 20
    invoke-static {p2, p5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    invoke-static {p3, p4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto :goto_3

    .line 22
    :goto_2
    invoke-static {p3, p4}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw p0

    .line 23
    :cond_2
    :goto_3
    iput-object p1, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzh:Landroid/accounts/Account;

    goto :goto_4

    .line 24
    :cond_3
    iput-object p5, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zze:Landroid/os/IBinder;

    .line 25
    iput-object p8, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzh:Landroid/accounts/Account;

    .line 26
    :goto_4
    iput-object p6, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzf:[Lcom/google/android/gms/common/api/Scope;

    .line 27
    iput-object p7, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzg:Landroid/os/Bundle;

    .line 28
    iput-object p9, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzi:[Lcom/google/android/gms/common/Feature;

    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    .line 2
    iget v2, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zza:I

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x2

    .line 5
    iget v2, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzb:I

    .line 6
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 7
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x3

    .line 8
    iget v2, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzc:I

    .line 9
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 10
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 11
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzd:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, v3, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v1, 0x5

    .line 12
    iget-object v3, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zze:Landroid/os/IBinder;

    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/IBinder;)V

    const/4 v1, 0x6

    .line 13
    iget-object v3, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzf:[Lcom/google/android/gms/common/api/Scope;

    invoke-static {p1, v1, v3, p2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    const/4 v1, 0x7

    .line 14
    iget-object v3, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzg:Landroid/os/Bundle;

    invoke-static {p1, v1, v3, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Bundle;Z)V

    const/16 v1, 0x8

    .line 15
    iget-object v3, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzh:Landroid/accounts/Account;

    invoke-static {p1, v1, v3, p2, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    const/16 v1, 0xa

    .line 16
    iget-object p0, p0, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzi:[Lcom/google/android/gms/common/Feature;

    invoke-static {p1, v1, p0, p2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    .line 17
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
