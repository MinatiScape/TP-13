.class public final Lcom/google/common/collect/MapMaker;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public concurrencyLevel:I

.field public initialCapacity:I

.field public keyEquivalence:Lcom/google/common/base/Equivalence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Equivalence<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public keyStrength:Lcom/google/common/collect/MapMakerInternalMap$Strength;

.field public useCustomMap:Z

.field public valueStrength:Lcom/google/common/collect/MapMakerInternalMap$Strength;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/google/common/collect/MapMaker;->initialCapacity:I

    .line 3
    iput v0, p0, Lcom/google/common/collect/MapMaker;->concurrencyLevel:I

    return-void
.end method


# virtual methods
.method public getKeyStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/MapMaker;->keyStrength:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    sget-object v0, Lcom/google/common/collect/MapMakerInternalMap$Strength;->STRONG:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    invoke-static {p0, v0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/MapMakerInternalMap$Strength;

    return-object p0
.end method

.method public getValueStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/MapMaker;->valueStrength:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    sget-object v0, Lcom/google/common/collect/MapMakerInternalMap$Strength;->STRONG:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    invoke-static {p0, v0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/MapMakerInternalMap$Strength;

    return-object p0
.end method

.method public makeMap()Ljava/util/concurrent/ConcurrentMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/util/concurrent/ConcurrentMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/common/collect/MapMaker;->useCustomMap:Z

    if-nez v0, :cond_2

    .line 2
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 3
    iget v1, p0, Lcom/google/common/collect/MapMaker;->initialCapacity:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    const/16 v1, 0x10

    :cond_0
    const/high16 v3, 0x3f400000    # 0.75f

    .line 4
    iget p0, p0, Lcom/google/common/collect/MapMaker;->concurrencyLevel:I

    if-ne p0, v2, :cond_1

    const/4 p0, 0x4

    .line 5
    :cond_1
    invoke-direct {v0, v1, v3, p0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    return-object v0

    .line 6
    :cond_2
    sget-object v0, Lcom/google/common/collect/MapMakerInternalMap;->UNSET_WEAK_VALUE_REFERENCE:Lcom/google/common/collect/MapMakerInternalMap$WeakValueReference;

    .line 7
    sget-object v0, Lcom/google/common/collect/MapMakerInternalMap$Strength;->WEAK:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    invoke-virtual {p0}, Lcom/google/common/collect/MapMaker;->getKeyStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;

    move-result-object v1

    sget-object v2, Lcom/google/common/collect/MapMakerInternalMap$Strength;->STRONG:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    if-ne v1, v2, :cond_3

    .line 8
    invoke-virtual {p0}, Lcom/google/common/collect/MapMaker;->getValueStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;

    move-result-object v1

    if-ne v1, v2, :cond_3

    .line 9
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap;

    sget-object v1, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry$Helper;->INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$StrongKeyStrongValueEntry$Helper;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/MapMakerInternalMap;-><init>(Lcom/google/common/collect/MapMaker;Lcom/google/common/collect/MapMakerInternalMap$InternalEntryHelper;)V

    goto :goto_0

    .line 10
    :cond_3
    invoke-virtual {p0}, Lcom/google/common/collect/MapMaker;->getKeyStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;

    move-result-object v1

    if-ne v1, v2, :cond_4

    .line 11
    invoke-virtual {p0}, Lcom/google/common/collect/MapMaker;->getValueStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;

    move-result-object v1

    if-ne v1, v0, :cond_4

    .line 12
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap;

    sget-object v1, Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;->INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$StrongKeyWeakValueEntry$Helper;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/MapMakerInternalMap;-><init>(Lcom/google/common/collect/MapMaker;Lcom/google/common/collect/MapMakerInternalMap$InternalEntryHelper;)V

    goto :goto_0

    .line 13
    :cond_4
    invoke-virtual {p0}, Lcom/google/common/collect/MapMaker;->getKeyStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;

    move-result-object v1

    if-ne v1, v0, :cond_5

    .line 14
    invoke-virtual {p0}, Lcom/google/common/collect/MapMaker;->getValueStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;

    move-result-object v1

    if-ne v1, v2, :cond_5

    .line 15
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap;

    sget-object v1, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry$Helper;->INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyStrongValueEntry$Helper;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/MapMakerInternalMap;-><init>(Lcom/google/common/collect/MapMaker;Lcom/google/common/collect/MapMakerInternalMap$InternalEntryHelper;)V

    goto :goto_0

    .line 16
    :cond_5
    invoke-virtual {p0}, Lcom/google/common/collect/MapMaker;->getKeyStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;

    move-result-object v1

    if-ne v1, v0, :cond_6

    invoke-virtual {p0}, Lcom/google/common/collect/MapMaker;->getValueStrength()Lcom/google/common/collect/MapMakerInternalMap$Strength;

    move-result-object v1

    if-ne v1, v0, :cond_6

    .line 17
    new-instance v0, Lcom/google/common/collect/MapMakerInternalMap;

    sget-object v1, Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;->INSTANCE:Lcom/google/common/collect/MapMakerInternalMap$WeakKeyWeakValueEntry$Helper;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/MapMakerInternalMap;-><init>(Lcom/google/common/collect/MapMaker;Lcom/google/common/collect/MapMakerInternalMap$InternalEntryHelper;)V

    :goto_0
    return-object v0

    .line 18
    :cond_6
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0
.end method

.method public setKeyStrength(Lcom/google/common/collect/MapMakerInternalMap$Strength;)Lcom/google/common/collect/MapMaker;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "strength"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/MapMaker;->keyStrength:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const-string v3, "Key strength was already set to %s"

    invoke-static {v2, v3, v0}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/common/collect/MapMaker;->keyStrength:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    .line 4
    sget-object v0, Lcom/google/common/collect/MapMakerInternalMap$Strength;->STRONG:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    if-eq p1, v0, :cond_1

    .line 5
    iput-boolean v1, p0, Lcom/google/common/collect/MapMaker;->useCustomMap:Z

    :cond_1
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Lcom/google/common/base/MoreObjects$ToStringHelper;

    const-string v1, "MapMaker"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper;-><init>(Ljava/lang/String;Lcom/google/common/base/MoreObjects$1;)V

    .line 2
    iget v1, p0, Lcom/google/common/collect/MapMaker;->initialCapacity:I

    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    const-string v4, "initialCapacity"

    .line 3
    invoke-virtual {v0, v4, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 4
    :cond_0
    iget v1, p0, Lcom/google/common/collect/MapMaker;->concurrencyLevel:I

    if-eq v1, v3, :cond_1

    const-string v3, "concurrencyLevel"

    .line 5
    invoke-virtual {v0, v3, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;I)Lcom/google/common/base/MoreObjects$ToStringHelper;

    .line 6
    :cond_1
    iget-object v1, p0, Lcom/google/common/collect/MapMaker;->keyStrength:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    if-eqz v1, :cond_2

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 8
    new-instance v3, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    invoke-direct {v3, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;-><init>(Lcom/google/common/base/MoreObjects$1;)V

    .line 9
    iget-object v4, v0, Lcom/google/common/base/MoreObjects$ToStringHelper;->holderTail:Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    iput-object v3, v4, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;->next:Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    iput-object v3, v0, Lcom/google/common/base/MoreObjects$ToStringHelper;->holderTail:Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    .line 10
    iput-object v1, v3, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;->value:Ljava/lang/Object;

    const-string v1, "keyStrength"

    .line 11
    iput-object v1, v3, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;->name:Ljava/lang/String;

    .line 12
    :cond_2
    iget-object v1, p0, Lcom/google/common/collect/MapMaker;->valueStrength:Lcom/google/common/collect/MapMakerInternalMap$Strength;

    if-eqz v1, :cond_3

    .line 13
    invoke-virtual {v1}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 14
    new-instance v3, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    invoke-direct {v3, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;-><init>(Lcom/google/common/base/MoreObjects$1;)V

    .line 15
    iget-object v4, v0, Lcom/google/common/base/MoreObjects$ToStringHelper;->holderTail:Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    iput-object v3, v4, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;->next:Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    iput-object v3, v0, Lcom/google/common/base/MoreObjects$ToStringHelper;->holderTail:Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    .line 16
    iput-object v1, v3, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;->value:Ljava/lang/Object;

    const-string v1, "valueStrength"

    .line 17
    iput-object v1, v3, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;->name:Ljava/lang/String;

    .line 18
    :cond_3
    iget-object p0, p0, Lcom/google/common/collect/MapMaker;->keyEquivalence:Lcom/google/common/base/Equivalence;

    if-eqz p0, :cond_4

    .line 19
    new-instance p0, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    invoke-direct {p0, v2}, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;-><init>(Lcom/google/common/base/MoreObjects$1;)V

    .line 20
    iget-object v1, v0, Lcom/google/common/base/MoreObjects$ToStringHelper;->holderTail:Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    iput-object p0, v1, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;->next:Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    iput-object p0, v0, Lcom/google/common/base/MoreObjects$ToStringHelper;->holderTail:Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;

    const-string v1, "keyEquivalence"

    .line 21
    iput-object v1, p0, Lcom/google/common/base/MoreObjects$ToStringHelper$ValueHolder;->value:Ljava/lang/Object;

    .line 22
    :cond_4
    invoke-virtual {v0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
