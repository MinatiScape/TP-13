.class public final Lcom/google/android/gms/clearcut/internal/zzr;
.super Lcom/google/android/gms/internal/zzez;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/clearcut/internal/zzq;


# direct methods
.method public constructor <init>(Landroid/os/IBinder;)V
    .locals 1

    const-string v0, "com.google.android.gms.clearcut.internal.IClearcutLoggerService"

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzez;-><init>(Landroid/os/IBinder;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/clearcut/internal/zzo;Lcom/google/android/gms/clearcut/LogEventParcelable;)V
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
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzfb;->zza(Landroid/os/Parcel;Landroid/os/IInterface;)V

    const/4 p1, 0x0

    const/4 v1, 0x1

    if-nez p2, :cond_0

    .line 3
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 5
    invoke-interface {p2, v0, p1}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    .line 6
    :goto_0
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/zzez;->zza:Landroid/os/IBinder;

    const/4 p1, 0x0

    invoke-interface {p0, v1, v0, p1, v1}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return-void

    :catchall_0
    move-exception p0

    .line 8
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw p0
.end method
