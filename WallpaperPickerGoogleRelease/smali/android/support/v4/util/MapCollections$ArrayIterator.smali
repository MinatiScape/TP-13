.class public final Landroid/support/v4/util/MapCollections$ArrayIterator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/util/MapCollections;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ArrayIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public mCanRemove:Z

.field public mIndex:I

.field public final mOffset:I

.field public mSize:I

.field public final synthetic this$0:Landroid/support/v4/util/MapCollections;


# direct methods
.method public constructor <init>(Landroid/support/v4/util/MapCollections;I)V
    .locals 1

    .line 1
    iput-object p1, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->this$0:Landroid/support/v4/util/MapCollections;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mCanRemove:Z

    .line 3
    iput p2, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mOffset:I

    .line 4
    check-cast p1, Landroid/support/v4/util/ArrayMap$1;

    .line 5
    iget-object p1, p1, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    iget p1, p1, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    .line 6
    iput p1, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mSize:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 1
    iget v0, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mIndex:I

    iget p0, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mSize:I

    if-ge v0, p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public next()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/support/v4/util/MapCollections$ArrayIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->this$0:Landroid/support/v4/util/MapCollections;

    iget v1, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mIndex:I

    iget v2, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mOffset:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/util/MapCollections;->colGetEntry(II)Ljava/lang/Object;

    move-result-object v0

    .line 3
    iget v1, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mIndex:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mIndex:I

    .line 4
    iput-boolean v2, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mCanRemove:Z

    return-object v0

    .line 5
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public remove()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mCanRemove:Z

    if-eqz v0, :cond_0

    .line 2
    iget v0, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mIndex:I

    .line 3
    iget v1, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mSize:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mSize:I

    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->mCanRemove:Z

    .line 5
    iget-object p0, p0, Landroid/support/v4/util/MapCollections$ArrayIterator;->this$0:Landroid/support/v4/util/MapCollections;

    check-cast p0, Landroid/support/v4/util/ArrayMap$1;

    .line 6
    iget-object p0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {p0, v0}, Landroid/support/v4/util/SimpleArrayMap;->removeAt(I)Ljava/lang/Object;

    return-void

    .line 7
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    throw p0
.end method
