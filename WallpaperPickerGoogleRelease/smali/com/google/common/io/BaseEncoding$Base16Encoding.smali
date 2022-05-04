.class public final Lcom/google/common/io/BaseEncoding$Base16Encoding;
.super Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/BaseEncoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Base16Encoding"
.end annotation


# instance fields
.field public final encoding:[C


# direct methods
.method public constructor <init>(Lcom/google/common/io/BaseEncoding$Alphabet;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "alphabet"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;-><init>(Lcom/google/common/io/BaseEncoding$Alphabet;Ljava/lang/Character;)V

    const/16 v0, 0x200

    new-array v0, v0, [C

    .line 2
    iput-object v0, p0, Lcom/google/common/io/BaseEncoding$Base16Encoding;->encoding:[C

    .line 3
    iget-object v0, p1, Lcom/google/common/io/BaseEncoding$Alphabet;->chars:[C

    .line 4
    array-length v0, v0

    const/16 v1, 0x10

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    :goto_1
    const/16 v0, 0x100

    if-ge v2, v0, :cond_1

    .line 5
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$Base16Encoding;->encoding:[C

    ushr-int/lit8 v1, v2, 0x4

    .line 6
    iget-object v3, p1, Lcom/google/common/io/BaseEncoding$Alphabet;->chars:[C

    aget-char v1, v3, v1

    .line 7
    aput-char v1, v0, v2

    or-int/lit16 v1, v2, 0x100

    and-int/lit8 v4, v2, 0xf

    .line 8
    aget-char v3, v3, v4

    .line 9
    aput-char v3, v0, v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method


# virtual methods
.method public encodeTo(Ljava/lang/Appendable;[BII)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "target",
            "bytes",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    add-int v0, p3, p4

    .line 1
    array-length v1, p2

    invoke-static {p3, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p4, :cond_0

    add-int v1, p3, v0

    .line 2
    aget-byte v1, p2, v1

    and-int/lit16 v1, v1, 0xff

    .line 3
    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$Base16Encoding;->encoding:[C

    aget-char v2, v2, v1

    invoke-interface {p1, v2}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 4
    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$Base16Encoding;->encoding:[C

    or-int/lit16 v1, v1, 0x100

    aget-char v1, v2, v1

    invoke-interface {p1, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public newInstance(Lcom/google/common/io/BaseEncoding$Alphabet;Ljava/lang/Character;)Lcom/google/common/io/BaseEncoding;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "alphabet",
            "paddingChar"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/google/common/io/BaseEncoding$Base16Encoding;

    invoke-direct {p0, p1}, Lcom/google/common/io/BaseEncoding$Base16Encoding;-><init>(Lcom/google/common/io/BaseEncoding$Alphabet;)V

    return-object p0
.end method
