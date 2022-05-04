.class public Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/ResourceDecoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;,
        Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/ResourceDecoder<",
        "Ljava/nio/ByteBuffer;",
        "Lcom/bumptech/glide/load/resource/gif/GifDrawable;",
        ">;"
    }
.end annotation


# static fields
.field public static final GIF_DECODER_FACTORY:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;

.field public static final PARSER_POOL:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;


# instance fields
.field public final context:Landroid/content/Context;

.field public final gifDecoderFactory:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;

.field public final parserPool:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;

.field public final parsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/ImageHeaderParser;",
            ">;"
        }
    .end annotation
.end field

.field public final provider:Lcom/bumptech/glide/load/resource/gif/GifBitmapProvider;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->GIF_DECODER_FACTORY:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;

    .line 2
    new-instance v0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->PARSER_POOL:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;)V
    .locals 0
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
            "context",
            "parsers",
            "bitmapPool",
            "arrayPool",
            "parserPool",
            "gifDecoderFactory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/ImageHeaderParser;",
            ">;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;",
            "Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;",
            "Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->context:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->parsers:Ljava/util/List;

    .line 4
    iput-object p6, p0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->gifDecoderFactory:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;

    .line 5
    new-instance p1, Lcom/bumptech/glide/load/resource/gif/GifBitmapProvider;

    invoke-direct {p1, p3, p4}, Lcom/bumptech/glide/load/resource/gif/GifBitmapProvider;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->provider:Lcom/bumptech/glide/load/resource/gif/GifBitmapProvider;

    .line 6
    iput-object p5, p0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->parserPool:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;

    return-void
.end method

.method public static getSampleSize(Lcom/bumptech/glide/gifdecoder/GifHeader;II)I
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "gifHeader",
            "targetWidth",
            "targetHeight"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/bumptech/glide/gifdecoder/GifHeader;->height:I

    .line 2
    div-int/2addr v0, p2

    .line 3
    iget v1, p0, Lcom/bumptech/glide/gifdecoder/GifHeader;->width:I

    .line 4
    div-int/2addr v1, p1

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 6
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v0

    :goto_0
    const/4 v1, 0x1

    .line 7
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v2, 0x2

    const-string v3, "BufferGifDecoder"

    .line 8
    invoke-static {v3, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_1

    if-le v0, v1, :cond_1

    .line 9
    iget v1, p0, Lcom/bumptech/glide/gifdecoder/GifHeader;->width:I

    .line 10
    iget p0, p0, Lcom/bumptech/glide/gifdecoder/GifHeader;->height:I

    const/16 v2, 0x7d

    const-string v4, "Downsampling GIF, sampleSize: "

    const-string v5, ", target dimens: ["

    .line 11
    invoke-static {v2, v4, v0, v5, p1}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, "x"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "], actual dimens: ["

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 12
    invoke-static {v3, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return v0
.end method


# virtual methods
.method public decode(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "source",
            "width",
            "height",
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object v1, p1

    check-cast v1, Ljava/nio/ByteBuffer;

    .line 2
    iget-object p1, p0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->parserPool:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;

    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    iget-object v0, p1, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;->pool:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/gifdecoder/GifHeaderParser;

    if-nez v0, :cond_0

    .line 5
    new-instance v0, Lcom/bumptech/glide/gifdecoder/GifHeaderParser;

    invoke-direct {v0}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser;-><init>()V

    :cond_0
    move-object v6, v0

    const/4 v0, 0x0

    .line 6
    iput-object v0, v6, Lcom/bumptech/glide/gifdecoder/GifHeaderParser;->rawData:Ljava/nio/ByteBuffer;

    .line 7
    iget-object v0, v6, Lcom/bumptech/glide/gifdecoder/GifHeaderParser;->block:[B

    const/4 v2, 0x0

    invoke-static {v0, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 8
    new-instance v0, Lcom/bumptech/glide/gifdecoder/GifHeader;

    invoke-direct {v0}, Lcom/bumptech/glide/gifdecoder/GifHeader;-><init>()V

    iput-object v0, v6, Lcom/bumptech/glide/gifdecoder/GifHeaderParser;->header:Lcom/bumptech/glide/gifdecoder/GifHeader;

    .line 9
    iput v2, v6, Lcom/bumptech/glide/gifdecoder/GifHeaderParser;->blockSize:I

    .line 10
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, v6, Lcom/bumptech/glide/gifdecoder/GifHeaderParser;->rawData:Ljava/nio/ByteBuffer;

    .line 11
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 12
    iget-object v0, v6, Lcom/bumptech/glide/gifdecoder/GifHeaderParser;->rawData:Ljava/nio/ByteBuffer;

    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    monitor-exit p1

    move-object v0, p0

    move v2, p2

    move v3, p3

    move-object v4, v6

    move-object v5, p4

    .line 14
    :try_start_1
    invoke-virtual/range {v0 .. v5}, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->decode(Ljava/nio/ByteBuffer;IILcom/bumptech/glide/gifdecoder/GifHeaderParser;Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/resource/gif/GifDrawableResource;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->parserPool:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;

    invoke-virtual {p0, v6}, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;->release(Lcom/bumptech/glide/gifdecoder/GifHeaderParser;)V

    return-object p1

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->parserPool:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;

    invoke-virtual {p0, v6}, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;->release(Lcom/bumptech/glide/gifdecoder/GifHeaderParser;)V

    throw p1

    :catchall_1
    move-exception p0

    .line 16
    monitor-exit p1

    throw p0
.end method

.method public final decode(Ljava/nio/ByteBuffer;IILcom/bumptech/glide/gifdecoder/GifHeaderParser;Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/resource/gif/GifDrawableResource;
    .locals 17
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "byteBuffer",
            "width",
            "height",
            "parser",
            "options"
        }
    .end annotation

    move-object/from16 v0, p0

    const-string v1, "Decoded GIF from stream in "

    const-string v2, "BufferGifDecoder"

    .line 17
    sget v3, Lcom/bumptech/glide/util/LogTime;->$r8$clinit:I

    .line 18
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v3

    const/16 v5, 0x33

    const/4 v6, 0x2

    .line 19
    :try_start_0
    invoke-virtual/range {p4 .. p4}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser;->parseHeader()Lcom/bumptech/glide/gifdecoder/GifHeader;

    move-result-object v7

    .line 20
    iget v8, v7, Lcom/bumptech/glide/gifdecoder/GifHeader;->frameCount:I

    const/4 v9, 0x0

    if-lez v8, :cond_5

    .line 21
    iget v8, v7, Lcom/bumptech/glide/gifdecoder/GifHeader;->status:I

    if-eqz v8, :cond_0

    goto/16 :goto_1

    .line 22
    :cond_0
    sget-object v8, Lcom/bumptech/glide/load/resource/gif/GifOptions;->DECODE_FORMAT:Lcom/bumptech/glide/load/Option;

    move-object/from16 v10, p5

    invoke-virtual {v10, v8}, Lcom/bumptech/glide/load/Options;->get(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;

    move-result-object v8

    sget-object v10, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_RGB_565:Lcom/bumptech/glide/load/DecodeFormat;

    if-ne v8, v10, :cond_1

    .line 23
    sget-object v8, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    goto :goto_0

    :cond_1
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    :goto_0
    move/from16 v13, p2

    move/from16 v14, p3

    .line 24
    invoke-static {v7, v13, v14}, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->getSampleSize(Lcom/bumptech/glide/gifdecoder/GifHeader;II)I

    move-result v10

    .line 25
    iget-object v11, v0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->gifDecoderFactory:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;

    iget-object v12, v0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->provider:Lcom/bumptech/glide/load/resource/gif/GifBitmapProvider;

    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    new-instance v15, Lcom/bumptech/glide/gifdecoder/StandardGifDecoder;

    move-object/from16 v11, p1

    invoke-direct {v15, v12, v7, v11, v10}, Lcom/bumptech/glide/gifdecoder/StandardGifDecoder;-><init>(Lcom/bumptech/glide/gifdecoder/GifDecoder$BitmapProvider;Lcom/bumptech/glide/gifdecoder/GifHeader;Ljava/nio/ByteBuffer;I)V

    .line 27
    invoke-virtual {v15, v8}, Lcom/bumptech/glide/gifdecoder/StandardGifDecoder;->setDefaultBitmapConfig(Landroid/graphics/Bitmap$Config;)V

    .line 28
    iget v7, v15, Lcom/bumptech/glide/gifdecoder/StandardGifDecoder;->framePointer:I

    add-int/lit8 v7, v7, 0x1

    iget-object v8, v15, Lcom/bumptech/glide/gifdecoder/StandardGifDecoder;->header:Lcom/bumptech/glide/gifdecoder/GifHeader;

    iget v8, v8, Lcom/bumptech/glide/gifdecoder/GifHeader;->frameCount:I

    rem-int/2addr v7, v8

    iput v7, v15, Lcom/bumptech/glide/gifdecoder/StandardGifDecoder;->framePointer:I

    .line 29
    invoke-virtual {v15}, Lcom/bumptech/glide/gifdecoder/StandardGifDecoder;->getNextFrame()Landroid/graphics/Bitmap;

    move-result-object v16
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v16, :cond_3

    .line 30
    invoke-static {v2, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 31
    invoke-static {v3, v4}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-object v9

    .line 32
    :cond_3
    :try_start_1
    sget-object v7, Lcom/bumptech/glide/load/resource/UnitTransformation;->TRANSFORMATION:Lcom/bumptech/glide/load/Transformation;

    check-cast v7, Lcom/bumptech/glide/load/resource/UnitTransformation;

    .line 33
    new-instance v8, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    iget-object v0, v0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->context:Landroid/content/Context;

    .line 34
    new-instance v9, Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;

    new-instance v12, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    .line 35
    invoke-static {v0}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object v11

    move-object v10, v12

    move-object v0, v12

    move-object v12, v15

    move/from16 v13, p2

    move/from16 v14, p3

    move-object v15, v7

    invoke-direct/range {v10 .. v16}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;-><init>(Lcom/bumptech/glide/Glide;Lcom/bumptech/glide/gifdecoder/GifDecoder;IILcom/bumptech/glide/load/Transformation;Landroid/graphics/Bitmap;)V

    invoke-direct {v9, v0}, Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;-><init>(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;)V

    .line 36
    invoke-direct {v8, v9}, Lcom/bumptech/glide/load/resource/gif/GifDrawable;-><init>(Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;)V

    .line 37
    new-instance v0, Lcom/bumptech/glide/load/resource/gif/GifDrawableResource;

    invoke-direct {v0, v8}, Lcom/bumptech/glide/load/resource/gif/GifDrawableResource;-><init>(Lcom/bumptech/glide/load/resource/gif/GifDrawable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    invoke-static {v2, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 39
    invoke-static {v3, v4}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    return-object v0

    .line 40
    :cond_5
    :goto_1
    invoke-static {v2, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 41
    invoke-static {v3, v4}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    return-object v9

    :catchall_0
    move-exception v0

    .line 42
    invoke-static {v2, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 43
    invoke-static {v3, v4}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    throw v0
.end method

.method public handles(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "source",
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    check-cast p1, Ljava/nio/ByteBuffer;

    .line 2
    sget-object v0, Lcom/bumptech/glide/load/resource/gif/GifOptions;->DISABLE_ANIMATION:Lcom/bumptech/glide/load/Option;

    invoke-virtual {p2, v0}, Lcom/bumptech/glide/load/Options;->get(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_3

    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->parsers:Ljava/util/List;

    if-nez p1, :cond_0

    .line 3
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    goto :goto_1

    .line 4
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p2

    move v1, v0

    :goto_0
    if-ge v1, p2, :cond_2

    .line 5
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/load/ImageHeaderParser;

    .line 6
    invoke-interface {v2, p1}, Lcom/bumptech/glide/load/ImageHeaderParser;->getType(Ljava/nio/ByteBuffer;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object v2

    .line 7
    sget-object v3, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    if-eq v2, v3, :cond_1

    move-object p0, v2

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 8
    :cond_2
    sget-object p0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->UNKNOWN:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    .line 9
    :goto_1
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->GIF:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    if-ne p0, p1, :cond_3

    const/4 v0, 0x1

    :cond_3
    return v0
.end method
