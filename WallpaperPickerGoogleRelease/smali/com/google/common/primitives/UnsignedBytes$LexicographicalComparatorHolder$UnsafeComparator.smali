.class public final enum Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "UnsafeComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;",
        ">;",
        "Ljava/util/Comparator<",
        "[B>;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

.field public static final BIG_ENDIAN:Z

.field public static final BYTE_ARRAY_BASE_OFFSET:I

.field public static final theUnsafe:Lsun/misc/Unsafe;


# direct methods
.method public static constructor <clinit>()V
    .locals 6

    .line 1
    const-class v0, [B

    new-instance v1, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    const-string v2, "INSTANCE"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x1

    new-array v4, v2, [Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    aput-object v1, v4, v3

    .line 2
    sput-object v4, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->$VALUES:[Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    .line 3
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    sput-boolean v1, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->BIG_ENDIAN:Z

    .line 4
    :try_start_0
    invoke-static {}, Lsun/misc/Unsafe;->getUnsafe()Lsun/misc/Unsafe;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 5
    :catch_0
    :try_start_1
    new-instance v1, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator$1;

    invoke-direct {v1}, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator$1;-><init>()V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsun/misc/Unsafe;
    :try_end_1
    .catch Ljava/security/PrivilegedActionException; {:try_start_1 .. :try_end_1} :catch_1

    .line 6
    :goto_0
    sput-object v1, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->theUnsafe:Lsun/misc/Unsafe;

    .line 7
    invoke-virtual {v1, v0}, Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I

    move-result v3

    sput v3, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->BYTE_ARRAY_BASE_OFFSET:I

    const-string v4, "sun.arch.data.model"

    .line 8
    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "64"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    rem-int/lit8 v3, v3, 0x8

    if-nez v3, :cond_0

    .line 9
    invoke-virtual {v1, v0}, Lsun/misc/Unsafe;->arrayIndexScale(Ljava/lang/Class;)I

    move-result v0

    if-ne v0, v2, :cond_0

    return-void

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/Error;

    invoke-direct {v0}, Ljava/lang/Error;-><init>()V

    throw v0

    :catch_1
    move-exception v0

    .line 11
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    const-string v2, "Could not initialize intrinsics"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 1
    const-class v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    return-object p0
.end method

.method public static values()[Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->$VALUES:[Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    invoke-virtual {v0}, [Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    return-object v0
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "left",
            "right"
        }
    .end annotation

    .line 1
    check-cast p1, [B

    check-cast p2, [B

    .line 2
    array-length p0, p1

    array-length v0, p2

    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    move-result p0

    and-int/lit8 v0, p0, -0x8

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_3

    .line 3
    sget-object v3, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->theUnsafe:Lsun/misc/Unsafe;

    sget v4, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->BYTE_ARRAY_BASE_OFFSET:I

    int-to-long v4, v4

    int-to-long v6, v2

    add-long/2addr v4, v6

    invoke-virtual {v3, p1, v4, v5}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v6

    .line 4
    invoke-virtual {v3, p2, v4, v5}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v3

    cmp-long v5, v6, v3

    if-eqz v5, :cond_2

    .line 5
    sget-boolean p0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->BIG_ENDIAN:Z

    if-eqz p0, :cond_1

    const-wide/high16 p0, -0x8000000000000000L

    xor-long v5, v6, p0

    xor-long/2addr p0, v3

    cmp-long p0, v5, p0

    if-gez p0, :cond_0

    const/4 v1, -0x1

    goto :goto_2

    :cond_0
    if-lez p0, :cond_6

    const/4 v1, 0x1

    goto :goto_2

    :cond_1
    xor-long p0, v6, v3

    .line 6
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result p0

    and-int/lit8 p0, p0, -0x8

    ushr-long p1, v6, p0

    const-wide/16 v0, 0xff

    and-long/2addr p1, v0

    long-to-int p1, p1

    ushr-long v2, v3, p0

    and-long/2addr v0, v2

    long-to-int p0, v0

    sub-int v1, p1, p0

    goto :goto_2

    :cond_2
    add-int/lit8 v2, v2, 0x8

    goto :goto_0

    :cond_3
    :goto_1
    if-ge v2, p0, :cond_5

    .line 7
    aget-byte v0, p1, v2

    aget-byte v1, p2, v2

    and-int/lit16 v0, v0, 0xff

    and-int/lit16 v1, v1, 0xff

    sub-int v1, v0, v1

    if-eqz v1, :cond_4

    goto :goto_2

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 8
    :cond_5
    array-length p0, p1

    array-length p1, p2

    sub-int v1, p0, p1

    :cond_6
    :goto_2
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    const-string p0, "UnsignedBytes.lexicographicalComparator() (sun.misc.Unsafe version)"

    return-object p0
.end method
