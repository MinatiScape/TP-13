.class public final Lcom/google/protobuf/Protobuf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final INSTANCE:Lcom/google/protobuf/Protobuf;


# instance fields
.field public final schemaCache:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/google/protobuf/Schema<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final schemaFactory:Lcom/google/protobuf/SchemaFactory;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/protobuf/Protobuf;

    invoke-direct {v0}, Lcom/google/protobuf/Protobuf;-><init>()V

    sput-object v0, Lcom/google/protobuf/Protobuf;->INSTANCE:Lcom/google/protobuf/Protobuf;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/protobuf/Protobuf;->schemaCache:Ljava/util/concurrent/ConcurrentMap;

    .line 3
    new-instance v0, Lcom/google/protobuf/ManifestSchemaFactory;

    invoke-direct {v0}, Lcom/google/protobuf/ManifestSchemaFactory;-><init>()V

    iput-object v0, p0, Lcom/google/protobuf/Protobuf;->schemaFactory:Lcom/google/protobuf/SchemaFactory;

    return-void
.end method


# virtual methods
.method public schemaFor(Ljava/lang/Class;)Lcom/google/protobuf/Schema;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/google/protobuf/Schema<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/protobuf/Internal;->UTF_8:Ljava/nio/charset/Charset;

    const-string v0, "messageType"

    .line 2
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3
    iget-object v0, p0, Lcom/google/protobuf/Protobuf;->schemaCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Schema;

    if-nez v0, :cond_b

    .line 4
    iget-object v0, p0, Lcom/google/protobuf/Protobuf;->schemaFactory:Lcom/google/protobuf/SchemaFactory;

    check-cast v0, Lcom/google/protobuf/ManifestSchemaFactory;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    const-class v1, Lcom/google/protobuf/GeneratedMessageLite;

    sget-object v2, Lcom/google/protobuf/SchemaUtil;->GENERATED_MESSAGE_CLASS:Ljava/lang/Class;

    .line 6
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_1

    sget-object v2, Lcom/google/protobuf/SchemaUtil;->GENERATED_MESSAGE_CLASS:Ljava/lang/Class;

    if-eqz v2, :cond_1

    .line 7
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Message classes must extend GeneratedMessage or GeneratedMessageLite"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 9
    :cond_1
    :goto_0
    iget-object v0, v0, Lcom/google/protobuf/ManifestSchemaFactory;->messageInfoFactory:Lcom/google/protobuf/MessageInfoFactory;

    invoke-interface {v0, p1}, Lcom/google/protobuf/MessageInfoFactory;->messageInfoFor(Ljava/lang/Class;)Lcom/google/protobuf/MessageInfo;

    move-result-object v2

    .line 10
    invoke-interface {v2}, Lcom/google/protobuf/MessageInfo;->isMessageSetWireFormat()Z

    move-result v0

    const-string v3, "Protobuf runtime is not correctly loaded."

    if-eqz v0, :cond_4

    .line 11
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 12
    sget-object v0, Lcom/google/protobuf/SchemaUtil;->UNKNOWN_FIELD_SET_LITE_SCHEMA:Lcom/google/protobuf/UnknownFieldSchema;

    .line 13
    sget-object v1, Lcom/google/protobuf/ExtensionSchemas;->LITE_SCHEMA:Lcom/google/protobuf/ExtensionSchema;

    sget-object v1, Lcom/google/protobuf/ExtensionSchemas;->LITE_SCHEMA:Lcom/google/protobuf/ExtensionSchema;

    .line 14
    invoke-interface {v2}, Lcom/google/protobuf/MessageInfo;->getDefaultInstance()Lcom/google/protobuf/MessageLite;

    move-result-object v2

    .line 15
    new-instance v3, Lcom/google/protobuf/MessageSetSchema;

    invoke-direct {v3, v0, v1, v2}, Lcom/google/protobuf/MessageSetSchema;-><init>(Lcom/google/protobuf/UnknownFieldSchema;Lcom/google/protobuf/ExtensionSchema;Lcom/google/protobuf/MessageLite;)V

    goto :goto_1

    .line 16
    :cond_2
    sget-object v0, Lcom/google/protobuf/SchemaUtil;->PROTO2_UNKNOWN_FIELD_SET_SCHEMA:Lcom/google/protobuf/UnknownFieldSchema;

    .line 17
    sget-object v1, Lcom/google/protobuf/ExtensionSchemas;->FULL_SCHEMA:Lcom/google/protobuf/ExtensionSchema;

    if-eqz v1, :cond_3

    .line 18
    invoke-interface {v2}, Lcom/google/protobuf/MessageInfo;->getDefaultInstance()Lcom/google/protobuf/MessageLite;

    move-result-object v2

    .line 19
    new-instance v3, Lcom/google/protobuf/MessageSetSchema;

    invoke-direct {v3, v0, v1, v2}, Lcom/google/protobuf/MessageSetSchema;-><init>(Lcom/google/protobuf/UnknownFieldSchema;Lcom/google/protobuf/ExtensionSchema;Lcom/google/protobuf/MessageLite;)V

    :goto_1
    move-object v0, v3

    goto :goto_2

    .line 20
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 21
    :cond_4
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v4, 0x1

    if-eqz v0, :cond_7

    .line 22
    invoke-interface {v2}, Lcom/google/protobuf/MessageInfo;->getSyntax$enumunboxing$()I

    move-result v0

    if-ne v0, v4, :cond_5

    move v1, v4

    :cond_5
    if-eqz v1, :cond_6

    .line 23
    sget-object v3, Lcom/google/protobuf/NewInstanceSchemas;->LITE_SCHEMA:Lcom/google/protobuf/NewInstanceSchema;

    .line 24
    sget-object v4, Lcom/google/protobuf/ListFieldSchema;->LITE_INSTANCE:Lcom/google/protobuf/ListFieldSchema;

    .line 25
    sget-object v5, Lcom/google/protobuf/SchemaUtil;->UNKNOWN_FIELD_SET_LITE_SCHEMA:Lcom/google/protobuf/UnknownFieldSchema;

    .line 26
    sget-object v0, Lcom/google/protobuf/ExtensionSchemas;->LITE_SCHEMA:Lcom/google/protobuf/ExtensionSchema;

    sget-object v6, Lcom/google/protobuf/ExtensionSchemas;->LITE_SCHEMA:Lcom/google/protobuf/ExtensionSchema;

    .line 27
    sget-object v7, Lcom/google/protobuf/MapFieldSchemas;->LITE_SCHEMA:Lcom/google/protobuf/MapFieldSchema;

    .line 28
    invoke-static/range {v2 .. v7}, Lcom/google/protobuf/MessageSchema;->newSchema(Lcom/google/protobuf/MessageInfo;Lcom/google/protobuf/NewInstanceSchema;Lcom/google/protobuf/ListFieldSchema;Lcom/google/protobuf/UnknownFieldSchema;Lcom/google/protobuf/ExtensionSchema;Lcom/google/protobuf/MapFieldSchema;)Lcom/google/protobuf/MessageSchema;

    move-result-object v0

    goto :goto_2

    .line 29
    :cond_6
    sget-object v3, Lcom/google/protobuf/NewInstanceSchemas;->LITE_SCHEMA:Lcom/google/protobuf/NewInstanceSchema;

    .line 30
    sget-object v4, Lcom/google/protobuf/ListFieldSchema;->LITE_INSTANCE:Lcom/google/protobuf/ListFieldSchema;

    .line 31
    sget-object v5, Lcom/google/protobuf/SchemaUtil;->UNKNOWN_FIELD_SET_LITE_SCHEMA:Lcom/google/protobuf/UnknownFieldSchema;

    const/4 v6, 0x0

    .line 32
    sget-object v7, Lcom/google/protobuf/MapFieldSchemas;->LITE_SCHEMA:Lcom/google/protobuf/MapFieldSchema;

    .line 33
    invoke-static/range {v2 .. v7}, Lcom/google/protobuf/MessageSchema;->newSchema(Lcom/google/protobuf/MessageInfo;Lcom/google/protobuf/NewInstanceSchema;Lcom/google/protobuf/ListFieldSchema;Lcom/google/protobuf/UnknownFieldSchema;Lcom/google/protobuf/ExtensionSchema;Lcom/google/protobuf/MapFieldSchema;)Lcom/google/protobuf/MessageSchema;

    move-result-object v0

    goto :goto_2

    .line 34
    :cond_7
    invoke-interface {v2}, Lcom/google/protobuf/MessageInfo;->getSyntax$enumunboxing$()I

    move-result v0

    if-ne v0, v4, :cond_8

    move v1, v4

    :cond_8
    if-eqz v1, :cond_a

    .line 35
    sget-object v0, Lcom/google/protobuf/NewInstanceSchemas;->FULL_SCHEMA:Lcom/google/protobuf/NewInstanceSchema;

    .line 36
    sget-object v4, Lcom/google/protobuf/ListFieldSchema;->FULL_INSTANCE:Lcom/google/protobuf/ListFieldSchema;

    .line 37
    sget-object v5, Lcom/google/protobuf/SchemaUtil;->PROTO2_UNKNOWN_FIELD_SET_SCHEMA:Lcom/google/protobuf/UnknownFieldSchema;

    .line 38
    sget-object v6, Lcom/google/protobuf/ExtensionSchemas;->FULL_SCHEMA:Lcom/google/protobuf/ExtensionSchema;

    if-eqz v6, :cond_9

    .line 39
    sget-object v7, Lcom/google/protobuf/MapFieldSchemas;->FULL_SCHEMA:Lcom/google/protobuf/MapFieldSchema;

    move-object v3, v0

    .line 40
    invoke-static/range {v2 .. v7}, Lcom/google/protobuf/MessageSchema;->newSchema(Lcom/google/protobuf/MessageInfo;Lcom/google/protobuf/NewInstanceSchema;Lcom/google/protobuf/ListFieldSchema;Lcom/google/protobuf/UnknownFieldSchema;Lcom/google/protobuf/ExtensionSchema;Lcom/google/protobuf/MapFieldSchema;)Lcom/google/protobuf/MessageSchema;

    move-result-object v0

    goto :goto_2

    .line 41
    :cond_9
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 42
    :cond_a
    sget-object v3, Lcom/google/protobuf/NewInstanceSchemas;->FULL_SCHEMA:Lcom/google/protobuf/NewInstanceSchema;

    .line 43
    sget-object v4, Lcom/google/protobuf/ListFieldSchema;->FULL_INSTANCE:Lcom/google/protobuf/ListFieldSchema;

    .line 44
    sget-object v5, Lcom/google/protobuf/SchemaUtil;->PROTO3_UNKNOWN_FIELD_SET_SCHEMA:Lcom/google/protobuf/UnknownFieldSchema;

    const/4 v6, 0x0

    .line 45
    sget-object v7, Lcom/google/protobuf/MapFieldSchemas;->FULL_SCHEMA:Lcom/google/protobuf/MapFieldSchema;

    .line 46
    invoke-static/range {v2 .. v7}, Lcom/google/protobuf/MessageSchema;->newSchema(Lcom/google/protobuf/MessageInfo;Lcom/google/protobuf/NewInstanceSchema;Lcom/google/protobuf/ListFieldSchema;Lcom/google/protobuf/UnknownFieldSchema;Lcom/google/protobuf/ExtensionSchema;Lcom/google/protobuf/MapFieldSchema;)Lcom/google/protobuf/MessageSchema;

    move-result-object v0

    .line 47
    :goto_2
    iget-object p0, p0, Lcom/google/protobuf/Protobuf;->schemaCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p0, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/Schema;

    if-eqz p0, :cond_b

    move-object v0, p0

    :cond_b
    return-object v0
.end method

.method public schemaFor(Ljava/lang/Object;)Lcom/google/protobuf/Schema;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lcom/google/protobuf/Schema<",
            "TT;>;"
        }
    .end annotation

    .line 48
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/protobuf/Protobuf;->schemaFor(Ljava/lang/Class;)Lcom/google/protobuf/Schema;

    move-result-object p0

    return-object p0
.end method
