.class public final Lcom/google/protobuf/Utf8$SafeProcessor;
.super Lcom/google/protobuf/Utf8$Processor;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/Utf8;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SafeProcessor"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/Utf8$Processor;-><init>()V

    return-void
.end method


# virtual methods
.method public decodeUtf8([BII)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    or-int p0, p2, p3

    .line 1
    array-length v0, p1

    sub-int/2addr v0, p2

    sub-int/2addr v0, p3

    or-int/2addr p0, v0

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ltz p0, :cond_d

    add-int p0, p2, p3

    .line 2
    new-array p3, p3, [C

    move v2, v1

    :goto_0
    if-ge p2, p0, :cond_1

    .line 3
    aget-byte v3, p1, p2

    .line 4
    invoke-static {v3}, Lcom/google/protobuf/Utf8$DecodeUtil;->access$400(B)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p2, p2, 0x1

    add-int/lit8 v4, v2, 0x1

    int-to-char v3, v3

    .line 5
    aput-char v3, p3, v2

    move v2, v4

    goto :goto_0

    :cond_1
    :goto_1
    move v7, v2

    :cond_2
    :goto_2
    if-ge p2, p0, :cond_c

    add-int/lit8 v2, p2, 0x1

    .line 6
    aget-byte p2, p1, p2

    .line 7
    invoke-static {p2}, Lcom/google/protobuf/Utf8$DecodeUtil;->access$400(B)Z

    move-result v3

    if-eqz v3, :cond_4

    add-int/lit8 v3, v7, 0x1

    int-to-char p2, p2

    .line 8
    aput-char p2, p3, v7

    move p2, v2

    :goto_3
    move v7, v3

    if-ge p2, p0, :cond_2

    .line 9
    aget-byte v2, p1, p2

    .line 10
    invoke-static {v2}, Lcom/google/protobuf/Utf8$DecodeUtil;->access$400(B)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_2

    :cond_3
    add-int/lit8 p2, p2, 0x1

    add-int/lit8 v3, v7, 0x1

    int-to-char v2, v2

    .line 11
    aput-char v2, p3, v7

    goto :goto_3

    :cond_4
    const/16 v3, -0x20

    if-ge p2, v3, :cond_5

    move v3, v0

    goto :goto_4

    :cond_5
    move v3, v1

    :goto_4
    if-eqz v3, :cond_7

    if-ge v2, p0, :cond_6

    add-int/lit8 v3, v2, 0x1

    .line 12
    aget-byte v2, p1, v2

    add-int/lit8 v4, v7, 0x1

    invoke-static {p2, v2, p3, v7}, Lcom/google/protobuf/Utf8$DecodeUtil;->access$700(BB[CI)V

    move p2, v3

    move v7, v4

    goto :goto_2

    .line 13
    :cond_6
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->invalidUtf8()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0

    :cond_7
    const/16 v3, -0x10

    if-ge p2, v3, :cond_8

    move v3, v0

    goto :goto_5

    :cond_8
    move v3, v1

    :goto_5
    if-eqz v3, :cond_a

    add-int/lit8 v3, p0, -0x1

    if-ge v2, v3, :cond_9

    add-int/lit8 v3, v2, 0x1

    .line 14
    aget-byte v2, p1, v2

    add-int/lit8 v4, v3, 0x1

    aget-byte v3, p1, v3

    add-int/lit8 v5, v7, 0x1

    invoke-static {p2, v2, v3, p3, v7}, Lcom/google/protobuf/Utf8$DecodeUtil;->access$900(BBB[CI)V

    move p2, v4

    move v7, v5

    goto :goto_2

    .line 15
    :cond_9
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->invalidUtf8()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0

    :cond_a
    add-int/lit8 v3, p0, -0x2

    if-ge v2, v3, :cond_b

    add-int/lit8 v3, v2, 0x1

    .line 16
    aget-byte v4, p1, v2

    add-int/lit8 v2, v3, 0x1

    aget-byte v5, p1, v3

    add-int/lit8 v8, v2, 0x1

    aget-byte v6, p1, v2

    add-int/lit8 v9, v7, 0x1

    move v2, p2

    move v3, v4

    move v4, v5

    move v5, v6

    move-object v6, p3

    invoke-static/range {v2 .. v7}, Lcom/google/protobuf/Utf8$DecodeUtil;->access$1000(BBBB[CI)V

    add-int/lit8 v7, v9, 0x1

    move p2, v8

    goto/16 :goto_2

    .line 17
    :cond_b
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->invalidUtf8()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0

    .line 18
    :cond_c
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, p3, v1, v7}, Ljava/lang/String;-><init>([CII)V

    return-object p0

    .line 19
    :cond_d
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    array-length p1, p1

    .line 20
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v2, p2

    const-string p1, "buffer length=%d, index=%d, size=%d"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public encodeUtf8(Ljava/lang/CharSequence;[BII)I
    .locals 6

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p0

    add-int/2addr p4, p3

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x80

    if-ge v0, p0, :cond_0

    add-int v2, v0, p3

    if-ge v2, p4, :cond_0

    .line 2
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    if-ge v3, v1, :cond_0

    int-to-byte v1, v3

    .line 3
    aput-byte v1, p2, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    if-ne v0, p0, :cond_1

    add-int/2addr p3, p0

    return p3

    :cond_1
    add-int/2addr p3, v0

    :goto_1
    if-ge v0, p0, :cond_b

    .line 4
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    if-ge v2, v1, :cond_2

    if-ge p3, p4, :cond_2

    add-int/lit8 v3, p3, 0x1

    int-to-byte v2, v2

    .line 5
    aput-byte v2, p2, p3

    :goto_2
    move p3, v3

    goto/16 :goto_3

    :cond_2
    const/16 v3, 0x800

    if-ge v2, v3, :cond_3

    add-int/lit8 v3, p4, -0x2

    if-gt p3, v3, :cond_3

    add-int/lit8 v3, p3, 0x1

    ushr-int/lit8 v4, v2, 0x6

    or-int/lit16 v4, v4, 0x3c0

    int-to-byte v4, v4

    .line 6
    aput-byte v4, p2, p3

    add-int/lit8 p3, v3, 0x1

    and-int/lit8 v2, v2, 0x3f

    or-int/2addr v2, v1

    int-to-byte v2, v2

    .line 7
    aput-byte v2, p2, v3

    goto :goto_3

    :cond_3
    const v3, 0xdfff

    const v4, 0xd800

    if-lt v2, v4, :cond_4

    if-ge v3, v2, :cond_5

    :cond_4
    add-int/lit8 v5, p4, -0x3

    if-gt p3, v5, :cond_5

    add-int/lit8 v3, p3, 0x1

    ushr-int/lit8 v4, v2, 0xc

    or-int/lit16 v4, v4, 0x1e0

    int-to-byte v4, v4

    .line 8
    aput-byte v4, p2, p3

    add-int/lit8 p3, v3, 0x1

    ushr-int/lit8 v4, v2, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/2addr v4, v1

    int-to-byte v4, v4

    .line 9
    aput-byte v4, p2, v3

    add-int/lit8 v3, p3, 0x1

    and-int/lit8 v2, v2, 0x3f

    or-int/2addr v2, v1

    int-to-byte v2, v2

    .line 10
    aput-byte v2, p2, p3

    goto :goto_2

    :cond_5
    add-int/lit8 v5, p4, -0x4

    if-gt p3, v5, :cond_8

    add-int/lit8 v3, v0, 0x1

    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-eq v3, v4, :cond_7

    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 12
    invoke-static {v2, v0}, Ljava/lang/Character;->toCodePoint(CC)I

    move-result v0

    add-int/lit8 v2, p3, 0x1

    ushr-int/lit8 v4, v0, 0x12

    or-int/lit16 v4, v4, 0xf0

    int-to-byte v4, v4

    .line 13
    aput-byte v4, p2, p3

    add-int/lit8 p3, v2, 0x1

    ushr-int/lit8 v4, v0, 0xc

    and-int/lit8 v4, v4, 0x3f

    or-int/2addr v4, v1

    int-to-byte v4, v4

    .line 14
    aput-byte v4, p2, v2

    add-int/lit8 v2, p3, 0x1

    ushr-int/lit8 v4, v0, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/2addr v4, v1

    int-to-byte v4, v4

    .line 15
    aput-byte v4, p2, p3

    add-int/lit8 p3, v2, 0x1

    and-int/lit8 v0, v0, 0x3f

    or-int/2addr v0, v1

    int-to-byte v0, v0

    .line 16
    aput-byte v0, p2, v2

    move v0, v3

    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    :cond_6
    move v0, v3

    .line 17
    :cond_7
    new-instance p1, Lcom/google/protobuf/Utf8$UnpairedSurrogateException;

    add-int/lit8 v0, v0, -0x1

    invoke-direct {p1, v0, p0}, Lcom/google/protobuf/Utf8$UnpairedSurrogateException;-><init>(II)V

    throw p1

    :cond_8
    if-gt v4, v2, :cond_a

    if-gt v2, v3, :cond_a

    add-int/lit8 p2, v0, 0x1

    .line 18
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p4

    if-eq p2, p4, :cond_9

    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    invoke-static {v2, p1}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    move-result p1

    if-nez p1, :cond_a

    .line 19
    :cond_9
    new-instance p1, Lcom/google/protobuf/Utf8$UnpairedSurrogateException;

    invoke-direct {p1, v0, p0}, Lcom/google/protobuf/Utf8$UnpairedSurrogateException;-><init>(II)V

    throw p1

    .line 20
    :cond_a
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Failed writing "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string p2, " at index "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_b
    return p3
.end method

.method public partialIsValidUtf8(I[BII)I
    .locals 10

    const/16 p0, -0x13

    const/16 v0, -0x3e

    const/16 v1, -0x10

    const/4 v2, 0x0

    const/16 v3, -0x60

    const/16 v4, -0x20

    const/4 v5, -0x1

    const/16 v6, -0x41

    if-eqz p1, :cond_f

    if-lt p3, p4, :cond_0

    return p1

    :cond_0
    int-to-byte v7, p1

    if-ge v7, v4, :cond_3

    if-lt v7, v0, :cond_2

    add-int/lit8 p1, p3, 0x1

    .line 1
    aget-byte p3, p2, p3

    if-le p3, v6, :cond_1

    goto :goto_0

    :cond_1
    move p3, p1

    goto/16 :goto_2

    :cond_2
    :goto_0
    return v5

    :cond_3
    if-ge v7, v1, :cond_9

    shr-int/lit8 p1, p1, 0x8

    not-int p1, p1

    int-to-byte p1, p1

    if-nez p1, :cond_5

    add-int/lit8 p1, p3, 0x1

    .line 2
    aget-byte p3, p2, p3

    if-lt p1, p4, :cond_4

    .line 3
    invoke-static {v7, p3}, Lcom/google/protobuf/Utf8;->access$000(II)I

    move-result p0

    return p0

    :cond_4
    move v9, p3

    move p3, p1

    move p1, v9

    :cond_5
    if-gt p1, v6, :cond_8

    if-ne v7, v4, :cond_6

    if-lt p1, v3, :cond_8

    :cond_6
    if-ne v7, p0, :cond_7

    if-ge p1, v3, :cond_8

    :cond_7
    add-int/lit8 p1, p3, 0x1

    .line 4
    aget-byte p3, p2, p3

    if-le p3, v6, :cond_1

    :cond_8
    return v5

    :cond_9
    shr-int/lit8 v8, p1, 0x8

    not-int v8, v8

    int-to-byte v8, v8

    if-nez v8, :cond_b

    add-int/lit8 p1, p3, 0x1

    .line 5
    aget-byte v8, p2, p3

    if-lt p1, p4, :cond_a

    .line 6
    invoke-static {v7, v8}, Lcom/google/protobuf/Utf8;->access$000(II)I

    move-result p0

    return p0

    :cond_a
    move p3, p1

    move p1, v2

    goto :goto_1

    :cond_b
    shr-int/lit8 p1, p1, 0x10

    int-to-byte p1, p1

    :goto_1
    if-nez p1, :cond_d

    add-int/lit8 p1, p3, 0x1

    .line 7
    aget-byte p3, p2, p3

    if-lt p1, p4, :cond_c

    .line 8
    invoke-static {v7, v8, p3}, Lcom/google/protobuf/Utf8;->incompleteStateFor(III)I

    move-result p0

    return p0

    :cond_c
    move v9, p3

    move p3, p1

    move p1, v9

    :cond_d
    if-gt v8, v6, :cond_e

    shl-int/lit8 v7, v7, 0x1c

    add-int/lit8 v8, v8, 0x70

    add-int/2addr v8, v7

    shr-int/lit8 v7, v8, 0x1e

    if-nez v7, :cond_e

    if-gt p1, v6, :cond_e

    add-int/lit8 p1, p3, 0x1

    .line 9
    aget-byte p3, p2, p3

    if-le p3, v6, :cond_1

    :cond_e
    return v5

    :cond_f
    :goto_2
    if-ge p3, p4, :cond_10

    .line 10
    aget-byte p1, p2, p3

    if-ltz p1, :cond_10

    add-int/lit8 p3, p3, 0x1

    goto :goto_2

    :cond_10
    if-lt p3, p4, :cond_11

    goto/16 :goto_5

    :cond_11
    :goto_3
    if-lt p3, p4, :cond_12

    goto :goto_5

    :cond_12
    add-int/lit8 p1, p3, 0x1

    .line 11
    aget-byte p3, p2, p3

    if-gez p3, :cond_1b

    if-ge p3, v4, :cond_14

    if-lt p1, p4, :cond_13

    move v2, p3

    goto :goto_5

    :cond_13
    if-lt p3, v0, :cond_1a

    add-int/lit8 p3, p1, 0x1

    .line 12
    aget-byte p1, p2, p1

    if-le p1, v6, :cond_11

    goto :goto_4

    :cond_14
    if-ge p3, v1, :cond_18

    add-int/lit8 v7, p4, -0x1

    if-lt p1, v7, :cond_15

    .line 13
    invoke-static {p2, p1, p4}, Lcom/google/protobuf/Utf8;->access$1100([BII)I

    move-result v2

    goto :goto_5

    :cond_15
    add-int/lit8 v7, p1, 0x1

    .line 14
    aget-byte p1, p2, p1

    if-gt p1, v6, :cond_1a

    if-ne p3, v4, :cond_16

    if-lt p1, v3, :cond_1a

    :cond_16
    if-ne p3, p0, :cond_17

    if-ge p1, v3, :cond_1a

    :cond_17
    add-int/lit8 p3, v7, 0x1

    aget-byte p1, p2, v7

    if-le p1, v6, :cond_11

    goto :goto_4

    :cond_18
    add-int/lit8 v7, p4, -0x2

    if-lt p1, v7, :cond_19

    .line 15
    invoke-static {p2, p1, p4}, Lcom/google/protobuf/Utf8;->access$1100([BII)I

    move-result v2

    goto :goto_5

    :cond_19
    add-int/lit8 v7, p1, 0x1

    .line 16
    aget-byte p1, p2, p1

    if-gt p1, v6, :cond_1a

    shl-int/lit8 p3, p3, 0x1c

    add-int/lit8 p1, p1, 0x70

    add-int/2addr p1, p3

    shr-int/lit8 p1, p1, 0x1e

    if-nez p1, :cond_1a

    add-int/lit8 p1, v7, 0x1

    aget-byte p3, p2, v7

    if-gt p3, v6, :cond_1a

    add-int/lit8 p3, p1, 0x1

    aget-byte p1, p2, p1

    if-le p1, v6, :cond_11

    :cond_1a
    :goto_4
    move v2, v5

    :goto_5
    return v2

    :cond_1b
    move p3, p1

    goto :goto_3
.end method
