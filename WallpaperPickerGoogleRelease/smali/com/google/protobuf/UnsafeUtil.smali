.class public final Lcom/google/protobuf/UnsafeUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;,
        Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;
    }
.end annotation


# static fields
.field public static final BYTE_ARRAY_BASE_OFFSET:J

.field public static final HAS_UNSAFE_ARRAY_OPERATIONS:Z

.field public static final HAS_UNSAFE_BYTEBUFFER_OPERATIONS:Z

.field public static final MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

.field public static final UNSAFE:Lsun/misc/Unsafe;

.field public static final logger:Ljava/util/logging/Logger;


# direct methods
.method public static constructor <clinit>()V
    .locals 22

    .line 1
    const-class v1, [Ljava/lang/Object;

    const-class v2, [D

    const-class v3, [F

    const-class v4, [J

    const-class v5, [I

    const-class v6, [Z

    const-class v7, Ljava/lang/Object;

    const-class v0, Lcom/google/protobuf/UnsafeUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/google/protobuf/UnsafeUtil;->logger:Ljava/util/logging/Logger;

    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v8, Lcom/google/protobuf/UnsafeUtil$1;

    invoke-direct {v8}, Lcom/google/protobuf/UnsafeUtil$1;-><init>()V

    .line 3
    invoke-static {v8}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lsun/misc/Unsafe;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-object v8, v0

    .line 4
    :goto_0
    sput-object v8, Lcom/google/protobuf/UnsafeUtil;->UNSAFE:Lsun/misc/Unsafe;

    if-nez v8, :cond_0

    goto :goto_1

    .line 5
    :cond_0
    new-instance v0, Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;

    invoke-direct {v0, v8}, Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;-><init>(Lsun/misc/Unsafe;)V

    .line 6
    :goto_1
    sput-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    const-string v0, "copyMemory"

    const-string v9, "putLong"

    const-string v10, "putInt"

    const-string v11, "getInt"

    const-string v12, "putByte"

    const-string v13, "getByte"

    const-string v14, "platform method missing - proto runtime falling back to safer methods: "

    const-string v15, "objectFieldOffset"

    const/16 v16, 0x0

    move-object/from16 v17, v1

    const-string v1, "getLong"

    move-object/from16 v18, v2

    if-nez v8, :cond_1

    move-object/from16 v19, v3

    move-object/from16 v20, v4

    const/4 v4, 0x1

    goto :goto_2

    .line 7
    :cond_1
    :try_start_1
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    move-object/from16 v19, v3

    const/4 v2, 0x1

    :try_start_2
    new-array v3, v2, [Ljava/lang/Class;

    .line 8
    const-class v2, Ljava/lang/reflect/Field;

    aput-object v2, v3, v16

    invoke-virtual {v8, v15, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    aput-object v7, v3, v16

    .line 9
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    move-object/from16 v20, v4

    const/4 v4, 0x1

    :try_start_3
    aput-object v2, v3, v4

    invoke-virtual {v8, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 10
    invoke-static {}, Lcom/google/protobuf/UnsafeUtil;->bufferAddressField()Ljava/lang/reflect/Field;

    move-result-object v3

    if-nez v3, :cond_2

    :goto_2
    move-object/from16 v21, v5

    goto/16 :goto_6

    :cond_2
    new-array v3, v4, [Ljava/lang/Class;

    aput-object v2, v3, v16

    .line 11
    invoke-virtual {v8, v13, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    aput-object v2, v4, v16

    .line 12
    sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-object/from16 v21, v5

    const/4 v5, 0x1

    :try_start_4
    aput-object v3, v4, v5

    invoke-virtual {v8, v12, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    new-array v3, v5, [Ljava/lang/Class;

    aput-object v2, v3, v16

    .line 13
    invoke-virtual {v8, v11, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    aput-object v2, v4, v16

    .line 14
    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x1

    aput-object v3, v4, v5

    invoke-virtual {v8, v10, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    new-array v3, v5, [Ljava/lang/Class;

    aput-object v2, v3, v16

    .line 15
    invoke-virtual {v8, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    aput-object v2, v4, v16

    aput-object v2, v4, v5

    .line 16
    invoke-virtual {v8, v9, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v3, 0x3

    new-array v4, v3, [Ljava/lang/Class;

    aput-object v2, v4, v16

    aput-object v2, v4, v5

    const/4 v3, 0x2

    aput-object v2, v4, v3

    .line 17
    invoke-virtual {v8, v0, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Class;

    aput-object v7, v4, v16

    aput-object v2, v4, v5

    aput-object v7, v4, v3

    const/4 v3, 0x3

    aput-object v2, v4, v3

    const/4 v3, 0x4

    aput-object v2, v4, v3

    .line 18
    invoke-virtual {v8, v0, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 v0, 0x1

    goto :goto_7

    :catchall_1
    move-exception v0

    goto :goto_5

    :catchall_2
    move-exception v0

    :goto_3
    move-object/from16 v21, v5

    goto :goto_5

    :catchall_3
    move-exception v0

    :goto_4
    move-object/from16 v20, v4

    goto :goto_3

    :catchall_4
    move-exception v0

    move-object/from16 v19, v3

    goto :goto_4

    .line 19
    :goto_5
    sget-object v2, Lcom/google/protobuf/UnsafeUtil;->logger:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    :goto_6
    move/from16 v0, v16

    .line 20
    :goto_7
    sput-boolean v0, Lcom/google/protobuf/UnsafeUtil;->HAS_UNSAFE_BYTEBUFFER_OPERATIONS:Z

    .line 21
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->UNSAFE:Lsun/misc/Unsafe;

    if-nez v0, :cond_3

    goto/16 :goto_8

    .line 22
    :cond_3
    :try_start_5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    .line 23
    const-class v4, Ljava/lang/reflect/Field;

    aput-object v4, v3, v16

    invoke-virtual {v0, v15, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const-string v3, "arrayBaseOffset"

    new-array v4, v2, [Ljava/lang/Class;

    .line 24
    const-class v5, Ljava/lang/Class;

    aput-object v5, v4, v16

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const-string v3, "arrayIndexScale"

    new-array v4, v2, [Ljava/lang/Class;

    .line 25
    const-class v2, Ljava/lang/Class;

    aput-object v2, v4, v16

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    aput-object v7, v3, v16

    .line 26
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x1

    aput-object v2, v3, v4

    invoke-virtual {v0, v11, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v3, 0x3

    new-array v5, v3, [Ljava/lang/Class;

    aput-object v7, v5, v16

    aput-object v2, v5, v4

    .line 27
    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x2

    aput-object v3, v5, v4

    invoke-virtual {v0, v10, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    new-array v3, v4, [Ljava/lang/Class;

    aput-object v7, v3, v16

    const/4 v4, 0x1

    aput-object v2, v3, v4

    .line 28
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v1, 0x3

    new-array v3, v1, [Ljava/lang/Class;

    aput-object v7, v3, v16

    aput-object v2, v3, v4

    const/4 v1, 0x2

    aput-object v2, v3, v1

    .line 29
    invoke-virtual {v0, v9, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const-string v3, "getObject"

    new-array v4, v1, [Ljava/lang/Class;

    aput-object v7, v4, v16

    const/4 v1, 0x1

    aput-object v2, v4, v1

    .line 30
    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const-string v3, "putObject"

    const/4 v4, 0x3

    new-array v5, v4, [Ljava/lang/Class;

    aput-object v7, v5, v16

    aput-object v2, v5, v1

    const/4 v4, 0x2

    aput-object v7, v5, v4

    .line 31
    invoke-virtual {v0, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    new-array v3, v4, [Ljava/lang/Class;

    aput-object v7, v3, v16

    aput-object v2, v3, v1

    .line 32
    invoke-virtual {v0, v13, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const/4 v3, 0x3

    new-array v4, v3, [Ljava/lang/Class;

    aput-object v7, v4, v16

    aput-object v2, v4, v1

    .line 33
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    const/4 v3, 0x2

    aput-object v1, v4, v3

    invoke-virtual {v0, v12, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const-string v1, "getBoolean"

    new-array v4, v3, [Ljava/lang/Class;

    aput-object v7, v4, v16

    const/4 v3, 0x1

    aput-object v2, v4, v3

    .line 34
    invoke-virtual {v0, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const-string v1, "putBoolean"

    const/4 v4, 0x3

    new-array v5, v4, [Ljava/lang/Class;

    aput-object v7, v5, v16

    aput-object v2, v5, v3

    .line 35
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x2

    aput-object v3, v5, v4

    invoke-virtual {v0, v1, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const-string v1, "getFloat"

    new-array v3, v4, [Ljava/lang/Class;

    aput-object v7, v3, v16

    const/4 v4, 0x1

    aput-object v2, v3, v4

    .line 36
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const-string v1, "putFloat"

    const/4 v3, 0x3

    new-array v5, v3, [Ljava/lang/Class;

    aput-object v7, v5, v16

    aput-object v2, v5, v4

    .line 37
    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x2

    aput-object v3, v5, v4

    invoke-virtual {v0, v1, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const-string v1, "getDouble"

    new-array v3, v4, [Ljava/lang/Class;

    aput-object v7, v3, v16

    const/4 v4, 0x1

    aput-object v2, v3, v4

    .line 38
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    const-string v1, "putDouble"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    aput-object v7, v3, v16

    aput-object v2, v3, v4

    .line 39
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x2

    aput-object v2, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    move/from16 v16, v4

    goto :goto_8

    :catchall_5
    move-exception v0

    .line 40
    sget-object v1, Lcom/google/protobuf/UnsafeUtil;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 41
    :goto_8
    sput-boolean v16, Lcom/google/protobuf/UnsafeUtil;->HAS_UNSAFE_ARRAY_OPERATIONS:Z

    .line 42
    const-class v0, [B

    invoke-static {v0}, Lcom/google/protobuf/UnsafeUtil;->arrayBaseOffset(Ljava/lang/Class;)I

    move-result v0

    int-to-long v0, v0

    sput-wide v0, Lcom/google/protobuf/UnsafeUtil;->BYTE_ARRAY_BASE_OFFSET:J

    .line 43
    invoke-static {v6}, Lcom/google/protobuf/UnsafeUtil;->arrayBaseOffset(Ljava/lang/Class;)I

    .line 44
    invoke-static {v6}, Lcom/google/protobuf/UnsafeUtil;->arrayIndexScale(Ljava/lang/Class;)I

    .line 45
    invoke-static/range {v21 .. v21}, Lcom/google/protobuf/UnsafeUtil;->arrayBaseOffset(Ljava/lang/Class;)I

    .line 46
    invoke-static/range {v21 .. v21}, Lcom/google/protobuf/UnsafeUtil;->arrayIndexScale(Ljava/lang/Class;)I

    .line 47
    invoke-static/range {v20 .. v20}, Lcom/google/protobuf/UnsafeUtil;->arrayBaseOffset(Ljava/lang/Class;)I

    .line 48
    invoke-static/range {v20 .. v20}, Lcom/google/protobuf/UnsafeUtil;->arrayIndexScale(Ljava/lang/Class;)I

    .line 49
    invoke-static/range {v19 .. v19}, Lcom/google/protobuf/UnsafeUtil;->arrayBaseOffset(Ljava/lang/Class;)I

    .line 50
    invoke-static/range {v19 .. v19}, Lcom/google/protobuf/UnsafeUtil;->arrayIndexScale(Ljava/lang/Class;)I

    .line 51
    invoke-static/range {v18 .. v18}, Lcom/google/protobuf/UnsafeUtil;->arrayBaseOffset(Ljava/lang/Class;)I

    .line 52
    invoke-static/range {v18 .. v18}, Lcom/google/protobuf/UnsafeUtil;->arrayIndexScale(Ljava/lang/Class;)I

    .line 53
    invoke-static/range {v17 .. v17}, Lcom/google/protobuf/UnsafeUtil;->arrayBaseOffset(Ljava/lang/Class;)I

    .line 54
    invoke-static/range {v17 .. v17}, Lcom/google/protobuf/UnsafeUtil;->arrayIndexScale(Ljava/lang/Class;)I

    .line 55
    invoke-static {}, Lcom/google/protobuf/UnsafeUtil;->bufferAddressField()Ljava/lang/reflect/Field;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 56
    sget-object v1, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    if-nez v1, :cond_4

    goto :goto_9

    .line 57
    :cond_4
    iget-object v1, v1, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v1, v0}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 58
    :cond_5
    :goto_9
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static allocateInstance(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    :try_start_0
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->UNSAFE:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0}, Lsun/misc/Unsafe;->allocateInstance(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 2
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static arrayBaseOffset(Ljava/lang/Class;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 1
    sget-boolean v0, Lcom/google/protobuf/UnsafeUtil;->HAS_UNSAFE_ARRAY_OPERATIONS:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0}, Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method public static arrayIndexScale(Ljava/lang/Class;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 1
    sget-boolean v0, Lcom/google/protobuf/UnsafeUtil;->HAS_UNSAFE_ARRAY_OPERATIONS:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0}, Lsun/misc/Unsafe;->arrayIndexScale(Ljava/lang/Class;)I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method public static bufferAddressField()Ljava/lang/reflect/Field;
    .locals 4

    .line 1
    const-class v0, Ljava/nio/Buffer;

    const-string v1, "address"

    const/4 v2, 0x0

    .line 2
    :try_start_0
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v1, v3, :cond_0

    move-object v2, v0

    :cond_0
    return-object v2
.end method

.method public static getBoolean(Ljava/lang/Object;J)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    check-cast v0, Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0, p1, p2}, Lsun/misc/Unsafe;->getBoolean(Ljava/lang/Object;J)Z

    move-result p0

    return p0
.end method

.method public static getByte([BJ)B
    .locals 3

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    sget-wide v1, Lcom/google/protobuf/UnsafeUtil;->BYTE_ARRAY_BASE_OFFSET:J

    add-long/2addr v1, p1

    check-cast v0, Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;

    .line 2
    iget-object p1, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {p1, p0, v1, v2}, Lsun/misc/Unsafe;->getByte(Ljava/lang/Object;J)B

    move-result p0

    return p0
.end method

.method public static getDouble(Ljava/lang/Object;J)D
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    check-cast v0, Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0, p1, p2}, Lsun/misc/Unsafe;->getDouble(Ljava/lang/Object;J)D

    move-result-wide p0

    return-wide p0
.end method

.method public static getFloat(Ljava/lang/Object;J)F
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    check-cast v0, Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0, p1, p2}, Lsun/misc/Unsafe;->getFloat(Ljava/lang/Object;J)F

    move-result p0

    return p0
.end method

.method public static getInt(Ljava/lang/Object;J)I
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0, p1, p2}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result p0

    return p0
.end method

.method public static getLong(Ljava/lang/Object;J)J
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0, p1, p2}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static getObject(Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0, p1, p2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static putBoolean(Ljava/lang/Object;JZ)V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    check-cast v0, Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0, p1, p2, p3}, Lsun/misc/Unsafe;->putBoolean(Ljava/lang/Object;JZ)V

    return-void
.end method

.method public static putByte([BJB)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    sget-wide v1, Lcom/google/protobuf/UnsafeUtil;->BYTE_ARRAY_BASE_OFFSET:J

    add-long/2addr v1, p1

    check-cast v0, Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;

    .line 2
    iget-object p1, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {p1, p0, v1, v2, p3}, Lsun/misc/Unsafe;->putByte(Ljava/lang/Object;JB)V

    return-void
.end method

.method public static putDouble(Ljava/lang/Object;JD)V
    .locals 7

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    check-cast v0, Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;

    .line 2
    iget-object v1, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    move-object v2, p0

    move-wide v3, p1

    move-wide v5, p3

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putDouble(Ljava/lang/Object;JD)V

    return-void
.end method

.method public static putFloat(Ljava/lang/Object;JF)V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    check-cast v0, Lcom/google/protobuf/UnsafeUtil$JvmMemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0, p1, p2, p3}, Lsun/misc/Unsafe;->putFloat(Ljava/lang/Object;JF)V

    return-void
.end method

.method public static putInt(Ljava/lang/Object;JI)V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0, p1, p2, p3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return-void
.end method

.method public static putLong(Ljava/lang/Object;JJ)V
    .locals 7

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    .line 2
    iget-object v1, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    move-object v2, p0

    move-wide v3, p1

    move-wide v5, p3

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    return-void
.end method

.method public static putObject(Ljava/lang/Object;JLjava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/protobuf/UnsafeUtil;->MEMORY_ACCESSOR:Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;

    .line 2
    iget-object v0, v0, Lcom/google/protobuf/UnsafeUtil$MemoryAccessor;->unsafe:Lsun/misc/Unsafe;

    invoke-virtual {v0, p0, p1, p2, p3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    return-void
.end method
