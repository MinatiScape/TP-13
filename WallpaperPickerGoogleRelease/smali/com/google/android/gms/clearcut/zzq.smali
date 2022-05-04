.class public final Lcom/google/android/gms/clearcut/zzq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/gms/clearcut/LogEventParcelable;",
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
    .locals 11

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;)I

    move-result p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    move-object v3, v0

    move-object v4, v3

    move-object v5, v4

    move-object v6, v5

    move-object v7, v6

    move-object v8, v7

    move-object v10, v8

    move v9, v1

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
    sget-object v1, Lcom/google/android/gms/phenotype/ExperimentTokens;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 6
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/zzbkw;->zzb(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, [Lcom/google/android/gms/phenotype/ExperimentTokens;

    goto :goto_0

    .line 7
    :pswitch_1
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;I)Z

    move-result v9

    goto :goto_0

    .line 8
    :pswitch_2
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzu(Landroid/os/Parcel;I)[[B

    move-result-object v8

    goto :goto_0

    .line 9
    :pswitch_3
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzw(Landroid/os/Parcel;I)[I

    move-result-object v7

    goto :goto_0

    .line 10
    :pswitch_4
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzaa(Landroid/os/Parcel;I)[Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 11
    :pswitch_5
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzw(Landroid/os/Parcel;I)[I

    move-result-object v5

    goto :goto_0

    .line 12
    :pswitch_6
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzbkw;->zzt(Landroid/os/Parcel;I)[B

    move-result-object v4

    goto :goto_0

    .line 13
    :pswitch_7
    sget-object v1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 14
    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    goto :goto_0

    .line 15
    :cond_0
    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzbkw;->zzae(Landroid/os/Parcel;I)V

    .line 16
    new-instance p0, Lcom/google/android/gms/clearcut/LogEventParcelable;

    move-object v2, p0

    invoke-direct/range {v2 .. v10}, Lcom/google/android/gms/clearcut/LogEventParcelable;-><init>(Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;[B[I[Ljava/lang/String;[I[[BZ[Lcom/google/android/gms/phenotype/ExperimentTokens;)V

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x2
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
    new-array p0, p1, [Lcom/google/android/gms/clearcut/LogEventParcelable;

    return-object p0
.end method
