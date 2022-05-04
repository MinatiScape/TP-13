.class public Lcom/adobe/xmp/impl/FixASCIIControlsReader;
.super Ljava/io/PushbackReader;
.source "SourceFile"


# instance fields
.field public control:I

.field public digits:I

.field public state:I


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    const/16 v0, 0x8

    .line 1
    invoke-direct {p0, p1, v0}, Ljava/io/PushbackReader;-><init>(Ljava/io/Reader;I)V

    const/4 p1, 0x0

    .line 2
    iput p1, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 3
    iput p1, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    .line 4
    iput p1, p0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    return-void
.end method


# virtual methods
.method public read([CII)I
    .locals 16
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "cbuf",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    const/16 v1, 0x8

    new-array v1, v1, [C

    const/4 v2, 0x0

    const/4 v3, 0x1

    move/from16 v4, p2

    move v6, v2

    move v7, v6

    :goto_0
    move v5, v3

    :cond_0
    :goto_1
    if-eqz v5, :cond_19

    move/from16 v8, p3

    if-ge v6, v8, :cond_19

    .line 1
    invoke-super {v0, v1, v7, v3}, Ljava/io/PushbackReader;->read([CII)I

    move-result v5

    if-ne v5, v3, :cond_1

    move v5, v3

    goto :goto_2

    :cond_1
    move v5, v2

    :goto_2
    const/4 v9, 0x5

    if-eqz v5, :cond_18

    .line 2
    aget-char v10, v1, v7

    .line 3
    iget v11, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    if-eqz v11, :cond_13

    const/4 v12, 0x2

    if-eq v11, v3, :cond_11

    const/16 v14, 0x39

    const/16 v15, 0x30

    const/4 v3, 0x3

    const/4 v13, 0x4

    if-eq v11, v12, :cond_e

    const/16 v12, 0x3b

    if-eq v11, v3, :cond_7

    if-eq v11, v13, :cond_3

    if-eq v11, v9, :cond_2

    goto/16 :goto_4

    .line 4
    :cond_2
    iput v2, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto/16 :goto_4

    :cond_3
    if-gt v15, v10, :cond_5

    if-gt v10, v14, :cond_5

    .line 5
    iget v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    const/16 v11, 0xa

    mul-int/2addr v3, v11

    invoke-static {v10, v11}, Ljava/lang/Character;->digit(CI)I

    move-result v11

    add-int/2addr v11, v3

    iput v11, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    .line 6
    iget v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    const/4 v11, 0x1

    add-int/2addr v3, v11

    iput v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    if-gt v3, v9, :cond_4

    .line 7
    iput v13, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto/16 :goto_4

    .line 8
    :cond_4
    iput v9, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto/16 :goto_4

    :cond_5
    if-ne v10, v12, :cond_6

    .line 9
    iget v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    int-to-char v3, v3

    invoke-static {v3}, Lcom/adobe/xmp/impl/Utils;->isControlChar(C)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 10
    iput v2, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 11
    iget v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    goto :goto_3

    .line 12
    :cond_6
    iput v9, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto/16 :goto_4

    :cond_7
    if-gt v15, v10, :cond_8

    if-le v10, v14, :cond_a

    :cond_8
    const/16 v11, 0x61

    if-gt v11, v10, :cond_9

    const/16 v11, 0x66

    if-le v10, v11, :cond_a

    :cond_9
    const/16 v11, 0x41

    if-gt v11, v10, :cond_c

    const/16 v11, 0x46

    if-gt v10, v11, :cond_c

    .line 13
    :cond_a
    iget v11, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    const/16 v12, 0x10

    mul-int/2addr v11, v12

    invoke-static {v10, v12}, Ljava/lang/Character;->digit(CI)I

    move-result v12

    add-int/2addr v12, v11

    iput v12, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    .line 14
    iget v11, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    const/4 v12, 0x1

    add-int/2addr v11, v12

    iput v11, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    if-gt v11, v13, :cond_b

    .line 15
    iput v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_4

    .line 16
    :cond_b
    iput v9, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_4

    :cond_c
    if-ne v10, v12, :cond_d

    .line 17
    iget v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    int-to-char v3, v3

    invoke-static {v3}, Lcom/adobe/xmp/impl/Utils;->isControlChar(C)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 18
    iput v2, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    .line 19
    iget v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    :goto_3
    int-to-char v10, v3

    goto :goto_4

    .line 20
    :cond_d
    iput v9, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_4

    :cond_e
    const/16 v11, 0x78

    if-ne v10, v11, :cond_f

    .line 21
    iput v2, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    .line 22
    iput v2, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 23
    iput v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_4

    :cond_f
    if-gt v15, v10, :cond_10

    if-gt v10, v14, :cond_10

    const/16 v3, 0xa

    .line 24
    invoke-static {v10, v3}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    iput v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->control:I

    const/4 v3, 0x1

    .line 25
    iput v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->digits:I

    .line 26
    iput v13, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_4

    .line 27
    :cond_10
    iput v9, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_4

    :cond_11
    const/16 v3, 0x23

    if-ne v10, v3, :cond_12

    .line 28
    iput v12, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_4

    .line 29
    :cond_12
    iput v9, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_4

    :cond_13
    const/16 v3, 0x26

    if-ne v10, v3, :cond_14

    const/4 v3, 0x1

    .line 30
    iput v3, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    goto :goto_5

    :cond_14
    :goto_4
    const/4 v3, 0x1

    .line 31
    :goto_5
    iget v11, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    if-nez v11, :cond_16

    .line 32
    invoke-static {v10}, Lcom/adobe/xmp/impl/Utils;->isControlChar(C)Z

    move-result v7

    if-eqz v7, :cond_15

    const/16 v10, 0x20

    :cond_15
    add-int/lit8 v7, v4, 0x1

    .line 33
    aput-char v10, p1, v4

    add-int/lit8 v6, v6, 0x1

    move v4, v7

    goto :goto_6

    :cond_16
    if-ne v11, v9, :cond_17

    add-int/lit8 v7, v7, 0x1

    .line 34
    invoke-virtual {v0, v1, v2, v7}, Ljava/io/PushbackReader;->unread([CII)V

    :goto_6
    move v7, v2

    goto/16 :goto_1

    :cond_17
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    :cond_18
    if-lez v7, :cond_0

    .line 35
    invoke-virtual {v0, v1, v2, v7}, Ljava/io/PushbackReader;->unread([CII)V

    .line 36
    iput v9, v0, Lcom/adobe/xmp/impl/FixASCIIControlsReader;->state:I

    move v7, v2

    goto/16 :goto_0

    :cond_19
    if-gtz v6, :cond_1b

    if-eqz v5, :cond_1a

    goto :goto_7

    :cond_1a
    const/4 v6, -0x1

    :cond_1b
    :goto_7
    return v6
.end method
