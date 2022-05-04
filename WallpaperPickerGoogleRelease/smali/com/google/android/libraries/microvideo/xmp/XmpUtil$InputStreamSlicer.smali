.class public Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field public final inputStream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inputStream"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    return-void
.end method

.method public read()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result p0

    return p0
.end method

.method public read(II)Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "byteCount",
            "marker"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2
    new-array v0, p1, [B

    .line 3
    iget-object p0, p0, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;

    sget v1, Lcom/google/common/io/ByteStreams;->$r8$clinit:I

    .line 4
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-ltz p1, :cond_2

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, p1, :cond_1

    add-int v3, v1, v2

    sub-int v4, p1, v2

    .line 5
    invoke-virtual {p0, v0, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/2addr v2, v3

    goto :goto_0

    .line 6
    :cond_1
    :goto_1
    new-instance p0, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;

    invoke-direct {p0, v0, p2, v1, v2}, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;-><init>([BIII)V

    return-object p0

    .line 7
    :cond_2
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    const-string p1, "len is negative"

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public skip(I)V
    .locals 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "length"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$InputStreamSlicer;->inputStream:Ljava/io/InputStream;

    int-to-long v0, p1

    sget p1, Lcom/google/common/io/ByteStreams;->$r8$clinit:I

    const/16 p1, 0x2000

    new-array v2, p1, [B

    const-wide/16 v3, 0x0

    move-wide v5, v3

    :goto_0
    cmp-long v7, v5, v0

    if-gez v7, :cond_2

    sub-long v8, v0, v5

    .line 2
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v10

    if-nez v10, :cond_0

    move-wide v10, v3

    goto :goto_1

    :cond_0
    int-to-long v10, v10

    .line 3
    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    invoke-virtual {p0, v10, v11}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v10

    :goto_1
    cmp-long v12, v10, v3

    if-nez v12, :cond_1

    int-to-long v10, p1

    .line 4
    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    long-to-int v8, v8

    const/4 v9, 0x0

    .line 5
    invoke-virtual {p0, v2, v9, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v8

    int-to-long v10, v8

    const-wide/16 v8, -0x1

    cmp-long v8, v10, v8

    if-nez v8, :cond_1

    goto :goto_2

    :cond_1
    add-long/2addr v5, v10

    goto :goto_0

    :cond_2
    :goto_2
    if-ltz v7, :cond_3

    return-void

    .line 6
    :cond_3
    new-instance p0, Ljava/io/EOFException;

    const/16 p1, 0x64

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "reached end of stream after skipping "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " bytes; "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " bytes expected"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
