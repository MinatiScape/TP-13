.class public Lcom/google/android/gms/common/server/response/FieldCreator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;",
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
.method public createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 12

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;)I

    move-result p0

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v8, v0

    move-object v10, v8

    move-object v11, v10

    move v3, v1

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    move v9, v7

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
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzb(Landroid/os/Parcel;I)V

    goto :goto_0

    .line 5
    :pswitch_0
    sget-object v1, Lcom/google/android/gms/internal/zzbly;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 6
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lcom/google/android/gms/internal/zzbly;

    goto :goto_0

    .line 7
    :pswitch_1
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzq(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v10

    goto :goto_0

    .line 8
    :pswitch_2
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v9

    goto :goto_0

    .line 9
    :pswitch_3
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzq(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v8

    goto :goto_0

    .line 10
    :pswitch_4
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;I)Z

    move-result v7

    goto :goto_0

    .line 11
    :pswitch_5
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v6

    goto :goto_0

    .line 12
    :pswitch_6
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;I)Z

    move-result v5

    goto :goto_0

    .line 13
    :pswitch_7
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v4

    goto :goto_0

    .line 14
    :pswitch_8
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v3

    goto :goto_0

    .line 15
    :cond_0
    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzbkw;->zzae(Landroid/os/Parcel;I)V

    .line 16
    new-instance p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;

    move-object v2, p0

    invoke-direct/range {v2 .. v11}, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;-><init>(IIZIZLjava/lang/String;ILjava/lang/String;Lcom/google/android/gms/internal/zzbly;)V

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;

    return-object p0
.end method
