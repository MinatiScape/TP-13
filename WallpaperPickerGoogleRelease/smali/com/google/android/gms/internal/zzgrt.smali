.class public abstract Lcom/google/android/gms/internal/zzgrt;
.super Lcom/google/android/gms/internal/zzgrz;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M:",
        "Lcom/google/android/gms/internal/zzgrt<",
        "TM;>;>",
        "Lcom/google/android/gms/internal/zzgrz;"
    }
.end annotation


# instance fields
.field public zzay:Lcom/google/android/gms/internal/zzgrv;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgrz;-><init>()V

    return-void
.end method


# virtual methods
.method public clone()Lcom/google/android/gms/internal/zzgrt;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TM;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/google/android/gms/internal/zzgrz;->clone()Lcom/google/android/gms/internal/zzgrz;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgrt;

    .line 2
    sget-object v1, Lcom/google/android/gms/internal/zzgrx;->zzb:Ljava/lang/Object;

    .line 3
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-eqz p0, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrv;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgrv;

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    :cond_0
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/android/gms/internal/zzgrz;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrt;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgrt;

    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 6
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrt;->clone()Lcom/google/android/gms/internal/zzgrt;

    move-result-object p0

    return-object p0
.end method

.method public computeSerializedSize()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    .line 2
    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    .line 3
    iget v3, v2, Lcom/google/android/gms/internal/zzgrv;->zze:I

    if-ge v0, v3, :cond_0

    .line 4
    iget-object v2, v2, Lcom/google/android/gms/internal/zzgrv;->zzd:[Lcom/google/android/gms/internal/zzgrw;

    aget-object v2, v2, v0

    .line 5
    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzgrw;->zza()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public writeTo(Lcom/google/android/gms/internal/zzgrr;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgrt;->zzay:Lcom/google/android/gms/internal/zzgrv;

    .line 3
    iget v2, v1, Lcom/google/android/gms/internal/zzgrv;->zze:I

    if-ge v0, v2, :cond_1

    .line 4
    iget-object v1, v1, Lcom/google/android/gms/internal/zzgrv;->zzd:[Lcom/google/android/gms/internal/zzgrw;

    aget-object v1, v1, v0

    .line 5
    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzgrw;->zza(Lcom/google/android/gms/internal/zzgrr;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
