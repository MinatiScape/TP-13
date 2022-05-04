.class public Lcom/adobe/xmp/impl/XMPMetaParser;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final XMP_RDF:Ljava/lang/Object;

.field public static factory:Ljavax/xml/parsers/DocumentBuilderFactory;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/adobe/xmp/impl/XMPMetaParser;->XMP_RDF:Ljava/lang/Object;

    .line 2
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    const/4 v1, 0x1

    .line 3
    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 4
    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setIgnoringComments(Z)V

    :try_start_0
    const-string v2, "http://javax.xml.XMLConstants/feature/secure-processing"

    .line 5
    invoke-virtual {v0, v2, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    :catch_0
    sput-object v0, Lcom/adobe/xmp/impl/XMPMetaParser;->factory:Ljavax/xml/parsers/DocumentBuilderFactory;

    return-void
.end method

.method public static findRootNode(Lorg/w3c/dom/Node;Z[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "root",
            "xmpmetaRequired",
            "result"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    .line 2
    :goto_0
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 3
    invoke-interface {p0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 4
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x7

    if-ne v4, v3, :cond_0

    move-object v3, v2

    check-cast v3, Lorg/w3c/dom/ProcessingInstruction;

    .line 5
    invoke-interface {v3}, Lorg/w3c/dom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v5

    const-string v6, "xpacket"

    if-ne v5, v6, :cond_0

    if-eqz p2, :cond_5

    const/4 v2, 0x2

    .line 6
    invoke-interface {v3}, Lorg/w3c/dom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v3

    aput-object v3, p2, v2

    goto :goto_1

    :cond_0
    const/4 v3, 0x3

    .line 7
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v5

    if-eq v3, v5, :cond_5

    .line 8
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    if-eq v4, v3, :cond_5

    .line 9
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    .line 10
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "xmpmeta"

    .line 11
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, "xapmeta"

    .line 12
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_1
    const-string v5, "adobe:ns:meta/"

    .line 13
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 14
    invoke-static {v2, v0, p2}, Lcom/adobe/xmp/impl/XMPMetaParser;->findRootNode(Lorg/w3c/dom/Node;Z[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_2
    if-nez p1, :cond_4

    const-string v5, "RDF"

    .line 15
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    .line 16
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    if-eqz p2, :cond_3

    .line 17
    aput-object v2, p2, v0

    .line 18
    sget-object p0, Lcom/adobe/xmp/impl/XMPMetaParser;->XMP_RDF:Ljava/lang/Object;

    const/4 p1, 0x1

    aput-object p0, p2, p1

    :cond_3
    return-object p2

    .line 19
    :cond_4
    invoke-static {v2, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaParser;->findRootNode(Lorg/w3c/dom/Node;Z[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_5

    return-object v2

    :cond_5
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_6
    const/4 p0, 0x0

    return-object p0
.end method

.method public static parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "source"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    :try_start_0
    sget-object v0, Lcom/adobe/xmp/impl/XMPMetaParser;->factory:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilder;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 3
    invoke-virtual {v0, p0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object p0
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 4
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/16 v1, 0xcc

    const-string v2, "Error reading the XML-file"

    invoke-direct {v0, v2, v1, p0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p0

    .line 5
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/4 v1, 0x0

    const-string v2, "XML Parser not correctly configured"

    invoke-direct {v0, v2, v1, p0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v0

    :catch_2
    move-exception p0

    .line 6
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const/16 v1, 0xc9

    const-string v2, "XML parsing failure"

    invoke-direct {v0, v2, v1, p0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v0
.end method

.method public static parseXmlFromBytebuffer(Lcom/adobe/xmp/impl/ByteBuffer;Lcom/adobe/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;
    .locals 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "buffer",
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/ByteBuffer;->getByteStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 2
    :try_start_0
    invoke-static {v0}, Lcom/adobe/xmp/impl/XMPMetaParser;->parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object p0
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    .line 3
    invoke-virtual {v0}, Lcom/adobe/xmp/XMPException;->getErrorCode()I

    move-result v1

    const/16 v2, 0xc9

    if-eq v1, v2, :cond_1

    .line 4
    invoke-virtual {v0}, Lcom/adobe/xmp/XMPException;->getErrorCode()I

    move-result v1

    const/16 v2, 0xcc

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    throw v0

    :cond_1
    :goto_0
    const/16 v1, 0x10

    .line 6
    invoke-virtual {p1, v1}, Lcom/adobe/xmp/options/Options;->getOption(I)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 7
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/ByteBuffer;->getEncoding()Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    const/16 v1, 0x8

    new-array v2, v1, [B

    .line 8
    new-instance v3, Lcom/adobe/xmp/impl/ByteBuffer;

    .line 9
    iget v4, p0, Lcom/adobe/xmp/impl/ByteBuffer;->length:I

    mul-int/lit8 v4, v4, 0x4

    .line 10
    div-int/lit8 v4, v4, 0x3

    invoke-direct {v3, v4}, Lcom/adobe/xmp/impl/ByteBuffer;-><init>(I)V

    const/4 v4, 0x0

    move v5, v4

    move v6, v5

    move v7, v6

    move v8, v7

    .line 11
    :goto_1
    iget v9, p0, Lcom/adobe/xmp/impl/ByteBuffer;->length:I

    const/16 v10, 0xb

    if-ge v5, v9, :cond_9

    if-ge v5, v9, :cond_8

    .line 12
    iget-object v9, p0, Lcom/adobe/xmp/impl/ByteBuffer;->buffer:[B

    aget-byte v9, v9, v5

    and-int/lit16 v9, v9, 0xff

    const/16 v11, 0x80

    if-eq v6, v10, :cond_5

    const/16 v12, 0x7f

    if-ge v9, v12, :cond_2

    int-to-byte v9, v9

    .line 13
    iget v10, v3, Lcom/adobe/xmp/impl/ByteBuffer;->length:I

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v3, v10}, Lcom/adobe/xmp/impl/ByteBuffer;->ensureCapacity(I)V

    .line 14
    iget-object v10, v3, Lcom/adobe/xmp/impl/ByteBuffer;->buffer:[B

    iget v11, v3, Lcom/adobe/xmp/impl/ByteBuffer;->length:I

    add-int/lit8 v12, v11, 0x1

    iput v12, v3, Lcom/adobe/xmp/impl/ByteBuffer;->length:I

    aput-byte v9, v10, v11

    goto :goto_4

    :cond_2
    const/16 v12, 0xc0

    if-lt v9, v12, :cond_4

    const/4 v6, -0x1

    move v8, v6

    move v6, v9

    :goto_2
    if-ge v8, v1, :cond_3

    and-int/lit16 v12, v6, 0x80

    if-ne v12, v11, :cond_3

    add-int/lit8 v8, v8, 0x1

    shl-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v6, v7, 0x1

    int-to-byte v9, v9

    .line 15
    aput-byte v9, v2, v7

    move v7, v6

    move v6, v10

    goto :goto_4

    :cond_4
    int-to-byte v9, v9

    .line 16
    invoke-static {v9}, Lcom/adobe/xmp/impl/Latin1Converter;->convertToUTF8(B)[B

    move-result-object v9

    .line 17
    invoke-virtual {v3, v9}, Lcom/adobe/xmp/impl/ByteBuffer;->append([B)V

    goto :goto_4

    :cond_5
    if-lez v8, :cond_7

    and-int/lit16 v10, v9, 0xc0

    if-ne v10, v11, :cond_7

    add-int/lit8 v10, v7, 0x1

    int-to-byte v9, v9

    .line 18
    aput-byte v9, v2, v7

    add-int/lit8 v8, v8, -0x1

    if-nez v8, :cond_6

    .line 19
    iget v6, v3, Lcom/adobe/xmp/impl/ByteBuffer;->length:I

    add-int/2addr v6, v10

    invoke-virtual {v3, v6}, Lcom/adobe/xmp/impl/ByteBuffer;->ensureCapacity(I)V

    .line 20
    iget-object v6, v3, Lcom/adobe/xmp/impl/ByteBuffer;->buffer:[B

    iget v7, v3, Lcom/adobe/xmp/impl/ByteBuffer;->length:I

    invoke-static {v2, v4, v6, v7, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    iget v6, v3, Lcom/adobe/xmp/impl/ByteBuffer;->length:I

    add-int/2addr v6, v10

    iput v6, v3, Lcom/adobe/xmp/impl/ByteBuffer;->length:I

    goto :goto_3

    :cond_6
    move v7, v10

    goto :goto_4

    .line 22
    :cond_7
    aget-byte v6, v2, v4

    invoke-static {v6}, Lcom/adobe/xmp/impl/Latin1Converter;->convertToUTF8(B)[B

    move-result-object v6

    .line 23
    invoke-virtual {v3, v6}, Lcom/adobe/xmp/impl/ByteBuffer;->append([B)V

    sub-int/2addr v5, v7

    :goto_3
    move v6, v4

    move v7, v6

    :goto_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 24
    :cond_8
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    const-string p1, "The index exceeds the valid buffer area"

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9
    if-ne v6, v10, :cond_a

    :goto_5
    if-ge v4, v7, :cond_a

    .line 25
    aget-byte p0, v2, v4

    .line 26
    invoke-static {p0}, Lcom/adobe/xmp/impl/Latin1Converter;->convertToUTF8(B)[B

    move-result-object p0

    .line 27
    invoke-virtual {v3, p0}, Lcom/adobe/xmp/impl/ByteBuffer;->append([B)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    :cond_a
    move-object p0, v3

    .line 28
    :cond_b
    invoke-virtual {p1}, Lcom/adobe/xmp/options/ParseOptions;->getFixControlChars()Z

    move-result p1

    if-eqz p1, :cond_c

    .line 29
    :try_start_1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/ByteBuffer;->getEncoding()Ljava/lang/String;

    move-result-object p1

    .line 30
    new-instance v1, Lcom/adobe/xmp/impl/FixASCIIControlsReader;

    new-instance v2, Ljava/io/InputStreamReader;

    .line 31
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/ByteBuffer;->getByteStream()Ljava/io/InputStream;

    move-result-object p0

    invoke-direct {v2, p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lcom/adobe/xmp/impl/FixASCIIControlsReader;-><init>(Ljava/io/Reader;)V

    .line 32
    new-instance p0, Lorg/xml/sax/InputSource;

    invoke-direct {p0, v1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-static {p0}, Lcom/adobe/xmp/impl/XMPMetaParser;->parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    return-object p0

    .line 33
    :catch_1
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0x9

    const-string v1, "Unsupported Encoding"

    invoke-direct {p0, v1, p1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw p0

    .line 34
    :cond_c
    new-instance p1, Lorg/xml/sax/InputSource;

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/ByteBuffer;->getByteStream()Ljava/io/InputStream;

    move-result-object p0

    invoke-direct {p1, p0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 35
    invoke-static {p1}, Lcom/adobe/xmp/impl/XMPMetaParser;->parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object p0

    return-object p0
.end method
