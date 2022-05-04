.class public Lcom/google/common/collect/ImmutableSortedMap$Builder;
.super Lcom/google/common/collect/ImmutableMap$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableSortedMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableMap$Builder<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field public final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "-TK;>;"
        }
    .end annotation
.end field

.field public transient keys:[Ljava/lang/Object;

.field public transient values:[Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/util/Comparator;)V
    .locals 1
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
            "-TK;>;)V"
        }
    .end annotation

    const/4 v0, 0x4

    .line 1
    invoke-direct {p0, v0}, Lcom/google/common/collect/ImmutableMap$Builder;-><init>(I)V

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->comparator:Ljava/util/Comparator;

    new-array p1, v0, [Ljava/lang/Object;

    .line 4
    iput-object p1, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->keys:[Ljava/lang/Object;

    new-array p1, v0, [Ljava/lang/Object;

    .line 5
    iput-object p1, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->values:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public build()Lcom/google/common/collect/ImmutableMap;
    .locals 8

    .line 1
    iget v0, p0, Lcom/google/common/collect/ImmutableMap$Builder;->size:I

    if-eqz v0, :cond_4

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3

    .line 2
    iget-object v2, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->keys:[Ljava/lang/Object;

    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    .line 3
    iget-object v2, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->comparator:Ljava/util/Comparator;

    invoke-static {v0, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 4
    iget v2, p0, Lcom/google/common/collect/ImmutableMap$Builder;->size:I

    new-array v3, v2, [Ljava/lang/Object;

    .line 5
    :goto_0
    iget v4, p0, Lcom/google/common/collect/ImmutableMap$Builder;->size:I

    if-ge v1, v4, :cond_2

    if-lez v1, :cond_1

    .line 6
    iget-object v4, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->comparator:Ljava/util/Comparator;

    add-int/lit8 v5, v1, -0x1

    aget-object v6, v0, v5

    aget-object v7, v0, v1

    invoke-interface {v4, v6, v7}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1

    .line 7
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    aget-object v2, v0, v5

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aget-object v0, v0, v1

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x39

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v1

    const-string v1, "keys required to be distinct but compared as equal: "

    const-string v4, " and "

    invoke-static {v3, v1, v2, v4, v0}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 8
    :cond_1
    :goto_1
    iget-object v4, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->keys:[Ljava/lang/Object;

    aget-object v4, v4, v1

    iget-object v5, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->comparator:Ljava/util/Comparator;

    invoke-static {v0, v4, v5}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v4

    .line 9
    iget-object v5, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->values:[Ljava/lang/Object;

    aget-object v5, v5, v1

    aput-object v5, v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 10
    :cond_2
    new-instance v1, Lcom/google/common/collect/ImmutableSortedMap;

    new-instance v4, Lcom/google/common/collect/RegularImmutableSortedSet;

    .line 11
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->asImmutableList([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iget-object p0, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->comparator:Ljava/util/Comparator;

    invoke-direct {v4, v0, p0}, Lcom/google/common/collect/RegularImmutableSortedSet;-><init>(Lcom/google/common/collect/ImmutableList;Ljava/util/Comparator;)V

    .line 12
    invoke-static {v3, v2}, Lcom/google/common/collect/ImmutableList;->asImmutableList([Ljava/lang/Object;I)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    .line 13
    invoke-direct {v1, v4, p0}, Lcom/google/common/collect/ImmutableSortedMap;-><init>(Lcom/google/common/collect/RegularImmutableSortedSet;Lcom/google/common/collect/ImmutableList;)V

    goto :goto_2

    .line 14
    :cond_3
    iget-object v0, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->comparator:Ljava/util/Comparator;

    iget-object v2, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->keys:[Ljava/lang/Object;

    aget-object v2, v2, v1

    iget-object p0, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->values:[Ljava/lang/Object;

    aget-object p0, p0, v1

    .line 15
    new-instance v1, Lcom/google/common/collect/ImmutableSortedMap;

    new-instance v3, Lcom/google/common/collect/RegularImmutableSortedSet;

    .line 16
    invoke-static {v2}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    .line 17
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    invoke-direct {v3, v2, v0}, Lcom/google/common/collect/RegularImmutableSortedSet;-><init>(Lcom/google/common/collect/ImmutableList;Ljava/util/Comparator;)V

    .line 19
    invoke-static {p0}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    invoke-direct {v1, v3, p0}, Lcom/google/common/collect/ImmutableSortedMap;-><init>(Lcom/google/common/collect/RegularImmutableSortedSet;Lcom/google/common/collect/ImmutableList;)V

    goto :goto_2

    .line 20
    :cond_4
    iget-object p0, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->comparator:Ljava/util/Comparator;

    invoke-static {p0}, Lcom/google/common/collect/ImmutableSortedMap;->emptyMap(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSortedMap;

    move-result-object v1

    :goto_2
    return-object v1
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .line 2
    iget v0, p0, Lcom/google/common/collect/ImmutableMap$Builder;->size:I

    add-int/lit8 v0, v0, 0x1

    .line 3
    iget-object v1, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->keys:[Ljava/lang/Object;

    array-length v2, v1

    if-le v0, v2, :cond_0

    .line 4
    array-length v1, v1

    invoke-static {v1, v0}, Lcom/google/common/collect/ImmutableCollection$Builder;->expandedCapacity(II)I

    move-result v0

    .line 5
    iget-object v1, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->keys:[Ljava/lang/Object;

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->keys:[Ljava/lang/Object;

    .line 6
    iget-object v1, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->values:[Ljava/lang/Object;

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->values:[Ljava/lang/Object;

    .line 7
    :cond_0
    invoke-static {p1, p2}, Lcom/google/common/collect/CollectPreconditions;->checkEntryNotNull(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    iget-object v0, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->keys:[Ljava/lang/Object;

    iget v1, p0, Lcom/google/common/collect/ImmutableMap$Builder;->size:I

    aput-object p1, v0, v1

    .line 9
    iget-object p1, p0, Lcom/google/common/collect/ImmutableSortedMap$Builder;->values:[Ljava/lang/Object;

    aput-object p2, p1, v1

    add-int/lit8 v1, v1, 0x1

    .line 10
    iput v1, p0, Lcom/google/common/collect/ImmutableMap$Builder;->size:I

    return-object p0
.end method

.method public put(Ljava/util/Map$Entry;)Lcom/google/common/collect/ImmutableMap$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "entry"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/common/collect/ImmutableSortedMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    return-object p0
.end method

.method public putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMap$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "entries"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableMap$Builder;->putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMap$Builder;

    return-object p0
.end method
