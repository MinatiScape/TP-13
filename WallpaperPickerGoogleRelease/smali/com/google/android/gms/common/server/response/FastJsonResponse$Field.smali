.class public Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;
.super Lcom/google/android/gms/internal/zzbkv;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/server/response/FastJsonResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Field"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        "O:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/zzbkv;"
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/common/server/response/FieldCreator;


# instance fields
.field public final mConcreteType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Lcom/google/android/gms/common/server/response/FastJsonResponse;",
            ">;"
        }
    .end annotation
.end field

.field public final mConcreteTypeName:Ljava/lang/String;

.field public final mOutputFieldName:Ljava/lang/String;

.field public final mSafeParcelableFieldId:I

.field public final mTypeIn:I

.field public final mTypeInArray:Z

.field public final mTypeOut:I

.field public final mTypeOutArray:Z

.field public final zza:I

.field public zzb:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

.field public zzc:Lcom/google/android/gms/common/server/response/FastJsonResponse$FieldConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/server/response/FastJsonResponse$FieldConverter<",
            "TI;TO;>;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/common/server/response/FieldCreator;

    invoke-direct {v0}, Lcom/google/android/gms/common/server/response/FieldCreator;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->CREATOR:Lcom/google/android/gms/common/server/response/FieldCreator;

    return-void
.end method

.method public constructor <init>(IIZIZLjava/lang/String;ILjava/lang/String;Lcom/google/android/gms/internal/zzbly;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzbkv;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zza:I

    .line 3
    iput p2, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeIn:I

    .line 4
    iput-boolean p3, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeInArray:Z

    .line 5
    iput p4, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOut:I

    .line 6
    iput-boolean p5, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOutArray:Z

    .line 7
    iput-object p6, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mOutputFieldName:Ljava/lang/String;

    .line 8
    iput p7, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mSafeParcelableFieldId:I

    const/4 p1, 0x0

    if-nez p8, :cond_0

    .line 9
    iput-object p1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteType:Ljava/lang/Class;

    .line 10
    iput-object p1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteTypeName:Ljava/lang/String;

    goto :goto_0

    .line 11
    :cond_0
    const-class p2, Lcom/google/android/gms/common/server/response/zzl;

    iput-object p2, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteType:Ljava/lang/Class;

    .line 12
    iput-object p8, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteTypeName:Ljava/lang/String;

    :goto_0
    if-nez p9, :cond_1

    .line 13
    iput-object p1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zzc:Lcom/google/android/gms/common/server/response/FastJsonResponse$FieldConverter;

    return-void

    .line 14
    :cond_1
    iget-object p1, p9, Lcom/google/android/gms/internal/zzbly;->zzb:Lcom/google/android/gms/internal/zzbma;

    if-eqz p1, :cond_2

    .line 15
    iput-object p1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zzc:Lcom/google/android/gms/common/server/response/FastJsonResponse$FieldConverter;

    return-void

    .line 16
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "There was no converter wrapped in this ConverterWrapper."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Landroidx/core/R$id;->zza(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zza:I

    .line 2
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "versionCode"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    iget v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeIn:I

    .line 3
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "typeIn"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    iget-boolean v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeInArray:Z

    .line 4
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "typeInArray"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    iget v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOut:I

    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "typeOut"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    iget-boolean v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOutArray:Z

    .line 6
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "typeOutArray"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    iget-object v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mOutputFieldName:Ljava/lang/String;

    const-string v2, "outputFieldName"

    .line 7
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    iget v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mSafeParcelableFieldId:I

    .line 8
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "safeParcelFieldId"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    .line 9
    iget-object v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteTypeName:Ljava/lang/String;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    :cond_0
    const-string v2, "concreteTypeName"

    .line 10
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    .line 11
    iget-object v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteType:Ljava/lang/Class;

    if-eqz v1, :cond_1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "concreteType.class"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    .line 13
    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zzc:Lcom/google/android/gms/common/server/response/FastJsonResponse$FieldConverter;

    if-eqz p0, :cond_2

    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p0

    const-string v1, "converterName"

    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/common/internal/zzam;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;

    .line 15
    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzam;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 5

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    .line 2
    iget v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zza:I

    const/4 v2, 0x1

    const/4 v3, 0x4

    .line 3
    invoke-static {p1, v2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 5
    iget v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeIn:I

    const/4 v2, 0x2

    .line 6
    invoke-static {p1, v2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 7
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 8
    iget-boolean v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeInArray:Z

    const/4 v2, 0x3

    .line 9
    invoke-static {p1, v2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 10
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 11
    iget v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOut:I

    .line 12
    invoke-static {p1, v3, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 13
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 14
    iget-boolean v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOutArray:Z

    const/4 v2, 0x5

    .line 15
    invoke-static {p1, v2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 16
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 17
    iget-object v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mOutputFieldName:Ljava/lang/String;

    const/4 v2, 0x6

    const/4 v4, 0x0

    .line 18
    invoke-static {p1, v2, v1, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 19
    iget v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mSafeParcelableFieldId:I

    const/4 v2, 0x7

    .line 20
    invoke-static {p1, v2, v3}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 21
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 22
    iget-object v1, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteTypeName:Ljava/lang/String;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move-object v1, v2

    :cond_0
    const/16 v3, 0x8

    .line 23
    invoke-static {p1, v3, v1, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILjava/lang/String;Z)V

    const/16 v1, 0x9

    .line 24
    iget-object p0, p0, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zzc:Lcom/google/android/gms/common/server/response/FastJsonResponse$FieldConverter;

    if-nez p0, :cond_1

    goto :goto_0

    .line 25
    :cond_1
    instance-of v2, p0, Lcom/google/android/gms/internal/zzbma;

    if-eqz v2, :cond_2

    .line 26
    new-instance v2, Lcom/google/android/gms/internal/zzbly;

    check-cast p0, Lcom/google/android/gms/internal/zzbma;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzbly;-><init>(Lcom/google/android/gms/internal/zzbma;)V

    .line 27
    :goto_0
    invoke-static {p1, v1, v2, p2, v4}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 28
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void

    .line 29
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unsupported safe parcelable field converter class."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
