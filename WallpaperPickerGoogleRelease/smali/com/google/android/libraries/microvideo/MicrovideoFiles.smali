.class public final Lcom/google/android/libraries/microvideo/MicrovideoFiles;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static isMicrovideo(Ljava/io/InputStream;)Z
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inputStream"
        }
    .end annotation

    const-string v0, "XmpUtil"

    .line 1
    new-instance v1, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;

    invoke-direct {v1, p0}, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;-><init>(Ljava/io/InputStream;)V

    const-string v2, "Exception occurred while closing stream."

    const/4 v3, 0x0

    .line 2
    :try_start_0
    invoke-virtual {v1}, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->read()I

    move-result v4

    const/16 v5, 0xff

    if-ne v4, v5, :cond_1

    invoke-virtual {v1}, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->read()I

    move-result v4

    const/16 v6, 0xd8

    if-eq v4, v6, :cond_0

    goto :goto_1

    .line 3
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    :goto_0
    invoke-virtual {v1}, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->read()I

    move-result v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v6, -0x1

    if-eq v4, v6, :cond_9

    if-eq v4, v5, :cond_2

    .line 5
    :try_start_1
    iget-object p0, v1, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;

    :cond_1
    :goto_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_6

    :catch_0
    move-exception p0

    goto :goto_5

    .line 6
    :cond_2
    :goto_2
    :try_start_2
    invoke-virtual {v1}, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->read()I

    move-result v4
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-ne v4, v5, :cond_3

    goto :goto_2

    :cond_3
    if-ne v4, v6, :cond_4

    .line 7
    :try_start_3
    iget-object p0, v1, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    :cond_4
    const/16 v7, 0xda

    if-ne v4, v7, :cond_5

    :try_start_4
    iget-object v1, v1, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;

    :goto_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_7

    .line 8
    :cond_5
    :try_start_5
    invoke-virtual {v1}, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->read()I

    move-result v7

    .line 9
    invoke-virtual {v1}, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->read()I

    move-result v8

    if-eq v7, v6, :cond_8

    if-ne v8, v6, :cond_6

    goto :goto_4

    :cond_6
    shl-int/lit8 v6, v7, 0x8

    or-int/2addr v6, v8

    const/16 v7, 0xe1

    add-int/lit8 v6, v6, -0x2

    if-ne v4, v7, :cond_7

    .line 10
    invoke-virtual {v1, v6, v4}, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->read(II)Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 11
    :cond_7
    invoke-virtual {v1, v6}, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->skip(I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0

    .line 12
    :cond_8
    :goto_4
    :try_start_6
    iget-object p0, v1, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_1

    :cond_9
    :try_start_7
    iget-object v1, v1, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_3

    :catch_1
    move-exception v1

    .line 13
    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7

    :catchall_0
    move-exception p0

    goto/16 :goto_e

    :catch_2
    move-exception p0

    :try_start_8
    const-string v4, "Exception occurred while parsing xmp"

    .line 14
    invoke-static {v0, v4, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 15
    :try_start_9
    iget-object p0, v1, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0

    goto :goto_1

    .line 16
    :goto_5
    invoke-static {v0, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_6
    move-object p0, v3

    :goto_7
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p0, :cond_a

    goto/16 :goto_c

    .line 17
    :cond_a
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;

    .line 18
    iget v5, v4, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->length:I

    const/16 v6, 0x1d

    if-ge v5, v6, :cond_c

    goto :goto_8

    :cond_c
    :try_start_a
    new-array v5, v6, [B

    .line 19
    iget-object v7, v4, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->data:[B

    iget v8, v4, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->offset:I

    invoke-static {v7, v8, v5, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    new-instance v7, Ljava/lang/String;

    const-string v8, "UTF-8"

    invoke-direct {v7, v5, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v5, "http://ns.adobe.com/xap/1.0/\u0000"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_a} :catch_3

    if-eqz v5, :cond_d

    move v5, v1

    goto :goto_9

    :catch_3
    :cond_d
    :goto_8
    move v5, v2

    :goto_9
    if-eqz v5, :cond_b

    .line 21
    iget p0, v4, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->length:I

    sub-int/2addr p0, v1

    :goto_a
    if-lt p0, v1, :cond_f

    .line 22
    iget v5, v4, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->offset:I

    add-int/2addr v5, p0

    .line 23
    iget-object v7, v4, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->data:[B

    aget-byte v8, v7, v5

    const/16 v9, 0x3e

    if-ne v8, v9, :cond_e

    add-int/lit8 v5, v5, -0x1

    .line 24
    aget-byte v5, v7, v5

    const/16 v7, 0x3f

    if-eq v5, v7, :cond_e

    add-int/2addr p0, v1

    goto :goto_b

    :cond_e
    add-int/lit8 p0, p0, -0x1

    goto :goto_a

    .line 25
    :cond_f
    iget p0, v4, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->length:I

    :goto_b
    sub-int/2addr p0, v6

    .line 26
    new-array v5, p0, [B

    .line 27
    iget v7, v4, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->offset:I

    add-int/2addr v7, v6

    .line 28
    iget-object v4, v4, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->data:[B

    invoke-static {v4, v7, v5, v2, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 29
    :try_start_b
    invoke-static {v5}, Lcom/adobe/xmp/XMPMetaFactory;->parseFromBuffer([B)Lcom/adobe/xmp/XMPMeta;

    move-result-object v3
    :try_end_b
    .catch Lcom/adobe/xmp/XMPException; {:try_start_b .. :try_end_b} :catch_4

    goto :goto_c

    :catch_4
    move-exception p0

    const-string v4, "Exception thrown while parsing file"

    .line 30
    invoke-static {v0, v4, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_10
    :goto_c
    if-nez v3, :cond_11

    return v2

    .line 31
    :cond_11
    :try_start_c
    invoke-static {v3}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata;->getMicrovideoPayloadLength(Lcom/adobe/xmp/XMPMeta;)I

    move-result p0
    :try_end_c
    .catch Lcom/adobe/xmp/XMPException; {:try_start_c .. :try_end_c} :catch_5

    int-to-long v3, p0

    const-wide/16 v5, 0x0

    cmp-long p0, v3, v5

    if-lez p0, :cond_12

    goto :goto_d

    :cond_12
    move v1, v2

    :goto_d
    return v1

    :catch_5
    return v2

    .line 32
    :goto_e
    :try_start_d
    iget-object v1, v1, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_6

    goto :goto_f

    :catch_6
    move-exception v1

    .line 33
    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 34
    :goto_f
    throw p0
.end method
