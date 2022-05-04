.class public final Lcom/google/android/gms/common/internal/zzk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/gms/common/internal/GetServiceRequest;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 12

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;)I

    move-result p0

    const/4 v0, 0x0

    const/4 v1, 0x0

    move v3, v0

    move v4, v3

    move v5, v4

    move-object v6, v1

    move-object v7, v6

    move-object v8, v7

    move-object v9, v8

    move-object v10, v9

    move-object v11, v10

    .line 2
    :goto_0
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-ge v0, p0, :cond_0

    .line 3
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const v1, 0xffff

    and-int/2addr v1, v0

    packed-switch v1, :pswitch_data_0

    .line 4
    :pswitch_0
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzb(Landroid/os/Parcel;I)V

    goto :goto_0

    .line 5
    :pswitch_1
    sget-object v1, Lcom/google/android/gms/common/Feature;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 6
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/zzbkw;->zzb(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, [Lcom/google/android/gms/common/Feature;

    goto :goto_0

    .line 7
    :pswitch_2
    sget-object v1, Landroid/accounts/Account;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 8
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Landroid/accounts/Account;

    goto :goto_0

    .line 9
    :pswitch_3
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzs(Landroid/os/Parcel;I)Landroid/os/Bundle;

    move-result-object v9

    goto :goto_0

    .line 10
    :pswitch_4
    sget-object v1, Lcom/google/android/gms/common/api/Scope;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 11
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/zzbkw;->zzb(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, [Lcom/google/android/gms/common/api/Scope;

    goto :goto_0

    .line 12
    :pswitch_5
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzr(Landroid/os/Parcel;I)Landroid/os/IBinder;

    move-result-object v7

    goto :goto_0

    .line 13
    :pswitch_6
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzq(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 14
    :pswitch_7
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v5

    goto :goto_0

    .line 15
    :pswitch_8
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v4

    goto :goto_0

    .line 16
    :pswitch_9
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v3

    goto :goto_0

    .line 17
    :cond_0
    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzbkw;->zzae(Landroid/os/Parcel;I)V

    .line 18
    new-instance p0, Lcom/google/android/gms/common/internal/GetServiceRequest;

    move-object v2, p0

    invoke-direct/range {v2 .. v11}, Lcom/google/android/gms/common/internal/GetServiceRequest;-><init>(IIILjava/lang/String;Landroid/os/IBinder;[Lcom/google/android/gms/common/api/Scope;Landroid/os/Bundle;Landroid/accounts/Account;[Lcom/google/android/gms/common/Feature;)V

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/google/android/gms/common/internal/GetServiceRequest;

    return-object p0
.end method
