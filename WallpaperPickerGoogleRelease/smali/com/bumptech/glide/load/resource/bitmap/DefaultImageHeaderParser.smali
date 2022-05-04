.class public final Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/ImageHeaderParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader;,
        Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$ByteBufferReader;,
        Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;,
        Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;
    }
.end annotation


# static fields
.field public static final BYTES_PER_FORMAT:[I

.field public static final JPEG_EXIF_SEGMENT_PREAMBLE_BYTES:[B


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-string v0, "UTF-8"

    .line 1
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    const-string v1, "Exif\u0000\u0000"

    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;->JPEG_EXIF_SEGMENT_PREAMBLE_BYTES:[B

    const/16 v0, 0xd

    new-array v0, v0, [I

    .line 2
    fill-array-data v0, :array_0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;->BYTES_PER_FORMAT:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0x1
        0x1
        0x2
        0x4
        0x8
        0x1
        0x1
        0x2
        0x4
        0x8
        0x4
        0x8
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getOrientation(Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)I
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "is",
            "byteArrayPool"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader;-><init>(Ljava/io/InputStream;)V

    const-string p1, "Argument must not be null"

    .line 2
    invoke-static {p2, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader;->getUInt16()I

    move-result p1

    const v1, 0xffd8

    and-int v2, p1, v1

    if-eq v2, v1, :cond_1

    const/16 v1, 0x4d4d

    if-eq p1, v1, :cond_1

    const/16 v1, 0x4949

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    const/4 v2, 0x3

    const/4 v3, -0x1

    const-string v4, "DfltImageHeaderParser"

    if-nez v1, :cond_2

    .line 4
    invoke-static {v4, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_9

    const/16 p0, 0x2f

    .line 5
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p0, "Parser doesn\'t handle magic number: "

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 6
    :cond_2
    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader;->getUInt8()S

    move-result p1

    const/16 v1, 0xff

    if-eq p1, v1, :cond_3

    .line 7
    invoke-static {v4, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_6

    const/16 v1, 0x18

    .line 8
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Unknown segmentId="

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 9
    :cond_3
    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader;->getUInt8()S

    move-result p1

    const/16 v1, 0xda

    if-ne p1, v1, :cond_4

    goto :goto_2

    :cond_4
    const/16 v1, 0xd9

    if-ne p1, v1, :cond_5

    .line 10
    invoke-static {v4, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_6

    const-string p1, "Found MARKER_EOI in exif segment"

    .line 11
    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 12
    :cond_5
    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader;->getUInt16()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    const/16 v5, 0xe1

    if-eq p1, v5, :cond_7

    int-to-long v5, v1

    .line 13
    invoke-virtual {v0, v5, v6}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader;->skip(J)J

    move-result-wide v7

    cmp-long v5, v7, v5

    if-eqz v5, :cond_2

    .line 14
    invoke-static {v4, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_6

    const/16 v5, 0x71

    const-string v6, "Unable to skip enough data, type: "

    const-string v9, ", wanted to skip: "

    .line 15
    invoke-static {v5, v6, p1, v9, v1}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ", but actually skipped: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    :goto_2
    move v1, v3

    :cond_7
    if-ne v1, v3, :cond_8

    .line 16
    invoke-static {v4, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_9

    const-string p0, "Failed to parse exif segment length, or exif segment not found"

    .line 17
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 18
    :cond_8
    const-class p1, [B

    invoke-interface {p2, v1, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;->get(ILjava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    .line 19
    :try_start_0
    invoke-virtual {p0, v0, p1, v1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;->parseExifSegment(Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;[BI)I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    invoke-interface {p2, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;->put(Ljava/lang/Object;)V

    :cond_9
    :goto_3
    return v3

    :catchall_0
    move-exception p0

    invoke-interface {p2, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;->put(Ljava/lang/Object;)V

    throw p0
.end method

.method public final getType(Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "reader"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->getUInt16()I

    move-result p0

    const v0, 0xffd8

    if-ne p0, v0, :cond_0

    .line 4
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->JPEG:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p0

    :cond_0
    shl-int/lit8 p0, p0, 0x10

    const/high16 v0, -0x10000

    and-int/2addr p0, v0

    .line 5
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->getUInt16()I

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    or-int/2addr p0, v1

    const v1, -0x76afb1b9

    if-ne p0, v1, :cond_2

    const-wide/16 v0, 0x15

    .line 6
    invoke-interface {p1, v0, v1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->skip(J)J

    .line 7
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->getByte()I

    move-result p0

    const/4 p1, 0x3

    if-lt p0, p1, :cond_1

    .line 8
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->PNG_A:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->PNG:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    :goto_0
    return-object p0

    :cond_2
    shr-int/lit8 v1, p0, 0x8

    const v3, 0x474946

    if-ne v1, v3, :cond_3

    .line 9
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->GIF:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p0

    :cond_3
    const v1, 0x52494646

    if-eq p0, v1, :cond_4

    .line 10
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p0

    :cond_4
    const-wide/16 v3, 0x4

    .line 11
    invoke-interface {p1, v3, v4}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->skip(J)J

    .line 12
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->getUInt16()I

    move-result p0

    shl-int/lit8 p0, p0, 0x10

    and-int/2addr p0, v0

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->getUInt16()I

    move-result v1

    and-int/2addr v1, v2

    or-int/2addr p0, v1

    const v1, 0x57454250

    if-eq p0, v1, :cond_5

    .line 13
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p0

    .line 14
    :cond_5
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->getUInt16()I

    move-result p0

    shl-int/lit8 p0, p0, 0x10

    and-int/2addr p0, v0

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->getUInt16()I

    move-result v0

    and-int/2addr v0, v2

    or-int/2addr p0, v0

    and-int/lit16 v0, p0, -0x100

    const v1, 0x56503800

    if-eq v0, v1, :cond_6

    .line 15
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p0

    :cond_6
    and-int/lit16 p0, p0, 0xff

    const/16 v0, 0x58

    if-ne p0, v0, :cond_8

    .line 16
    invoke-interface {p1, v3, v4}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->skip(J)J

    .line 17
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->getByte()I

    move-result p0

    and-int/lit8 p0, p0, 0x10

    if-eqz p0, :cond_7

    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->WEBP_A:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    goto :goto_1

    :cond_7
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->WEBP:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    :goto_1
    return-object p0

    :cond_8
    const/16 v0, 0x4c

    if-ne p0, v0, :cond_a

    .line 18
    invoke-interface {p1, v3, v4}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->skip(J)J

    .line 19
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->getByte()I

    move-result p0

    and-int/lit8 p0, p0, 0x8

    if-eqz p0, :cond_9

    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->WEBP_A:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    goto :goto_2

    :cond_9
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->WEBP:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    :goto_2
    return-object p0

    .line 20
    :cond_a
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->WEBP:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p0
.end method

.method public getType(Ljava/io/InputStream;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "is"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;->getType(Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object p0

    return-object p0
.end method

.method public getType(Ljava/nio/ByteBuffer;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "byteBuffer"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$ByteBufferReader;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$ByteBufferReader;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;->getType(Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object p0

    return-object p0
.end method

.method public final parseExifSegment(Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;[BI)I
    .locals 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "reader",
            "tempArray",
            "exifSegmentLength"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader;->read([BI)I

    move-result p0

    const/4 p1, -0x1

    const/4 v0, 0x3

    const-string v1, "DfltImageHeaderParser"

    if-eq p0, p3, :cond_1

    .line 2
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p2

    if-eqz p2, :cond_0

    const/16 p2, 0x51

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p2, "Unable to read exif segment data, length: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", actually read: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return p1

    :cond_1
    const/4 p0, 0x0

    const/4 v2, 0x1

    if-eqz p2, :cond_2

    .line 4
    sget-object v3, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;->JPEG_EXIF_SEGMENT_PREAMBLE_BYTES:[B

    array-length v3, v3

    if-le p3, v3, :cond_2

    move v3, v2

    goto :goto_0

    :cond_2
    move v3, p0

    :goto_0
    if-eqz v3, :cond_4

    move v4, p0

    .line 5
    :goto_1
    sget-object v5, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;->JPEG_EXIF_SEGMENT_PREAMBLE_BYTES:[B

    array-length v6, v5

    if-ge v4, v6, :cond_4

    .line 6
    aget-byte v6, p2, v4

    aget-byte v5, v5, v4

    if-eq v6, v5, :cond_3

    move v3, p0

    goto :goto_2

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    if-eqz v3, :cond_14

    .line 7
    new-instance v3, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;

    invoke-direct {v3, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;-><init>([BI)V

    const/4 p2, 0x6

    .line 8
    invoke-virtual {v3, p2}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;->getInt16(I)S

    move-result p3

    const/16 v4, 0x4949

    if-eq p3, v4, :cond_7

    const/16 v4, 0x4d4d

    if-eq p3, v4, :cond_6

    .line 9
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_5

    const/16 v4, 0x1b

    .line 10
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Unknown endianness = "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v1, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    :cond_5
    sget-object p3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    goto :goto_3

    .line 12
    :cond_6
    sget-object p3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    goto :goto_3

    .line 13
    :cond_7
    sget-object p3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 14
    :goto_3
    iget-object v4, v3, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v4, p3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    const/16 p3, 0xa

    .line 15
    invoke-virtual {v3, p3}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;->getInt32(I)I

    move-result p3

    add-int/2addr p3, p2

    .line 16
    invoke-virtual {v3, p3}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;->getInt16(I)S

    move-result p2

    :goto_4
    if-ge p0, p2, :cond_13

    add-int/lit8 v4, p3, 0x2

    mul-int/lit8 v5, p0, 0xc

    add-int/2addr v5, v4

    .line 17
    invoke-virtual {v3, v5}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;->getInt16(I)S

    move-result v4

    const/16 v6, 0x112

    if-eq v4, v6, :cond_8

    goto/16 :goto_8

    :cond_8
    add-int/lit8 v6, v5, 0x2

    .line 18
    invoke-virtual {v3, v6}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;->getInt16(I)S

    move-result v6

    if-lt v6, v2, :cond_11

    const/16 v7, 0xc

    if-le v6, v7, :cond_9

    goto/16 :goto_7

    :cond_9
    add-int/lit8 v7, v5, 0x4

    .line 19
    invoke-virtual {v3, v7}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;->getInt32(I)I

    move-result v7

    if-gez v7, :cond_a

    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_12

    const-string v4, "Negative tiff component count"

    .line 21
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 22
    :cond_a
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    const-string v9, " tagType="

    if-eqz v8, :cond_b

    const/16 v8, 0x5e

    const-string v10, "Got tagIndex="

    .line 23
    invoke-static {v8, v10, p0, v9, v4}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " formatCode="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " componentCount="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    :cond_b
    sget-object v8, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;->BYTES_PER_FORMAT:[I

    aget v8, v8, v6

    add-int/2addr v7, v8

    const/4 v8, 0x4

    if-le v7, v8, :cond_c

    .line 25
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_12

    const/16 v4, 0x47

    .line 26
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Got byte count > 4, not orientation, continuing, formatCode="

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    :cond_c
    add-int/lit8 v5, v5, 0x8

    if-ltz v5, :cond_10

    .line 27
    iget-object v6, v3, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    if-le v5, v6, :cond_d

    goto :goto_6

    :cond_d
    if-ltz v7, :cond_f

    add-int/2addr v7, v5

    .line 28
    iget-object v6, v3, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    if-le v7, v6, :cond_e

    goto :goto_5

    .line 29
    :cond_e
    invoke-virtual {v3, v5}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader;->getInt16(I)S

    move-result p1

    goto :goto_9

    .line 30
    :cond_f
    :goto_5
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_12

    const/16 v5, 0x3b

    .line 31
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v5, "Illegal number of bytes for TI tag data tagType="

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8

    .line 32
    :cond_10
    :goto_6
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_12

    const/16 v6, 0x36

    .line 33
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v6, "Illegal tagValueOffset="

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8

    .line 34
    :cond_11
    :goto_7
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_12

    const/16 v4, 0x25

    .line 35
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Got invalid format code = "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_12
    :goto_8
    add-int/lit8 p0, p0, 0x1

    goto/16 :goto_4

    :cond_13
    :goto_9
    return p1

    .line 36
    :cond_14
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_15

    const-string p0, "Missing jpeg exif preamble"

    .line 37
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_15
    return p1
.end method
