.class public Lcom/google/android/gms/phenotype/DogfoodsToken;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/phenotype/DogfoodsToken;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final token:[B


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/phenotype/zzd;

    invoke-direct {v0}, Lcom/google/android/gms/phenotype/zzd;-><init>()V

    sput-object v0, Lcom/google/android/gms/phenotype/DogfoodsToken;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>([B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/phenotype/DogfoodsToken;->token:[B

    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    const/16 p2, 0x4f45

    .line 1
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result p2

    const/4 v0, 0x2

    .line 2
    iget-object p0, p0, Lcom/google/android/gms/phenotype/DogfoodsToken;->token:[B

    const/4 v1, 0x0

    invoke-static {p1, v0, p0, v1}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;I[BZ)V

    .line 3
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
