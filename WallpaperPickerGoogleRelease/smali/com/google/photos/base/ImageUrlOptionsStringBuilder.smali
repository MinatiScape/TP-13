.class public Lcom/google/photos/base/ImageUrlOptionsStringBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final OPTION_JOINER:Lcom/google/common/base/Joiner;


# instance fields
.field public options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/common/base/Joiner;

    const-string v1, "-"

    invoke-direct {v0, v1}, Lcom/google/common/base/Joiner;-><init>(Ljava/lang/String;)V

    .line 2
    sput-object v0, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->OPTION_JOINER:Lcom/google/common/base/Joiner;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;-><init>(Lcom/google/photos/base/ParsedImageUrlOptions$1;)V

    .line 3
    iput-object v0, p0, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    return-void
.end method


# virtual methods
.method public setSize(IZ)Lcom/google/photos/base/ImageUrlOptionsStringBuilder;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "value",
            "sign"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 2
    sget-object v1, Lcom/google/photos/base/ImageUrlOptionsEnum;->SIZE:Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v2, "Size"

    invoke-virtual {v0, v1, p1, v2}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setOptionWithReadableError(Lcom/google/photos/base/ImageUrlOptionsEnum;Ljava/lang/Object;Ljava/lang/String;)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 3
    iget-object p1, p0, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 4
    invoke-virtual {p1, v1, p2}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->setIsSigned(Lcom/google/photos/base/ImageUrlOptionsEnum;Z)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    return-object p0
.end method

.method public toString(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 18
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "prefix",
            "signedOnly"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    .line 1
    iget-object v1, v1, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->options:Lcom/google/photos/base/ParsedImageUrlOptions$Builder;

    .line 2
    iget-object v2, v1, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->existingOptionString:Ljava/lang/String;

    .line 3
    iget-object v3, v1, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->existingOptionTokenInfoMap:Ljava/util/Map;

    .line 4
    iget-object v1, v1, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->newOptionMap:Ljava/util/Map;

    .line 5
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v4

    const-string v5, ""

    if-nez v4, :cond_2

    if-nez p2, :cond_2

    .line 6
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    :cond_1
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    return-object v5

    .line 7
    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 8
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 9
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_3

    .line 11
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    goto :goto_1

    :cond_3
    move-object v6, v7

    .line 12
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 13
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    goto :goto_2

    :cond_4
    move-object v8, v7

    :goto_2
    const/4 v9, 0x0

    move v10, v9

    :goto_3
    if-nez v6, :cond_9

    if-eqz v8, :cond_5

    goto :goto_5

    :cond_5
    if-eqz v9, :cond_6

    .line 14
    invoke-virtual {v2, v10, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    :cond_6
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_7

    goto :goto_4

    :cond_7
    sget-object v1, Lcom/google/photos/base/ImageUrlOptionsStringBuilder;->OPTION_JOINER:Lcom/google/common/base/Joiner;

    invoke-virtual {v1, v4}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_8

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_4

    :cond_8
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_4
    return-object v5

    :cond_9
    :goto_5
    const/4 v11, 0x1

    if-nez v8, :cond_a

    move v13, v11

    goto :goto_7

    :cond_a
    if-nez v6, :cond_b

    move v13, v10

    goto :goto_7

    .line 16
    :cond_b
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/photos/base/ImageUrlOptionsEnum;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/google/photos/base/ImageUrlOptionsEnum;

    invoke-virtual {v12, v13}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v12

    if-gez v12, :cond_c

    move v13, v11

    goto :goto_6

    :cond_c
    move v13, v10

    :goto_6
    if-nez v12, :cond_d

    move-object v6, v7

    :cond_d
    :goto_7
    if-eqz v13, :cond_13

    .line 17
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/photos/base/ImageUrlOptionsParsing$TokenInfo;

    if-eqz p2, :cond_e

    .line 18
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move v12, v10

    goto :goto_8

    :cond_e
    move v12, v11

    :goto_8
    if-eqz v12, :cond_f

    if-nez v9, :cond_f

    .line 19
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9

    :cond_f
    if-eqz v12, :cond_10

    .line 20
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_10
    if-eqz v9, :cond_11

    .line 21
    invoke-virtual {v2, v10, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v9, v10

    :cond_11
    if-eqz v12, :cond_12

    .line 22
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9

    :cond_12
    move v11, v9

    :goto_9
    move v9, v11

    goto/16 :goto_11

    .line 23
    :cond_13
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/photos/base/ImageUrlOptionsEnum;

    .line 24
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    if-eqz p2, :cond_14

    .line 25
    iget-boolean v14, v13, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->signed:Z

    if-eqz v14, :cond_1b

    :cond_14
    if-eqz v9, :cond_15

    .line 26
    invoke-virtual {v2, v10, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v9, v10

    .line 27
    :cond_15
    iget-object v14, v13, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    if-eqz v14, :cond_1b

    .line 28
    iget-boolean v13, v13, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->signed:Z

    if-eqz v13, :cond_16

    .line 29
    invoke-virtual {v12}, Lcom/google/photos/base/ImageUrlOptionsEnum;->getSignedOptionKey()Ljava/lang/String;

    move-result-object v13

    goto :goto_a

    .line 30
    :cond_16
    invoke-virtual {v12}, Lcom/google/photos/base/ImageUrlOptionsEnum;->getOptionKey()Ljava/lang/String;

    move-result-object v13

    .line 31
    :goto_a
    invoke-virtual {v12}, Lcom/google/photos/base/ImageUrlOptionsEnum;->getOptionType()Lcom/google/photos/base/ImageUrlOptionType;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Enum;->ordinal()I

    move-result v14

    packed-switch v14, :pswitch_data_0

    .line 32
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 33
    invoke-virtual {v12}, Lcom/google/photos/base/ImageUrlOptionsEnum;->getOptionType()Lcom/google/photos/base/ImageUrlOptionType;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x18

    const-string v3, "OptionType "

    const-string v4, " not handled."

    invoke-static {v2, v3, v1, v4}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    const-string v7, "0x"

    .line 34
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    iget-object v8, v8, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    new-array v11, v11, [Ljava/lang/Object;

    .line 35
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v11, v10

    const-string v8, "%08x"

    invoke-static {v8, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 36
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_17

    invoke-virtual {v7, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_e

    :cond_17
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v7}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto/16 :goto_d

    .line 37
    :pswitch_1
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    iget-object v7, v7, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_e

    .line 38
    :pswitch_2
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    iget-object v7, v7, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_e

    .line 39
    :pswitch_3
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    iget-object v7, v7, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_e

    .line 40
    :pswitch_4
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    iget-object v7, v7, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    const/16 v8, 0x3b

    const/16 v11, 0x3a

    invoke-virtual {v7, v8, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    goto :goto_e

    :pswitch_5
    move-object v7, v5

    goto :goto_e

    .line 41
    :pswitch_6
    sget-object v10, Lcom/google/common/io/BaseEncoding;->BASE64_URL:Lcom/google/common/io/BaseEncoding;

    .line 42
    check-cast v10, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    .line 43
    iget-object v11, v10, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->paddingChar:Ljava/lang/Character;

    if-nez v11, :cond_18

    goto :goto_b

    :cond_18
    iget-object v11, v10, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    invoke-virtual {v10, v11, v7}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->newInstance(Lcom/google/common/io/BaseEncoding$Alphabet;Ljava/lang/Character;)Lcom/google/common/io/BaseEncoding;

    move-result-object v10

    .line 44
    :goto_b
    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    iget-object v7, v7, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    const/16 v11, 0x8

    new-array v12, v11, [B

    const/4 v14, 0x7

    :goto_c
    if-ltz v14, :cond_19

    const-wide/16 v15, 0xff

    move-object/from16 v17, v12

    and-long v11, v7, v15

    long-to-int v11, v11

    int-to-byte v11, v11

    .line 45
    aput-byte v11, v17, v14

    const/16 v11, 0x8

    shr-long/2addr v7, v11

    add-int/lit8 v14, v14, -0x1

    move-object/from16 v12, v17

    goto :goto_c

    :cond_19
    move-object/from16 v17, v12

    .line 46
    invoke-static {v10}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v7, 0x0

    .line 47
    invoke-static {v7, v11, v11}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 48
    new-instance v8, Ljava/lang/StringBuilder;

    move-object v12, v10

    check-cast v12, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    .line 49
    iget-object v12, v12, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    iget v14, v12, Lcom/google/common/io/BaseEncoding$Alphabet;->charsPerChunk:I

    iget v12, v12, Lcom/google/common/io/BaseEncoding$Alphabet;->bytesPerChunk:I

    sget-object v15, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    invoke-static {v11, v12, v15}, Lcom/google/common/math/IntMath;->divide(IILjava/math/RoundingMode;)I

    move-result v12

    mul-int/2addr v12, v14

    .line 50
    invoke-direct {v8, v12}, Ljava/lang/StringBuilder;-><init>(I)V

    move-object/from16 v12, v17

    .line 51
    :try_start_0
    invoke-virtual {v10, v8, v12, v7, v11}, Lcom/google/common/io/BaseEncoding;->encodeTo(Ljava/lang/Appendable;[BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move v10, v7

    :goto_d
    move-object v7, v8

    .line 53
    :goto_e
    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_1a

    invoke-virtual {v8, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_f

    :cond_1a
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_f
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10

    :catch_0
    move-exception v0

    move-object v1, v0

    .line 54
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_1b
    :goto_10
    const/4 v8, 0x0

    move-object v7, v6

    :goto_11
    if-nez v7, :cond_1c

    .line 55
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1c

    .line 56
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    goto :goto_12

    :cond_1c
    move-object v6, v7

    :goto_12
    if-nez v8, :cond_1d

    .line 57
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1d

    .line 58
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    move-object v8, v7

    :cond_1d
    const/4 v7, 0x0

    goto/16 :goto_3

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
