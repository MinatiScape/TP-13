.class public Lcom/bumptech/glide/Glide;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ComponentCallbacks2;


# static fields
.field public static volatile glide:Lcom/bumptech/glide/Glide;

.field public static volatile isInitializing:Z


# instance fields
.field public final arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

.field public final bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

.field public final connectivityMonitorFactory:Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;

.field public final engine:Lcom/bumptech/glide/load/engine/Engine;

.field public final glideContext:Lcom/bumptech/glide/GlideContext;

.field public final managers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/RequestManager;",
            ">;"
        }
    .end annotation
.end field

.field public final memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

.field public memoryCategory:Lcom/bumptech/glide/MemoryCategory;

.field public final registry:Lcom/bumptech/glide/Registry;

.field public final requestManagerRetriever:Lcom/bumptech/glide/manager/RequestManagerRetriever;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;Lcom/bumptech/glide/manager/RequestManagerRetriever;Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;ILcom/bumptech/glide/request/RequestOptions;Ljava/util/Map;Ljava/util/List;)V
    .locals 25
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "engine",
            "memoryCache",
            "bitmapPool",
            "arrayPool",
            "requestManagerRetriever",
            "connectivityMonitorFactory",
            "logLevel",
            "defaultRequestOptions",
            "defaultTransitionOptions",
            "defaultRequestListeners"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/load/engine/Engine;",
            "Lcom/bumptech/glide/load/engine/cache/MemoryCache;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;",
            "Lcom/bumptech/glide/manager/RequestManagerRetriever;",
            "Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;",
            "I",
            "Lcom/bumptech/glide/request/RequestOptions;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/TransitionOptions<",
            "**>;>;",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/RequestListener<",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p4

    move-object/from16 v10, p5

    .line 1
    const-class v11, Lcom/bumptech/glide/gifdecoder/GifDecoder;

    const-class v12, Ljava/lang/String;

    const-class v13, Ljava/lang/Integer;

    const-class v14, [B

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/bumptech/glide/Glide;->managers:Ljava/util/List;

    .line 3
    sget-object v1, Lcom/bumptech/glide/MemoryCategory;->NORMAL:Lcom/bumptech/glide/MemoryCategory;

    iput-object v1, v0, Lcom/bumptech/glide/Glide;->memoryCategory:Lcom/bumptech/glide/MemoryCategory;

    move-object/from16 v15, p2

    .line 4
    iput-object v15, v0, Lcom/bumptech/glide/Glide;->engine:Lcom/bumptech/glide/load/engine/Engine;

    .line 5
    iput-object v9, v0, Lcom/bumptech/glide/Glide;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    .line 6
    iput-object v10, v0, Lcom/bumptech/glide/Glide;->arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    move-object/from16 v1, p3

    .line 7
    iput-object v1, v0, Lcom/bumptech/glide/Glide;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    move-object/from16 v1, p6

    .line 8
    iput-object v1, v0, Lcom/bumptech/glide/Glide;->requestManagerRetriever:Lcom/bumptech/glide/manager/RequestManagerRetriever;

    move-object/from16 v1, p7

    .line 9
    iput-object v1, v0, Lcom/bumptech/glide/Glide;->connectivityMonitorFactory:Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;

    move-object/from16 v7, p9

    .line 10
    iget-object v1, v7, Lcom/bumptech/glide/request/BaseRequestOptions;->options:Lcom/bumptech/glide/load/Options;

    .line 11
    sget-object v2, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->DECODE_FORMAT:Lcom/bumptech/glide/load/Option;

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/load/Options;->get(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/load/DecodeFormat;

    .line 12
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 13
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 14
    new-instance v5, Lcom/bumptech/glide/Registry;

    invoke-direct {v5}, Lcom/bumptech/glide/Registry;-><init>()V

    iput-object v5, v0, Lcom/bumptech/glide/Glide;->registry:Lcom/bumptech/glide/Registry;

    .line 15
    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/ExifInterfaceImageHeaderParser;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/ExifInterfaceImageHeaderParser;-><init>()V

    .line 16
    iget-object v2, v5, Lcom/bumptech/glide/Registry;->imageHeaderParserRegistry:Lcom/bumptech/glide/provider/ImageHeaderParserRegistry;

    .line 17
    monitor-enter v2

    .line 18
    :try_start_0
    iget-object v3, v2, Lcom/bumptech/glide/provider/ImageHeaderParserRegistry;->parsers:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 19
    monitor-exit v2

    .line 20
    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;-><init>()V

    .line 21
    iget-object v2, v5, Lcom/bumptech/glide/Registry;->imageHeaderParserRegistry:Lcom/bumptech/glide/provider/ImageHeaderParserRegistry;

    .line 22
    monitor-enter v2

    .line 23
    :try_start_1
    iget-object v3, v2, Lcom/bumptech/glide/provider/ImageHeaderParserRegistry;->parsers:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    monitor-exit v2

    .line 25
    invoke-virtual {v5}, Lcom/bumptech/glide/Registry;->getImageHeaderParsers()Ljava/util/List;

    move-result-object v4

    .line 26
    new-instance v3, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;

    .line 27
    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-direct {v3, v4, v1, v9, v10}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;-><init>(Ljava/util/List;Landroid/util/DisplayMetrics;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    .line 28
    new-instance v2, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;

    .line 29
    sget-object v16, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->PARSER_POOL:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;

    sget-object v17, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;->GIF_DECODER_FACTORY:Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;

    move-object v1, v2

    move-object v15, v2

    move-object/from16 v2, p1

    move-object v0, v3

    move-object v3, v4

    move-object/from16 v18, v14

    move-object v14, v4

    move-object/from16 v4, p4

    move-object/from16 v19, v12

    move-object v12, v5

    move-object/from16 v5, p5

    move-object/from16 v20, v13

    move-object v13, v6

    move-object/from16 v6, v16

    move-object/from16 v7, v17

    invoke-direct/range {v1 .. v7}, Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder;-><init>(Landroid/content/Context;Ljava/util/List;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool;Lcom/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory;)V

    .line 30
    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;

    new-instance v2, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder$ParcelFileDescriptorInitializer;

    invoke-direct {v2}, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder$ParcelFileDescriptorInitializer;-><init>()V

    .line 31
    sget-object v3, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;->DEFAULT_FACTORY:Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder$MediaMetadataRetrieverFactory;

    invoke-direct {v1, v9, v2, v3}, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder$MediaMetadataRetrieverInitializer;Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder$MediaMetadataRetrieverFactory;)V

    .line 32
    new-instance v2, Lcom/bumptech/glide/load/resource/bitmap/ByteBufferBitmapDecoder;

    invoke-direct {v2, v0}, Lcom/bumptech/glide/load/resource/bitmap/ByteBufferBitmapDecoder;-><init>(Lcom/bumptech/glide/load/resource/bitmap/Downsampler;)V

    .line 33
    new-instance v4, Lcom/bumptech/glide/load/resource/bitmap/StreamBitmapDecoder;

    invoke-direct {v4, v0, v10}, Lcom/bumptech/glide/load/resource/bitmap/StreamBitmapDecoder;-><init>(Lcom/bumptech/glide/load/resource/bitmap/Downsampler;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    .line 34
    new-instance v0, Lcom/bumptech/glide/load/resource/drawable/ResourceDrawableDecoder;

    invoke-direct {v0, v8}, Lcom/bumptech/glide/load/resource/drawable/ResourceDrawableDecoder;-><init>(Landroid/content/Context;)V

    .line 35
    new-instance v5, Lcom/bumptech/glide/load/model/ResourceLoader$StreamFactory;

    invoke-direct {v5, v13}, Lcom/bumptech/glide/load/model/ResourceLoader$StreamFactory;-><init>(Landroid/content/res/Resources;)V

    .line 36
    new-instance v6, Lcom/bumptech/glide/load/model/ResourceLoader$UriFactory;

    invoke-direct {v6, v13}, Lcom/bumptech/glide/load/model/ResourceLoader$UriFactory;-><init>(Landroid/content/res/Resources;)V

    .line 37
    new-instance v7, Lcom/bumptech/glide/load/model/ResourceLoader$FileDescriptorFactory;

    invoke-direct {v7, v13}, Lcom/bumptech/glide/load/model/ResourceLoader$FileDescriptorFactory;-><init>(Landroid/content/res/Resources;)V

    .line 38
    new-instance v8, Lcom/bumptech/glide/load/model/ResourceLoader$AssetFileDescriptorFactory;

    invoke-direct {v8, v13}, Lcom/bumptech/glide/load/model/ResourceLoader$AssetFileDescriptorFactory;-><init>(Landroid/content/res/Resources;)V

    move-object/from16 p3, v8

    .line 39
    new-instance v8, Lcom/bumptech/glide/load/resource/bitmap/BitmapEncoder;

    invoke-direct {v8, v10}, Lcom/bumptech/glide/load/resource/bitmap/BitmapEncoder;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    move-object/from16 p6, v6

    .line 40
    new-instance v6, Lcom/bumptech/glide/load/resource/transcode/BitmapBytesTranscoder;

    invoke-direct {v6}, Lcom/bumptech/glide/load/resource/transcode/BitmapBytesTranscoder;-><init>()V

    move-object/from16 p7, v6

    .line 41
    new-instance v6, Lcom/bumptech/glide/load/resource/transcode/GifDrawableBytesTranscoder;

    invoke-direct {v6}, Lcom/bumptech/glide/load/resource/transcode/GifDrawableBytesTranscoder;-><init>()V

    move-object/from16 v16, v6

    .line 42
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    move-object/from16 v17, v6

    .line 43
    const-class v6, Ljava/nio/ByteBuffer;

    move-object/from16 v21, v7

    new-instance v7, Lcom/bumptech/glide/load/model/ByteBufferEncoder;

    invoke-direct {v7}, Lcom/bumptech/glide/load/model/ByteBufferEncoder;-><init>()V

    .line 44
    invoke-virtual {v12, v6, v7}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Lcom/bumptech/glide/load/Encoder;)Lcom/bumptech/glide/Registry;

    const-class v6, Ljava/io/InputStream;

    new-instance v7, Lcom/bumptech/glide/load/model/StreamEncoder;

    invoke-direct {v7, v10}, Lcom/bumptech/glide/load/model/StreamEncoder;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    .line 45
    invoke-virtual {v12, v6, v7}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Lcom/bumptech/glide/load/Encoder;)Lcom/bumptech/glide/Registry;

    const-string v6, "Bitmap"

    const-class v7, Ljava/nio/ByteBuffer;

    move-object/from16 v22, v5

    const-class v5, Landroid/graphics/Bitmap;

    .line 46
    invoke-virtual {v12, v6, v7, v5, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-string v5, "Bitmap"

    const-class v6, Ljava/io/InputStream;

    const-class v7, Landroid/graphics/Bitmap;

    .line 47
    invoke-virtual {v12, v5, v6, v7, v4}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-string v5, "Bitmap"

    const-class v6, Landroid/os/ParcelFileDescriptor;

    const-class v7, Landroid/graphics/Bitmap;

    .line 48
    invoke-virtual {v12, v5, v6, v7, v1}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-string v5, "Bitmap"

    const-class v6, Landroid/content/res/AssetFileDescriptor;

    const-class v7, Landroid/graphics/Bitmap;

    move-object/from16 v23, v0

    .line 49
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;

    move-object/from16 v24, v11

    new-instance v11, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder$AssetFileDescriptorInitializer;

    const/4 v10, 0x0

    invoke-direct {v11, v10}, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder$AssetFileDescriptorInitializer;-><init>(Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder$1;)V

    .line 50
    invoke-direct {v0, v9, v11, v3}, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder$MediaMetadataRetrieverInitializer;Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder$MediaMetadataRetrieverFactory;)V

    .line 51
    invoke-virtual {v12, v5, v6, v7, v0}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/graphics/Bitmap;

    const-class v3, Landroid/graphics/Bitmap;

    .line 52
    sget-object v5, Lcom/bumptech/glide/load/model/UnitModelLoader$Factory;->FACTORY:Lcom/bumptech/glide/load/model/UnitModelLoader$Factory;

    invoke-virtual {v12, v0, v3, v5}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-string v0, "Bitmap"

    const-class v3, Landroid/graphics/Bitmap;

    const-class v6, Landroid/graphics/Bitmap;

    new-instance v7, Lcom/bumptech/glide/load/resource/bitmap/UnitBitmapDecoder;

    invoke-direct {v7}, Lcom/bumptech/glide/load/resource/bitmap/UnitBitmapDecoder;-><init>()V

    .line 53
    invoke-virtual {v12, v0, v3, v6, v7}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/graphics/Bitmap;

    .line 54
    invoke-virtual {v12, v0, v8}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceEncoder;)Lcom/bumptech/glide/Registry;

    const-string v0, "BitmapDrawable"

    const-class v3, Ljava/nio/ByteBuffer;

    const-class v6, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v7, Lcom/bumptech/glide/load/resource/bitmap/BitmapDrawableDecoder;

    invoke-direct {v7, v13, v2}, Lcom/bumptech/glide/load/resource/bitmap/BitmapDrawableDecoder;-><init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/ResourceDecoder;)V

    .line 55
    invoke-virtual {v12, v0, v3, v6, v7}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-string v0, "BitmapDrawable"

    const-class v2, Ljava/io/InputStream;

    const-class v3, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v6, Lcom/bumptech/glide/load/resource/bitmap/BitmapDrawableDecoder;

    invoke-direct {v6, v13, v4}, Lcom/bumptech/glide/load/resource/bitmap/BitmapDrawableDecoder;-><init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/ResourceDecoder;)V

    .line 56
    invoke-virtual {v12, v0, v2, v3, v6}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-string v0, "BitmapDrawable"

    const-class v2, Landroid/os/ParcelFileDescriptor;

    const-class v3, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v4, Lcom/bumptech/glide/load/resource/bitmap/BitmapDrawableDecoder;

    invoke-direct {v4, v13, v1}, Lcom/bumptech/glide/load/resource/bitmap/BitmapDrawableDecoder;-><init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/ResourceDecoder;)V

    .line 57
    invoke-virtual {v12, v0, v2, v3, v4}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/BitmapDrawableEncoder;

    invoke-direct {v1, v9, v8}, Lcom/bumptech/glide/load/resource/bitmap/BitmapDrawableEncoder;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/ResourceEncoder;)V

    .line 58
    invoke-virtual {v12, v0, v1}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceEncoder;)Lcom/bumptech/glide/Registry;

    const-string v0, "Gif"

    const-class v1, Ljava/io/InputStream;

    const-class v2, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    new-instance v3, Lcom/bumptech/glide/load/resource/gif/StreamGifDecoder;

    move-object/from16 v4, p5

    invoke-direct {v3, v14, v15, v4}, Lcom/bumptech/glide/load/resource/gif/StreamGifDecoder;-><init>(Ljava/util/List;Lcom/bumptech/glide/load/ResourceDecoder;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    .line 59
    invoke-virtual {v12, v0, v1, v2, v3}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-string v0, "Gif"

    const-class v1, Ljava/nio/ByteBuffer;

    const-class v2, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    .line 60
    invoke-virtual {v12, v0, v1, v2, v15}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-class v0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    new-instance v1, Lcom/bumptech/glide/load/resource/gif/GifDrawableEncoder;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/gif/GifDrawableEncoder;-><init>()V

    .line 61
    invoke-virtual {v12, v0, v1}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceEncoder;)Lcom/bumptech/glide/Registry;

    move-object/from16 v0, v24

    .line 62
    invoke-virtual {v12, v0, v0, v5}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-string v1, "Bitmap"

    const-class v2, Landroid/graphics/Bitmap;

    new-instance v3, Lcom/bumptech/glide/load/resource/gif/GifFrameResourceDecoder;

    invoke-direct {v3, v9}, Lcom/bumptech/glide/load/resource/gif/GifFrameResourceDecoder;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    .line 63
    invoke-virtual {v12, v1, v0, v2, v3}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Landroid/graphics/drawable/Drawable;

    const-string v2, "legacy_append"

    move-object/from16 v3, v23

    .line 64
    invoke-virtual {v12, v2, v0, v1, v3}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    .line 65
    const-class v0, Landroid/net/Uri;

    const-class v1, Landroid/graphics/Bitmap;

    new-instance v2, Lcom/bumptech/glide/load/resource/bitmap/ResourceBitmapDecoder;

    invoke-direct {v2, v3, v9}, Lcom/bumptech/glide/load/resource/bitmap/ResourceBitmapDecoder;-><init>(Lcom/bumptech/glide/load/resource/drawable/ResourceDrawableDecoder;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    const-string v3, "legacy_append"

    .line 66
    invoke-virtual {v12, v3, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    .line 67
    new-instance v0, Lcom/bumptech/glide/load/resource/bytes/ByteBufferRewinder$Factory;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/bytes/ByteBufferRewinder$Factory;-><init>()V

    .line 68
    invoke-virtual {v12, v0}, Lcom/bumptech/glide/Registry;->register(Lcom/bumptech/glide/load/data/DataRewinder$Factory;)Lcom/bumptech/glide/Registry;

    const-class v0, Ljava/io/File;

    const-class v1, Ljava/nio/ByteBuffer;

    new-instance v2, Lcom/bumptech/glide/load/model/ByteBufferFileLoader$Factory;

    invoke-direct {v2}, Lcom/bumptech/glide/load/model/ByteBufferFileLoader$Factory;-><init>()V

    .line 69
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Ljava/io/File;

    const-class v1, Ljava/io/InputStream;

    new-instance v2, Lcom/bumptech/glide/load/model/FileLoader$StreamFactory;

    invoke-direct {v2}, Lcom/bumptech/glide/load/model/FileLoader$StreamFactory;-><init>()V

    .line 70
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Ljava/io/File;

    const-class v1, Ljava/io/File;

    new-instance v2, Lcom/bumptech/glide/load/resource/file/FileDecoder;

    invoke-direct {v2}, Lcom/bumptech/glide/load/resource/file/FileDecoder;-><init>()V

    const-string v3, "legacy_append"

    .line 71
    invoke-virtual {v12, v3, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    .line 72
    const-class v0, Ljava/io/File;

    const-class v1, Landroid/os/ParcelFileDescriptor;

    new-instance v2, Lcom/bumptech/glide/load/model/FileLoader$FileDescriptorFactory;

    invoke-direct {v2}, Lcom/bumptech/glide/load/model/FileLoader$FileDescriptorFactory;-><init>()V

    .line 73
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Ljava/io/File;

    const-class v1, Ljava/io/File;

    .line 74
    invoke-virtual {v12, v0, v1, v5}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    new-instance v0, Lcom/bumptech/glide/load/data/InputStreamRewinder$Factory;

    invoke-direct {v0, v4}, Lcom/bumptech/glide/load/data/InputStreamRewinder$Factory;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    .line 75
    invoke-virtual {v12, v0}, Lcom/bumptech/glide/Registry;->register(Lcom/bumptech/glide/load/data/DataRewinder$Factory;)Lcom/bumptech/glide/Registry;

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v1, Ljava/io/InputStream;

    move-object/from16 v2, v22

    .line 76
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v1, Landroid/os/ParcelFileDescriptor;

    move-object/from16 v3, v21

    .line 77
    invoke-virtual {v12, v0, v1, v3}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v1, Ljava/io/InputStream;

    move-object/from16 v6, v20

    .line 78
    invoke-virtual {v12, v6, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v1, Landroid/os/ParcelFileDescriptor;

    .line 79
    invoke-virtual {v12, v6, v1, v3}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v1, Landroid/net/Uri;

    move-object/from16 v2, p6

    .line 80
    invoke-virtual {v12, v6, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v1, Landroid/content/res/AssetFileDescriptor;

    move-object/from16 v3, p3

    .line 81
    invoke-virtual {v12, v0, v1, v3}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v1, Landroid/content/res/AssetFileDescriptor;

    .line 82
    invoke-virtual {v12, v6, v1, v3}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v1, Landroid/net/Uri;

    .line 83
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Ljava/io/InputStream;

    new-instance v1, Lcom/bumptech/glide/load/model/DataUrlLoader$StreamFactory;

    invoke-direct {v1}, Lcom/bumptech/glide/load/model/DataUrlLoader$StreamFactory;-><init>()V

    move-object/from16 v2, v19

    .line 84
    invoke-virtual {v12, v2, v0, v1}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Ljava/io/InputStream;

    new-instance v3, Lcom/bumptech/glide/load/model/DataUrlLoader$StreamFactory;

    invoke-direct {v3}, Lcom/bumptech/glide/load/model/DataUrlLoader$StreamFactory;-><init>()V

    .line 85
    invoke-virtual {v12, v0, v1, v3}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Ljava/io/InputStream;

    new-instance v1, Lcom/bumptech/glide/load/model/StringLoader$StreamFactory;

    invoke-direct {v1}, Lcom/bumptech/glide/load/model/StringLoader$StreamFactory;-><init>()V

    .line 86
    invoke-virtual {v12, v2, v0, v1}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/os/ParcelFileDescriptor;

    new-instance v1, Lcom/bumptech/glide/load/model/StringLoader$FileDescriptorFactory;

    invoke-direct {v1}, Lcom/bumptech/glide/load/model/StringLoader$FileDescriptorFactory;-><init>()V

    .line 87
    invoke-virtual {v12, v2, v0, v1}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/content/res/AssetFileDescriptor;

    new-instance v1, Lcom/bumptech/glide/load/model/StringLoader$AssetFileDescriptorFactory;

    invoke-direct {v1}, Lcom/bumptech/glide/load/model/StringLoader$AssetFileDescriptorFactory;-><init>()V

    .line 88
    invoke-virtual {v12, v2, v0, v1}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Ljava/io/InputStream;

    new-instance v2, Lcom/bumptech/glide/load/model/stream/HttpUriLoader$Factory;

    invoke-direct {v2}, Lcom/bumptech/glide/load/model/stream/HttpUriLoader$Factory;-><init>()V

    .line 89
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Ljava/io/InputStream;

    new-instance v2, Lcom/bumptech/glide/load/model/AssetUriLoader$StreamFactory;

    .line 90
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/bumptech/glide/load/model/AssetUriLoader$StreamFactory;-><init>(Landroid/content/res/AssetManager;)V

    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Landroid/os/ParcelFileDescriptor;

    new-instance v2, Lcom/bumptech/glide/load/model/AssetUriLoader$FileDescriptorFactory;

    .line 91
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/bumptech/glide/load/model/AssetUriLoader$FileDescriptorFactory;-><init>(Landroid/content/res/AssetManager;)V

    .line 92
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Ljava/io/InputStream;

    new-instance v2, Lcom/bumptech/glide/load/model/stream/MediaStoreImageThumbLoader$Factory;

    move-object/from16 v3, p1

    invoke-direct {v2, v3}, Lcom/bumptech/glide/load/model/stream/MediaStoreImageThumbLoader$Factory;-><init>(Landroid/content/Context;)V

    .line 93
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Ljava/io/InputStream;

    new-instance v2, Lcom/bumptech/glide/load/model/stream/MediaStoreVideoThumbLoader$Factory;

    invoke-direct {v2, v3}, Lcom/bumptech/glide/load/model/stream/MediaStoreVideoThumbLoader$Factory;-><init>(Landroid/content/Context;)V

    .line 94
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Ljava/io/InputStream;

    new-instance v2, Lcom/bumptech/glide/load/model/UriLoader$StreamFactory;

    move-object/from16 v6, v17

    invoke-direct {v2, v6}, Lcom/bumptech/glide/load/model/UriLoader$StreamFactory;-><init>(Landroid/content/ContentResolver;)V

    .line 95
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Landroid/os/ParcelFileDescriptor;

    new-instance v2, Lcom/bumptech/glide/load/model/UriLoader$FileDescriptorFactory;

    invoke-direct {v2, v6}, Lcom/bumptech/glide/load/model/UriLoader$FileDescriptorFactory;-><init>(Landroid/content/ContentResolver;)V

    .line 96
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Landroid/content/res/AssetFileDescriptor;

    new-instance v2, Lcom/bumptech/glide/load/model/UriLoader$AssetFileDescriptorFactory;

    invoke-direct {v2, v6}, Lcom/bumptech/glide/load/model/UriLoader$AssetFileDescriptorFactory;-><init>(Landroid/content/ContentResolver;)V

    .line 97
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Ljava/io/InputStream;

    new-instance v2, Lcom/bumptech/glide/load/model/UrlUriLoader$StreamFactory;

    invoke-direct {v2}, Lcom/bumptech/glide/load/model/UrlUriLoader$StreamFactory;-><init>()V

    .line 98
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Ljava/net/URL;

    const-class v1, Ljava/io/InputStream;

    new-instance v2, Lcom/bumptech/glide/load/model/stream/UrlLoader$StreamFactory;

    invoke-direct {v2}, Lcom/bumptech/glide/load/model/stream/UrlLoader$StreamFactory;-><init>()V

    .line 99
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Ljava/io/File;

    new-instance v2, Lcom/bumptech/glide/load/model/MediaStoreFileLoader$Factory;

    invoke-direct {v2, v3}, Lcom/bumptech/glide/load/model/MediaStoreFileLoader$Factory;-><init>(Landroid/content/Context;)V

    .line 100
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Lcom/bumptech/glide/load/model/GlideUrl;

    const-class v1, Ljava/io/InputStream;

    new-instance v2, Lcom/bumptech/glide/load/model/stream/HttpGlideUrlLoader$Factory;

    invoke-direct {v2}, Lcom/bumptech/glide/load/model/stream/HttpGlideUrlLoader$Factory;-><init>()V

    .line 101
    invoke-virtual {v12, v0, v1, v2}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Ljava/nio/ByteBuffer;

    new-instance v1, Lcom/bumptech/glide/load/model/ByteArrayLoader$ByteBufferFactory;

    invoke-direct {v1}, Lcom/bumptech/glide/load/model/ByteArrayLoader$ByteBufferFactory;-><init>()V

    move-object/from16 v2, v18

    .line 102
    invoke-virtual {v12, v2, v0, v1}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Ljava/io/InputStream;

    new-instance v1, Lcom/bumptech/glide/load/model/ByteArrayLoader$StreamFactory;

    invoke-direct {v1}, Lcom/bumptech/glide/load/model/ByteArrayLoader$StreamFactory;-><init>()V

    .line 103
    invoke-virtual {v12, v2, v0, v1}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/net/Uri;

    const-class v1, Landroid/net/Uri;

    .line 104
    invoke-virtual {v12, v0, v1, v5}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/graphics/drawable/Drawable;

    const-class v1, Landroid/graphics/drawable/Drawable;

    .line 105
    invoke-virtual {v12, v0, v1, v5}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/graphics/drawable/Drawable;

    const-class v1, Landroid/graphics/drawable/Drawable;

    new-instance v5, Lcom/bumptech/glide/load/resource/drawable/UnitDrawableDecoder;

    invoke-direct {v5}, Lcom/bumptech/glide/load/resource/drawable/UnitDrawableDecoder;-><init>()V

    const-string v6, "legacy_append"

    .line 106
    invoke-virtual {v12, v6, v0, v1, v5}, Lcom/bumptech/glide/Registry;->append(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;

    .line 107
    const-class v0, Landroid/graphics/Bitmap;

    const-class v1, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v5, Lcom/bumptech/glide/load/resource/transcode/BitmapDrawableTranscoder;

    invoke-direct {v5, v13}, Lcom/bumptech/glide/load/resource/transcode/BitmapDrawableTranscoder;-><init>(Landroid/content/res/Resources;)V

    .line 108
    invoke-virtual {v12, v0, v1, v5}, Lcom/bumptech/glide/Registry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/graphics/Bitmap;

    move-object/from16 v1, p7

    .line 109
    invoke-virtual {v12, v0, v2, v1}, Lcom/bumptech/glide/Registry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)Lcom/bumptech/glide/Registry;

    const-class v0, Landroid/graphics/drawable/Drawable;

    new-instance v5, Lcom/bumptech/glide/load/resource/transcode/DrawableBytesTranscoder;

    move-object/from16 v6, v16

    invoke-direct {v5, v9, v1, v6}, Lcom/bumptech/glide/load/resource/transcode/DrawableBytesTranscoder;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)V

    .line 110
    invoke-virtual {v12, v0, v2, v5}, Lcom/bumptech/glide/Registry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)Lcom/bumptech/glide/Registry;

    const-class v0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    .line 111
    invoke-virtual {v12, v0, v2, v6}, Lcom/bumptech/glide/Registry;->register(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)Lcom/bumptech/glide/Registry;

    .line 112
    new-instance v5, Lcom/bumptech/glide/request/target/ImageViewTargetFactory;

    invoke-direct {v5}, Lcom/bumptech/glide/request/target/ImageViewTargetFactory;-><init>()V

    .line 113
    new-instance v0, Lcom/bumptech/glide/GlideContext;

    move-object v1, v0

    move-object/from16 v2, p1

    move-object/from16 v3, p5

    move-object v4, v12

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    move-object/from16 v8, p11

    move-object/from16 v9, p2

    move/from16 v10, p8

    invoke-direct/range {v1 .. v10}, Lcom/bumptech/glide/GlideContext;-><init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;Lcom/bumptech/glide/Registry;Lcom/bumptech/glide/request/target/ImageViewTargetFactory;Lcom/bumptech/glide/request/RequestOptions;Ljava/util/Map;Ljava/util/List;Lcom/bumptech/glide/load/engine/Engine;I)V

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/bumptech/glide/Glide;->glideContext:Lcom/bumptech/glide/GlideContext;

    return-void

    :catchall_0
    move-exception v0

    .line 114
    monitor-exit v2

    throw v0

    :catchall_1
    move-exception v0

    .line 115
    monitor-exit v2

    throw v0
.end method

.method public static get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    if-nez v0, :cond_2

    .line 2
    const-class v0, Lcom/bumptech/glide/Glide;

    monitor-enter v0

    .line 3
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    if-nez v1, :cond_1

    .line 4
    sget-boolean v1, Lcom/bumptech/glide/Glide;->isInitializing:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    .line 5
    sput-boolean v1, Lcom/bumptech/glide/Glide;->isInitializing:Z

    .line 6
    new-instance v1, Lcom/bumptech/glide/GlideBuilder;

    invoke-direct {v1}, Lcom/bumptech/glide/GlideBuilder;-><init>()V

    invoke-static {p0, v1}, Lcom/bumptech/glide/Glide;->initializeGlide(Landroid/content/Context;Lcom/bumptech/glide/GlideBuilder;)V

    const/4 p0, 0x0

    .line 7
    sput-boolean p0, Lcom/bumptech/glide/Glide;->isInitializing:Z

    goto :goto_0

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot call Glide.get() in registerComponents(), use the provided Glide instance instead"

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 9
    :cond_1
    :goto_0
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 10
    :cond_2
    :goto_1
    sget-object p0, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    return-object p0
.end method

.method public static declared-synchronized init(Landroid/content/Context;Lcom/bumptech/glide/GlideBuilder;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "builder"
        }
    .end annotation

    const-class v0, Lcom/bumptech/glide/Glide;

    monitor-enter v0

    .line 5
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    if-eqz v1, :cond_0

    .line 6
    invoke-static {}, Lcom/bumptech/glide/Glide;->tearDown()V

    .line 7
    :cond_0
    invoke-static {p0, p1}, Lcom/bumptech/glide/Glide;->initializeGlide(Landroid/content/Context;Lcom/bumptech/glide/GlideBuilder;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized init(Lcom/bumptech/glide/Glide;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "glide"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-class v0, Lcom/bumptech/glide/Glide;

    monitor-enter v0

    .line 1
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    if-eqz v1, :cond_0

    .line 2
    invoke-static {}, Lcom/bumptech/glide/Glide;->tearDown()V

    .line 3
    :cond_0
    sput-object p0, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static initializeGlide(Landroid/content/Context;Lcom/bumptech/glide/GlideBuilder;)V
    .locals 30
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "builder"
        }
    .end annotation

    move-object/from16 v0, p1

    const-string v1, "Glide"

    .line 1
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v14

    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_0
    const-string v4, "com.bumptech.glide.GeneratedAppGlideModuleImpl"

    .line 2
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    new-array v5, v2, [Ljava/lang/Class;

    .line 3
    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    new-array v5, v2, [Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bumptech/glide/GeneratedAppGlideModule;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 4
    invoke-static {v0}, Lcom/bumptech/glide/Glide;->throwIncorrectGlideModule(Ljava/lang/Exception;)V

    throw v3

    :catch_1
    move-exception v0

    .line 5
    invoke-static {v0}, Lcom/bumptech/glide/Glide;->throwIncorrectGlideModule(Ljava/lang/Exception;)V

    throw v3

    :catch_2
    move-exception v0

    .line 6
    invoke-static {v0}, Lcom/bumptech/glide/Glide;->throwIncorrectGlideModule(Ljava/lang/Exception;)V

    throw v3

    :catch_3
    move-exception v0

    .line 7
    invoke-static {v0}, Lcom/bumptech/glide/Glide;->throwIncorrectGlideModule(Ljava/lang/Exception;)V

    throw v3

    :catch_4
    const/4 v4, 0x5

    .line 8
    invoke-static {v1, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "Failed to find GeneratedAppGlideModule. You should include an annotationProcessor compile dependency on com.github.bumptech.glide:compiler in your application and a @GlideModule annotated AppGlideModule implementation or LibraryGlideModules will be silently ignored"

    .line 9
    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    move-object v4, v3

    .line 10
    :goto_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    const-string v5, "ManifestParser"

    const/4 v6, 0x3

    .line 11
    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_1

    const-string v7, "Loading Glide modules"

    .line 12
    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    :cond_1
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 14
    :try_start_1
    invoke-virtual {v14}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 15
    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x80

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v7

    .line 16
    iget-object v8, v7, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-nez v8, :cond_2

    .line 17
    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_7

    const-string v7, "Got null app info metadata"

    .line 18
    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    :cond_2
    const/4 v8, 0x2

    .line 19
    invoke-static {v5, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 20
    iget-object v8, v7, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, 0x17

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v9, "Got app info metadata: "

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    :cond_3
    iget-object v8, v7, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    invoke-virtual {v8}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const-string v10, "GlideModule"

    .line 22
    iget-object v11, v7, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    invoke-virtual {v11, v9}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 23
    invoke-static {v9}, Lcom/bumptech/glide/module/ManifestParser;->parseModule(Ljava/lang/String;)Lcom/bumptech/glide/module/GlideModule;

    move-result-object v10

    invoke-virtual {v15, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v10

    if-eqz v10, :cond_4

    const-string v10, "Loaded Glide module: "

    .line 25
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_5

    invoke-virtual {v10, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_2

    :cond_5
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v10}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_2
    invoke-static {v5, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_5

    goto :goto_1

    .line 26
    :cond_6
    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_7

    const-string v7, "Finished loading Glide modules"

    .line 27
    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    :goto_3
    if-eqz v4, :cond_a

    .line 28
    invoke-virtual {v4}, Lcom/bumptech/glide/GeneratedAppGlideModule;->getExcludedModuleClasses()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_a

    .line 29
    invoke-virtual {v4}, Lcom/bumptech/glide/GeneratedAppGlideModule;->getExcludedModuleClasses()Ljava/util/Set;

    move-result-object v4

    .line 30
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 31
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_a

    .line 32
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/bumptech/glide/module/GlideModule;

    .line 33
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-interface {v4, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8

    goto :goto_4

    .line 34
    :cond_8
    invoke-static {v1, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 35
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x2e

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v8, "AppGlideModule excludes manifest GlideModule: "

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    :cond_9
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    goto :goto_4

    .line 37
    :cond_a
    invoke-static {v1, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 38
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bumptech/glide/module/GlideModule;

    .line 39
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x26

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v6, "Discovered GlideModule from manifest: "

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 40
    :cond_b
    iput-object v3, v0, Lcom/bumptech/glide/GlideBuilder;->requestManagerFactory:Lcom/bumptech/glide/manager/RequestManagerRetriever$RequestManagerFactory;

    .line 41
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/module/GlideModule;

    .line 42
    invoke-interface {v3, v14, v0}, Lcom/bumptech/glide/module/AppliesOptions;->applyOptions(Landroid/content/Context;Lcom/bumptech/glide/GlideBuilder;)V

    goto :goto_6

    .line 43
    :cond_c
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->sourceExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    if-nez v1, :cond_d

    .line 44
    invoke-static {}, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;->calculateBestThreadCount()I

    move-result v5

    sget-object v1, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;->DEFAULT:Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;

    .line 45
    new-instance v11, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    new-instance v12, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v9, Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-direct {v9}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    new-instance v10, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$DefaultThreadFactory;

    const-string v3, "source"

    invoke-direct {v10, v3, v1, v2}, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$DefaultThreadFactory;-><init>(Ljava/lang/String;Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;Z)V

    const-wide/16 v6, 0x0

    move-object v3, v12

    move v4, v5

    invoke-direct/range {v3 .. v10}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    invoke-direct {v11, v12}, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 46
    iput-object v11, v0, Lcom/bumptech/glide/GlideBuilder;->sourceExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    .line 47
    :cond_d
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->diskCacheExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    const/4 v3, 0x1

    if-nez v1, :cond_e

    .line 48
    sget-object v1, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;->DEFAULT:Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;

    .line 49
    new-instance v4, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    new-instance v13, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v11, Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-direct {v11}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    new-instance v12, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$DefaultThreadFactory;

    const-string v5, "disk-cache"

    invoke-direct {v12, v5, v1, v3}, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$DefaultThreadFactory;-><init>(Ljava/lang/String;Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;Z)V

    const-wide/16 v8, 0x0

    const/4 v7, 0x1

    move-object v5, v13

    move v6, v7

    invoke-direct/range {v5 .. v12}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    invoke-direct {v4, v13}, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 50
    iput-object v4, v0, Lcom/bumptech/glide/GlideBuilder;->diskCacheExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    .line 51
    :cond_e
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->animationExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    if-nez v1, :cond_f

    .line 52
    invoke-static {}, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;->newAnimationExecutor()Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    move-result-object v1

    iput-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->animationExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    .line 53
    :cond_f
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->memorySizeCalculator:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;

    if-nez v1, :cond_10

    .line 54
    new-instance v1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;

    invoke-direct {v1, v14}, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;-><init>(Landroid/content/Context;)V

    .line 55
    new-instance v4, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;

    invoke-direct {v4, v1}, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;-><init>(Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;)V

    .line 56
    iput-object v4, v0, Lcom/bumptech/glide/GlideBuilder;->memorySizeCalculator:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;

    .line 57
    :cond_10
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->connectivityMonitorFactory:Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;

    if-nez v1, :cond_11

    .line 58
    new-instance v1, Lcom/bumptech/glide/manager/DefaultConnectivityMonitorFactory;

    invoke-direct {v1}, Lcom/bumptech/glide/manager/DefaultConnectivityMonitorFactory;-><init>()V

    iput-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->connectivityMonitorFactory:Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;

    .line 59
    :cond_11
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    if-nez v1, :cond_13

    .line 60
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->memorySizeCalculator:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;

    .line 61
    iget v1, v1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->bitmapPoolSize:I

    if-lez v1, :cond_12

    .line 62
    new-instance v4, Lcom/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool;

    int-to-long v5, v1

    invoke-direct {v4, v5, v6}, Lcom/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool;-><init>(J)V

    iput-object v4, v0, Lcom/bumptech/glide/GlideBuilder;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    goto :goto_7

    .line 63
    :cond_12
    new-instance v1, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPoolAdapter;

    invoke-direct {v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPoolAdapter;-><init>()V

    iput-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    .line 64
    :cond_13
    :goto_7
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    if-nez v1, :cond_14

    .line 65
    new-instance v1, Lcom/bumptech/glide/load/engine/bitmap_recycle/LruArrayPool;

    iget-object v4, v0, Lcom/bumptech/glide/GlideBuilder;->memorySizeCalculator:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;

    .line 66
    iget v4, v4, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->arrayPoolSize:I

    .line 67
    invoke-direct {v1, v4}, Lcom/bumptech/glide/load/engine/bitmap_recycle/LruArrayPool;-><init>(I)V

    iput-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    .line 68
    :cond_14
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    if-nez v1, :cond_15

    .line 69
    new-instance v1, Lcom/bumptech/glide/load/engine/cache/LruResourceCache;

    iget-object v4, v0, Lcom/bumptech/glide/GlideBuilder;->memorySizeCalculator:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;

    .line 70
    iget v4, v4, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->memoryCacheSize:I

    int-to-long v4, v4

    .line 71
    invoke-direct {v1, v4, v5}, Lcom/bumptech/glide/load/engine/cache/LruResourceCache;-><init>(J)V

    iput-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    .line 72
    :cond_15
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->diskCacheFactory:Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;

    if-nez v1, :cond_16

    .line 73
    new-instance v1, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;

    invoke-direct {v1, v14}, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->diskCacheFactory:Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;

    .line 74
    :cond_16
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->engine:Lcom/bumptech/glide/load/engine/Engine;

    if-nez v1, :cond_17

    .line 75
    new-instance v1, Lcom/bumptech/glide/load/engine/Engine;

    iget-object v4, v0, Lcom/bumptech/glide/GlideBuilder;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    iget-object v5, v0, Lcom/bumptech/glide/GlideBuilder;->diskCacheFactory:Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;

    iget-object v6, v0, Lcom/bumptech/glide/GlideBuilder;->diskCacheExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    iget-object v7, v0, Lcom/bumptech/glide/GlideBuilder;->sourceExecutor:Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    .line 76
    new-instance v8, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    new-instance v9, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-wide v19, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;->KEEP_ALIVE_TIME_MS:J

    sget-object v21, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v22, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct/range {v22 .. v22}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    new-instance v10, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$DefaultThreadFactory;

    sget-object v11, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;->DEFAULT:Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;

    const-string v12, "source-unlimited"

    invoke-direct {v10, v12, v11, v2}, Lcom/bumptech/glide/load/engine/executor/GlideExecutor$DefaultThreadFactory;-><init>(Ljava/lang/String;Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;Z)V

    const/16 v17, 0x0

    const v18, 0x7fffffff

    move-object/from16 v16, v9

    move-object/from16 v23, v10

    invoke-direct/range {v16 .. v23}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    invoke-direct {v8, v9}, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 77
    invoke-static {}, Lcom/bumptech/glide/load/engine/executor/GlideExecutor;->newAnimationExecutor()Lcom/bumptech/glide/load/engine/executor/GlideExecutor;

    move-result-object v22

    const/16 v29, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    move-object/from16 v16, v1

    move-object/from16 v17, v4

    move-object/from16 v18, v5

    move-object/from16 v19, v6

    move-object/from16 v20, v7

    move-object/from16 v21, v8

    .line 78
    invoke-direct/range {v16 .. v29}, Lcom/bumptech/glide/load/engine/Engine;-><init>(Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/Jobs;Lcom/bumptech/glide/load/engine/EngineKeyFactory;Lcom/bumptech/glide/load/engine/ActiveResources;Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;Lcom/bumptech/glide/load/engine/ResourceRecycler;Z)V

    .line 79
    iput-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->engine:Lcom/bumptech/glide/load/engine/Engine;

    .line 80
    :cond_17
    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->defaultRequestListeners:Ljava/util/List;

    if-nez v1, :cond_18

    .line 81
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->defaultRequestListeners:Ljava/util/List;

    goto :goto_8

    .line 82
    :cond_18
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->defaultRequestListeners:Ljava/util/List;

    .line 83
    :goto_8
    new-instance v8, Lcom/bumptech/glide/manager/RequestManagerRetriever;

    iget-object v1, v0, Lcom/bumptech/glide/GlideBuilder;->requestManagerFactory:Lcom/bumptech/glide/manager/RequestManagerRetriever$RequestManagerFactory;

    invoke-direct {v8, v1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;-><init>(Lcom/bumptech/glide/manager/RequestManagerRetriever$RequestManagerFactory;)V

    .line 84
    new-instance v1, Lcom/bumptech/glide/Glide;

    iget-object v4, v0, Lcom/bumptech/glide/GlideBuilder;->engine:Lcom/bumptech/glide/load/engine/Engine;

    iget-object v5, v0, Lcom/bumptech/glide/GlideBuilder;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    iget-object v6, v0, Lcom/bumptech/glide/GlideBuilder;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    iget-object v7, v0, Lcom/bumptech/glide/GlideBuilder;->arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    iget-object v9, v0, Lcom/bumptech/glide/GlideBuilder;->connectivityMonitorFactory:Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;

    const/4 v10, 0x4

    iget-object v11, v0, Lcom/bumptech/glide/GlideBuilder;->defaultRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    .line 85
    iput-boolean v3, v11, Lcom/bumptech/glide/request/BaseRequestOptions;->isLocked:Z

    .line 86
    iget-object v12, v0, Lcom/bumptech/glide/GlideBuilder;->defaultTransitionOptions:Ljava/util/Map;

    iget-object v13, v0, Lcom/bumptech/glide/GlideBuilder;->defaultRequestListeners:Ljava/util/List;

    move-object v2, v1

    move-object v3, v14

    invoke-direct/range {v2 .. v13}, Lcom/bumptech/glide/Glide;-><init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;Lcom/bumptech/glide/manager/RequestManagerRetriever;Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;ILcom/bumptech/glide/request/RequestOptions;Ljava/util/Map;Ljava/util/List;)V

    .line 87
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/module/GlideModule;

    .line 88
    iget-object v3, v1, Lcom/bumptech/glide/Glide;->registry:Lcom/bumptech/glide/Registry;

    invoke-interface {v2, v14, v1, v3}, Lcom/bumptech/glide/module/RegistersComponents;->registerComponents(Landroid/content/Context;Lcom/bumptech/glide/Glide;Lcom/bumptech/glide/Registry;)V

    goto :goto_9

    .line 89
    :cond_19
    invoke-virtual {v14, v1}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 90
    sput-object v1, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    return-void

    :catch_5
    move-exception v0

    .line 91
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Unable to find metadata to parse GlideModules"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static declared-synchronized tearDown()V
    .locals 3

    const-class v0, Lcom/bumptech/glide/Glide;

    monitor-enter v0

    .line 1
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    if-eqz v1, :cond_0

    .line 2
    sget-object v1, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    invoke-virtual {v1}, Lcom/bumptech/glide/Glide;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 3
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    .line 4
    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 5
    sget-object v1, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;

    iget-object v1, v1, Lcom/bumptech/glide/Glide;->engine:Lcom/bumptech/glide/load/engine/Engine;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/Engine;->shutdown()V

    :cond_0
    const/4 v1, 0x0

    .line 6
    sput-object v1, Lcom/bumptech/glide/Glide;->glide:Lcom/bumptech/glide/Glide;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static throwIncorrectGlideModule(Ljava/lang/Exception;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "GeneratedAppGlideModuleImpl is implemented incorrectly. If you\'ve manually implemented this class, remove your implementation. The Annotation processor will generate a correct implementation."

    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static with(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    const-string v0, "You cannot start a load on a not yet attached View or a Fragment where getActivity() returns null (which usually occurs when getActivity() is called before the Fragment is attached or after the Fragment is destroyed)."

    .line 1
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2
    invoke-static {p0}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object v0

    .line 3
    iget-object v0, v0, Lcom/bumptech/glide/Glide;->requestManagerRetriever:Lcom/bumptech/glide/manager/RequestManagerRetriever;

    .line 4
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;

    move-result-object p0

    return-object p0
.end method

.method public static with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    const-string v0, "You cannot start a load on a not yet attached View or a Fragment where getActivity() returns null (which usually occurs when getActivity() is called before the Fragment is attached or after the Fragment is destroyed)."

    .line 5
    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    invoke-static {p0}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/bumptech/glide/Glide;->requestManagerRetriever:Lcom/bumptech/glide/manager/RequestManagerRetriever;

    .line 8
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public clearMemory()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    check-cast v0, Lcom/bumptech/glide/util/LruCache;

    const-wide/16 v1, 0x0

    .line 3
    invoke-virtual {v0, v1, v2}, Lcom/bumptech/glide/util/LruCache;->trimToSize(J)V

    .line 4
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->clearMemory()V

    .line 5
    iget-object p0, p0, Lcom/bumptech/glide/Glide;->arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    invoke-interface {p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;->clearMemory()V

    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/Glide;->glideContext:Lcom/bumptech/glide/GlideContext;

    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    return-object p0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "newConfig"
        }
    .end annotation

    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/bumptech/glide/Glide;->clearMemory()V

    return-void
.end method

.method public onTrimMemory(I)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "level"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    check-cast v0, Lcom/bumptech/glide/load/engine/cache/LruResourceCache;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x28

    if-lt p1, v1, :cond_0

    const-wide/16 v1, 0x0

    .line 3
    invoke-virtual {v0, v1, v2}, Lcom/bumptech/glide/util/LruCache;->trimToSize(J)V

    goto :goto_0

    :cond_0
    const/16 v1, 0x14

    if-ge p1, v1, :cond_1

    const/16 v1, 0xf

    if-ne p1, v1, :cond_2

    .line 4
    :cond_1
    monitor-enter v0

    .line 5
    :try_start_0
    iget-wide v1, v0, Lcom/bumptech/glide/util/LruCache;->maxSize:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    const-wide/16 v3, 0x2

    .line 6
    div-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Lcom/bumptech/glide/util/LruCache;->trimToSize(J)V

    .line 7
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->trimMemory(I)V

    .line 8
    iget-object p0, p0, Lcom/bumptech/glide/Glide;->arrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    invoke-interface {p0, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;->trimMemory(I)V

    return-void

    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0

    throw p0
.end method

.method public setMemoryCategory(Lcom/bumptech/glide/MemoryCategory;)Lcom/bumptech/glide/MemoryCategory;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "memoryCategory"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->memoryCache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    invoke-virtual {p1}, Lcom/bumptech/glide/MemoryCategory;->getMultiplier()F

    move-result v1

    check-cast v0, Lcom/bumptech/glide/util/LruCache;

    .line 3
    monitor-enter v0

    const/4 v2, 0x0

    cmpg-float v2, v1, v2

    if-ltz v2, :cond_0

    .line 4
    :try_start_0
    iget-wide v2, v0, Lcom/bumptech/glide/util/LruCache;->initialMaxSize:J

    long-to-float v2, v2

    mul-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-long v1, v1

    iput-wide v1, v0, Lcom/bumptech/glide/util/LruCache;->maxSize:J

    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/bumptech/glide/util/LruCache;->trimToSize(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    monitor-exit v0

    .line 7
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-virtual {p1}, Lcom/bumptech/glide/MemoryCategory;->getMultiplier()F

    move-result v1

    invoke-interface {v0, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->setSizeMultiplier(F)V

    .line 8
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->memoryCategory:Lcom/bumptech/glide/MemoryCategory;

    .line 9
    iput-object p1, p0, Lcom/bumptech/glide/Glide;->memoryCategory:Lcom/bumptech/glide/MemoryCategory;

    return-object v0

    .line 10
    :cond_0
    :try_start_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Multiplier must be >= 0"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
