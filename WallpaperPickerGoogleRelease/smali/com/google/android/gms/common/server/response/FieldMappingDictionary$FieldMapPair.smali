.class public Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/server/response/FieldMappingDictionary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FieldMapPair"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:Ljava/lang/String;

.field public final zzb:Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/server/response/FastJsonResponse$Field<",
            "**>;"
        }
    .end annotation
.end field

.field public final zzc:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/common/server/response/zzi;

    invoke-direct {v0}, Lcom/google/android/gms/common/server/response/zzi;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/server/response/FastJsonResponse$Field<",
            "**>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;->zzc:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;->zza:Ljava/lang/String;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;->zzb:Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/server/response/FastJsonResponse$Field<",
            "**>;)V"
        }
    .end annotation

    .line 5
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    const/4 v0, 0x1

    .line 6
    iput v0, p0, Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;->zzc:I

    .line 7
    iput-object p1, p0, Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;->zza:Ljava/lang/String;

    .line 8
    iput-object p2, p0, Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;->zzb:Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;

    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    const/4 v1, 0x1

    .line 2
    iget v2, p0, Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;->zzc:I

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v1, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v1, 0x2

    .line 5
    iget-object v2, p0, Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;->zza:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1, v1, v2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/4 v1, 0x3

    .line 6
    iget-object p0, p0, Lcom/google/android/gms/common/server/response/FieldMappingDictionary$FieldMapPair;->zzb:Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;

    invoke-static {p1, v1, p0, p2, v3}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 7
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method
