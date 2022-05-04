.class public Lkotlin/collections/CollectionsKt___CollectionsKt;
.super Lkotlin/collections/CollectionsKt__ReversedViewsKt;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\n_Collections.kt\nKotlin\n*S Kotlin\n*F\n+ 1 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n+ 4 Maps.kt\nkotlin/collections/MapsKt__MapsKt\n+ 5 Iterators.kt\nkotlin/collections/CollectionsKt__IteratorsKt\n*L\n1#1,3517:1\n256#1,2:3518\n486#1,7:3520\n501#1,6:3527\n825#1,2:3534\n756#1:3536\n1828#1,2:3537\n757#1,2:3539\n1830#1:3541\n759#1:3542\n1828#1,3:3543\n777#1,2:3546\n815#1,2:3548\n1221#1,4:3554\n1190#1,4:3558\n1206#1,4:3562\n1253#1,4:3566\n1414#1,5:3570\n1429#1,5:3575\n1470#1,3:3580\n1473#1,3:3590\n1488#1,3:3593\n1491#1,3:3603\n1588#1,3:3620\n1558#1,4:3623\n1547#1:3627\n1828#1,2:3628\n1830#1:3631\n1548#1:3632\n1828#1,3:3633\n1579#1:3636\n1819#1:3637\n1820#1:3639\n1580#1:3640\n1819#1,2:3641\n1865#1,14:3643\n2160#1,14:3657\n1828#1,3:3671\n2661#1,3:3674\n2664#1,6:3678\n2686#1,3:3684\n2689#1,7:3688\n2712#1,4:3695\n2716#1,5:3700\n2737#1,4:3705\n2741#1,6:3710\n825#1,2:3716\n787#1:3718\n815#1,2:3719\n787#1:3721\n815#1,2:3722\n787#1:3724\n815#1,2:3725\n3239#1,8:3731\n3267#1,7:3739\n3298#1,10:3746\n1#2:3533\n1#2:3630\n1#2:3638\n1#2:3677\n1#2:3687\n1#2:3699\n1#2:3709\n37#3,2:3550\n37#3,2:3552\n355#4,7:3583\n355#4,7:3596\n355#4,7:3606\n355#4,7:3613\n32#5,2:3727\n32#5,2:3729\n*E\n*S KotlinDebug\n*F\n+ 1 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n167#1,2:3518\n177#1,7:3520\n187#1,6:3527\n734#1,2:3534\n745#1:3536\n745#1,2:3537\n745#1,2:3539\n745#1:3541\n745#1:3542\n756#1,3:3543\n768#1,2:3546\n787#1,2:3548\n1148#1,4:3554\n1163#1,4:3558\n1177#1,4:3562\n1240#1,4:3566\n1328#1,5:3570\n1341#1,5:3575\n1445#1,3:3580\n1445#1,3:3590\n1458#1,3:3593\n1458#1,3:3603\n1517#1,3:3620\n1527#1,4:3623\n1537#1:3627\n1537#1,2:3628\n1537#1:3631\n1537#1:3632\n1547#1,3:3633\n1571#1:3636\n1571#1:3637\n1571#1:3639\n1571#1:3640\n1579#1,2:3641\n1855#1,14:3643\n2150#1,14:3657\n2459#1,3:3671\n2763#1,3:3674\n2763#1,6:3678\n2781#1,3:3684\n2781#1,7:3688\n2788#1,4:3695\n2788#1,5:3700\n2795#1,4:3705\n2795#1,6:3710\n2967#1,2:3716\n2979#1:3718\n2979#1,2:3719\n2992#1:3721\n2992#1,2:3722\n3005#1:3724\n3005#1,2:3725\n3228#1,8:3731\n3256#1,7:3739\n3285#1,10:3746\n1537#1:3630\n1571#1:3638\n2763#1:3677\n2781#1:3687\n2788#1:3699\n2795#1:3709\n1000#1,2:3550\n1043#1,2:3552\n1445#1,7:3583\n1458#1,7:3596\n1472#1,7:3606\n1490#1,7:3613\n3173#1,2:3727\n3215#1,2:3729\n*E\n"
.end annotation


# direct methods
.method public static final drop(Ljava/lang/Iterable;I)Ljava/util/List;
    .locals 3
    .param p0    # Ljava/lang/Iterable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TT;>;I)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ltz p1, :cond_0

    move v0, v1

    :cond_0
    if-eqz v0, :cond_7

    if-nez p1, :cond_1

    .line 1
    invoke-static {p0}, Lkotlin/collections/CollectionsKt___CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 2
    :cond_1
    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    sub-int/2addr v2, p1

    if-gtz v2, :cond_2

    .line 3
    sget-object p0, Lkotlin/collections/EmptyList;->INSTANCE:Lkotlin/collections/EmptyList;

    return-object p0

    :cond_2
    if-ne v2, v1, :cond_4

    .line 4
    check-cast p0, Ljava/util/List;

    .line 5
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_3

    .line 6
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 8
    invoke-static {p0}, Lkotlin/collections/CollectionsKt__CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 9
    :cond_3
    new-instance p0, Ljava/util/NoSuchElementException;

    const-string p1, "List is empty."

    invoke-direct {p0, p1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 10
    :cond_4
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 11
    instance-of v2, p0, Ljava/util/RandomAccess;

    if-eqz v2, :cond_5

    .line 12
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    :goto_0
    if-ge p1, v0, :cond_6

    .line 13
    move-object v2, p0

    check-cast v2, Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 14
    :cond_5
    check-cast p0, Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    .line 15
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_6
    return-object v1

    .line 16
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Requested element count "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " is less than zero."

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final first(Ljava/util/List;)Ljava/lang/Object;
    .locals 1
    .param p0    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "$this$first"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 3
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    const-string v0, "List is empty."

    invoke-direct {p0, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final reversed(Ljava/lang/Iterable;)Ljava/util/List;
    .locals 2
    .param p0    # Ljava/lang/Iterable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "$this$reversed"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt___CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 2
    :cond_0
    invoke-static {p0}, Lkotlin/collections/CollectionsKt___CollectionsKt;->toMutableList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    .line 3
    invoke-static {p0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    return-object p0
.end method

.method public static final toCollection(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 1
    .param p0    # Ljava/lang/Iterable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/Collection;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "C::",
            "Ljava/util/Collection<",
            "-TT;>;>(",
            "Ljava/lang/Iterable<",
            "+TT;>;TC;)TC;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method public static final toList(Ljava/lang/Iterable;)Ljava/util/List;
    .locals 3
    .param p0    # Ljava/lang/Iterable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "$this$toList"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_3

    .line 2
    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    if-eqz v1, :cond_2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 3
    invoke-static {v0}, Lkotlin/collections/CollectionsKt___CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p0

    goto :goto_1

    .line 4
    :cond_0
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_1

    check-cast p0, Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    goto :goto_0

    :cond_1
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    :goto_0
    invoke-static {p0}, Lkotlin/collections/CollectionsKt__CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    goto :goto_1

    .line 5
    :cond_2
    sget-object p0, Lkotlin/collections/EmptyList;->INSTANCE:Lkotlin/collections/EmptyList;

    :goto_1
    return-object p0

    .line 6
    :cond_3
    invoke-static {p0}, Lkotlin/collections/CollectionsKt___CollectionsKt;->toMutableList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt__CollectionsKt;->optimizeReadOnlyList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static final toMutableList(Ljava/lang/Iterable;)Ljava/util/List;
    .locals 1
    .param p0    # Ljava/lang/Iterable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_0

    .line 2
    check-cast p0, Ljava/util/Collection;

    invoke-static {p0}, Lkotlin/collections/CollectionsKt___CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 3
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0, v0}, Lkotlin/collections/CollectionsKt___CollectionsKt;->toCollection(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/Collection;

    return-object v0
.end method

.method public static final toMutableList(Ljava/util/Collection;)Ljava/util/List;
    .locals 1
    .param p0    # Ljava/util/Collection;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "$this$toMutableList"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
