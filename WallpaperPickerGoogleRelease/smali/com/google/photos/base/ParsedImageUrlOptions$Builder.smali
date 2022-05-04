.class public Lcom/google/photos/base/ParsedImageUrlOptions$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public existingOptionString:Ljava/lang/String;

.field public existingOptionTokenInfoMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/photos/base/ImageUrlOptionsEnum;",
            "Lcom/google/photos/base/ImageUrlOptionsParsing$TokenInfo;",
            ">;"
        }
    .end annotation
.end field

.field public newOptionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/photos/base/ImageUrlOptionsEnum;",
            "Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/photos/base/ParsedImageUrlOptions$1;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    const-class p1, Lcom/google/photos/base/ImageUrlOptionsEnum;

    new-instance v0, Ljava/util/EnumMap;

    invoke-direct {v0, p1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    const-string v1, ""

    .line 3
    iput-object v1, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->existingOptionString:Ljava/lang/String;

    .line 4
    iput-object v0, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->existingOptionTokenInfoMap:Ljava/util/Map;

    .line 5
    new-instance v0, Ljava/util/EnumMap;

    invoke-direct {v0, p1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->newOptionMap:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final setIsSigned(Lcom/google/photos/base/ImageUrlOptionsEnum;Z)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "optionEnum",
            "value"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->existingOptionTokenInfoMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->newOptionMap:Ljava/util/Map;

    .line 2
    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    .line 3
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    iget-object v0, v0, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    if-eqz v0, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v4

    goto :goto_0

    .line 4
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    if-nez v0, :cond_3

    if-nez p2, :cond_2

    goto :goto_1

    .line 5
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "A value must be set for an option before setting its signed-ness."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 6
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->existingOptionTokenInfoMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->newOptionMap:Ljava/util/Map;

    .line 7
    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 8
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    .line 9
    iget-object v0, v0, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    if-eqz v0, :cond_5

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    iget-boolean v0, v0, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->signed:Z

    if-eqz v0, :cond_5

    goto :goto_2

    .line 10
    :cond_4
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 11
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/photos/base/ImageUrlOptionsParsing$TokenInfo;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    move v3, v4

    :goto_2
    if-ne v3, p2, :cond_6

    return-object p0

    .line 12
    :cond_6
    iget-object v0, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->newOptionMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 13
    iget-object v0, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->newOptionMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    .line 14
    new-instance v2, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    iget-object v1, v1, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    invoke-direct {v2, v1, p2}, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;-><init>(Ljava/lang/Object;Z)V

    .line 15
    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_5

    .line 16
    :cond_7
    iget-object v0, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->newOptionMap:Ljava/util/Map;

    new-instance v1, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    .line 17
    iget-object v2, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->existingOptionTokenInfoMap:Ljava/util/Map;

    .line 18
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 19
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    .line 20
    iget-object v2, v2, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;->value:Ljava/lang/Object;

    if-nez v2, :cond_8

    .line 21
    sget-object v2, Lcom/google/common/base/Absent;->INSTANCE:Lcom/google/common/base/Absent;

    goto :goto_4

    .line 22
    :cond_8
    new-instance v3, Lcom/google/common/base/Present;

    invoke-direct {v3, v2}, Lcom/google/common/base/Present;-><init>(Ljava/lang/Object;)V

    :goto_3
    move-object v2, v3

    goto :goto_4

    .line 23
    :cond_9
    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 24
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/photos/base/ImageUrlOptionsParsing$TokenInfo;

    .line 25
    invoke-virtual {p1}, Lcom/google/photos/base/ImageUrlOptionsEnum;->getOptionType()Lcom/google/photos/base/ImageUrlOptionType;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const-string v4, "A Float option must have an non-empty value."

    packed-switch v3, :pswitch_data_0

    .line 26
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 27
    invoke-virtual {p1}, Lcom/google/photos/base/ImageUrlOptionsEnum;->getOptionType()Lcom/google/photos/base/ImageUrlOptionType;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    add-int/lit8 p2, p2, 0x18

    const-string v0, "OptionType "

    const-string v1, " not handled."

    invoke-static {p2, v0, p1, v1}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    const-string p0, "A PrefixHex option must have a value of at least 2 chars."

    .line 28
    invoke-static {v2, p0}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder$$ExternalSyntheticOutline0;->m(Lcom/google/photos/base/ImageUrlOptionsParsing$TokenInfo;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object p0

    .line 29
    throw p0

    .line 30
    :pswitch_1
    invoke-static {v2, v4}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder$$ExternalSyntheticOutline0;->m(Lcom/google/photos/base/ImageUrlOptionsParsing$TokenInfo;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object p0

    .line 31
    throw p0

    :pswitch_2
    const-string p0, "A Long option must have an non-empty value."

    .line 32
    invoke-static {v2, p0}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder$$ExternalSyntheticOutline0;->m(Lcom/google/photos/base/ImageUrlOptionsParsing$TokenInfo;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object p0

    .line 33
    throw p0

    :pswitch_3
    const-string p0, "An Integer option must have an non-empty value."

    .line 34
    invoke-static {v2, p0}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder$$ExternalSyntheticOutline0;->m(Lcom/google/photos/base/ImageUrlOptionsParsing$TokenInfo;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object p0

    .line 35
    throw p0

    .line 36
    :pswitch_4
    invoke-static {v2, v4}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder$$ExternalSyntheticOutline0;->m(Lcom/google/photos/base/ImageUrlOptionsParsing$TokenInfo;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object p0

    .line 37
    throw p0

    .line 38
    :pswitch_5
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 40
    new-instance v3, Lcom/google/common/base/Present;

    .line 41
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    invoke-direct {v3, v2}, Lcom/google/common/base/Present;-><init>(Ljava/lang/Object;)V

    goto :goto_3

    :pswitch_6
    const-string p0, "A FixedLengthBase64 option must have an non-empty value."

    .line 43
    invoke-static {v2, p0}, Lcom/google/photos/base/ParsedImageUrlOptions$Builder$$ExternalSyntheticOutline0;->m(Lcom/google/photos/base/ImageUrlOptionsParsing$TokenInfo;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object p0

    .line 44
    throw p0

    .line 45
    :cond_a
    sget-object v2, Lcom/google/common/base/Absent;->INSTANCE:Lcom/google/common/base/Absent;

    .line 46
    :goto_4
    invoke-virtual {v2}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2, p2}, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;-><init>(Ljava/lang/Object;Z)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_5
    return-object p0

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

.method public final setOptionWithReadableError(Lcom/google/photos/base/ImageUrlOptionsEnum;Ljava/lang/Object;Ljava/lang/String;)Lcom/google/photos/base/ParsedImageUrlOptions$Builder;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "optionEnum",
            "value",
            "capitalName"
        }
    .end annotation

    if-eqz p2, :cond_2

    .line 1
    invoke-virtual {p1}, Lcom/google/photos/base/ImageUrlOptionsEnum;->getOptionType()Lcom/google/photos/base/ImageUrlOptionType;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p3

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p3, :pswitch_data_0

    .line 2
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Lcom/google/photos/base/ImageUrlOptionsEnum;->getOptionType()Lcom/google/photos/base/ImageUrlOptionType;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    add-int/lit8 p2, p2, 0x18

    const-string p3, "Unexpected option type: "

    invoke-static {p2, p3, p1}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3
    :pswitch_0
    move-object p3, p2

    check-cast p3, Ljava/lang/Float;

    .line 4
    invoke-virtual {p3}, Ljava/lang/Float;->isNaN()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p3}, Ljava/lang/Float;->isInfinite()Z

    move-result p3

    if-nez p3, :cond_0

    goto :goto_0

    .line 5
    :pswitch_1
    move-object p3, p2

    check-cast p3, Ljava/lang/Long;

    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p3, v2, v4

    if-ltz p3, :cond_0

    goto :goto_0

    .line 6
    :pswitch_2
    move-object p3, p2

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    if-ltz p3, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    goto :goto_0

    .line 7
    :pswitch_3
    move-object p3, p2

    check-cast p3, Ljava/lang/String;

    .line 8
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    xor-int/2addr v0, p3

    goto :goto_0

    .line 9
    :pswitch_4
    move-object p3, p2

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    :pswitch_5
    if-nez v0, :cond_1

    .line 10
    new-instance p2, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    const/4 p3, 0x0

    invoke-direct {p2, p3, v1}, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;-><init>(Ljava/lang/Object;Z)V

    .line 11
    iget-object p3, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->newOptionMap:Ljava/util/Map;

    invoke-interface {p3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 12
    :cond_1
    new-instance p3, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;

    invoke-direct {p3, p2, v1}, Lcom/google/photos/base/ParsedImageUrlOptions$OptionState;-><init>(Ljava/lang/Object;Z)V

    .line 13
    iget-object p2, p0, Lcom/google/photos/base/ParsedImageUrlOptions$Builder;->newOptionMap:Ljava/util/Map;

    invoke-interface {p2, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    return-object p0

    .line 14
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, 0x33

    const-string p2, "Cannot set an option to null. Did you mean clear"

    const-string v0, "()?"

    invoke-static {p1, p2, p3, v0}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method
