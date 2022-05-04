.class public Lcom/google/protobuf/UnknownFieldSetLiteSchema;
.super Lcom/google/protobuf/UnknownFieldSchema;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/UnknownFieldSchema<",
        "Lcom/google/protobuf/UnknownFieldSetLite;",
        "Lcom/google/protobuf/UnknownFieldSetLite;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/UnknownFieldSchema;-><init>()V

    return-void
.end method


# virtual methods
.method public addVarint(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/protobuf/UnknownFieldSetLite;

    shl-int/lit8 p0, p2, 0x3

    or-int/lit8 p0, p0, 0x0

    .line 2
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p1, p0, p2}, Lcom/google/protobuf/UnknownFieldSetLite;->storeField(ILjava/lang/Object;)V

    return-void
.end method

.method public getFromMessage(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/protobuf/GeneratedMessageLite;

    iget-object p0, p1, Lcom/google/protobuf/GeneratedMessageLite;->unknownFields:Lcom/google/protobuf/UnknownFieldSetLite;

    return-object p0
.end method

.method public getSerializedSize(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/google/protobuf/UnknownFieldSetLite;

    .line 2
    invoke-virtual {p1}, Lcom/google/protobuf/UnknownFieldSetLite;->getSerializedSize()I

    move-result p0

    return p0
.end method

.method public getSerializedSizeAsMessageSet(Ljava/lang/Object;)I
    .locals 6

    .line 1
    check-cast p1, Lcom/google/protobuf/UnknownFieldSetLite;

    .line 2
    iget p0, p1, Lcom/google/protobuf/UnknownFieldSetLite;->memoizedSerializedSize:I

    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    move v0, p0

    .line 3
    :goto_0
    iget v1, p1, Lcom/google/protobuf/UnknownFieldSetLite;->count:I

    if-ge p0, v1, :cond_1

    .line 4
    iget-object v1, p1, Lcom/google/protobuf/UnknownFieldSetLite;->tags:[I

    aget v1, v1, p0

    const/4 v2, 0x3

    ushr-int/2addr v1, v2

    .line 5
    iget-object v3, p1, Lcom/google/protobuf/UnknownFieldSetLite;->objects:[Ljava/lang/Object;

    aget-object v3, v3, p0

    check-cast v3, Lcom/google/protobuf/ByteString;

    const/4 v4, 0x1

    .line 6
    invoke-static {v4}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v4

    const/4 v5, 0x2

    mul-int/2addr v4, v5

    .line 7
    invoke-static {v5, v1}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32Size(II)I

    move-result v1

    add-int/2addr v1, v4

    .line 8
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v2

    add-int/2addr v2, v1

    add-int/2addr v0, v2

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    .line 9
    :cond_1
    iput v0, p1, Lcom/google/protobuf/UnknownFieldSetLite;->memoizedSerializedSize:I

    move p0, v0

    :goto_1
    return p0
.end method

.method public makeImmutable(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/protobuf/GeneratedMessageLite;

    iget-object p0, p1, Lcom/google/protobuf/GeneratedMessageLite;->unknownFields:Lcom/google/protobuf/UnknownFieldSetLite;

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/google/protobuf/UnknownFieldSetLite;->isMutable:Z

    return-void
.end method

.method public merge(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    check-cast p1, Lcom/google/protobuf/UnknownFieldSetLite;

    check-cast p2, Lcom/google/protobuf/UnknownFieldSetLite;

    .line 2
    sget-object p0, Lcom/google/protobuf/UnknownFieldSetLite;->DEFAULT_INSTANCE:Lcom/google/protobuf/UnknownFieldSetLite;

    invoke-virtual {p2, p0}, Lcom/google/protobuf/UnknownFieldSetLite;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget p0, p1, Lcom/google/protobuf/UnknownFieldSetLite;->count:I

    iget v0, p2, Lcom/google/protobuf/UnknownFieldSetLite;->count:I

    add-int/2addr p0, v0

    .line 4
    iget-object v0, p1, Lcom/google/protobuf/UnknownFieldSetLite;->tags:[I

    invoke-static {v0, p0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    .line 5
    iget-object v1, p2, Lcom/google/protobuf/UnknownFieldSetLite;->tags:[I

    iget v2, p1, Lcom/google/protobuf/UnknownFieldSetLite;->count:I

    iget v3, p2, Lcom/google/protobuf/UnknownFieldSetLite;->count:I

    const/4 v4, 0x0

    invoke-static {v1, v4, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 6
    iget-object v1, p1, Lcom/google/protobuf/UnknownFieldSetLite;->objects:[Ljava/lang/Object;

    invoke-static {v1, p0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    .line 7
    iget-object v2, p2, Lcom/google/protobuf/UnknownFieldSetLite;->objects:[Ljava/lang/Object;

    iget p1, p1, Lcom/google/protobuf/UnknownFieldSetLite;->count:I

    iget p2, p2, Lcom/google/protobuf/UnknownFieldSetLite;->count:I

    invoke-static {v2, v4, v1, p1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 8
    new-instance p1, Lcom/google/protobuf/UnknownFieldSetLite;

    const/4 p2, 0x1

    invoke-direct {p1, p0, v0, v1, p2}, Lcom/google/protobuf/UnknownFieldSetLite;-><init>(I[I[Ljava/lang/Object;Z)V

    :goto_0
    return-object p1
.end method

.method public newBuilder()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSetLite;->newInstance()Lcom/google/protobuf/UnknownFieldSetLite;

    move-result-object p0

    return-object p0
.end method

.method public setToMessage(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/google/protobuf/UnknownFieldSetLite;

    .line 2
    check-cast p1, Lcom/google/protobuf/GeneratedMessageLite;

    iput-object p2, p1, Lcom/google/protobuf/GeneratedMessageLite;->unknownFields:Lcom/google/protobuf/UnknownFieldSetLite;

    return-void
.end method

.method public writeAsMessageSetTo(Ljava/lang/Object;Lcom/google/protobuf/Writer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/protobuf/UnknownFieldSetLite;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    .line 4
    :goto_0
    iget v0, p1, Lcom/google/protobuf/UnknownFieldSetLite;->count:I

    if-ge p0, v0, :cond_0

    .line 5
    iget-object v0, p1, Lcom/google/protobuf/UnknownFieldSetLite;->tags:[I

    aget v0, v0, p0

    ushr-int/lit8 v0, v0, 0x3

    .line 6
    iget-object v1, p1, Lcom/google/protobuf/UnknownFieldSetLite;->objects:[Ljava/lang/Object;

    aget-object v1, v1, p0

    move-object v2, p2

    check-cast v2, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v2, v0, v1}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeMessageSetItem(ILjava/lang/Object;)V

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public writeTo(Ljava/lang/Object;Lcom/google/protobuf/Writer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/protobuf/UnknownFieldSetLite;

    .line 2
    invoke-virtual {p1, p2}, Lcom/google/protobuf/UnknownFieldSetLite;->writeTo(Lcom/google/protobuf/Writer;)V

    return-void
.end method
