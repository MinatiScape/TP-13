.class public Lcom/adobe/xmp/impl/XMPMetaImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/xmp/XMPMeta;


# instance fields
.field public tree:Lcom/adobe/xmp/impl/XMPNode;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/adobe/xmp/impl/XMPMetaImpl;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/adobe/xmp/impl/XMPNode;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    return-void
.end method

.method public constructor <init>(Lcom/adobe/xmp/impl/XMPNode;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tree"
        }
    .end annotation

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/adobe/xmp/impl/XMPNode;

    .line 2
    new-instance v0, Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-direct {v0, p0}, Lcom/adobe/xmp/impl/XMPMetaImpl;-><init>(Lcom/adobe/xmp/impl/XMPNode;)V

    return-object v0
.end method

.method public final evaluateNodeValue(ILcom/adobe/xmp/impl/XMPNode;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10
        }
        names = {
            "valueType",
            "propNode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    iget-object p0, p2, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    const/16 v0, 0x10

    const/4 v1, 0x2

    const-string v2, "0x"

    const-string v3, "Empty convert-string"

    const/4 v4, 0x5

    packed-switch p1, :pswitch_data_0

    if-nez p0, :cond_9

    .line 2
    invoke-virtual {p2}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p1

    invoke-virtual {p1}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result p1

    if-eqz p1, :cond_8

    goto/16 :goto_4

    .line 3
    :pswitch_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-static {p0}, Lcom/adobe/xmp/impl/Base64;->decode([B)[B

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_4

    :catchall_0
    move-exception p0

    .line 4
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const-string p2, "Invalid base64 string"

    invoke-direct {p1, p2, v4, p0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw p1

    .line 5
    :pswitch_1
    invoke-static {p0}, Lcom/adobe/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;

    move-result-object p0

    .line 6
    check-cast p0, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;->getCalendar()Ljava/util/Calendar;

    move-result-object p0

    goto/16 :goto_4

    .line 7
    :pswitch_2
    invoke-static {p0}, Lcom/adobe/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;

    move-result-object p0

    goto/16 :goto_4

    .line 8
    :pswitch_3
    new-instance p1, Ljava/lang/Double;

    if-eqz p0, :cond_0

    .line 9
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    if-eqz p2, :cond_0

    .line 10
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 11
    invoke-direct {p1, v0, v1}, Ljava/lang/Double;-><init>(D)V

    :goto_0
    move-object p0, p1

    goto/16 :goto_4

    .line 12
    :cond_0
    :try_start_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    invoke-direct {p0, v3, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 13
    :catch_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid double string"

    invoke-direct {p0, p1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 14
    :pswitch_4
    new-instance p1, Ljava/lang/Long;

    if-eqz p0, :cond_2

    .line 15
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    if-eqz p2, :cond_2

    .line 16
    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 17
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    goto :goto_1

    .line 18
    :cond_1
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_1

    .line 19
    :goto_1
    invoke-direct {p1, v0, v1}, Ljava/lang/Long;-><init>(J)V

    goto :goto_0

    .line 20
    :cond_2
    :try_start_4
    new-instance p0, Lcom/adobe/xmp/XMPException;

    invoke-direct {p0, v3, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_1

    .line 21
    :catch_1
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid long string"

    invoke-direct {p0, p1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 22
    :pswitch_5
    new-instance p1, Ljava/lang/Integer;

    if-eqz p0, :cond_4

    .line 23
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    if-eqz p2, :cond_4

    .line 24
    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 25
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    goto :goto_2

    .line 26
    :cond_3
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_2

    .line 27
    :goto_2
    invoke-direct {p1, p0}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_0

    .line 28
    :cond_4
    :try_start_6
    new-instance p0, Lcom/adobe/xmp/XMPException;

    invoke-direct {p0, v3, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_2

    .line 29
    :catch_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid integer string"

    invoke-direct {p0, p1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 30
    :pswitch_6
    new-instance p1, Ljava/lang/Boolean;

    if-eqz p0, :cond_7

    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    if-eqz p2, :cond_7

    .line 32
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x1

    const/4 v0, 0x0

    .line 33
    :try_start_7
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_3

    if-eqz p0, :cond_5

    goto :goto_3

    :catch_3
    const-string v1, "true"

    .line 34
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "t"

    .line 35
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "on"

    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "yes"

    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_3

    :cond_5
    move p2, v0

    .line 38
    :cond_6
    :goto_3
    invoke-direct {p1, p2}, Ljava/lang/Boolean;-><init>(Z)V

    goto/16 :goto_0

    .line 39
    :cond_7
    new-instance p0, Lcom/adobe/xmp/XMPException;

    invoke-direct {p0, v3, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_8
    const-string p0, ""

    :cond_9
    :goto_4
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getPropertyInteger(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "schemaNS",
            "propName"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 2
    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 3
    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    .line 4
    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p2, p1, v0, v1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 5
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p2

    invoke-virtual {p2}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result p2

    if-nez p2, :cond_0

    const/4 p2, 0x2

    .line 6
    invoke-virtual {p0, p2, p1}, Lcom/adobe/xmp/impl/XMPMetaImpl;->evaluateNodeValue(ILcom/adobe/xmp/impl/XMPNode;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 7
    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0x66

    const-string p2, "Property must be simple when a value type is requested"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 8
    :cond_1
    :goto_0
    check-cast v1, Ljava/lang/Integer;

    return-object v1
.end method

.method public setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 19
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "schemaNS",
            "altTextName",
            "genericLang",
            "specificLang",
            "itemValue",
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    move-object/from16 v0, p5

    .line 1
    invoke-static/range {p1 .. p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 2
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_25

    .line 3
    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_24

    .line 4
    invoke-static/range {p3 .. p3}, Lcom/adobe/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 5
    invoke-static/range {p4 .. p4}, Lcom/adobe/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 6
    invoke-static/range {p1 .. p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object v4

    move-object/from16 v5, p0

    .line 7
    iget-object v5, v5, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    new-instance v6, Lcom/adobe/xmp/options/PropertyOptions;

    const/16 v7, 0x1e00

    invoke-direct {v6, v7}, Lcom/adobe/xmp/options/PropertyOptions;-><init>(I)V

    const/4 v7, 0x1

    invoke-static {v5, v4, v7, v6}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v4

    const/16 v5, 0x66

    if-eqz v4, :cond_23

    .line 8
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v6

    if-nez v6, :cond_1

    .line 9
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 10
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v6

    const/16 v8, 0x1000

    .line 11
    invoke-virtual {v6, v8, v7}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Specified property is no alt-text array"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 13
    :cond_1
    :goto_0
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    const-string v9, "xml:lang"

    const/4 v10, 0x0

    const-string v11, "x-default"

    const/4 v12, 0x0

    if-eqz v8, :cond_4

    .line 14
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/xmp/impl/XMPNode;

    .line 15
    invoke-virtual {v8}, Lcom/adobe/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v13

    if-eqz v13, :cond_3

    .line 16
    invoke-virtual {v8, v7}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v13

    .line 17
    iget-object v13, v13, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 18
    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 19
    invoke-virtual {v8, v7}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v13

    .line 20
    iget-object v13, v13, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 21
    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    move v6, v7

    goto :goto_1

    .line 22
    :cond_3
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Language qualifier must be first"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_4
    move v6, v10

    move-object v8, v12

    :goto_1
    if-eqz v8, :cond_5

    .line 23
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v13

    if-le v13, v7, :cond_5

    .line 24
    invoke-virtual {v4, v8}, Lcom/adobe/xmp/impl/XMPNode;->removeChild(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 25
    invoke-virtual {v4, v7, v8}, Lcom/adobe/xmp/impl/XMPNode;->addChild(ILcom/adobe/xmp/impl/XMPNode;)V

    .line 26
    :cond_5
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v13

    invoke-virtual {v13}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v13

    if-eqz v13, :cond_22

    .line 27
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v13

    const/4 v14, 0x2

    if-nez v13, :cond_6

    new-array v1, v14, [Ljava/lang/Object;

    .line 28
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v10}, Ljava/lang/Integer;-><init>(I)V

    aput-object v5, v1, v10

    aput-object v12, v1, v7

    goto/16 :goto_3

    .line 29
    :cond_6
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v13

    move-object/from16 v16, v12

    move-object/from16 v17, v16

    move v12, v10

    :cond_7
    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_d

    .line 30
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v2, v18

    check-cast v2, Lcom/adobe/xmp/impl/XMPNode;

    .line 31
    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v18

    if-nez v18, :cond_c

    .line 32
    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v18

    if-eqz v18, :cond_b

    .line 33
    invoke-virtual {v2, v7}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v15

    .line 34
    iget-object v15, v15, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 35
    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_b

    .line 36
    invoke-virtual {v2, v7}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v15

    .line 37
    iget-object v15, v15, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 38
    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_8

    new-array v1, v14, [Ljava/lang/Object;

    .line 39
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v7}, Ljava/lang/Integer;-><init>(I)V

    aput-object v5, v1, v10

    aput-object v2, v1, v7

    goto :goto_3

    :cond_8
    if-eqz v1, :cond_a

    .line 40
    invoke-virtual {v15, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_a

    if-nez v16, :cond_9

    move-object/from16 v16, v2

    :cond_9
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 41
    :cond_a
    invoke-virtual {v11, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    move-object/from16 v17, v2

    goto :goto_2

    .line 42
    :cond_b
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Alt-text array item has no language qualifier"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 43
    :cond_c
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Alt-text array item is not simple"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_d
    if-ne v12, v7, :cond_e

    new-array v1, v14, [Ljava/lang/Object;

    .line 44
    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v14}, Ljava/lang/Integer;-><init>(I)V

    aput-object v2, v1, v10

    aput-object v16, v1, v7

    goto :goto_3

    :cond_e
    if-le v12, v7, :cond_f

    new-array v1, v14, [Ljava/lang/Object;

    .line 45
    new-instance v2, Ljava/lang/Integer;

    const/4 v5, 0x3

    invoke-direct {v2, v5}, Ljava/lang/Integer;-><init>(I)V

    aput-object v2, v1, v10

    aput-object v16, v1, v7

    goto :goto_3

    :cond_f
    if-eqz v17, :cond_10

    new-array v1, v14, [Ljava/lang/Object;

    .line 46
    new-instance v2, Ljava/lang/Integer;

    const/4 v5, 0x4

    invoke-direct {v2, v5}, Ljava/lang/Integer;-><init>(I)V

    aput-object v2, v1, v10

    aput-object v17, v1, v7

    goto :goto_3

    :cond_10
    new-array v1, v14, [Ljava/lang/Object;

    .line 47
    new-instance v2, Ljava/lang/Integer;

    const/4 v5, 0x5

    invoke-direct {v2, v5}, Ljava/lang/Integer;-><init>(I)V

    aput-object v2, v1, v10

    invoke-virtual {v4, v7}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    aput-object v2, v1, v7

    .line 48
    :goto_3
    aget-object v2, v1, v10

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 49
    aget-object v1, v1, v7

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 50
    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v2, :cond_1e

    if-eq v2, v7, :cond_17

    if-eq v2, v14, :cond_15

    const/4 v9, 0x3

    if-eq v2, v9, :cond_14

    const/4 v1, 0x4

    if-eq v2, v1, :cond_12

    const/4 v1, 0x5

    if-ne v2, v1, :cond_11

    .line 51
    invoke-static {v4, v3, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v5, :cond_20

    goto/16 :goto_6

    .line 52
    :cond_11
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/16 v1, 0x9

    const-string v2, "Unexpected result from ChooseLocalizedText"

    invoke-direct {v0, v2, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_12
    if-eqz v8, :cond_13

    .line 53
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    if-ne v1, v7, :cond_13

    .line 54
    iput-object v0, v8, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 55
    :cond_13
    invoke-static {v4, v3, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    .line 56
    :cond_14
    invoke-static {v4, v3, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v5, :cond_20

    goto :goto_6

    :cond_15
    if-eqz v6, :cond_16

    if-eq v8, v1, :cond_16

    if-eqz v8, :cond_16

    .line 57
    iget-object v2, v8, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    iget-object v3, v1, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 58
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 59
    iput-object v0, v8, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 60
    :cond_16
    iput-object v0, v1, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    goto :goto_7

    :cond_17
    if-nez v5, :cond_19

    if-eqz v6, :cond_18

    if-eq v8, v1, :cond_18

    if-eqz v8, :cond_18

    .line 61
    iget-object v2, v8, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    iget-object v3, v1, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 63
    iput-object v0, v8, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 64
    :cond_18
    iput-object v0, v1, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    goto :goto_7

    .line 65
    :cond_19
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    :cond_1a
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 66
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/xmp/impl/XMPNode;

    if-eq v2, v8, :cond_1a

    .line 67
    iget-object v3, v2, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    if-eqz v8, :cond_1b

    .line 68
    iget-object v5, v8, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    goto :goto_5

    :cond_1b
    const/4 v5, 0x0

    .line 69
    :goto_5
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1c

    goto :goto_4

    .line 70
    :cond_1c
    iput-object v0, v2, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    goto :goto_4

    :cond_1d
    if-eqz v8, :cond_20

    .line 71
    iput-object v0, v8, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    goto :goto_7

    .line 72
    :cond_1e
    invoke-static {v4, v11, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    if-nez v5, :cond_1f

    .line 73
    invoke-static {v4, v3, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1f
    :goto_6
    move v6, v7

    :cond_20
    :goto_7
    if-nez v6, :cond_21

    .line 74
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    if-ne v1, v7, :cond_21

    .line 75
    invoke-static {v4, v11, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    :cond_21
    return-void

    .line 76
    :cond_22
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Localized text array is not alt-text"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 77
    :cond_23
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Failed to find or create array node"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 78
    :cond_24
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Empty specific language"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_25
    const/4 v2, 0x4

    .line 79
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Empty array name"

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
