.class public Lcom/google/android/gms/gcm/INetworkTaskCallback$Stub$Proxy;
.super Lcom/google/android/gms/internal/zzez;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/gcm/INetworkTaskCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/gcm/INetworkTaskCallback$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Proxy"
.end annotation


# direct methods
.method public constructor <init>(Landroid/os/IBinder;)V
    .locals 1

    const-string v0, "com.google.android.gms.gcm.INetworkTaskCallback"

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzez;-><init>(Landroid/os/IBinder;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public taskFinished(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzez;->a_()Landroid/os/Parcel;

    move-result-object v0

    .line 2
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 p1, 0x2

    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzez;->zzb(ILandroid/os/Parcel;)V

    return-void
.end method
