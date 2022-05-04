.class public Lkotlin/text/StringsKt__StringsKt;
.super Lkotlin/text/StringsKt__StringsJVMKt;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nStrings.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Strings.kt\nkotlin/text/StringsKt__StringsKt\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,1381:1\n71#1,22:1382\n105#1,5:1404\n122#1,5:1409\n71#1,22:1414\n99#1:1436\n71#1,22:1437\n105#1,5:1459\n116#1:1464\n105#1,5:1465\n122#1,5:1470\n133#1:1475\n122#1,5:1476\n71#1,22:1481\n105#1,5:1503\n122#1,5:1508\n12751#2,2:1513\n12751#2,2:1515\n256#3,2:1517\n256#3,2:1519\n1517#3:1522\n1588#3,3:1523\n1517#3:1526\n1588#3,3:1527\n1#4:1521\n*E\n*S KotlinDebug\n*F\n+ 1 Strings.kt\nkotlin/text/StringsKt__StringsKt\n*L\n99#1,22:1382\n116#1,5:1404\n133#1,5:1409\n138#1,22:1414\n143#1:1436\n143#1,22:1437\n148#1,5:1459\n153#1:1464\n153#1,5:1465\n158#1,5:1470\n163#1:1475\n163#1,5:1476\n168#1,22:1481\n179#1,5:1503\n190#1,5:1508\n934#1,2:1513\n958#1,2:1515\n997#1,2:1517\n1003#1,2:1519\n1300#1:1522\n1300#1,3:1523\n1325#1:1526\n1325#1,3:1527\n*E\n"
.end annotation


# direct methods
.method public static final getLastIndex(Ljava/lang/CharSequence;)I
    .locals 1
    .param p0    # Ljava/lang/CharSequence;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "$this$lastIndex"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    return p0
.end method

.method public static final indexOf(Ljava/lang/CharSequence;Ljava/lang/String;IZ)I
    .locals 6
    .param p0    # Ljava/lang/CharSequence;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "$this$indexOf"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "string"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p3, :cond_1

    .line 1
    instance-of v0, p0, Ljava/lang/String;

    if-nez v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p0

    goto :goto_1

    .line 3
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    .line 4
    invoke-static/range {v0 .. v5}, Lkotlin/text/StringsKt__StringsKt;->indexOf$StringsKt__StringsKt(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IIZZ)I

    move-result p0

    :goto_1
    return p0
.end method

.method public static final indexOf$StringsKt__StringsKt(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IIZZ)I
    .locals 7

    const/4 v0, -0x1

    const/4 v1, 0x0

    if-nez p5, :cond_2

    if-gez p2, :cond_0

    move p2, v1

    .line 1
    :cond_0
    new-instance p5, Lkotlin/ranges/IntRange;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-le p3, v1, :cond_1

    move p3, v1

    :cond_1
    invoke-direct {p5, p2, p3}, Lkotlin/ranges/IntRange;-><init>(II)V

    goto :goto_0

    .line 2
    :cond_2
    invoke-static {p0}, Lkotlin/text/StringsKt__StringsKt;->getLastIndex(Ljava/lang/CharSequence;)I

    move-result p5

    if-le p2, p5, :cond_3

    move p2, p5

    :cond_3
    if-gez p3, :cond_4

    move p3, v1

    .line 3
    :cond_4
    new-instance p5, Lkotlin/ranges/IntProgression;

    invoke-direct {p5, p2, p3, v0}, Lkotlin/ranges/IntProgression;-><init>(III)V

    .line 4
    :goto_0
    instance-of p2, p0, Ljava/lang/String;

    if-eqz p2, :cond_7

    instance-of p2, p1, Ljava/lang/String;

    if-eqz p2, :cond_7

    .line 5
    iget p2, p5, Lkotlin/ranges/IntProgression;->first:I

    .line 6
    iget p3, p5, Lkotlin/ranges/IntProgression;->last:I

    .line 7
    iget p5, p5, Lkotlin/ranges/IntProgression;->step:I

    if-ltz p5, :cond_5

    if-gt p2, p3, :cond_a

    goto :goto_1

    :cond_5
    if-lt p2, p3, :cond_a

    .line 8
    :goto_1
    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x0

    move-object v3, p0

    check-cast v3, Ljava/lang/String;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    move v4, p2

    move v6, p4

    invoke-static/range {v1 .. v6}, Lkotlin/text/StringsKt__StringsJVMKt;->regionMatches(Ljava/lang/String;ILjava/lang/String;IIZ)Z

    move-result v1

    if-eqz v1, :cond_6

    return p2

    :cond_6
    if-eq p2, p3, :cond_a

    add-int/2addr p2, p5

    goto :goto_1

    .line 9
    :cond_7
    iget p2, p5, Lkotlin/ranges/IntProgression;->first:I

    .line 10
    iget p3, p5, Lkotlin/ranges/IntProgression;->last:I

    .line 11
    iget p5, p5, Lkotlin/ranges/IntProgression;->step:I

    if-ltz p5, :cond_8

    if-gt p2, p3, :cond_a

    goto :goto_2

    :cond_8
    if-lt p2, p3, :cond_a

    :goto_2
    const/4 v2, 0x0

    .line 12
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    move-object v1, p1

    move-object v3, p0

    move v4, p2

    move v6, p4

    invoke-static/range {v1 .. v6}, Lkotlin/text/StringsKt__StringsKt;->regionMatchesImpl(Ljava/lang/CharSequence;ILjava/lang/CharSequence;IIZ)Z

    move-result v1

    if-eqz v1, :cond_9

    return p2

    :cond_9
    if-eq p2, p3, :cond_a

    add-int/2addr p2, p5

    goto :goto_2

    :cond_a
    return v0
.end method

.method public static indexOf$default(Ljava/lang/CharSequence;CIZI)I
    .locals 5

    and-int/lit8 v0, p4, 0x2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move p2, v1

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    move p3, v1

    :cond_1
    if-nez p3, :cond_2

    .line 1
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->indexOf(II)I

    move-result p0

    goto :goto_3

    :cond_2
    const/4 p4, 0x1

    new-array v0, p4, [C

    aput-char p1, v0, v1

    if-nez p3, :cond_3

    .line 2
    invoke-static {v0}, Lkotlin/collections/ArraysKt___ArraysKt;->single([C)C

    move-result p1

    .line 3
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->indexOf(II)I

    move-result p0

    goto :goto_3

    :cond_3
    if-gez p2, :cond_4

    move p2, v1

    .line 4
    :cond_4
    invoke-static {p0}, Lkotlin/text/StringsKt__StringsKt;->getLastIndex(Ljava/lang/CharSequence;)I

    move-result p1

    if-gt p2, p1, :cond_8

    .line 5
    :goto_0
    invoke-interface {p0, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    move v3, v1

    :goto_1
    if-ge v3, p4, :cond_6

    .line 6
    aget-char v4, v0, v3

    .line 7
    invoke-static {v4, v2, p3}, Lkotlin/text/CharsKt__CharKt;->equals(CCZ)Z

    move-result v4

    if-eqz v4, :cond_5

    move v2, p4

    goto :goto_2

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_6
    move v2, v1

    :goto_2
    if-eqz v2, :cond_7

    move p0, p2

    goto :goto_3

    :cond_7
    if-eq p2, p1, :cond_8

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_8
    const/4 p0, -0x1

    :goto_3
    return p0
.end method

.method public static synthetic indexOf$default(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I
    .locals 2

    and-int/lit8 v0, p4, 0x2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move p2, v1

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    move p3, v1

    .line 8
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lkotlin/text/StringsKt__StringsKt;->indexOf(Ljava/lang/CharSequence;Ljava/lang/String;IZ)I

    move-result p0

    return p0
.end method

.method public static lastIndexOf$default(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I
    .locals 6

    and-int/lit8 v0, p4, 0x2

    if-eqz v0, :cond_0

    .line 1
    invoke-static {p0}, Lkotlin/text/StringsKt__StringsKt;->getLastIndex(Ljava/lang/CharSequence;)I

    move-result p2

    :cond_0
    move v2, p2

    and-int/lit8 p2, p4, 0x4

    if-eqz p2, :cond_1

    const/4 p3, 0x0

    :cond_1
    move v4, p3

    const-string p2, "$this$lastIndexOf"

    .line 2
    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "string"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez v4, :cond_3

    .line 3
    instance-of p2, p0, Ljava/lang/String;

    if-nez p2, :cond_2

    goto :goto_0

    .line 4
    :cond_2
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result p0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v3, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    .line 5
    invoke-static/range {v0 .. v5}, Lkotlin/text/StringsKt__StringsKt;->indexOf$StringsKt__StringsKt(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IIZZ)I

    move-result p0

    :goto_1
    return p0
.end method

.method public static final regionMatchesImpl(Ljava/lang/CharSequence;ILjava/lang/CharSequence;IIZ)Z
    .locals 4
    .param p0    # Ljava/lang/CharSequence;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/CharSequence;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "$this$regionMatchesImpl"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "other"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    if-ltz p3, :cond_3

    if-ltz p1, :cond_3

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr v1, p4

    if-gt p1, v1, :cond_3

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr v1, p4

    if-le p3, v1, :cond_0

    goto :goto_1

    :cond_0
    move v1, v0

    :goto_0
    if-ge v1, p4, :cond_2

    add-int v2, p1, v1

    .line 2
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int v3, p3, v1

    invoke-interface {p2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v2, v3, p5}, Lkotlin/text/CharsKt__CharKt;->equals(CCZ)Z

    move-result v2

    if-nez v2, :cond_1

    return v0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    return p0

    :cond_3
    :goto_1
    return v0
.end method

.method public static split$default(Ljava/lang/CharSequence;[Ljava/lang/String;ZII)Ljava/util/List;
    .locals 6

    and-int/lit8 v0, p4, 0x2

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move p2, v1

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    move p3, v1

    :cond_1
    const-string p4, "$this$split"

    .line 1
    invoke-static {p0, p4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    array-length p4, p1

    const/16 v0, 0xa

    const/16 v2, 0x2e

    const-string v3, "Limit must be non-negative, but was "

    const/4 v4, 0x1

    if-ne p4, v4, :cond_c

    .line 3
    aget-object p4, p1, v1

    .line 4
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_2

    move v5, v4

    goto :goto_0

    :cond_2
    move v5, v1

    :goto_0
    if-nez v5, :cond_c

    if-ltz p3, :cond_3

    move p1, v4

    goto :goto_1

    :cond_3
    move p1, v1

    :goto_1
    if-eqz p1, :cond_b

    .line 5
    invoke-static {p0, p4, v1, p2}, Lkotlin/text/StringsKt__StringsKt;->indexOf(Ljava/lang/CharSequence;Ljava/lang/String;IZ)I

    move-result p1

    const/4 v2, -0x1

    if-eq p1, v2, :cond_a

    if-ne p3, v4, :cond_4

    goto :goto_5

    :cond_4
    if-lez p3, :cond_5

    goto :goto_2

    :cond_5
    move v4, v1

    .line 6
    :goto_2
    new-instance v3, Ljava/util/ArrayList;

    if-eqz v4, :cond_7

    if-le p3, v0, :cond_6

    goto :goto_3

    :cond_6
    move v0, p3

    :cond_7
    :goto_3
    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 7
    :cond_8
    invoke-interface {p0, v1, p1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    add-int v1, v0, p1

    if-eqz v4, :cond_9

    .line 9
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 v0, p3, -0x1

    if-ne p1, v0, :cond_9

    goto :goto_4

    .line 10
    :cond_9
    invoke-static {p0, p4, v1, p2}, Lkotlin/text/StringsKt__StringsKt;->indexOf(Ljava/lang/CharSequence;Ljava/lang/String;IZ)I

    move-result p1

    if-ne p1, v2, :cond_8

    .line 11
    :goto_4
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-interface {p0, v1, p1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_8

    .line 12
    :cond_a
    :goto_5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt__CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    goto/16 :goto_8

    .line 13
    :cond_b
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_c
    if-ltz p3, :cond_d

    move p4, v4

    goto :goto_6

    :cond_d
    move p4, v1

    :goto_6
    if-eqz p4, :cond_f

    .line 14
    invoke-static {p1}, Lkotlin/collections/ArraysKt___ArraysKt;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 15
    new-instance p4, Lkotlin/text/DelimitedRangesSequence;

    new-instance v2, Lkotlin/text/StringsKt__StringsKt$rangesDelimitedBy$4;

    invoke-direct {v2, p1, p2}, Lkotlin/text/StringsKt__StringsKt$rangesDelimitedBy$4;-><init>(Ljava/util/List;Z)V

    invoke-direct {p4, p0, v1, p3, v2}, Lkotlin/text/DelimitedRangesSequence;-><init>(Ljava/lang/CharSequence;IILkotlin/jvm/functions/Function2;)V

    .line 16
    new-instance p1, Lkotlin/sequences/SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1;

    invoke-direct {p1, p4}, Lkotlin/sequences/SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1;-><init>(Lkotlin/sequences/Sequence;)V

    .line 17
    new-instance v3, Ljava/util/ArrayList;

    invoke-static {p1, v0}, Lkotlin/collections/CollectionsKt__IteratorsJVMKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result p2

    invoke-direct {v3, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 18
    invoke-virtual {p1}, Lkotlin/sequences/SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_7
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    .line 19
    check-cast p2, Lkotlin/ranges/IntRange;

    const-string p3, "range"

    .line 20
    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    iget p3, p2, Lkotlin/ranges/IntProgression;->first:I

    .line 22
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    .line 23
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    .line 24
    iget p2, p2, Lkotlin/ranges/IntProgression;->last:I

    .line 25
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 26
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    add-int/2addr p2, v4

    invoke-interface {p0, p3, p2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 27
    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :cond_e
    :goto_8
    return-object v3

    .line 28
    :cond_f
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static substringAfter$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    and-int/lit8 p2, p3, 0x2

    if-eqz p2, :cond_0

    move-object p2, p0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    const-string p3, "missingDelimiterValue"

    .line 1
    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p3, 0x0

    const/4 v0, 0x6

    .line 2
    invoke-static {p0, p1, p3, p3, v0}, Lkotlin/text/StringsKt__StringsKt;->indexOf$default(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    move-result p3

    const/4 v0, -0x1

    if-ne p3, v0, :cond_1

    goto :goto_1

    .line 3
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/2addr p1, p3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    const-string p0, "(this as java.lang.Strin\u2026ing(startIndex, endIndex)"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_1
    return-object p2
.end method

.method public static substringAfterLast$default(Ljava/lang/String;CLjava/lang/String;I)Ljava/lang/String;
    .locals 0

    and-int/lit8 p2, p3, 0x2

    if-eqz p2, :cond_0

    move-object p2, p0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    const-string p3, "$this$substringAfterLast"

    .line 1
    invoke-static {p0, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p3, "missingDelimiterValue"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-static {p0}, Lkotlin/text/StringsKt__StringsKt;->getLastIndex(Ljava/lang/CharSequence;)I

    move-result p3

    .line 3
    invoke-virtual {p0, p1, p3}, Ljava/lang/String;->lastIndexOf(II)I

    move-result p1

    const/4 p3, -0x1

    if-ne p1, p3, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    const-string p0, "(this as java.lang.Strin\u2026ing(startIndex, endIndex)"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_1
    return-object p2
.end method
