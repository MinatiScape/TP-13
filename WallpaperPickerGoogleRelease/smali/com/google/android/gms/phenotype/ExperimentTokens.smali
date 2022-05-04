.class public Lcom/google/android/gms/phenotype/ExperimentTokens;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/phenotype/ExperimentTokens;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final additionalDirectExperimentTokens:[[B

.field public final alwaysCrossExperimentTokens:[[B

.field public final directExperimentToken:[B

.field public final gaiaCrossExperimentTokens:[[B

.field public final otherCrossExperimentTokens:[[B

.field public final pseudonymousCrossExperimentTokens:[[B

.field public final user:Ljava/lang/String;

.field public final weakExperimentIds:[I


# direct methods
.method public static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/google/android/gms/phenotype/zzi;

    invoke-direct {v0}, Lcom/google/android/gms/phenotype/zzi;-><init>()V

    sput-object v0, Lcom/google/android/gms/phenotype/ExperimentTokens;->CREATOR:Landroid/os/Parcelable$Creator;

    const/4 v0, 0x0

    new-array v7, v0, [[B

    .line 2
    new-instance v1, Lcom/google/android/gms/phenotype/ExperimentTokens;

    const-string v2, ""

    const/4 v3, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v4, v7

    move-object v5, v7

    move-object v6, v7

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gms/phenotype/ExperimentTokens;-><init>(Ljava/lang/String;[B[[B[[B[[B[[B[I[[B)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[B[[B[[B[[B[[B[I[[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->user:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->directExperimentToken:[B

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->gaiaCrossExperimentTokens:[[B

    .line 5
    iput-object p4, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->pseudonymousCrossExperimentTokens:[[B

    .line 6
    iput-object p5, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->alwaysCrossExperimentTokens:[[B

    .line 7
    iput-object p6, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->otherCrossExperimentTokens:[[B

    .line 8
    iput-object p7, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->weakExperimentIds:[I

    .line 9
    iput-object p8, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->additionalDirectExperimentTokens:[[B

    return-void
.end method

.method public static zza([I)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_0

    .line 11
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 13
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, p0, v2

    .line 14
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 15
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    return-object v0
.end method

.method public static zza(Ljava/lang/StringBuilder;Ljava/lang/String;[[B)V
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "="

    .line 2
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p2, :cond_0

    const-string p1, "null"

    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    :cond_0
    const-string p1, "("

    .line 4
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    array-length p1, p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    move v2, v0

    :goto_0
    if-ge v2, p1, :cond_2

    aget-object v3, p2, v2

    if-nez v1, :cond_1

    const-string v1, ", "

    .line 6
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const-string v1, "\'"

    .line 7
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x3

    .line 8
    invoke-static {v3, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    move v1, v0

    goto :goto_0

    :cond_2
    const-string p1, ")"

    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public static zzb([[B)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[B)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_0

    .line 1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 2
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 3
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    const/4 v4, 0x3

    .line 4
    invoke-static {v3, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 5
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/google/android/gms/phenotype/ExperimentTokens;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/google/android/gms/phenotype/ExperimentTokens;

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->user:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/phenotype/ExperimentTokens;->user:Ljava/lang/String;

    invoke-static {v0, v2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->directExperimentToken:[B

    iget-object v2, p1, Lcom/google/android/gms/phenotype/ExperimentTokens;->directExperimentToken:[B

    .line 4
    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->gaiaCrossExperimentTokens:[[B

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zzb([[B)Ljava/util/List;

    move-result-object v0

    iget-object v2, p1, Lcom/google/android/gms/phenotype/ExperimentTokens;->gaiaCrossExperimentTokens:[[B

    .line 6
    invoke-static {v2}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zzb([[B)Ljava/util/List;

    move-result-object v2

    .line 7
    invoke-static {v0, v2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->pseudonymousCrossExperimentTokens:[[B

    .line 8
    invoke-static {v0}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zzb([[B)Ljava/util/List;

    move-result-object v0

    iget-object v2, p1, Lcom/google/android/gms/phenotype/ExperimentTokens;->pseudonymousCrossExperimentTokens:[[B

    .line 9
    invoke-static {v2}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zzb([[B)Ljava/util/List;

    move-result-object v2

    .line 10
    invoke-static {v0, v2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->alwaysCrossExperimentTokens:[[B

    .line 11
    invoke-static {v0}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zzb([[B)Ljava/util/List;

    move-result-object v0

    iget-object v2, p1, Lcom/google/android/gms/phenotype/ExperimentTokens;->alwaysCrossExperimentTokens:[[B

    .line 12
    invoke-static {v2}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zzb([[B)Ljava/util/List;

    move-result-object v2

    .line 13
    invoke-static {v0, v2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->otherCrossExperimentTokens:[[B

    .line 14
    invoke-static {v0}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zzb([[B)Ljava/util/List;

    move-result-object v0

    iget-object v2, p1, Lcom/google/android/gms/phenotype/ExperimentTokens;->otherCrossExperimentTokens:[[B

    .line 15
    invoke-static {v2}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zzb([[B)Ljava/util/List;

    move-result-object v2

    .line 16
    invoke-static {v0, v2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->weakExperimentIds:[I

    .line 17
    invoke-static {v0}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zza([I)Ljava/util/List;

    move-result-object v0

    iget-object v2, p1, Lcom/google/android/gms/phenotype/ExperimentTokens;->weakExperimentIds:[I

    invoke-static {v2}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zza([I)Ljava/util/List;

    move-result-object v2

    .line 18
    invoke-static {v0, v2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->additionalDirectExperimentTokens:[[B

    .line 19
    invoke-static {p0}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zzb([[B)Ljava/util/List;

    move-result-object p0

    iget-object p1, p1, Lcom/google/android/gms/phenotype/ExperimentTokens;->additionalDirectExperimentTokens:[[B

    .line 20
    invoke-static {p1}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zzb([[B)Ljava/util/List;

    move-result-object p1

    .line 21
    invoke-static {p0, p1}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ExperimentTokens"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "("

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3
    iget-object v2, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->user:Ljava/lang/String;

    const-string v3, "null"

    const-string v4, "\'"

    if-nez v2, :cond_0

    move-object v2, v3

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    invoke-static {v2, v5}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v5

    invoke-static {v5, v4, v2, v4}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", "

    .line 4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    iget-object v5, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->directExperimentToken:[B

    const-string v6, "direct"

    .line 6
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "="

    .line 7
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v5, :cond_1

    .line 8
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 9
    :cond_1
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v7, 0x3

    .line 10
    invoke-static {v5, v7}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    iget-object v4, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->gaiaCrossExperimentTokens:[[B

    const-string v5, "GAIA"

    invoke-static {v0, v5, v4}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zza(Ljava/lang/StringBuilder;Ljava/lang/String;[[B)V

    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    iget-object v4, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->pseudonymousCrossExperimentTokens:[[B

    const-string v5, "PSEUDO"

    invoke-static {v0, v5, v4}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zza(Ljava/lang/StringBuilder;Ljava/lang/String;[[B)V

    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    iget-object v4, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->alwaysCrossExperimentTokens:[[B

    const-string v5, "ALWAYS"

    invoke-static {v0, v5, v4}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zza(Ljava/lang/StringBuilder;Ljava/lang/String;[[B)V

    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    iget-object v4, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->otherCrossExperimentTokens:[[B

    const-string v5, "OTHER"

    invoke-static {v0, v5, v4}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zza(Ljava/lang/StringBuilder;Ljava/lang/String;[[B)V

    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    iget-object v4, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->weakExperimentIds:[I

    const-string v5, "weak"

    .line 22
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ")"

    if-nez v4, :cond_2

    .line 24
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 25
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    array-length v1, v4

    const/4 v3, 0x0

    const/4 v6, 0x1

    move v7, v3

    :goto_2
    if-ge v7, v1, :cond_4

    aget v8, v4, v7

    if-nez v6, :cond_3

    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    :cond_3
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v7, v7, 0x1

    move v6, v3

    goto :goto_2

    .line 29
    :cond_4
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    :goto_3
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    iget-object p0, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->additionalDirectExperimentTokens:[[B

    const-string v1, "directs"

    invoke-static {v0, v1, p0}, Lcom/google/android/gms/phenotype/ExperimentTokens;->zza(Ljava/lang/StringBuilder;Ljava/lang/String;[[B)V

    .line 32
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    const/16 p2, 0x4f45

    .line 1
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x2

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->user:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x3

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->directExperimentToken:[B

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[BZ)V

    const/4 v0, 0x4

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->gaiaCrossExperimentTokens:[[B

    invoke-static {p1, v0, v1}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[[B)V

    const/4 v0, 0x5

    .line 5
    iget-object v1, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->pseudonymousCrossExperimentTokens:[[B

    invoke-static {p1, v0, v1}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[[B)V

    const/4 v0, 0x6

    .line 6
    iget-object v1, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->alwaysCrossExperimentTokens:[[B

    invoke-static {p1, v0, v1}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[[B)V

    const/4 v0, 0x7

    .line 7
    iget-object v1, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->otherCrossExperimentTokens:[[B

    invoke-static {p1, v0, v1}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[[B)V

    const/16 v0, 0x8

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->weakExperimentIds:[I

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[IZ)V

    const/16 v0, 0x9

    .line 9
    iget-object p0, p0, Lcom/google/android/gms/phenotype/ExperimentTokens;->additionalDirectExperimentTokens:[[B

    invoke-static {p1, v0, p0}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[[B)V

    .line 10
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
