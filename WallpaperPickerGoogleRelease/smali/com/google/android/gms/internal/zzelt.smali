.class public final Lcom/google/android/gms/internal/zzelt;
.super Lcom/google/android/gms/internal/zzez;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/internal/zzels;


# direct methods
.method public constructor <init>(Landroid/os/IBinder;)V
    .locals 1

    const-string v0, "com.google.android.gms.signin.internal.ISignInService"

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzez;-><init>(Landroid/os/IBinder;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/zzelv;Lcom/google/android/gms/internal/zzelq;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzez;->a_()Landroid/os/Parcel;

    move-result-object v0

    .line 2
    sget v1, Lcom/google/android/gms/internal/zzfb;->$r8$clinit:I

    const/4 v1, 0x1

    .line 3
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzelv;->writeToParcel(Landroid/os/Parcel;I)V

    .line 5
    invoke-static {v0, p2}, Lcom/google/android/gms/internal/zzfb;->zza(Landroid/os/Parcel;Landroid/os/IInterface;)V

    const/16 p1, 0xc

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzez;->zzb(ILandroid/os/Parcel;)V

    return-void
.end method
