.class public final Lcom/adobe/xmp/options/PropertyOptions;
.super Lcom/adobe/xmp/options/Options;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/adobe/xmp/options/Options;-><init>()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1}, Lcom/adobe/xmp/options/Options;-><init>(I)V

    return-void
.end method


# virtual methods
.method public assertConsistency(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    and-int/lit16 p0, p1, 0x100

    const/16 v0, 0x67

    if-lez p0, :cond_1

    and-int/lit16 p0, p1, 0x200

    if-gtz p0, :cond_0

    goto :goto_0

    .line 1
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "IsStruct and IsArray options are mutually exclusive"

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_1
    :goto_0
    and-int/lit8 p0, p1, 0x2

    if-lez p0, :cond_3

    and-int/lit16 p0, p1, 0x300

    if-gtz p0, :cond_2

    goto :goto_1

    .line 2
    :cond_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Structs and arrays can\'t have \"value\" options"

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_3
    :goto_1
    return-void
.end method

.method public getHasLanguage()Z
    .locals 1

    const/16 v0, 0x40

    .line 1
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result p0

    return p0
.end method

.method public getValidOptions()I
    .locals 0

    const p0, -0x7fffe00e

    return p0
.end method

.method public isArray()Z
    .locals 1

    const/16 v0, 0x200

    .line 1
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result p0

    return p0
.end method

.method public isArrayAltText()Z
    .locals 1

    const/16 v0, 0x1000

    .line 1
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result p0

    return p0
.end method

.method public isArrayAlternate()Z
    .locals 1

    const/16 v0, 0x800

    .line 1
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result p0

    return p0
.end method

.method public isCompositeProperty()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/adobe/xmp/options/Options;->options:I

    and-int/lit16 p0, p0, 0x300

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isSchemaNode()Z
    .locals 1

    const/high16 v0, -0x80000000

    .line 1
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result p0

    return p0
.end method

.method public isStruct()Z
    .locals 1

    const/16 v0, 0x100

    .line 1
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result p0

    return p0
.end method

.method public mergeWith(Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 1
    iget v0, p0, Lcom/adobe/xmp/options/Options;->options:I

    iget p1, p1, Lcom/adobe/xmp/options/Options;->options:I

    or-int/2addr p1, v0

    .line 2
    invoke-virtual {p0, p1}, Lcom/adobe/xmp/options/Options;->assertOptionsValid(I)V

    .line 3
    iput p1, p0, Lcom/adobe/xmp/options/Options;->options:I

    :cond_0
    return-void
.end method
