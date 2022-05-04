.class public Lcom/google/android/gms/phenotype/Configuration;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzbkv;",
        "Ljava/lang/Comparable<",
        "Lcom/google/android/gms/phenotype/Configuration;",
        ">;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/phenotype/Configuration;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final deleteFlags:[Ljava/lang/String;

.field public final flagMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/phenotype/Flag;",
            ">;"
        }
    .end annotation
.end field

.field public final flagType:I

.field public final flags:[Lcom/google/android/gms/phenotype/Flag;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/phenotype/zzb;

    invoke-direct {v0}, Lcom/google/android/gms/phenotype/zzb;-><init>()V

    sput-object v0, Lcom/google/android/gms/phenotype/Configuration;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I[Lcom/google/android/gms/phenotype/Flag;[Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/phenotype/Configuration;->flagType:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/phenotype/Configuration;->flags:[Lcom/google/android/gms/phenotype/Flag;

    .line 4
    new-instance p1, Ljava/util/TreeMap;

    invoke-direct {p1}, Ljava/util/TreeMap;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/phenotype/Configuration;->flagMap:Ljava/util/Map;

    .line 5
    array-length p1, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    aget-object v1, p2, v0

    .line 6
    iget-object v2, p0, Lcom/google/android/gms/phenotype/Configuration;->flagMap:Ljava/util/Map;

    iget-object v3, v1, Lcom/google/android/gms/phenotype/Flag;->name:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 7
    :cond_0
    iput-object p3, p0, Lcom/google/android/gms/phenotype/Configuration;->deleteFlags:[Ljava/lang/String;

    if-eqz p3, :cond_1

    .line 8
    invoke-static {p3}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/gms/phenotype/Configuration;

    .line 2
    iget p0, p0, Lcom/google/android/gms/phenotype/Configuration;->flagType:I

    iget p1, p1, Lcom/google/android/gms/phenotype/Configuration;->flagType:I

    sub-int/2addr p0, p1

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/phenotype/Configuration;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/google/android/gms/phenotype/Configuration;

    .line 3
    iget v0, p0, Lcom/google/android/gms/phenotype/Configuration;->flagType:I

    iget v2, p1, Lcom/google/android/gms/phenotype/Configuration;->flagType:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/phenotype/Configuration;->flagMap:Ljava/util/Map;

    iget-object v2, p1, Lcom/google/android/gms/phenotype/Configuration;->flagMap:Ljava/util/Map;

    .line 4
    invoke-static {v0, v2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/phenotype/Configuration;->deleteFlags:[Ljava/lang/String;

    iget-object p1, p1, Lcom/google/android/gms/phenotype/Configuration;->deleteFlags:[Ljava/lang/String;

    .line 5
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Configuration("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2
    iget v1, p0, Lcom/google/android/gms/phenotype/Configuration;->flagType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "("

    .line 4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    iget-object v3, p0, Lcom/google/android/gms/phenotype/Configuration;->flagMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/phenotype/Flag;

    .line 6
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const-string v3, ")"

    .line 8
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    iget-object p0, p0, Lcom/google/android/gms/phenotype/Configuration;->deleteFlags:[Ljava/lang/String;

    if-eqz p0, :cond_1

    .line 12
    array-length v2, p0

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v2, :cond_2

    aget-object v5, p0, v4

    .line 13
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    const-string p0, "null"

    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    :cond_2
    invoke-static {v0, v3, v3}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

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
    iget v2, p0, Lcom/google/android/gms/phenotype/Configuration;->flagType:I

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x3

    .line 5
    iget-object v2, p0, Lcom/google/android/gms/phenotype/Configuration;->flags:[Lcom/google/android/gms/phenotype/Flag;

    invoke-static {p1, v1, v2, p2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    .line 6
    iget-object p0, p0, Lcom/google/android/gms/phenotype/Configuration;->deleteFlags:[Ljava/lang/String;

    const/4 p2, 0x0

    invoke-static {p1, v3, p0, p2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[Ljava/lang/String;Z)V

    .line 7
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
