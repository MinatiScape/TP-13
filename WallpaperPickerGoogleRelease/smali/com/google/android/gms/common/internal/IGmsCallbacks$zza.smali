.class public abstract Lcom/google/android/gms/common/internal/IGmsCallbacks$zza;
.super Lcom/google/android/gms/internal/zzfa;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/internal/IGmsCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/IGmsCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "zza"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzfa;-><init>()V

    const-string v0, "com.google.android.gms.common.internal.IGmsCallbacks"

    .line 2
    invoke-virtual {p0, p0, v0}, Landroid/os/Binder;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzfa;->zza(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p4

    const/4 v0, 0x1

    if-eqz p4, :cond_0

    return v0

    :cond_0
    if-eq p1, v0, :cond_2

    const/4 p0, 0x2

    if-eq p1, p0, :cond_1

    const/4 p0, 0x0

    return p0

    .line 2
    :cond_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 3
    sget-object p0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, p0}, Lcom/google/android/gms/internal/zzfb;->zza(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object p0

    check-cast p0, Landroid/os/Bundle;

    .line 4
    new-instance p0, Ljava/lang/Exception;

    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    const-string p1, "GmsClient"

    const-string p2, "received deprecated onAccountValidationComplete callback, ignoring"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 5
    :cond_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    .line 6
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p4

    .line 7
    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, v1}, Lcom/google/android/gms/internal/zzfb;->zza(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/os/Bundle;

    .line 8
    check-cast p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;

    .line 9
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const-string v2, "onPostInitComplete can be called only once per call to getRemoteService"

    invoke-static {v1, v2}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zzb:I

    .line 11
    iget-object v3, v1, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;

    invoke-direct {v4, v1, p1, p4, p2}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IBinder;Landroid/os/Bundle;)V

    const/4 p1, -0x1

    .line 12
    invoke-virtual {v3, v0, v2, p1, v4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 13
    invoke-virtual {v3, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 15
    :goto_0
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v0
.end method
