.class public final Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;
    }
.end annotation


# direct methods
.method public static varargs firstNonNull([Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "suppliers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "E:",
            "Ljava/lang/Throwable;",
            ">([",
            "Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier<",
            "TT;TE;>;)TT;^TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p0, v1

    .line 2
    invoke-interface {v2}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getFileFormatVersion(Lcom/adobe/xmp/XMPMeta;)I
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "xmpMeta"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;

    .line 1
    new-instance v1, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;-><init>(Lcom/adobe/xmp/XMPMeta;I)V

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;-><init>(Lcom/adobe/xmp/XMPMeta;I)V

    const/4 p0, 0x1

    aput-object v1, v0, p0

    sget-object p0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$8;->$instance:Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;

    aput-object p0, v0, v2

    invoke-static {v0}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata;->firstNonNull([Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method public static getMicrovideoPayloadLength(Lcom/adobe/xmp/XMPMeta;)I
    .locals 17
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "xmpMeta"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 1
    invoke-static/range {p0 .. p0}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata;->getFileFormatVersion(Lcom/adobe/xmp/XMPMeta;)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;

    .line 2
    new-instance v4, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;

    invoke-direct {v4, v0, v2}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$6;-><init>(Lcom/adobe/xmp/XMPMeta;I)V

    aput-object v4, v1, v3

    sget-object v0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$13;->$instance:Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata;->firstNonNull([Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 3
    :cond_0
    invoke-static/range {p0 .. p0}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata;->getFileFormatVersion(Lcom/adobe/xmp/XMPMeta;)I

    move-result v1

    if-eq v1, v2, :cond_12

    const-string v1, "Directory"

    const-string v4, "http://ns.google.com/photos/1.0/container/"

    .line 4
    move-object v5, v0

    check-cast v5, Lcom/adobe/xmp/impl/XMPMetaImpl;

    .line 5
    invoke-static {v4}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 6
    invoke-static {v4, v1}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object v4

    .line 7
    iget-object v5, v5, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v6, 0x0

    invoke-static {v5, v4, v3, v6}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v4

    if-nez v4, :cond_1

    move v4, v3

    goto :goto_0

    .line 8
    :cond_1
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result v5

    if-eqz v5, :cond_11

    .line 9
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v4

    .line 10
    :goto_0
    new-instance v5, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainer;

    invoke-direct {v5}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainer;-><init>()V

    move v6, v2

    :goto_1
    if-gt v6, v4, :cond_a

    if-lez v6, :cond_2

    const/16 v7, 0x16

    .line 11
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v7, 0x5b

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v7, 0x5d

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    :cond_2
    const/4 v7, -0x1

    if-ne v6, v7, :cond_9

    const-string v7, "[last()]"

    .line 12
    invoke-virtual {v1, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_2
    const-string v8, "http://ns.google.com/photos/1.0/container/"

    const-string v9, "http://ns.google.com/photos/1.0/container/item/"

    const-string v10, "Mime"

    .line 13
    invoke-static {v0, v8, v7, v9, v10}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getStructField(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 14
    invoke-static {v12, v10}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->requiredNonNullValue(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v10, "Semantic"

    .line 15
    invoke-static {v0, v8, v7, v9, v10}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getStructField(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 16
    invoke-static {v13, v10}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->requiredNonNullValue(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v10, "Length"

    .line 17
    invoke-static {v0, v8, v7, v9, v10}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getStructField(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "0"

    if-nez v10, :cond_3

    move-object v10, v11

    :cond_3
    const-string v14, "Padding"

    .line 18
    invoke-static {v0, v8, v7, v9, v14}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getStructField(Lcom/adobe/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_4

    goto :goto_3

    :cond_4
    move-object v11, v7

    .line 19
    :goto_3
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 20
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 21
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 22
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, ""

    if-nez v7, :cond_5

    const-string v10, " length"

    .line 23
    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    :cond_5
    if-nez v8, :cond_6

    .line 24
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    const-string v10, " padding"

    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 25
    :cond_6
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_8

    .line 26
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Missing required properties:"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v1, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_7
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    :goto_4
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 27
    :cond_8
    new-instance v9, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;

    .line 28
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 29
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v15

    const/16 v16, 0x0

    move-object v11, v9

    invoke-direct/range {v11 .. v16}, Lcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem;-><init>(Ljava/lang/String;Ljava/lang/String;IILcom/google/android/libraries/microvideo/xmp/AutoValue_MicroVideoXmpContainerItem$1;)V

    .line 30
    monitor-enter v5

    .line 31
    :try_start_0
    iget-object v7, v5, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainer;->items:Ljava/util/List;

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    monitor-exit v5

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v5

    throw v0

    .line 33
    :cond_9
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/16 v1, 0x68

    const-string v2, "Array index must be larger than zero"

    invoke-direct {v0, v2, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 34
    :cond_a
    monitor-enter v5

    .line 35
    :try_start_1
    iget-object v0, v5, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainer;->items:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v5

    .line 36
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v1, v3

    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;

    if-eqz v2, :cond_d

    .line 37
    invoke-virtual {v4}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getSemantic()Ljava/lang/String;

    move-result-object v2

    const-string v5, "Primary"

    invoke-virtual {v2, v5}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v2

    const-string v5, "MVXmpMetadata"

    const-string v6, ""

    if-nez v2, :cond_b

    const-string v2, "First container item must be primary.\n"

    .line 38
    invoke-virtual {v6, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v2, "Badly formatted file. First container item is not primary"

    .line 39
    invoke-static {v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    :cond_b
    invoke-virtual {v4}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getLength()I

    move-result v2

    if-lez v2, :cond_c

    .line 41
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v6, "First container item must have length of 0.\n"

    invoke-virtual {v2, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    invoke-virtual {v4}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getLength()I

    move-result v2

    const/16 v6, 0x3b

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v6, "First container length expected to be 0. Found: "

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    :cond_c
    invoke-virtual {v4}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getPadding()I

    move-result v2

    add-int/2addr v1, v2

    move v2, v3

    goto :goto_5

    .line 44
    :cond_d
    invoke-virtual {v4}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getSemantic()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Primary"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v5

    const-string v6, "MVXmpMetadata"

    const-string v7, ""

    if-eqz v5, :cond_e

    const-string v5, "Secondary container items must not be primary.\n"

    .line 45
    invoke-virtual {v7, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v5, "Badly formatted file. Only first container item should be primary"

    .line 46
    invoke-static {v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    :cond_e
    invoke-virtual {v4}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getPadding()I

    move-result v5

    if-lez v5, :cond_f

    .line 48
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "Secondary container items must have 0 padding.\n"

    invoke-virtual {v5, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    const-string v5, "Badly formatted file. Only primary container items may have padding."

    .line 49
    invoke-static {v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    :cond_f
    invoke-virtual {v4}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getLength()I

    move-result v5

    invoke-virtual {v4}, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;->getPadding()I

    move-result v4

    add-int/2addr v4, v5

    add-int/2addr v1, v4

    goto/16 :goto_5

    :cond_10
    return v1

    :catchall_1
    move-exception v0

    .line 51
    monitor-exit v5

    throw v0

    .line 52
    :cond_11
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/16 v1, 0x66

    const-string v2, "The named property is not an array"

    invoke-direct {v0, v2, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 53
    :cond_12
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "V1 format does not have a container"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static requiredValueMissing(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "description"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/adobe/xmp/XMPException;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, "Property value missing for "

    if-eqz v1, :cond_0

    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
