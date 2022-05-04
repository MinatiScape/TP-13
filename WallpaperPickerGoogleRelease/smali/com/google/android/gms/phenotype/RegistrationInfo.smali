.class public Lcom/google/android/gms/phenotype/RegistrationInfo;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/phenotype/RegistrationInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final androidPackage:Ljava/lang/String;

.field public final configPackage:Ljava/lang/String;

.field public final logSourceNames:[Ljava/lang/String;

.field public final params:[B

.field public final version:I

.field public final weak:Z

.field public final weakExperimentIds:[I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/phenotype/zzaw;

    invoke-direct {v0}, Lcom/google/android/gms/phenotype/zzaw;-><init>()V

    sput-object v0, Lcom/google/android/gms/phenotype/RegistrationInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I[Ljava/lang/String;[BZ[ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->configPackage:Ljava/lang/String;

    .line 3
    iput p2, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->version:I

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->logSourceNames:[Ljava/lang/String;

    .line 5
    iput-object p4, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->params:[B

    .line 6
    iput-boolean p5, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->weak:Z

    .line 7
    iput-object p6, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->weakExperimentIds:[I

    .line 8
    iput-object p7, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->androidPackage:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/16 p2, 0x4f45

    .line 1
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->configPackage:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v0, 0x2

    .line 3
    iget v1, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->version:I

    const/4 v3, 0x4

    .line 4
    invoke-static {p1, v0, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 5
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x3

    .line 6
    iget-object v1, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->logSourceNames:[Ljava/lang/String;

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[Ljava/lang/String;Z)V

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->params:[B

    invoke-static {p1, v3, v0, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[BZ)V

    const/4 v0, 0x5

    .line 8
    iget-boolean v1, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->weak:Z

    .line 9
    invoke-static {p1, v0, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 10
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x6

    .line 11
    iget-object v1, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->weakExperimentIds:[I

    invoke-static {p1, v0, v1, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[IZ)V

    const/4 v0, 0x7

    .line 12
    iget-object p0, p0, Lcom/google/android/gms/phenotype/RegistrationInfo;->androidPackage:Ljava/lang/String;

    invoke-static {p1, v0, p0, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 13
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
