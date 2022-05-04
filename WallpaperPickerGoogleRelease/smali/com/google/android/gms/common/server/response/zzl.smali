.class public Lcom/google/android/gms/common/server/response/zzl;
.super Lcom/google/android/gms/common/server/response/FastSafeParcelableJsonResponse;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/common/server/response/zzl;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final zza:I

.field public final zzb:Landroid/os/Parcel;

.field public final zzc:I

.field public final zzd:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

.field public final zze:Ljava/lang/String;

.field public zzf:I

.field public zzg:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/common/server/response/zzm;

    invoke-direct {v0}, Lcom/google/android/gms/common/server/response/zzm;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/server/response/zzl;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILandroid/os/Parcel;Lcom/google/android/gms/common/server/response/FieldMappingDictionary;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/common/server/response/FastSafeParcelableJsonResponse;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/common/server/response/zzl;->zza:I

    const-string p1, "null reference"

    .line 3
    invoke-static {p2, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    iput-object p2, p0, Lcom/google/android/gms/common/server/response/zzl;->zzb:Landroid/os/Parcel;

    const/4 p1, 0x2

    .line 5
    iput p1, p0, Lcom/google/android/gms/common/server/response/zzl;->zzc:I

    .line 6
    iput-object p3, p0, Lcom/google/android/gms/common/server/response/zzl;->zzd:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

    if-nez p3, :cond_0

    const/4 p2, 0x0

    .line 7
    iput-object p2, p0, Lcom/google/android/gms/common/server/response/zzl;->zze:Ljava/lang/String;

    goto :goto_0

    .line 8
    :cond_0
    iget-object p2, p3, Lcom/google/android/gms/common/server/response/FieldMappingDictionary;->zzd:Ljava/lang/String;

    .line 9
    iput-object p2, p0, Lcom/google/android/gms/common/server/response/zzl;->zze:Ljava/lang/String;

    .line 10
    :goto_0
    iput p1, p0, Lcom/google/android/gms/common/server/response/zzl;->zzf:I

    return-void
.end method

.method public static zza(Ljava/lang/StringBuilder;ILjava/lang/Object;)V
    .locals 1

    const-string v0, "\""

    packed-switch p1, :pswitch_data_0

    .line 182
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const/16 p2, 0x1a

    const-string v0, "Unknown type = "

    invoke-static {p2, v0, p1}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 183
    :pswitch_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Method does not accept concrete type."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 184
    :pswitch_1
    check-cast p2, Ljava/util/HashMap;

    invoke-static {p0, p2}, Landroidx/appcompat/R$dimen;->zza(Ljava/lang/StringBuilder;Ljava/util/HashMap;)V

    return-void

    .line 185
    :pswitch_2
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast p2, [B

    invoke-static {p2}, Landroidx/savedstate/R$id;->zzb([B)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 187
    :pswitch_3
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast p2, [B

    invoke-static {p2}, Landroidx/savedstate/R$id;->zza([B)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 188
    :pswitch_4
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/util/zzn;->zzb(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 189
    :pswitch_5
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Lcom/google/android/gms/common/server/response/FastJsonResponse$Field<",
            "**>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1
    iget-boolean p0, p2, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeInArray:Z

    if-eqz p0, :cond_2

    .line 2
    check-cast p3, Ljava/util/ArrayList;

    const-string p0, "["

    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_1

    if-eqz v0, :cond_0

    const-string v1, ","

    .line 5
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    :cond_0
    iget v1, p2, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeIn:I

    .line 7
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;ILjava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const-string p0, "]"

    .line 8
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void

    .line 9
    :cond_2
    iget p0, p2, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeIn:I

    .line 10
    invoke-static {p1, p0, p3}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;ILjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getFieldMappings()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/server/response/FastJsonResponse$Field<",
            "**>;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzd:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/common/server/response/zzl;->zze:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/server/response/FieldMappingDictionary;->getFieldMapping(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public getValueObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Converting to JSON does not require this method."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public isPrimitiveFieldSet(Ljava/lang/String;)Z
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Converting to JSON does not require this method."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzd:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

    const-string v1, "Cannot convert to JSON on client side."

    invoke-static {v0, v1}, Landroidx/preference/R$string;->zza(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/common/server/response/zzl;->zza()Landroid/os/Parcel;

    move-result-object v0

    const/4 v1, 0x0

    .line 3
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 4
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 5
    iget-object v2, p0, Lcom/google/android/gms/common/server/response/zzl;->zzd:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

    iget-object v3, p0, Lcom/google/android/gms/common/server/response/zzl;->zze:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/common/server/response/FieldMappingDictionary;->getFieldMapping(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Ljava/util/Map;Landroid/os/Parcel;)V

    .line 6
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 7

    const/16 v0, 0x4f45

    .line 1
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v0

    .line 2
    iget v1, p0, Lcom/google/android/gms/common/server/response/zzl;->zza:I

    const/4 v2, 0x4

    const/4 v3, 0x1

    .line 3
    invoke-static {p1, v3, v2}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;II)V

    .line 4
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/common/server/response/zzl;->zza()Landroid/os/Parcel;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v4, 0x2

    if-nez v1, :cond_0

    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p1, v4}, Landroidx/slice/view/R$layout;->zzb(Landroid/os/Parcel;I)I

    move-result v5

    .line 7
    invoke-virtual {v1}, Landroid/os/Parcel;->dataSize()I

    move-result v6

    invoke-virtual {p1, v1, v2, v6}, Landroid/os/Parcel;->appendFrom(Landroid/os/Parcel;II)V

    .line 8
    invoke-static {p1, v5}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    :goto_0
    const/4 v1, 0x3

    .line 9
    iget v5, p0, Lcom/google/android/gms/common/server/response/zzl;->zzc:I

    if-eqz v5, :cond_3

    if-eq v5, v3, :cond_2

    if-ne v5, v4, :cond_1

    .line 10
    iget-object p0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzd:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

    goto :goto_1

    .line 11
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    iget p0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzc:I

    const/16 p2, 0x22

    const-string v0, "Invalid creation type: "

    invoke-static {p2, v0, p0}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 12
    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzd:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

    goto :goto_1

    :cond_3
    const/4 p0, 0x0

    .line 13
    :goto_1
    invoke-static {p1, v1, p0, p2, v2}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 14
    invoke-static {p1, v0}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    return-void
.end method

.method public final zza()Landroid/os/Parcel;
    .locals 2

    .line 11
    iget v0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzf:I

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzb:Landroid/os/Parcel;

    invoke-static {v0}, Landroidx/slice/view/R$layout;->zza(Landroid/os/Parcel;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzg:I

    .line 13
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzb:Landroid/os/Parcel;

    iget v1, p0, Lcom/google/android/gms/common/server/response/zzl;->zzg:I

    .line 14
    invoke-static {v0, v1}, Landroidx/slice/view/R$layout;->zzc(Landroid/os/Parcel;I)V

    const/4 v0, 0x2

    .line 15
    iput v0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzf:I

    .line 16
    :goto_0
    iget-object p0, p0, Lcom/google/android/gms/common/server/response/zzl;->zzb:Landroid/os/Parcel;

    return-object p0
.end method

.method public final zza(Ljava/lang/StringBuilder;Ljava/util/Map;Landroid/os/Parcel;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/server/response/FastJsonResponse$Field<",
            "**>;>;",
            "Landroid/os/Parcel;",
            ")V"
        }
    .end annotation

    .line 17
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 18
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 19
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;

    .line 20
    iget v2, v2, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mSafeParcelableFieldId:I

    .line 21
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/16 p2, 0x7b

    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    invoke-static {p3}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;)I

    move-result p2

    const/4 v1, 0x0

    .line 24
    :cond_1
    :goto_1
    invoke-virtual {p3}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    if-ge v2, p2, :cond_1c

    .line 25
    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v2

    const v3, 0xffff

    and-int/2addr v3, v2

    .line 26
    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    if-eqz v3, :cond_1

    const-string v4, ","

    if-eqz v1, :cond_2

    .line 27
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    :cond_2
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;

    const-string v5, "\""

    .line 29
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\":"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    iget-object v1, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zzc:Lcom/google/android/gms/common/server/response/FastJsonResponse$FieldConverter;

    if-eqz v1, :cond_3

    const/4 v1, 0x1

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_2
    if-eqz v1, :cond_5

    .line 31
    iget v1, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOut:I

    packed-switch v1, :pswitch_data_0

    .line 32
    new-instance p0, Ljava/lang/IllegalArgumentException;

    goto/16 :goto_4

    .line 33
    :pswitch_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Method does not accept concrete type."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 34
    :pswitch_1
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzs(Landroid/os/Parcel;I)Landroid/os/Bundle;

    move-result-object v1

    .line 35
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 36
    invoke-virtual {v1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 37
    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 38
    :cond_4
    invoke-virtual {p0, v3, v2}, Lcom/google/android/gms/common/server/response/FastJsonResponse;->getOriginalValue(Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v3, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V

    goto/16 :goto_19

    .line 39
    :pswitch_2
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzt(Landroid/os/Parcel;I)[B

    move-result-object v1

    .line 40
    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/common/server/response/FastJsonResponse;->getOriginalValue(Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v3, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V

    goto/16 :goto_19

    .line 41
    :pswitch_3
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzq(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v1

    .line 42
    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/common/server/response/FastJsonResponse;->getOriginalValue(Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v3, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V

    goto/16 :goto_19

    .line 43
    :pswitch_4
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;I)Z

    move-result v1

    .line 44
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/common/server/response/FastJsonResponse;->getOriginalValue(Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v3, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V

    goto/16 :goto_19

    .line 45
    :pswitch_5
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzp(Landroid/os/Parcel;I)Ljava/math/BigDecimal;

    move-result-object v1

    .line 46
    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/common/server/response/FastJsonResponse;->getOriginalValue(Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v3, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V

    goto/16 :goto_19

    .line 47
    :pswitch_6
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzn(Landroid/os/Parcel;I)D

    move-result-wide v1

    .line 48
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/common/server/response/FastJsonResponse;->getOriginalValue(Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v3, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V

    goto/16 :goto_19

    .line 49
    :pswitch_7
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzl(Landroid/os/Parcel;I)F

    move-result v1

    .line 50
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/common/server/response/FastJsonResponse;->getOriginalValue(Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v3, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V

    goto/16 :goto_19

    .line 51
    :pswitch_8
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzi(Landroid/os/Parcel;I)J

    move-result-wide v1

    .line 52
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/common/server/response/FastJsonResponse;->getOriginalValue(Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v3, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V

    goto/16 :goto_19

    .line 53
    :pswitch_9
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzk(Landroid/os/Parcel;I)Ljava/math/BigInteger;

    move-result-object v1

    .line 54
    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/common/server/response/FastJsonResponse;->getOriginalValue(Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v3, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V

    goto/16 :goto_19

    .line 55
    :pswitch_a
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v1

    .line 56
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/google/android/gms/common/server/response/FastJsonResponse;->getOriginalValue(Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v3, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;Ljava/lang/Object;)V

    goto/16 :goto_19

    .line 57
    :goto_4
    iget p1, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOut:I

    const/16 p2, 0x24

    const-string p3, "Unknown field out type = "

    .line 58
    invoke-static {p2, p3, p1}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 59
    :cond_5
    iget-boolean v1, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOutArray:Z

    const-string v6, "null reference"

    if-eqz v1, :cond_19

    const-string v1, "["

    .line 60
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    iget v1, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOut:I

    packed-switch v1, :pswitch_data_1

    .line 62
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Unknown field type out."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 63
    :pswitch_b
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result v1

    .line 64
    invoke-virtual {p3}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    if-nez v1, :cond_6

    const/4 v1, 0x0

    goto :goto_7

    .line 65
    :cond_6
    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 66
    new-array v7, v5, [Landroid/os/Parcel;

    const/4 v8, 0x0

    :goto_5
    if-ge v8, v5, :cond_8

    .line 67
    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v9

    if-eqz v9, :cond_7

    .line 68
    invoke-virtual {p3}, Landroid/os/Parcel;->dataPosition()I

    move-result v10

    .line 69
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v11

    .line 70
    invoke-virtual {v11, p3, v10, v9}, Landroid/os/Parcel;->appendFrom(Landroid/os/Parcel;II)V

    .line 71
    aput-object v11, v7, v8

    add-int/2addr v10, v9

    .line 72
    invoke-virtual {p3, v10}, Landroid/os/Parcel;->setDataPosition(I)V

    goto :goto_6

    :cond_7
    const/4 v9, 0x0

    .line 73
    aput-object v9, v7, v8

    :goto_6
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    :cond_8
    add-int/2addr v2, v1

    .line 74
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v1, v7

    .line 75
    :goto_7
    array-length v2, v1

    const/4 v5, 0x0

    :goto_8
    if-ge v5, v2, :cond_18

    if-lez v5, :cond_9

    .line 76
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    :cond_9
    aget-object v7, v1, v5

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 78
    iget-object v7, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteTypeName:Ljava/lang/String;

    .line 79
    invoke-static {v7, v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    iget-object v7, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zzb:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

    .line 81
    invoke-static {v7, v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    iget-object v7, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zzb:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

    iget-object v8, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteTypeName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/google/android/gms/common/server/response/FieldMappingDictionary;->getFieldMapping(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v7

    .line 83
    aget-object v8, v1, v5

    invoke-virtual {p0, p1, v7, v8}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Ljava/util/Map;Landroid/os/Parcel;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 84
    :pswitch_c
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "List of type BASE64, BASE64_URL_SAFE, or STRING_MAP is not supported"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 85
    :pswitch_d
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzaa(Landroid/os/Parcel;I)[Ljava/lang/String;

    move-result-object v1

    .line 86
    array-length v2, v1

    const/4 v3, 0x0

    :goto_9
    if-ge v3, v2, :cond_18

    if-eqz v3, :cond_a

    .line 87
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    :cond_a
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v6, v1, v3

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    :pswitch_e
    const/4 v1, 0x0

    .line 89
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result v2

    .line 90
    invoke-virtual {p3}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-nez v2, :cond_b

    goto :goto_a

    .line 91
    :cond_b
    invoke-virtual {p3}, Landroid/os/Parcel;->createBooleanArray()[Z

    move-result-object v1

    add-int/2addr v3, v2

    .line 92
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 93
    :goto_a
    array-length v2, v1

    const/4 v3, 0x0

    :goto_b
    if-ge v3, v2, :cond_18

    if-eqz v3, :cond_c

    .line 94
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    :cond_c
    aget-boolean v5, v1, v3

    invoke-static {v5}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    :pswitch_f
    const/4 v1, 0x0

    .line 96
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result v2

    .line 97
    invoke-virtual {p3}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-nez v2, :cond_d

    goto :goto_d

    .line 98
    :cond_d
    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 99
    new-array v4, v1, [Ljava/math/BigDecimal;

    const/4 v5, 0x0

    :goto_c
    if-ge v5, v1, :cond_e

    .line 100
    invoke-virtual {p3}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v6

    .line 101
    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 102
    new-instance v8, Ljava/math/BigDecimal;

    new-instance v9, Ljava/math/BigInteger;

    invoke-direct {v9, v6}, Ljava/math/BigInteger;-><init>([B)V

    invoke-direct {v8, v9, v7}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;I)V

    aput-object v8, v4, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_c

    :cond_e
    add-int/2addr v3, v2

    .line 103
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v1, v4

    .line 104
    :goto_d
    invoke-static {p1, v1}, Landroidx/appcompat/R$attr;->zza(Ljava/lang/StringBuilder;[Ljava/lang/Object;)V

    goto/16 :goto_17

    :pswitch_10
    const/4 v1, 0x0

    .line 105
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result v2

    .line 106
    invoke-virtual {p3}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-nez v2, :cond_f

    goto :goto_e

    .line 107
    :cond_f
    invoke-virtual {p3}, Landroid/os/Parcel;->createDoubleArray()[D

    move-result-object v1

    add-int/2addr v3, v2

    .line 108
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 109
    :goto_e
    array-length v2, v1

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v2, :cond_18

    if-eqz v3, :cond_10

    .line 110
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_10
    aget-wide v5, v1, v3

    invoke-static {v5, v6}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    :pswitch_11
    const/4 v1, 0x0

    .line 112
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result v2

    .line 113
    invoke-virtual {p3}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-nez v2, :cond_11

    goto :goto_10

    .line 114
    :cond_11
    invoke-virtual {p3}, Landroid/os/Parcel;->createFloatArray()[F

    move-result-object v1

    add-int/2addr v3, v2

    .line 115
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 116
    :goto_10
    array-length v2, v1

    const/4 v3, 0x0

    :goto_11
    if-ge v3, v2, :cond_18

    if-eqz v3, :cond_12

    .line 117
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    :cond_12
    aget v5, v1, v3

    invoke-static {v5}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    :pswitch_12
    const/4 v1, 0x0

    .line 119
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result v2

    .line 120
    invoke-virtual {p3}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-nez v2, :cond_13

    goto :goto_12

    .line 121
    :cond_13
    invoke-virtual {p3}, Landroid/os/Parcel;->createLongArray()[J

    move-result-object v1

    add-int/2addr v3, v2

    .line 122
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 123
    :goto_12
    array-length v2, v1

    const/4 v3, 0x0

    :goto_13
    if-ge v3, v2, :cond_18

    if-eqz v3, :cond_14

    .line 124
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    :cond_14
    aget-wide v5, v1, v3

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    :pswitch_13
    const/4 v1, 0x0

    .line 126
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zza(Landroid/os/Parcel;I)I

    move-result v2

    .line 127
    invoke-virtual {p3}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    if-nez v2, :cond_15

    goto :goto_15

    .line 128
    :cond_15
    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 129
    new-array v4, v1, [Ljava/math/BigInteger;

    const/4 v5, 0x0

    :goto_14
    if-ge v5, v1, :cond_16

    .line 130
    new-instance v6, Ljava/math/BigInteger;

    invoke-virtual {p3}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/math/BigInteger;-><init>([B)V

    aput-object v6, v4, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_14

    :cond_16
    add-int/2addr v3, v2

    .line 131
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v1, v4

    .line 132
    :goto_15
    invoke-static {p1, v1}, Landroidx/appcompat/R$attr;->zza(Ljava/lang/StringBuilder;[Ljava/lang/Object;)V

    goto :goto_17

    .line 133
    :pswitch_14
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzw(Landroid/os/Parcel;I)[I

    move-result-object v1

    .line 134
    array-length v2, v1

    const/4 v3, 0x0

    :goto_16
    if-ge v3, v2, :cond_18

    if-eqz v3, :cond_17

    .line 135
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    :cond_17
    aget v5, v1, v3

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    :cond_18
    :goto_17
    const-string v1, "]"

    .line 137
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_19

    .line 138
    :cond_19
    iget v1, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mTypeOut:I

    packed-switch v1, :pswitch_data_2

    .line 139
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Unknown field type out"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 140
    :pswitch_15
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzad(Landroid/os/Parcel;I)Landroid/os/Parcel;

    move-result-object v1

    const/4 v2, 0x0

    .line 141
    invoke-virtual {v1, v2}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 142
    iget-object v2, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteTypeName:Ljava/lang/String;

    .line 143
    invoke-static {v2, v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 144
    iget-object v2, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zzb:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

    .line 145
    invoke-static {v2, v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 146
    iget-object v2, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->zzb:Lcom/google/android/gms/common/server/response/FieldMappingDictionary;

    iget-object v3, v3, Lcom/google/android/gms/common/server/response/FastJsonResponse$Field;->mConcreteTypeName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/common/server/response/FieldMappingDictionary;->getFieldMapping(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    .line 147
    invoke-virtual {p0, p1, v2, v1}, Lcom/google/android/gms/common/server/response/zzl;->zza(Ljava/lang/StringBuilder;Ljava/util/Map;Landroid/os/Parcel;)V

    goto/16 :goto_19

    :pswitch_16
    const/4 v1, 0x0

    .line 148
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzs(Landroid/os/Parcel;I)Landroid/os/Bundle;

    move-result-object v2

    .line 149
    invoke-virtual {v2}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v3

    .line 150
    invoke-interface {v3}, Ljava/util/Set;->size()I

    const-string v6, "{"

    .line 151
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v6, 0x1

    :goto_18
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    if-nez v6, :cond_1a

    .line 153
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    :cond_1a
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ":"

    .line 155
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/common/util/zzn;->zzb(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v6, v1

    goto :goto_18

    :cond_1b
    const-string v1, "}"

    .line 157
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_19

    .line 158
    :pswitch_17
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzt(Landroid/os/Parcel;I)[B

    move-result-object v1

    .line 159
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Landroidx/savedstate/R$id;->zzb([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 161
    :pswitch_18
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzt(Landroid/os/Parcel;I)[B

    move-result-object v1

    .line 162
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Landroidx/savedstate/R$id;->zza([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 163
    :pswitch_19
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzq(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v1

    .line 164
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/google/android/gms/common/util/zzn;->zzb(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 165
    :pswitch_1a
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzc(Landroid/os/Parcel;I)Z

    move-result v1

    .line 166
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 167
    :pswitch_1b
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzp(Landroid/os/Parcel;I)Ljava/math/BigDecimal;

    move-result-object v1

    .line 168
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 169
    :pswitch_1c
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzn(Landroid/os/Parcel;I)D

    move-result-wide v1

    .line 170
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 171
    :pswitch_1d
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzl(Landroid/os/Parcel;I)F

    move-result v1

    .line 172
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 173
    :pswitch_1e
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzi(Landroid/os/Parcel;I)J

    move-result-wide v1

    .line 174
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 175
    :pswitch_1f
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzk(Landroid/os/Parcel;I)Ljava/math/BigInteger;

    move-result-object v1

    .line 176
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 177
    :pswitch_20
    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzbkw;->zzg(Landroid/os/Parcel;I)I

    move-result v1

    .line 178
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_19
    const/4 v1, 0x1

    goto/16 :goto_1

    .line 179
    :cond_1c
    invoke-virtual {p3}, Landroid/os/Parcel;->dataPosition()I

    move-result p0

    if-ne p0, p2, :cond_1d

    const/16 p0, 0x7d

    .line 180
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void

    .line 181
    :cond_1d
    new-instance p0, Lcom/google/android/gms/internal/zzbkx;

    const/16 p1, 0x25

    const-string v0, "Overread allowed size end="

    invoke-static {p1, v0, p2}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/internal/zzbkx;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    throw p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_b
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
    .end packed-switch
.end method
