.class public abstract Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getStructField(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "xmpMeta",
            "schemaNs",
            "structName",
            "fieldNs",
            "fieldName"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 2
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_5

    const/16 v0, 0x66

    .line 3
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_4

    .line 4
    invoke-static {p3, p4}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/adobe/xmp/impl/xpath/XMPPath;->size()I

    move-result p4

    const/4 v1, 0x2

    if-ne p4, v1, :cond_3

    const/4 p4, 0x1

    .line 6
    invoke-virtual {p3, p4}, Lcom/adobe/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    move-result-object p3

    .line 7
    iget-object p3, p3, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 8
    invoke-static {p3, p4}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result p4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p4}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 p4, 0x2f

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 9
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p4

    if-eqz p4, :cond_0

    invoke-virtual {p2, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    new-instance p3, Ljava/lang/String;

    invoke-direct {p3, p2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object p2, p3

    .line 10
    :goto_0
    check-cast p0, Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 12
    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 13
    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    .line 14
    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 p3, 0x0

    const/4 p4, 0x0

    invoke-static {p2, p1, p3, p4}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 15
    invoke-virtual {p0, p3, p1}, Lcom/adobe/xmp/impl/XMPMetaImpl;->evaluateNodeValue(ILcom/adobe/xmp/impl/XMPNode;)Ljava/lang/Object;

    move-result-object p0

    .line 16
    new-instance p2, Lcom/adobe/xmp/impl/XMPMetaImpl$2;

    invoke-direct {p2, p0, p1}, Lcom/adobe/xmp/impl/XMPMetaImpl$2;-><init>(Ljava/lang/Object;Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_1

    :cond_1
    move-object p2, p4

    :goto_1
    if-nez p2, :cond_2

    return-object p4

    .line 17
    :cond_2
    iget-object p0, p2, Lcom/adobe/xmp/impl/XMPMetaImpl$2;->val$value:Ljava/lang/Object;

    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 19
    :cond_3
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "The field name must be simple"

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 20
    :cond_4
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Empty f name"

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 21
    :cond_5
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0x65

    const-string p2, "Empty field namespace URI"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public static requiredNonNullValue(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "value",
            "description"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    if-nez p0, :cond_1

    .line 1
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string v0, "Missing value for "

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    const/4 v0, 0x5

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_1
    return-object p0
.end method


# virtual methods
.method public abstract getLength()I
.end method

.method public abstract getMime()Ljava/lang/String;
.end method

.method public abstract getPadding()I
.end method

.method public abstract getSemantic()Ljava/lang/String;
.end method
