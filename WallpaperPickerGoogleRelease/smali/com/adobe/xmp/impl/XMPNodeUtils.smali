.class public Lcom/adobe/xmp/impl/XMPNodeUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "arrayNode",
            "itemLang",
            "itemValue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/adobe/xmp/impl/XMPNode;

    const-string v1, "[]"

    const/4 v2, 0x0

    invoke-direct {v0, v1, p2, v2}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 2
    new-instance p2, Lcom/adobe/xmp/impl/XMPNode;

    const-string v1, "xml:lang"

    invoke-direct {p2, v1, p1, v2}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 3
    invoke-virtual {v0, p2}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 4
    iget-object p1, p2, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    const-string p2, "x-default"

    .line 5
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 6
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/adobe/xmp/impl/XMPNode;->addChild(ILcom/adobe/xmp/impl/XMPNode;)V

    :goto_0
    return-void
.end method

.method public static deleteNode(Lcom/adobe/xmp/impl/XMPNode;)V
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
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->parent:Lcom/adobe/xmp/impl/XMPNode;

    .line 2
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    const/16 v2, 0x20

    .line 3
    invoke-virtual {v1, v2}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4
    invoke-virtual {v0, p0}, Lcom/adobe/xmp/impl/XMPNode;->removeQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {v0, p0}, Lcom/adobe/xmp/impl/XMPNode;->removeChild(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 6
    :goto_0
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result p0

    if-nez p0, :cond_1

    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p0

    invoke-virtual {p0}, Lcom/adobe/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 7
    iget-object p0, v0, Lcom/adobe/xmp/impl/XMPNode;->parent:Lcom/adobe/xmp/impl/XMPNode;

    .line 8
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->removeChild(Lcom/adobe/xmp/impl/XMPNode;)V

    :cond_1
    return-void
.end method

.method public static findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "parent",
            "childName",
            "createNodes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isStruct()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2
    iget-boolean v0, p0, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    const/16 v2, 0x66

    if-eqz v0, :cond_1

    .line 3
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p2, :cond_2

    .line 4
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    const/16 v2, 0x100

    .line 5
    invoke-virtual {v0, v2, v1}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    goto :goto_0

    .line 6
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Named children not allowed for arrays"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 7
    :cond_1
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Named children only allowed for schemas and structs"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 8
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/impl/XMPNode;->find(Ljava/util/List;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    if-nez v0, :cond_3

    if-eqz p2, :cond_3

    .line 9
    new-instance p2, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {p2}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    .line 10
    new-instance v0, Lcom/adobe/xmp/impl/XMPNode;

    const/4 v2, 0x0

    .line 11
    invoke-direct {v0, p1, v2, p2}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 12
    iput-boolean v1, v0, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    .line 13
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    :cond_3
    return-object v0
.end method

.method public static findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "xmpTree",
            "xpath",
            "createNodes",
            "leafOptions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/xpath/XMPPath;->size()I

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Lcom/adobe/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    move-result-object v1

    .line 3
    iget-object v1, v1, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    const/4 v2, 0x0

    .line 4
    invoke-static {p0, v1, v2, p2}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p0

    if-nez p0, :cond_0

    return-object v2

    .line 5
    :cond_0
    iget-boolean v1, p0, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    if-eqz v1, :cond_1

    .line 6
    iput-boolean v0, p0, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    move-object v1, p0

    goto :goto_0

    :cond_1
    move-object v1, v2

    :goto_0
    const/4 v3, 0x1

    move v4, v3

    .line 7
    :goto_1
    :try_start_0
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/xpath/XMPPath;->size()I

    move-result v5

    if-ge v4, v5, :cond_7

    .line 8
    invoke-virtual {p1, v4}, Lcom/adobe/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    move-result-object v5

    invoke-static {p0, v5, p2}, Lcom/adobe/xmp/impl/XMPNodeUtils;->followXPathStep(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPathSegment;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p0

    if-nez p0, :cond_3

    if-eqz p2, :cond_2

    .line 9
    invoke-static {v1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->deleteNode(Lcom/adobe/xmp/impl/XMPNode;)V

    :cond_2
    return-object v2

    .line 10
    :cond_3
    iget-boolean v5, p0, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    if-eqz v5, :cond_6

    .line 11
    iput-boolean v0, p0, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    if-ne v4, v3, :cond_4

    .line 12
    invoke-virtual {p1, v4}, Lcom/adobe/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    move-result-object v5

    .line 13
    iget-boolean v5, v5, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->alias:Z

    if-eqz v5, :cond_4

    .line 14
    invoke-virtual {p1, v4}, Lcom/adobe/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    move-result-object v5

    .line 15
    iget v5, v5, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->aliasForm:I

    if-eqz v5, :cond_4

    .line 16
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {p1, v4}, Lcom/adobe/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    move-result-object v6

    .line 17
    iget v6, v6, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->aliasForm:I

    .line 18
    invoke-virtual {v5, v6, v3}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    goto :goto_2

    .line 19
    :cond_4
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/xpath/XMPPath;->size()I

    move-result v5

    sub-int/2addr v5, v3

    if-ge v4, v5, :cond_5

    .line 20
    invoke-virtual {p1, v4}, Lcom/adobe/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    move-result-object v5

    .line 21
    iget v5, v5, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->kind:I

    if-ne v5, v3, :cond_5

    .line 22
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v5

    if-nez v5, :cond_5

    .line 23
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    const/16 v6, 0x100

    .line 24
    invoke-virtual {v5, v6, v3}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_5
    :goto_2
    if-nez v1, :cond_6

    move-object v1, p0

    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_7
    if-eqz v1, :cond_8

    .line 25
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/adobe/xmp/options/PropertyOptions;->mergeWith(Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 26
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    :cond_8
    return-object p0

    :catch_0
    move-exception p0

    if-eqz v1, :cond_9

    .line 28
    invoke-static {v1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->deleteNode(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 29
    :cond_9
    throw p0

    .line 30
    :cond_a
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0x66

    const-string p2, "Empty XMPPath"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public static findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "tree",
            "namespaceURI",
            "suggestedPrefix",
            "createNodes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 2
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/impl/XMPNode;->find(Ljava/util/List;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    if-nez v0, :cond_2

    if-eqz p3, :cond_2

    .line 3
    new-instance v0, Lcom/adobe/xmp/impl/XMPNode;

    new-instance p3, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {p3}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    const/high16 v1, -0x80000000

    const/4 v2, 0x1

    .line 4
    invoke-virtual {p3, v1, v2}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    const/4 v1, 0x0

    .line 5
    invoke-direct {v0, p1, v1, p3}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 6
    iput-boolean v2, v0, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    .line 7
    sget-object p3, Lcom/adobe/xmp/XMPMetaFactory;->schema:Lcom/adobe/xmp/XMPSchemaRegistry;

    .line 8
    check-cast p3, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;

    invoke-virtual {p3, p1}, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    if-nez p3, :cond_1

    if-eqz p2, :cond_0

    .line 9
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    if-eqz p3, :cond_0

    .line 10
    sget-object p3, Lcom/adobe/xmp/XMPMetaFactory;->schema:Lcom/adobe/xmp/XMPSchemaRegistry;

    .line 11
    check-cast p3, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;

    invoke-virtual {p3, p1, p2}, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    .line 12
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0x65

    const-string p2, "Unregistered schema namespace URI"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 13
    :cond_1
    :goto_0
    iput-object p3, v0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 14
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    :cond_2
    return-object v0
.end method

.method public static findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "tree",
            "namespaceURI",
            "createNodes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-static {p0, p1, v0, p2}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p0

    return-object p0
.end method

.method public static followXPathStep(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPathSegment;Z)Lcom/adobe/xmp/impl/XMPNode;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "parentNode",
            "nextStep",
            "createNodes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    iget v0, p1, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->kind:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 2
    iget-object p1, p1, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 3
    invoke-static {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    goto/16 :goto_6

    :cond_0
    const/4 v3, 0x2

    if-ne v0, v3, :cond_2

    .line 4
    iget-object p1, p1, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 5
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 6
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/impl/XMPNode;->find(Ljava/util/List;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_1

    .line 7
    new-instance p2, Lcom/adobe/xmp/impl/XMPNode;

    .line 8
    invoke-direct {p2, p1, v2, v2}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 9
    iput-boolean v1, p2, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    .line 10
    invoke-virtual {p0, p2}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    move-object v2, p2

    goto/16 :goto_6

    :cond_1
    move-object v2, v0

    goto/16 :goto_6

    .line 11
    :cond_2
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result v3

    const/16 v4, 0x66

    if-eqz v3, :cond_13

    const/4 v3, 0x3

    const-string v5, "[]"

    if-ne v0, v3, :cond_4

    .line 12
    iget-object p1, p1, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 13
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    if-lt p1, v1, :cond_3

    if-eqz p2, :cond_10

    .line 15
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result p2

    add-int/2addr p2, v1

    if-ne p1, p2, :cond_10

    .line 16
    new-instance p2, Lcom/adobe/xmp/impl/XMPNode;

    .line 17
    invoke-direct {p2, v5, v2, v2}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 18
    iput-boolean v1, p2, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    .line 19
    invoke-virtual {p0, p2}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    goto/16 :goto_5

    .line 20
    :cond_3
    :try_start_1
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Array index must be larger than zero"

    invoke-direct {p0, p1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 21
    :catch_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Array index not digits."

    invoke-direct {p0, p1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_4
    const/4 p2, 0x4

    if-ne v0, p2, :cond_5

    .line 22
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result p1

    goto/16 :goto_5

    :cond_5
    const/4 p2, 0x6

    const/4 v3, -0x1

    const/4 v6, 0x0

    if-ne v0, p2, :cond_b

    .line 23
    iget-object p1, p1, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 24
    invoke-static {p1}, Lcom/adobe/xmp/impl/Utils;->splitNameAndValue(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 25
    aget-object p2, p1, v6

    .line 26
    aget-object p1, p1, v1

    move v0, v1

    .line 27
    :goto_0
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v5

    if-gt v0, v5, :cond_a

    if-gez v3, :cond_a

    .line 28
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    .line 29
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/xmp/options/PropertyOptions;->isStruct()Z

    move-result v6

    if-eqz v6, :cond_9

    move v6, v1

    .line 30
    :goto_1
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v7

    if-gt v6, v7, :cond_8

    .line 31
    invoke-virtual {v5, v6}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v7

    .line 32
    iget-object v8, v7, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 33
    invoke-virtual {p2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    goto :goto_2

    .line 34
    :cond_6
    iget-object v7, v7, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 35
    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    move v3, v0

    goto :goto_3

    :cond_7
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_8
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 36
    :cond_9
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Field selector must be used on array of struct"

    invoke-direct {p0, p1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_a
    move p1, v3

    goto/16 :goto_5

    :cond_b
    const/4 p2, 0x5

    if-ne v0, p2, :cond_12

    .line 37
    iget-object p2, p1, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 38
    invoke-static {p2}, Lcom/adobe/xmp/impl/Utils;->splitNameAndValue(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    .line 39
    aget-object v0, p2, v6

    .line 40
    aget-object p2, p2, v1

    .line 41
    iget p1, p1, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->aliasForm:I

    const-string v4, "xml:lang"

    .line 42
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 43
    invoke-static {p2}, Lcom/adobe/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 44
    invoke-static {p0, p2}, Lcom/adobe/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result p2

    if-gez p2, :cond_c

    and-int/lit16 p1, p1, 0x1000

    if-lez p1, :cond_c

    .line 45
    new-instance p1, Lcom/adobe/xmp/impl/XMPNode;

    .line 46
    invoke-direct {p1, v5, v2, v2}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 47
    new-instance p2, Lcom/adobe/xmp/impl/XMPNode;

    const-string v0, "x-default"

    invoke-direct {p2, v4, v0, v2}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 48
    invoke-virtual {p1, p2}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 49
    invoke-virtual {p0, v1, p1}, Lcom/adobe/xmp/impl/XMPNode;->addChild(ILcom/adobe/xmp/impl/XMPNode;)V

    move p1, v1

    goto :goto_5

    :cond_c
    move p1, p2

    goto :goto_5

    :cond_d
    move p1, v1

    .line 50
    :goto_4
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v4

    if-ge p1, v4, :cond_a

    .line 51
    invoke-virtual {p0, p1}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v4

    .line 52
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v4

    :cond_e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_f

    .line 53
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/xmp/impl/XMPNode;

    .line 54
    iget-object v6, v5, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 55
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 56
    iget-object v5, v5, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 57
    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    goto :goto_5

    :cond_f
    add-int/lit8 p1, p1, 0x1

    goto :goto_4

    :cond_10
    :goto_5
    if-gt v1, p1, :cond_11

    .line 58
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result p2

    if-gt p1, p2, :cond_11

    .line 59
    invoke-virtual {p0, p1}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    :cond_11
    :goto_6
    return-object v2

    .line 60
    :cond_12
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0x9

    const-string p2, "Unknown array indexing step in FollowXPathStep"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 61
    :cond_13
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Indexing applied to non-array"

    invoke-direct {p0, p1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public static lookupLanguageItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;)I
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "arrayNode",
            "language"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    move v1, v0

    .line 2
    :goto_0
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    if-gt v1, v2, :cond_2

    .line 3
    invoke-virtual {p0, v1}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    .line 4
    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2, v0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v3

    .line 5
    iget-object v3, v3, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    const-string v4, "xml:lang"

    .line 6
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 7
    :cond_0
    invoke-virtual {v2, v0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    .line 8
    iget-object v2, v2, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 9
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    return v1

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, -0x1

    return p0

    .line 10
    :cond_3
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0x66

    const-string v0, "Language item must be used on array"

    invoke-direct {p0, v0, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public static verifySetOptions(Lcom/adobe/xmp/options/PropertyOptions;Ljava/lang/Object;)Lcom/adobe/xmp/options/PropertyOptions;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "options",
            "itemValue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    const/16 p1, 0x800

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result p1

    const/16 v1, 0x400

    if-eqz p1, :cond_1

    .line 4
    invoke-virtual {p0, v1, v0}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 5
    :cond_1
    invoke-virtual {p0, v1}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result p1

    if-eqz p1, :cond_2

    const/16 p1, 0x200

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 7
    :cond_2
    invoke-virtual {p0}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result p1

    .line 8
    iget p1, p0, Lcom/adobe/xmp/options/Options;->options:I

    .line 9
    invoke-virtual {p0, p1}, Lcom/adobe/xmp/options/PropertyOptions;->assertConsistency(I)V

    return-object p0
.end method
