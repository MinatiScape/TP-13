.class public final Lcom/google/protobuf/MessageSchema;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/Schema;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/protobuf/Schema<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final EMPTY_INT_ARRAY:[I

.field public static final UNSAFE:Lsun/misc/Unsafe;


# instance fields
.field public final buffer:[I

.field public final checkInitializedCount:I

.field public final defaultInstance:Lcom/google/protobuf/MessageLite;

.field public final extensionSchema:Lcom/google/protobuf/ExtensionSchema;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/ExtensionSchema<",
            "*>;"
        }
    .end annotation
.end field

.field public final hasExtensions:Z

.field public final intArray:[I

.field public final listFieldSchema:Lcom/google/protobuf/ListFieldSchema;

.field public final lite:Z

.field public final mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

.field public final maxFieldNumber:I

.field public final minFieldNumber:I

.field public final newInstanceSchema:Lcom/google/protobuf/NewInstanceSchema;

.field public final objects:[Ljava/lang/Object;

.field public final proto3:Z

.field public final repeatedFieldOffsetStart:I

.field public final unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/UnknownFieldSchema<",
            "**>;"
        }
    .end annotation
.end field

.field public final useCachedSizeField:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [I

    .line 1
    sput-object v0, Lcom/google/protobuf/MessageSchema;->EMPTY_INT_ARRAY:[I

    .line 2
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->logger:Ljava/util/logging/Logger;

    .line 3
    :try_start_0
    new-instance v0, Lcom/google/protobuf/UnsafeUtil$1;

    invoke-direct {v0}, Lcom/google/protobuf/UnsafeUtil$1;-><init>()V

    .line 4
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsun/misc/Unsafe;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    const/4 v0, 0x0

    .line 5
    :goto_0
    sput-object v0, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    return-void
.end method

.method public constructor <init>([I[Ljava/lang/Object;IILcom/google/protobuf/MessageLite;ZZ[IIILcom/google/protobuf/NewInstanceSchema;Lcom/google/protobuf/ListFieldSchema;Lcom/google/protobuf/UnknownFieldSchema;Lcom/google/protobuf/ExtensionSchema;Lcom/google/protobuf/MapFieldSchema;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I[",
            "Ljava/lang/Object;",
            "II",
            "Lcom/google/protobuf/MessageLite;",
            "ZZ[III",
            "Lcom/google/protobuf/NewInstanceSchema;",
            "Lcom/google/protobuf/ListFieldSchema;",
            "Lcom/google/protobuf/UnknownFieldSchema<",
            "**>;",
            "Lcom/google/protobuf/ExtensionSchema<",
            "*>;",
            "Lcom/google/protobuf/MapFieldSchema;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    .line 3
    iput-object p2, p0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    .line 4
    iput p3, p0, Lcom/google/protobuf/MessageSchema;->minFieldNumber:I

    .line 5
    iput p4, p0, Lcom/google/protobuf/MessageSchema;->maxFieldNumber:I

    .line 6
    instance-of p1, p5, Lcom/google/protobuf/GeneratedMessageLite;

    iput-boolean p1, p0, Lcom/google/protobuf/MessageSchema;->lite:Z

    .line 7
    iput-boolean p6, p0, Lcom/google/protobuf/MessageSchema;->proto3:Z

    if-eqz p14, :cond_0

    .line 8
    invoke-virtual {p14, p5}, Lcom/google/protobuf/ExtensionSchema;->hasExtensions(Lcom/google/protobuf/MessageLite;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/google/protobuf/MessageSchema;->hasExtensions:Z

    .line 9
    iput-boolean p7, p0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    .line 10
    iput-object p8, p0, Lcom/google/protobuf/MessageSchema;->intArray:[I

    .line 11
    iput p9, p0, Lcom/google/protobuf/MessageSchema;->checkInitializedCount:I

    .line 12
    iput p10, p0, Lcom/google/protobuf/MessageSchema;->repeatedFieldOffsetStart:I

    .line 13
    iput-object p11, p0, Lcom/google/protobuf/MessageSchema;->newInstanceSchema:Lcom/google/protobuf/NewInstanceSchema;

    .line 14
    iput-object p12, p0, Lcom/google/protobuf/MessageSchema;->listFieldSchema:Lcom/google/protobuf/ListFieldSchema;

    .line 15
    iput-object p13, p0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    .line 16
    iput-object p14, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    .line 17
    iput-object p5, p0, Lcom/google/protobuf/MessageSchema;->defaultInstance:Lcom/google/protobuf/MessageLite;

    .line 18
    iput-object p15, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    return-void
.end method

.method public static getMutableUnknownFields(Ljava/lang/Object;)Lcom/google/protobuf/UnknownFieldSetLite;
    .locals 2

    .line 1
    check-cast p0, Lcom/google/protobuf/GeneratedMessageLite;

    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->unknownFields:Lcom/google/protobuf/UnknownFieldSetLite;

    .line 2
    sget-object v1, Lcom/google/protobuf/UnknownFieldSetLite;->DEFAULT_INSTANCE:Lcom/google/protobuf/UnknownFieldSetLite;

    if-ne v0, v1, :cond_0

    .line 3
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSetLite;->newInstance()Lcom/google/protobuf/UnknownFieldSetLite;

    move-result-object v0

    .line 4
    iput-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->unknownFields:Lcom/google/protobuf/UnknownFieldSetLite;

    :cond_0
    return-object v0
.end method

.method public static listAt(Ljava/lang/Object;J)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "J)",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public static newSchema(Lcom/google/protobuf/MessageInfo;Lcom/google/protobuf/NewInstanceSchema;Lcom/google/protobuf/ListFieldSchema;Lcom/google/protobuf/UnknownFieldSchema;Lcom/google/protobuf/ExtensionSchema;Lcom/google/protobuf/MapFieldSchema;)Lcom/google/protobuf/MessageSchema;
    .locals 36
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/google/protobuf/MessageInfo;",
            "Lcom/google/protobuf/NewInstanceSchema;",
            "Lcom/google/protobuf/ListFieldSchema;",
            "Lcom/google/protobuf/UnknownFieldSchema<",
            "**>;",
            "Lcom/google/protobuf/ExtensionSchema<",
            "*>;",
            "Lcom/google/protobuf/MapFieldSchema;",
            ")",
            "Lcom/google/protobuf/MessageSchema<",
            "TT;>;"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 1
    instance-of v1, v0, Lcom/google/protobuf/RawMessageInfo;

    if-eqz v1, :cond_35

    .line 2
    check-cast v0, Lcom/google/protobuf/RawMessageInfo;

    .line 3
    iget v1, v0, Lcom/google/protobuf/RawMessageInfo;->flags:I

    const/4 v2, 0x1

    and-int/2addr v1, v2

    const/4 v3, 0x2

    if-ne v1, v2, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    const/4 v4, 0x0

    if-ne v1, v3, :cond_1

    move v11, v2

    goto :goto_1

    :cond_1
    move v11, v4

    .line 4
    :goto_1
    iget-object v1, v0, Lcom/google/protobuf/RawMessageInfo;->info:Ljava/lang/String;

    .line 5
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    .line 6
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const v7, 0xd800

    if-lt v6, v7, :cond_3

    and-int/lit16 v6, v6, 0x1fff

    move v9, v2

    const/16 v10, 0xd

    :goto_2
    add-int/lit8 v12, v9, 0x1

    .line 7
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v7, :cond_2

    and-int/lit16 v9, v9, 0x1fff

    shl-int/2addr v9, v10

    or-int/2addr v6, v9

    add-int/lit8 v10, v10, 0xd

    move v9, v12

    goto :goto_2

    :cond_2
    shl-int/2addr v9, v10

    or-int/2addr v6, v9

    goto :goto_3

    :cond_3
    move v12, v2

    :goto_3
    add-int/lit8 v9, v12, 0x1

    .line 8
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-lt v10, v7, :cond_5

    and-int/lit16 v10, v10, 0x1fff

    const/16 v12, 0xd

    :goto_4
    add-int/lit8 v13, v9, 0x1

    .line 9
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v7, :cond_4

    and-int/lit16 v9, v9, 0x1fff

    shl-int/2addr v9, v12

    or-int/2addr v10, v9

    add-int/lit8 v12, v12, 0xd

    move v9, v13

    goto :goto_4

    :cond_4
    shl-int/2addr v9, v12

    or-int/2addr v10, v9

    move v9, v13

    :cond_5
    if-nez v10, :cond_6

    .line 10
    sget-object v10, Lcom/google/protobuf/MessageSchema;->EMPTY_INT_ARRAY:[I

    move v2, v4

    move v8, v2

    move v12, v8

    move v13, v12

    move v15, v13

    move-object v14, v10

    move v10, v15

    goto/16 :goto_f

    :cond_6
    add-int/lit8 v10, v9, 0x1

    .line 11
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v7, :cond_8

    and-int/lit16 v9, v9, 0x1fff

    const/16 v12, 0xd

    :goto_5
    add-int/lit8 v13, v10, 0x1

    .line 12
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-lt v10, v7, :cond_7

    and-int/lit16 v10, v10, 0x1fff

    shl-int/2addr v10, v12

    or-int/2addr v9, v10

    add-int/lit8 v12, v12, 0xd

    move v10, v13

    goto :goto_5

    :cond_7
    shl-int/2addr v10, v12

    or-int/2addr v9, v10

    move v10, v13

    :cond_8
    add-int/lit8 v12, v10, 0x1

    .line 13
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-lt v10, v7, :cond_a

    and-int/lit16 v10, v10, 0x1fff

    const/16 v13, 0xd

    :goto_6
    add-int/lit8 v14, v12, 0x1

    .line 14
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-lt v12, v7, :cond_9

    and-int/lit16 v12, v12, 0x1fff

    shl-int/2addr v12, v13

    or-int/2addr v10, v12

    add-int/lit8 v13, v13, 0xd

    move v12, v14

    goto :goto_6

    :cond_9
    shl-int/2addr v12, v13

    or-int/2addr v10, v12

    move v12, v14

    :cond_a
    add-int/lit8 v13, v12, 0x1

    .line 15
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-lt v12, v7, :cond_c

    and-int/lit16 v12, v12, 0x1fff

    const/16 v14, 0xd

    :goto_7
    add-int/lit8 v15, v13, 0x1

    .line 16
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-lt v13, v7, :cond_b

    and-int/lit16 v13, v13, 0x1fff

    shl-int/2addr v13, v14

    or-int/2addr v12, v13

    add-int/lit8 v14, v14, 0xd

    move v13, v15

    goto :goto_7

    :cond_b
    shl-int/2addr v13, v14

    or-int/2addr v12, v13

    move v13, v15

    :cond_c
    add-int/lit8 v14, v13, 0x1

    .line 17
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-lt v13, v7, :cond_e

    and-int/lit16 v13, v13, 0x1fff

    const/16 v15, 0xd

    :goto_8
    add-int/lit8 v16, v14, 0x1

    .line 18
    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-lt v14, v7, :cond_d

    and-int/lit16 v14, v14, 0x1fff

    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    add-int/lit8 v15, v15, 0xd

    move/from16 v14, v16

    goto :goto_8

    :cond_d
    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    move/from16 v14, v16

    :cond_e
    add-int/lit8 v15, v14, 0x1

    .line 19
    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-lt v14, v7, :cond_10

    and-int/lit16 v14, v14, 0x1fff

    const/16 v16, 0xd

    :goto_9
    add-int/lit8 v17, v15, 0x1

    .line 20
    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    if-lt v15, v7, :cond_f

    and-int/lit16 v15, v15, 0x1fff

    shl-int v15, v15, v16

    or-int/2addr v14, v15

    add-int/lit8 v16, v16, 0xd

    move/from16 v15, v17

    goto :goto_9

    :cond_f
    shl-int v15, v15, v16

    or-int/2addr v14, v15

    move/from16 v15, v17

    :cond_10
    add-int/lit8 v16, v15, 0x1

    .line 21
    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    if-lt v15, v7, :cond_12

    and-int/lit16 v15, v15, 0x1fff

    move/from16 v4, v16

    const/16 v16, 0xd

    :goto_a
    add-int/lit8 v17, v4, 0x1

    .line 22
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v7, :cond_11

    and-int/lit16 v4, v4, 0x1fff

    shl-int v4, v4, v16

    or-int/2addr v15, v4

    add-int/lit8 v16, v16, 0xd

    move/from16 v4, v17

    goto :goto_a

    :cond_11
    shl-int v4, v4, v16

    or-int/2addr v15, v4

    move/from16 v4, v17

    goto :goto_b

    :cond_12
    move/from16 v4, v16

    :goto_b
    add-int/lit8 v16, v4, 0x1

    .line 23
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v7, :cond_14

    and-int/lit16 v4, v4, 0x1fff

    move/from16 v8, v16

    const/16 v16, 0xd

    :goto_c
    add-int/lit8 v18, v8, 0x1

    .line 24
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v7, :cond_13

    and-int/lit16 v8, v8, 0x1fff

    shl-int v8, v8, v16

    or-int/2addr v4, v8

    add-int/lit8 v16, v16, 0xd

    move/from16 v8, v18

    goto :goto_c

    :cond_13
    shl-int v8, v8, v16

    or-int/2addr v4, v8

    move/from16 v8, v18

    goto :goto_d

    :cond_14
    move/from16 v8, v16

    :goto_d
    add-int/lit8 v16, v8, 0x1

    .line 25
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v7, :cond_16

    and-int/lit16 v8, v8, 0x1fff

    move/from16 v2, v16

    const/16 v16, 0xd

    :goto_e
    add-int/lit8 v19, v2, 0x1

    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-lt v2, v7, :cond_15

    and-int/lit16 v2, v2, 0x1fff

    shl-int v2, v2, v16

    or-int/2addr v8, v2

    add-int/lit8 v16, v16, 0xd

    move/from16 v2, v19

    goto :goto_e

    :cond_15
    shl-int v2, v2, v16

    or-int/2addr v8, v2

    move/from16 v16, v19

    :cond_16
    add-int v2, v8, v15

    add-int/2addr v2, v4

    .line 27
    new-array v2, v2, [I

    mul-int/lit8 v4, v9, 0x2

    add-int/2addr v4, v10

    move v10, v14

    move-object v14, v2

    move v2, v9

    move/from16 v9, v16

    move/from16 v35, v15

    move v15, v8

    move v8, v12

    move/from16 v12, v35

    .line 28
    :goto_f
    sget-object v7, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    .line 29
    iget-object v3, v0, Lcom/google/protobuf/RawMessageInfo;->objects:[Ljava/lang/Object;

    move/from16 v20, v4

    .line 30
    iget-object v4, v0, Lcom/google/protobuf/RawMessageInfo;->defaultInstance:Lcom/google/protobuf/MessageLite;

    .line 31
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    move/from16 v21, v9

    mul-int/lit8 v9, v10, 0x3

    .line 32
    new-array v9, v9, [I

    const/16 v19, 0x2

    mul-int/lit8 v10, v10, 0x2

    .line 33
    new-array v10, v10, [Ljava/lang/Object;

    add-int v22, v15, v12

    move/from16 v24, v15

    move/from16 v12, v21

    move/from16 v25, v22

    const/16 v21, 0x0

    const/16 v23, 0x0

    :goto_10
    if-ge v12, v5, :cond_34

    add-int/lit8 v26, v12, 0x1

    .line 34
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    move/from16 v27, v5

    const v5, 0xd800

    if-lt v12, v5, :cond_18

    and-int/lit16 v12, v12, 0x1fff

    move/from16 v5, v26

    const/16 v26, 0xd

    :goto_11
    add-int/lit8 v28, v5, 0x1

    .line 35
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    move/from16 v29, v15

    const v15, 0xd800

    if-lt v5, v15, :cond_17

    and-int/lit16 v5, v5, 0x1fff

    shl-int v5, v5, v26

    or-int/2addr v12, v5

    add-int/lit8 v26, v26, 0xd

    move/from16 v5, v28

    move/from16 v15, v29

    goto :goto_11

    :cond_17
    shl-int v5, v5, v26

    or-int/2addr v12, v5

    move/from16 v5, v28

    goto :goto_12

    :cond_18
    move/from16 v29, v15

    move/from16 v5, v26

    :goto_12
    add-int/lit8 v15, v5, 0x1

    .line 36
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    move/from16 v26, v15

    const v15, 0xd800

    if-lt v5, v15, :cond_1a

    and-int/lit16 v5, v5, 0x1fff

    move/from16 v15, v26

    const/16 v26, 0xd

    :goto_13
    add-int/lit8 v28, v15, 0x1

    .line 37
    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    move/from16 v30, v11

    const v11, 0xd800

    if-lt v15, v11, :cond_19

    and-int/lit16 v11, v15, 0x1fff

    shl-int v11, v11, v26

    or-int/2addr v5, v11

    add-int/lit8 v26, v26, 0xd

    move/from16 v15, v28

    move/from16 v11, v30

    goto :goto_13

    :cond_19
    shl-int v11, v15, v26

    or-int/2addr v5, v11

    move/from16 v15, v28

    goto :goto_14

    :cond_1a
    move/from16 v30, v11

    move/from16 v15, v26

    :goto_14
    and-int/lit16 v11, v5, 0xff

    move/from16 v26, v13

    and-int/lit16 v13, v5, 0x400

    if-eqz v13, :cond_1b

    add-int/lit8 v13, v21, 0x1

    .line 38
    aput v23, v14, v21

    move/from16 v21, v13

    :cond_1b
    const/16 v13, 0x33

    if-lt v11, v13, :cond_23

    add-int/lit8 v13, v15, 0x1

    .line 39
    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    move/from16 v28, v13

    const v13, 0xd800

    if-lt v15, v13, :cond_1d

    and-int/lit16 v15, v15, 0x1fff

    const/16 v33, 0xd

    move/from16 v35, v28

    move/from16 v28, v15

    move/from16 v15, v35

    :goto_15
    add-int/lit8 v34, v15, 0x1

    .line 40
    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    if-lt v15, v13, :cond_1c

    and-int/lit16 v13, v15, 0x1fff

    shl-int v13, v13, v33

    or-int v28, v28, v13

    add-int/lit8 v33, v33, 0xd

    move/from16 v15, v34

    const v13, 0xd800

    goto :goto_15

    :cond_1c
    shl-int v13, v15, v33

    or-int v15, v28, v13

    move/from16 v13, v34

    goto :goto_16

    :cond_1d
    move/from16 v13, v28

    :goto_16
    move/from16 v28, v13

    add-int/lit8 v13, v11, -0x33

    move/from16 v33, v8

    const/16 v8, 0x9

    if-eq v13, v8, :cond_20

    const/16 v8, 0x11

    if-ne v13, v8, :cond_1e

    goto :goto_17

    :cond_1e
    const/16 v8, 0xc

    if-ne v13, v8, :cond_1f

    and-int/lit8 v8, v6, 0x1

    const/4 v13, 0x1

    if-ne v8, v13, :cond_1f

    .line 41
    div-int/lit8 v8, v23, 0x3

    const/16 v18, 0x2

    mul-int/lit8 v8, v8, 0x2

    add-int/2addr v8, v13

    add-int/lit8 v13, v20, 0x1

    aget-object v20, v3, v20

    aput-object v20, v10, v8

    move/from16 v20, v13

    :cond_1f
    const/4 v13, 0x2

    goto :goto_18

    .line 42
    :cond_20
    :goto_17
    div-int/lit8 v8, v23, 0x3

    const/4 v13, 0x2

    mul-int/2addr v8, v13

    const/16 v18, 0x1

    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v19, v20, 0x1

    aget-object v20, v3, v20

    aput-object v20, v10, v8

    move/from16 v20, v19

    :goto_18
    mul-int/2addr v15, v13

    .line 43
    aget-object v8, v3, v15

    .line 44
    instance-of v13, v8, Ljava/lang/reflect/Field;

    if-eqz v13, :cond_21

    .line 45
    check-cast v8, Ljava/lang/reflect/Field;

    goto :goto_19

    .line 46
    :cond_21
    check-cast v8, Ljava/lang/String;

    invoke-static {v4, v8}, Lcom/google/protobuf/MessageSchema;->reflectField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 47
    aput-object v8, v3, v15

    :goto_19
    move-object v13, v9

    .line 48
    invoke-virtual {v7, v8}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v8

    long-to-int v8, v8

    add-int/lit8 v15, v15, 0x1

    .line 49
    aget-object v9, v3, v15

    move/from16 v31, v8

    .line 50
    instance-of v8, v9, Ljava/lang/reflect/Field;

    if-eqz v8, :cond_22

    .line 51
    check-cast v9, Ljava/lang/reflect/Field;

    goto :goto_1a

    .line 52
    :cond_22
    check-cast v9, Ljava/lang/String;

    invoke-static {v4, v9}, Lcom/google/protobuf/MessageSchema;->reflectField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    .line 53
    aput-object v9, v3, v15

    .line 54
    :goto_1a
    invoke-virtual {v7, v9}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v8

    long-to-int v8, v8

    move-object v9, v1

    move/from16 v19, v6

    move/from16 v1, v20

    move/from16 v32, v28

    const/4 v15, 0x0

    move-object/from16 v20, v0

    move v0, v8

    move/from16 v8, v31

    move/from16 v31, v5

    goto/16 :goto_25

    :cond_23
    move/from16 v33, v8

    move-object v13, v9

    add-int/lit8 v8, v20, 0x1

    .line 55
    aget-object v9, v3, v20

    check-cast v9, Ljava/lang/String;

    invoke-static {v4, v9}, Lcom/google/protobuf/MessageSchema;->reflectField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    move-object/from16 v20, v0

    const/16 v0, 0x9

    if-eq v11, v0, :cond_2b

    const/16 v0, 0x11

    if-ne v11, v0, :cond_24

    goto/16 :goto_1e

    :cond_24
    const/16 v0, 0x1b

    if-eq v11, v0, :cond_2a

    const/16 v0, 0x31

    if-ne v11, v0, :cond_25

    goto :goto_1c

    :cond_25
    const/16 v0, 0xc

    if-eq v11, v0, :cond_29

    const/16 v0, 0x1e

    if-eq v11, v0, :cond_29

    const/16 v0, 0x2c

    if-ne v11, v0, :cond_26

    goto :goto_1b

    :cond_26
    const/16 v0, 0x32

    if-ne v11, v0, :cond_28

    add-int/lit8 v0, v24, 0x1

    .line 56
    aput v23, v14, v24

    .line 57
    div-int/lit8 v24, v23, 0x3

    const/16 v19, 0x2

    mul-int/lit8 v24, v24, 0x2

    add-int/lit8 v31, v8, 0x1

    aget-object v8, v3, v8

    aput-object v8, v10, v24

    and-int/lit16 v8, v5, 0x800

    if-eqz v8, :cond_27

    add-int/lit8 v24, v24, 0x1

    add-int/lit8 v8, v31, 0x1

    .line 58
    aget-object v31, v3, v31

    aput-object v31, v10, v24

    move/from16 v31, v8

    :cond_27
    move/from16 v24, v0

    move v0, v6

    move/from16 v8, v31

    move/from16 v31, v5

    goto :goto_20

    :cond_28
    move/from16 v31, v5

    const/4 v5, 0x1

    goto :goto_1f

    :cond_29
    :goto_1b
    and-int/lit8 v0, v6, 0x1

    move/from16 v31, v5

    const/4 v5, 0x1

    if-ne v0, v5, :cond_2c

    .line 59
    div-int/lit8 v0, v23, 0x3

    const/16 v18, 0x2

    mul-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v5

    add-int/lit8 v19, v8, 0x1

    aget-object v8, v3, v8

    aput-object v8, v10, v0

    goto :goto_1d

    :cond_2a
    :goto_1c
    move/from16 v31, v5

    const/4 v5, 0x1

    const/16 v18, 0x2

    .line 60
    div-int/lit8 v0, v23, 0x3

    mul-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v5

    add-int/lit8 v19, v8, 0x1

    aget-object v8, v3, v8

    aput-object v8, v10, v0

    :goto_1d
    move/from16 v8, v19

    goto :goto_1f

    :cond_2b
    :goto_1e
    move/from16 v31, v5

    const/4 v5, 0x1

    const/16 v18, 0x2

    .line 61
    div-int/lit8 v0, v23, 0x3

    mul-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v5

    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v18

    aput-object v18, v10, v0

    :cond_2c
    :goto_1f
    move v0, v6

    .line 62
    :goto_20
    invoke-virtual {v7, v9}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v5

    long-to-int v5, v5

    and-int/lit8 v6, v0, 0x1

    const/4 v9, 0x1

    if-ne v6, v9, :cond_30

    const/16 v6, 0x11

    if-gt v11, v6, :cond_30

    add-int/lit8 v6, v15, 0x1

    .line 63
    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const v9, 0xd800

    if-lt v15, v9, :cond_2e

    and-int/lit16 v15, v15, 0x1fff

    const/16 v16, 0xd

    :goto_21
    add-int/lit8 v32, v6, 0x1

    .line 64
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v9, :cond_2d

    and-int/lit16 v6, v6, 0x1fff

    shl-int v6, v6, v16

    or-int/2addr v15, v6

    add-int/lit8 v16, v16, 0xd

    move/from16 v6, v32

    goto :goto_21

    :cond_2d
    shl-int v6, v6, v16

    or-int/2addr v15, v6

    goto :goto_22

    :cond_2e
    move/from16 v32, v6

    :goto_22
    const/4 v6, 0x2

    mul-int/lit8 v16, v2, 0x2

    .line 65
    div-int/lit8 v19, v15, 0x20

    add-int v19, v19, v16

    .line 66
    aget-object v6, v3, v19

    .line 67
    instance-of v9, v6, Ljava/lang/reflect/Field;

    if-eqz v9, :cond_2f

    .line 68
    check-cast v6, Ljava/lang/reflect/Field;

    goto :goto_23

    .line 69
    :cond_2f
    check-cast v6, Ljava/lang/String;

    invoke-static {v4, v6}, Lcom/google/protobuf/MessageSchema;->reflectField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 70
    aput-object v6, v3, v19

    :goto_23
    move/from16 v19, v0

    move-object v9, v1

    .line 71
    invoke-virtual {v7, v6}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v0

    long-to-int v0, v0

    .line 72
    rem-int/lit8 v15, v15, 0x20

    goto :goto_24

    :cond_30
    move/from16 v19, v0

    move-object v9, v1

    move/from16 v32, v15

    const/4 v0, 0x0

    const/4 v15, 0x0

    :goto_24
    const/16 v1, 0x12

    if-lt v11, v1, :cond_31

    const/16 v1, 0x31

    if-gt v11, v1, :cond_31

    add-int/lit8 v1, v25, 0x1

    .line 73
    aput v5, v14, v25

    move/from16 v25, v1

    :cond_31
    move v1, v8

    move v8, v5

    :goto_25
    add-int/lit8 v5, v23, 0x1

    .line 74
    aput v12, v13, v23

    add-int/lit8 v6, v5, 0x1

    move/from16 v23, v1

    move/from16 v12, v31

    and-int/lit16 v1, v12, 0x200

    if-eqz v1, :cond_32

    const/high16 v1, 0x20000000

    goto :goto_26

    :cond_32
    const/4 v1, 0x0

    :goto_26
    and-int/lit16 v12, v12, 0x100

    if-eqz v12, :cond_33

    const/high16 v12, 0x10000000

    goto :goto_27

    :cond_33
    const/4 v12, 0x0

    :goto_27
    or-int/2addr v1, v12

    shl-int/lit8 v11, v11, 0x14

    or-int/2addr v1, v11

    or-int/2addr v1, v8

    .line 75
    aput v1, v13, v5

    add-int/lit8 v1, v6, 0x1

    shl-int/lit8 v5, v15, 0x14

    or-int/2addr v0, v5

    .line 76
    aput v0, v13, v6

    move/from16 v6, v19

    move-object/from16 v0, v20

    move/from16 v20, v23

    move/from16 v5, v27

    move/from16 v15, v29

    move/from16 v11, v30

    move/from16 v12, v32

    move/from16 v8, v33

    move/from16 v23, v1

    move-object v1, v9

    move-object v9, v13

    move/from16 v13, v26

    goto/16 :goto_10

    :cond_34
    move-object/from16 v20, v0

    move/from16 v33, v8

    move/from16 v30, v11

    move/from16 v26, v13

    move/from16 v29, v15

    move-object v13, v9

    .line 77
    new-instance v0, Lcom/google/protobuf/MessageSchema;

    move-object/from16 v1, v20

    .line 78
    iget-object v1, v1, Lcom/google/protobuf/RawMessageInfo;->defaultInstance:Lcom/google/protobuf/MessageLite;

    const/4 v12, 0x0

    move-object v5, v0

    move-object v6, v13

    move-object v7, v10

    move/from16 v9, v26

    move-object v10, v1

    move-object v13, v14

    move/from16 v14, v29

    move/from16 v15, v22

    move-object/from16 v16, p1

    move-object/from16 v17, p2

    move-object/from16 v18, p3

    move-object/from16 v19, p4

    move-object/from16 v20, p5

    .line 79
    invoke-direct/range {v5 .. v20}, Lcom/google/protobuf/MessageSchema;-><init>([I[Ljava/lang/Object;IILcom/google/protobuf/MessageLite;ZZ[IIILcom/google/protobuf/NewInstanceSchema;Lcom/google/protobuf/ListFieldSchema;Lcom/google/protobuf/UnknownFieldSchema;Lcom/google/protobuf/ExtensionSchema;Lcom/google/protobuf/MapFieldSchema;)V

    return-object v0

    .line 80
    :cond_35
    check-cast v0, Lcom/google/protobuf/StructuralMessageInfo;

    const/4 v0, 0x0

    .line 81
    throw v0
.end method

.method public static offset(I)J
    .locals 2

    const v0, 0xfffff

    and-int/2addr p0, v0

    int-to-long v0, p0

    return-wide v0
.end method

.method public static oneofBooleanAt(Ljava/lang/Object;J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)Z"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public static oneofDoubleAt(Ljava/lang/Object;J)D
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)D"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p0

    return-wide p0
.end method

.method public static oneofFloatAt(Ljava/lang/Object;J)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)F"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0
.end method

.method public static oneofIntAt(Ljava/lang/Object;J)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)I"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method public static oneofLongAt(Ljava/lang/Object;J)J
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)J"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0
.end method

.method public static reflectField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 2
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 3
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 4
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 5
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Field "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " for "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " not found. Known fields are "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static type(I)I
    .locals 1

    const/high16 v0, 0xff00000

    and-int/2addr p0, v0

    ushr-int/lit8 p0, p0, 0x14

    return p0
.end method


# virtual methods
.method public final arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p3}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result p1

    invoke-virtual {p0, p2, p3}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result p0

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    array-length v0, v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v3, 0x1

    if-ge v2, v0, :cond_3

    .line 2
    iget-object v4, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v5, v2, 0x1

    aget v4, v4, v5

    .line 3
    invoke-static {v4}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v5

    .line 4
    invoke-static {v4}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result v4

    packed-switch v4, :pswitch_data_0

    goto/16 :goto_2

    .line 5
    :pswitch_0
    iget-object v4, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v7, v2, 0x2

    aget v4, v4, v7

    const v7, 0xfffff

    and-int/2addr v4, v7

    int-to-long v7, v4

    .line 6
    invoke-static {p1, v7, v8}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v4

    .line 7
    invoke-static {p2, v7, v8}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v7

    if-ne v4, v7, :cond_0

    move v4, v3

    goto :goto_1

    :cond_0
    move v4, v1

    :goto_1
    if-eqz v4, :cond_1

    .line 8
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 9
    invoke-static {v4, v5}, Lcom/google/protobuf/SchemaUtil;->safeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto/16 :goto_2

    .line 10
    :pswitch_1
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 11
    invoke-static {v3, v4}, Lcom/google/protobuf/SchemaUtil;->safeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    goto/16 :goto_2

    .line 12
    :pswitch_2
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 13
    invoke-static {v3, v4}, Lcom/google/protobuf/SchemaUtil;->safeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    goto/16 :goto_2

    .line 14
    :pswitch_3
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 15
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 16
    invoke-static {v4, v5}, Lcom/google/protobuf/SchemaUtil;->safeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto/16 :goto_2

    .line 17
    :pswitch_4
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 18
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v7

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    cmp-long v4, v7, v4

    if-nez v4, :cond_1

    goto/16 :goto_2

    .line 19
    :pswitch_5
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 20
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v5

    if-ne v4, v5, :cond_1

    goto/16 :goto_2

    .line 21
    :pswitch_6
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 22
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v7

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    cmp-long v4, v7, v4

    if-nez v4, :cond_1

    goto/16 :goto_2

    .line 23
    :pswitch_7
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 24
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v5

    if-ne v4, v5, :cond_1

    goto/16 :goto_2

    .line 25
    :pswitch_8
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 26
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v5

    if-ne v4, v5, :cond_1

    goto/16 :goto_2

    .line 27
    :pswitch_9
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 28
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v5

    if-ne v4, v5, :cond_1

    goto/16 :goto_2

    .line 29
    :pswitch_a
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 30
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 31
    invoke-static {v4, v5}, Lcom/google/protobuf/SchemaUtil;->safeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto/16 :goto_2

    .line 32
    :pswitch_b
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 33
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 34
    invoke-static {v4, v5}, Lcom/google/protobuf/SchemaUtil;->safeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto/16 :goto_2

    .line 35
    :pswitch_c
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 36
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 37
    invoke-static {v4, v5}, Lcom/google/protobuf/SchemaUtil;->safeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto/16 :goto_2

    .line 38
    :pswitch_d
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 39
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getBoolean(Ljava/lang/Object;J)Z

    move-result v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getBoolean(Ljava/lang/Object;J)Z

    move-result v5

    if-ne v4, v5, :cond_1

    goto/16 :goto_2

    .line 40
    :pswitch_e
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 41
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v5

    if-ne v4, v5, :cond_1

    goto/16 :goto_2

    .line 42
    :pswitch_f
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 43
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v7

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    cmp-long v4, v7, v4

    if-nez v4, :cond_1

    goto/16 :goto_2

    .line 44
    :pswitch_10
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 45
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v4

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v5

    if-ne v4, v5, :cond_1

    goto :goto_2

    .line 46
    :pswitch_11
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 47
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v7

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    cmp-long v4, v7, v4

    if-nez v4, :cond_1

    goto :goto_2

    .line 48
    :pswitch_12
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 49
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v7

    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    cmp-long v4, v7, v4

    if-nez v4, :cond_1

    goto :goto_2

    .line 50
    :pswitch_13
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 51
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getFloat(Ljava/lang/Object;J)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v4

    .line 52
    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getFloat(Ljava/lang/Object;J)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v5

    if-ne v4, v5, :cond_1

    goto :goto_2

    .line 53
    :pswitch_14
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/protobuf/MessageSchema;->arePresentForEquals(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 54
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getDouble(Ljava/lang/Object;J)D

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v7

    .line 55
    invoke-static {p2, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getDouble(Ljava/lang/Object;J)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    cmp-long v4, v7, v4

    if-nez v4, :cond_1

    goto :goto_2

    :cond_1
    move v3, v1

    :goto_2
    if-nez v3, :cond_2

    return v1

    :cond_2
    add-int/lit8 v2, v2, 0x3

    goto/16 :goto_0

    .line 56
    :cond_3
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSchema;->getFromMessage(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 57
    iget-object v2, p0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    invoke-virtual {v2, p2}, Lcom/google/protobuf/UnknownFieldSchema;->getFromMessage(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    .line 59
    :cond_4
    iget-boolean v0, p0, Lcom/google/protobuf/MessageSchema;->hasExtensions:Z

    if-eqz v0, :cond_5

    .line 60
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/ExtensionSchema;->getExtensions(Ljava/lang/Object;)Lcom/google/protobuf/FieldSet;

    move-result-object p1

    .line 61
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {p0, p2}, Lcom/google/protobuf/ExtensionSchema;->getExtensions(Ljava/lang/Object;)Lcom/google/protobuf/FieldSet;

    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Lcom/google/protobuf/FieldSet;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_5
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final filterMapUnknownEnumValues(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/UnknownFieldSchema;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "ITUB;",
            "Lcom/google/protobuf/UnknownFieldSchema<",
            "TUT;TUB;>;)TUB;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v1, v0, p2

    add-int/lit8 v1, p2, 0x1

    .line 2
    aget v0, v0, v1

    .line 3
    invoke-static {v0}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v0

    .line 4
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p3

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    div-int/lit8 p2, p2, 0x3

    mul-int/lit8 p2, p2, 0x2

    add-int/lit8 v1, p2, 0x1

    aget-object v0, v0, v1

    check-cast v0, Lcom/google/protobuf/Internal$EnumVerifier;

    if-nez v0, :cond_1

    return-object p3

    .line 6
    :cond_1
    iget-object v1, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    invoke-interface {v1, p1}, Lcom/google/protobuf/MapFieldSchema;->forMutableMapData(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    .line 7
    iget-object v1, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    .line 8
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    aget-object p0, p0, p2

    .line 9
    invoke-interface {v1, p0}, Lcom/google/protobuf/MapFieldSchema;->forMapMetadata(Ljava/lang/Object;)Lcom/google/protobuf/MapEntryLite$Metadata;

    .line 10
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    .line 12
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {v0, p2}, Lcom/google/protobuf/Internal$EnumVerifier;->isInRange(I)Z

    move-result p2

    if-nez p2, :cond_2

    if-nez p3, :cond_3

    .line 13
    invoke-virtual {p4}, Lcom/google/protobuf/UnknownFieldSchema;->newBuilder()Ljava/lang/Object;

    .line 14
    :cond_3
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    const/4 p0, 0x0

    .line 15
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw p0

    :cond_4
    return-object p3
.end method

.method public final getEnumFieldVerifier(I)Lcom/google/protobuf/Internal$EnumVerifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    div-int/lit8 p1, p1, 0x3

    mul-int/lit8 p1, p1, 0x2

    add-int/lit8 p1, p1, 0x1

    aget-object p0, p0, p1

    check-cast p0, Lcom/google/protobuf/Internal$EnumVerifier;

    return-object p0
.end method

.method public final getMapFieldDefaultEntry(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    div-int/lit8 p1, p1, 0x3

    mul-int/lit8 p1, p1, 0x2

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final getMessageFieldSchema(I)Lcom/google/protobuf/Schema;
    .locals 3

    .line 1
    div-int/lit8 p1, p1, 0x3

    mul-int/lit8 p1, p1, 0x2

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    aget-object v1, v0, p1

    check-cast v1, Lcom/google/protobuf/Schema;

    if-eqz v1, :cond_0

    return-object v1

    .line 3
    :cond_0
    sget-object v1, Lcom/google/protobuf/Protobuf;->INSTANCE:Lcom/google/protobuf/Protobuf;

    add-int/lit8 v2, p1, 0x1

    .line 4
    aget-object v0, v0, v2

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v1, v0}, Lcom/google/protobuf/Protobuf;->schemaFor(Ljava/lang/Class;)Lcom/google/protobuf/Schema;

    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    aput-object v0, p0, p1

    return-object v0
.end method

.method public getSerializedSize(Ljava/lang/Object;)I
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    iget-boolean v2, v0, Lcom/google/protobuf/MessageSchema;->proto3:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const v10, 0xfffff

    if-eqz v2, :cond_13

    .line 2
    sget-object v2, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    move v11, v9

    move v12, v11

    .line 3
    :goto_0
    iget-object v13, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    array-length v13, v13

    if-ge v11, v13, :cond_12

    .line 4
    invoke-virtual {v0, v11}, Lcom/google/protobuf/MessageSchema;->typeAndOffsetAt(I)I

    move-result v13

    .line 5
    invoke-static {v13}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result v14

    .line 6
    iget-object v15, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v15, v15, v11

    .line 7
    invoke-static {v13}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v5

    .line 8
    sget-object v13, Lcom/google/protobuf/FieldType;->DOUBLE_LIST_PACKED:Lcom/google/protobuf/FieldType;

    .line 9
    invoke-virtual {v13}, Lcom/google/protobuf/FieldType;->id()I

    move-result v13

    if-lt v14, v13, :cond_0

    sget-object v13, Lcom/google/protobuf/FieldType;->SINT64_LIST_PACKED:Lcom/google/protobuf/FieldType;

    .line 10
    invoke-virtual {v13}, Lcom/google/protobuf/FieldType;->id()I

    move-result v13

    if-gt v14, v13, :cond_0

    .line 11
    iget-object v13, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v16, v11, 0x2

    aget v13, v13, v16

    and-int/2addr v13, v10

    goto :goto_1

    :cond_0
    move v13, v9

    :goto_1
    packed-switch v14, :pswitch_data_0

    goto/16 :goto_5

    .line 12
    :pswitch_0
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 13
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/MessageLite;

    .line 14
    invoke-virtual {v0, v11}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v6

    .line 15
    invoke-static {v15, v5, v6}, Lcom/google/protobuf/CodedOutputStream;->computeGroupSize(ILcom/google/protobuf/MessageLite;Lcom/google/protobuf/Schema;)I

    move-result v5

    goto/16 :goto_4

    .line 16
    :pswitch_1
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 17
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v5

    invoke-static {v15, v5, v6}, Lcom/google/protobuf/CodedOutputStream;->computeSInt64Size(IJ)I

    move-result v5

    goto/16 :goto_4

    .line 18
    :pswitch_2
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 19
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeSInt32Size(II)I

    move-result v5

    goto/16 :goto_4

    .line 20
    :pswitch_3
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 21
    invoke-static {v15, v7, v8}, Lcom/google/protobuf/CodedOutputStream;->computeSFixed64Size(IJ)I

    move-result v5

    goto/16 :goto_4

    .line 22
    :pswitch_4
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 23
    invoke-static {v15, v9}, Lcom/google/protobuf/CodedOutputStream;->computeSFixed32Size(II)I

    move-result v5

    goto/16 :goto_4

    .line 24
    :pswitch_5
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 25
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v5

    goto/16 :goto_4

    .line 26
    :pswitch_6
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 27
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32Size(II)I

    move-result v5

    goto/16 :goto_4

    .line 28
    :pswitch_7
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 29
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/ByteString;

    .line 30
    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v5

    goto/16 :goto_4

    .line 31
    :pswitch_8
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 32
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 33
    invoke-virtual {v0, v11}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v6

    invoke-static {v15, v5, v6}, Lcom/google/protobuf/SchemaUtil;->computeSizeMessage(ILjava/lang/Object;Lcom/google/protobuf/Schema;)I

    move-result v5

    goto/16 :goto_4

    .line 34
    :pswitch_9
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 35
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 36
    instance-of v6, v5, Lcom/google/protobuf/ByteString;

    if-eqz v6, :cond_1

    .line 37
    check-cast v5, Lcom/google/protobuf/ByteString;

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v5

    goto/16 :goto_4

    .line 38
    :cond_1
    check-cast v5, Ljava/lang/String;

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v5

    goto/16 :goto_4

    .line 39
    :pswitch_a
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 40
    invoke-static {v15, v3}, Lcom/google/protobuf/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v5

    goto/16 :goto_4

    .line 41
    :pswitch_b
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 42
    invoke-static {v15, v9}, Lcom/google/protobuf/CodedOutputStream;->computeFixed32Size(II)I

    move-result v5

    goto/16 :goto_4

    .line 43
    :pswitch_c
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 44
    invoke-static {v15, v7, v8}, Lcom/google/protobuf/CodedOutputStream;->computeFixed64Size(IJ)I

    move-result v5

    goto/16 :goto_4

    .line 45
    :pswitch_d
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 46
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v5

    goto/16 :goto_4

    .line 47
    :pswitch_e
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 48
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v5

    invoke-static {v15, v5, v6}, Lcom/google/protobuf/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v5

    goto/16 :goto_4

    .line 49
    :pswitch_f
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 50
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v5

    invoke-static {v15, v5, v6}, Lcom/google/protobuf/CodedOutputStream;->computeInt64Size(IJ)I

    move-result v5

    goto/16 :goto_4

    .line 51
    :pswitch_10
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 52
    invoke-static {v15, v4}, Lcom/google/protobuf/CodedOutputStream;->computeFloatSize(IF)I

    move-result v5

    goto/16 :goto_4

    .line 53
    :pswitch_11
    invoke-virtual {v0, v1, v15, v11}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_11

    const-wide/16 v5, 0x0

    .line 54
    invoke-static {v15, v5, v6}, Lcom/google/protobuf/CodedOutputStream;->computeDoubleSize(ID)I

    move-result v13

    goto/16 :goto_3

    .line 55
    :pswitch_12
    iget-object v13, v0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    .line 56
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v11}, Lcom/google/protobuf/MessageSchema;->getMapFieldDefaultEntry(I)Ljava/lang/Object;

    move-result-object v6

    .line 57
    invoke-interface {v13, v15, v5, v6}, Lcom/google/protobuf/MapFieldSchema;->getSerializedSize(ILjava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    goto/16 :goto_4

    .line 58
    :pswitch_13
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v0, v11}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v6

    .line 59
    invoke-static {v15, v5, v6}, Lcom/google/protobuf/SchemaUtil;->computeSizeGroupList(ILjava/util/List;Lcom/google/protobuf/Schema;)I

    move-result v5

    goto/16 :goto_4

    .line 60
    :pswitch_14
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 61
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeSInt64ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 62
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_2

    int-to-long v13, v13

    .line 63
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 64
    :cond_2
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 65
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto/16 :goto_2

    .line 66
    :pswitch_15
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 67
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeSInt32ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 68
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_3

    int-to-long v13, v13

    .line 69
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 70
    :cond_3
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 71
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto/16 :goto_2

    .line 72
    :pswitch_16
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 73
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 74
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_4

    int-to-long v13, v13

    .line 75
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 76
    :cond_4
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 77
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto/16 :goto_2

    .line 78
    :pswitch_17
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 79
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 80
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_5

    int-to-long v13, v13

    .line 81
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 82
    :cond_5
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 83
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto/16 :goto_2

    .line 84
    :pswitch_18
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 85
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeEnumListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 86
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_6

    int-to-long v13, v13

    .line 87
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 88
    :cond_6
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 89
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto/16 :goto_2

    .line 90
    :pswitch_19
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 91
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeUInt32ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 92
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_7

    int-to-long v13, v13

    .line 93
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 94
    :cond_7
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 95
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto/16 :goto_2

    .line 96
    :pswitch_1a
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 97
    sget-object v6, Lcom/google/protobuf/SchemaUtil;->GENERATED_MESSAGE_CLASS:Ljava/lang/Class;

    .line 98
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_11

    .line 99
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_8

    int-to-long v13, v13

    .line 100
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 101
    :cond_8
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 102
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto/16 :goto_2

    .line 103
    :pswitch_1b
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 104
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 105
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_9

    int-to-long v13, v13

    .line 106
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 107
    :cond_9
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 108
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto/16 :goto_2

    .line 109
    :pswitch_1c
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 110
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 111
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_a

    int-to-long v13, v13

    .line 112
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 113
    :cond_a
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 114
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto/16 :goto_2

    .line 115
    :pswitch_1d
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 116
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeInt32ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 117
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_b

    int-to-long v13, v13

    .line 118
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 119
    :cond_b
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 120
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto/16 :goto_2

    .line 121
    :pswitch_1e
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 122
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeUInt64ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 123
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_c

    int-to-long v13, v13

    .line 124
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 125
    :cond_c
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 126
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto :goto_2

    .line 127
    :pswitch_1f
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 128
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeInt64ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 129
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_d

    int-to-long v13, v13

    .line 130
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 131
    :cond_d
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 132
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto :goto_2

    .line 133
    :pswitch_20
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 134
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 135
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_e

    int-to-long v13, v13

    .line 136
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 137
    :cond_e
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 138
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    goto :goto_2

    .line 139
    :pswitch_21
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 140
    invoke-static {v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64ListNoTag(Ljava/util/List;)I

    move-result v5

    if-lez v5, :cond_11

    .line 141
    iget-boolean v6, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v6, :cond_f

    int-to-long v13, v13

    .line 142
    invoke-virtual {v2, v1, v13, v14, v5}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 143
    :cond_f
    invoke-static {v15}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    .line 144
    invoke-static {v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v13

    :goto_2
    add-int/2addr v13, v6

    add-int/2addr v13, v5

    add-int/2addr v12, v13

    goto/16 :goto_5

    .line 145
    :pswitch_22
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeSInt64List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 146
    :pswitch_23
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    .line 147
    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeSInt32List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 148
    :pswitch_24
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 149
    :pswitch_25
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 150
    :pswitch_26
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    .line 151
    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeEnumList(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 152
    :pswitch_27
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    .line 153
    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeUInt32List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 154
    :pswitch_28
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    .line 155
    invoke-static {v15, v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeByteStringList(ILjava/util/List;)I

    move-result v5

    goto/16 :goto_4

    .line 156
    :pswitch_29
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v0, v11}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v6

    .line 157
    invoke-static {v15, v5, v6}, Lcom/google/protobuf/SchemaUtil;->computeSizeMessageList(ILjava/util/List;Lcom/google/protobuf/Schema;)I

    move-result v5

    goto/16 :goto_4

    .line 158
    :pswitch_2a
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5}, Lcom/google/protobuf/SchemaUtil;->computeSizeStringList(ILjava/util/List;)I

    move-result v5

    goto/16 :goto_4

    .line 159
    :pswitch_2b
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeBoolList(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 160
    :pswitch_2c
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 161
    :pswitch_2d
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 162
    :pswitch_2e
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    .line 163
    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeInt32List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 164
    :pswitch_2f
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeUInt64List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 165
    :pswitch_30
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeInt64List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 166
    :pswitch_31
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 167
    :pswitch_32
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->listAt(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    invoke-static {v15, v5, v9}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64List(ILjava/util/List;Z)I

    move-result v5

    goto/16 :goto_4

    .line 168
    :pswitch_33
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 169
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/MessageLite;

    .line 170
    invoke-virtual {v0, v11}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v6

    .line 171
    invoke-static {v15, v5, v6}, Lcom/google/protobuf/CodedOutputStream;->computeGroupSize(ILcom/google/protobuf/MessageLite;Lcom/google/protobuf/Schema;)I

    move-result v5

    goto/16 :goto_4

    .line 172
    :pswitch_34
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 173
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v5

    invoke-static {v15, v5, v6}, Lcom/google/protobuf/CodedOutputStream;->computeSInt64Size(IJ)I

    move-result v5

    goto/16 :goto_4

    .line 174
    :pswitch_35
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 175
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeSInt32Size(II)I

    move-result v5

    goto/16 :goto_4

    .line 176
    :pswitch_36
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 177
    invoke-static {v15, v7, v8}, Lcom/google/protobuf/CodedOutputStream;->computeSFixed64Size(IJ)I

    move-result v5

    goto/16 :goto_4

    .line 178
    :pswitch_37
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 179
    invoke-static {v15, v9}, Lcom/google/protobuf/CodedOutputStream;->computeSFixed32Size(II)I

    move-result v5

    goto/16 :goto_4

    .line 180
    :pswitch_38
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 181
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v5

    goto/16 :goto_4

    .line 182
    :pswitch_39
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 183
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32Size(II)I

    move-result v5

    goto/16 :goto_4

    .line 184
    :pswitch_3a
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 185
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/protobuf/ByteString;

    .line 186
    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v5

    goto/16 :goto_4

    .line 187
    :pswitch_3b
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 188
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 189
    invoke-virtual {v0, v11}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v6

    invoke-static {v15, v5, v6}, Lcom/google/protobuf/SchemaUtil;->computeSizeMessage(ILjava/lang/Object;Lcom/google/protobuf/Schema;)I

    move-result v5

    goto/16 :goto_4

    .line 190
    :pswitch_3c
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 191
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 192
    instance-of v6, v5, Lcom/google/protobuf/ByteString;

    if-eqz v6, :cond_10

    .line 193
    check-cast v5, Lcom/google/protobuf/ByteString;

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v5

    goto/16 :goto_4

    .line 194
    :cond_10
    check-cast v5, Ljava/lang/String;

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v5

    goto/16 :goto_4

    .line 195
    :pswitch_3d
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 196
    invoke-static {v15, v3}, Lcom/google/protobuf/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v5

    goto :goto_4

    .line 197
    :pswitch_3e
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 198
    invoke-static {v15, v9}, Lcom/google/protobuf/CodedOutputStream;->computeFixed32Size(II)I

    move-result v5

    goto :goto_4

    .line 199
    :pswitch_3f
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 200
    invoke-static {v15, v7, v8}, Lcom/google/protobuf/CodedOutputStream;->computeFixed64Size(IJ)I

    move-result v5

    goto :goto_4

    .line 201
    :pswitch_40
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 202
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v5

    invoke-static {v15, v5}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v5

    goto :goto_4

    .line 203
    :pswitch_41
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 204
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v5

    invoke-static {v15, v5, v6}, Lcom/google/protobuf/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v5

    goto :goto_4

    .line 205
    :pswitch_42
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 206
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v5

    invoke-static {v15, v5, v6}, Lcom/google/protobuf/CodedOutputStream;->computeInt64Size(IJ)I

    move-result v5

    goto :goto_4

    .line 207
    :pswitch_43
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 208
    invoke-static {v15, v4}, Lcom/google/protobuf/CodedOutputStream;->computeFloatSize(IF)I

    move-result v5

    goto :goto_4

    .line 209
    :pswitch_44
    invoke-virtual {v0, v1, v11}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_11

    const-wide/16 v5, 0x0

    .line 210
    invoke-static {v15, v5, v6}, Lcom/google/protobuf/CodedOutputStream;->computeDoubleSize(ID)I

    move-result v13

    :goto_3
    move v5, v13

    :goto_4
    add-int/2addr v12, v5

    :cond_11
    :goto_5
    add-int/lit8 v11, v11, 0x3

    goto/16 :goto_0

    .line 211
    :cond_12
    iget-object v0, v0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    .line 212
    invoke-virtual {v0, v1}, Lcom/google/protobuf/UnknownFieldSchema;->getFromMessage(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 213
    invoke-virtual {v0, v1}, Lcom/google/protobuf/UnknownFieldSchema;->getSerializedSize(Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v0, v12

    goto/16 :goto_1a

    .line 214
    :cond_13
    sget-object v2, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    const/4 v5, -0x1

    move v6, v9

    move v11, v6

    move v12, v11

    .line 215
    :goto_6
    iget-object v13, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    array-length v13, v13

    if-ge v6, v13, :cond_2c

    .line 216
    invoke-virtual {v0, v6}, Lcom/google/protobuf/MessageSchema;->typeAndOffsetAt(I)I

    move-result v13

    .line 217
    iget-object v14, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v14, v14, v6

    .line 218
    invoke-static {v13}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result v15

    const/16 v4, 0x11

    if-gt v15, v4, :cond_15

    .line 219
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v17, v6, 0x2

    aget v4, v4, v17

    and-int v9, v4, v10

    ushr-int/lit8 v18, v4, 0x14

    shl-int v18, v3, v18

    move/from16 v19, v4

    if-eq v9, v5, :cond_14

    int-to-long v3, v9

    .line 220
    invoke-virtual {v2, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v12

    move v5, v9

    move v9, v11

    move/from16 v4, v19

    goto :goto_8

    :cond_14
    move v9, v11

    goto :goto_8

    .line 221
    :cond_15
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_16

    sget-object v3, Lcom/google/protobuf/FieldType;->DOUBLE_LIST_PACKED:Lcom/google/protobuf/FieldType;

    .line 222
    invoke-virtual {v3}, Lcom/google/protobuf/FieldType;->id()I

    move-result v3

    if-lt v15, v3, :cond_16

    sget-object v3, Lcom/google/protobuf/FieldType;->SINT64_LIST_PACKED:Lcom/google/protobuf/FieldType;

    .line 223
    invoke-virtual {v3}, Lcom/google/protobuf/FieldType;->id()I

    move-result v3

    if-gt v15, v3, :cond_16

    .line 224
    iget-object v3, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v4, v6, 0x2

    aget v3, v3, v4

    and-int/2addr v3, v10

    move v4, v3

    goto :goto_7

    :cond_16
    const/4 v4, 0x0

    :goto_7
    move v9, v11

    const/16 v18, 0x0

    .line 225
    :goto_8
    invoke-static {v13}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    packed-switch v15, :pswitch_data_1

    goto/16 :goto_13

    .line 226
    :pswitch_45
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 227
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/protobuf/MessageLite;

    .line 228
    invoke-virtual {v0, v6}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v10

    .line 229
    invoke-static {v14, v4, v10}, Lcom/google/protobuf/CodedOutputStream;->computeGroupSize(ILcom/google/protobuf/MessageLite;Lcom/google/protobuf/Schema;)I

    move-result v4

    goto/16 :goto_c

    .line 230
    :pswitch_46
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 231
    invoke-static {v1, v10, v11}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v10

    invoke-static {v14, v10, v11}, Lcom/google/protobuf/CodedOutputStream;->computeSInt64Size(IJ)I

    move-result v4

    goto/16 :goto_c

    .line 232
    :pswitch_47
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 233
    invoke-static {v1, v10, v11}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v4

    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeSInt32Size(II)I

    move-result v4

    goto/16 :goto_c

    .line 234
    :pswitch_48
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 235
    invoke-static {v14, v7, v8}, Lcom/google/protobuf/CodedOutputStream;->computeSFixed64Size(IJ)I

    move-result v4

    goto/16 :goto_c

    .line 236
    :pswitch_49
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    const/4 v4, 0x0

    .line 237
    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeSFixed32Size(II)I

    move-result v10

    goto/16 :goto_d

    .line 238
    :pswitch_4a
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 239
    invoke-static {v1, v10, v11}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v4

    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v4

    goto/16 :goto_c

    .line 240
    :pswitch_4b
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 241
    invoke-static {v1, v10, v11}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v4

    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32Size(II)I

    move-result v4

    goto/16 :goto_c

    .line 242
    :pswitch_4c
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 243
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/protobuf/ByteString;

    .line 244
    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v4

    goto/16 :goto_c

    .line 245
    :pswitch_4d
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 246
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 247
    invoke-virtual {v0, v6}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v10

    invoke-static {v14, v4, v10}, Lcom/google/protobuf/SchemaUtil;->computeSizeMessage(ILjava/lang/Object;Lcom/google/protobuf/Schema;)I

    move-result v4

    goto/16 :goto_c

    .line 248
    :pswitch_4e
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 249
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 250
    instance-of v10, v4, Lcom/google/protobuf/ByteString;

    if-eqz v10, :cond_17

    .line 251
    check-cast v4, Lcom/google/protobuf/ByteString;

    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v4

    goto/16 :goto_e

    .line 252
    :cond_17
    check-cast v4, Ljava/lang/String;

    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v4

    goto/16 :goto_e

    .line 253
    :pswitch_4f
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    const/4 v4, 0x1

    .line 254
    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v10

    move v3, v4

    move v4, v10

    goto/16 :goto_f

    .line 255
    :pswitch_50
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    const/4 v4, 0x0

    .line 256
    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeFixed32Size(II)I

    move-result v10

    goto/16 :goto_d

    .line 257
    :pswitch_51
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 258
    invoke-static {v14, v7, v8}, Lcom/google/protobuf/CodedOutputStream;->computeFixed64Size(IJ)I

    move-result v4

    goto/16 :goto_c

    .line 259
    :pswitch_52
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 260
    invoke-static {v1, v10, v11}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v4

    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v4

    goto/16 :goto_c

    .line 261
    :pswitch_53
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 262
    invoke-static {v1, v10, v11}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v10

    invoke-static {v14, v10, v11}, Lcom/google/protobuf/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v4

    goto/16 :goto_c

    .line 263
    :pswitch_54
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 264
    invoke-static {v1, v10, v11}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v10

    invoke-static {v14, v10, v11}, Lcom/google/protobuf/CodedOutputStream;->computeInt64Size(IJ)I

    move-result v4

    goto/16 :goto_c

    .line 265
    :pswitch_55
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    const/4 v4, 0x0

    .line 266
    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeFloatSize(IF)I

    move-result v10

    move v4, v10

    goto/16 :goto_c

    .line 267
    :pswitch_56
    invoke-virtual {v0, v1, v14, v6}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_29

    const-wide/16 v10, 0x0

    .line 268
    invoke-static {v14, v10, v11}, Lcom/google/protobuf/CodedOutputStream;->computeDoubleSize(ID)I

    move-result v4

    goto/16 :goto_c

    .line 269
    :pswitch_57
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    .line 270
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v0, v6}, Lcom/google/protobuf/MessageSchema;->getMapFieldDefaultEntry(I)Ljava/lang/Object;

    move-result-object v11

    .line 271
    invoke-interface {v4, v14, v10, v11}, Lcom/google/protobuf/MapFieldSchema;->getSerializedSize(ILjava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    goto/16 :goto_c

    .line 272
    :pswitch_58
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 273
    invoke-virtual {v0, v6}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v10

    .line 274
    invoke-static {v14, v4, v10}, Lcom/google/protobuf/SchemaUtil;->computeSizeGroupList(ILjava/util/List;Lcom/google/protobuf/Schema;)I

    move-result v4

    goto/16 :goto_c

    .line 275
    :pswitch_59
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    .line 276
    invoke-static {v10}, Lcom/google/protobuf/SchemaUtil;->computeSizeSInt64ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 277
    iget-boolean v11, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v11, :cond_18

    int-to-long v3, v4

    .line 278
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 279
    :cond_18
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 280
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto/16 :goto_9

    .line 281
    :pswitch_5a
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 282
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeSInt32ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 283
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_19

    int-to-long v3, v4

    .line 284
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 285
    :cond_19
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 286
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto/16 :goto_9

    .line 287
    :pswitch_5b
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 288
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 289
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_1a

    int-to-long v3, v4

    .line 290
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 291
    :cond_1a
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 292
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto/16 :goto_9

    .line 293
    :pswitch_5c
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 294
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 295
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_1b

    int-to-long v3, v4

    .line 296
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 297
    :cond_1b
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 298
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto/16 :goto_9

    .line 299
    :pswitch_5d
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 300
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeEnumListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 301
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_1c

    int-to-long v3, v4

    .line 302
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 303
    :cond_1c
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 304
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto/16 :goto_9

    .line 305
    :pswitch_5e
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 306
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeUInt32ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 307
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_1d

    int-to-long v3, v4

    .line 308
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 309
    :cond_1d
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 310
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto/16 :goto_9

    .line 311
    :pswitch_5f
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 312
    sget-object v10, Lcom/google/protobuf/SchemaUtil;->GENERATED_MESSAGE_CLASS:Ljava/lang/Class;

    .line 313
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v10

    if-lez v10, :cond_29

    .line 314
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_1e

    int-to-long v3, v4

    .line 315
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 316
    :cond_1e
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 317
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto/16 :goto_9

    .line 318
    :pswitch_60
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 319
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 320
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_1f

    int-to-long v3, v4

    .line 321
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 322
    :cond_1f
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 323
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto/16 :goto_9

    .line 324
    :pswitch_61
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 325
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 326
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_20

    int-to-long v3, v4

    .line 327
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 328
    :cond_20
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 329
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto/16 :goto_9

    .line 330
    :pswitch_62
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 331
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeInt32ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 332
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_21

    int-to-long v3, v4

    .line 333
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 334
    :cond_21
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 335
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto/16 :goto_9

    .line 336
    :pswitch_63
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 337
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeUInt64ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 338
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_22

    int-to-long v3, v4

    .line 339
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 340
    :cond_22
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 341
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto :goto_9

    .line 342
    :pswitch_64
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 343
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeInt64ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 344
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_23

    int-to-long v3, v4

    .line 345
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 346
    :cond_23
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 347
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto :goto_9

    .line 348
    :pswitch_65
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 349
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 350
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_24

    int-to-long v3, v4

    .line 351
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 352
    :cond_24
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 353
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    goto :goto_9

    .line 354
    :pswitch_66
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 355
    invoke-static {v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64ListNoTag(Ljava/util/List;)I

    move-result v10

    if-lez v10, :cond_29

    .line 356
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->useCachedSizeField:Z

    if-eqz v3, :cond_25

    int-to-long v3, v4

    .line 357
    invoke-virtual {v2, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 358
    :cond_25
    invoke-static {v14}, Lcom/google/protobuf/CodedOutputStream;->computeTagSize(I)I

    move-result v3

    .line 359
    invoke-static {v10}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32SizeNoTag(I)I

    move-result v4

    :goto_9
    add-int/2addr v4, v3

    add-int/2addr v4, v10

    goto/16 :goto_e

    .line 360
    :pswitch_67
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    const/4 v4, 0x0

    .line 361
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeSInt64List(ILjava/util/List;Z)I

    move-result v3

    goto/16 :goto_a

    :pswitch_68
    const/4 v4, 0x0

    .line 362
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 363
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeSInt32List(ILjava/util/List;Z)I

    move-result v3

    goto/16 :goto_a

    :pswitch_69
    const/4 v4, 0x0

    .line 364
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 365
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64List(ILjava/util/List;Z)I

    move-result v3

    goto/16 :goto_a

    :pswitch_6a
    const/4 v4, 0x0

    .line 366
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 367
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32List(ILjava/util/List;Z)I

    move-result v3

    goto/16 :goto_a

    :pswitch_6b
    const/4 v4, 0x0

    .line 368
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 369
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeEnumList(ILjava/util/List;Z)I

    move-result v3

    goto/16 :goto_a

    :pswitch_6c
    const/4 v4, 0x0

    .line 370
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 371
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeUInt32List(ILjava/util/List;Z)I

    move-result v3

    goto/16 :goto_b

    .line 372
    :pswitch_6d
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 373
    invoke-static {v14, v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeByteStringList(ILjava/util/List;)I

    move-result v4

    goto/16 :goto_c

    .line 374
    :pswitch_6e
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-virtual {v0, v6}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v4

    .line 375
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeMessageList(ILjava/util/List;Lcom/google/protobuf/Schema;)I

    move-result v4

    goto/16 :goto_c

    .line 376
    :pswitch_6f
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-static {v14, v3}, Lcom/google/protobuf/SchemaUtil;->computeSizeStringList(ILjava/util/List;)I

    move-result v4

    goto :goto_c

    .line 377
    :pswitch_70
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    const/4 v4, 0x0

    .line 378
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeBoolList(ILjava/util/List;Z)I

    move-result v3

    goto :goto_a

    :pswitch_71
    const/4 v4, 0x0

    .line 379
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 380
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32List(ILjava/util/List;Z)I

    move-result v3

    goto :goto_a

    :pswitch_72
    const/4 v4, 0x0

    .line 381
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 382
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64List(ILjava/util/List;Z)I

    move-result v3

    goto :goto_a

    :pswitch_73
    const/4 v4, 0x0

    .line 383
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 384
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeInt32List(ILjava/util/List;Z)I

    move-result v3

    goto :goto_a

    :pswitch_74
    const/4 v4, 0x0

    .line 385
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 386
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeUInt64List(ILjava/util/List;Z)I

    move-result v3

    goto :goto_a

    :pswitch_75
    const/4 v4, 0x0

    .line 387
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 388
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeInt64List(ILjava/util/List;Z)I

    move-result v3

    goto :goto_a

    :pswitch_76
    const/4 v4, 0x0

    .line 389
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 390
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed32List(ILjava/util/List;Z)I

    move-result v3

    :goto_a
    add-int v11, v9, v3

    const/4 v3, 0x1

    goto/16 :goto_10

    :pswitch_77
    const/4 v4, 0x0

    .line 391
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 392
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeFixed64List(ILjava/util/List;Z)I

    move-result v3

    :goto_b
    move v4, v3

    :goto_c
    const/4 v3, 0x1

    goto/16 :goto_f

    :pswitch_78
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    .line 393
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/protobuf/MessageLite;

    .line 394
    invoke-virtual {v0, v6}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v4

    .line 395
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeGroupSize(ILcom/google/protobuf/MessageLite;Lcom/google/protobuf/Schema;)I

    move-result v4

    goto :goto_c

    :pswitch_79
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    .line 396
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v14, v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeSInt64Size(IJ)I

    move-result v4

    goto :goto_c

    :pswitch_7a
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    .line 397
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v3

    invoke-static {v14, v3}, Lcom/google/protobuf/CodedOutputStream;->computeSInt32Size(II)I

    move-result v4

    goto :goto_c

    :pswitch_7b
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    .line 398
    invoke-static {v14, v7, v8}, Lcom/google/protobuf/CodedOutputStream;->computeSFixed64Size(IJ)I

    move-result v3

    goto :goto_b

    :pswitch_7c
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    const/4 v3, 0x0

    .line 399
    invoke-static {v14, v3}, Lcom/google/protobuf/CodedOutputStream;->computeSFixed32Size(II)I

    move-result v10

    :goto_d
    add-int v11, v9, v10

    goto :goto_10

    :pswitch_7d
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    .line 400
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v3

    invoke-static {v14, v3}, Lcom/google/protobuf/CodedOutputStream;->computeEnumSize(II)I

    move-result v4

    goto :goto_c

    :pswitch_7e
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    .line 401
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v3

    invoke-static {v14, v3}, Lcom/google/protobuf/CodedOutputStream;->computeUInt32Size(II)I

    move-result v4

    goto :goto_c

    :pswitch_7f
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    .line 402
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/protobuf/ByteString;

    .line 403
    invoke-static {v14, v3}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v4

    goto :goto_c

    :pswitch_80
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    .line 404
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 405
    invoke-virtual {v0, v6}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v4

    invoke-static {v14, v3, v4}, Lcom/google/protobuf/SchemaUtil;->computeSizeMessage(ILjava/lang/Object;Lcom/google/protobuf/Schema;)I

    move-result v4

    goto :goto_c

    :pswitch_81
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    .line 406
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 407
    instance-of v4, v3, Lcom/google/protobuf/ByteString;

    if-eqz v4, :cond_26

    .line 408
    check-cast v3, Lcom/google/protobuf/ByteString;

    invoke-static {v14, v3}, Lcom/google/protobuf/CodedOutputStream;->computeBytesSize(ILcom/google/protobuf/ByteString;)I

    move-result v4

    goto :goto_e

    .line 409
    :cond_26
    check-cast v3, Ljava/lang/String;

    invoke-static {v14, v3}, Lcom/google/protobuf/CodedOutputStream;->computeStringSize(ILjava/lang/String;)I

    move-result v4

    :goto_e
    add-int v11, v4, v9

    goto :goto_10

    :pswitch_82
    and-int v3, v12, v18

    if-eqz v3, :cond_29

    const/4 v3, 0x1

    .line 410
    invoke-static {v14, v3}, Lcom/google/protobuf/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v4

    :goto_f
    add-int v11, v9, v4

    :goto_10
    const-wide/16 v3, 0x0

    const/4 v10, 0x0

    goto/16 :goto_17

    :pswitch_83
    const/4 v3, 0x1

    and-int v4, v12, v18

    if-eqz v4, :cond_27

    const/4 v4, 0x0

    .line 411
    invoke-static {v14, v4}, Lcom/google/protobuf/CodedOutputStream;->computeFixed32Size(II)I

    move-result v10

    move v11, v10

    const-wide/16 v3, 0x0

    const/4 v10, 0x0

    goto/16 :goto_15

    :cond_27
    const/4 v4, 0x0

    goto :goto_12

    :pswitch_84
    const/4 v3, 0x1

    const/4 v4, 0x0

    and-int v10, v12, v18

    if-eqz v10, :cond_28

    .line 412
    invoke-static {v14, v7, v8}, Lcom/google/protobuf/CodedOutputStream;->computeFixed64Size(IJ)I

    move-result v10

    :goto_11
    move v11, v10

    const/4 v10, 0x0

    goto :goto_14

    :cond_28
    :goto_12
    move v11, v9

    goto :goto_10

    :pswitch_85
    const/4 v3, 0x1

    const/4 v4, 0x0

    and-int v15, v12, v18

    if-eqz v15, :cond_29

    .line 413
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v10

    invoke-static {v14, v10}, Lcom/google/protobuf/CodedOutputStream;->computeInt32Size(II)I

    move-result v10

    goto :goto_11

    :pswitch_86
    const/4 v3, 0x1

    const/4 v4, 0x0

    and-int v15, v12, v18

    if-eqz v15, :cond_29

    .line 414
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v10

    invoke-static {v14, v10, v11}, Lcom/google/protobuf/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v10

    goto :goto_11

    :pswitch_87
    const/4 v3, 0x1

    const/4 v4, 0x0

    and-int v15, v12, v18

    if-eqz v15, :cond_29

    .line 415
    invoke-virtual {v2, v1, v10, v11}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v10

    invoke-static {v14, v10, v11}, Lcom/google/protobuf/CodedOutputStream;->computeInt64Size(IJ)I

    move-result v10

    goto :goto_11

    :cond_29
    :goto_13
    const-wide/16 v3, 0x0

    const/4 v10, 0x0

    goto :goto_16

    :pswitch_88
    const/4 v3, 0x1

    const/4 v4, 0x0

    and-int v10, v12, v18

    if-eqz v10, :cond_2a

    const/4 v10, 0x0

    .line 416
    invoke-static {v14, v10}, Lcom/google/protobuf/CodedOutputStream;->computeFloatSize(IF)I

    move-result v11

    :goto_14
    const-wide/16 v3, 0x0

    goto :goto_15

    :cond_2a
    const/4 v10, 0x0

    const-wide/16 v3, 0x0

    goto :goto_16

    :pswitch_89
    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v10, 0x0

    and-int v11, v12, v18

    const-wide/16 v3, 0x0

    if-eqz v11, :cond_2b

    .line 417
    invoke-static {v14, v3, v4}, Lcom/google/protobuf/CodedOutputStream;->computeDoubleSize(ID)I

    move-result v11

    :goto_15
    add-int/2addr v11, v9

    goto :goto_17

    :cond_2b
    :goto_16
    move v11, v9

    :goto_17
    add-int/lit8 v6, v6, 0x3

    move v4, v10

    const/4 v3, 0x1

    const/4 v9, 0x0

    const v10, 0xfffff

    goto/16 :goto_6

    :cond_2c
    move v9, v11

    .line 418
    iget-object v2, v0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    .line 419
    invoke-virtual {v2, v1}, Lcom/google/protobuf/UnknownFieldSchema;->getFromMessage(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 420
    invoke-virtual {v2, v3}, Lcom/google/protobuf/UnknownFieldSchema;->getSerializedSize(Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v2, v9

    .line 421
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->hasExtensions:Z

    if-eqz v3, :cond_2f

    .line 422
    iget-object v0, v0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {v0, v1}, Lcom/google/protobuf/ExtensionSchema;->getExtensions(Ljava/lang/Object;)Lcom/google/protobuf/FieldSet;

    move-result-object v0

    const/4 v9, 0x0

    const/16 v17, 0x0

    .line 423
    :goto_18
    iget-object v1, v0, Lcom/google/protobuf/FieldSet;->fields:Lcom/google/protobuf/SmallSortedMap;

    invoke-virtual {v1}, Lcom/google/protobuf/SmallSortedMap;->getNumArrayEntries()I

    move-result v1

    if-ge v9, v1, :cond_2d

    .line 424
    iget-object v1, v0, Lcom/google/protobuf/FieldSet;->fields:Lcom/google/protobuf/SmallSortedMap;

    invoke-virtual {v1, v9}, Lcom/google/protobuf/SmallSortedMap;->getArrayEntryAt(I)Ljava/util/Map$Entry;

    move-result-object v1

    .line 425
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/protobuf/FieldSet$FieldDescriptorLite;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/google/protobuf/FieldSet;->computeFieldSize(Lcom/google/protobuf/FieldSet$FieldDescriptorLite;Ljava/lang/Object;)I

    move-result v1

    add-int v17, v17, v1

    add-int/lit8 v9, v9, 0x1

    goto :goto_18

    .line 426
    :cond_2d
    iget-object v0, v0, Lcom/google/protobuf/FieldSet;->fields:Lcom/google/protobuf/SmallSortedMap;

    invoke-virtual {v0}, Lcom/google/protobuf/SmallSortedMap;->getOverflowEntries()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 427
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/protobuf/FieldSet$FieldDescriptorLite;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/google/protobuf/FieldSet;->computeFieldSize(Lcom/google/protobuf/FieldSet$FieldDescriptorLite;Ljava/lang/Object;)I

    move-result v1

    add-int v17, v17, v1

    goto :goto_19

    :cond_2e
    add-int v2, v2, v17

    :cond_2f
    move v0, v2

    :goto_1a
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_89
        :pswitch_88
        :pswitch_87
        :pswitch_86
        :pswitch_85
        :pswitch_84
        :pswitch_83
        :pswitch_82
        :pswitch_81
        :pswitch_80
        :pswitch_7f
        :pswitch_7e
        :pswitch_7d
        :pswitch_7c
        :pswitch_7b
        :pswitch_7a
        :pswitch_79
        :pswitch_78
        :pswitch_77
        :pswitch_76
        :pswitch_75
        :pswitch_74
        :pswitch_73
        :pswitch_72
        :pswitch_71
        :pswitch_70
        :pswitch_6f
        :pswitch_6e
        :pswitch_6d
        :pswitch_6c
        :pswitch_6b
        :pswitch_6a
        :pswitch_69
        :pswitch_68
        :pswitch_67
        :pswitch_66
        :pswitch_65
        :pswitch_64
        :pswitch_63
        :pswitch_62
        :pswitch_61
        :pswitch_60
        :pswitch_5f
        :pswitch_5e
        :pswitch_5d
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
    .end packed-switch
.end method

.method public hashCode(Ljava/lang/Object;)I
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    array-length v0, v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v1, v0, :cond_2

    .line 2
    invoke-virtual {p0, v1}, Lcom/google/protobuf/MessageSchema;->typeAndOffsetAt(I)I

    move-result v3

    .line 3
    iget-object v4, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v1

    .line 4
    invoke-static {v3}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v5

    .line 5
    invoke-static {v3}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result v3

    const/16 v7, 0x25

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_3

    .line 6
    :pswitch_0
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 7
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    mul-int/lit8 v2, v2, 0x35

    .line 8
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 9
    :pswitch_1
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 10
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto/16 :goto_2

    .line 11
    :pswitch_2
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 12
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 13
    :pswitch_3
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 14
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto/16 :goto_2

    .line 15
    :pswitch_4
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 16
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 17
    :pswitch_5
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 18
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 19
    :pswitch_6
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 20
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 21
    :pswitch_7
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 22
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 23
    :pswitch_8
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 24
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    mul-int/lit8 v2, v2, 0x35

    .line 25
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 26
    :pswitch_9
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 27
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 28
    :pswitch_a
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 29
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofBooleanAt(Ljava/lang/Object;J)Z

    move-result v3

    invoke-static {v3}, Lcom/google/protobuf/Internal;->hashBoolean(Z)I

    move-result v3

    goto/16 :goto_2

    .line 30
    :pswitch_b
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 31
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 32
    :pswitch_c
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 33
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto/16 :goto_2

    .line 34
    :pswitch_d
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 35
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    .line 36
    :pswitch_e
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 37
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto/16 :goto_2

    .line 38
    :pswitch_f
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 39
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto/16 :goto_2

    .line 40
    :pswitch_10
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 41
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofFloatAt(Ljava/lang/Object;J)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    goto/16 :goto_2

    .line 42
    :pswitch_11
    invoke-virtual {p0, p1, v4, v1}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_1

    mul-int/lit8 v2, v2, 0x35

    .line 43
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofDoubleAt(Ljava/lang/Object;J)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_12
    mul-int/lit8 v2, v2, 0x35

    .line 44
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    :pswitch_13
    mul-int/lit8 v2, v2, 0x35

    .line 45
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 46
    :pswitch_14
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 47
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v7

    goto :goto_1

    :pswitch_15
    mul-int/lit8 v2, v2, 0x35

    .line 48
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_16
    mul-int/lit8 v2, v2, 0x35

    .line 49
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_17
    mul-int/lit8 v2, v2, 0x35

    .line 50
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_18
    mul-int/lit8 v2, v2, 0x35

    .line 51
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_19
    mul-int/lit8 v2, v2, 0x35

    .line 52
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_1a
    mul-int/lit8 v2, v2, 0x35

    .line 53
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v3

    goto/16 :goto_2

    :pswitch_1b
    mul-int/lit8 v2, v2, 0x35

    .line 54
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto/16 :goto_2

    .line 55
    :pswitch_1c
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 56
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v7

    :cond_0
    :goto_1
    mul-int/lit8 v2, v2, 0x35

    add-int/2addr v2, v7

    goto :goto_3

    :pswitch_1d
    mul-int/lit8 v2, v2, 0x35

    .line 57
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_2

    :pswitch_1e
    mul-int/lit8 v2, v2, 0x35

    .line 58
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getBoolean(Ljava/lang/Object;J)Z

    move-result v3

    invoke-static {v3}, Lcom/google/protobuf/Internal;->hashBoolean(Z)I

    move-result v3

    goto :goto_2

    :pswitch_1f
    mul-int/lit8 v2, v2, 0x35

    .line 59
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v3

    goto :goto_2

    :pswitch_20
    mul-int/lit8 v2, v2, 0x35

    .line 60
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto :goto_2

    :pswitch_21
    mul-int/lit8 v2, v2, 0x35

    .line 61
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v3

    goto :goto_2

    :pswitch_22
    mul-int/lit8 v2, v2, 0x35

    .line 62
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto :goto_2

    :pswitch_23
    mul-int/lit8 v2, v2, 0x35

    .line 63
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    goto :goto_2

    :pswitch_24
    mul-int/lit8 v2, v2, 0x35

    .line 64
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getFloat(Ljava/lang/Object;J)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    goto :goto_2

    :pswitch_25
    mul-int/lit8 v2, v2, 0x35

    .line 65
    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getDouble(Ljava/lang/Object;J)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    .line 66
    invoke-static {v3, v4}, Lcom/google/protobuf/Internal;->hashLong(J)I

    move-result v3

    :goto_2
    add-int/2addr v3, v2

    move v2, v3

    :cond_1
    :goto_3
    add-int/lit8 v1, v1, 0x3

    goto/16 :goto_0

    :cond_2
    mul-int/lit8 v2, v2, 0x35

    .line 67
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSchema;->getFromMessage(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    .line 68
    iget-boolean v1, p0, Lcom/google/protobuf/MessageSchema;->hasExtensions:Z

    if-eqz v1, :cond_3

    mul-int/lit8 v0, v0, 0x35

    .line 69
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {p0, p1}, Lcom/google/protobuf/ExtensionSchema;->getExtensions(Ljava/lang/Object;)Lcom/google/protobuf/FieldSet;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/protobuf/FieldSet;->hashCode()I

    move-result p0

    add-int/2addr v0, p0

    :cond_3
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final isFieldPresent(Ljava/lang/Object;I)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)Z"
        }
    .end annotation

    .line 3
    iget-boolean v0, p0, Lcom/google/protobuf/MessageSchema;->proto3:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_11

    .line 4
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/2addr p2, v2

    aget p0, p0, p2

    .line 5
    invoke-static {p0}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v3

    .line 6
    invoke-static {p0}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result p0

    const-wide/16 v5, 0x0

    packed-switch p0, :pswitch_data_0

    .line 7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    .line 8
    :pswitch_0
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    move v1, v2

    :cond_0
    return v1

    .line 9
    :pswitch_1
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide p0

    cmp-long p0, p0, v5

    if-eqz p0, :cond_1

    move v1, v2

    :cond_1
    return v1

    .line 10
    :pswitch_2
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result p0

    if-eqz p0, :cond_2

    move v1, v2

    :cond_2
    return v1

    .line 11
    :pswitch_3
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide p0

    cmp-long p0, p0, v5

    if-eqz p0, :cond_3

    move v1, v2

    :cond_3
    return v1

    .line 12
    :pswitch_4
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result p0

    if-eqz p0, :cond_4

    move v1, v2

    :cond_4
    return v1

    .line 13
    :pswitch_5
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result p0

    if-eqz p0, :cond_5

    move v1, v2

    :cond_5
    return v1

    .line 14
    :pswitch_6
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result p0

    if-eqz p0, :cond_6

    move v1, v2

    :cond_6
    return v1

    .line 15
    :pswitch_7
    sget-object p0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/protobuf/ByteString;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    .line 16
    :pswitch_8
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_7

    move v1, v2

    :cond_7
    return v1

    .line 17
    :pswitch_9
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    .line 18
    instance-of p1, p0, Ljava/lang/String;

    if-eqz p1, :cond_8

    .line 19
    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    .line 20
    :cond_8
    instance-of p1, p0, Lcom/google/protobuf/ByteString;

    if-eqz p1, :cond_9

    .line 21
    sget-object p1, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    invoke-virtual {p1, p0}, Lcom/google/protobuf/ByteString;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    .line 22
    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    .line 23
    :pswitch_a
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getBoolean(Ljava/lang/Object;J)Z

    move-result p0

    return p0

    .line 24
    :pswitch_b
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result p0

    if-eqz p0, :cond_a

    move v1, v2

    :cond_a
    return v1

    .line 25
    :pswitch_c
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide p0

    cmp-long p0, p0, v5

    if-eqz p0, :cond_b

    move v1, v2

    :cond_b
    return v1

    .line 26
    :pswitch_d
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result p0

    if-eqz p0, :cond_c

    move v1, v2

    :cond_c
    return v1

    .line 27
    :pswitch_e
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide p0

    cmp-long p0, p0, v5

    if-eqz p0, :cond_d

    move v1, v2

    :cond_d
    return v1

    .line 28
    :pswitch_f
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide p0

    cmp-long p0, p0, v5

    if-eqz p0, :cond_e

    move v1, v2

    :cond_e
    return v1

    .line 29
    :pswitch_10
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getFloat(Ljava/lang/Object;J)F

    move-result p0

    const/4 p1, 0x0

    cmpl-float p0, p0, p1

    if-eqz p0, :cond_f

    move v1, v2

    :cond_f
    return v1

    .line 30
    :pswitch_11
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getDouble(Ljava/lang/Object;J)D

    move-result-wide p0

    const-wide/16 v3, 0x0

    cmpl-double p0, p0, v3

    if-eqz p0, :cond_10

    move v1, v2

    :cond_10
    return v1

    .line 31
    :cond_11
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 p2, p2, 0x2

    aget p0, p0, p2

    ushr-int/lit8 p2, p0, 0x14

    shl-int p2, v2, p2

    const v0, 0xfffff

    and-int/2addr p0, v0

    int-to-long v3, p0

    .line 32
    invoke-static {p1, v3, v4}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result p0

    and-int/2addr p0, p2

    if-eqz p0, :cond_12

    move v1, v2

    :cond_12
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final isFieldPresent(Ljava/lang/Object;III)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;III)Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/protobuf/MessageSchema;->proto3:Z

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result p0

    return p0

    :cond_0
    and-int p0, p3, p4

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final isInitialized(Ljava/lang/Object;)Z
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, -0x1

    move v2, v0

    move v3, v2

    .line 1
    :goto_0
    iget v4, p0, Lcom/google/protobuf/MessageSchema;->checkInitializedCount:I

    const/4 v5, 0x1

    if-ge v2, v4, :cond_d

    .line 2
    iget-object v4, p0, Lcom/google/protobuf/MessageSchema;->intArray:[I

    aget v4, v4, v2

    .line 3
    iget-object v6, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v6, v6, v4

    .line 4
    invoke-virtual {p0, v4}, Lcom/google/protobuf/MessageSchema;->typeAndOffsetAt(I)I

    move-result v7

    .line 5
    iget-boolean v8, p0, Lcom/google/protobuf/MessageSchema;->proto3:Z

    if-nez v8, :cond_0

    .line 6
    iget-object v8, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v9, v4, 0x2

    aget v8, v8, v9

    const v9, 0xfffff

    and-int/2addr v9, v8

    ushr-int/lit8 v8, v8, 0x14

    shl-int v8, v5, v8

    if-eq v9, v1, :cond_1

    .line 7
    sget-object v1, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    int-to-long v10, v9

    invoke-virtual {v1, p1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v3

    move v1, v9

    goto :goto_1

    :cond_0
    move v8, v0

    :cond_1
    :goto_1
    const/high16 v9, 0x10000000

    and-int/2addr v9, v7

    if-eqz v9, :cond_2

    move v9, v5

    goto :goto_2

    :cond_2
    move v9, v0

    :goto_2
    if-eqz v9, :cond_3

    .line 8
    invoke-virtual {p0, p1, v4, v3, v8}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;III)Z

    move-result v9

    if-nez v9, :cond_3

    return v0

    .line 9
    :cond_3
    invoke-static {v7}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result v9

    const/16 v10, 0x9

    if-eq v9, v10, :cond_b

    const/16 v10, 0x11

    if-eq v9, v10, :cond_b

    const/16 v8, 0x1b

    if-eq v9, v8, :cond_7

    const/16 v8, 0x3c

    if-eq v9, v8, :cond_6

    const/16 v8, 0x44

    if-eq v9, v8, :cond_6

    const/16 v6, 0x31

    if-eq v9, v6, :cond_7

    const/16 v5, 0x32

    if-eq v9, v5, :cond_4

    goto/16 :goto_5

    .line 10
    :cond_4
    iget-object v5, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    invoke-static {v7}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/google/protobuf/MapFieldSchema;->forMapData(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v5

    .line 11
    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_5

    goto/16 :goto_5

    .line 12
    :cond_5
    iget-object p1, p0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    div-int/lit8 v4, v4, 0x3

    mul-int/lit8 v4, v4, 0x2

    aget-object p1, p1, v4

    .line 13
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    invoke-interface {p0, p1}, Lcom/google/protobuf/MapFieldSchema;->forMapMetadata(Ljava/lang/Object;)Lcom/google/protobuf/MapEntryLite$Metadata;

    const/4 p0, 0x0

    .line 14
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw p0

    .line 15
    :cond_6
    invoke-virtual {p0, p1, v6, v4}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 16
    invoke-virtual {p0, v4}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v4

    .line 17
    invoke-static {v7}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v5

    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 18
    invoke-interface {v4, v5}, Lcom/google/protobuf/Schema;->isInitialized(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_c

    return v0

    .line 19
    :cond_7
    invoke-static {v7}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v6

    invoke-static {p1, v6, v7}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 20
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_8

    goto :goto_4

    .line 21
    :cond_8
    invoke-virtual {p0, v4}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v4

    move v7, v0

    .line 22
    :goto_3
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_a

    .line 23
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    .line 24
    invoke-interface {v4, v8}, Lcom/google/protobuf/Schema;->isInitialized(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_9

    move v5, v0

    goto :goto_4

    :cond_9
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_a
    :goto_4
    if-nez v5, :cond_c

    return v0

    .line 25
    :cond_b
    invoke-virtual {p0, p1, v4, v3, v8}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;III)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 26
    invoke-virtual {p0, v4}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v4

    .line 27
    invoke-static {v7}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v5

    invoke-static {p1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 28
    invoke-interface {v4, v5}, Lcom/google/protobuf/Schema;->isInitialized(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_c

    return v0

    :cond_c
    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 29
    :cond_d
    iget-boolean v1, p0, Lcom/google/protobuf/MessageSchema;->hasExtensions:Z

    if-eqz v1, :cond_e

    .line 30
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {p0, p1}, Lcom/google/protobuf/ExtensionSchema;->getExtensions(Ljava/lang/Object;)Lcom/google/protobuf/FieldSet;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/protobuf/FieldSet;->isInitialized()Z

    move-result p0

    if-nez p0, :cond_e

    return v0

    :cond_e
    return v5
.end method

.method public final isOneofPresent(Ljava/lang/Object;II)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 p3, p3, 0x2

    aget p0, p0, p3

    const p3, 0xfffff

    and-int/2addr p0, p3

    int-to-long v0, p0

    .line 2
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result p0

    if-ne p0, p2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public makeImmutable(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/protobuf/MessageSchema;->checkInitializedCount:I

    :goto_0
    iget v1, p0, Lcom/google/protobuf/MessageSchema;->repeatedFieldOffsetStart:I

    if-ge v0, v1, :cond_1

    .line 2
    iget-object v1, p0, Lcom/google/protobuf/MessageSchema;->intArray:[I

    aget v1, v1, v0

    invoke-virtual {p0, v1}, Lcom/google/protobuf/MessageSchema;->typeAndOffsetAt(I)I

    move-result v1

    invoke-static {v1}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v1

    .line 3
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 4
    :cond_0
    iget-object v4, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    invoke-interface {v4, v3}, Lcom/google/protobuf/MapFieldSchema;->toImmutable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {p1, v1, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 5
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->intArray:[I

    array-length v0, v0

    :goto_2
    if-ge v1, v0, :cond_2

    .line 6
    iget-object v2, p0, Lcom/google/protobuf/MessageSchema;->listFieldSchema:Lcom/google/protobuf/ListFieldSchema;

    iget-object v3, p0, Lcom/google/protobuf/MessageSchema;->intArray:[I

    aget v3, v3, v1

    int-to-long v3, v3

    invoke-virtual {v2, p1, v3, v4}, Lcom/google/protobuf/ListFieldSchema;->makeImmutableListAt(Ljava/lang/Object;J)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 7
    :cond_2
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSchema;->makeImmutable(Ljava/lang/Object;)V

    .line 8
    iget-boolean v0, p0, Lcom/google/protobuf/MessageSchema;->hasExtensions:Z

    if-eqz v0, :cond_3

    .line 9
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {p0, p1}, Lcom/google/protobuf/ExtensionSchema;->makeImmutable(Ljava/lang/Object;)V

    :cond_3
    return-void
.end method

.method public mergeFrom(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    array-length v2, v1

    if-ge v0, v2, :cond_1

    add-int/lit8 v2, v0, 0x1

    .line 3
    aget v1, v1, v2

    .line 4
    invoke-static {v1}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v2

    .line 5
    iget-object v4, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v0

    .line 6
    invoke-static {v1}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_1

    .line 7
    :pswitch_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/protobuf/MessageSchema;->mergeOneofMessage(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 8
    :pswitch_1
    invoke-virtual {p0, p2, v4, v0}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 9
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 10
    invoke-virtual {p0, p1, v4, v0}, Lcom/google/protobuf/MessageSchema;->setOneofPresent(Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 11
    :pswitch_2
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/protobuf/MessageSchema;->mergeOneofMessage(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 12
    :pswitch_3
    invoke-virtual {p0, p2, v4, v0}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 13
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 14
    invoke-virtual {p0, p1, v4, v0}, Lcom/google/protobuf/MessageSchema;->setOneofPresent(Ljava/lang/Object;II)V

    goto/16 :goto_1

    .line 15
    :pswitch_4
    iget-object v1, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    sget-object v4, Lcom/google/protobuf/SchemaUtil;->GENERATED_MESSAGE_CLASS:Ljava/lang/Class;

    .line 16
    invoke-static {p1, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    .line 17
    invoke-interface {v1, v4, v5}, Lcom/google/protobuf/MapFieldSchema;->mergeFrom(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 18
    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto/16 :goto_1

    .line 19
    :pswitch_5
    iget-object v1, p0, Lcom/google/protobuf/MessageSchema;->listFieldSchema:Lcom/google/protobuf/ListFieldSchema;

    invoke-virtual {v1, p1, p2, v2, v3}, Lcom/google/protobuf/ListFieldSchema;->mergeListsAt(Ljava/lang/Object;Ljava/lang/Object;J)V

    goto/16 :goto_1

    .line 20
    :pswitch_6
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/protobuf/MessageSchema;->mergeMessage(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 21
    :pswitch_7
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 22
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/protobuf/UnsafeUtil;->putLong(Ljava/lang/Object;JJ)V

    .line 23
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 24
    :pswitch_8
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 25
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putInt(Ljava/lang/Object;JI)V

    .line 26
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 27
    :pswitch_9
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 28
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/protobuf/UnsafeUtil;->putLong(Ljava/lang/Object;JJ)V

    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 30
    :pswitch_a
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 31
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putInt(Ljava/lang/Object;JI)V

    .line 32
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 33
    :pswitch_b
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 34
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putInt(Ljava/lang/Object;JI)V

    .line 35
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 36
    :pswitch_c
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 37
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putInt(Ljava/lang/Object;JI)V

    .line 38
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 39
    :pswitch_d
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 40
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 41
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 42
    :pswitch_e
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/protobuf/MessageSchema;->mergeMessage(Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 43
    :pswitch_f
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 45
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 46
    :pswitch_10
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getBoolean(Ljava/lang/Object;J)Z

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putBoolean(Ljava/lang/Object;JZ)V

    .line 48
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto/16 :goto_1

    .line 49
    :pswitch_11
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putInt(Ljava/lang/Object;JI)V

    .line 51
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto :goto_1

    .line 52
    :pswitch_12
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 53
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/protobuf/UnsafeUtil;->putLong(Ljava/lang/Object;JJ)V

    .line 54
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto :goto_1

    .line 55
    :pswitch_13
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 56
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putInt(Ljava/lang/Object;JI)V

    .line 57
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto :goto_1

    .line 58
    :pswitch_14
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 59
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/protobuf/UnsafeUtil;->putLong(Ljava/lang/Object;JJ)V

    .line 60
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto :goto_1

    .line 61
    :pswitch_15
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 62
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/protobuf/UnsafeUtil;->putLong(Ljava/lang/Object;JJ)V

    .line 63
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto :goto_1

    .line 64
    :pswitch_16
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 65
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getFloat(Ljava/lang/Object;J)F

    move-result v1

    invoke-static {p1, v2, v3, v1}, Lcom/google/protobuf/UnsafeUtil;->putFloat(Ljava/lang/Object;JF)V

    .line 66
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto :goto_1

    .line 67
    :pswitch_17
    invoke-virtual {p0, p2, v0}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 68
    invoke-static {p2, v2, v3}, Lcom/google/protobuf/UnsafeUtil;->getDouble(Ljava/lang/Object;J)D

    move-result-wide v4

    invoke-static {p1, v2, v3, v4, v5}, Lcom/google/protobuf/UnsafeUtil;->putDouble(Ljava/lang/Object;JD)V

    .line 69
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x3

    goto/16 :goto_0

    .line 70
    :cond_1
    iget-boolean v0, p0, Lcom/google/protobuf/MessageSchema;->proto3:Z

    if-nez v0, :cond_2

    .line 71
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    sget-object v1, Lcom/google/protobuf/SchemaUtil;->GENERATED_MESSAGE_CLASS:Ljava/lang/Class;

    .line 72
    invoke-virtual {v0, p1}, Lcom/google/protobuf/UnknownFieldSchema;->getFromMessage(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 73
    invoke-virtual {v0, p2}, Lcom/google/protobuf/UnknownFieldSchema;->getFromMessage(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 74
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/UnknownFieldSchema;->merge(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 75
    invoke-virtual {v0, p1, v1}, Lcom/google/protobuf/UnknownFieldSchema;->setToMessage(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 76
    iget-boolean v0, p0, Lcom/google/protobuf/MessageSchema;->hasExtensions:Z

    if-eqz v0, :cond_2

    .line 77
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-static {p0, p1, p2}, Lcom/google/protobuf/SchemaUtil;->mergeExtensions(Lcom/google/protobuf/ExtensionSchema;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public mergeFrom(Ljava/lang/Object;[BIILcom/google/protobuf/ArrayDecoders$Registers;)V
    .locals 27
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BII",
            "Lcom/google/protobuf/ArrayDecoders$Registers;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v15, p0

    move-object/from16 v14, p1

    move-object/from16 v12, p2

    move/from16 v13, p4

    move-object/from16 v11, p5

    .line 78
    iget-boolean v0, v15, Lcom/google/protobuf/MessageSchema;->proto3:Z

    if-eqz v0, :cond_13

    .line 79
    sget-object v9, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    const/16 v16, 0x0

    const/4 v10, -0x1

    move/from16 v0, p3

    move v1, v10

    move/from16 v2, v16

    :goto_0
    if-ge v0, v13, :cond_11

    add-int/lit8 v3, v0, 0x1

    .line 80
    aget-byte v0, v12, v0

    if-gez v0, :cond_0

    .line 81
    invoke-static {v0, v12, v3, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32(I[BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 82
    iget v3, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    move v8, v0

    move/from16 v17, v3

    goto :goto_1

    :cond_0
    move/from16 v17, v0

    move v8, v3

    :goto_1
    ushr-int/lit8 v7, v17, 0x3

    and-int/lit8 v6, v17, 0x7

    if-le v7, v1, :cond_2

    .line 83
    div-int/lit8 v2, v2, 0x3

    .line 84
    iget v0, v15, Lcom/google/protobuf/MessageSchema;->minFieldNumber:I

    if-lt v7, v0, :cond_1

    iget v0, v15, Lcom/google/protobuf/MessageSchema;->maxFieldNumber:I

    if-gt v7, v0, :cond_1

    .line 85
    invoke-virtual {v15, v7, v2}, Lcom/google/protobuf/MessageSchema;->slowPositionForFieldNumber(II)I

    move-result v0

    goto :goto_2

    :cond_1
    move v4, v10

    goto :goto_3

    .line 86
    :cond_2
    invoke-virtual {v15, v7}, Lcom/google/protobuf/MessageSchema;->positionForFieldNumber(I)I

    move-result v0

    :goto_2
    move v4, v0

    :goto_3
    if-ne v4, v10, :cond_3

    move/from16 v24, v7

    move v2, v8

    move-object/from16 v18, v9

    move/from16 v26, v10

    move/from16 v19, v16

    goto/16 :goto_10

    .line 87
    :cond_3
    iget-object v0, v15, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v1, v4, 0x1

    aget v5, v0, v1

    .line 88
    invoke-static {v5}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result v3

    .line 89
    invoke-static {v5}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v1

    const/16 v0, 0x11

    const/4 v10, 0x2

    if-gt v3, v0, :cond_8

    const/4 v0, 0x1

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_c

    :pswitch_0
    if-nez v6, :cond_b

    .line 90
    invoke-static {v12, v8, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v6

    move-wide/from16 v19, v1

    .line 91
    iget-wide v0, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    .line 92
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedInputStream;->decodeZigZag64(J)J

    move-result-wide v21

    move-object v0, v9

    move-wide/from16 v2, v19

    move-object/from16 v1, p1

    move v10, v4

    move-wide/from16 v4, v21

    .line 93
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    goto/16 :goto_7

    :pswitch_1
    move-wide v2, v1

    move v10, v4

    if-nez v6, :cond_7

    .line 94
    invoke-static {v12, v8, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 95
    iget v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    .line 96
    invoke-static {v1}, Lcom/google/protobuf/CodedInputStream;->decodeZigZag32(I)I

    move-result v1

    .line 97
    invoke-virtual {v9, v14, v2, v3, v1}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_9

    :pswitch_2
    move-wide v2, v1

    move v10, v4

    if-nez v6, :cond_7

    .line 98
    invoke-static {v12, v8, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 99
    iget v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    invoke-virtual {v9, v14, v2, v3, v1}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_9

    :pswitch_3
    move-wide v2, v1

    if-ne v6, v10, :cond_b

    .line 100
    invoke-static {v12, v8, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeBytes([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 101
    iget-object v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-virtual {v9, v14, v2, v3, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_6

    :pswitch_4
    move-wide v2, v1

    if-ne v6, v10, :cond_b

    .line 102
    invoke-virtual {v15, v4}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v0

    .line 103
    invoke-static {v0, v12, v8, v13, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeMessageField(Lcom/google/protobuf/Schema;[BIILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 104
    invoke-virtual {v9, v14, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_4

    .line 105
    iget-object v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-virtual {v9, v14, v2, v3, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_6

    .line 106
    :cond_4
    iget-object v5, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    .line 107
    invoke-static {v1, v5}, Lcom/google/protobuf/Internal;->mergeMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 108
    invoke-virtual {v9, v14, v2, v3, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_6

    :pswitch_5
    move-wide v2, v1

    if-ne v6, v10, :cond_b

    const/high16 v0, 0x20000000

    and-int/2addr v0, v5

    if-nez v0, :cond_5

    .line 109
    invoke-static {v12, v8, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeString([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto :goto_4

    .line 110
    :cond_5
    invoke-static {v12, v8, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeStringRequireUtf8([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 111
    :goto_4
    iget-object v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-virtual {v9, v14, v2, v3, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_6

    :pswitch_6
    move-wide v2, v1

    if-nez v6, :cond_b

    .line 112
    invoke-static {v12, v8, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v1

    .line 113
    iget-wide v5, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    const-wide/16 v19, 0x0

    cmp-long v5, v5, v19

    if-eqz v5, :cond_6

    goto :goto_5

    :cond_6
    move/from16 v0, v16

    :goto_5
    invoke-static {v14, v2, v3, v0}, Lcom/google/protobuf/UnsafeUtil;->putBoolean(Ljava/lang/Object;JZ)V

    move v0, v1

    goto :goto_6

    :pswitch_7
    move-wide v2, v1

    const/4 v0, 0x5

    if-ne v6, v0, :cond_b

    .line 114
    invoke-static {v12, v8}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed32([BI)I

    move-result v0

    invoke-virtual {v9, v14, v2, v3, v0}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    add-int/lit8 v0, v8, 0x4

    :goto_6
    move/from16 v19, v4

    goto/16 :goto_b

    :pswitch_8
    move-wide v2, v1

    if-ne v6, v0, :cond_b

    .line 115
    invoke-static {v12, v8}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed64([BI)J

    move-result-wide v5

    move-object v0, v9

    move-object/from16 v1, p1

    move v10, v4

    move-wide v4, v5

    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    goto :goto_8

    :pswitch_9
    move-wide v2, v1

    move v10, v4

    if-nez v6, :cond_7

    .line 116
    invoke-static {v12, v8, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 117
    iget v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    invoke-virtual {v9, v14, v2, v3, v1}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_9

    :pswitch_a
    move-wide v2, v1

    move v10, v4

    if-nez v6, :cond_7

    .line 118
    invoke-static {v12, v8, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v6

    .line 119
    iget-wide v4, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    move-object v0, v9

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    :goto_7
    move v0, v6

    goto :goto_9

    :pswitch_b
    move-wide v2, v1

    move v10, v4

    const/4 v0, 0x5

    if-ne v6, v0, :cond_7

    .line 120
    invoke-static {v12, v8}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed32([BI)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    .line 121
    invoke-static {v14, v2, v3, v0}, Lcom/google/protobuf/UnsafeUtil;->putFloat(Ljava/lang/Object;JF)V

    add-int/lit8 v0, v8, 0x4

    goto :goto_9

    :pswitch_c
    move-wide v2, v1

    move v10, v4

    if-ne v6, v0, :cond_7

    .line 122
    invoke-static {v12, v8}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed64([BI)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    .line 123
    invoke-static {v14, v2, v3, v0, v1}, Lcom/google/protobuf/UnsafeUtil;->putDouble(Ljava/lang/Object;JD)V

    :goto_8
    add-int/lit8 v0, v8, 0x8

    :goto_9
    move/from16 v19, v10

    goto :goto_b

    :cond_7
    move/from16 v19, v10

    goto :goto_d

    :cond_8
    const/16 v0, 0x1b

    if-ne v3, v0, :cond_c

    if-ne v6, v10, :cond_b

    .line 124
    invoke-virtual {v9, v14, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Internal$ProtobufList;

    .line 125
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v3

    if-nez v3, :cond_a

    .line 126
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_9

    const/16 v3, 0xa

    goto :goto_a

    :cond_9
    mul-int/lit8 v3, v3, 0x2

    .line 127
    :goto_a
    invoke-interface {v0, v3}, Lcom/google/protobuf/Internal$ProtobufList;->mutableCopyWithCapacity(I)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    .line 128
    invoke-virtual {v9, v14, v1, v2, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_a
    move-object v5, v0

    .line 129
    invoke-virtual {v15, v4}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v0

    move/from16 v1, v17

    move-object/from16 v2, p2

    move v3, v8

    move/from16 v19, v4

    move/from16 v4, p4

    move-object/from16 v6, p5

    .line 130
    invoke-static/range {v0 .. v6}, Lcom/google/protobuf/ArrayDecoders;->decodeMessageList(Lcom/google/protobuf/Schema;I[BIILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    :goto_b
    move v1, v7

    move/from16 v2, v19

    const/4 v10, -0x1

    goto/16 :goto_0

    :cond_b
    :goto_c
    move/from16 v19, v4

    :goto_d
    move/from16 v24, v7

    move v15, v8

    move-object/from16 v18, v9

    const/16 v26, -0x1

    goto :goto_e

    :cond_c
    move/from16 v19, v4

    const/16 v0, 0x31

    if-gt v3, v0, :cond_d

    int-to-long v4, v5

    move-object/from16 v0, p0

    move-wide/from16 v20, v1

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move v10, v3

    move v3, v8

    move-wide/from16 v22, v4

    move/from16 v4, p4

    move/from16 v5, v17

    move/from16 p3, v6

    move v6, v7

    move/from16 v24, v7

    move/from16 v7, p3

    move v15, v8

    move/from16 v8, v19

    move-object/from16 v18, v9

    move/from16 v25, v10

    const/16 v26, -0x1

    move-wide/from16 v9, v22

    move/from16 v11, v25

    move-wide/from16 v12, v20

    move-object/from16 v14, p5

    .line 131
    invoke-virtual/range {v0 .. v14}, Lcom/google/protobuf/MessageSchema;->parseRepeatedField(Ljava/lang/Object;[BIIIIIIJIJLcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    if-eq v0, v15, :cond_10

    goto :goto_f

    :cond_d
    move-wide/from16 v20, v1

    move/from16 v25, v3

    move/from16 p3, v6

    move/from16 v24, v7

    move v15, v8

    move-object/from16 v18, v9

    const/16 v26, -0x1

    const/16 v0, 0x32

    move/from16 v9, v25

    if-ne v9, v0, :cond_f

    move/from16 v7, p3

    if-eq v7, v10, :cond_e

    :goto_e
    move v2, v15

    goto :goto_10

    :cond_e
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move v3, v15

    move/from16 v4, p4

    move/from16 v5, v19

    move-wide/from16 v6, v20

    move-object/from16 v8, p5

    .line 132
    invoke-virtual/range {v0 .. v8}, Lcom/google/protobuf/MessageSchema;->parseMapField(Ljava/lang/Object;[BIIIJLcom/google/protobuf/ArrayDecoders$Registers;)I

    const/4 v0, 0x0

    throw v0

    :cond_f
    move/from16 v7, p3

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move v3, v15

    move/from16 v4, p4

    move v8, v5

    move/from16 v5, v17

    move/from16 v6, v24

    move-wide/from16 v10, v20

    move/from16 v12, v19

    move-object/from16 v13, p5

    .line 133
    invoke-virtual/range {v0 .. v13}, Lcom/google/protobuf/MessageSchema;->parseOneofField(Ljava/lang/Object;[BIIIIIIIJILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    if-eq v0, v15, :cond_10

    :goto_f
    goto :goto_11

    :cond_10
    move v2, v0

    .line 134
    :goto_10
    invoke-static/range {p1 .. p1}, Lcom/google/protobuf/MessageSchema;->getMutableUnknownFields(Ljava/lang/Object;)Lcom/google/protobuf/UnknownFieldSetLite;

    move-result-object v4

    move/from16 v0, v17

    move-object/from16 v1, p2

    move/from16 v3, p4

    move-object/from16 v5, p5

    .line 135
    invoke-static/range {v0 .. v5}, Lcom/google/protobuf/ArrayDecoders;->decodeUnknownField(I[BIILcom/google/protobuf/UnknownFieldSetLite;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    :goto_11
    move/from16 v2, v19

    move-object/from16 v15, p0

    move-object/from16 v14, p1

    move-object/from16 v12, p2

    move/from16 v13, p4

    move-object/from16 v11, p5

    move-object/from16 v9, v18

    move/from16 v1, v24

    move/from16 v10, v26

    goto/16 :goto_0

    :cond_11
    move v4, v13

    if-ne v0, v4, :cond_12

    goto :goto_12

    .line 136
    :cond_12
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->parseFailure()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :cond_13
    move v4, v13

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v6, p5

    .line 137
    invoke-virtual/range {v0 .. v6}, Lcom/google/protobuf/MessageSchema;->parseProto2Message(Ljava/lang/Object;[BIIILcom/google/protobuf/ArrayDecoders$Registers;)I

    :goto_12
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_9
        :pswitch_2
        :pswitch_7
        :pswitch_8
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final mergeMessage(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v1, p3, 0x1

    aget v0, v0, v1

    .line 2
    invoke-static {v0}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v0

    .line 3
    invoke-virtual {p0, p2, p3}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    .line 4
    :cond_0
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    .line 5
    invoke-static {p2, v0, v1}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p2

    if-eqz v2, :cond_1

    if-eqz p2, :cond_1

    .line 6
    invoke-static {v2, p2}, Lcom/google/protobuf/Internal;->mergeMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 7
    invoke-static {p1, v0, v1, p2}, Lcom/google/protobuf/UnsafeUtil;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 8
    invoke-virtual {p0, p1, p3}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    .line 9
    invoke-static {p1, v0, v1, p2}, Lcom/google/protobuf/UnsafeUtil;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 10
    invoke-virtual {p0, p1, p3}, Lcom/google/protobuf/MessageSchema;->setFieldPresent(Ljava/lang/Object;I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public final mergeOneofMessage(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v1, p3, 0x1

    aget v1, v0, v1

    .line 2
    aget v0, v0, p3

    .line 3
    invoke-static {v1}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v1

    .line 4
    invoke-virtual {p0, p2, v0, p3}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v3

    if-nez v3, :cond_0

    return-void

    .line 5
    :cond_0
    invoke-static {p1, v1, v2}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    .line 6
    invoke-static {p2, v1, v2}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p2

    if-eqz v3, :cond_1

    if-eqz p2, :cond_1

    .line 7
    invoke-static {v3, p2}, Lcom/google/protobuf/Internal;->mergeMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 8
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/UnsafeUtil;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 9
    invoke-virtual {p0, p1, v0, p3}, Lcom/google/protobuf/MessageSchema;->setOneofPresent(Ljava/lang/Object;II)V

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    .line 10
    invoke-static {p1, v1, v2, p2}, Lcom/google/protobuf/UnsafeUtil;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 11
    invoke-virtual {p0, p1, v0, p3}, Lcom/google/protobuf/MessageSchema;->setOneofPresent(Ljava/lang/Object;II)V

    :cond_2
    :goto_0
    return-void
.end method

.method public newInstance()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->newInstanceSchema:Lcom/google/protobuf/NewInstanceSchema;

    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->defaultInstance:Lcom/google/protobuf/MessageLite;

    invoke-interface {v0, p0}, Lcom/google/protobuf/NewInstanceSchema;->newInstance(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final parseMapField(Ljava/lang/Object;[BIIIJLcom/google/protobuf/ArrayDecoders$Registers;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(TT;[BIIIJ",
            "Lcom/google/protobuf/ArrayDecoders$Registers;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    .line 2
    iget-object v1, p0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    div-int/lit8 p5, p5, 0x3

    mul-int/lit8 p5, p5, 0x2

    aget-object p5, v1, p5

    .line 3
    invoke-virtual {v0, p1, p6, p7}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    .line 4
    iget-object v2, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    invoke-interface {v2, v1}, Lcom/google/protobuf/MapFieldSchema;->isImmutable(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 5
    iget-object v2, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    invoke-interface {v2, p5}, Lcom/google/protobuf/MapFieldSchema;->newMapField(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 6
    iget-object v3, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    invoke-interface {v3, v2, v1}, Lcom/google/protobuf/MapFieldSchema;->mergeFrom(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    invoke-virtual {v0, p1, p6, p7, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    move-object v1, v2

    .line 8
    :cond_0
    iget-object p1, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    .line 9
    invoke-interface {p1, p5}, Lcom/google/protobuf/MapFieldSchema;->forMapMetadata(Ljava/lang/Object;)Lcom/google/protobuf/MapEntryLite$Metadata;

    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    .line 10
    invoke-interface {p0, v1}, Lcom/google/protobuf/MapFieldSchema;->forMutableMapData(Ljava/lang/Object;)Ljava/util/Map;

    .line 11
    invoke-static {p2, p3, p8}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result p0

    .line 12
    iget p1, p8, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-ltz p1, :cond_2

    sub-int/2addr p4, p0

    if-le p1, p4, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 13
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw p0

    .line 14
    :cond_2
    :goto_0
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->truncatedMessage()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    throw p0
.end method

.method public final parseOneofField(Ljava/lang/Object;[BIIIIIIIJILcom/google/protobuf/ArrayDecoders$Registers;)I
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BIIIIIIIJI",
            "Lcom/google/protobuf/ArrayDecoders$Registers;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v2, p5

    move/from16 v8, p6

    move/from16 v5, p7

    move-wide/from16 v9, p10

    move/from16 v6, p12

    move-object/from16 v11, p13

    .line 1
    sget-object v12, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    .line 2
    iget-object v7, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v13, v6, 0x2

    aget v7, v7, v13

    const v13, 0xfffff

    and-int/2addr v7, v13

    int-to-long v13, v7

    const/4 v15, 0x3

    const/4 v7, 0x1

    packed-switch p9, :pswitch_data_0

    goto/16 :goto_9

    :pswitch_0
    if-ne v5, v15, :cond_a

    and-int/lit8 v2, v2, -0x8

    or-int/lit8 v7, v2, 0x4

    .line 3
    invoke-virtual {v0, v6}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v2

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move v6, v7

    move-object/from16 v7, p13

    .line 4
    invoke-static/range {v2 .. v7}, Lcom/google/protobuf/ArrayDecoders;->decodeGroupField(Lcom/google/protobuf/Schema;[BIIILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 5
    invoke-virtual {v12, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v2

    if-ne v2, v8, :cond_0

    .line 6
    invoke-virtual {v12, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v15

    goto :goto_0

    :cond_0
    const/4 v15, 0x0

    :goto_0
    if-nez v15, :cond_1

    .line 7
    iget-object v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_1

    .line 8
    :cond_1
    iget-object v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    .line 9
    invoke-static {v15, v2}, Lcom/google/protobuf/Internal;->mergeMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 10
    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 11
    :goto_1
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_a

    :pswitch_1
    if-nez v5, :cond_a

    .line 12
    invoke-static {v3, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 13
    iget-wide v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    invoke-static {v2, v3}, Lcom/google/protobuf/CodedInputStream;->decodeZigZag64(J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 14
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_a

    :pswitch_2
    if-nez v5, :cond_a

    .line 15
    invoke-static {v3, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 16
    iget v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    invoke-static {v2}, Lcom/google/protobuf/CodedInputStream;->decodeZigZag32(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 17
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_a

    :pswitch_3
    if-nez v5, :cond_a

    .line 18
    invoke-static {v3, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v3

    .line 19
    iget v4, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    .line 20
    iget-object v0, v0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    div-int/lit8 v5, v6, 0x3

    const/4 v6, 0x2

    mul-int/2addr v5, v6

    add-int/2addr v5, v7

    aget-object v0, v0, v5

    check-cast v0, Lcom/google/protobuf/Internal$EnumVerifier;

    if-eqz v0, :cond_3

    .line 21
    invoke-interface {v0, v4}, Lcom/google/protobuf/Internal$EnumVerifier;->isInRange(I)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    .line 22
    :cond_2
    invoke-static/range {p1 .. p1}, Lcom/google/protobuf/MessageSchema;->getMutableUnknownFields(Ljava/lang/Object;)Lcom/google/protobuf/UnknownFieldSetLite;

    move-result-object v0

    int-to-long v4, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/google/protobuf/UnknownFieldSetLite;->storeField(ILjava/lang/Object;)V

    goto :goto_3

    .line 23
    :cond_3
    :goto_2
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v12, v1, v9, v10, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 24
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :goto_3
    move v0, v3

    goto/16 :goto_a

    :pswitch_4
    const/4 v2, 0x2

    if-ne v5, v2, :cond_a

    .line 25
    invoke-static {v3, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeBytes([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 26
    iget-object v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 27
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_a

    :pswitch_5
    const/4 v2, 0x2

    if-ne v5, v2, :cond_a

    .line 28
    invoke-virtual {v0, v6}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v0

    move/from16 v2, p4

    .line 29
    invoke-static {v0, v3, v4, v2, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeMessageField(Lcom/google/protobuf/Schema;[BIILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 30
    invoke-virtual {v12, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v2

    if-ne v2, v8, :cond_4

    .line 31
    invoke-virtual {v12, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v15

    goto :goto_4

    :cond_4
    const/4 v15, 0x0

    :goto_4
    if-nez v15, :cond_5

    .line 32
    iget-object v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_5

    .line 33
    :cond_5
    iget-object v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    .line 34
    invoke-static {v15, v2}, Lcom/google/protobuf/Internal;->mergeMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 35
    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 36
    :goto_5
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_a

    :pswitch_6
    const/4 v0, 0x2

    if-ne v5, v0, :cond_a

    .line 37
    invoke-static {v3, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 38
    iget v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-nez v2, :cond_6

    const-string v2, ""

    .line 39
    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_7

    :cond_6
    const/high16 v4, 0x20000000

    and-int v4, p8, v4

    if-eqz v4, :cond_8

    add-int v4, v0, v2

    .line 40
    invoke-static {v3, v0, v4}, Lcom/google/protobuf/Utf8;->isValidUtf8([BII)Z

    move-result v4

    if-eqz v4, :cond_7

    goto :goto_6

    .line 41
    :cond_7
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->invalidUtf8()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    .line 42
    :cond_8
    :goto_6
    new-instance v4, Ljava/lang/String;

    sget-object v5, Lcom/google/protobuf/Internal;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v4, v3, v0, v2, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 43
    invoke-virtual {v12, v1, v9, v10, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/2addr v0, v2

    .line 44
    :goto_7
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_a

    :pswitch_7
    if-nez v5, :cond_a

    .line 45
    invoke-static {v3, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 46
    iget-wide v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_9

    goto :goto_8

    :cond_9
    const/4 v7, 0x0

    :goto_8
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 47
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_a

    :pswitch_8
    const/4 v0, 0x5

    if-ne v5, v0, :cond_a

    .line 48
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed32([BI)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v12, v1, v9, v10, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/lit8 v0, v4, 0x4

    .line 49
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_a

    :pswitch_9
    if-ne v5, v7, :cond_a

    .line 50
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed64([BI)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v12, v1, v9, v10, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/lit8 v0, v4, 0x8

    .line 51
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_a

    :pswitch_a
    if-nez v5, :cond_a

    .line 52
    invoke-static {v3, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 53
    iget v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 54
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_a

    :pswitch_b
    if-nez v5, :cond_a

    .line 55
    invoke-static {v3, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 56
    iget-wide v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v12, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 57
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_a

    :pswitch_c
    const/4 v0, 0x5

    if-ne v5, v0, :cond_a

    .line 58
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed32([BI)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    .line 59
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v12, v1, v9, v10, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/lit8 v0, v4, 0x4

    .line 60
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_a

    :pswitch_d
    if-ne v5, v7, :cond_a

    .line 61
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed64([BI)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    .line 62
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v12, v1, v9, v10, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/lit8 v0, v4, 0x8

    .line 63
    invoke-virtual {v12, v1, v13, v14, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_a

    :cond_a
    :goto_9
    move v0, v4

    :goto_a
    return v0

    :pswitch_data_0
    .packed-switch 0x33
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public parseProto2Message(Ljava/lang/Object;[BIIILcom/google/protobuf/ArrayDecoders$Registers;)I
    .locals 29
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BIII",
            "Lcom/google/protobuf/ArrayDecoders$Registers;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v15, p0

    move-object/from16 v14, p1

    move-object/from16 v12, p2

    move/from16 v13, p4

    move-object/from16 v11, p6

    .line 1
    sget-object v9, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    const/16 v16, 0x0

    move/from16 v0, p3

    move/from16 v1, p5

    move/from16 v3, v16

    move v4, v3

    move v8, v4

    const/4 v2, -0x1

    const/4 v7, -0x1

    :goto_0
    if-ge v0, v13, :cond_20

    add-int/lit8 v4, v0, 0x1

    .line 2
    aget-byte v0, v12, v0

    if-gez v0, :cond_0

    .line 3
    invoke-static {v0, v12, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32(I[BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 4
    iget v4, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    move v5, v4

    move v4, v0

    goto :goto_1

    :cond_0
    move v5, v0

    :goto_1
    ushr-int/lit8 v0, v5, 0x3

    and-int/lit8 v10, v5, 0x7

    const/4 v6, 0x3

    if-le v0, v2, :cond_2

    .line 5
    div-int/2addr v3, v6

    .line 6
    iget v2, v15, Lcom/google/protobuf/MessageSchema;->minFieldNumber:I

    if-lt v0, v2, :cond_1

    iget v2, v15, Lcom/google/protobuf/MessageSchema;->maxFieldNumber:I

    if-gt v0, v2, :cond_1

    .line 7
    invoke-virtual {v15, v0, v3}, Lcom/google/protobuf/MessageSchema;->slowPositionForFieldNumber(II)I

    move-result v2

    goto :goto_2

    :cond_1
    const/4 v2, -0x1

    const/4 v3, -0x1

    goto :goto_3

    .line 8
    :cond_2
    invoke-virtual {v15, v0}, Lcom/google/protobuf/MessageSchema;->positionForFieldNumber(I)I

    move-result v2

    :goto_2
    move v3, v2

    const/4 v2, -0x1

    :goto_3
    if-ne v3, v2, :cond_3

    move/from16 v17, v0

    move v6, v1

    move v2, v4

    move-object/from16 v27, v9

    move/from16 v19, v16

    const/4 v15, 0x0

    move v9, v5

    goto/16 :goto_1a

    .line 9
    :cond_3
    iget-object v1, v15, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v2, v3, 0x1

    aget v2, v1, v2

    .line 10
    invoke-static {v2}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result v1

    move/from16 v18, v7

    .line 11
    invoke-static {v2}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v6

    move/from16 v20, v5

    const/16 v5, 0x11

    move/from16 v21, v2

    if-gt v1, v5, :cond_13

    .line 12
    iget-object v5, v15, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v22, v3, 0x2

    aget v5, v5, v22

    ushr-int/lit8 v22, v5, 0x14

    const/4 v2, 0x1

    shl-int v22, v2, v22

    const v24, 0xfffff

    and-int v5, v5, v24

    move/from16 v2, v18

    if-eq v5, v2, :cond_5

    const/4 v13, -0x1

    if-eq v2, v13, :cond_4

    int-to-long v12, v2

    .line 13
    invoke-virtual {v9, v14, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :cond_4
    int-to-long v12, v5

    .line 14
    invoke-virtual {v9, v14, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v8

    move v12, v8

    move v8, v5

    goto :goto_4

    :cond_5
    move v12, v8

    move v8, v2

    :goto_4
    const/4 v2, 0x5

    packed-switch v1, :pswitch_data_0

    move-object/from16 v5, p2

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    :cond_6
    :goto_5
    const/16 v17, -0x1

    move/from16 v28, v4

    move v4, v3

    move/from16 v3, v28

    goto/16 :goto_14

    :pswitch_0
    const/4 v1, 0x3

    if-ne v10, v1, :cond_8

    shl-int/lit8 v1, v0, 0x3

    or-int/lit8 v5, v1, 0x4

    .line 15
    invoke-virtual {v15, v3}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v1

    move v13, v0

    move-object v0, v1

    move-object/from16 v1, p2

    move v2, v4

    move v10, v3

    move/from16 v3, p4

    move v4, v5

    move/from16 v18, v8

    move/from16 v8, v20

    move-object/from16 v5, p6

    .line 16
    invoke-static/range {v0 .. v5}, Lcom/google/protobuf/ArrayDecoders;->decodeGroupField(Lcom/google/protobuf/Schema;[BIIILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    and-int v1, v12, v22

    if-nez v1, :cond_7

    .line 17
    iget-object v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-virtual {v9, v14, v6, v7, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_6

    .line 18
    :cond_7
    invoke-virtual {v9, v14, v6, v7}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    .line 19
    invoke-static {v1, v2}, Lcom/google/protobuf/Internal;->mergeMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 20
    invoke-virtual {v9, v14, v6, v7, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :goto_6
    or-int v1, v12, v22

    move-object/from16 v5, p2

    move v4, v10

    goto/16 :goto_8

    :cond_8
    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    move-object/from16 v10, p2

    move v6, v3

    goto :goto_7

    :pswitch_1
    move v13, v0

    move v5, v3

    move/from16 v18, v8

    move/from16 v8, v20

    if-nez v10, :cond_9

    move-object/from16 v10, p2

    .line 21
    invoke-static {v10, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v19

    .line 22
    iget-wide v0, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    .line 23
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedInputStream;->decodeZigZag64(J)J

    move-result-wide v20

    move-object v0, v9

    move-object/from16 v1, p1

    move-wide v2, v6

    move v6, v5

    move-wide/from16 v4, v20

    .line 24
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move v7, v6

    move-object v6, v10

    const/16 v17, -0x1

    goto/16 :goto_f

    :cond_9
    move-object/from16 v10, p2

    move v6, v5

    :goto_7
    move v3, v6

    move-object v5, v10

    goto :goto_5

    :pswitch_2
    move-object/from16 v5, p2

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    if-nez v10, :cond_6

    .line 25
    invoke-static {v5, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 26
    iget v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    .line 27
    invoke-static {v1}, Lcom/google/protobuf/CodedInputStream;->decodeZigZag32(I)I

    move-result v1

    .line 28
    invoke-virtual {v9, v14, v6, v7, v1}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_a

    :pswitch_3
    move-object/from16 v5, p2

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    if-nez v10, :cond_6

    .line 29
    invoke-static {v5, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 30
    iget v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    .line 31
    invoke-virtual {v15, v3}, Lcom/google/protobuf/MessageSchema;->getEnumFieldVerifier(I)Lcom/google/protobuf/Internal$EnumVerifier;

    move-result-object v2

    if-eqz v2, :cond_b

    .line 32
    invoke-interface {v2, v1}, Lcom/google/protobuf/Internal$EnumVerifier;->isInRange(I)Z

    move-result v2

    if-eqz v2, :cond_a

    goto :goto_9

    .line 33
    :cond_a
    invoke-static/range {p1 .. p1}, Lcom/google/protobuf/MessageSchema;->getMutableUnknownFields(Ljava/lang/Object;)Lcom/google/protobuf/UnknownFieldSetLite;

    move-result-object v2

    int-to-long v6, v1

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v2, v8, v1}, Lcom/google/protobuf/UnknownFieldSetLite;->storeField(ILjava/lang/Object;)V

    move v4, v3

    move v1, v12

    :goto_8
    const/16 v17, -0x1

    goto/16 :goto_13

    .line 34
    :cond_b
    :goto_9
    invoke-virtual {v9, v14, v6, v7, v1}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_a

    :pswitch_4
    move-object/from16 v5, p2

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    const/4 v0, 0x2

    if-ne v10, v0, :cond_6

    .line 35
    invoke-static {v5, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeBytes([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 36
    iget-object v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-virtual {v9, v14, v6, v7, v1}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :goto_a
    move v4, v3

    const/16 v17, -0x1

    goto/16 :goto_12

    :pswitch_5
    move-object/from16 v5, p2

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    const/4 v0, 0x2

    if-ne v10, v0, :cond_d

    .line 37
    invoke-virtual {v15, v3}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v0

    move/from16 v1, p4

    const/16 v17, -0x1

    .line 38
    invoke-static {v0, v5, v4, v1, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeMessageField(Lcom/google/protobuf/Schema;[BIILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    and-int v2, v12, v22

    if-nez v2, :cond_c

    .line 39
    iget-object v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-virtual {v9, v14, v6, v7, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto/16 :goto_d

    .line 40
    :cond_c
    invoke-virtual {v9, v14, v6, v7}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    iget-object v4, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    .line 41
    invoke-static {v2, v4}, Lcom/google/protobuf/Internal;->mergeMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 42
    invoke-virtual {v9, v14, v6, v7, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto/16 :goto_d

    :cond_d
    move/from16 v1, p4

    const/16 v17, -0x1

    goto/16 :goto_e

    :pswitch_6
    move-object/from16 v5, p2

    move/from16 v1, p4

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    const/4 v0, 0x2

    const/16 v17, -0x1

    if-ne v10, v0, :cond_10

    const/high16 v0, 0x20000000

    and-int v0, v21, v0

    if-nez v0, :cond_e

    .line 43
    invoke-static {v5, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeString([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto :goto_b

    .line 44
    :cond_e
    invoke-static {v5, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeStringRequireUtf8([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 45
    :goto_b
    iget-object v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-virtual {v9, v14, v6, v7, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_d

    :pswitch_7
    move-object/from16 v5, p2

    move/from16 v1, p4

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    const/16 v17, -0x1

    if-nez v10, :cond_10

    .line 46
    invoke-static {v5, v4, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    move/from16 p3, v0

    .line 47
    iget-wide v0, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    const-wide/16 v19, 0x0

    cmp-long v0, v0, v19

    if-eqz v0, :cond_f

    const/4 v2, 0x1

    goto :goto_c

    :cond_f
    move/from16 v2, v16

    :goto_c
    invoke-static {v14, v6, v7, v2}, Lcom/google/protobuf/UnsafeUtil;->putBoolean(Ljava/lang/Object;JZ)V

    move/from16 v0, p3

    goto :goto_d

    :pswitch_8
    move-object/from16 v5, p2

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    const/16 v17, -0x1

    if-ne v10, v2, :cond_10

    .line 48
    invoke-static {v5, v4}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed32([BI)I

    move-result v0

    invoke-virtual {v9, v14, v6, v7, v0}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    add-int/lit8 v0, v4, 0x4

    :goto_d
    or-int v1, v12, v22

    move v7, v3

    move-object v6, v5

    goto/16 :goto_10

    :pswitch_9
    move-object/from16 v5, p2

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    const/4 v0, 0x1

    const/16 v17, -0x1

    if-ne v10, v0, :cond_10

    .line 49
    invoke-static {v5, v4}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed64([BI)J

    move-result-wide v19

    move-object v0, v9

    move-object/from16 v1, p1

    move v10, v3

    move-wide v2, v6

    move v7, v4

    move-object v6, v5

    move-wide/from16 v4, v19

    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object v5, v6

    move v3, v7

    move v4, v10

    goto/16 :goto_11

    :cond_10
    :goto_e
    move v10, v3

    move v7, v4

    move-object v6, v5

    move-object v5, v6

    move v3, v7

    move v4, v10

    goto/16 :goto_14

    :pswitch_a
    move v13, v0

    move v5, v3

    move v3, v4

    move/from16 v18, v8

    move/from16 v8, v20

    const/16 v17, -0x1

    move-object/from16 v4, p2

    if-nez v10, :cond_11

    .line 50
    invoke-static {v4, v3, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 51
    iget v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    invoke-virtual {v9, v14, v6, v7, v1}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    move/from16 v28, v5

    move-object v5, v4

    move/from16 v4, v28

    goto/16 :goto_12

    :pswitch_b
    move v13, v0

    move v5, v3

    move v3, v4

    move/from16 v18, v8

    move/from16 v8, v20

    const/16 v17, -0x1

    move-object/from16 v4, p2

    if-nez v10, :cond_11

    .line 52
    invoke-static {v4, v3, v11}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v19

    .line 53
    iget-wide v2, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    move-object v0, v9

    move-object/from16 v1, p1

    move-wide/from16 v20, v2

    move-wide v2, v6

    move-object v6, v4

    move v7, v5

    move-wide/from16 v4, v20

    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    :goto_f
    or-int v0, v12, v22

    move v1, v0

    move/from16 v0, v19

    :goto_10
    move-object v12, v6

    move v3, v7

    move v4, v8

    move v2, v13

    move/from16 v7, v18

    move/from16 v13, p4

    move v8, v1

    move/from16 v1, p5

    goto/16 :goto_0

    :cond_11
    move/from16 v28, v5

    move-object v5, v4

    move/from16 v4, v28

    goto :goto_14

    :pswitch_c
    move-object/from16 v5, p2

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    const/16 v17, -0x1

    move/from16 v28, v4

    move v4, v3

    move/from16 v3, v28

    if-ne v10, v2, :cond_12

    .line 54
    invoke-static {v5, v3}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed32([BI)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    .line 55
    invoke-static {v14, v6, v7, v0}, Lcom/google/protobuf/UnsafeUtil;->putFloat(Ljava/lang/Object;JF)V

    add-int/lit8 v0, v3, 0x4

    goto :goto_12

    :pswitch_d
    move-object/from16 v5, p2

    move v13, v0

    move/from16 v18, v8

    move/from16 v8, v20

    const/4 v0, 0x1

    const/16 v17, -0x1

    move/from16 v28, v4

    move v4, v3

    move/from16 v3, v28

    if-ne v10, v0, :cond_12

    .line 56
    invoke-static {v5, v3}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed64([BI)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    .line 57
    invoke-static {v14, v6, v7, v0, v1}, Lcom/google/protobuf/UnsafeUtil;->putDouble(Ljava/lang/Object;JD)V

    :goto_11
    add-int/lit8 v0, v3, 0x8

    :goto_12
    or-int v1, v12, v22

    :goto_13
    move v12, v1

    move/from16 v19, v4

    goto/16 :goto_16

    :cond_12
    :goto_14
    move/from16 v6, p5

    move v2, v3

    move/from16 v19, v4

    move-object/from16 v27, v9

    move/from16 v17, v13

    move/from16 v7, v18

    const/4 v15, 0x0

    move v9, v8

    move v8, v12

    goto/16 :goto_1a

    :cond_13
    move v13, v0

    move-object v5, v12

    move/from16 v2, v18

    const/16 v17, -0x1

    move v12, v8

    move/from16 v8, v20

    move/from16 v28, v4

    move v4, v3

    move/from16 v3, v28

    const/16 v0, 0x1b

    if-ne v1, v0, :cond_17

    const/4 v0, 0x2

    if-ne v10, v0, :cond_16

    .line 58
    invoke-virtual {v9, v14, v6, v7}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Internal$ProtobufList;

    .line 59
    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_15

    .line 60
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_14

    const/16 v1, 0xa

    goto :goto_15

    :cond_14
    mul-int/lit8 v1, v1, 0x2

    .line 61
    :goto_15
    invoke-interface {v0, v1}, Lcom/google/protobuf/Internal$ProtobufList;->mutableCopyWithCapacity(I)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    .line 62
    invoke-virtual {v9, v14, v6, v7, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_15
    move-object v6, v0

    .line 63
    invoke-virtual {v15, v4}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v0

    move v1, v8

    move/from16 v18, v2

    move-object/from16 v2, p2

    move/from16 v19, v4

    move/from16 v4, p4

    move-object v5, v6

    move-object/from16 v6, p6

    .line 64
    invoke-static/range {v0 .. v6}, Lcom/google/protobuf/ArrayDecoders;->decodeMessageList(Lcom/google/protobuf/Schema;I[BIILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    :goto_16
    move/from16 v7, v18

    move/from16 v1, p5

    move v4, v8

    move v8, v12

    move v2, v13

    move/from16 v3, v19

    goto/16 :goto_1e

    :cond_16
    move/from16 v19, v4

    move/from16 v18, v2

    move v14, v3

    move/from16 p3, v8

    move-object/from16 v27, v9

    move/from16 v26, v12

    move/from16 v17, v13

    const/4 v15, 0x0

    goto/16 :goto_17

    :cond_17
    move/from16 v18, v2

    move/from16 v19, v4

    const/16 v0, 0x31

    if-gt v1, v0, :cond_18

    move/from16 v2, v21

    int-to-long v4, v2

    move-object/from16 v0, p0

    move v2, v1

    move-object/from16 v1, p1

    move/from16 v20, v2

    move-object/from16 v2, p2

    move/from16 v21, v3

    move-wide/from16 v22, v4

    move/from16 v4, p4

    move v5, v8

    move-wide/from16 v24, v6

    const/4 v7, 0x0

    move v6, v13

    move-object v15, v7

    move v7, v10

    move/from16 v26, v12

    move v12, v8

    move/from16 v8, v19

    move-object/from16 v27, v9

    move-wide/from16 v9, v22

    move/from16 v11, v20

    move/from16 p3, v12

    move/from16 v17, v13

    move-wide/from16 v12, v24

    move-object/from16 v14, p6

    .line 65
    invoke-virtual/range {v0 .. v14}, Lcom/google/protobuf/MessageSchema;->parseRepeatedField(Ljava/lang/Object;[BIIIIIIJIJLcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    move/from16 v14, v21

    if-eq v0, v14, :cond_1b

    goto :goto_18

    :cond_18
    move/from16 v20, v1

    move v14, v3

    move-wide/from16 v24, v6

    move/from16 p3, v8

    move-object/from16 v27, v9

    move/from16 v26, v12

    move/from16 v17, v13

    move/from16 v2, v21

    const/4 v15, 0x0

    const/16 v0, 0x32

    move/from16 v9, v20

    if-ne v9, v0, :cond_1a

    const/4 v0, 0x2

    if-eq v10, v0, :cond_19

    :goto_17
    move/from16 v9, p3

    move/from16 v6, p5

    move v2, v14

    goto :goto_19

    :cond_19
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move v3, v14

    move/from16 v4, p4

    move/from16 v5, v19

    move-wide/from16 v6, v24

    move-object/from16 v8, p6

    .line 66
    invoke-virtual/range {v0 .. v8}, Lcom/google/protobuf/MessageSchema;->parseMapField(Ljava/lang/Object;[BIIIJLcom/google/protobuf/ArrayDecoders$Registers;)I

    throw v15

    :cond_1a
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v8, v2

    move-object/from16 v2, p2

    move v3, v14

    move/from16 v4, p4

    move/from16 v5, p3

    move/from16 v6, v17

    move v7, v10

    move-wide/from16 v10, v24

    move/from16 v12, v19

    move-object/from16 v13, p6

    .line 67
    invoke-virtual/range {v0 .. v13}, Lcom/google/protobuf/MessageSchema;->parseOneofField(Ljava/lang/Object;[BIIIIIIIJILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    if-eq v0, v14, :cond_1b

    :goto_18
    move-object/from16 v10, p0

    move-object/from16 v13, p1

    move/from16 v9, p3

    move/from16 v1, p5

    move-object/from16 v11, p6

    move/from16 v12, v17

    move/from16 v7, v18

    move/from16 v3, v19

    move/from16 v8, v26

    goto/16 :goto_1d

    :cond_1b
    move/from16 v9, p3

    move/from16 v6, p5

    move v2, v0

    :goto_19
    move/from16 v7, v18

    move/from16 v8, v26

    :goto_1a
    if-ne v9, v6, :cond_1c

    if-eqz v6, :cond_1c

    move-object/from16 v10, p0

    move-object/from16 v13, p1

    move v0, v2

    move v1, v6

    move v4, v9

    move-object v3, v15

    goto/16 :goto_1f

    :cond_1c
    move-object/from16 v10, p0

    move-object v3, v15

    .line 68
    iget-boolean v0, v10, Lcom/google/protobuf/MessageSchema;->hasExtensions:Z

    if-eqz v0, :cond_1f

    move-object/from16 v11, p6

    iget-object v0, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->extensionRegistry:Lcom/google/protobuf/ExtensionRegistryLite;

    .line 69
    invoke-static {}, Lcom/google/protobuf/ExtensionRegistryLite;->getEmptyRegistry()Lcom/google/protobuf/ExtensionRegistryLite;

    move-result-object v1

    if-eq v0, v1, :cond_1e

    .line 70
    iget-object v0, v10, Lcom/google/protobuf/MessageSchema;->defaultInstance:Lcom/google/protobuf/MessageLite;

    .line 71
    iget-object v1, v11, Lcom/google/protobuf/ArrayDecoders$Registers;->extensionRegistry:Lcom/google/protobuf/ExtensionRegistryLite;

    .line 72
    iget-object v1, v1, Lcom/google/protobuf/ExtensionRegistryLite;->extensionsByNumber:Ljava/util/Map;

    new-instance v4, Lcom/google/protobuf/ExtensionRegistryLite$ObjectIntPair;

    move/from16 v12, v17

    invoke-direct {v4, v0, v12}, Lcom/google/protobuf/ExtensionRegistryLite$ObjectIntPair;-><init>(Ljava/lang/Object;I)V

    .line 73
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/GeneratedMessageLite$GeneratedExtension;

    if-nez v0, :cond_1d

    .line 74
    invoke-static/range {p1 .. p1}, Lcom/google/protobuf/MessageSchema;->getMutableUnknownFields(Ljava/lang/Object;)Lcom/google/protobuf/UnknownFieldSetLite;

    move-result-object v4

    move v0, v9

    move-object/from16 v1, p2

    move/from16 v3, p4

    move-object/from16 v5, p6

    .line 75
    invoke-static/range {v0 .. v5}, Lcom/google/protobuf/ArrayDecoders;->decodeUnknownField(I[BIILcom/google/protobuf/UnknownFieldSetLite;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    move-object/from16 v13, p1

    goto :goto_1c

    :cond_1d
    move-object/from16 v13, p1

    .line 76
    move-object v0, v13

    check-cast v0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->ensureExtensionsAreMutable()Lcom/google/protobuf/FieldSet;

    .line 77
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw v3

    :cond_1e
    move-object/from16 v13, p1

    goto :goto_1b

    :cond_1f
    move-object/from16 v13, p1

    move-object/from16 v11, p6

    :goto_1b
    move/from16 v12, v17

    .line 78
    invoke-static/range {p1 .. p1}, Lcom/google/protobuf/MessageSchema;->getMutableUnknownFields(Ljava/lang/Object;)Lcom/google/protobuf/UnknownFieldSetLite;

    move-result-object v4

    move v0, v9

    move-object/from16 v1, p2

    move/from16 v3, p4

    move-object/from16 v5, p6

    .line 79
    invoke-static/range {v0 .. v5}, Lcom/google/protobuf/ArrayDecoders;->decodeUnknownField(I[BIILcom/google/protobuf/UnknownFieldSetLite;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    :goto_1c
    move v1, v6

    move/from16 v3, v19

    :goto_1d
    move v4, v9

    move-object v15, v10

    move v2, v12

    move-object v14, v13

    move-object/from16 v9, v27

    :goto_1e
    move-object/from16 v12, p2

    move/from16 v13, p4

    goto/16 :goto_0

    :cond_20
    move/from16 v18, v7

    move/from16 v26, v8

    move-object/from16 v27, v9

    move-object v13, v14

    move-object v10, v15

    const/4 v3, 0x0

    :goto_1f
    const/4 v2, -0x1

    if-eq v7, v2, :cond_21

    int-to-long v5, v7

    move-object/from16 v2, v27

    .line 80
    invoke-virtual {v2, v13, v5, v6, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 81
    :cond_21
    iget v2, v10, Lcom/google/protobuf/MessageSchema;->checkInitializedCount:I

    :goto_20
    iget v5, v10, Lcom/google/protobuf/MessageSchema;->repeatedFieldOffsetStart:I

    if-ge v2, v5, :cond_22

    .line 82
    iget-object v5, v10, Lcom/google/protobuf/MessageSchema;->intArray:[I

    aget v5, v5, v2

    iget-object v6, v10, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    .line 83
    invoke-virtual {v10, v13, v5, v3, v6}, Lcom/google/protobuf/MessageSchema;->filterMapUnknownEnumValues(Ljava/lang/Object;ILjava/lang/Object;Lcom/google/protobuf/UnknownFieldSchema;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    :cond_22
    if-nez v1, :cond_24

    move/from16 v2, p4

    if-ne v0, v2, :cond_23

    goto :goto_21

    .line 84
    :cond_23
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->parseFailure()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :cond_24
    move/from16 v2, p4

    if-gt v0, v2, :cond_25

    if-ne v4, v1, :cond_25

    :goto_21
    return v0

    .line 85
    :cond_25
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->parseFailure()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final parseRepeatedField(Ljava/lang/Object;[BIIIIIIJIJLcom/google/protobuf/ArrayDecoders$Registers;)I
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BIIIIIIJIJ",
            "Lcom/google/protobuf/ArrayDecoders$Registers;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v2, p5

    move/from16 v6, p7

    move/from16 v8, p8

    move-wide/from16 v9, p12

    move-object/from16 v7, p14

    .line 1
    sget-object v11, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    invoke-virtual {v11, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/protobuf/Internal$ProtobufList;

    .line 2
    invoke-interface {v12}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v13

    const/4 v14, 0x2

    if-nez v13, :cond_1

    .line 3
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v13

    if-nez v13, :cond_0

    const/16 v13, 0xa

    goto :goto_0

    :cond_0
    mul-int/2addr v13, v14

    .line 4
    :goto_0
    invoke-interface {v12, v13}, Lcom/google/protobuf/Internal$ProtobufList;->mutableCopyWithCapacity(I)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v12

    .line 5
    invoke-virtual {v11, v1, v9, v10, v12}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_1
    const-wide/16 v9, 0x0

    const/4 v11, 0x5

    const/4 v13, 0x1

    const/4 v15, 0x3

    packed-switch p11, :pswitch_data_0

    goto/16 :goto_13

    :pswitch_0
    if-ne v6, v15, :cond_2d

    .line 6
    invoke-virtual {v0, v8}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v0

    and-int/lit8 v1, v2, -0x8

    or-int/lit8 v1, v1, 0x4

    move-object/from16 p6, v0

    move-object/from16 p7, p2

    move/from16 p8, p3

    move/from16 p9, p4

    move/from16 p10, v1

    move-object/from16 p11, p14

    .line 7
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/ArrayDecoders;->decodeGroupField(Lcom/google/protobuf/Schema;[BIIILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v4

    .line 8
    iget-object v6, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-interface {v12, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    if-ge v4, v5, :cond_2d

    .line 9
    invoke-static {v3, v4, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v6

    .line 10
    iget v8, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v8, :cond_2

    goto/16 :goto_13

    :cond_2
    move-object/from16 p6, v0

    move-object/from16 p7, p2

    move/from16 p8, v6

    move/from16 p9, p4

    move/from16 p10, v1

    move-object/from16 p11, p14

    .line 11
    invoke-static/range {p6 .. p11}, Lcom/google/protobuf/ArrayDecoders;->decodeGroupField(Lcom/google/protobuf/Schema;[BIIILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v4

    .line 12
    iget-object v6, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->object1:Ljava/lang/Object;

    invoke-interface {v12, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :pswitch_1
    if-ne v6, v14, :cond_3

    .line 13
    invoke-static {v3, v4, v12, v7}, Lcom/google/protobuf/ArrayDecoders;->decodePackedSInt64List([BILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto/16 :goto_14

    :cond_3
    if-nez v6, :cond_2d

    .line 14
    check-cast v12, Lcom/google/protobuf/LongArrayList;

    .line 15
    invoke-static {v3, v4, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 16
    iget-wide v8, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    invoke-static {v8, v9}, Lcom/google/protobuf/CodedInputStream;->decodeZigZag64(J)J

    move-result-wide v8

    .line 17
    iget v1, v12, Lcom/google/protobuf/LongArrayList;->size:I

    invoke-virtual {v12, v1, v8, v9}, Lcom/google/protobuf/LongArrayList;->addLong(IJ)V

    :goto_2
    if-ge v0, v5, :cond_2e

    .line 18
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v1

    .line 19
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v4, :cond_4

    goto/16 :goto_14

    .line 20
    :cond_4
    invoke-static {v3, v1, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 21
    iget-wide v8, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    invoke-static {v8, v9}, Lcom/google/protobuf/CodedInputStream;->decodeZigZag64(J)J

    move-result-wide v8

    .line 22
    iget v1, v12, Lcom/google/protobuf/LongArrayList;->size:I

    invoke-virtual {v12, v1, v8, v9}, Lcom/google/protobuf/LongArrayList;->addLong(IJ)V

    goto :goto_2

    :pswitch_2
    if-ne v6, v14, :cond_5

    .line 23
    invoke-static {v3, v4, v12, v7}, Lcom/google/protobuf/ArrayDecoders;->decodePackedSInt32List([BILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto/16 :goto_14

    :cond_5
    if-nez v6, :cond_2d

    .line 24
    check-cast v12, Lcom/google/protobuf/IntArrayList;

    .line 25
    invoke-static {v3, v4, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 26
    iget v1, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    invoke-static {v1}, Lcom/google/protobuf/CodedInputStream;->decodeZigZag32(I)I

    move-result v1

    .line 27
    iget v4, v12, Lcom/google/protobuf/IntArrayList;->size:I

    invoke-virtual {v12, v4, v1}, Lcom/google/protobuf/IntArrayList;->addInt(II)V

    :goto_3
    if-ge v0, v5, :cond_2e

    .line 28
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v1

    .line 29
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v4, :cond_6

    goto/16 :goto_14

    .line 30
    :cond_6
    invoke-static {v3, v1, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 31
    iget v1, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    invoke-static {v1}, Lcom/google/protobuf/CodedInputStream;->decodeZigZag32(I)I

    move-result v1

    .line 32
    iget v4, v12, Lcom/google/protobuf/IntArrayList;->size:I

    invoke-virtual {v12, v4, v1}, Lcom/google/protobuf/IntArrayList;->addInt(II)V

    goto :goto_3

    :pswitch_3
    if-ne v6, v14, :cond_7

    .line 33
    invoke-static {v3, v4, v12, v7}, Lcom/google/protobuf/ArrayDecoders;->decodePackedVarint32List([BILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v2

    goto :goto_4

    :cond_7
    if-nez v6, :cond_2d

    move/from16 v2, p5

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move-object v6, v12

    move-object/from16 v7, p14

    .line 34
    invoke-static/range {v2 .. v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32List(I[BIILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v2

    .line 35
    :goto_4
    check-cast v1, Lcom/google/protobuf/GeneratedMessageLite;

    iget-object v3, v1, Lcom/google/protobuf/GeneratedMessageLite;->unknownFields:Lcom/google/protobuf/UnknownFieldSetLite;

    .line 36
    sget-object v4, Lcom/google/protobuf/UnknownFieldSetLite;->DEFAULT_INSTANCE:Lcom/google/protobuf/UnknownFieldSetLite;

    if-ne v3, v4, :cond_8

    const/4 v3, 0x0

    .line 37
    :cond_8
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    div-int/lit8 v5, v8, 0x3

    mul-int/2addr v5, v14

    add-int/2addr v5, v13

    aget-object v4, v4, v5

    check-cast v4, Lcom/google/protobuf/Internal$EnumVerifier;

    .line 38
    iget-object v0, v0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    move/from16 v5, p6

    .line 39
    invoke-static {v5, v12, v4, v3, v0}, Lcom/google/protobuf/SchemaUtil;->filterUnknownEnumList(ILjava/util/List;Lcom/google/protobuf/Internal$EnumVerifier;Ljava/lang/Object;Lcom/google/protobuf/UnknownFieldSchema;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/UnknownFieldSetLite;

    if-eqz v0, :cond_9

    .line 40
    iput-object v0, v1, Lcom/google/protobuf/GeneratedMessageLite;->unknownFields:Lcom/google/protobuf/UnknownFieldSetLite;

    :cond_9
    move v0, v2

    goto/16 :goto_14

    :pswitch_4
    if-ne v6, v14, :cond_2d

    .line 41
    invoke-static {v3, v4, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 42
    iget v1, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-ltz v1, :cond_10

    .line 43
    array-length v4, v3

    sub-int/2addr v4, v0

    if-gt v1, v4, :cond_f

    if-nez v1, :cond_a

    .line 44
    sget-object v1, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 45
    :cond_a
    invoke-static {v3, v0, v1}, Lcom/google/protobuf/ByteString;->copyFrom([BII)Lcom/google/protobuf/ByteString;

    move-result-object v4

    invoke-interface {v12, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_5
    add-int/2addr v0, v1

    :goto_6
    if-ge v0, v5, :cond_2e

    .line 46
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v1

    .line 47
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v4, :cond_b

    goto/16 :goto_14

    .line 48
    :cond_b
    invoke-static {v3, v1, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 49
    iget v1, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-ltz v1, :cond_e

    .line 50
    array-length v4, v3

    sub-int/2addr v4, v0

    if-gt v1, v4, :cond_d

    if-nez v1, :cond_c

    .line 51
    sget-object v1, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 52
    :cond_c
    invoke-static {v3, v0, v1}, Lcom/google/protobuf/ByteString;->copyFrom([BII)Lcom/google/protobuf/ByteString;

    move-result-object v4

    invoke-interface {v12, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 53
    :cond_d
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->truncatedMessage()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    .line 54
    :cond_e
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->negativeSize()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    .line 55
    :cond_f
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->truncatedMessage()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    .line 56
    :cond_10
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->negativeSize()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :pswitch_5
    if-ne v6, v14, :cond_2d

    .line 57
    invoke-virtual {v0, v8}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v0

    move-object/from16 p6, v0

    move/from16 p7, p5

    move-object/from16 p8, p2

    move/from16 p9, p3

    move/from16 p10, p4

    move-object/from16 p11, v12

    move-object/from16 p12, p14

    .line 58
    invoke-static/range {p6 .. p12}, Lcom/google/protobuf/ArrayDecoders;->decodeMessageList(Lcom/google/protobuf/Schema;I[BIILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto/16 :goto_14

    :pswitch_6
    if-ne v6, v14, :cond_2d

    const-wide/32 v0, 0x20000000

    and-long v0, p9, v0

    cmp-long v0, v0, v9

    const-string v1, ""

    if-nez v0, :cond_16

    .line 59
    invoke-static {v3, v4, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 60
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-ltz v4, :cond_15

    if-nez v4, :cond_11

    .line 61
    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 62
    :cond_11
    new-instance v6, Ljava/lang/String;

    sget-object v8, Lcom/google/protobuf/Internal;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v6, v3, v0, v4, v8}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 63
    invoke-interface {v12, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_7
    add-int/2addr v0, v4

    :goto_8
    if-ge v0, v5, :cond_2e

    .line 64
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v4

    .line 65
    iget v6, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v6, :cond_12

    goto/16 :goto_14

    .line 66
    :cond_12
    invoke-static {v3, v4, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 67
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-ltz v4, :cond_14

    if-nez v4, :cond_13

    .line 68
    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 69
    :cond_13
    new-instance v6, Ljava/lang/String;

    sget-object v8, Lcom/google/protobuf/Internal;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v6, v3, v0, v4, v8}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 70
    invoke-interface {v12, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 71
    :cond_14
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->negativeSize()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    .line 72
    :cond_15
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->negativeSize()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    .line 73
    :cond_16
    invoke-static {v3, v4, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 74
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-ltz v4, :cond_1d

    if-nez v4, :cond_17

    .line 75
    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :cond_17
    add-int v6, v0, v4

    .line 76
    invoke-static {v3, v0, v6}, Lcom/google/protobuf/Utf8;->isValidUtf8([BII)Z

    move-result v8

    if-eqz v8, :cond_1c

    .line 77
    new-instance v8, Ljava/lang/String;

    sget-object v9, Lcom/google/protobuf/Internal;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v8, v3, v0, v4, v9}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 78
    invoke-interface {v12, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_9
    move v0, v6

    :goto_a
    if-ge v0, v5, :cond_2e

    .line 79
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v4

    .line 80
    iget v6, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v6, :cond_18

    goto/16 :goto_14

    .line 81
    :cond_18
    invoke-static {v3, v4, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 82
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-ltz v4, :cond_1b

    if-nez v4, :cond_19

    .line 83
    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :cond_19
    add-int v6, v0, v4

    .line 84
    invoke-static {v3, v0, v6}, Lcom/google/protobuf/Utf8;->isValidUtf8([BII)Z

    move-result v8

    if-eqz v8, :cond_1a

    .line 85
    new-instance v8, Ljava/lang/String;

    sget-object v9, Lcom/google/protobuf/Internal;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v8, v3, v0, v4, v9}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 86
    invoke-interface {v12, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 87
    :cond_1a
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->invalidUtf8()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    .line 88
    :cond_1b
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->negativeSize()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    .line 89
    :cond_1c
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->invalidUtf8()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    .line 90
    :cond_1d
    invoke-static {}, Lcom/google/protobuf/InvalidProtocolBufferException;->negativeSize()Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :pswitch_7
    if-ne v6, v14, :cond_1e

    .line 91
    invoke-static {v3, v4, v12, v7}, Lcom/google/protobuf/ArrayDecoders;->decodePackedBoolList([BILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto/16 :goto_14

    :cond_1e
    if-nez v6, :cond_2d

    .line 92
    check-cast v12, Lcom/google/protobuf/BooleanArrayList;

    .line 93
    invoke-static {v3, v4, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 94
    iget-wide v14, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    cmp-long v1, v14, v9

    const/4 v4, 0x0

    if-eqz v1, :cond_1f

    move v1, v13

    goto :goto_b

    :cond_1f
    move v1, v4

    .line 95
    :goto_b
    iget v6, v12, Lcom/google/protobuf/BooleanArrayList;->size:I

    invoke-virtual {v12, v6, v1}, Lcom/google/protobuf/BooleanArrayList;->addBoolean(IZ)V

    :goto_c
    if-ge v0, v5, :cond_2e

    .line 96
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v1

    .line 97
    iget v6, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v6, :cond_20

    goto/16 :goto_14

    .line 98
    :cond_20
    invoke-static {v3, v1, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 99
    iget-wide v14, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    cmp-long v1, v14, v9

    if-eqz v1, :cond_21

    move v1, v13

    goto :goto_d

    :cond_21
    move v1, v4

    .line 100
    :goto_d
    iget v6, v12, Lcom/google/protobuf/BooleanArrayList;->size:I

    invoke-virtual {v12, v6, v1}, Lcom/google/protobuf/BooleanArrayList;->addBoolean(IZ)V

    goto :goto_c

    :pswitch_8
    if-ne v6, v14, :cond_22

    .line 101
    invoke-static {v3, v4, v12, v7}, Lcom/google/protobuf/ArrayDecoders;->decodePackedFixed32List([BILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto/16 :goto_14

    :cond_22
    if-ne v6, v11, :cond_2d

    .line 102
    check-cast v12, Lcom/google/protobuf/IntArrayList;

    .line 103
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed32([BI)I

    move-result v0

    .line 104
    iget v1, v12, Lcom/google/protobuf/IntArrayList;->size:I

    invoke-virtual {v12, v1, v0}, Lcom/google/protobuf/IntArrayList;->addInt(II)V

    add-int/lit8 v0, v4, 0x4

    :goto_e
    if-ge v0, v5, :cond_2e

    .line 105
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v1

    .line 106
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v4, :cond_23

    goto/16 :goto_14

    .line 107
    :cond_23
    invoke-static {v3, v1}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed32([BI)I

    move-result v0

    .line 108
    iget v4, v12, Lcom/google/protobuf/IntArrayList;->size:I

    invoke-virtual {v12, v4, v0}, Lcom/google/protobuf/IntArrayList;->addInt(II)V

    add-int/lit8 v0, v1, 0x4

    goto :goto_e

    :pswitch_9
    if-ne v6, v14, :cond_24

    .line 109
    invoke-static {v3, v4, v12, v7}, Lcom/google/protobuf/ArrayDecoders;->decodePackedFixed64List([BILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto/16 :goto_14

    :cond_24
    if-ne v6, v13, :cond_2d

    .line 110
    check-cast v12, Lcom/google/protobuf/LongArrayList;

    .line 111
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed64([BI)J

    move-result-wide v0

    .line 112
    iget v6, v12, Lcom/google/protobuf/LongArrayList;->size:I

    invoke-virtual {v12, v6, v0, v1}, Lcom/google/protobuf/LongArrayList;->addLong(IJ)V

    add-int/lit8 v0, v4, 0x8

    :goto_f
    if-ge v0, v5, :cond_2e

    .line 113
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v1

    .line 114
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v4, :cond_25

    goto/16 :goto_14

    .line 115
    :cond_25
    invoke-static {v3, v1}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed64([BI)J

    move-result-wide v8

    .line 116
    iget v0, v12, Lcom/google/protobuf/LongArrayList;->size:I

    invoke-virtual {v12, v0, v8, v9}, Lcom/google/protobuf/LongArrayList;->addLong(IJ)V

    add-int/lit8 v0, v1, 0x8

    goto :goto_f

    :pswitch_a
    if-ne v6, v14, :cond_26

    .line 117
    invoke-static {v3, v4, v12, v7}, Lcom/google/protobuf/ArrayDecoders;->decodePackedVarint32List([BILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto/16 :goto_14

    :cond_26
    if-nez v6, :cond_2d

    move-object/from16 p6, p2

    move/from16 p7, p3

    move/from16 p8, p4

    move-object/from16 p9, v12

    move-object/from16 p10, p14

    .line 118
    invoke-static/range {p5 .. p10}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32List(I[BIILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto/16 :goto_14

    :pswitch_b
    if-ne v6, v14, :cond_27

    .line 119
    invoke-static {v3, v4, v12, v7}, Lcom/google/protobuf/ArrayDecoders;->decodePackedVarint64List([BILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto/16 :goto_14

    :cond_27
    if-nez v6, :cond_2d

    .line 120
    check-cast v12, Lcom/google/protobuf/LongArrayList;

    .line 121
    invoke-static {v3, v4, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 122
    iget-wide v8, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    .line 123
    iget v1, v12, Lcom/google/protobuf/LongArrayList;->size:I

    invoke-virtual {v12, v1, v8, v9}, Lcom/google/protobuf/LongArrayList;->addLong(IJ)V

    :goto_10
    if-ge v0, v5, :cond_2e

    .line 124
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v1

    .line 125
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v4, :cond_28

    goto/16 :goto_14

    .line 126
    :cond_28
    invoke-static {v3, v1, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint64([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    .line 127
    iget-wide v8, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->long1:J

    .line 128
    iget v1, v12, Lcom/google/protobuf/LongArrayList;->size:I

    invoke-virtual {v12, v1, v8, v9}, Lcom/google/protobuf/LongArrayList;->addLong(IJ)V

    goto :goto_10

    :pswitch_c
    if-ne v6, v14, :cond_29

    .line 129
    invoke-static {v3, v4, v12, v7}, Lcom/google/protobuf/ArrayDecoders;->decodePackedFloatList([BILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto :goto_14

    :cond_29
    if-ne v6, v11, :cond_2d

    .line 130
    check-cast v12, Lcom/google/protobuf/FloatArrayList;

    .line 131
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed32([BI)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    .line 132
    iget v1, v12, Lcom/google/protobuf/FloatArrayList;->size:I

    invoke-virtual {v12, v1, v0}, Lcom/google/protobuf/FloatArrayList;->addFloat(IF)V

    add-int/lit8 v0, v4, 0x4

    :goto_11
    if-ge v0, v5, :cond_2e

    .line 133
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v1

    .line 134
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v4, :cond_2a

    goto :goto_14

    .line 135
    :cond_2a
    invoke-static {v3, v1}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed32([BI)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    .line 136
    iget v4, v12, Lcom/google/protobuf/FloatArrayList;->size:I

    invoke-virtual {v12, v4, v0}, Lcom/google/protobuf/FloatArrayList;->addFloat(IF)V

    add-int/lit8 v0, v1, 0x4

    goto :goto_11

    :pswitch_d
    if-ne v6, v14, :cond_2b

    .line 137
    invoke-static {v3, v4, v12, v7}, Lcom/google/protobuf/ArrayDecoders;->decodePackedDoubleList([BILcom/google/protobuf/Internal$ProtobufList;Lcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v0

    goto :goto_14

    :cond_2b
    if-ne v6, v13, :cond_2d

    .line 138
    check-cast v12, Lcom/google/protobuf/DoubleArrayList;

    .line 139
    invoke-static/range {p2 .. p3}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed64([BI)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    .line 140
    iget v6, v12, Lcom/google/protobuf/DoubleArrayList;->size:I

    invoke-virtual {v12, v6, v0, v1}, Lcom/google/protobuf/DoubleArrayList;->addDouble(ID)V

    add-int/lit8 v0, v4, 0x8

    :goto_12
    if-ge v0, v5, :cond_2e

    .line 141
    invoke-static {v3, v0, v7}, Lcom/google/protobuf/ArrayDecoders;->decodeVarint32([BILcom/google/protobuf/ArrayDecoders$Registers;)I

    move-result v1

    .line 142
    iget v4, v7, Lcom/google/protobuf/ArrayDecoders$Registers;->int1:I

    if-eq v2, v4, :cond_2c

    goto :goto_14

    .line 143
    :cond_2c
    invoke-static {v3, v1}, Lcom/google/protobuf/ArrayDecoders;->decodeFixed64([BI)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v8

    .line 144
    iget v0, v12, Lcom/google/protobuf/DoubleArrayList;->size:I

    invoke-virtual {v12, v0, v8, v9}, Lcom/google/protobuf/DoubleArrayList;->addDouble(ID)V

    add-int/lit8 v0, v1, 0x8

    goto :goto_12

    :cond_2d
    :goto_13
    move v0, v4

    :cond_2e
    :goto_14
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x12
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final positionForFieldNumber(I)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/protobuf/MessageSchema;->minFieldNumber:I

    if-lt p1, v0, :cond_0

    iget v0, p0, Lcom/google/protobuf/MessageSchema;->maxFieldNumber:I

    if-gt p1, v0, :cond_0

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/MessageSchema;->slowPositionForFieldNumber(II)I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public final setFieldPresent(Ljava/lang/Object;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/protobuf/MessageSchema;->proto3:Z

    if-eqz v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 p2, p2, 0x2

    aget p0, p0, p2

    const/4 p2, 0x1

    ushr-int/lit8 v0, p0, 0x14

    shl-int/2addr p2, v0

    const v0, 0xfffff

    and-int/2addr p0, v0

    int-to-long v0, p0

    .line 3
    invoke-static {p1, v0, v1}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result p0

    or-int/2addr p0, p2

    .line 4
    invoke-static {p1, v0, v1, p0}, Lcom/google/protobuf/UnsafeUtil;->putInt(Ljava/lang/Object;JI)V

    return-void
.end method

.method public final setOneofPresent(Ljava/lang/Object;II)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 p3, p3, 0x2

    aget p0, p0, p3

    const p3, 0xfffff

    and-int/2addr p0, p3

    int-to-long v0, p0

    .line 2
    invoke-static {p1, v0, v1, p2}, Lcom/google/protobuf/UnsafeUtil;->putInt(Ljava/lang/Object;JI)V

    return-void
.end method

.method public final slowPositionForFieldNumber(II)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    array-length v0, v0

    div-int/lit8 v0, v0, 0x3

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-gt p2, v0, :cond_2

    add-int v1, v0, p2

    ushr-int/lit8 v1, v1, 0x1

    mul-int/lit8 v2, v1, 0x3

    .line 2
    iget-object v3, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v3, v3, v2

    if-ne p1, v3, :cond_0

    return v2

    :cond_0
    if-ge p1, v3, :cond_1

    add-int/lit8 v1, v1, -0x1

    move v0, v1

    goto :goto_0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    move p2, v1

    goto :goto_0

    :cond_2
    const/4 p0, -0x1

    return p0
.end method

.method public final typeAndOffsetAt(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 p1, p1, 0x1

    aget p0, p0, p1

    return p0
.end method

.method public final writeFieldsInAscendingOrderProto3(Ljava/lang/Object;Lcom/google/protobuf/Writer;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/protobuf/Writer;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/google/protobuf/MessageSchema;->hasExtensions:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/ExtensionSchema;->getExtensions(Ljava/lang/Object;)Lcom/google/protobuf/FieldSet;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/FieldSet;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 4
    invoke-virtual {v0}, Lcom/google/protobuf/FieldSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    goto :goto_0

    :cond_0
    move-object v0, v1

    move-object v2, v0

    .line 6
    :goto_0
    iget-object v3, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    array-length v3, v3

    const/4 v4, 0x0

    move v5, v4

    :goto_1
    if-ge v5, v3, :cond_4

    .line 7
    invoke-virtual {p0, v5}, Lcom/google/protobuf/MessageSchema;->typeAndOffsetAt(I)I

    move-result v6

    .line 8
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    :goto_2
    if-eqz v2, :cond_2

    .line 9
    iget-object v8, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {v8, v2}, Lcom/google/protobuf/ExtensionSchema;->extensionNumber(Ljava/util/Map$Entry;)I

    move-result v8

    if-gt v8, v7, :cond_2

    .line 10
    iget-object v8, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {v8, p2, v2}, Lcom/google/protobuf/ExtensionSchema;->serializeExtension(Lcom/google/protobuf/Writer;Ljava/util/Map$Entry;)V

    .line 11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    goto :goto_2

    :cond_1
    move-object v2, v1

    goto :goto_2

    .line 12
    :cond_2
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result v8

    const/4 v9, 0x1

    packed-switch v8, :pswitch_data_0

    goto/16 :goto_3

    .line 13
    :pswitch_0
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 14
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    .line 15
    invoke-virtual {p0, v5}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v8

    .line 16
    move-object v9, p2

    check-cast v9, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v9, v7, v6, v8}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeGroup(ILjava/lang/Object;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_3

    .line 17
    :pswitch_1
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 18
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v8

    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeSInt64(IJ)V

    goto/16 :goto_3

    .line 19
    :pswitch_2
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 20
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v6

    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeSInt32(II)V

    goto/16 :goto_3

    .line 21
    :pswitch_3
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 22
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v8

    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 23
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 24
    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStream;->writeFixed64(IJ)V

    goto/16 :goto_3

    .line 25
    :pswitch_4
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 26
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v6

    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 27
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 28
    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeFixed32(II)V

    goto/16 :goto_3

    .line 29
    :pswitch_5
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 30
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v6

    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 31
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 32
    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    goto/16 :goto_3

    .line 33
    :pswitch_6
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 34
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v6

    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 35
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeUInt32(II)V

    goto/16 :goto_3

    .line 36
    :pswitch_7
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 37
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/protobuf/ByteString;

    .line 38
    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 39
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    goto/16 :goto_3

    .line 40
    :pswitch_8
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 41
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    .line 42
    invoke-virtual {p0, v5}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v8

    move-object v9, p2

    check-cast v9, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v9, v7, v6, v8}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeMessage(ILjava/lang/Object;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_3

    .line 43
    :pswitch_9
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 44
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v7, v6, p2}, Lcom/google/protobuf/MessageSchema;->writeString(ILjava/lang/Object;Lcom/google/protobuf/Writer;)V

    goto/16 :goto_3

    .line 45
    :pswitch_a
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 46
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofBooleanAt(Ljava/lang/Object;J)Z

    move-result v6

    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 47
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeBool(IZ)V

    goto/16 :goto_3

    .line 48
    :pswitch_b
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 49
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v6

    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 50
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeFixed32(II)V

    goto/16 :goto_3

    .line 51
    :pswitch_c
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 52
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v8

    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 53
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStream;->writeFixed64(IJ)V

    goto/16 :goto_3

    .line 54
    :pswitch_d
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 55
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v6

    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 56
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    goto/16 :goto_3

    .line 57
    :pswitch_e
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 58
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v8

    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 59
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStream;->writeUInt64(IJ)V

    goto/16 :goto_3

    .line 60
    :pswitch_f
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 61
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v8

    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 62
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 63
    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStream;->writeUInt64(IJ)V

    goto/16 :goto_3

    .line 64
    :pswitch_10
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 65
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofFloatAt(Ljava/lang/Object;J)F

    move-result v6

    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeFloat(IF)V

    goto/16 :goto_3

    .line 66
    :pswitch_11
    invoke-virtual {p0, p1, v7, v5}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 67
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/MessageSchema;->oneofDoubleAt(Ljava/lang/Object;J)D

    move-result-wide v8

    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeDouble(ID)V

    goto/16 :goto_3

    .line 68
    :pswitch_12
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, p2, v7, v6, v5}, Lcom/google/protobuf/MessageSchema;->writeMapHelper(Lcom/google/protobuf/Writer;ILjava/lang/Object;I)V

    goto/16 :goto_3

    .line 69
    :pswitch_13
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 70
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 71
    invoke-virtual {p0, v5}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v8

    .line 72
    invoke-static {v7, v6, p2, v8}, Lcom/google/protobuf/SchemaUtil;->writeGroupList(ILjava/util/List;Lcom/google/protobuf/Writer;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_3

    .line 73
    :pswitch_14
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 74
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 75
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeSInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 76
    :pswitch_15
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 77
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 78
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeSInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 79
    :pswitch_16
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 80
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 81
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeSFixed64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 82
    :pswitch_17
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 83
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 84
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeSFixed32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 85
    :pswitch_18
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 86
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 87
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeEnumList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 88
    :pswitch_19
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 89
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 90
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeUInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 91
    :pswitch_1a
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 92
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 93
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeBoolList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 94
    :pswitch_1b
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 95
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 96
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeFixed32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 97
    :pswitch_1c
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 98
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 99
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeFixed64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 100
    :pswitch_1d
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 101
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 102
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 103
    :pswitch_1e
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 104
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 105
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeUInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 106
    :pswitch_1f
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 107
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 108
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 109
    :pswitch_20
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 110
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 111
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeFloatList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 112
    :pswitch_21
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 113
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v10

    invoke-static {p1, v10, v11}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 114
    invoke-static {v7, v6, p2, v9}, Lcom/google/protobuf/SchemaUtil;->writeDoubleList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 115
    :pswitch_22
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 116
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 117
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeSInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 118
    :pswitch_23
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 119
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 120
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeSInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 121
    :pswitch_24
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 122
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 123
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeSFixed64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 124
    :pswitch_25
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 125
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 126
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeSFixed32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 127
    :pswitch_26
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 128
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 129
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeEnumList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 130
    :pswitch_27
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 131
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 132
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeUInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 133
    :pswitch_28
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 134
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 135
    invoke-static {v7, v6, p2}, Lcom/google/protobuf/SchemaUtil;->writeBytesList(ILjava/util/List;Lcom/google/protobuf/Writer;)V

    goto/16 :goto_3

    .line 136
    :pswitch_29
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 137
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 138
    invoke-virtual {p0, v5}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v8

    .line 139
    invoke-static {v7, v6, p2, v8}, Lcom/google/protobuf/SchemaUtil;->writeMessageList(ILjava/util/List;Lcom/google/protobuf/Writer;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_3

    .line 140
    :pswitch_2a
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 141
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 142
    invoke-static {v7, v6, p2}, Lcom/google/protobuf/SchemaUtil;->writeStringList(ILjava/util/List;Lcom/google/protobuf/Writer;)V

    goto/16 :goto_3

    .line 143
    :pswitch_2b
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 144
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 145
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeBoolList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 146
    :pswitch_2c
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 147
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 148
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeFixed32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 149
    :pswitch_2d
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 150
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 151
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeFixed64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 152
    :pswitch_2e
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 153
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 154
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 155
    :pswitch_2f
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 156
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 157
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeUInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 158
    :pswitch_30
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 159
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 160
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 161
    :pswitch_31
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 162
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 163
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeFloatList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 164
    :pswitch_32
    iget-object v7, p0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v7, v7, v5

    .line 165
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 166
    invoke-static {v7, v6, p2, v4}, Lcom/google/protobuf/SchemaUtil;->writeDoubleList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 167
    :pswitch_33
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 168
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    .line 169
    invoke-virtual {p0, v5}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v8

    .line 170
    move-object v9, p2

    check-cast v9, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v9, v7, v6, v8}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeGroup(ILjava/lang/Object;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_3

    .line 171
    :pswitch_34
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 172
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 173
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 174
    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeSInt64(IJ)V

    goto/16 :goto_3

    .line 175
    :pswitch_35
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 176
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 177
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v6

    .line 178
    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeSInt32(II)V

    goto/16 :goto_3

    .line 179
    :pswitch_36
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 180
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 181
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 182
    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 183
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 184
    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStream;->writeFixed64(IJ)V

    goto/16 :goto_3

    .line 185
    :pswitch_37
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 186
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 187
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v6

    .line 188
    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 189
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 190
    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeFixed32(II)V

    goto/16 :goto_3

    .line 191
    :pswitch_38
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 192
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 193
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v6

    .line 194
    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 195
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 196
    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    goto/16 :goto_3

    .line 197
    :pswitch_39
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 198
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 199
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v6

    .line 200
    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 201
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeUInt32(II)V

    goto/16 :goto_3

    .line 202
    :pswitch_3a
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 203
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/protobuf/ByteString;

    .line 204
    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 205
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    goto/16 :goto_3

    .line 206
    :pswitch_3b
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 207
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    .line 208
    invoke-virtual {p0, v5}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v8

    move-object v9, p2

    check-cast v9, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v9, v7, v6, v8}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeMessage(ILjava/lang/Object;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_3

    .line 209
    :pswitch_3c
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 210
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v7, v6, p2}, Lcom/google/protobuf/MessageSchema;->writeString(ILjava/lang/Object;Lcom/google/protobuf/Writer;)V

    goto/16 :goto_3

    .line 211
    :pswitch_3d
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 212
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 213
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getBoolean(Ljava/lang/Object;J)Z

    move-result v6

    .line 214
    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 215
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeBool(IZ)V

    goto/16 :goto_3

    .line 216
    :pswitch_3e
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 217
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 218
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v6

    .line 219
    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 220
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeFixed32(II)V

    goto/16 :goto_3

    .line 221
    :pswitch_3f
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 222
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 223
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 224
    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 225
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStream;->writeFixed64(IJ)V

    goto :goto_3

    .line 226
    :pswitch_40
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 227
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 228
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getInt(Ljava/lang/Object;J)I

    move-result v6

    .line 229
    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 230
    iget-object v8, v8, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    goto :goto_3

    .line 231
    :pswitch_41
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 232
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 233
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 234
    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 235
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStream;->writeUInt64(IJ)V

    goto :goto_3

    .line 236
    :pswitch_42
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 237
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 238
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 239
    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 240
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 241
    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStream;->writeUInt64(IJ)V

    goto :goto_3

    .line 242
    :pswitch_43
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 243
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 244
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getFloat(Ljava/lang/Object;J)F

    move-result v6

    .line 245
    move-object v8, p2

    check-cast v8, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v8, v7, v6}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeFloat(IF)V

    goto :goto_3

    .line 246
    :pswitch_44
    invoke-virtual {p0, p1, v5}, Lcom/google/protobuf/MessageSchema;->isFieldPresent(Ljava/lang/Object;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 247
    invoke-static {v6}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v8

    .line 248
    invoke-static {p1, v8, v9}, Lcom/google/protobuf/UnsafeUtil;->getDouble(Ljava/lang/Object;J)D

    move-result-wide v8

    .line 249
    move-object v6, p2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v7, v8, v9}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeDouble(ID)V

    :cond_3
    :goto_3
    add-int/lit8 v5, v5, 0x3

    goto/16 :goto_1

    :cond_4
    :goto_4
    if-eqz v2, :cond_6

    .line 250
    iget-object v3, p0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {v3, p2, v2}, Lcom/google/protobuf/ExtensionSchema;->serializeExtension(Lcom/google/protobuf/Writer;Ljava/util/Map$Entry;)V

    .line 251
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    goto :goto_4

    :cond_5
    move-object v2, v1

    goto :goto_4

    .line 252
    :cond_6
    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    .line 253
    invoke-virtual {p0, p1}, Lcom/google/protobuf/UnknownFieldSchema;->getFromMessage(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/UnknownFieldSchema;->writeTo(Ljava/lang/Object;Lcom/google/protobuf/Writer;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final writeMapHelper(Lcom/google/protobuf/Writer;ILjava/lang/Object;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/Writer;",
            "I",
            "Ljava/lang/Object;",
            "I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p3, :cond_1

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    .line 2
    iget-object v1, p0, Lcom/google/protobuf/MessageSchema;->objects:[Ljava/lang/Object;

    div-int/lit8 p4, p4, 0x3

    const/4 v2, 0x2

    mul-int/2addr p4, v2

    aget-object p4, v1, p4

    .line 3
    invoke-interface {v0, p4}, Lcom/google/protobuf/MapFieldSchema;->forMapMetadata(Ljava/lang/Object;)Lcom/google/protobuf/MapEntryLite$Metadata;

    iget-object p0, p0, Lcom/google/protobuf/MessageSchema;->mapFieldSchema:Lcom/google/protobuf/MapFieldSchema;

    .line 4
    invoke-interface {p0, p3}, Lcom/google/protobuf/MapFieldSchema;->forMapData(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    .line 5
    check-cast p1, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 6
    iget-object p3, p1, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map$Entry;

    .line 8
    iget-object p1, p1, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {p1, p2, v2}, Lcom/google/protobuf/CodedOutputStream;->writeTag(II)V

    .line 9
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    const/4 p0, 0x0

    .line 10
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public final writeString(ILjava/lang/Object;Lcom/google/protobuf/Writer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of p0, p2, Ljava/lang/String;

    if-eqz p0, :cond_0

    .line 2
    check-cast p2, Ljava/lang/String;

    check-cast p3, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 3
    iget-object p0, p3, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/CodedOutputStream;->writeString(ILjava/lang/String;)V

    goto :goto_0

    .line 4
    :cond_0
    check-cast p2, Lcom/google/protobuf/ByteString;

    check-cast p3, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 5
    iget-object p0, p3, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    :goto_0
    return-void
.end method

.method public writeTo(Ljava/lang/Object;Lcom/google/protobuf/Writer;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/protobuf/Writer;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 1
    invoke-static/range {p2 .. p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->proto3:Z

    if-eqz v3, :cond_0

    .line 3
    invoke-virtual/range {p0 .. p2}, Lcom/google/protobuf/MessageSchema;->writeFieldsInAscendingOrderProto3(Ljava/lang/Object;Lcom/google/protobuf/Writer;)V

    goto/16 :goto_6

    .line 4
    :cond_0
    iget-boolean v3, v0, Lcom/google/protobuf/MessageSchema;->hasExtensions:Z

    if-eqz v3, :cond_1

    .line 5
    iget-object v3, v0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {v3, v1}, Lcom/google/protobuf/ExtensionSchema;->getExtensions(Ljava/lang/Object;)Lcom/google/protobuf/FieldSet;

    move-result-object v3

    .line 6
    invoke-virtual {v3}, Lcom/google/protobuf/FieldSet;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 7
    invoke-virtual {v3}, Lcom/google/protobuf/FieldSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 8
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    const/4 v5, 0x0

    :goto_0
    const/4 v6, -0x1

    .line 9
    iget-object v7, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    array-length v7, v7

    .line 10
    sget-object v8, Lcom/google/protobuf/MessageSchema;->UNSAFE:Lsun/misc/Unsafe;

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_1
    if-ge v10, v7, :cond_8

    .line 11
    invoke-virtual {v0, v10}, Lcom/google/protobuf/MessageSchema;->typeAndOffsetAt(I)I

    move-result v12

    .line 12
    iget-object v13, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v13, v13, v10

    .line 13
    invoke-static {v12}, Lcom/google/protobuf/MessageSchema;->type(I)I

    move-result v14

    .line 14
    iget-boolean v15, v0, Lcom/google/protobuf/MessageSchema;->proto3:Z

    if-nez v15, :cond_3

    const/16 v15, 0x11

    if-gt v14, v15, :cond_3

    .line 15
    iget-object v15, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    add-int/lit8 v16, v10, 0x2

    aget v15, v15, v16

    const v16, 0xfffff

    and-int v9, v15, v16

    move-object/from16 v16, v5

    if-eq v9, v6, :cond_2

    int-to-long v4, v9

    .line 16
    invoke-virtual {v8, v1, v4, v5}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v11

    move v6, v9

    :cond_2
    ushr-int/lit8 v4, v15, 0x14

    const/4 v5, 0x1

    shl-int v4, v5, v4

    move-object/from16 v5, v16

    goto :goto_2

    :cond_3
    move-object/from16 v16, v5

    move-object/from16 v5, v16

    const/4 v4, 0x0

    :goto_2
    if-eqz v5, :cond_5

    .line 17
    iget-object v9, v0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {v9, v5}, Lcom/google/protobuf/ExtensionSchema;->extensionNumber(Ljava/util/Map$Entry;)I

    move-result v9

    if-gt v9, v13, :cond_5

    .line 18
    iget-object v9, v0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {v9, v2, v5}, Lcom/google/protobuf/ExtensionSchema;->serializeExtension(Lcom/google/protobuf/Writer;Ljava/util/Map$Entry;)V

    .line 19
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    goto :goto_2

    :cond_4
    const/4 v5, 0x0

    goto :goto_2

    :cond_5
    move-object v15, v5

    move v9, v6

    .line 20
    invoke-static {v12}, Lcom/google/protobuf/MessageSchema;->offset(I)J

    move-result-wide v5

    packed-switch v14, :pswitch_data_0

    :cond_6
    :goto_3
    const/4 v12, 0x0

    goto/16 :goto_4

    .line 21
    :pswitch_0
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 22
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v10}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v5

    .line 23
    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeGroup(ILjava/lang/Object;Lcom/google/protobuf/Schema;)V

    goto :goto_3

    .line 24
    :pswitch_1
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 25
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeSInt64(IJ)V

    goto :goto_3

    .line 26
    :pswitch_2
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 27
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeSInt32(II)V

    goto :goto_3

    .line 28
    :pswitch_3
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 29
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 30
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 31
    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->writeFixed64(IJ)V

    goto :goto_3

    .line 32
    :pswitch_4
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 33
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 34
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 35
    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeFixed32(II)V

    goto :goto_3

    .line 36
    :pswitch_5
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 37
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 38
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 39
    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    goto :goto_3

    .line 40
    :pswitch_6
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 41
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 42
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeUInt32(II)V

    goto/16 :goto_3

    .line 43
    :pswitch_7
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 44
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/protobuf/ByteString;

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 45
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    goto/16 :goto_3

    .line 46
    :pswitch_8
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 47
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 48
    invoke-virtual {v0, v10}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v5

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeMessage(ILjava/lang/Object;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_3

    .line 49
    :pswitch_9
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 50
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v13, v4, v2}, Lcom/google/protobuf/MessageSchema;->writeString(ILjava/lang/Object;Lcom/google/protobuf/Writer;)V

    goto/16 :goto_3

    .line 51
    :pswitch_a
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 52
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofBooleanAt(Ljava/lang/Object;J)Z

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 53
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeBool(IZ)V

    goto/16 :goto_3

    .line 54
    :pswitch_b
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 55
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 56
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeFixed32(II)V

    goto/16 :goto_3

    .line 57
    :pswitch_c
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 58
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 59
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->writeFixed64(IJ)V

    goto/16 :goto_3

    .line 60
    :pswitch_d
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 61
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofIntAt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 62
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    goto/16 :goto_3

    .line 63
    :pswitch_e
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 64
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 65
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->writeUInt64(IJ)V

    goto/16 :goto_3

    .line 66
    :pswitch_f
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 67
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofLongAt(Ljava/lang/Object;J)J

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 68
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 69
    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->writeUInt64(IJ)V

    goto/16 :goto_3

    .line 70
    :pswitch_10
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 71
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofFloatAt(Ljava/lang/Object;J)F

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeFloat(IF)V

    goto/16 :goto_3

    .line 72
    :pswitch_11
    invoke-virtual {v0, v1, v13, v10}, Lcom/google/protobuf/MessageSchema;->isOneofPresent(Ljava/lang/Object;II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 73
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/MessageSchema;->oneofDoubleAt(Ljava/lang/Object;J)D

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeDouble(ID)V

    goto/16 :goto_3

    .line 74
    :pswitch_12
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v2, v13, v4, v10}, Lcom/google/protobuf/MessageSchema;->writeMapHelper(Lcom/google/protobuf/Writer;ILjava/lang/Object;I)V

    goto/16 :goto_3

    .line 75
    :pswitch_13
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 76
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 77
    invoke-virtual {v0, v10}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v6

    .line 78
    invoke-static {v4, v5, v2, v6}, Lcom/google/protobuf/SchemaUtil;->writeGroupList(ILjava/util/List;Lcom/google/protobuf/Writer;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_3

    .line 79
    :pswitch_14
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 80
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    const/4 v12, 0x1

    .line 81
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeSInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_15
    const/4 v12, 0x1

    .line 82
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 83
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 84
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeSInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_16
    const/4 v12, 0x1

    .line 85
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 86
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 87
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeSFixed64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_17
    const/4 v12, 0x1

    .line 88
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 89
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 90
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeSFixed32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_18
    const/4 v12, 0x1

    .line 91
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 92
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 93
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeEnumList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_19
    const/4 v12, 0x1

    .line 94
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 95
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 96
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeUInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_1a
    const/4 v12, 0x1

    .line 97
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 98
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 99
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeBoolList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_1b
    const/4 v12, 0x1

    .line 100
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 101
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 102
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeFixed32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_1c
    const/4 v12, 0x1

    .line 103
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 104
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 105
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeFixed64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_1d
    const/4 v12, 0x1

    .line 106
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 107
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 108
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_1e
    const/4 v12, 0x1

    .line 109
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 110
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 111
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeUInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_1f
    const/4 v12, 0x1

    .line 112
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 113
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 114
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_20
    const/4 v12, 0x1

    .line 115
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 116
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 117
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeFloatList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    :pswitch_21
    const/4 v12, 0x1

    .line 118
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 119
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 120
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeDoubleList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_3

    .line 121
    :pswitch_22
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 122
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    const/4 v12, 0x0

    .line 123
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeSInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_23
    const/4 v12, 0x0

    .line 124
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 125
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 126
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeSInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_24
    const/4 v12, 0x0

    .line 127
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 128
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 129
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeSFixed64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_25
    const/4 v12, 0x0

    .line 130
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 131
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 132
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeSFixed32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_26
    const/4 v12, 0x0

    .line 133
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 134
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 135
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeEnumList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_27
    const/4 v12, 0x0

    .line 136
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 137
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 138
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeUInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    .line 139
    :pswitch_28
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 140
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 141
    invoke-static {v4, v5, v2}, Lcom/google/protobuf/SchemaUtil;->writeBytesList(ILjava/util/List;Lcom/google/protobuf/Writer;)V

    goto/16 :goto_3

    .line 142
    :pswitch_29
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 143
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 144
    invoke-virtual {v0, v10}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v6

    .line 145
    invoke-static {v4, v5, v2, v6}, Lcom/google/protobuf/SchemaUtil;->writeMessageList(ILjava/util/List;Lcom/google/protobuf/Writer;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_3

    .line 146
    :pswitch_2a
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 147
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 148
    invoke-static {v4, v5, v2}, Lcom/google/protobuf/SchemaUtil;->writeStringList(ILjava/util/List;Lcom/google/protobuf/Writer;)V

    goto/16 :goto_3

    .line 149
    :pswitch_2b
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 150
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    const/4 v12, 0x0

    .line 151
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeBoolList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_2c
    const/4 v12, 0x0

    .line 152
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 153
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 154
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeFixed32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_2d
    const/4 v12, 0x0

    .line 155
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 156
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 157
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeFixed64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_2e
    const/4 v12, 0x0

    .line 158
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 159
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 160
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeInt32List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_2f
    const/4 v12, 0x0

    .line 161
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 162
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 163
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeUInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_30
    const/4 v12, 0x0

    .line 164
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 165
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 166
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeInt64List(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_31
    const/4 v12, 0x0

    .line 167
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 168
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 169
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeFloatList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_32
    const/4 v12, 0x0

    .line 170
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->buffer:[I

    aget v4, v4, v10

    .line 171
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 172
    invoke-static {v4, v5, v2, v12}, Lcom/google/protobuf/SchemaUtil;->writeDoubleList(ILjava/util/List;Lcom/google/protobuf/Writer;Z)V

    goto/16 :goto_4

    :pswitch_33
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 173
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v10}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v5

    .line 174
    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeGroup(ILjava/lang/Object;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_4

    :pswitch_34
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 175
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeSInt64(IJ)V

    goto/16 :goto_4

    :pswitch_35
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 176
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeSInt32(II)V

    goto/16 :goto_4

    :pswitch_36
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 177
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 178
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 179
    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->writeFixed64(IJ)V

    goto/16 :goto_4

    :pswitch_37
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 180
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 181
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 182
    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeFixed32(II)V

    goto/16 :goto_4

    :pswitch_38
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 183
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 184
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 185
    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    goto/16 :goto_4

    :pswitch_39
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 186
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 187
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeUInt32(II)V

    goto/16 :goto_4

    :pswitch_3a
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 188
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/protobuf/ByteString;

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 189
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeBytes(ILcom/google/protobuf/ByteString;)V

    goto/16 :goto_4

    :pswitch_3b
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 190
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    .line 191
    invoke-virtual {v0, v10}, Lcom/google/protobuf/MessageSchema;->getMessageFieldSchema(I)Lcom/google/protobuf/Schema;

    move-result-object v5

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeMessage(ILjava/lang/Object;Lcom/google/protobuf/Schema;)V

    goto/16 :goto_4

    :pswitch_3c
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 192
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v13, v4, v2}, Lcom/google/protobuf/MessageSchema;->writeString(ILjava/lang/Object;Lcom/google/protobuf/Writer;)V

    goto/16 :goto_4

    :pswitch_3d
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 193
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getBoolean(Ljava/lang/Object;J)Z

    move-result v4

    .line 194
    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 195
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeBool(IZ)V

    goto/16 :goto_4

    :pswitch_3e
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 196
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 197
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeFixed32(II)V

    goto :goto_4

    :pswitch_3f
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 198
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 199
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->writeFixed64(IJ)V

    goto :goto_4

    :pswitch_40
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 200
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v4

    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 201
    iget-object v5, v5, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStream;->writeInt32(II)V

    goto :goto_4

    :pswitch_41
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 202
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 203
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->writeUInt64(IJ)V

    goto :goto_4

    :pswitch_42
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 204
    invoke-virtual {v8, v1, v5, v6}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v4

    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    .line 205
    iget-object v6, v6, Lcom/google/protobuf/CodedOutputStreamWriter;->output:Lcom/google/protobuf/CodedOutputStream;

    .line 206
    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->writeUInt64(IJ)V

    goto :goto_4

    :pswitch_43
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 207
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getFloat(Ljava/lang/Object;J)F

    move-result v4

    .line 208
    move-object v5, v2

    check-cast v5, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v5, v13, v4}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeFloat(IF)V

    goto :goto_4

    :pswitch_44
    const/4 v12, 0x0

    and-int/2addr v4, v11

    if-eqz v4, :cond_7

    .line 209
    invoke-static {v1, v5, v6}, Lcom/google/protobuf/UnsafeUtil;->getDouble(Ljava/lang/Object;J)D

    move-result-wide v4

    .line 210
    move-object v6, v2

    check-cast v6, Lcom/google/protobuf/CodedOutputStreamWriter;

    invoke-virtual {v6, v13, v4, v5}, Lcom/google/protobuf/CodedOutputStreamWriter;->writeDouble(ID)V

    :cond_7
    :goto_4
    add-int/lit8 v10, v10, 0x3

    move v6, v9

    move-object v5, v15

    goto/16 :goto_1

    :cond_8
    move-object/from16 v16, v5

    :goto_5
    if-eqz v5, :cond_a

    .line 211
    iget-object v4, v0, Lcom/google/protobuf/MessageSchema;->extensionSchema:Lcom/google/protobuf/ExtensionSchema;

    invoke-virtual {v4, v2, v5}, Lcom/google/protobuf/ExtensionSchema;->serializeExtension(Lcom/google/protobuf/Writer;Ljava/util/Map$Entry;)V

    .line 212
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Ljava/util/Map$Entry;

    goto :goto_5

    :cond_9
    const/4 v5, 0x0

    goto :goto_5

    .line 213
    :cond_a
    iget-object v0, v0, Lcom/google/protobuf/MessageSchema;->unknownFieldSchema:Lcom/google/protobuf/UnknownFieldSchema;

    .line 214
    invoke-virtual {v0, v1}, Lcom/google/protobuf/UnknownFieldSchema;->getFromMessage(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/UnknownFieldSchema;->writeTo(Ljava/lang/Object;Lcom/google/protobuf/Writer;)V

    :goto_6
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
