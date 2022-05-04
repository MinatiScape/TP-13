.class public final Lcom/google/common/io/BaseEncoding$Alphabet;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/BaseEncoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Alphabet"
.end annotation


# instance fields
.field public final bitsPerChar:I

.field public final bytesPerChunk:I

.field public final chars:[C

.field public final charsPerChunk:I

.field public final decodabet:[B

.field public final mask:I

.field public final name:Ljava/lang/String;

.field public final validPadding:[Z


# direct methods
.method public constructor <init>(Ljava/lang/String;[C)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "chars"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->name:Ljava/lang/String;

    .line 4
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    iput-object p2, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->chars:[C

    .line 6
    :try_start_0
    array-length p1, p2

    sget-object v0, Ljava/math/RoundingMode;->UNNECESSARY:Ljava/math/RoundingMode;

    invoke-static {p1, v0}, Lcom/google/common/math/IntMath;->log2(ILjava/math/RoundingMode;)I

    move-result p1

    iput p1, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_1

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->lowestOneBit(I)I

    move-result v0

    const/16 v1, 0x8

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 8
    :try_start_1
    div-int/2addr v1, v0

    iput v1, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->charsPerChunk:I

    .line 9
    div-int/2addr p1, v0

    iput p1, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->bytesPerChunk:I
    :try_end_1
    .catch Ljava/lang/ArithmeticException; {:try_start_1 .. :try_end_1} :catch_0

    .line 10
    array-length p1, p2

    const/4 v0, 0x1

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->mask:I

    const/16 p1, 0x80

    new-array v1, p1, [B

    const/4 v2, -0x1

    .line 11
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    const/4 v3, 0x0

    move v4, v3

    .line 12
    :goto_0
    array-length v5, p2

    if-ge v4, v5, :cond_2

    .line 13
    aget-char v5, p2, v4

    if-ge v5, p1, :cond_0

    move v6, v0

    goto :goto_1

    :cond_0
    move v6, v3

    :goto_1
    const-string v7, "Non-ASCII character: %s"

    .line 14
    invoke-static {v6, v7, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;C)V

    .line 15
    aget-byte v6, v1, v5

    if-ne v6, v2, :cond_1

    move v6, v0

    goto :goto_2

    :cond_1
    move v6, v3

    :goto_2
    const-string v7, "Duplicate character: %s"

    invoke-static {v6, v7, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;C)V

    int-to-byte v6, v4

    .line 16
    aput-byte v6, v1, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 17
    :cond_2
    iput-object v1, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->decodabet:[B

    .line 18
    iget p1, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->charsPerChunk:I

    new-array p1, p1, [Z

    .line 19
    :goto_3
    iget p2, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->bytesPerChunk:I

    if-ge v3, p2, :cond_3

    mul-int/lit8 p2, v3, 0x8

    .line 20
    iget v1, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    sget-object v2, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    invoke-static {p2, v1, v2}, Lcom/google/common/math/IntMath;->divide(IILjava/math/RoundingMode;)I

    move-result p2

    aput-boolean v0, p1, p2

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 21
    :cond_3
    iput-object p1, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->validPadding:[Z

    return-void

    :catch_0
    move-exception p0

    .line 22
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Illegal alphabet "

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p2}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p2

    if-eqz p2, :cond_4

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_4

    :cond_4
    new-instance p2, Ljava/lang/String;

    invoke-direct {p2, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_4
    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    .line 23
    new-instance p1, Ljava/lang/IllegalArgumentException;

    array-length p2, p2

    const/16 v0, 0x23

    const-string v1, "Illegal alphabet length "

    invoke-static {v0, v1, p2}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "other"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/common/io/BaseEncoding$Alphabet;

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/google/common/io/BaseEncoding$Alphabet;

    .line 3
    iget-object p0, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->chars:[C

    iget-object p1, p1, Lcom/google/common/io/BaseEncoding$Alphabet;->chars:[C

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([C[C)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->chars:[C

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([C)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/common/io/BaseEncoding$Alphabet;->name:Ljava/lang/String;

    return-object p0
.end method
