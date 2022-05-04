.class public Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound$1;
.super Lcom/google/common/collect/AbstractIterator;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->entryIterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/AbstractIterator<",
        "Ljava/util/Map$Entry<",
        "Lcom/google/common/collect/Cut<",
        "TC;>;",
        "Lcom/google/common/collect/Range<",
        "TC;>;>;>;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;

.field public final synthetic val$backingItr:Ljava/util/Iterator;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;Ljava/util/Iterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$backingItr"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound$1;->this$0:Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;

    iput-object p2, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound$1;->val$backingItr:Ljava/util/Iterator;

    invoke-direct {p0}, Lcom/google/common/collect/AbstractIterator;-><init>()V

    return-void
.end method


# virtual methods
.method public computeNext()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound$1;->val$backingItr:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractIterator;->endOfData()Ljava/lang/Object;

    goto :goto_0

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound$1;->val$backingItr:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Range;

    .line 4
    iget-object v2, p0, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound$1;->this$0:Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;

    .line 5
    iget-object v2, v2, Lcom/google/common/collect/TreeRangeSet$RangesByUpperBound;->upperBoundWindow:Lcom/google/common/collect/Range;

    .line 6
    iget-object v2, v2, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    iget-object v3, v0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v2, v3}, Lcom/google/common/collect/Cut;->isLessThan(Ljava/lang/Comparable;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 7
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractIterator;->endOfData()Ljava/lang/Object;

    goto :goto_0

    .line 8
    :cond_1
    iget-object p0, v0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    .line 9
    new-instance v1, Lcom/google/common/collect/ImmutableEntry;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/ImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return-object v1
.end method
