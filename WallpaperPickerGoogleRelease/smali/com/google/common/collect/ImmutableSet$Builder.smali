.class public Lcom/google/common/collect/ImmutableSet$Builder;
.super Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder<",
        "TE;>;"
    }
.end annotation


# instance fields
.field public hashCode:I

.field public hashTable:[Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x4

    .line 1
    invoke-direct {p0, v0}, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;-><init>(I)V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Lcom/google/common/collect/ImmutableSet$Builder<",
            "TE;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v0, p0, Lcom/google/common/collect/ImmutableSet$Builder;->hashTable:[Ljava/lang/Object;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->size:I

    invoke-static {v0}, Lcom/google/common/collect/ImmutableSet;->chooseTableSize(I)I

    move-result v0

    iget-object v1, p0, Lcom/google/common/collect/ImmutableSet$Builder;->hashTable:[Ljava/lang/Object;

    array-length v2, v1

    if-gt v0, v2, :cond_2

    .line 3
    array-length v0, v1

    add-int/lit8 v0, v0, -0x1

    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    .line 5
    invoke-static {v1}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v2

    :goto_0
    and-int/2addr v2, v0

    .line 6
    iget-object v3, p0, Lcom/google/common/collect/ImmutableSet$Builder;->hashTable:[Ljava/lang/Object;

    aget-object v4, v3, v2

    if-nez v4, :cond_0

    .line 7
    aput-object p1, v3, v2

    .line 8
    iget v0, p0, Lcom/google/common/collect/ImmutableSet$Builder;->hashCode:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/common/collect/ImmutableSet$Builder;->hashCode:I

    .line 9
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;

    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    :goto_1
    return-object p0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/google/common/collect/ImmutableSet$Builder;->hashTable:[Ljava/lang/Object;

    .line 12
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableCollection$ArrayBasedBuilder;

    return-object p0
.end method
