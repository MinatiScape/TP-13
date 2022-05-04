.class public final Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;
.super Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;
.source "SourceFile"


# instance fields
.field public final length:I

.field public final mime:Ljava/lang/String;

.field public final padding:I

.field public final semantic:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IILcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->mime:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->semantic:Ljava/lang/String;

    .line 4
    iput p3, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->length:I

    .line 5
    iput p4, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->padding:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 2
    check-cast p1, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;

    .line 3
    iget-object v1, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->mime:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getMime()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->semantic:Ljava/lang/String;

    .line 4
    invoke-virtual {p1}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getSemantic()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->length:I

    .line 5
    invoke-virtual {p1}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getLength()I

    move-result v3

    if-ne v1, v3, :cond_1

    iget p0, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->padding:I

    .line 6
    invoke-virtual {p1}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getPadding()I

    move-result p1

    if-ne p0, p1, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public getLength()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->length:I

    return p0
.end method

.method public getMime()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->mime:Ljava/lang/String;

    return-object p0
.end method

.method public getPadding()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->padding:I

    return p0
.end method

.method public getSemantic()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->semantic:Ljava/lang/String;

    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->mime:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    .line 2
    iget-object v2, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->semantic:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    .line 3
    iget v2, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->length:I

    xor-int/2addr v0, v2

    mul-int/2addr v0, v1

    .line 4
    iget p0, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->padding:I

    xor-int/2addr p0, v0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->mime:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->semantic:Ljava/lang/String;

    iget v2, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->length:I

    iget p0, p0, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;->padding:I

    const/16 v3, 0x55

    invoke-static {v0, v3}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v1, v3}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "MicroVideoXmpContainerItem{mime="

    const-string v5, ", semantic="

    invoke-static {v3, v4, v0, v5, v1}, Landroidx/recyclerview/R$attr$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", length="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", padding="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
