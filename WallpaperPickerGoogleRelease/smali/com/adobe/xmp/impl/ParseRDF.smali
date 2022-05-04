.class public Lcom/adobe/xmp/impl/ParseRDF;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "xmp",
            "xmpParent",
            "xmlNode",
            "value",
            "isTopLevel"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/adobe/xmp/XMPMetaFactory;->schema:Lcom/adobe/xmp/XMPSchemaRegistry;

    .line 2
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xca

    if-eqz v1, :cond_a

    const-string v3, "http://purl.org/dc/1.1/"

    .line 3
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v1, "http://purl.org/dc/elements/1.1/"

    .line 4
    :cond_0
    check-cast v0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;

    invoke-virtual {v0, v1}, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "_dflt"

    if-nez v3, :cond_2

    .line 5
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_1
    move-object v3, v4

    .line 6
    :goto_0
    invoke-virtual {v0, v1, v3}, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 7
    :cond_2
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v3, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_3
    new-instance p2, Ljava/lang/String;

    invoke-direct {p2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 8
    :goto_1
    new-instance v3, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v3}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz p4, :cond_4

    .line 9
    iget-object p1, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    .line 10
    invoke-static {p1, v1, v4, v6}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    .line 11
    iput-boolean v5, p1, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    .line 12
    invoke-virtual {v0, p2}, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->findAlias(Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPAliasInfo;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 13
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    .line 14
    iput-boolean v6, p0, Lcom/adobe/xmp/impl/XMPNode;->hasAliases:Z

    .line 15
    iput-boolean v6, p1, Lcom/adobe/xmp/impl/XMPNode;->hasAliases:Z

    move v5, v6

    :cond_4
    const-string p0, "rdf:li"

    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    const-string v0, "rdf:value"

    .line 17
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 18
    new-instance v1, Lcom/adobe/xmp/impl/XMPNode;

    invoke-direct {v1, p2, p3, v3}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 19
    iput-boolean v5, v1, Lcom/adobe/xmp/impl/XMPNode;->alias:Z

    if-nez v0, :cond_5

    .line 20
    invoke-virtual {p1, v1}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_2

    .line 21
    :cond_5
    invoke-virtual {p1, v6, v1}, Lcom/adobe/xmp/impl/XMPNode;->addChild(ILcom/adobe/xmp/impl/XMPNode;)V

    :goto_2
    if-eqz v0, :cond_7

    if-nez p4, :cond_6

    .line 22
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p2

    invoke-virtual {p2}, Lcom/adobe/xmp/options/PropertyOptions;->isStruct()Z

    move-result p2

    if-eqz p2, :cond_6

    .line 23
    iput-boolean v6, p1, Lcom/adobe/xmp/impl/XMPNode;->hasValueChild:Z

    goto :goto_3

    .line 24
    :cond_6
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Misplaced rdf:value element"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_7
    :goto_3
    if-eqz p0, :cond_9

    .line 25
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p0

    invoke-virtual {p0}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result p0

    if-eqz p0, :cond_8

    const-string p0, "[]"

    .line 26
    iput-object p0, v1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    goto :goto_4

    .line 27
    :cond_8
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Misplaced rdf:li element"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_9
    :goto_4
    return-object v1

    .line 28
    :cond_a
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "XML namespace required for all elements and attributes"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public static addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "xmpParent",
            "name",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const-string v0, "xml:lang"

    .line 1
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 2
    new-instance v1, Lcom/adobe/xmp/impl/XMPNode;

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/adobe/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_0
    const/4 v0, 0x0

    invoke-direct {v1, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 3
    invoke-virtual {p0, v1}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    return-object v1
.end method

.method public static fixupQualifiedNode(Lcom/adobe/xmp/impl/XMPNode;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "xmpParent"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v1

    .line 2
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v2

    if-nez v2, :cond_0

    .line 4
    invoke-virtual {v1, v0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    .line 5
    invoke-virtual {v1, v2}, Lcom/adobe/xmp/impl/XMPNode;->removeQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 6
    invoke-virtual {p0, v2}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_0

    .line 7
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 v0, 0xcb

    const-string v1, "Redundant xml:lang for rdf:value element"

    invoke-direct {p0, v1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 8
    :cond_1
    :goto_0
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v2

    if-gt v0, v2, :cond_2

    .line 9
    invoke-virtual {v1, v0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    .line 10
    invoke-virtual {p0, v2}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x2

    .line 11
    :goto_1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    if-gt v0, v2, :cond_3

    .line 12
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    .line 13
    invoke-virtual {p0, v2}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/adobe/xmp/impl/XMPNode;->hasValueChild:Z

    .line 15
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    const/16 v3, 0x100

    .line 16
    invoke-virtual {v2, v3, v0}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 17
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/adobe/xmp/options/PropertyOptions;->mergeWith(Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 18
    iget-object v0, v1, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 19
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 21
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 23
    invoke-virtual {p0, v1}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_2

    :cond_4
    return-void
.end method

.method public static getRDFTermKind(Lorg/w3c/dom/Node;)I
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "node"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ID"

    const-string v3, "about"

    const-string v4, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    if-nez v1, :cond_1

    .line 3
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_0
    instance-of v5, p0, Lorg/w3c/dom/Attr;

    if-eqz v5, :cond_1

    check-cast p0, Lorg/w3c/dom/Attr;

    .line 4
    invoke-interface {p0}, Lorg/w3c/dom/Attr;->getOwnerElement()Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    move-object v1, v4

    .line 5
    :cond_1
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const-string p0, "li"

    .line 6
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/16 p0, 0x9

    return p0

    :cond_2
    const-string p0, "parseType"

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x4

    return p0

    :cond_3
    const-string p0, "Description"

    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const/16 p0, 0x8

    return p0

    .line 9
    :cond_4
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    const/4 p0, 0x3

    return p0

    :cond_5
    const-string p0, "resource"

    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    const/4 p0, 0x5

    return p0

    :cond_6
    const-string p0, "RDF"

    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7

    const/4 p0, 0x1

    return p0

    .line 12
    :cond_7
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    const/4 p0, 0x2

    return p0

    :cond_8
    const-string p0, "nodeID"

    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_9

    const/4 p0, 0x6

    return p0

    :cond_9
    const-string p0, "datatype"

    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x7

    return p0

    :cond_a
    const-string p0, "aboutEach"

    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b

    const/16 p0, 0xa

    return p0

    :cond_b
    const-string p0, "aboutEachPrefix"

    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c

    const/16 p0, 0xb

    return p0

    :cond_c
    const-string p0, "bagID"

    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/16 p0, 0xc

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public static isWhitespaceNode(Lorg/w3c/dom/Node;)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "node"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    return v1

    .line 2
    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object p0

    move v0, v1

    .line 3
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 4
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_1

    return v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public static rdf_EmptyPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 16
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "xmp",
            "xmpParent",
            "xmlNode",
            "isTopLevel"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 1
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v1

    if-nez v1, :cond_18

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 2
    :goto_0
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v9

    const-string v10, "Unrecognized attribute of empty property element"

    const/4 v11, 0x6

    const/4 v12, 0x5

    const-string v13, "xml:lang"

    const/4 v14, 0x2

    const-string v15, "xmlns"

    if-ge v4, v9, :cond_b

    .line 3
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v9

    invoke-interface {v9, v4}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    .line 4
    invoke-interface {v9}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    .line 5
    invoke-interface {v9}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_1

    .line 6
    :cond_0
    invoke-static {v9}, Lcom/adobe/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v3

    const-string v15, "Empty property element can\'t have both rdf:value and rdf:resource"

    const/16 v2, 0xcb

    if-eqz v3, :cond_7

    if-eq v3, v14, :cond_a

    const-string v13, "Empty property element can\'t have both rdf:resource and rdf:nodeID"

    if-eq v3, v12, :cond_3

    if-ne v3, v11, :cond_2

    if-nez v6, :cond_1

    const/4 v8, 0x1

    goto :goto_1

    .line 7
    :cond_1
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/16 v1, 0xca

    invoke-direct {v0, v13, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_2
    const/16 v1, 0xca

    .line 8
    new-instance v0, Lcom/adobe/xmp/XMPException;

    invoke-direct {v0, v10, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_3
    if-nez v8, :cond_6

    if-nez v5, :cond_5

    if-nez v5, :cond_4

    move-object v1, v9

    :cond_4
    const/4 v6, 0x1

    goto :goto_1

    .line 9
    :cond_5
    new-instance v0, Lcom/adobe/xmp/XMPException;

    invoke-direct {v0, v15, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 10
    :cond_6
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/16 v1, 0xca

    invoke-direct {v0, v13, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 11
    :cond_7
    invoke-interface {v9}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v3

    const-string v10, "value"

    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 12
    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    const-string v10, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    if-nez v6, :cond_8

    move-object v1, v9

    const/4 v5, 0x1

    goto :goto_1

    .line 13
    :cond_8
    new-instance v0, Lcom/adobe/xmp/XMPException;

    invoke-direct {v0, v15, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 14
    :cond_9
    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    const/4 v7, 0x1

    :cond_a
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_b
    const-string v2, ""

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move/from16 v8, p3

    .line 15
    invoke-static {v0, v3, v4, v2, v8}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v3

    if-nez v5, :cond_d

    if-eqz v6, :cond_c

    goto :goto_2

    :cond_c
    if-eqz v7, :cond_f

    .line 16
    invoke-virtual {v3}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    const/16 v5, 0x100

    const/4 v6, 0x1

    .line 17
    invoke-virtual {v2, v5, v6}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    goto :goto_3

    :cond_d
    :goto_2
    const/4 v6, 0x1

    if-eqz v1, :cond_e

    .line 18
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    .line 19
    :cond_e
    iput-object v2, v3, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    if-nez v5, :cond_f

    .line 20
    invoke-virtual {v3}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    .line 21
    invoke-virtual {v2, v14, v6}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    :cond_f
    const/4 v6, 0x0

    :goto_3
    const/4 v2, 0x0

    .line 22
    :goto_4
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v5

    if-ge v2, v5, :cond_17

    .line 23
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v5

    invoke-interface {v5, v2}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    if-eq v5, v1, :cond_16

    .line 24
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v15, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_16

    .line 25
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_10

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v15, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10

    goto :goto_5

    .line 26
    :cond_10
    invoke-static {v5}, Lcom/adobe/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v7

    if-eqz v7, :cond_13

    if-eq v7, v14, :cond_16

    if-eq v7, v12, :cond_12

    if-ne v7, v11, :cond_11

    goto :goto_5

    .line 27
    :cond_11
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/16 v1, 0xca

    invoke-direct {v0, v10, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 28
    :cond_12
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    const-string v7, "rdf:resource"

    invoke-static {v3, v7, v5}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_5

    :cond_13
    if-nez v6, :cond_14

    .line 29
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    .line 30
    invoke-static {v3, v7, v5}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_5

    .line 31
    :cond_14
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 32
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v13, v5}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_5

    .line 33
    :cond_15
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {v0, v3, v5, v7, v8}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_6

    :cond_16
    :goto_5
    const/4 v8, 0x0

    :goto_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_17
    return-void

    .line 34
    :cond_18
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Nested content not allowed with rdf:resource or property attributes"

    const/16 v2, 0xca

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static rdf_LiteralPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "xmp",
            "xmpParent",
            "xmlNode",
            "isTopLevel"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-static {p0, p1, p2, v0, p3}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p0

    const/4 p1, 0x0

    move p3, p1

    .line 2
    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v0

    const/16 v1, 0xca

    if-ge p3, v0, :cond_4

    .line 3
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    invoke-interface {v0, p3}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 4
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v2

    const-string v3, "xmlns"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 5
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 6
    :cond_0
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    .line 7
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v3

    .line 8
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "xml:lang"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 9
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v5, v0}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_1

    :cond_1
    const-string v0, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "ID"

    .line 11
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "datatype"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 12
    :cond_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid attribute for literal property element"

    invoke-direct {p0, p1, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_3
    :goto_1
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_4
    const-string p3, ""

    .line 13
    :goto_2
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-ge p1, v0, :cond_7

    .line 14
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 15
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_6

    .line 16
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {p3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_3

    :cond_5
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object p3, v0

    :goto_3
    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 17
    :cond_6
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid child of literal property element"

    invoke-direct {p0, p1, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 18
    :cond_7
    iput-object p3, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    return-void
.end method

.method public static rdf_NodeElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "xmp",
            "xmpParent",
            "xmlNode",
            "isTopLevel"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/adobe/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v0

    const/16 v1, 0xca

    const/16 v2, 0x8

    if-eq v0, v2, :cond_1

    if-nez v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Node element must be rdf:Description or typed node"

    invoke-direct {p0, p1, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_1
    :goto_0
    const/16 v2, 0xcb

    if-eqz p3, :cond_3

    if-eqz v0, :cond_2

    goto :goto_1

    .line 3
    :cond_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Top level typed node not allowed"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_3
    :goto_1
    const/4 v0, 0x0

    move v3, v0

    .line 4
    :goto_2
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v4

    if-ge v0, v4, :cond_c

    .line 5
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v4

    invoke-interface {v4, v0}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 6
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v5

    const-string v6, "xmlns"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_b

    .line 7
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_4

    .line 8
    :cond_4
    invoke-static {v4}, Lcom/adobe/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v5

    if-eqz v5, :cond_a

    const/4 v6, 0x6

    const/4 v7, 0x3

    if-eq v5, v6, :cond_6

    const/4 v6, 0x2

    if-eq v5, v6, :cond_6

    if-ne v5, v7, :cond_5

    goto :goto_3

    .line 9
    :cond_5
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid nodeElement attribute"

    invoke-direct {p0, p1, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_6
    :goto_3
    if-gtz v3, :cond_9

    add-int/lit8 v3, v3, 0x1

    if-eqz p3, :cond_b

    if-ne v5, v7, :cond_b

    .line 10
    iget-object v5, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    if-eqz v5, :cond_8

    .line 11
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_8

    .line 12
    iget-object v5, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 13
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    goto :goto_4

    .line 14
    :cond_7
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Mismatched top level rdf:about values"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 15
    :cond_8
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    .line 16
    iput-object v4, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    goto :goto_4

    .line 17
    :cond_9
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Mutally exclusive about, ID, nodeID attributes"

    invoke-direct {p0, p1, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 18
    :cond_a
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, p1, v4, v5, p3}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    :cond_b
    :goto_4
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    .line 19
    :cond_c
    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_PropertyElementList(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    return-void
.end method

.method public static rdf_PropertyElementList(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 16
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "xmp",
            "xmpParent",
            "xmlParent",
            "isTopLevel"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    const/4 v3, 0x0

    .line 1
    :goto_0
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v3, v4, :cond_37

    .line 2
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-interface {v4, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 3
    invoke-static {v4}, Lcom/adobe/xmp/impl/ParseRDF;->isWhitespaceNode(Lorg/w3c/dom/Node;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto/16 :goto_17

    .line 4
    :cond_0
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_36

    .line 5
    invoke-static {v4}, Lcom/adobe/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v5

    const/16 v7, 0x8

    if-eq v5, v7, :cond_4

    const/16 v7, 0xa

    if-gt v7, v5, :cond_1

    const/16 v7, 0xc

    if-gt v5, v7, :cond_1

    move v7, v6

    goto :goto_1

    :cond_1
    const/4 v7, 0x0

    :goto_1
    if-eqz v7, :cond_2

    goto :goto_3

    :cond_2
    if-gt v6, v5, :cond_3

    const/4 v7, 0x7

    if-gt v5, v7, :cond_3

    move v5, v6

    goto :goto_2

    :cond_3
    const/4 v5, 0x0

    :goto_2
    xor-int/2addr v5, v6

    goto :goto_4

    :cond_4
    :goto_3
    const/4 v5, 0x0

    :goto_4
    if-eqz v5, :cond_35

    .line 6
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 7
    :goto_5
    invoke-interface {v5}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v8

    const-string v9, "xmlns"

    if-ge v6, v8, :cond_8

    .line 8
    invoke-interface {v5, v6}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 9
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_5

    .line 10
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v10

    if-nez v10, :cond_7

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    :cond_5
    if-nez v7, :cond_6

    .line 11
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 12
    :cond_6
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    :cond_8
    if-eqz v7, :cond_9

    .line 13
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 14
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 15
    invoke-interface {v5, v7}, Lorg/w3c/dom/NamedNodeMap;->removeNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    goto :goto_6

    .line 16
    :cond_9
    invoke-interface {v5}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v6

    const/4 v7, 0x3

    if-le v6, v7, :cond_a

    .line 17
    invoke-static {v0, v1, v4, v2}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_EmptyPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto/16 :goto_17

    :cond_a
    const/4 v6, 0x0

    .line 18
    :goto_7
    invoke-interface {v5}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v7

    const-string v8, ""

    const-string v10, "ID"

    const-string v11, "xml:lang"

    const-string v12, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    if-ge v6, v7, :cond_18

    .line 19
    invoke-interface {v5, v6}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 20
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v13

    .line 21
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v14

    .line 22
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v15

    .line 23
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 24
    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    goto :goto_8

    :cond_b
    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    :cond_c
    :goto_8
    const-string v5, "datatype"

    .line 25
    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 26
    invoke-static {v0, v1, v4, v2}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_LiteralPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto/16 :goto_17

    :cond_d
    const-string v5, "parseType"

    .line 27
    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_17

    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_e

    goto/16 :goto_b

    :cond_e
    const-string v6, "Literal"

    .line 28
    invoke-virtual {v6, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_16

    const-string v6, "Resource"

    .line 29
    invoke-virtual {v6, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_14

    .line 30
    invoke-static {v0, v1, v4, v8, v2}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v6

    .line 31
    invoke-virtual {v6}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v7

    const/16 v8, 0x100

    const/4 v13, 0x1

    .line 32
    invoke-virtual {v7, v8, v13}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    const/4 v7, 0x0

    .line 33
    :goto_9
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v8

    if-ge v7, v8, :cond_13

    .line 34
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v8

    invoke-interface {v8, v7}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 35
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_12

    .line 36
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v13

    if-nez v13, :cond_f

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_f

    goto :goto_a

    .line 37
    :cond_f
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v13

    .line 38
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v14

    .line 39
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_10

    .line 40
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v11, v8}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_a

    .line 41
    :cond_10
    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 42
    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_12

    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_11

    goto :goto_a

    .line 43
    :cond_11
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Invalid attribute for ParseTypeResource property element"

    const/16 v2, 0xca

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_12
    :goto_a
    add-int/lit8 v7, v7, 0x1

    goto :goto_9

    :cond_13
    const/4 v5, 0x0

    .line 44
    invoke-static {v0, v6, v4, v5}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_PropertyElementList(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 45
    iget-boolean v4, v6, Lcom/adobe/xmp/impl/XMPNode;->hasValueChild:Z

    if-eqz v4, :cond_34

    .line 46
    invoke-static {v6}, Lcom/adobe/xmp/impl/ParseRDF;->fixupQualifiedNode(Lcom/adobe/xmp/impl/XMPNode;)V

    goto/16 :goto_17

    :cond_14
    const-string v0, "Collection"

    .line 47
    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 48
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "ParseTypeCollection property element not allowed"

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_15
    const/16 v0, 0xcb

    .line 49
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "ParseTypeOther property element not allowed"

    invoke-direct {v1, v2, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    :cond_16
    const/16 v0, 0xcb

    .line 50
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "ParseTypeLiteral property element not allowed"

    invoke-direct {v1, v2, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 51
    :cond_17
    :goto_b
    invoke-static {v0, v1, v4, v2}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_EmptyPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto/16 :goto_17

    .line 52
    :cond_18
    invoke-interface {v4}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v5

    if-eqz v5, :cond_33

    const/4 v5, 0x0

    .line 53
    :goto_c
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v5, v6, :cond_32

    .line 54
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    .line 55
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v6

    const/4 v7, 0x3

    if-eq v6, v7, :cond_31

    if-eqz v2, :cond_19

    .line 56
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "iX:changes"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    goto/16 :goto_17

    .line 57
    :cond_19
    invoke-static {v0, v1, v4, v8, v2}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    const/4 v6, 0x0

    .line 58
    :goto_d
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v7

    if-ge v6, v7, :cond_1e

    .line 59
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v7

    invoke-interface {v7, v6}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 60
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1d

    .line 61
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_1a

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1a

    goto :goto_e

    .line 62
    :cond_1a
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v8

    .line 63
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v13

    .line 64
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1b

    .line 65
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v11, v7}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_e

    .line 66
    :cond_1b
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1c

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1c

    goto :goto_e

    .line 67
    :cond_1c
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Invalid attribute for resource property element"

    const/16 v2, 0xca

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_1d
    :goto_e
    add-int/lit8 v6, v6, 0x1

    goto :goto_d

    :cond_1e
    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 68
    :goto_f
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v6, v8, :cond_2f

    .line 69
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v8

    invoke-interface {v8, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 70
    invoke-static {v8}, Lcom/adobe/xmp/impl/ParseRDF;->isWhitespaceNode(Lorg/w3c/dom/Node;)Z

    move-result v9

    if-nez v9, :cond_2e

    .line 71
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_2c

    if-nez v7, :cond_2c

    .line 72
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v12, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    .line 73
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v9

    const/16 v11, 0x200

    if-eqz v7, :cond_1f

    const-string v13, "Bag"

    .line 74
    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1f

    .line 75
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v7

    .line 76
    invoke-virtual {v7, v11, v10}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    goto :goto_10

    :cond_1f
    const/16 v13, 0x400

    if-eqz v7, :cond_20

    const-string v14, "Seq"

    .line 77
    invoke-virtual {v14, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_20

    .line 78
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v7

    .line 79
    invoke-virtual {v7, v11, v10}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 80
    invoke-virtual {v7, v13, v10}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    goto :goto_10

    :cond_20
    if-eqz v7, :cond_22

    const-string v14, "Alt"

    .line 81
    invoke-virtual {v14, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_22

    .line 82
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v7

    .line 83
    invoke-virtual {v7, v11, v10}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 84
    invoke-virtual {v7, v13, v10}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    const/16 v9, 0x800

    .line 85
    invoke-virtual {v7, v9, v10}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    :cond_21
    :goto_10
    const/4 v7, 0x0

    goto :goto_11

    .line 86
    :cond_22
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v11

    const/16 v13, 0x100

    .line 87
    invoke-virtual {v11, v13, v10}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    if-nez v7, :cond_21

    const-string v7, "Description"

    .line 88
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_21

    .line 89
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_23

    .line 90
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v11, v10

    invoke-static {v9, v11}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v7, 0x3a

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v9, "rdf:type"

    .line 91
    invoke-static {v5, v9, v7}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_10

    .line 92
    :cond_23
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "All XML elements must be in a namespace"

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 93
    :goto_11
    invoke-static {v0, v5, v8, v7}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_NodeElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 94
    iget-boolean v8, v5, Lcom/adobe/xmp/impl/XMPNode;->hasValueChild:Z

    if-eqz v8, :cond_24

    .line 95
    invoke-static {v5}, Lcom/adobe/xmp/impl/ParseRDF;->fixupQualifiedNode(Lcom/adobe/xmp/impl/XMPNode;)V

    goto/16 :goto_14

    .line 96
    :cond_24
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v8

    if-eqz v8, :cond_2a

    .line 97
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v8

    if-eqz v8, :cond_2a

    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v8

    if-eqz v8, :cond_2a

    .line 98
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v8

    :cond_25
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_26

    .line 99
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/xmp/impl/XMPNode;

    .line 100
    invoke-virtual {v9}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v9

    if-eqz v9, :cond_25

    const/4 v7, 0x1

    :cond_26
    if-eqz v7, :cond_2a

    .line 101
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v7

    const/16 v8, 0x1000

    const/4 v9, 0x1

    .line 102
    invoke-virtual {v7, v8, v9}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 103
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v7

    if-nez v7, :cond_27

    goto :goto_14

    :cond_27
    const/4 v7, 0x2

    move v8, v7

    .line 104
    :goto_12
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v9

    if-gt v8, v9, :cond_2a

    .line 105
    invoke-virtual {v5, v8}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v9

    .line 106
    invoke-virtual {v9}, Lcom/adobe/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v10

    if-eqz v10, :cond_29

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v10

    .line 107
    iget-object v10, v10, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    const-string v11, "x-default"

    .line 108
    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_29

    .line 109
    :try_start_0
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v10

    add-int/lit8 v11, v8, -0x1

    invoke-interface {v10, v11}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 110
    iget-object v10, v5, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_28

    const/4 v10, 0x0

    .line 111
    iput-object v10, v5, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_28
    const/4 v10, 0x1

    .line 112
    :try_start_1
    invoke-virtual {v5, v10, v9}, Lcom/adobe/xmp/impl/XMPNode;->addChild(ILcom/adobe/xmp/impl/XMPNode;)V
    :try_end_1
    .catch Lcom/adobe/xmp/XMPException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_13

    :catch_0
    const/4 v10, 0x1

    :catch_1
    :goto_13
    if-ne v8, v7, :cond_2b

    .line 113
    invoke-virtual {v5, v7}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v7

    .line 114
    iget-object v8, v9, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 115
    iput-object v8, v7, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    goto :goto_15

    :cond_29
    add-int/lit8 v8, v8, 0x1

    goto :goto_12

    :cond_2a
    :goto_14
    const/4 v10, 0x1

    :cond_2b
    :goto_15
    move v7, v10

    goto :goto_16

    :cond_2c
    if-eqz v7, :cond_2d

    .line 116
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Invalid child of resource property element"

    const/16 v2, 0xca

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_2d
    const/16 v0, 0xca

    .line 117
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Children of resource property element must be XML elements"

    invoke-direct {v1, v2, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    :cond_2e
    :goto_16
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_f

    :cond_2f
    const/16 v4, 0xca

    if-eqz v7, :cond_30

    goto :goto_17

    .line 118
    :cond_30
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Missing child of resource property element"

    invoke-direct {v0, v1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_31
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_c

    .line 119
    :cond_32
    invoke-static {v0, v1, v4, v2}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_LiteralPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto :goto_17

    .line 120
    :cond_33
    invoke-static {v0, v1, v4, v2}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_EmptyPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    :cond_34
    :goto_17
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 121
    :cond_35
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Invalid property element name"

    const/16 v2, 0xca

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_36
    const/16 v0, 0xca

    .line 122
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Expected property element node not found"

    invoke-direct {v1, v2, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    :cond_37
    return-void
.end method
