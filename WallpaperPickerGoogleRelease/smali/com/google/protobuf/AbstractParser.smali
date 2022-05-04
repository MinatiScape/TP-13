.class public abstract Lcom/google/protobuf/AbstractParser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/Parser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType::",
        "Lcom/google/protobuf/MessageLite;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/protobuf/Parser<",
        "TMessageType;>;"
    }
.end annotation


# static fields
.field public static final EMPTY_REGISTRY:Lcom/google/protobuf/ExtensionRegistryLite;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/ExtensionRegistryLite;->getEmptyRegistry()Lcom/google/protobuf/ExtensionRegistryLite;

    move-result-object v0

    sput-object v0, Lcom/google/protobuf/AbstractParser;->EMPTY_REGISTRY:Lcom/google/protobuf/ExtensionRegistryLite;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final checkMessageInitialized(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/MessageLite;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)TMessageType;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/google/protobuf/MessageLiteOrBuilder;->isInitialized()Z

    move-result p0

    if-nez p0, :cond_1

    .line 2
    instance-of p0, p1, Lcom/google/protobuf/AbstractMessageLite;

    if-eqz p0, :cond_0

    .line 3
    move-object p0, p1

    check-cast p0, Lcom/google/protobuf/AbstractMessageLite;

    .line 4
    new-instance p0, Lcom/google/protobuf/UninitializedMessageException;

    invoke-direct {p0}, Lcom/google/protobuf/UninitializedMessageException;-><init>()V

    goto :goto_0

    .line 5
    :cond_0
    new-instance p0, Lcom/google/protobuf/UninitializedMessageException;

    invoke-direct {p0}, Lcom/google/protobuf/UninitializedMessageException;-><init>()V

    .line 6
    :goto_0
    new-instance v0, Lcom/google/protobuf/InvalidProtocolBufferException;

    invoke-virtual {p0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 7
    invoke-virtual {v0, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    throw v0

    :cond_1
    return-object p1
.end method

.method public parseFrom([B)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/protobuf/AbstractParser;->EMPTY_REGISTRY:Lcom/google/protobuf/ExtensionRegistryLite;

    .line 2
    array-length v1, p1

    .line 3
    move-object v2, p0

    check-cast v2, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    .line 4
    iget-object v2, v2, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;->defaultInstance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    sget-object v3, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->NEW_MUTABLE_INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;

    const/4 v4, 0x0

    .line 6
    invoke-virtual {v2, v3, v4, v4}, Lcom/google/protobuf/GeneratedMessageLite;->dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 7
    check-cast v2, Lcom/google/protobuf/GeneratedMessageLite;

    .line 8
    :try_start_0
    sget-object v3, Lcom/google/protobuf/Protobuf;->INSTANCE:Lcom/google/protobuf/Protobuf;

    .line 9
    invoke-virtual {v3, v2}, Lcom/google/protobuf/Protobuf;->schemaFor(Ljava/lang/Object;)Lcom/google/protobuf/Schema;

    move-result-object v9

    add-int/lit8 v7, v1, 0x0

    .line 10
    new-instance v8, Lcom/google/protobuf/ArrayDecoders$Registers;

    invoke-direct {v8, v0}, Lcom/google/protobuf/ArrayDecoders$Registers;-><init>(Lcom/google/protobuf/ExtensionRegistryLite;)V

    const/4 v6, 0x0

    move-object v3, v9

    move-object v4, v2

    move-object v5, p1

    invoke-interface/range {v3 .. v8}, Lcom/google/protobuf/Schema;->mergeFrom(Ljava/lang/Object;[BIILcom/google/protobuf/ArrayDecoders$Registers;)V

    .line 11
    invoke-interface {v9, v2}, Lcom/google/protobuf/Schema;->makeImmutable(Ljava/lang/Object;)V

    .line 12
    iget p1, v2, Lcom/google/protobuf/AbstractMessageLite;->memoizedHashCode:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p1, :cond_0

    .line 13
    invoke-virtual {p0, v2}, Lcom/google/protobuf/AbstractParser;->checkMessageInitialized(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/MessageLite;

    return-object v2

    .line 14
    :cond_0
    :try_start_1
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    throw p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    .line 15
    :catch_0
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->truncatedMessage()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    invoke-virtual {p0, v2}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    throw p0

    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    instance-of p1, p1, Lcom/google/protobuf/InvalidProtocolBufferException;

    if-eqz p1, :cond_1

    .line 17
    invoke-virtual {p0}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/InvalidProtocolBufferException;

    throw p0

    .line 18
    :cond_1
    new-instance p1, Lcom/google/protobuf/InvalidProtocolBufferException;

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/MessageLite;)Lcom/google/protobuf/InvalidProtocolBufferException;

    throw p1
.end method
