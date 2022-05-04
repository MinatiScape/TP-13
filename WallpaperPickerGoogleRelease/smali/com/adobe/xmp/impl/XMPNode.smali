.class public Lcom/adobe/xmp/impl/XMPNode;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# instance fields
.field public alias:Z

.field public children:Ljava/util/List;

.field public hasAliases:Z

.field public hasValueChild:Z

.field public implicit:Z

.field public name:Ljava/lang/String;

.field public options:Lcom/adobe/xmp/options/PropertyOptions;

.field public parent:Lcom/adobe/xmp/impl/XMPNode;

.field public qualifier:Ljava/util/List;

.field public value:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/adobe/xmp/impl/XMPNode;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "value",
            "options"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 3
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 4
    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    .line 5
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 6
    iput-object p2, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 7
    iput-object p3, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    return-void
.end method


# virtual methods
.method public addChild(ILcom/adobe/xmp/impl/XMPNode;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "index",
            "node"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    iget-object v0, p2, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 2
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->assertChildNotExisting(Ljava/lang/String;)V

    .line 3
    iput-object p0, p2, Lcom/adobe/xmp/impl/XMPNode;->parent:Lcom/adobe/xmp/impl/XMPNode;

    .line 4
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object p0

    add-int/lit8 p1, p1, -0x1

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method public addChild(Lcom/adobe/xmp/impl/XMPNode;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "node"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 5
    iget-object v0, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 6
    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->assertChildNotExisting(Ljava/lang/String;)V

    .line 7
    iput-object p0, p1, Lcom/adobe/xmp/impl/XMPNode;->parent:Lcom/adobe/xmp/impl/XMPNode;

    .line 8
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "qualNode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    const-string v1, "[]"

    .line 2
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 3
    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-virtual {p0, v1, v0}, Lcom/adobe/xmp/impl/XMPNode;->find(Ljava/util/List;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 4
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0x16

    invoke-static {v0, p1}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result p1

    const-string v1, "Duplicate \'"

    const-string v2, "\' qualifier"

    invoke-static {p1, v1, v0, v2}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0xcb

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 5
    :cond_1
    :goto_0
    iput-object p0, p1, Lcom/adobe/xmp/impl/XMPNode;->parent:Lcom/adobe/xmp/impl/XMPNode;

    .line 6
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    const/16 v1, 0x20

    const/4 v2, 0x1

    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 8
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    const/16 v1, 0x10

    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 10
    iget-object v0, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    const-string v1, "xml:lang"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 11
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    const/16 v1, 0x40

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 13
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    invoke-interface {p0, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_1

    .line 14
    :cond_2
    iget-object v0, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    const-string v1, "rdf:type"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 15
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    const/16 v1, 0x80

    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 17
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v0

    .line 18
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    invoke-virtual {p0}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result p0

    .line 19
    invoke-interface {v0, p0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_1

    .line 20
    :cond_3
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    return-void
.end method

.method public final assertChildNotExisting(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "childName"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const-string v0, "[]"

    .line 1
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/impl/XMPNode;->find(Ljava/util/List;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p0

    if-nez p0, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 v0, 0x23

    invoke-static {p1, v0}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v0

    const-string v1, "Duplicate property or field node \'"

    const-string v2, "\'"

    invoke-static {v0, v1, p1, v2}, Landroidx/viewpager2/widget/FakeDrag$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0xcb

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    .line 2
    iget v1, v1, Lcom/adobe/xmp/options/Options;->options:I

    .line 3
    invoke-direct {v0, v1}, Lcom/adobe/xmp/options/PropertyOptions;-><init>(I)V
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 4
    :catch_0
    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    .line 5
    :goto_0
    new-instance v1, Lcom/adobe/xmp/impl/XMPNode;

    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v0}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 6
    :try_start_1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 7
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/xmp/impl/XMPNode;

    .line 8
    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v1, v2}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object p0

    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 10
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    .line 11
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v1, v0}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V
    :try_end_1
    .catch Lcom/adobe/xmp/XMPException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    :cond_1
    return-object v1
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "xmpNode"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    check-cast p1, Lcom/adobe/xmp/impl/XMPNode;

    .line 3
    iget-object p1, p1, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 4
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    check-cast p1, Lcom/adobe/xmp/impl/XMPNode;

    .line 6
    iget-object p1, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public final find(Ljava/util/List;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "list",
            "expr"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 2
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/adobe/xmp/impl/XMPNode;

    .line 3
    iget-object v0, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 4
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public getChild(I)Lcom/adobe/xmp/impl/XMPNode;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object p0

    add-int/lit8 p1, p1, -0x1

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/adobe/xmp/impl/XMPNode;

    return-object p0
.end method

.method public final getChildren()Ljava/util/List;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    return-object p0
.end method

.method public getChildrenLength()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-eqz p0, :cond_0

    .line 2
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public getOptions()Lcom/adobe/xmp/options/PropertyOptions;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    return-object p0
.end method

.method public getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object p0

    add-int/lit8 p1, p1, -0x1

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/adobe/xmp/impl/XMPNode;

    return-object p0
.end method

.method public final getQualifier()Ljava/util/List;
    .locals 2

    .line 2
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    return-object p0
.end method

.method public getQualifierLength()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-eqz p0, :cond_0

    .line 2
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public hasChildren()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public hasQualifier()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public iterateChildren()Ljava/util/Iterator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0

    .line 3
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object p0

    return-object p0
.end method

.method public iterateQualifier()Ljava/util/Iterator;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 3
    new-instance v0, Lcom/adobe/xmp/impl/XMPNode$1;

    invoke-direct {v0, p0}, Lcom/adobe/xmp/impl/XMPNode$1;-><init>(Ljava/util/Iterator;)V

    return-object v0

    .line 4
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public removeChild(Lcom/adobe/xmp/impl/XMPNode;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "node"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 2
    iget-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 3
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    :cond_0
    return-void
.end method

.method public removeQualifier(Lcom/adobe/xmp/impl/XMPNode;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "qualNode"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    .line 2
    iget-object v1, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    const-string v2, "xml:lang"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const/16 v1, 0x40

    .line 3
    invoke-virtual {v0, v1, v2}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    goto :goto_0

    .line 4
    :cond_0
    iget-object v1, p1, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    const-string v3, "rdf:type"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x80

    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 6
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 7
    iget-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    const/16 p1, 0x10

    .line 8
    invoke-virtual {v0, p1, v2}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    :cond_2
    return-void
.end method
