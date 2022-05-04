.class public final Lcom/google/android/gms/common/data/DataHolder;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation build Lcom/google/android/gms/common/annotation/KeepName;
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/common/data/DataHolder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public final zzb:[Ljava/lang/String;

.field public zzc:Landroid/os/Bundle;

.field public final zzd:[Landroid/database/CursorWindow;

.field public final zze:I

.field public final zzf:Landroid/os/Bundle;

.field public zzg:[I

.field public zzi:Z

.field public zzj:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/common/data/zzf;

    invoke-direct {v0}, Lcom/google/android/gms/common/data/zzf;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/data/DataHolder;->CREATOR:Landroid/os/Parcelable$Creator;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "null reference"

    .line 2
    invoke-static {v0, v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method

.method public constructor <init>(I[Ljava/lang/String;[Landroid/database/CursorWindow;ILandroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzi:Z

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzj:Z

    .line 4
    iput p1, p0, Lcom/google/android/gms/common/data/DataHolder;->zza:I

    .line 5
    iput-object p2, p0, Lcom/google/android/gms/common/data/DataHolder;->zzb:[Ljava/lang/String;

    .line 6
    iput-object p3, p0, Lcom/google/android/gms/common/data/DataHolder;->zzd:[Landroid/database/CursorWindow;

    .line 7
    iput p4, p0, Lcom/google/android/gms/common/data/DataHolder;->zze:I

    .line 8
    iput-object p5, p0, Lcom/google/android/gms/common/data/DataHolder;->zzf:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzi:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzi:Z

    const/4 v0, 0x0

    .line 4
    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/common/data/DataHolder;->zzd:[Landroid/database/CursorWindow;

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 5
    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/database/CursorWindow;->close()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 6
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final finalize()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzj:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzd:[Landroid/database/CursorWindow;

    array-length v0, v0

    if-lez v0, :cond_0

    .line 2
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/common/data/DataHolder;->zzi:Z

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_0

    .line 4
    :try_start_2
    invoke-virtual {p0}, Lcom/google/android/gms/common/data/DataHolder;->close()V

    const-string v0, "DataBuffer"

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit16 v2, v2, 0xb2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Internal data leak within a DataBuffer object detected!  Be sure to explicitly call release() on all DataBuffer extending objects when you are done with them. (internal object: "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 6
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 7
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 8
    :cond_0
    :goto_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void

    :catchall_1
    move-exception v0

    .line 9
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 6

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/common/data/DataHolder;->zzb:[Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 3
    invoke-static {p1, v2, v1, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[Ljava/lang/String;Z)V

    const/4 v1, 0x2

    .line 4
    iget-object v4, p0, Lcom/google/android/gms/common/data/DataHolder;->zzd:[Landroid/database/CursorWindow;

    .line 5
    invoke-static {p1, v1, v4, p2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    const/4 v1, 0x3

    .line 6
    iget v4, p0, Lcom/google/android/gms/common/data/DataHolder;->zze:I

    const/4 v5, 0x4

    .line 7
    invoke-static {p1, v1, v5}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 8
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    iget-object v1, p0, Lcom/google/android/gms/common/data/DataHolder;->zzf:Landroid/os/Bundle;

    .line 10
    invoke-static {p1, v5, v1, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Bundle;Z)V

    const/16 v1, 0x3e8

    .line 11
    iget v3, p0, Lcom/google/android/gms/common/data/DataHolder;->zza:I

    .line 12
    invoke-static {p1, v1, v5}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 13
    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 14
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    and-int/lit8 p1, p2, 0x1

    if-eqz p1, :cond_0

    .line 15
    invoke-virtual {p0}, Lcom/google/android/gms/common/data/DataHolder;->close()V

    :cond_0
    return-void
.end method
