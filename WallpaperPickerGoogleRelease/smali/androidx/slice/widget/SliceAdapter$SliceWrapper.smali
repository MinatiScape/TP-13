.class public Landroidx/slice/widget/SliceAdapter$SliceWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/widget/SliceAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SliceWrapper"
.end annotation


# instance fields
.field public final mId:J

.field public final mItem:Landroidx/slice/widget/SliceContent;

.field public final mType:I


# direct methods
.method public constructor <init>(Landroidx/slice/widget/SliceContent;Landroidx/slice/widget/SliceAdapter$IdGenerator;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "item",
            "idGen",
            "mode"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Landroidx/slice/widget/SliceAdapter$SliceWrapper;->mItem:Landroidx/slice/widget/SliceContent;

    .line 3
    iget-object v0, p1, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 4
    iget-object v1, v0, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const-string v2, "message"

    .line 5
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    const-string v2, "source"

    .line 6
    invoke-static {v0, v1, v2}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x5

    goto :goto_0

    .line 7
    :cond_1
    iget-object v1, v0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v2, "horizontal"

    invoke-static {v1, v2}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x3

    goto :goto_0

    .line 8
    :cond_2
    iget-object v0, v0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v1, "list_item"

    invoke-static {v0, v1}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x2

    goto :goto_0

    :cond_3
    const/4 v0, 0x1

    .line 9
    :goto_0
    iput v0, p0, Landroidx/slice/widget/SliceAdapter$SliceWrapper;->mType:I

    .line 10
    iget-object p1, p1, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 11
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    iget-object v0, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v1, "slice"

    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 14
    iget-object v0, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v1, "action"

    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_1

    .line 16
    :cond_4
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .line 17
    :cond_5
    :goto_1
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    .line 18
    :goto_2
    iget-object v0, p2, Landroidx/slice/widget/SliceAdapter$IdGenerator;->mCurrentIds:Landroidx/collection/ArrayMap;

    invoke-virtual {v0, p1}, Landroidx/collection/SimpleArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 19
    iget-object v0, p2, Landroidx/slice/widget/SliceAdapter$IdGenerator;->mCurrentIds:Landroidx/collection/ArrayMap;

    iget-wide v1, p2, Landroidx/slice/widget/SliceAdapter$IdGenerator;->mNextLong:J

    const-wide/16 v3, 0x1

    add-long/2addr v3, v1

    iput-wide v3, p2, Landroidx/slice/widget/SliceAdapter$IdGenerator;->mNextLong:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    :cond_6
    iget-object v0, p2, Landroidx/slice/widget/SliceAdapter$IdGenerator;->mCurrentIds:Landroidx/collection/ArrayMap;

    invoke-virtual {v0, p1}, Landroidx/collection/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 21
    iget-object v2, p2, Landroidx/slice/widget/SliceAdapter$IdGenerator;->mUsedIds:Landroidx/collection/ArrayMap;

    invoke-virtual {v2, p1}, Landroidx/collection/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_7

    .line 22
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_3

    :cond_7
    const/4 v2, 0x0

    .line 23
    :goto_3
    iget-object p2, p2, Landroidx/slice/widget/SliceAdapter$IdGenerator;->mUsedIds:Landroidx/collection/ArrayMap;

    add-int/lit8 v3, v2, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p2, p1, v3}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    mul-int/lit16 v2, v2, 0x2710

    int-to-long p1, v2

    add-long/2addr v0, p1

    .line 24
    iput-wide v0, p0, Landroidx/slice/widget/SliceAdapter$SliceWrapper;->mId:J

    return-void
.end method
