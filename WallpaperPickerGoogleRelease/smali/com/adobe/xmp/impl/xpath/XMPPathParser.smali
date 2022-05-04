.class public final Lcom/adobe/xmp/impl/xpath/XMPPathParser;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;
    .locals 18
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "schemaNS",
            "path"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    new-instance v2, Lcom/adobe/xmp/impl/xpath/XMPPath;

    invoke-direct {v2}, Lcom/adobe/xmp/impl/xpath/XMPPath;-><init>()V

    const/4 v3, 0x0

    move v4, v3

    .line 2
    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v5

    const-string v6, "/[*"

    if-ge v4, v5, :cond_0

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-gez v5, :cond_0

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    const/16 v5, 0x66

    if-eqz v4, :cond_22

    .line 3
    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->verifyXPathRoot(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 4
    sget-object v8, Lcom/adobe/xmp/XMPMetaFactory;->schema:Lcom/adobe/xmp/XMPSchemaRegistry;

    .line 5
    check-cast v8, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;

    invoke-virtual {v8, v7}, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->findAlias(Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPAliasInfo;

    move-result-object v8

    const/high16 v9, -0x80000000

    const/4 v10, 0x5

    const/4 v11, 0x3

    const/4 v12, 0x1

    if-nez v8, :cond_1

    .line 6
    new-instance v8, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    invoke-direct {v8, v0, v9}, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 7
    iget-object v0, v2, Lcom/adobe/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    new-instance v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    invoke-direct {v0, v7, v12}, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 9
    iget-object v7, v2, Lcom/adobe/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 10
    :cond_1
    new-instance v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    invoke-interface {v8}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getNamespace()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7, v9}, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 11
    iget-object v7, v2, Lcom/adobe/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    new-instance v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    invoke-interface {v8}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getNamespace()Ljava/lang/String;

    move-result-object v7

    .line 13
    invoke-interface {v8}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v9

    .line 14
    invoke-static {v7, v9}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->verifyXPathRoot(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7, v12}, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 15
    iput-boolean v12, v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->alias:Z

    .line 16
    invoke-interface {v8}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v7

    .line 17
    iget v7, v7, Lcom/adobe/xmp/options/Options;->options:I

    .line 18
    iput v7, v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->aliasForm:I

    .line 19
    iget-object v7, v2, Lcom/adobe/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    invoke-interface {v8}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v0

    const/16 v7, 0x1000

    .line 21
    invoke-virtual {v0, v7}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 22
    new-instance v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    const-string v7, "[?xml:lang=\'x-default\']"

    invoke-direct {v0, v7, v10}, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 23
    iput-boolean v12, v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->alias:Z

    .line 24
    invoke-interface {v8}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v7

    .line 25
    iget v7, v7, Lcom/adobe/xmp/options/Options;->options:I

    .line 26
    iput v7, v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->aliasForm:I

    .line 27
    iget-object v7, v2, Lcom/adobe/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 28
    :cond_2
    invoke-interface {v8}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v0

    const/16 v7, 0x200

    .line 29
    invoke-virtual {v0, v7}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 30
    new-instance v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    const-string v7, "[1]"

    invoke-direct {v0, v7, v11}, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 31
    iput-boolean v12, v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->alias:Z

    .line 32
    invoke-interface {v8}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v7

    .line 33
    iget v7, v7, Lcom/adobe/xmp/options/Options;->options:I

    .line 34
    iput v7, v0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->aliasForm:I

    .line 35
    iget-object v7, v2, Lcom/adobe/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_1
    move v0, v3

    move v7, v0

    .line 36
    :goto_2
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v4, v8, :cond_21

    .line 37
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x2f

    const-string v13, "Empty XMPPath segment"

    if-ne v8, v9, :cond_5

    add-int/lit8 v4, v4, 0x1

    .line 38
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v4, v8, :cond_4

    goto :goto_3

    .line 39
    :cond_4
    new-instance v0, Lcom/adobe/xmp/XMPException;

    invoke-direct {v0, v13, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 40
    :cond_5
    :goto_3
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x2a

    const/16 v14, 0x5b

    if-ne v8, v9, :cond_7

    add-int/lit8 v4, v4, 0x1

    .line 41
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v4, v8, :cond_6

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v8, v14, :cond_6

    goto :goto_4

    .line 42
    :cond_6
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Missing \'[\' after \'*\'"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 43
    :cond_7
    :goto_4
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/4 v9, 0x6

    if-eq v8, v14, :cond_a

    move v0, v4

    .line 44
    :goto_5
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v0, v7, :cond_8

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-gez v7, :cond_8

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_8
    if-eq v0, v4, :cond_9

    .line 45
    new-instance v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v12}, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    move v8, v4

    move v4, v0

    goto/16 :goto_d

    .line 46
    :cond_9
    new-instance v0, Lcom/adobe/xmp/XMPException;

    invoke-direct {v0, v13, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_a
    add-int/lit8 v8, v4, 0x1

    .line 47
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x30

    const/16 v15, 0x5d

    const/4 v10, 0x0

    if-gt v14, v13, :cond_c

    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v3, 0x39

    if-gt v13, v3, :cond_c

    .line 48
    :goto_6
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v13

    if-ge v8, v13, :cond_b

    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-gt v14, v13, :cond_b

    .line 49
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-gt v13, v3, :cond_b

    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 50
    :cond_b
    new-instance v3, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    invoke-direct {v3, v10, v11}, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    goto :goto_8

    :cond_c
    move v3, v8

    .line 51
    :goto_7
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v13

    if-ge v3, v13, :cond_d

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-eq v13, v15, :cond_d

    .line 52
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x3d

    if-eq v13, v14, :cond_d

    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 53
    :cond_d
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v13

    if-ge v3, v13, :cond_20

    .line 54
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-ne v13, v15, :cond_f

    .line 55
    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    const-string v13, "[last()"

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 56
    new-instance v8, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    const/4 v13, 0x4

    invoke-direct {v8, v10, v13}, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    move-object/from16 v17, v8

    move v8, v3

    move-object/from16 v3, v17

    :goto_8
    move/from16 v17, v7

    move-object v7, v3

    move v3, v8

    move/from16 v8, v17

    goto :goto_c

    .line 57
    :cond_e
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Invalid non-numeric array index"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_f
    add-int/lit8 v0, v3, 0x1

    .line 58
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v13, 0x27

    if-eq v7, v13, :cond_11

    const/16 v13, 0x22

    if-ne v7, v13, :cond_10

    goto :goto_9

    .line 59
    :cond_10
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Invalid quote in array selector"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_11
    :goto_9
    add-int/lit8 v0, v0, 0x1

    .line 60
    :goto_a
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v13

    if-ge v0, v13, :cond_14

    .line 61
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-ne v13, v7, :cond_13

    add-int/lit8 v13, v0, 0x1

    .line 62
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v14

    if-ge v13, v14, :cond_14

    .line 63
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-eq v14, v7, :cond_12

    goto :goto_b

    :cond_12
    move v0, v13

    :cond_13
    add-int/2addr v0, v12

    goto :goto_a

    .line 64
    :cond_14
    :goto_b
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v0, v7, :cond_1f

    add-int/lit8 v0, v0, 0x1

    .line 65
    new-instance v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    invoke-direct {v7, v10, v9}, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    move/from16 v17, v3

    move v3, v0

    move/from16 v0, v17

    .line 66
    :goto_c
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v10

    if-ge v3, v10, :cond_1e

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-ne v10, v15, :cond_1e

    add-int/lit8 v3, v3, 0x1

    .line 67
    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 68
    iput-object v4, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    move v4, v3

    .line 69
    :goto_d
    iget v3, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->kind:I

    const-string v10, "Only xml:lang allowed with \'@\'"

    const/4 v13, 0x2

    const/16 v14, 0x3f

    const/16 v15, 0x40

    if-ne v3, v12, :cond_19

    .line 70
    iget-object v3, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    const/4 v9, 0x0

    .line 71
    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v15, :cond_17

    const-string v3, "?"

    .line 72
    iget-object v9, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 73
    invoke-virtual {v9, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v15

    if-eqz v15, :cond_15

    invoke-virtual {v3, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_e

    :cond_15
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v3, v9

    .line 74
    :goto_e
    iput-object v3, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    const-string v9, "?xml:lang"

    .line 75
    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    goto :goto_f

    .line 76
    :cond_16
    new-instance v0, Lcom/adobe/xmp/XMPException;

    invoke-direct {v0, v10, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 77
    :cond_17
    :goto_f
    iget-object v3, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    const/4 v9, 0x0

    .line 78
    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v14, :cond_18

    add-int/lit8 v8, v8, 0x1

    .line 79
    iput v13, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->kind:I

    .line 80
    :cond_18
    invoke-virtual {v1, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->verifyQualName(Ljava/lang/String;)V

    move/from16 v16, v9

    goto :goto_12

    :cond_19
    const/16 v16, 0x0

    if-ne v3, v9, :cond_1d

    .line 81
    iget-object v3, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 82
    invoke-virtual {v3, v12}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v15, :cond_1c

    const-string v3, "[?"

    .line 83
    iget-object v9, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 84
    invoke-virtual {v9, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v13

    if-eqz v13, :cond_1a

    invoke-virtual {v3, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_10

    :cond_1a
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v3, v9

    .line 85
    :goto_10
    iput-object v3, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    const-string v9, "[?xml:lang="

    .line 86
    invoke-virtual {v3, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1b

    goto :goto_11

    .line 87
    :cond_1b
    new-instance v0, Lcom/adobe/xmp/XMPException;

    invoke-direct {v0, v10, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 88
    :cond_1c
    :goto_11
    iget-object v3, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    .line 89
    invoke-virtual {v3, v12}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v14, :cond_1d

    add-int/lit8 v8, v8, 0x1

    const/4 v3, 0x5

    .line 90
    iput v3, v7, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->kind:I

    .line 91
    invoke-virtual {v1, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->verifyQualName(Ljava/lang/String;)V

    goto :goto_13

    :cond_1d
    :goto_12
    const/4 v3, 0x5

    .line 92
    :goto_13
    iget-object v9, v2, Lcom/adobe/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v10, v3

    move v7, v8

    move/from16 v3, v16

    goto/16 :goto_2

    .line 93
    :cond_1e
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Missing \']\' for array index"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 94
    :cond_1f
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "No terminating quote for array selector"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 95
    :cond_20
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Missing \']\' or \'=\' for array index"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_21
    return-object v2

    .line 96
    :cond_22
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Empty initial XMPPath step"

    invoke-direct {v0, v1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static verifyQualName(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "qualName"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/16 v0, 0x3a

    .line 1
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/16 v1, 0x66

    if-lez v0, :cond_2

    const/4 v2, 0x0

    .line 2
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 3
    invoke-static {p0}, Lcom/adobe/xmp/impl/Utils;->isXMLNameNS(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4
    sget-object v0, Lcom/adobe/xmp/XMPMetaFactory;->schema:Lcom/adobe/xmp/XMPSchemaRegistry;

    .line 5
    check-cast v0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;

    .line 6
    monitor-enter v0

    :try_start_0
    const-string v2, ":"

    .line 7
    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, ":"

    .line 8
    invoke-virtual {p0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 9
    :cond_0
    iget-object v2, v0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->prefixToNamespaceMap:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    if-eqz p0, :cond_1

    return-void

    .line 10
    :cond_1
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string v0, "Unknown namespace prefix for qualified name"

    invoke-direct {p0, v0, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0

    throw p0

    .line 12
    :cond_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string v0, "Ill-formed qualified name"

    invoke-direct {p0, v0, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public static verifySimpleXMLName(Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/adobe/xmp/impl/Utils;->xmlNameStartChars:[Z

    .line 2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lez v0, :cond_2

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-gt v0, v1, :cond_1

    .line 3
    sget-object v4, Lcom/adobe/xmp/impl/Utils;->xmlNameStartChars:[Z

    aget-boolean v0, v4, v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v3

    :goto_1
    if-nez v0, :cond_2

    goto :goto_5

    :cond_2
    move v0, v3

    .line 4
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_6

    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-gt v4, v1, :cond_4

    .line 6
    sget-object v5, Lcom/adobe/xmp/impl/Utils;->xmlNameChars:[Z

    aget-boolean v4, v5, v4

    if-eqz v4, :cond_3

    goto :goto_3

    :cond_3
    move v4, v2

    goto :goto_4

    :cond_4
    :goto_3
    move v4, v3

    :goto_4
    if-nez v4, :cond_5

    goto :goto_5

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_6
    move v2, v3

    :goto_5
    if-eqz v2, :cond_7

    return-void

    .line 7
    :cond_7
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 v0, 0x66

    const-string v1, "Bad XML name"

    invoke-direct {p0, v1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method public static verifyXPathRoot(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "schemaNS",
            "rootProp"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/16 v0, 0x65

    if-eqz p0, :cond_7

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_7

    const/4 v1, 0x0

    .line 2
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3f

    const/16 v4, 0x66

    if-eq v2, v3, :cond_6

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x40

    if-eq v2, v3, :cond_6

    const/16 v2, 0x2f

    .line 3
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_5

    const/16 v2, 0x5b

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_5

    .line 4
    sget-object v2, Lcom/adobe/xmp/XMPMetaFactory;->schema:Lcom/adobe/xmp/XMPSchemaRegistry;

    .line 5
    check-cast v2, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;

    invoke-virtual {v2, p0}, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    const/16 v3, 0x3a

    .line 6
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-gez v3, :cond_1

    .line 7
    invoke-static {p1}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->verifySimpleXMLName(Ljava/lang/String;)V

    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {v2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    return-object p0

    .line 9
    :cond_1
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->verifySimpleXMLName(Ljava/lang/String;)V

    .line 10
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->verifySimpleXMLName(Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    .line 11
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 12
    sget-object v2, Lcom/adobe/xmp/XMPMetaFactory;->schema:Lcom/adobe/xmp/XMPSchemaRegistry;

    .line 13
    check-cast v2, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;

    invoke-virtual {v2, p0}, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_3

    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    return-object p1

    .line 15
    :cond_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Schema namespace URI and prefix mismatch"

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 16
    :cond_3
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Unknown schema namespace prefix"

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 17
    :cond_4
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Unregistered schema namespace URI"

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 18
    :cond_5
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Top level name must be simple"

    invoke-direct {p0, p1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 19
    :cond_6
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Top level name must not be a qualifier"

    invoke-direct {p0, p1, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    .line 20
    :cond_7
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Schema namespace URI is required"

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method
