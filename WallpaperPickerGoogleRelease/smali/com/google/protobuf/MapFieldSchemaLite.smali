.class public Lcom/google/protobuf/MapFieldSchemaLite;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/MapFieldSchema;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public forMapData(Ljava/lang/Object;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map<",
            "**>;"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/protobuf/MapFieldLite;

    return-object p1
.end method

.method public forMapMetadata(Ljava/lang/Object;)Lcom/google/protobuf/MapEntryLite$Metadata;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/protobuf/MapEntryLite$Metadata<",
            "**>;"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/protobuf/MapEntryLite;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    return-object p0
.end method

.method public forMutableMapData(Ljava/lang/Object;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map<",
            "**>;"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/protobuf/MapFieldLite;

    return-object p1
.end method

.method public getSerializedSize(ILjava/lang/Object;Ljava/lang/Object;)I
    .locals 3

    .line 1
    check-cast p2, Lcom/google/protobuf/MapFieldLite;

    .line 2
    check-cast p3, Lcom/google/protobuf/MapEntryLite;

    .line 3
    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    goto :goto_1

    .line 4
    :cond_0
    invoke-virtual {p2}, Lcom/google/protobuf/MapFieldLite;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    .line 5
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-static {p1}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v2

    .line 7
    invoke-static {v1, p2}, Lcom/google/protobuf/MapEntryLite;->computeSerializedSize(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p2

    .line 8
    invoke-static {p2}, Lcom/google/protobuf/CodedOutputStream;->computeLengthDelimitedFieldSize(I)I

    move-result p2

    add-int/2addr p2, v2

    add-int/2addr v0, p2

    goto :goto_0

    :cond_1
    :goto_1
    return v0
.end method

.method public isImmutable(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/google/protobuf/MapFieldLite;

    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite;->isMutable()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public mergeFrom(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/protobuf/MapFieldLite;

    .line 2
    check-cast p2, Lcom/google/protobuf/MapFieldLite;

    .line 3
    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2

    .line 4
    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite;->isMutable()Z

    move-result p0

    if-nez p0, :cond_1

    .line 5
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    new-instance p0, Lcom/google/protobuf/MapFieldLite;

    invoke-direct {p0}, Lcom/google/protobuf/MapFieldLite;-><init>()V

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/google/protobuf/MapFieldLite;

    invoke-direct {p0, p1}, Lcom/google/protobuf/MapFieldLite;-><init>(Ljava/util/Map;)V

    :goto_0
    move-object p1, p0

    .line 6
    :cond_1
    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite;->ensureMutable()V

    .line 7
    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2

    .line 8
    invoke-virtual {p1, p2}, Lcom/google/protobuf/MapFieldLite;->putAll(Ljava/util/Map;)V

    :cond_2
    return-object p1
.end method

.method public newMapField(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    sget-object p0, Lcom/google/protobuf/MapFieldLite;->EMPTY_MAP_FIELD:Lcom/google/protobuf/MapFieldLite;

    .line 2
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p0, Lcom/google/protobuf/MapFieldLite;

    invoke-direct {p0}, Lcom/google/protobuf/MapFieldLite;-><init>()V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/google/protobuf/MapFieldLite;

    invoke-direct {p1, p0}, Lcom/google/protobuf/MapFieldLite;-><init>(Ljava/util/Map;)V

    move-object p0, p1

    :goto_0
    return-object p0
.end method

.method public toImmutable(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    move-object p0, p1

    check-cast p0, Lcom/google/protobuf/MapFieldLite;

    invoke-virtual {p0}, Lcom/google/protobuf/MapFieldLite;->makeImmutable()V

    return-object p1
.end method
