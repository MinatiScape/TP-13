.class public Lcom/adobe/xmp/impl/Utils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static xmlNameChars:[Z

.field public static xmlNameStartChars:[Z


# direct methods
.method public static constructor <clinit>()V
    .locals 16

    const/16 v0, 0x100

    new-array v1, v0, [Z

    .line 1
    sput-object v1, Lcom/adobe/xmp/impl/Utils;->xmlNameChars:[Z

    new-array v0, v0, [Z

    .line 2
    sput-object v0, Lcom/adobe/xmp/impl/Utils;->xmlNameStartChars:[Z

    const/4 v0, 0x0

    move v1, v0

    .line 3
    :goto_0
    sget-object v2, Lcom/adobe/xmp/impl/Utils;->xmlNameChars:[Z

    array-length v3, v2

    if-ge v1, v3, :cond_b

    .line 4
    sget-object v3, Lcom/adobe/xmp/impl/Utils;->xmlNameStartChars:[Z

    const/16 v4, 0xf6

    const/16 v5, 0xd6

    const/16 v6, 0xd8

    const/16 v7, 0xc0

    const/16 v8, 0x5f

    const/16 v9, 0x5a

    const/16 v10, 0x3a

    const/16 v11, 0x7a

    const/16 v12, 0x41

    const/16 v13, 0x61

    const/4 v14, 0x1

    if-gt v13, v1, :cond_0

    if-le v1, v11, :cond_4

    :cond_0
    if-gt v12, v1, :cond_1

    if-le v1, v9, :cond_4

    :cond_1
    if-eq v1, v10, :cond_4

    if-eq v1, v8, :cond_4

    if-gt v7, v1, :cond_2

    if-le v1, v5, :cond_4

    :cond_2
    if-gt v6, v1, :cond_3

    if-gt v1, v4, :cond_3

    goto :goto_1

    :cond_3
    move v15, v0

    goto :goto_2

    :cond_4
    :goto_1
    move v15, v14

    :goto_2
    aput-boolean v15, v3, v1

    if-gt v13, v1, :cond_5

    if-le v1, v11, :cond_a

    :cond_5
    if-gt v12, v1, :cond_6

    if-le v1, v9, :cond_a

    :cond_6
    const/16 v3, 0x30

    if-gt v3, v1, :cond_7

    const/16 v3, 0x39

    if-le v1, v3, :cond_a

    :cond_7
    if-eq v1, v10, :cond_a

    if-eq v1, v8, :cond_a

    const/16 v3, 0x2d

    if-eq v1, v3, :cond_a

    const/16 v3, 0x2e

    if-eq v1, v3, :cond_a

    const/16 v3, 0xb7

    if-eq v1, v3, :cond_a

    if-gt v7, v1, :cond_8

    if-le v1, v5, :cond_a

    :cond_8
    if-gt v6, v1, :cond_9

    if-gt v1, v4, :cond_9

    goto :goto_3

    :cond_9
    move v14, v0

    .line 5
    :cond_a
    :goto_3
    aput-boolean v14, v2, v1

    add-int/lit8 v1, v1, 0x1

    int-to-char v1, v1

    goto :goto_0

    :cond_b
    return-void
.end method

.method public static isControlChar(C)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    const/16 v0, 0x1f

    if-le p0, v0, :cond_0

    const/16 v0, 0x7f

    if-ne p0, v0, :cond_1

    :cond_0
    const/16 v0, 0x9

    if-eq p0, v0, :cond_1

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isXMLNameNS(Ljava/lang/String;)Z
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    const/16 v2, 0x3a

    const/16 v3, 0xff

    const/4 v4, 0x0

    if-lez v0, :cond_3

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-gt v0, v3, :cond_1

    .line 2
    sget-object v5, Lcom/adobe/xmp/impl/Utils;->xmlNameStartChars:[Z

    aget-boolean v0, v5, v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v4

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v1

    :goto_1
    if-eqz v0, :cond_2

    .line 3
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_3

    :cond_2
    return v4

    :cond_3
    move v0, v1

    .line 4
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v0, v5, :cond_8

    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-gt v5, v3, :cond_5

    .line 6
    sget-object v6, Lcom/adobe/xmp/impl/Utils;->xmlNameChars:[Z

    aget-boolean v5, v6, v5

    if-eqz v5, :cond_4

    goto :goto_3

    :cond_4
    move v5, v4

    goto :goto_4

    :cond_5
    :goto_3
    move v5, v1

    :goto_4
    if-eqz v5, :cond_7

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v2, :cond_6

    goto :goto_5

    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_7
    :goto_5
    return v4

    :cond_8
    return v1
.end method

.method public static normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    const-string v0, "x-default"

    .line 1
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    .line 2
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 3
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_4

    .line 4
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-eq v3, v4, :cond_3

    const/16 v4, 0x2d

    if-eq v3, v4, :cond_2

    const/16 v5, 0x5f

    if-eq v3, v5, :cond_2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_1

    .line 5
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 6
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 7
    :cond_2
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v2, v2, 0x1

    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 8
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static splitNameAndValue(Ljava/lang/String;)[Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "selector"
        }
    .end annotation

    const/16 v0, 0x3d

    .line 1
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, 0x1

    .line 2
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/4 v3, 0x2

    const/16 v4, 0x3f

    if-ne v2, v4, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v1

    .line 3
    :goto_0
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v4, v0, 0x1

    .line 4
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    add-int/2addr v4, v1

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v3

    .line 6
    new-instance v7, Ljava/lang/StringBuffer;

    sub-int v0, v6, v0

    invoke-direct {v7, v0}, Ljava/lang/StringBuffer;-><init>(I)V

    :cond_1
    :goto_1
    if-ge v4, v6, :cond_2

    .line 7
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v4, v4, 0x1

    .line 8
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v5, :cond_1

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    new-array p0, v3, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object v2, p0, v0

    .line 9
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p0, v1

    return-object p0
.end method
