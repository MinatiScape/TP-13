.class public final Lcom/google/common/collect/ImmutableSortedSet$Builder;
.super Lcom/google/common/collect/ImmutableSet$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableSortedSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableSet$Builder<",
        "TE;>;"
    }
.end annotation


# instance fields
.field public final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "-TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Comparator;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "comparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableSet$Builder;-><init>()V

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/common/collect/ImmutableSortedSet$Builder;->comparator:Ljava/util/Comparator;

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "element"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    return-object p0
.end method

.method public build()Lcom/google/common/collect/ImmutableSortedSet;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSortedSet<",
            "TE;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->contents:[Ljava/lang/Object;

    .line 2
    iget-object v1, p0, Lcom/google/common/collect/ImmutableSortedSet$Builder;->comparator:Ljava/util/Comparator;

    iget v2, p0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->size:I

    sget v3, Lcom/google/common/collect/ImmutableSortedSet;->$r8$clinit:I

    const/4 v3, 0x1

    if-nez v2, :cond_0

    .line 3
    invoke-static {v1}, Lcom/google/common/collect/ImmutableSortedSet;->emptySet(Ljava/util/Comparator;)Lcom/google/common/collect/RegularImmutableSortedSet;

    move-result-object v0

    goto :goto_2

    :cond_0
    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v2, :cond_1

    .line 4
    aget-object v6, v0, v5

    invoke-static {v6, v5}, Lcom/google/common/collect/ObjectArrays;->checkElementNotNull(Ljava/lang/Object;I)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 5
    :cond_1
    invoke-static {v0, v4, v2, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    move v4, v3

    move v5, v4

    :goto_1
    if-ge v4, v2, :cond_3

    .line 6
    aget-object v6, v0, v4

    add-int/lit8 v7, v5, -0x1

    .line 7
    aget-object v7, v0, v7

    .line 8
    invoke-interface {v1, v6, v7}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v7

    if-eqz v7, :cond_2

    add-int/lit8 v7, v5, 0x1

    .line 9
    aput-object v6, v0, v5

    move v5, v7

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_3
    const/4 v4, 0x0

    .line 10
    invoke-static {v0, v5, v2, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 11
    array-length v2, v0

    div-int/lit8 v2, v2, 0x2

    if-ge v5, v2, :cond_4

    .line 12
    invoke-static {v0, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    .line 13
    :cond_4
    new-instance v2, Lcom/google/common/collect/RegularImmutableSortedSet;

    .line 14
    invoke-static {v0, v5}, Lcom/google/common/collect/ImmutableList;->asImmutableList([Ljava/lang/Object;I)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Lcom/google/common/collect/RegularImmutableSortedSet;-><init>(Lcom/google/common/collect/ImmutableList;Ljava/util/Comparator;)V

    move-object v0, v2

    .line 15
    :goto_2
    invoke-virtual {v0}, Lcom/google/common/collect/RegularImmutableSortedSet;->size()I

    move-result v1

    iput v1, p0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->size:I

    .line 16
    iput-boolean v3, p0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->forceCopy:Z

    return-object v0
.end method
