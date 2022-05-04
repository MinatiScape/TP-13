.class public Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final isAnonymous:Z

.field public final logAndroidId:Z

.field public final logSource:I

.field public final logSourceName:Ljava/lang/String;

.field public final loggingId:Ljava/lang/String;

.field public final packageName:Ljava/lang/String;

.field public final packageVersionCode:I

.field public final qosTier:I

.field public final uploadAccountName:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/clearcut/internal/zzu;

    invoke-direct {v0}, Lcom/google/android/gms/clearcut/internal/zzu;-><init>()V

    sput-object v0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V
    .locals 1

    .line 11
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    const-string v0, "null reference"

    .line 12
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    iput-object p1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageName:Ljava/lang/String;

    .line 14
    iput p2, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageVersionCode:I

    .line 15
    iput p3, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSource:I

    .line 16
    iput-object p4, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSourceName:Ljava/lang/String;

    .line 17
    iput-object p5, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->uploadAccountName:Ljava/lang/String;

    .line 18
    iput-object p6, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->loggingId:Ljava/lang/String;

    xor-int/lit8 p1, p7, 0x1

    .line 19
    iput-boolean p1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logAndroidId:Z

    .line 20
    iput-boolean p7, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->isAnonymous:Z

    .line 21
    iput p8, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->qosTier:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageName:Ljava/lang/String;

    .line 3
    iput p2, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageVersionCode:I

    .line 4
    iput p3, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSource:I

    .line 5
    iput-object p4, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->uploadAccountName:Ljava/lang/String;

    .line 6
    iput-object p5, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->loggingId:Ljava/lang/String;

    .line 7
    iput-boolean p6, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logAndroidId:Z

    .line 8
    iput-object p7, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSourceName:Ljava/lang/String;

    .line 9
    iput-boolean p8, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->isAnonymous:Z

    .line 10
    iput p9, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->qosTier:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 2
    check-cast p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageName:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageName:Ljava/lang/String;

    invoke-static {v1, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageVersionCode:I

    iget v3, p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageVersionCode:I

    if-ne v1, v3, :cond_1

    iget v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSource:I

    iget v3, p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSource:I

    if-ne v1, v3, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSourceName:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSourceName:Ljava/lang/String;

    .line 4
    invoke-static {v1, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->uploadAccountName:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->uploadAccountName:Ljava/lang/String;

    .line 5
    invoke-static {v1, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->loggingId:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->loggingId:Ljava/lang/String;

    .line 6
    invoke-static {v1, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logAndroidId:Z

    iget-boolean v3, p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logAndroidId:Z

    if-ne v1, v3, :cond_1

    iget-boolean v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->isAnonymous:Z

    iget-boolean v3, p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->isAnonymous:Z

    if-ne v1, v3, :cond_1

    iget p0, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->qosTier:I

    iget p1, p1, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->qosTier:I

    if-ne p0, p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public hashCode()I
    .locals 3

    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageName:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageVersionCode:I

    .line 2
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSource:I

    .line 3
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSourceName:Ljava/lang/String;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->uploadAccountName:Ljava/lang/String;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->loggingId:Ljava/lang/String;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    iget-boolean v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logAndroidId:Z

    .line 4
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x6

    aput-object v1, v0, v2

    iget-boolean v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->isAnonymous:Z

    .line 5
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x7

    aput-object v1, v0, v2

    iget p0, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->qosTier:I

    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/16 v1, 0x8

    aput-object p0, v0, v1

    .line 7
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PlayLoggerContext["

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "package="

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, "packageVersionCode="

    .line 4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageVersionCode:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, "logSource="

    .line 5
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSource:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, "logSourceName="

    .line 6
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSourceName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, "uploadAccount="

    .line 7
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->uploadAccountName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, "loggingId="

    .line 8
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->loggingId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, "logAndroidId="

    .line 9
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logAndroidId:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, "isAnonymous="

    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->isAnonymous:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "qosTier="

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->qosTier:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "]"

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/16 p2, 0x4f45

    .line 1
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x2

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageName:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x3

    .line 3
    iget v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->packageVersionCode:I

    const/4 v3, 0x4

    .line 4
    invoke-static {p1, v0, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 5
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 6
    iget v0, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSource:I

    .line 7
    invoke-static {p1, v3, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x5

    .line 9
    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->uploadAccountName:Ljava/lang/String;

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x6

    .line 10
    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->loggingId:Ljava/lang/String;

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x7

    .line 11
    iget-boolean v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logAndroidId:Z

    .line 12
    invoke-static {p1, v0, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 13
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/16 v0, 0x8

    .line 14
    iget-object v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->logSourceName:Ljava/lang/String;

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 v0, 0x9

    .line 15
    iget-boolean v1, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->isAnonymous:Z

    .line 16
    invoke-static {p1, v0, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 17
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/16 v0, 0xa

    .line 18
    iget p0, p0, Lcom/google/android/gms/clearcut/internal/PlayLoggerContext;->qosTier:I

    .line 19
    invoke-static {p1, v0, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 20
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 21
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
