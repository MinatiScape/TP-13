.class public abstract Lcom/adobe/xmp/options/Options;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public options:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/adobe/xmp/options/Options;->options:I

    return-void
.end method

.method public constructor <init>(I)V
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

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lcom/adobe/xmp/options/Options;->options:I

    .line 5
    invoke-virtual {p0, p1}, Lcom/adobe/xmp/options/Options;->assertOptionsValid(I)V

    .line 6
    invoke-virtual {p0, p1}, Lcom/adobe/xmp/options/Options;->assertOptionsValid(I)V

    .line 7
    iput p1, p0, Lcom/adobe/xmp/options/Options;->options:I

    return-void
.end method


# virtual methods
.method public assertConsistency(I)V
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

    return-void
.end method

.method public final assertOptionsValid(I)V
    .locals 3
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

    .line 1
    invoke-virtual {p0}, Lcom/adobe/xmp/options/Options;->getValidOptions()I

    move-result v0

    not-int v0, v0

    and-int/2addr v0, p1

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Lcom/adobe/xmp/options/Options;->assertConsistency(I)V

    return-void

    .line 3
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x21

    invoke-static {p1, v0}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v0

    const-string v1, "The option bit(s) 0x"

    const-string v2, " are invalid!"

    invoke-static {v0, v1, p1, v2}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x67

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 1
    iget p0, p0, Lcom/adobe/xmp/options/Options;->options:I

    .line 2
    check-cast p1, Lcom/adobe/xmp/options/Options;

    .line 3
    iget p1, p1, Lcom/adobe/xmp/options/Options;->options:I

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public getOption(I)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "optionBit"
        }
    .end annotation

    .line 1
    iget p0, p0, Lcom/adobe/xmp/options/Options;->options:I

    and-int/2addr p0, p1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public abstract getValidOptions()I
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/adobe/xmp/options/Options;->options:I

    return p0
.end method

.method public setOption(IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "optionBits",
            "value"
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 1
    iget p2, p0, Lcom/adobe/xmp/options/Options;->options:I

    or-int/2addr p1, p2

    goto :goto_0

    :cond_0
    iget p2, p0, Lcom/adobe/xmp/options/Options;->options:I

    not-int p1, p1

    and-int/2addr p1, p2

    :goto_0
    iput p1, p0, Lcom/adobe/xmp/options/Options;->options:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget p0, p0, Lcom/adobe/xmp/options/Options;->options:I

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const-string v1, "0x"

    if-eqz v0, :cond_0

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    return-object p0
.end method
