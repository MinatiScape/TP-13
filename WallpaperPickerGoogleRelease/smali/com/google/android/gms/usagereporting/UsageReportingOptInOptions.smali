.class public Lcom/google/android/gms/usagereporting/UsageReportingOptInOptions;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/usagereporting/UsageReportingOptInOptions;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public zza:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/usagereporting/zzb;

    invoke-direct {v0}, Lcom/google/android/gms/usagereporting/zzb;-><init>()V

    sput-object v0, Lcom/google/android/gms/usagereporting/UsageReportingOptInOptions;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3
    iput p1, p0, Lcom/google/android/gms/usagereporting/UsageReportingOptInOptions;->zza:I

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
    iget p0, p0, Lcom/google/android/gms/usagereporting/UsageReportingOptInOptions;->zza:I

    const/4 v1, 0x4

    .line 3
    invoke-static {p1, v0, v1}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 5
    invoke-static {p1, p2}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
