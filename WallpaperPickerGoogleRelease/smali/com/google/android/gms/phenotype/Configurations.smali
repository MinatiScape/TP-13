.class public Lcom/google/android/gms/phenotype/Configurations;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/phenotype/Configurations;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final configurationMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/gms/phenotype/Configuration;",
            ">;"
        }
    .end annotation
.end field

.field public final configurationVersion:J

.field public final configurations:[Lcom/google/android/gms/phenotype/Configuration;

.field public final experimentToken:[B

.field public final isDelta:Z

.field public final serverToken:Ljava/lang/String;

.field public final snapshotToken:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/phenotype/zzc;

    invoke-direct {v0}, Lcom/google/android/gms/phenotype/zzc;-><init>()V

    sput-object v0, Lcom/google/android/gms/phenotype/Configurations;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Lcom/google/android/gms/phenotype/Configuration;Z[BJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/phenotype/Configurations;->snapshotToken:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/phenotype/Configurations;->serverToken:Ljava/lang/String;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/phenotype/Configurations;->configurations:[Lcom/google/android/gms/phenotype/Configuration;

    .line 5
    iput-boolean p4, p0, Lcom/google/android/gms/phenotype/Configurations;->isDelta:Z

    .line 6
    iput-object p5, p0, Lcom/google/android/gms/phenotype/Configurations;->experimentToken:[B

    .line 7
    iput-wide p6, p0, Lcom/google/android/gms/phenotype/Configurations;->configurationVersion:J

    .line 8
    new-instance p1, Ljava/util/TreeMap;

    invoke-direct {p1}, Ljava/util/TreeMap;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/phenotype/Configurations;->configurationMap:Ljava/util/Map;

    .line 9
    array-length p1, p3

    const/4 p2, 0x0

    :goto_0
    if-ge p2, p1, :cond_0

    aget-object p4, p3, p2

    .line 10
    iget-object p5, p0, Lcom/google/android/gms/phenotype/Configurations;->configurationMap:Ljava/util/Map;

    iget p6, p4, Lcom/google/android/gms/phenotype/Configuration;->flagType:I

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p6

    invoke-interface {p5, p6, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/phenotype/Configurations;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/google/android/gms/phenotype/Configurations;

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/phenotype/Configurations;->snapshotToken:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/phenotype/Configurations;->snapshotToken:Ljava/lang/String;

    invoke-static {v0, v2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/phenotype/Configurations;->serverToken:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/phenotype/Configurations;->serverToken:Ljava/lang/String;

    .line 4
    invoke-static {v0, v2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/phenotype/Configurations;->configurationMap:Ljava/util/Map;

    iget-object v2, p1, Lcom/google/android/gms/phenotype/Configurations;->configurationMap:Ljava/util/Map;

    .line 5
    invoke-interface {v0, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/phenotype/Configurations;->isDelta:Z

    iget-boolean v2, p1, Lcom/google/android/gms/phenotype/Configurations;->isDelta:Z

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/phenotype/Configurations;->experimentToken:[B

    iget-object v2, p1, Lcom/google/android/gms/phenotype/Configurations;->experimentToken:[B

    .line 6
    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v2, p0, Lcom/google/android/gms/phenotype/Configurations;->configurationVersion:J

    iget-wide p0, p1, Lcom/google/android/gms/phenotype/Configurations;->configurationVersion:J

    cmp-long p0, v2, p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget-object v1, p0, Lcom/google/android/gms/phenotype/Configurations;->snapshotToken:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/phenotype/Configurations;->serverToken:Ljava/lang/String;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/phenotype/Configurations;->configurationMap:Ljava/util/Map;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget-boolean v1, p0, Lcom/google/android/gms/phenotype/Configurations;->isDelta:Z

    .line 2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/phenotype/Configurations;->experimentToken:[B

    const/4 v2, 0x4

    aput-object v1, v0, v2

    iget-wide v1, p0, Lcom/google/android/gms/phenotype/Configurations;->configurationVersion:J

    .line 3
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 v1, 0x5

    aput-object p0, v0, v1

    .line 4
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Configurations(\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/phenotype/Configurations;->snapshotToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", "

    .line 4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 6
    iget-object v3, p0, Lcom/google/android/gms/phenotype/Configurations;->serverToken:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 8
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x28

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 10
    iget-object v1, p0, Lcom/google/android/gms/phenotype/Configurations;->configurationMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/phenotype/Configuration;

    .line 11
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const/16 v1, 0x29

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    iget-boolean v3, p0, Lcom/google/android/gms/phenotype/Configurations;->isDelta:Z

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    iget-object v3, p0, Lcom/google/android/gms/phenotype/Configurations;->experimentToken:[B

    if-nez v3, :cond_1

    const-string v3, "null"

    goto :goto_1

    :cond_1
    const/4 v4, 0x3

    .line 18
    invoke-static {v3, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3

    .line 19
    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    iget-wide v2, p0, Lcom/google/android/gms/phenotype/Configurations;->configurationVersion:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x2

    .line 2
    iget-object v2, p0, Lcom/google/android/gms/phenotype/Configurations;->snapshotToken:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1, v1, v2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v1, 0x3

    .line 3
    iget-object v2, p0, Lcom/google/android/gms/phenotype/Configurations;->serverToken:Ljava/lang/String;

    invoke-static {p1, v1, v2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/phenotype/Configurations;->configurations:[Lcom/google/android/gms/phenotype/Configuration;

    const/4 v2, 0x4

    invoke-static {p1, v2, v1, p2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    const/4 p2, 0x5

    .line 5
    iget-boolean v1, p0, Lcom/google/android/gms/phenotype/Configurations;->isDelta:Z

    .line 6
    invoke-static {p1, p2, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 7
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 p2, 0x6

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/phenotype/Configurations;->experimentToken:[B

    invoke-static {p1, p2, v1, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[BZ)V

    const/4 p2, 0x7

    .line 9
    iget-wide v1, p0, Lcom/google/android/gms/phenotype/Configurations;->configurationVersion:J

    const/16 p0, 0x8

    .line 10
    invoke-static {p1, p2, p0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 11
    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->writeLong(J)V

    .line 12
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
