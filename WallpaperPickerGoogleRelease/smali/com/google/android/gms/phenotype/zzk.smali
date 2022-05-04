.class public final Lcom/google/android/gms/phenotype/zzk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/gms/phenotype/Flag;",
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
    .locals 19

    move-object/from16 v0, p1

    .line 1
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    move v12, v2

    move/from16 v17, v12

    move/from16 v18, v17

    move-object v9, v3

    move-object v15, v9

    move-object/from16 v16, v15

    move-wide v10, v4

    move-wide v13, v6

    .line 2
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    if-ge v2, v1, :cond_0

    .line 3
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    const v3, 0xffff

    and-int/2addr v3, v2

    packed-switch v3, :pswitch_data_0

    .line 4
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zzb(Landroid/os/Parcel;I)V

    goto :goto_0

    .line 5
    :pswitch_0
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v18

    goto :goto_0

    .line 6
    :pswitch_1
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v17

    goto :goto_0

    .line 7
    :pswitch_2
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zzt(Landroid/os/Parcel;I)[B

    move-result-object v16

    goto :goto_0

    .line 8
    :pswitch_3
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zzq(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v15

    goto :goto_0

    .line 9
    :pswitch_4
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zzn(Landroid/os/Parcel;I)D

    move-result-wide v13

    goto :goto_0

    .line 10
    :pswitch_5
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;I)Z

    move-result v12

    goto :goto_0

    .line 11
    :pswitch_6
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zzi(Landroid/os/Parcel;I)J

    move-result-wide v10

    goto :goto_0

    .line 12
    :pswitch_7
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzbkw;->zzq(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    .line 13
    :cond_0
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzbkw;->zzae(Landroid/os/Parcel;I)V

    .line 14
    new-instance v0, Lcom/google/android/gms/phenotype/Flag;

    move-object v8, v0

    invoke-direct/range {v8 .. v18}, Lcom/google/android/gms/phenotype/Flag;-><init>(Ljava/lang/String;JZDLjava/lang/String;[BII)V

    return-object v0

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
    new-array p0, p1, [Lcom/google/android/gms/phenotype/Flag;

    return-object p0
.end method
