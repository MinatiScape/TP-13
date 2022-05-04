.class public final Lcom/google/android/gms/internal/zzgrv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final zza:Lcom/google/android/gms/internal/zzgrw;


# instance fields
.field public zzc:[I

.field public zzd:[Lcom/google/android/gms/internal/zzgrw;

.field public zze:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/zzgrw;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzgrw;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzgrv;->zza:Lcom/google/android/gms/internal/zzgrw;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0xa

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzgrv;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    shl-int/lit8 p1, p1, 0x2

    const/4 v0, 0x4

    move v1, v0

    :goto_0
    const/16 v2, 0x20

    if-ge v1, v2, :cond_1

    const/4 v2, 0x1

    shl-int/2addr v2, v1

    add-int/lit8 v2, v2, -0xc

    if-gt p1, v2, :cond_0

    move p1, v2

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3
    :cond_1
    :goto_1
    div-int/2addr p1, v0

    .line 4
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgrv;->zzc:[I

    .line 5
    new-array p1, p1, [Lcom/google/android/gms/internal/zzgrw;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgrv;->zzd:[Lcom/google/android/gms/internal/zzgrw;

    const/4 p1, 0x0

    .line 6
    iput p1, p0, Lcom/google/android/gms/internal/zzgrv;->zze:I

    return-void
.end method


# virtual methods
.method public final clone()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/zzgrv;->zze:I

    .line 2
    new-instance v1, Lcom/google/android/gms/internal/zzgrv;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/zzgrv;-><init>(I)V

    .line 3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgrv;->zzc:[I

    iget-object v3, v1, Lcom/google/android/gms/internal/zzgrv;->zzc:[I

    const/4 v4, 0x0

    invoke-static {v2, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_0
    if-ge v4, v0, :cond_1

    .line 4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgrv;->zzd:[Lcom/google/android/gms/internal/zzgrw;

    aget-object v3, v2, v4

    if-eqz v3, :cond_0

    .line 5
    iget-object v3, v1, Lcom/google/android/gms/internal/zzgrv;->zzd:[Lcom/google/android/gms/internal/zzgrw;

    aget-object v2, v2, v4

    .line 6
    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzgrw;->zzc()Lcom/google/android/gms/internal/zzgrw;

    move-result-object v2

    .line 7
    aput-object v2, v3, v4

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 8
    :cond_1
    iput v0, v1, Lcom/google/android/gms/internal/zzgrv;->zze:I

    return-object v1
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 8

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/internal/zzgrv;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzgrv;

    .line 3
    iget v1, p0, Lcom/google/android/gms/internal/zzgrv;->zze:I

    iget v3, p1, Lcom/google/android/gms/internal/zzgrv;->zze:I

    if-eq v1, v3, :cond_2

    return v2

    .line 4
    :cond_2
    iget-object v3, p0, Lcom/google/android/gms/internal/zzgrv;->zzc:[I

    iget-object v4, p1, Lcom/google/android/gms/internal/zzgrv;->zzc:[I

    move v5, v2

    :goto_0
    if-ge v5, v1, :cond_4

    .line 5
    aget v6, v3, v5

    aget v7, v4, v5

    if-eq v6, v7, :cond_3

    move v1, v2

    goto :goto_1

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_4
    move v1, v0

    :goto_1
    if-eqz v1, :cond_7

    .line 6
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgrv;->zzd:[Lcom/google/android/gms/internal/zzgrw;

    iget-object p1, p1, Lcom/google/android/gms/internal/zzgrv;->zzd:[Lcom/google/android/gms/internal/zzgrw;

    iget p0, p0, Lcom/google/android/gms/internal/zzgrv;->zze:I

    move v3, v2

    :goto_2
    if-ge v3, p0, :cond_6

    .line 7
    aget-object v4, v1, v3

    aget-object v5, p1, v3

    invoke-virtual {v4, v5}, Lcom/google/android/gms/internal/zzgrw;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    move p0, v2

    goto :goto_3

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_6
    move p0, v0

    :goto_3
    if-eqz p0, :cond_7

    return v0

    :cond_7
    return v2
.end method

.method public final hashCode()I
    .locals 3

    const/16 v0, 0x11

    const/4 v1, 0x0

    .line 1
    :goto_0
    iget v2, p0, Lcom/google/android/gms/internal/zzgrv;->zze:I

    if-ge v1, v2, :cond_0

    mul-int/lit8 v0, v0, 0x1f

    .line 2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgrv;->zzc:[I

    aget v2, v2, v1

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgrv;->zzd:[Lcom/google/android/gms/internal/zzgrw;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzgrw;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method

.method public final zzb()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/zzgrv;->zze:I

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
