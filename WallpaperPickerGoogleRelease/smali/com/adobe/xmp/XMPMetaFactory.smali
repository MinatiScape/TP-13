.class public final Lcom/adobe/xmp/XMPMetaFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static schema:Lcom/adobe/xmp/XMPSchemaRegistry;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;

    invoke-direct {v0}, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;-><init>()V

    sput-object v0, Lcom/adobe/xmp/XMPMetaFactory;->schema:Lcom/adobe/xmp/XMPSchemaRegistry;

    return-void
.end method

.method public static parseFromBuffer([B)Lcom/adobe/xmp/XMPMeta;
    .locals 20
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 1
    sget-object v1, Lcom/adobe/xmp/impl/XMPMetaParser;->XMP_RDF:Ljava/lang/Object;

    .line 2
    invoke-static/range {p0 .. p0}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertNotNull(Ljava/lang/Object;)V

    .line 3
    new-instance v1, Lcom/adobe/xmp/options/ParseOptions;

    invoke-direct {v1}, Lcom/adobe/xmp/options/ParseOptions;-><init>()V

    .line 4
    instance-of v2, v0, Ljava/io/InputStream;

    const/16 v3, 0x10

    if-eqz v2, :cond_1

    .line 5
    check-cast v0, Ljava/io/InputStream;

    .line 6
    invoke-virtual {v1, v3}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 7
    invoke-virtual {v1}, Lcom/adobe/xmp/options/ParseOptions;->getFixControlChars()Z

    move-result v2

    if-nez v2, :cond_0

    .line 8
    new-instance v2, Lorg/xml/sax/InputSource;

    invoke-direct {v2, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-static {v2}, Lcom/adobe/xmp/impl/XMPMetaParser;->parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    goto :goto_0

    .line 9
    :cond_0
    :try_start_0
    new-instance v2, Lcom/adobe/xmp/impl/ByteBuffer;

    invoke-direct {v2, v0}, Lcom/adobe/xmp/impl/ByteBuffer;-><init>(Ljava/io/InputStream;)V

    .line 10
    invoke-static {v2, v1}, Lcom/adobe/xmp/impl/XMPMetaParser;->parseXmlFromBytebuffer(Lcom/adobe/xmp/impl/ByteBuffer;Lcom/adobe/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 11
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const/16 v2, 0xcc

    const-string v3, "Error reading the XML-file"

    invoke-direct {v1, v3, v2, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v1

    .line 12
    :cond_1
    new-instance v2, Lcom/adobe/xmp/impl/ByteBuffer;

    invoke-direct {v2, v0}, Lcom/adobe/xmp/impl/ByteBuffer;-><init>([B)V

    invoke-static {v2, v1}, Lcom/adobe/xmp/impl/XMPMetaParser;->parseXmlFromBytebuffer(Lcom/adobe/xmp/impl/ByteBuffer;Lcom/adobe/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;

    move-result-object v0

    :goto_0
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v1, v2}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    .line 14
    invoke-static {v0, v4, v5}, Lcom/adobe/xmp/impl/XMPMetaParser;->findRootNode(Lorg/w3c/dom/Node;Z[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3a

    .line 15
    aget-object v4, v0, v2

    sget-object v5, Lcom/adobe/xmp/impl/XMPMetaParser;->XMP_RDF:Ljava/lang/Object;

    if-ne v4, v5, :cond_3a

    const/4 v4, 0x0

    .line 16
    aget-object v5, v0, v4

    check-cast v5, Lorg/w3c/dom/Node;

    .line 17
    new-instance v13, Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-direct {v13}, Lcom/adobe/xmp/impl/XMPMetaImpl;-><init>()V

    .line 18
    invoke-interface {v5}, Lorg/w3c/dom/Node;->hasAttributes()Z

    move-result v6

    if-eqz v6, :cond_39

    .line 19
    iget-object v6, v13, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    move v7, v4

    .line 20
    :goto_1
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v7, v8, :cond_3

    .line 21
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v8

    invoke-interface {v8, v7}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 22
    invoke-static {v8}, Lcom/adobe/xmp/impl/ParseRDF;->isWhitespaceNode(Lorg/w3c/dom/Node;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 23
    invoke-static {v13, v6, v8, v2}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_NodeElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_3
    const/4 v5, 0x2

    .line 24
    aget-object v0, v0, v5

    check-cast v0, Ljava/lang/String;

    const/16 v0, 0x20

    .line 25
    invoke-virtual {v1, v0}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result v0

    if-nez v0, :cond_3b

    .line 26
    sget-object v0, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    .line 27
    iget-object v0, v13, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const-string v14, "http://purl.org/dc/elements/1.1/"

    .line 28
    invoke-static {v0, v14, v2}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    .line 29
    iget-object v6, v13, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    .line 30
    invoke-virtual {v6}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v15

    :goto_2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x5

    const-string v12, "x-default"

    const/4 v8, 0x0

    if-eqz v6, :cond_1a

    .line 31
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/xmp/impl/XMPNode;

    .line 32
    iget-object v9, v6, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 33
    invoke-virtual {v14, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    move v7, v2

    .line 34
    :goto_3
    invoke-virtual {v6}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v9

    if-gt v7, v9, :cond_8

    .line 35
    invoke-virtual {v6, v7}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v9

    .line 36
    sget-object v10, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    .line 37
    iget-object v11, v9, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 38
    invoke-interface {v10, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/adobe/xmp/options/PropertyOptions;

    if-nez v10, :cond_4

    goto :goto_5

    .line 39
    :cond_4
    invoke-virtual {v9}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v11

    .line 40
    iget v11, v11, Lcom/adobe/xmp/options/Options;->options:I

    and-int/lit16 v11, v11, 0x300

    if-nez v11, :cond_5

    move v11, v2

    goto :goto_4

    :cond_5
    move v11, v4

    :goto_4
    if-eqz v11, :cond_6

    .line 41
    new-instance v11, Lcom/adobe/xmp/impl/XMPNode;

    .line 42
    iget-object v3, v9, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 43
    invoke-direct {v11, v3, v8, v10}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    const-string v3, "[]"

    .line 44
    iput-object v3, v9, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 45
    invoke-virtual {v11, v9}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 46
    iput-object v6, v11, Lcom/adobe/xmp/impl/XMPNode;->parent:Lcom/adobe/xmp/impl/XMPNode;

    .line 47
    invoke-virtual {v6}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v3

    add-int/lit8 v5, v7, -0x1

    invoke-interface {v3, v5, v11}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 48
    invoke-virtual {v10}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-virtual {v9}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v3

    if-nez v3, :cond_7

    .line 49
    new-instance v3, Lcom/adobe/xmp/impl/XMPNode;

    const-string v5, "xml:lang"

    invoke-direct {v3, v5, v12, v8}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 50
    invoke-virtual {v9, v3}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_5

    .line 51
    :cond_6
    invoke-virtual {v9}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v3

    const/16 v5, 0x1e00

    invoke-virtual {v3, v5, v4}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 52
    invoke-virtual {v9}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v3

    invoke-virtual {v3, v10}, Lcom/adobe/xmp/options/PropertyOptions;->mergeWith(Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 53
    invoke-virtual {v10}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 54
    invoke-static {v9}, Lcom/adobe/xmp/impl/XMPNormalizer;->repairAltText(Lcom/adobe/xmp/impl/XMPNode;)V

    :cond_7
    :goto_5
    add-int/lit8 v7, v7, 0x1

    const/16 v3, 0x10

    const/4 v5, 0x2

    goto :goto_3

    :cond_8
    move/from16 v18, v5

    move-object/from16 v19, v14

    goto/16 :goto_d

    .line 55
    :cond_9
    iget-object v3, v6, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    const-string v5, "http://ns.adobe.com/exif/1.0/"

    .line 56
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const-string v3, "exif:GPSTimeStamp"

    .line 57
    invoke-static {v6, v3, v4}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v3

    if-nez v3, :cond_a

    goto :goto_6

    .line 58
    :cond_a
    :try_start_1
    iget-object v5, v3, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 59
    invoke-static {v5}, Lcom/adobe/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;

    move-result-object v5

    .line 60
    move-object v8, v5

    check-cast v8, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    .line 61
    iget v8, v8, Lcom/adobe/xmp/impl/XMPDateTimeImpl;->year:I

    if-nez v8, :cond_d

    .line 62
    move-object v8, v5

    check-cast v8, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    .line 63
    iget v8, v8, Lcom/adobe/xmp/impl/XMPDateTimeImpl;->month:I

    if-nez v8, :cond_d

    .line 64
    move-object v8, v5

    check-cast v8, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    .line 65
    iget v8, v8, Lcom/adobe/xmp/impl/XMPDateTimeImpl;->day:I

    if-eqz v8, :cond_b

    goto :goto_6

    :cond_b
    const-string v8, "exif:DateTimeOriginal"

    .line 66
    invoke-static {v6, v8, v4}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v8

    if-nez v8, :cond_c

    const-string v8, "exif:DateTimeDigitized"

    .line 67
    invoke-static {v6, v8, v4}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v8

    .line 68
    :cond_c
    iget-object v8, v8, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 69
    invoke-static {v8}, Lcom/adobe/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;

    move-result-object v8

    .line 70
    check-cast v5, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;->getCalendar()Ljava/util/Calendar;

    move-result-object v5

    .line 71
    move-object v9, v8

    check-cast v9, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    .line 72
    iget v9, v9, Lcom/adobe/xmp/impl/XMPDateTimeImpl;->year:I

    .line 73
    invoke-virtual {v5, v2, v9}, Ljava/util/Calendar;->set(II)V

    .line 74
    move-object v9, v8

    check-cast v9, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    .line 75
    iget v9, v9, Lcom/adobe/xmp/impl/XMPDateTimeImpl;->month:I

    const/4 v10, 0x2

    .line 76
    invoke-virtual {v5, v10, v9}, Ljava/util/Calendar;->set(II)V

    .line 77
    check-cast v8, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    .line 78
    iget v8, v8, Lcom/adobe/xmp/impl/XMPDateTimeImpl;->day:I

    .line 79
    invoke-virtual {v5, v7, v8}, Ljava/util/Calendar;->set(II)V

    .line 80
    new-instance v7, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v7, v5}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    .line 81
    invoke-static {v7}, Lcom/adobe/xmp/impl/ISO8601Converter;->render(Lcom/adobe/xmp/XMPDateTime;)Ljava/lang/String;

    move-result-object v5

    .line 82
    iput-object v5, v3, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;
    :try_end_1
    .catch Lcom/adobe/xmp/XMPException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :cond_d
    :goto_6
    const-string v3, "exif:UserComment"

    .line 83
    invoke-static {v6, v3, v4}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v3

    if-eqz v3, :cond_17

    .line 84
    invoke-static {v3}, Lcom/adobe/xmp/impl/XMPNormalizer;->repairAltText(Lcom/adobe/xmp/impl/XMPNode;)V

    goto/16 :goto_c

    .line 85
    :cond_e
    iget-object v3, v6, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    const-string v5, "http://ns.adobe.com/xmp/1.0/DynamicMedia/"

    .line 86
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    const-string v3, "xmpDM:copyright"

    .line 87
    invoke-static {v6, v3, v4}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v3

    if-eqz v3, :cond_17

    .line 88
    :try_start_2
    iget-object v5, v13, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    .line 89
    invoke-static {v5, v14, v2}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    .line 90
    iget-object v11, v3, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    const-string v10, "\n\n"

    const-string v6, "dc:rights"

    .line 91
    invoke-static {v5, v6, v4}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    if-eqz v5, :cond_14

    .line 92
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v6

    if-nez v6, :cond_f

    goto/16 :goto_9

    .line 93
    :cond_f
    invoke-static {v5, v12}, Lcom/adobe/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v6

    if-gez v6, :cond_10

    .line 94
    invoke-virtual {v5, v2}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v6

    .line 95
    iget-object v9, v6, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    const-string v7, "http://purl.org/dc/elements/1.1/"

    const-string v8, "rights"

    const-string v16, ""

    const-string v17, "x-default"
    :try_end_2
    .catch Lcom/adobe/xmp/XMPException; {:try_start_2 .. :try_end_2} :catch_2

    const/16 v18, 0x0

    move-object v6, v13

    move-object/from16 v19, v9

    move-object/from16 v9, v16

    move-object v2, v10

    move-object/from16 v10, v17

    move-object v4, v11

    move-object/from16 v11, v19

    move-object/from16 v19, v14

    move-object v14, v12

    move-object/from16 v12, v18

    .line 96
    :try_start_3
    invoke-virtual/range {v6 .. v12}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 97
    invoke-static {v5, v14}, Lcom/adobe/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v6

    goto :goto_7

    :cond_10
    move-object v2, v10

    move-object v4, v11

    move-object/from16 v19, v14

    .line 98
    :goto_7
    invoke-virtual {v5, v6}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    .line 99
    iget-object v6, v5, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 100
    invoke-virtual {v6, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-gez v7, :cond_12

    .line 101
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_11

    .line 102
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7
    :try_end_3
    .catch Lcom/adobe/xmp/XMPException; {:try_start_3 .. :try_end_3} :catch_3

    const/16 v18, 0x2

    add-int/lit8 v7, v7, 0x2

    :try_start_4
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 103
    iput-object v2, v5, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    goto :goto_b

    :cond_11
    const/16 v18, 0x2

    goto :goto_b

    :cond_12
    const/16 v18, 0x2

    add-int/lit8 v7, v7, 0x2

    .line 104
    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_16

    const/4 v2, 0x0

    .line 105
    invoke-virtual {v6, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_13

    invoke-virtual {v2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_8

    :cond_13
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v2, v4

    .line 106
    :goto_8
    iput-object v2, v5, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    goto :goto_b

    :cond_14
    :goto_9
    move-object v2, v10

    move-object v4, v11

    move-object/from16 v19, v14

    const/16 v18, 0x2

    .line 107
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_15

    invoke-virtual {v2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object v11, v2

    goto :goto_a

    :cond_15
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v11, v4

    :goto_a
    const-string v7, "http://purl.org/dc/elements/1.1/"

    const-string v8, "rights"

    const-string v9, ""

    const-string v10, "x-default"

    const/4 v12, 0x0

    move-object v6, v13

    .line 108
    invoke-virtual/range {v6 .. v12}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 109
    :cond_16
    :goto_b
    iget-object v2, v3, Lcom/adobe/xmp/impl/XMPNode;->parent:Lcom/adobe/xmp/impl/XMPNode;

    .line 110
    invoke-virtual {v2, v3}, Lcom/adobe/xmp/impl/XMPNode;->removeChild(Lcom/adobe/xmp/impl/XMPNode;)V
    :try_end_4
    .catch Lcom/adobe/xmp/XMPException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_d

    :catch_2
    :cond_17
    :goto_c
    move-object/from16 v19, v14

    :catch_3
    const/16 v18, 0x2

    goto :goto_d

    :cond_18
    move-object/from16 v19, v14

    const/16 v18, 0x2

    .line 111
    iget-object v2, v6, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    const-string v3, "http://ns.adobe.com/xap/1.0/rights/"

    .line 112
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const-string v2, "xmpRights:UsageTerms"

    const/4 v3, 0x0

    .line 113
    invoke-static {v6, v2, v3}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    if-eqz v2, :cond_19

    .line 114
    invoke-static {v2}, Lcom/adobe/xmp/impl/XMPNormalizer;->repairAltText(Lcom/adobe/xmp/impl/XMPNode;)V

    :catch_4
    :cond_19
    :goto_d
    move/from16 v5, v18

    move-object/from16 v14, v19

    const/4 v2, 0x1

    const/16 v3, 0x10

    const/4 v4, 0x0

    goto/16 :goto_2

    :cond_1a
    move-object v14, v12

    .line 115
    iget-boolean v2, v0, Lcom/adobe/xmp/impl/XMPNode;->hasAliases:Z

    const/4 v3, 0x4

    if-nez v2, :cond_1b

    goto/16 :goto_16

    :cond_1b
    const/4 v2, 0x0

    .line 116
    iput-boolean v2, v0, Lcom/adobe/xmp/impl/XMPNode;->hasAliases:Z

    .line 117
    invoke-virtual {v1, v3}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result v1

    .line 118
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->getChildren()Ljava/util/List;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 119
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 120
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/xmp/impl/XMPNode;

    .line 121
    iget-boolean v5, v4, Lcom/adobe/xmp/impl/XMPNode;->hasAliases:Z

    if-nez v5, :cond_1c

    goto :goto_e

    .line 122
    :cond_1c
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v5

    :cond_1d
    :goto_f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 123
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/xmp/impl/XMPNode;

    .line 124
    iget-boolean v9, v6, Lcom/adobe/xmp/impl/XMPNode;->alias:Z

    if-nez v9, :cond_1e

    goto :goto_f

    :cond_1e
    const/4 v9, 0x0

    .line 125
    iput-boolean v9, v6, Lcom/adobe/xmp/impl/XMPNode;->alias:Z

    .line 126
    sget-object v10, Lcom/adobe/xmp/XMPMetaFactory;->schema:Lcom/adobe/xmp/XMPSchemaRegistry;

    .line 127
    iget-object v11, v6, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 128
    check-cast v10, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;

    invoke-virtual {v10, v11}, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->findAlias(Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPAliasInfo;

    move-result-object v10

    if-eqz v10, :cond_1d

    .line 129
    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getNamespace()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    .line 130
    invoke-static {v0, v11, v8, v12}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v11

    .line 131
    iput-boolean v9, v11, Lcom/adobe/xmp/impl/XMPNode;->implicit:Z

    .line 132
    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPrefix()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v15

    if-eqz v15, :cond_1f

    invoke-virtual {v9, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_10

    :cond_1f
    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v9}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v9, v12

    :goto_10
    const/4 v12, 0x0

    .line 133
    invoke-static {v11, v9, v12}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v9

    if-nez v9, :cond_24

    .line 134
    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v9

    .line 135
    iget v9, v9, Lcom/adobe/xmp/options/Options;->options:I

    if-nez v9, :cond_20

    const/4 v9, 0x1

    goto :goto_11

    :cond_20
    const/4 v9, 0x0

    :goto_11
    if-eqz v9, :cond_22

    .line 136
    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPrefix()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v12

    if-eqz v12, :cond_21

    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_12

    :cond_21
    new-instance v10, Ljava/lang/String;

    invoke-direct {v10, v9}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v9, v10

    .line 137
    :goto_12
    iput-object v9, v6, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 138
    invoke-virtual {v11, v6}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 139
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_f

    .line 140
    :cond_22
    new-instance v9, Lcom/adobe/xmp/impl/XMPNode;

    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPrefix()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v18

    if-eqz v18, :cond_23

    invoke-virtual {v12, v15}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    goto :goto_13

    :cond_23
    new-instance v15, Ljava/lang/String;

    invoke-direct {v15, v12}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v12, v15

    .line 141
    :goto_13
    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v10

    .line 142
    new-instance v15, Lcom/adobe/xmp/options/PropertyOptions;

    .line 143
    iget v10, v10, Lcom/adobe/xmp/options/Options;->options:I

    .line 144
    invoke-direct {v15, v10}, Lcom/adobe/xmp/options/PropertyOptions;-><init>(I)V

    .line 145
    invoke-direct {v9, v12, v8, v15}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 146
    invoke-virtual {v11, v9}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 147
    invoke-static {v5, v6, v9}, Lcom/adobe/xmp/impl/XMPNormalizer;->transplantArrayItemAlias(Ljava/util/Iterator;Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;)V

    goto/16 :goto_f

    .line 148
    :cond_24
    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v11

    .line 149
    iget v11, v11, Lcom/adobe/xmp/options/Options;->options:I

    if-nez v11, :cond_25

    const/4 v11, 0x1

    goto :goto_14

    :cond_25
    const/4 v11, 0x0

    :goto_14
    if-eqz v11, :cond_27

    if-eqz v1, :cond_26

    const/4 v10, 0x1

    .line 150
    invoke-static {v6, v9, v10}, Lcom/adobe/xmp/impl/XMPNormalizer;->compareAliasedSubtrees(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;Z)V

    .line 151
    :cond_26
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_f

    .line 152
    :cond_27
    invoke-interface {v10}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v10

    const/16 v11, 0x1000

    .line 153
    invoke-virtual {v10, v11}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result v10

    if-eqz v10, :cond_28

    .line 154
    invoke-static {v9, v14}, Lcom/adobe/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v11, :cond_29

    .line 155
    invoke-virtual {v9, v10}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v10

    move-object v11, v10

    const/4 v10, 0x1

    goto :goto_15

    .line 156
    :cond_28
    invoke-virtual {v9}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v10

    if-eqz v10, :cond_29

    const/4 v10, 0x1

    .line 157
    invoke-virtual {v9, v10}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v11

    goto :goto_15

    :cond_29
    const/4 v10, 0x1

    move-object v11, v8

    :goto_15
    if-nez v11, :cond_2a

    .line 158
    invoke-static {v5, v6, v9}, Lcom/adobe/xmp/impl/XMPNormalizer;->transplantArrayItemAlias(Ljava/util/Iterator;Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;)V

    goto/16 :goto_f

    :cond_2a
    if-eqz v1, :cond_2b

    .line 159
    invoke-static {v6, v11, v10}, Lcom/adobe/xmp/impl/XMPNormalizer;->compareAliasedSubtrees(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;Z)V

    .line 160
    :cond_2b
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_f

    :cond_2c
    const/4 v6, 0x0

    .line 161
    iput-boolean v6, v4, Lcom/adobe/xmp/impl/XMPNode;->hasAliases:Z

    goto/16 :goto_e

    .line 162
    :cond_2d
    :goto_16
    iget-object v1, v0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    if-eqz v1, :cond_37

    .line 163
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x24

    if-lt v1, v2, :cond_37

    .line 164
    iget-object v1, v0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    .line 165
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v4, "uuid:"

    .line 166
    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 167
    invoke-virtual {v1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 168
    :cond_2e
    sget-object v5, Lcom/adobe/xmp/impl/Utils;->xmlNameStartChars:[Z

    if-nez v1, :cond_2f

    goto :goto_19

    :cond_2f
    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 169
    :goto_17
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v5, v9, :cond_33

    .line 170
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x2d

    if-ne v9, v10, :cond_32

    add-int/lit8 v7, v7, 0x1

    if-eqz v6, :cond_31

    const/16 v6, 0x8

    if-eq v5, v6, :cond_30

    const/16 v6, 0xd

    if-eq v5, v6, :cond_30

    const/16 v6, 0x12

    if-eq v5, v6, :cond_30

    const/16 v6, 0x17

    if-ne v5, v6, :cond_31

    :cond_30
    const/4 v6, 0x1

    goto :goto_18

    :cond_31
    const/4 v6, 0x0

    :cond_32
    :goto_18
    add-int/lit8 v5, v5, 0x1

    goto :goto_17

    :cond_33
    if-eqz v6, :cond_34

    if-ne v3, v7, :cond_34

    if-ne v2, v5, :cond_34

    const/4 v2, 0x1

    goto :goto_1a

    :cond_34
    :goto_19
    const/4 v2, 0x0

    :goto_1a
    if-eqz v2, :cond_37

    const-string v2, "http://ns.adobe.com/xap/1.0/mm/"

    const-string v3, "InstanceID"

    .line 171
    invoke-static {v2, v3}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object v2

    const/4 v3, 0x1

    .line 172
    invoke-static {v0, v2, v3, v8}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    if-eqz v2, :cond_36

    .line 173
    iput-object v8, v2, Lcom/adobe/xmp/impl/XMPNode;->options:Lcom/adobe/xmp/options/PropertyOptions;

    .line 174
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_35

    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1b

    :cond_35
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 175
    :goto_1b
    iput-object v1, v2, Lcom/adobe/xmp/impl/XMPNode;->value:Ljava/lang/String;

    .line 176
    iput-object v8, v2, Lcom/adobe/xmp/impl/XMPNode;->children:Ljava/util/List;

    .line 177
    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    const/16 v3, 0x10

    const/4 v4, 0x0

    .line 178
    invoke-virtual {v1, v3, v4}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    const/16 v3, 0x40

    .line 179
    invoke-virtual {v1, v3, v4}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    const/16 v3, 0x80

    .line 180
    invoke-virtual {v1, v3, v4}, Lcom/adobe/xmp/options/Options;->setOption(IZ)V

    .line 181
    iput-object v8, v2, Lcom/adobe/xmp/impl/XMPNode;->qualifier:Ljava/util/List;

    .line 182
    iput-object v8, v0, Lcom/adobe/xmp/impl/XMPNode;->name:Ljava/lang/String;

    goto :goto_1c

    .line 183
    :cond_36
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/16 v1, 0x9

    const-string v2, "Failure creating xmpMM:InstanceID"

    invoke-direct {v0, v2, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 184
    :cond_37
    :goto_1c
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    :cond_38
    :goto_1d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 185
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 186
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v1

    if-nez v1, :cond_38

    .line 187
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_1d

    .line 188
    :cond_39
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/16 v1, 0xca

    const-string v2, "Invalid attributes of rdf:RDF element"

    invoke-direct {v0, v2, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 189
    :cond_3a
    new-instance v13, Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-direct {v13}, Lcom/adobe/xmp/impl/XMPMetaImpl;-><init>()V

    :cond_3b
    return-object v13
.end method
