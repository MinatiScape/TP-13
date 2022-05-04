.class public Lcom/google/android/gms/clearcut/CollectForDebugParcelable;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/clearcut/CollectForDebugParcelable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final collectForDebugExpiryTimeMillis:J

.field public final collectForDebugStartTimeMillis:J

.field public final skipPersistentStorage:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/clearcut/zzn;

    invoke-direct {v0}, Lcom/google/android/gms/clearcut/zzn;-><init>()V

    sput-object v0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ZJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput-boolean p1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->skipPersistentStorage:Z

    .line 3
    iput-wide p2, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugStartTimeMillis:J

    .line 4
    iput-wide p4, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugExpiryTimeMillis:J

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 2
    check-cast p1, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;

    .line 3
    iget-boolean v1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->skipPersistentStorage:Z

    iget-boolean v3, p1, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->skipPersistentStorage:Z

    if-ne v1, v3, :cond_1

    iget-wide v3, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugStartTimeMillis:J

    iget-wide v5, p1, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugStartTimeMillis:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_1

    iget-wide v3, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugExpiryTimeMillis:J

    iget-wide p0, p1, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugExpiryTimeMillis:J

    cmp-long p0, v3, p0

    if-nez p0, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget-boolean v1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->skipPersistentStorage:Z

    .line 2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-wide v1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugStartTimeMillis:J

    .line 3
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-wide v1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugExpiryTimeMillis:J

    .line 4
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 v1, 0x2

    aput-object p0, v0, v1

    .line 5
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CollectForDebugParcelable[skipPersistentStorage: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2
    iget-boolean v1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->skipPersistentStorage:Z

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ",collectForDebugStartTimeMillis: "

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    iget-wide v1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugStartTimeMillis:J

    .line 6
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ",collectForDebugExpiryTimeMillis: "

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    iget-wide v1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugExpiryTimeMillis:J

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, "]"

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
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

    const/4 v0, 0x1

    .line 2
    iget-boolean v1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->skipPersistentStorage:Z

    const/4 v2, 0x4

    .line 3
    invoke-static {p1, v0, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x2

    .line 5
    iget-wide v1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugExpiryTimeMillis:J

    const/16 v3, 0x8

    .line 6
    invoke-static {p1, v0, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 7
    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->writeLong(J)V

    const/4 v0, 0x3

    .line 8
    iget-wide v1, p0, Lcom/google/android/gms/clearcut/CollectForDebugParcelable;->collectForDebugStartTimeMillis:J

    .line 9
    invoke-static {p1, v0, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 10
    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->writeLong(J)V

    .line 11
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
