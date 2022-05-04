.class public Lkotlin/text/CharsKt__CharKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final checkRadix(I)I
    .locals 5

    const/4 v0, 0x2

    const/16 v1, 0x24

    if-gt v0, p0, :cond_0

    if-lt v1, p0, :cond_0

    return p0

    .line 1
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "radix "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " was not in valid range "

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p0, Lkotlin/ranges/IntRange;

    invoke-direct {p0, v0, v1}, Lkotlin/ranges/IntRange;-><init>(II)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static final equals(CCZ)Z
    .locals 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p2, :cond_1

    return v1

    .line 1
    :cond_1
    invoke-static {p0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result p2

    invoke-static {p1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    if-ne p2, v2, :cond_2

    return v0

    .line 2
    :cond_2
    invoke-static {p0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p0

    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p1

    if-ne p0, p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public static zza([BI)I
    .locals 2

    .line 64
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x3

    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, v0

    return p0
.end method

.method public static zza(JJJ)J
    .locals 3

    xor-long/2addr p0, p2

    mul-long/2addr p0, p4

    const/16 v0, 0x2f

    ushr-long v1, p0, v0

    xor-long/2addr p0, v1

    xor-long/2addr p0, p2

    mul-long/2addr p0, p4

    ushr-long p2, p0, v0

    xor-long/2addr p0, p2

    mul-long/2addr p0, p4

    return-wide p0
.end method

.method public static zza([B)J
    .locals 25

    move-object/from16 v7, p0

    .line 1
    array-length v0, v7

    if-ltz v0, :cond_7

    .line 2
    array-length v1, v7

    if-gt v0, v1, :cond_7

    const/16 v1, 0x25

    const/16 v2, 0x12

    const/16 v3, 0x1e

    const/16 v4, 0x2b

    const/4 v5, 0x2

    const/16 v6, 0x20

    const-wide v8, -0x4b6d499041670d8dL    # -1.9079014105469082E-55

    const/16 v10, 0x10

    const/16 v11, 0x8

    const-wide v12, -0x651e95c4d06fbfb1L    # -3.35749372464804E-179

    const/4 v14, 0x0

    if-gt v0, v6, :cond_4

    if-gt v0, v10, :cond_3

    if-lt v0, v11, :cond_0

    shl-int/lit8 v2, v0, 0x1

    int-to-long v2, v2

    add-long v8, v2, v12

    .line 3
    invoke-static {v7, v14}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v2

    add-long/2addr v2, v12

    add-int/2addr v0, v14

    sub-int/2addr v0, v11

    .line 4
    invoke-static {v7, v0}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v4

    .line 5
    invoke-static {v4, v5, v1}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    mul-long/2addr v0, v8

    add-long/2addr v0, v2

    const/16 v6, 0x19

    .line 6
    invoke-static {v2, v3, v6}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v2

    add-long/2addr v2, v4

    mul-long v6, v2, v8

    move-wide v4, v0

    .line 7
    invoke-static/range {v4 .. v9}, Lkotlin/text/CharsKt__CharKt;->zza(JJJ)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const/4 v1, 0x4

    if-lt v0, v1, :cond_1

    shl-int/lit8 v2, v0, 0x1

    int-to-long v2, v2

    add-long v8, v2, v12

    .line 8
    invoke-static {v7, v14}, Lkotlin/text/CharsKt__CharKt;->zza([BI)I

    move-result v2

    int-to-long v2, v2

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    int-to-long v4, v0

    const/4 v6, 0x3

    shl-long/2addr v2, v6

    add-long/2addr v4, v2

    add-int/2addr v0, v14

    sub-int/2addr v0, v1

    .line 9
    invoke-static {v7, v0}, Lkotlin/text/CharsKt__CharKt;->zza([BI)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long v6, v0, v2

    invoke-static/range {v4 .. v9}, Lkotlin/text/CharsKt__CharKt;->zza(JJJ)J

    move-result-wide v0

    return-wide v0

    :cond_1
    if-lez v0, :cond_2

    .line 10
    aget-byte v1, v7, v14

    shr-int/lit8 v2, v0, 0x1

    add-int/2addr v2, v14

    .line 11
    aget-byte v2, v7, v2

    add-int/lit8 v3, v0, -0x1

    add-int/2addr v3, v14

    .line 12
    aget-byte v3, v7, v3

    and-int/lit16 v1, v1, 0xff

    and-int/lit16 v2, v2, 0xff

    shl-int/2addr v2, v11

    add-int/2addr v1, v2

    and-int/lit16 v2, v3, 0xff

    shl-int/2addr v2, v5

    add-int/2addr v0, v2

    int-to-long v1, v1

    mul-long/2addr v1, v12

    int-to-long v3, v0

    const-wide v5, -0x3c5a37a36834ced9L    # -7.8480313857871552E17

    mul-long/2addr v3, v5

    xor-long v0, v1, v3

    const/16 v2, 0x2f

    ushr-long v2, v0, v2

    xor-long/2addr v0, v2

    mul-long/2addr v0, v12

    return-wide v0

    :cond_2
    return-wide v12

    :cond_3
    shl-int/lit8 v1, v0, 0x1

    int-to-long v5, v1

    add-long v19, v5, v12

    .line 13
    invoke-static {v7, v14}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v5

    mul-long/2addr v5, v8

    .line 14
    invoke-static {v7, v11}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v8

    add-int/2addr v0, v14

    add-int/lit8 v1, v0, -0x8

    .line 15
    invoke-static {v7, v1}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v14

    mul-long v14, v14, v19

    sub-int/2addr v0, v10

    .line 16
    invoke-static {v7, v0}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v0

    mul-long/2addr v0, v12

    add-long v10, v5, v8

    .line 17
    invoke-static {v10, v11, v4}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v10

    invoke-static {v14, v15, v3}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v3

    add-long/2addr v3, v10

    add-long/2addr v0, v3

    add-long/2addr v8, v12

    invoke-static {v8, v9, v2}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v2

    add-long/2addr v2, v5

    add-long v17, v2, v14

    move-wide v15, v0

    .line 18
    invoke-static/range {v15 .. v20}, Lkotlin/text/CharsKt__CharKt;->zza(JJJ)J

    move-result-wide v0

    return-wide v0

    :cond_4
    const/16 v2, 0x40

    if-gt v0, v2, :cond_5

    shl-int/lit8 v1, v0, 0x1

    int-to-long v1, v1

    add-long/2addr v1, v12

    .line 19
    invoke-static {v7, v14}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v5

    mul-long/2addr v5, v12

    .line 20
    invoke-static {v7, v11}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v8

    add-int/2addr v0, v14

    add-int/lit8 v3, v0, -0x8

    .line 21
    invoke-static {v7, v3}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v14

    mul-long/2addr v14, v1

    add-int/lit8 v3, v0, -0x10

    .line 22
    invoke-static {v7, v3}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v16

    mul-long v16, v16, v12

    add-long v10, v5, v8

    .line 23
    invoke-static {v10, v11, v4}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v10

    const/16 v3, 0x1e

    invoke-static {v14, v15, v3}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v18

    add-long v18, v18, v10

    add-long v10, v18, v16

    add-long/2addr v8, v12

    const/16 v3, 0x12

    .line 24
    invoke-static {v8, v9, v3}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v8

    add-long/2addr v8, v5

    add-long v17, v8, v14

    move-wide v15, v10

    move-wide/from16 v19, v1

    invoke-static/range {v15 .. v20}, Lkotlin/text/CharsKt__CharKt;->zza(JJJ)J

    move-result-wide v8

    const/16 v3, 0x10

    .line 25
    invoke-static {v7, v3}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v12

    mul-long/2addr v12, v1

    const/16 v3, 0x18

    .line 26
    invoke-static {v7, v3}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v14

    add-int/lit8 v4, v0, -0x20

    .line 27
    invoke-static {v7, v4}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v17

    add-long v17, v17, v10

    mul-long v10, v17, v1

    sub-int/2addr v0, v3

    .line 28
    invoke-static {v7, v0}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v3

    add-long/2addr v3, v8

    mul-long/2addr v3, v1

    add-long v7, v12, v14

    const/16 v0, 0x2b

    .line 29
    invoke-static {v7, v8, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v7

    const/16 v0, 0x1e

    invoke-static {v10, v11, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v16

    add-long v16, v16, v7

    add-long v3, v16, v3

    add-long/2addr v14, v5

    const/16 v0, 0x12

    invoke-static {v14, v15, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v5

    add-long/2addr v5, v12

    add-long v17, v5, v10

    move-wide v15, v3

    .line 30
    invoke-static/range {v15 .. v20}, Lkotlin/text/CharsKt__CharKt;->zza(JJJ)J

    move-result-wide v0

    return-wide v0

    :cond_5
    const-wide v2, 0x226bb95b4e64b6d4L    # 7.104748899679321E-143

    const-wide v10, 0x134a747f856d0526L    # 9.592726139023731E-216

    new-array v12, v5, [J

    new-array v13, v5, [J

    const-wide v4, 0x1529cba0ca458ffL

    .line 31
    invoke-static {v7, v14}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v15

    add-long/2addr v15, v4

    const/16 v17, 0x1

    add-int/lit8 v0, v0, -0x1

    .line 32
    div-int/lit8 v4, v0, 0x40

    shl-int/lit8 v4, v4, 0x6

    add-int/lit8 v6, v4, 0x0

    and-int/lit8 v4, v0, 0x3f

    add-int v0, v6, v4

    add-int/lit8 v18, v0, -0x3f

    move-wide/from16 v19, v15

    move v15, v14

    :goto_0
    add-long v19, v19, v2

    .line 33
    aget-wide v21, v12, v14

    add-long v19, v19, v21

    add-int/lit8 v0, v15, 0x8

    invoke-static {v7, v0}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v21

    move v14, v4

    add-long v4, v21, v19

    invoke-static {v4, v5, v1}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    mul-long/2addr v0, v8

    .line 34
    aget-wide v4, v12, v17

    add-long/2addr v2, v4

    add-int/lit8 v4, v15, 0x30

    invoke-static {v7, v4}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v4

    add-long/2addr v4, v2

    const/16 v2, 0x2a

    invoke-static {v4, v5, v2}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v2

    mul-long/2addr v2, v8

    .line 35
    aget-wide v4, v13, v17

    xor-long v19, v0, v4

    const/4 v0, 0x0

    .line 36
    aget-wide v4, v12, v0

    add-int/lit8 v1, v15, 0x28

    invoke-static {v7, v1}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v21

    add-long v21, v21, v4

    add-long v21, v21, v2

    .line 37
    aget-wide v1, v13, v0

    add-long/2addr v10, v1

    const/16 v1, 0x21

    invoke-static {v10, v11, v1}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v1

    mul-long v10, v1, v8

    .line 38
    aget-wide v1, v12, v17

    mul-long v2, v1, v8

    aget-wide v0, v13, v0

    add-long v4, v19, v0

    move-object/from16 v0, p0

    move v1, v15

    move v8, v6

    move-object v6, v12

    invoke-static/range {v0 .. v6}, Lkotlin/text/CharsKt__CharKt;->zza([BIJJ[J)V

    add-int/lit8 v1, v15, 0x20

    .line 39
    aget-wide v2, v13, v17

    add-long/2addr v2, v10

    add-int/lit8 v0, v15, 0x10

    invoke-static {v7, v0}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v4

    add-long v4, v4, v21

    move-object/from16 v0, p0

    move-object v6, v13

    invoke-static/range {v0 .. v6}, Lkotlin/text/CharsKt__CharKt;->zza([BIJJ[J)V

    add-int/lit8 v15, v15, 0x40

    if-ne v15, v8, :cond_6

    const-wide/16 v0, 0xff

    and-long v0, v19, v0

    shl-long v0, v0, v17

    const-wide v2, -0x4b6d499041670d8dL    # -1.9079014105469082E-55

    add-long v15, v0, v2

    const/4 v0, 0x0

    .line 40
    aget-wide v1, v13, v0

    int-to-long v3, v14

    add-long/2addr v1, v3

    aput-wide v1, v13, v0

    .line 41
    aget-wide v1, v12, v0

    aget-wide v3, v13, v0

    add-long/2addr v1, v3

    aput-wide v1, v12, v0

    .line 42
    aget-wide v1, v13, v0

    aget-wide v3, v12, v0

    add-long/2addr v1, v3

    aput-wide v1, v13, v0

    add-long v10, v10, v21

    .line 43
    aget-wide v0, v12, v0

    add-long/2addr v10, v0

    add-int/lit8 v0, v18, 0x8

    invoke-static {v7, v0}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v0

    add-long/2addr v0, v10

    const/16 v2, 0x25

    invoke-static {v0, v1, v2}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    mul-long/2addr v0, v15

    .line 44
    aget-wide v2, v12, v17

    add-long v21, v21, v2

    add-int/lit8 v2, v18, 0x30

    invoke-static {v7, v2}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v2

    add-long v2, v2, v21

    const/16 v4, 0x2a

    invoke-static {v2, v3, v4}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v2

    mul-long/2addr v2, v15

    .line 45
    aget-wide v4, v13, v17

    const-wide/16 v8, 0x9

    mul-long/2addr v4, v8

    xor-long v10, v0, v4

    const/4 v0, 0x0

    .line 46
    aget-wide v4, v12, v0

    mul-long/2addr v4, v8

    add-int/lit8 v1, v18, 0x28

    invoke-static {v7, v1}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v8

    add-long/2addr v8, v4

    add-long v21, v8, v2

    .line 47
    aget-wide v1, v13, v0

    add-long v1, v19, v1

    const/16 v3, 0x21

    invoke-static {v1, v2, v3}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v1

    mul-long v19, v1, v15

    .line 48
    aget-wide v1, v12, v17

    mul-long v2, v1, v15

    aget-wide v0, v13, v0

    add-long v4, v10, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object v6, v12

    invoke-static/range {v0 .. v6}, Lkotlin/text/CharsKt__CharKt;->zza([BIJJ[J)V

    add-int/lit8 v1, v18, 0x20

    .line 49
    aget-wide v2, v13, v17

    add-long v2, v2, v19

    add-int/lit8 v0, v18, 0x10

    invoke-static {v7, v0}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v4

    add-long v4, v4, v21

    move-object/from16 v0, p0

    move-object v6, v13

    invoke-static/range {v0 .. v6}, Lkotlin/text/CharsKt__CharKt;->zza([BIJJ[J)V

    const/4 v0, 0x0

    .line 50
    aget-wide v4, v12, v0

    aget-wide v6, v13, v0

    move-wide v8, v15

    .line 51
    invoke-static/range {v4 .. v9}, Lkotlin/text/CharsKt__CharKt;->zza(JJJ)J

    move-result-wide v0

    const/16 v2, 0x2f

    ushr-long v2, v21, v2

    xor-long v2, v2, v21

    const-wide v4, -0x3c5a37a36834ced9L    # -7.8480313857871552E17

    mul-long/2addr v2, v4

    add-long/2addr v2, v0

    add-long v0, v2, v10

    .line 52
    aget-wide v4, v12, v17

    aget-wide v6, v13, v17

    .line 53
    invoke-static/range {v4 .. v9}, Lkotlin/text/CharsKt__CharKt;->zza(JJJ)J

    move-result-wide v2

    add-long v6, v2, v19

    move-wide v4, v0

    .line 54
    invoke-static/range {v4 .. v9}, Lkotlin/text/CharsKt__CharKt;->zza(JJJ)J

    move-result-wide v0

    return-wide v0

    :cond_6
    const-wide v2, -0x4b6d499041670d8dL    # -1.9079014105469082E-55

    const/16 v1, 0x25

    const/4 v0, 0x0

    move v6, v8

    move v4, v14

    move v14, v0

    move-wide v8, v2

    move-wide/from16 v2, v21

    move-wide/from16 v23, v10

    move-wide/from16 v10, v19

    move-wide/from16 v19, v23

    goto/16 :goto_0

    .line 55
    :cond_7
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    const/16 v2, 0x43

    const-string v3, "Out of bound index with offput: 0 and length: "

    invoke-static {v2, v3, v0}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static zza([BIJJ[J)V
    .locals 6

    .line 56
    invoke-static {p0, p1}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v0

    add-int/lit8 v2, p1, 0x8

    .line 57
    invoke-static {p0, v2}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v2

    add-int/lit8 v4, p1, 0x10

    .line 58
    invoke-static {p0, v4}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide v4

    add-int/lit8 p1, p1, 0x18

    .line 59
    invoke-static {p0, p1}, Lkotlin/text/CharsKt__CharKt;->zzb([BI)J

    move-result-wide p0

    add-long/2addr p2, v0

    add-long/2addr p4, p2

    add-long/2addr p4, p0

    const/16 v0, 0x15

    .line 60
    invoke-static {p4, p5, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide p4

    add-long/2addr v2, p2

    add-long/2addr v2, v4

    const/16 v0, 0x2c

    .line 61
    invoke-static {v2, v3, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    add-long/2addr v0, p4

    add-long/2addr v2, p0

    const/4 p0, 0x0

    .line 62
    aput-wide v2, p6, p0

    add-long/2addr v0, p2

    const/4 p0, 0x1

    .line 63
    aput-wide v0, p6, p0

    return-void
.end method

.method public static zzb([BI)J
    .locals 1

    const/16 v0, 0x8

    .line 1
    invoke-static {p0, p1, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 2
    sget-object p1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide p0

    return-wide p0
.end method
