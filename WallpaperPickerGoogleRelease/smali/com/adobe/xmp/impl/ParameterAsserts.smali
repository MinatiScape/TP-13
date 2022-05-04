.class public Lcom/adobe/xmp/impl/ParameterAsserts;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static assertNotNull(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "param"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x4

    if-eqz p0, :cond_2

    .line 1
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_1

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Parameter must not be null or empty"

    invoke-direct {p0, v1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_1
    :goto_0
    return-void

    .line 3
    :cond_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Parameter must not be null"

    invoke-direct {p0, v1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public static assertPropName(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "propName"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-eqz p0, :cond_0

    return-void

    .line 2
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/4 v0, 0x4

    const-string v1, "Empty property name"

    invoke-direct {p0, v1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public static assertSchemaNS(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "schemaNS"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-eqz p0, :cond_0

    return-void

    .line 2
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/4 v0, 0x4

    const-string v1, "Empty schema namespace URI"

    invoke-direct {p0, v1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method
