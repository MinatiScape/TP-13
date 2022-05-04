.class public Lcom/google/android/gms/phenotype/FlagOverride;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/phenotype/FlagOverride;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final committed:Z

.field public final configurationName:Ljava/lang/String;

.field public final flag:Lcom/google/android/gms/phenotype/Flag;

.field public final userName:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/phenotype/zzl;

    invoke-direct {v0}, Lcom/google/android/gms/phenotype/zzl;-><init>()V

    sput-object v0, Lcom/google/android/gms/phenotype/FlagOverride;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/phenotype/Flag;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/phenotype/FlagOverride;->configurationName:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/phenotype/FlagOverride;->userName:Ljava/lang/String;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/phenotype/FlagOverride;->flag:Lcom/google/android/gms/phenotype/Flag;

    .line 5
    iput-boolean p4, p0, Lcom/google/android/gms/phenotype/FlagOverride;->committed:Z

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
    instance-of v1, p1, Lcom/google/android/gms/phenotype/FlagOverride;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/phenotype/FlagOverride;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/phenotype/FlagOverride;->configurationName:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/phenotype/FlagOverride;->configurationName:Ljava/lang/String;

    invoke-static {v1, v3}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/phenotype/FlagOverride;->userName:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/phenotype/FlagOverride;->userName:Ljava/lang/String;

    .line 4
    invoke-static {v1, v3}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/phenotype/FlagOverride;->flag:Lcom/google/android/gms/phenotype/Flag;

    iget-object v3, p1, Lcom/google/android/gms/phenotype/FlagOverride;->flag:Lcom/google/android/gms/phenotype/Flag;

    .line 5
    invoke-static {v1, v3}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean p0, p0, Lcom/google/android/gms/phenotype/FlagOverride;->committed:Z

    iget-boolean p1, p1, Lcom/google/android/gms/phenotype/FlagOverride;->committed:Z

    if-ne p0, p1, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/phenotype/FlagOverride;->toString(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public toString(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 2

    const-string v0, "FlagOverride("

    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/phenotype/FlagOverride;->configurationName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    iget-object v1, p0, Lcom/google/android/gms/phenotype/FlagOverride;->userName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/phenotype/FlagOverride;->flag:Lcom/google/android/gms/phenotype/Flag;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/phenotype/Flag;->toString(Ljava/lang/StringBuilder;)Ljava/lang/String;

    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    iget-boolean p0, p0, Lcom/google/android/gms/phenotype/FlagOverride;->committed:Z

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, ")"

    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/google/android/gms/phenotype/FlagOverride;->configurationName:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1, v1, v2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v1, 0x3

    .line 3
    iget-object v2, p0, Lcom/google/android/gms/phenotype/FlagOverride;->userName:Ljava/lang/String;

    invoke-static {p1, v1, v2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/phenotype/FlagOverride;->flag:Lcom/google/android/gms/phenotype/Flag;

    const/4 v2, 0x4

    invoke-static {p1, v2, v1, p2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    const/4 p2, 0x5

    .line 5
    iget-boolean p0, p0, Lcom/google/android/gms/phenotype/FlagOverride;->committed:Z

    .line 6
    invoke-static {p1, p2, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 7
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 8
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
