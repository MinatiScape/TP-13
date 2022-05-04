.class public final Lcom/google/android/gms/common/stats/WakeLockEvent;
.super Lcom/google/android/gms/common/stats/StatsEvent;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/common/stats/WakeLockEvent;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public final zzb:J

.field public zzc:I

.field public final zzd:Ljava/lang/String;

.field public final zze:Ljava/lang/String;

.field public final zzf:Ljava/lang/String;

.field public final zzg:I

.field public final zzh:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzi:Ljava/lang/String;

.field public final zzj:J

.field public zzk:I

.field public final zzl:Ljava/lang/String;

.field public final zzm:F

.field public final zzn:J

.field public zzo:J


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/common/stats/zzd;

    invoke-direct {v0}, Lcom/google/android/gms/common/stats/zzd;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IJILjava/lang/String;ILjava/util/List;Ljava/lang/String;JILjava/lang/String;Ljava/lang/String;FJLjava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJI",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "JI",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "FJ",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    move-object v0, p0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/common/stats/StatsEvent;-><init>()V

    move v1, p1

    .line 2
    iput v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zza:I

    move-wide v1, p2

    .line 3
    iput-wide v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzb:J

    move v1, p4

    .line 4
    iput v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzc:I

    move-object v1, p5

    .line 5
    iput-object v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzd:Ljava/lang/String;

    move-object v1, p12

    .line 6
    iput-object v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zze:Ljava/lang/String;

    move-object/from16 v1, p17

    .line 7
    iput-object v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzf:Ljava/lang/String;

    move v1, p6

    .line 8
    iput v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzg:I

    const-wide/16 v1, -0x1

    .line 9
    iput-wide v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzo:J

    move-object v1, p7

    .line 10
    iput-object v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzh:Ljava/util/List;

    move-object v1, p8

    .line 11
    iput-object v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzi:Ljava/lang/String;

    move-wide v1, p9

    .line 12
    iput-wide v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzj:J

    move v1, p11

    .line 13
    iput v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzk:I

    move-object/from16 v1, p13

    .line 14
    iput-object v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzl:Ljava/lang/String;

    move/from16 v1, p14

    .line 15
    iput v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzm:F

    move-wide/from16 v1, p15

    .line 16
    iput-wide v1, v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzn:J

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 6

    const/16 p2, 0x4f45

    .line 1
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x1

    .line 2
    iget v1, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zza:I

    const/4 v2, 0x4

    .line 3
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x2

    .line 5
    iget-wide v3, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzb:J

    const/16 v1, 0x8

    .line 6
    invoke-static {p1, v0, v1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 7
    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    .line 8
    iget-object v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzd:Ljava/lang/String;

    const/4 v3, 0x0

    .line 9
    invoke-static {p1, v2, v0, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x5

    .line 10
    iget v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzg:I

    .line 11
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 12
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x6

    .line 13
    iget-object v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzh:Ljava/util/List;

    if-nez v4, :cond_0

    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    .line 15
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 16
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    .line 17
    :goto_0
    iget-wide v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzj:J

    .line 18
    invoke-static {p1, v1, v1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 19
    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    const/16 v0, 0xa

    .line 20
    iget-object v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zze:Ljava/lang/String;

    .line 21
    invoke-static {p1, v0, v4, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 v0, 0xb

    .line 22
    iget v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzc:I

    .line 23
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 24
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    const/16 v0, 0xc

    .line 25
    iget-object v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzi:Ljava/lang/String;

    .line 26
    invoke-static {p1, v0, v4, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 v0, 0xd

    .line 27
    iget-object v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzl:Ljava/lang/String;

    .line 28
    invoke-static {p1, v0, v4, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 v0, 0xe

    .line 29
    iget v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzk:I

    .line 30
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 31
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    const/16 v0, 0xf

    .line 32
    iget v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzm:F

    .line 33
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 34
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeFloat(F)V

    const/16 v0, 0x10

    .line 35
    iget-wide v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzn:J

    .line 36
    invoke-static {p1, v0, v1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 37
    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    const/16 v0, 0x11

    .line 38
    iget-object p0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzf:Ljava/lang/String;

    .line 39
    invoke-static {p1, v0, p0, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 40
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public final zza()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzb:J

    return-wide v0
.end method

.method public final zzb()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzc:I

    return p0
.end method

.method public final zzc()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzo:J

    return-wide v0
.end method

.method public final zzd()Ljava/lang/String;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzd:Ljava/lang/String;

    .line 2
    iget v1, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzg:I

    .line 3
    iget-object v2, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzh:Ljava/util/List;

    const-string v3, ""

    if-nez v2, :cond_0

    move-object v2, v3

    goto :goto_0

    :cond_0
    const-string v4, ","

    .line 4
    invoke-static {v4, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    .line 5
    :goto_0
    iget v4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzk:I

    .line 6
    iget-object v5, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zze:Ljava/lang/String;

    if-nez v5, :cond_1

    move-object v5, v3

    .line 7
    :cond_1
    iget-object v6, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzl:Ljava/lang/String;

    if-nez v6, :cond_2

    move-object v6, v3

    .line 8
    :cond_2
    iget v7, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzm:F

    .line 9
    iget-object p0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzf:Ljava/lang/String;

    if-nez p0, :cond_3

    goto :goto_1

    :cond_3
    move-object v3, p0

    :goto_1
    const/16 p0, 0x2d

    .line 10
    invoke-static {v0, p0}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result p0

    invoke-static {v2, p0}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result p0

    invoke-static {v5, p0}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result p0

    invoke-static {v6, p0}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result p0

    invoke-static {v3, p0}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result p0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p0, "\t"

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
