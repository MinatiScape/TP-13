.class public final Lcom/google/protobuf/CodedInputStream$ArrayDecoder;
.super Lcom/google/protobuf/CodedInputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/CodedInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ArrayDecoder"
.end annotation


# instance fields
.field public final buffer:[B

.field public bufferSizeAfterLimit:I

.field public currentLimit:I

.field public final immutable:Z

.field public limit:I

.field public pos:I

.field public startPos:I


# direct methods
.method public constructor <init>([BIIZLcom/google/protobuf/CodedInputStream$1;)V
    .locals 0

    const/4 p5, 0x0

    .line 1
    invoke-direct {p0, p5}, Lcom/google/protobuf/CodedInputStream;-><init>(Lcom/google/protobuf/CodedInputStream$1;)V

    const p5, 0x7fffffff

    .line 2
    iput p5, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->currentLimit:I

    .line 3
    iput-object p1, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->buffer:[B

    add-int/2addr p3, p2

    .line 4
    iput p3, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->limit:I

    .line 5
    iput p2, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->pos:I

    .line 6
    iput p2, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->startPos:I

    .line 7
    iput-boolean p4, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->immutable:Z

    return-void
.end method


# virtual methods
.method public getTotalBytesRead()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->pos:I

    iget p0, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->startPos:I

    sub-int/2addr v0, p0

    return v0
.end method

.method public pushLimit(I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    if-ltz p1, :cond_1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->getTotalBytesRead()I

    move-result v0

    add-int/2addr v0, p1

    .line 2
    iget p1, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->currentLimit:I

    if-gt v0, p1, :cond_0

    .line 3
    iput v0, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->currentLimit:I

    .line 4
    invoke-virtual {p0}, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->recomputeBufferSizeAfterLimit()V

    return p1

    .line 5
    :cond_0
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->truncatedMessage()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0

    .line 6
    :cond_1
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->negativeSize()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0
.end method

.method public final recomputeBufferSizeAfterLimit()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->limit:I

    iget v1, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->bufferSizeAfterLimit:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->limit:I

    .line 2
    iget v1, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->startPos:I

    sub-int v1, v0, v1

    .line 3
    iget v2, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->currentLimit:I

    if-le v1, v2, :cond_0

    sub-int/2addr v1, v2

    .line 4
    iput v1, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->bufferSizeAfterLimit:I

    sub-int/2addr v0, v1

    .line 5
    iput v0, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->limit:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/google/protobuf/CodedInputStream$ArrayDecoder;->bufferSizeAfterLimit:I

    :goto_0
    return-void
.end method
