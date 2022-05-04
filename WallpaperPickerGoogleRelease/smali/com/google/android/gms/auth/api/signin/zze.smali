.class public final Lcom/google/android/gms/auth/api/signin/zze;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;",
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
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 12

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;)I

    move-result p0

    const/4 v0, 0x0

    const/4 v1, 0x0

    move v3, v0

    move v6, v3

    move v7, v6

    move v8, v7

    move-object v4, v1

    move-object v5, v4

    move-object v9, v5

    move-object v10, v9

    .line 2
    :goto_0
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    if-ge v0, p0, :cond_0

    .line 3
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const v2, 0xffff

    and-int/2addr v2, v0

    packed-switch v2, :pswitch_data_0

    .line 4
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzb(Landroid/os/Parcel;I)V

    goto :goto_0

    .line 5
    :pswitch_0
    sget-object v1, Lcom/google/android/gms/auth/api/signin/internal/zzo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 6
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_0

    .line 7
    :pswitch_1
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzq(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v10

    goto :goto_0

    .line 8
    :pswitch_2
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzq(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    .line 9
    :pswitch_3
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;I)Z

    move-result v8

    goto :goto_0

    .line 10
    :pswitch_4
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;I)Z

    move-result v7

    goto :goto_0

    .line 11
    :pswitch_5
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;I)Z

    move-result v6

    goto :goto_0

    .line 12
    :pswitch_6
    sget-object v2, Landroid/accounts/Account;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 13
    invoke-static {p1, v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/accounts/Account;

    goto :goto_0

    .line 14
    :pswitch_7
    sget-object v2, Lcom/google/android/gms/common/api/Scope;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 15
    invoke-static {p1, v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v4

    goto :goto_0

    .line 16
    :pswitch_8
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v3

    goto :goto_0

    .line 17
    :cond_0
    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzbkw;->zzae(Landroid/os/Parcel;I)V

    .line 18
    new-instance p0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    .line 19
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    if-nez v1, :cond_1

    goto :goto_2

    .line 20
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/auth/api/signin/internal/zzo;

    .line 21
    iget v1, v0, Lcom/google/android/gms/auth/api/signin/internal/zzo;->zzb:I

    .line 22
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    :goto_2
    move-object v2, p0

    .line 23
    invoke-direct/range {v2 .. v11}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;-><init>(ILjava/util/ArrayList;Landroid/accounts/Account;ZZZLjava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object p0

    nop

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

.method public final synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    return-object p0
.end method
