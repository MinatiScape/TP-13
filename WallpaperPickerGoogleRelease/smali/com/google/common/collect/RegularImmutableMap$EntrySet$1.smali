.class public Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;
.super Lcom/google/common/collect/ImmutableList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/RegularImmutableMap$EntrySet;->createAsList()Lcom/google/common/collect/ImmutableList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ImmutableList<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/RegularImmutableMap$EntrySet;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    invoke-direct {p0}, Lcom/google/common/collect/ImmutableList;-><init>()V

    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "index"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    .line 2
    iget v0, v0, Lcom/google/common/collect/RegularImmutableMap$EntrySet;->size:I

    .line 3
    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkElementIndex(II)I

    .line 4
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    .line 5
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet;->alternatingKeysAndValues:[Ljava/lang/Object;

    mul-int/lit8 p1, p1, 0x2

    .line 6
    iget p0, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet;->keyOffset:I

    add-int v1, p1, p0

    .line 7
    aget-object v1, v0, v1

    xor-int/lit8 p0, p0, 0x1

    add-int/2addr p1, p0

    .line 8
    aget-object p0, v0, p1

    .line 9
    new-instance p1, Ljava/util/AbstractMap$SimpleImmutableEntry;

    invoke-direct {p1, v1, p0}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1
.end method

.method public isPartialView()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet$1;->this$0:Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    .line 2
    iget p0, p0, Lcom/google/common/collect/RegularImmutableMap$EntrySet;->size:I

    return p0
.end method
