.class public abstract Lcom/google/android/gms/common/internal/zzab;
.super Lcom/google/android/gms/internal/zzfa;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/internal/zzaa;


# static fields
.field public static final synthetic $r8$clinit:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzfa;-><init>()V

    const-string v0, "com.google.android.gms.common.internal.ICertData"

    .line 2
    invoke-virtual {p0, p0, v0}, Landroid/os/Binder;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzfa;->zza(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p2

    const/4 p4, 0x1

    if-eqz p2, :cond_0

    return p4

    :cond_0
    if-eq p1, p4, :cond_2

    const/4 p2, 0x2

    if-eq p1, p2, :cond_1

    const/4 p0, 0x0

    return p0

    .line 2
    :cond_1
    check-cast p0, Lcom/google/android/gms/common/zzf;

    .line 3
    iget p0, p0, Lcom/google/android/gms/common/zzf;->zza:I

    .line 4
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 5
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 6
    :cond_2
    check-cast p0, Lcom/google/android/gms/common/zzf;

    invoke-virtual {p0}, Lcom/google/android/gms/common/zzf;->zzb()Lcom/google/android/gms/dynamic/IObjectWrapper;

    move-result-object p0

    .line 7
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 8
    invoke-static {p3, p0}, Lcom/google/android/gms/internal/zzfb;->zza(Landroid/os/Parcel;Landroid/os/IInterface;)V

    :goto_0
    return p4
.end method
