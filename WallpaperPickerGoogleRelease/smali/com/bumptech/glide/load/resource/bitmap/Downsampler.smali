.class public final Lcom/bumptech/glide/load/resource/bitmap/Downsampler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;
    }
.end annotation


# static fields
.field public static final ALLOW_HARDWARE_CONFIG:Lcom/bumptech/glide/load/Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/Option<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final DECODE_FORMAT:Lcom/bumptech/glide/load/Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/Option<",
            "Lcom/bumptech/glide/load/DecodeFormat;",
            ">;"
        }
    .end annotation
.end field

.field public static final EMPTY_CALLBACKS:Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;

.field public static final FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS:Lcom/bumptech/glide/load/Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/Option<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTIONS_QUEUE:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroid/graphics/BitmapFactory$Options;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

.field public final byteArrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

.field public final displayMetrics:Landroid/util/DisplayMetrics;

.field public final hardwareConfigState:Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;

.field public final parsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/ImageHeaderParser;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_ARGB_8888:Lcom/bumptech/glide/load/DecodeFormat;

    const-string v1, "com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeFormat"

    invoke-static {v1, v0}, Lcom/bumptech/glide/load/Option;->memory(Ljava/lang/String;Ljava/lang/Object;)Lcom/bumptech/glide/load/Option;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->DECODE_FORMAT:Lcom/bumptech/glide/load/Option;

    .line 2
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->OPTION:Lcom/bumptech/glide/load/Option;

    .line 3
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const-string v1, "com.bumptech.glide.load.resource.bitmap.Downsampler.FixBitmapSize"

    invoke-static {v1, v0}, Lcom/bumptech/glide/load/Option;->memory(Ljava/lang/String;Ljava/lang/Object;)Lcom/bumptech/glide/load/Option;

    move-result-object v1

    sput-object v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS:Lcom/bumptech/glide/load/Option;

    const-string v1, "com.bumptech.glide.load.resource.bitmap.Downsampler.AllowHardwareDecode"

    .line 4
    invoke-static {v1, v0}, Lcom/bumptech/glide/load/Option;->memory(Ljava/lang/String;Ljava/lang/Object;)Lcom/bumptech/glide/load/Option;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->ALLOW_HARDWARE_CONFIG:Lcom/bumptech/glide/load/Option;

    .line 5
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "image/vnd.wap.wbmp"

    const-string v2, "image/x-ico"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    .line 6
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 7
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 8
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler$1;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler$1;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->EMPTY_CALLBACKS:Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;

    .line 9
    sget-object v0, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->JPEG:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    sget-object v1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->PNG_A:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    sget-object v2, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->PNG:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    .line 10
    invoke-static {v0, v1, v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 12
    sget-object v0, Lcom/bumptech/glide/util/Util;->HEX_CHAR_ARRAY:[C

    .line 13
    new-instance v0, Ljava/util/ArrayDeque;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    .line 14
    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->OPTIONS_QUEUE:Ljava/util/Queue;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroid/util/DisplayMetrics;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "parsers",
            "displayMetrics",
            "bitmapPool",
            "byteArrayPool"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/ImageHeaderParser;",
            ">;",
            "Landroid/util/DisplayMetrics;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->instance:Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;

    if-nez v0, :cond_1

    .line 3
    const-class v0, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;

    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->instance:Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;

    if-nez v1, :cond_0

    .line 5
    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;-><init>()V

    sput-object v1, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->instance:Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;

    .line 6
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 7
    :cond_1
    :goto_0
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->instance:Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;

    .line 8
    iput-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->hardwareConfigState:Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;

    .line 9
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->parsers:Ljava/util/List;

    const-string p1, "Argument must not be null"

    .line 10
    invoke-static {p2, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    iput-object p2, p0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->displayMetrics:Landroid/util/DisplayMetrics;

    const-string p1, "Argument must not be null"

    .line 12
    invoke-static {p3, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    iput-object p3, p0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    const-string p1, "Argument must not be null"

    .line 14
    invoke-static {p4, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    iput-object p4, p0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->byteArrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    return-void
.end method

.method public static decodeStream(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)Landroid/graphics/Bitmap;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "is",
            "options",
            "callbacks",
            "bitmapPool"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Downsampler"

    .line 1
    iget-boolean v1, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    if-eqz v1, :cond_0

    const/high16 v1, 0xa00000

    .line 2
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->mark(I)V

    goto :goto_0

    .line 3
    :cond_0
    invoke-interface {p2}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;->onObtainBounds()V

    .line 4
    :goto_0
    iget v1, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 5
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 6
    iget-object v3, p1, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    .line 7
    sget-object v4, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->BITMAP_DRAWABLE_LOCK:Ljava/util/concurrent/locks/Lock;

    .line 8
    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v5, 0x0

    .line 9
    :try_start_0
    invoke-static {p0, v5, p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 11
    iget-boolean p1, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    if-eqz p1, :cond_1

    .line 12
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V

    :cond_1
    return-object p2

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception v4

    .line 13
    :try_start_1
    invoke-static {v4, v1, v2, v3, p1}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->newIoExceptionForInBitmapAssertion(Ljava/lang/IllegalArgumentException;IILjava/lang/String;Landroid/graphics/BitmapFactory$Options;)Ljava/io/IOException;

    move-result-object v1

    const/4 v2, 0x3

    .line 14
    invoke-static {v0, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "Failed to decode with inBitmap, trying again without Bitmap re-use"

    .line 15
    invoke-static {v0, v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    :cond_2
    iget-object v0, p1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_3

    .line 17
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V

    .line 18
    iget-object v0, p1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-interface {p3, v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->put(Landroid/graphics/Bitmap;)V

    .line 19
    iput-object v5, p1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 20
    invoke-static {p0, p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->decodeStream(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    sget-object p1, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->BITMAP_DRAWABLE_LOCK:Ljava/util/concurrent/locks/Lock;

    .line 22
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object p0

    .line 23
    :catch_1
    :try_start_3
    throw v1

    .line 24
    :cond_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 25
    :goto_1
    sget-object p1, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->BITMAP_DRAWABLE_LOCK:Ljava/util/concurrent/locks/Lock;

    .line 26
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p0
.end method

.method public static getBitmapString(Landroid/graphics/Bitmap;)Ljava/lang/String;
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bitmap"
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result v0

    const/16 v1, 0xe

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, " ("

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1a

    invoke-static {v0, v3}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "["

    const-string v5, "x"

    invoke-static {v3, v4, v1, v5, v2}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDensityMultiplier(D)I
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "adjustedScaleFactor"
        }
    .end annotation

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpg-double v2, p0, v0

    if-gtz v2, :cond_0

    goto :goto_0

    :cond_0
    div-double p0, v0, p0

    :goto_0
    const-wide v0, 0x41dfffffffc00000L    # 2.147483647E9

    mul-double/2addr p0, v0

    .line 1
    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    long-to-int p0, p0

    return p0
.end method

.method public static getDimensions(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)[I
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "is",
            "options",
            "decodeCallbacks",
            "bitmapPool"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 2
    invoke-static {p0, p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->decodeStream(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)Landroid/graphics/Bitmap;

    const/4 p0, 0x0

    .line 3
    iput-boolean p0, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    const/4 p2, 0x2

    new-array p2, p2, [I

    .line 4
    iget p3, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    aput p3, p2, p0

    iget p0, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    aput p0, p2, v0

    return-object p2
.end method

.method public static newIoExceptionForInBitmapAssertion(Ljava/lang/IllegalArgumentException;IILjava/lang/String;Landroid/graphics/BitmapFactory$Options;)Ljava/io/IOException;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "e",
            "outWidth",
            "outHeight",
            "outMimeType",
            "options"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/IOException;

    .line 2
    iget-object p4, p4, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-static {p4}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getBitmapString(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object p4

    const/16 v1, 0x63

    .line 3
    invoke-static {p3, v1}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v1

    invoke-static {p4, v1}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v1

    const-string v2, "Exception decoding bitmap, outWidth: "

    const-string v3, ", outHeight: "

    invoke-static {v1, v2, p1, v3, p2}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ", outMimeType: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ", inBitmap: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static releaseOptions(Landroid/graphics/BitmapFactory$Options;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "decodeBitmapOptions"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->resetOptions(Landroid/graphics/BitmapFactory$Options;)V

    .line 2
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->OPTIONS_QUEUE:Ljava/util/Queue;

    monitor-enter v0

    .line 3
    :try_start_0
    move-object v1, v0

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1, p0}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 4
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static resetOptions(Landroid/graphics/BitmapFactory$Options;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "decodeBitmapOptions"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    const/4 v1, 0x0

    .line 2
    iput-boolean v1, p0, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 3
    iput-boolean v1, p0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    const/4 v2, 0x1

    .line 4
    iput v2, p0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 5
    iput-object v0, p0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 6
    iput-boolean v1, p0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 7
    iput v1, p0, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    .line 8
    iput v1, p0, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    .line 9
    iput v1, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 10
    iput v1, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 11
    iput-object v0, p0, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    .line 12
    iput-object v0, p0, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 13
    iput-boolean v2, p0, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    return-void
.end method

.method public static round(D)I
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    add-double/2addr p0, v0

    double-to-int p0, p0

    return p0
.end method


# virtual methods
.method public decode(Ljava/io/InputStream;IILcom/bumptech/glide/load/Options;Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;)Lcom/bumptech/glide/load/engine/Resource;
    .locals 14
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "is",
            "requestedWidth",
            "requestedHeight",
            "options",
            "callbacks"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "II",
            "Lcom/bumptech/glide/load/Options;",
            "Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;",
            ")",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object v11, p0

    move-object/from16 v0, p4

    .line 1
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v1

    const-string v2, "You must provide an InputStream that supports mark()"

    invoke-static {v1, v2}, Lcom/bumptech/glide/util/Preconditions;->checkArgument(ZLjava/lang/String;)V

    .line 2
    iget-object v1, v11, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->byteArrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    const-class v2, [B

    const/high16 v3, 0x10000

    invoke-interface {v1, v3, v2}, Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;->get(ILjava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, [B

    .line 3
    const-class v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;

    monitor-enter v1

    .line 4
    :try_start_0
    sget-object v2, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->OPTIONS_QUEUE:Ljava/util/Queue;

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 5
    :try_start_1
    move-object v3, v2

    check-cast v3, Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/BitmapFactory$Options;

    .line 6
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez v3, :cond_0

    .line 7
    :try_start_2
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 8
    invoke-static {v3}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->resetOptions(Landroid/graphics/BitmapFactory$Options;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :cond_0
    move-object v13, v3

    .line 9
    monitor-exit v1

    .line 10
    iput-object v12, v13, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    .line 11
    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->DECODE_FORMAT:Lcom/bumptech/glide/load/Option;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/Options;->get(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/bumptech/glide/load/DecodeFormat;

    .line 12
    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->OPTION:Lcom/bumptech/glide/load/Option;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/Options;->get(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    .line 13
    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS:Lcom/bumptech/glide/load/Option;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/Options;->get(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    .line 14
    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->ALLOW_HARDWARE_CONFIG:Lcom/bumptech/glide/load/Option;

    .line 15
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/Options;->get(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/Options;->get(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    move v6, v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, v13

    move/from16 v7, p2

    move/from16 v8, p3

    move-object/from16 v10, p5

    .line 16
    :try_start_3
    invoke-virtual/range {v1 .. v10}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->decodeFromWrappedStreams(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/DecodeFormat;ZIIZLcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 17
    iget-object v1, v11, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-static {v0, v1}, Lcom/bumptech/glide/load/resource/bitmap/BitmapResource;->obtain(Landroid/graphics/Bitmap;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)Lcom/bumptech/glide/load/resource/bitmap/BitmapResource;

    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 18
    invoke-static {v13}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->releaseOptions(Landroid/graphics/BitmapFactory$Options;)V

    .line 19
    iget-object v1, v11, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->byteArrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    invoke-interface {v1, v12}, Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;->put(Ljava/lang/Object;)V

    return-object v0

    :catchall_0
    move-exception v0

    .line 20
    invoke-static {v13}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->releaseOptions(Landroid/graphics/BitmapFactory$Options;)V

    .line 21
    iget-object v1, v11, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->byteArrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    invoke-interface {v1, v12}, Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;->put(Ljava/lang/Object;)V

    throw v0

    :catchall_1
    move-exception v0

    .line 22
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public final decodeFromWrappedStreams(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/DecodeFormat;ZIIZLcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;)Landroid/graphics/Bitmap;
    .locals 26
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
            0x0
        }
        names = {
            "is",
            "options",
            "downsampleStrategy",
            "decodeFormat",
            "isHardwareConfigAllowed",
            "requestedWidth",
            "requestedHeight",
            "fixBitmapToRequestedDimensions",
            "callbacks"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v0, p3

    move/from16 v4, p6

    move/from16 v5, p7

    move-object/from16 v6, p9

    .line 1
    sget v7, Lcom/bumptech/glide/util/LogTime;->$r8$clinit:I

    .line 2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v7

    .line 3
    iget-object v9, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-static {v2, v3, v6, v9}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getDimensions(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)[I

    move-result-object v9

    const/4 v10, 0x0

    .line 4
    aget v11, v9, v10

    const/4 v12, 0x1

    .line 5
    aget v9, v9, v12

    .line 6
    iget-object v12, v3, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    const/4 v13, -0x1

    if-eq v11, v13, :cond_1

    if-ne v9, v13, :cond_0

    goto :goto_0

    :cond_0
    move/from16 v10, p5

    .line 7
    :cond_1
    :goto_0
    iget-object v13, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->parsers:Ljava/util/List;

    iget-object v14, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->byteArrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    invoke-static {v13, v2, v14}, Lcom/bumptech/glide/load/ImageHeaderParserUtils;->getOrientation(Ljava/util/List;Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)I

    move-result v13

    packed-switch v13, :pswitch_data_0

    const/4 v14, 0x0

    goto :goto_1

    :pswitch_0
    const/16 v14, 0x10e

    goto :goto_1

    :pswitch_1
    const/16 v14, 0x5a

    goto :goto_1

    :pswitch_2
    const/16 v14, 0xb4

    :goto_1
    packed-switch v13, :pswitch_data_1

    const/4 v15, 0x0

    goto :goto_2

    :pswitch_3
    const/4 v15, 0x1

    :goto_2
    move/from16 p5, v13

    const/high16 v13, -0x80000000

    if-ne v4, v13, :cond_2

    move v4, v11

    :cond_2
    if-ne v5, v13, :cond_3

    move v13, v9

    goto :goto_3

    :cond_3
    move v13, v5

    .line 8
    :goto_3
    iget-object v5, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->parsers:Ljava/util/List;

    move-object/from16 v16, v12

    iget-object v12, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->byteArrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    invoke-static {v5, v2, v12}, Lcom/bumptech/glide/load/ImageHeaderParserUtils;->getType(Ljava/util/List;Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object v5

    .line 9
    iget-object v12, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    move-wide/from16 v17, v7

    const-string v7, "]"

    const-string v8, "Downsampler"

    move/from16 v19, v15

    const-string v15, "x"

    const/high16 v20, 0x3f800000    # 1.0f

    if-lez v11, :cond_15

    if-gtz v9, :cond_4

    goto/16 :goto_e

    :cond_4
    move/from16 v21, v10

    const/16 v10, 0x5a

    if-eq v14, v10, :cond_6

    const/16 v10, 0x10e

    if-ne v14, v10, :cond_5

    goto :goto_4

    .line 10
    :cond_5
    invoke-virtual {v0, v11, v9, v4, v13}, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->getScaleFactor(IIII)F

    move-result v10

    goto :goto_5

    .line 11
    :cond_6
    :goto_4
    invoke-virtual {v0, v9, v11, v4, v13}, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->getScaleFactor(IIII)F

    move-result v10

    :goto_5
    const/4 v14, 0x0

    cmpg-float v14, v10, v14

    const-string v1, "], target: ["

    if-lez v14, :cond_14

    .line 12
    invoke-virtual {v0, v11, v9, v4, v13}, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->getSampleSizeRounding$enumunboxing$(IIII)I

    move-result v7

    if-eqz v7, :cond_13

    int-to-float v14, v11

    move-object/from16 v22, v1

    mul-float v1, v10, v14

    float-to-double v0, v1

    .line 13
    invoke-static {v0, v1}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->round(D)I

    move-result v0

    int-to-float v1, v9

    move-object/from16 v23, v15

    mul-float v15, v10, v1

    move-object/from16 v25, v12

    move/from16 v24, v13

    float-to-double v12, v15

    .line 14
    invoke-static {v12, v13}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->round(D)I

    move-result v12

    .line 15
    div-int v0, v11, v0

    .line 16
    div-int v12, v9, v12

    const/4 v13, 0x1

    if-ne v7, v13, :cond_7

    .line 17
    invoke-static {v0, v12}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_6

    .line 18
    :cond_7
    invoke-static {v0, v12}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 19
    :goto_6
    invoke-static {v0}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v0

    invoke-static {v13, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    if-ne v7, v13, :cond_8

    int-to-float v7, v0

    div-float v12, v20, v10

    cmpg-float v7, v7, v12

    if-gez v7, :cond_8

    shl-int/lit8 v0, v0, 0x1

    .line 20
    :cond_8
    iput v0, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 21
    sget-object v7, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->JPEG:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    if-ne v5, v7, :cond_a

    const/16 v5, 0x8

    .line 22
    invoke-static {v0, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v14, v5

    float-to-double v12, v14

    .line 23
    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v12

    double-to-int v7, v12

    div-float/2addr v1, v5

    float-to-double v12, v1

    .line 24
    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v12

    double-to-int v1, v12

    .line 25
    div-int/lit8 v5, v0, 0x8

    if-lez v5, :cond_9

    .line 26
    div-int/2addr v7, v5

    .line 27
    div-int/2addr v1, v5

    :cond_9
    :goto_7
    move-object/from16 v5, p3

    move/from16 v12, v24

    goto :goto_b

    .line 28
    :cond_a
    sget-object v7, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->PNG:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    if-eq v5, v7, :cond_10

    sget-object v7, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->PNG_A:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    if-ne v5, v7, :cond_b

    goto :goto_a

    .line 29
    :cond_b
    sget-object v7, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->WEBP:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    if-eq v5, v7, :cond_f

    sget-object v7, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->WEBP_A:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    if-ne v5, v7, :cond_c

    goto :goto_9

    .line 30
    :cond_c
    rem-int v1, v11, v0

    if-nez v1, :cond_e

    rem-int v1, v9, v0

    if-eqz v1, :cond_d

    goto :goto_8

    .line 31
    :cond_d
    div-int v7, v11, v0

    .line 32
    div-int v1, v9, v0

    goto :goto_7

    :cond_e
    :goto_8
    move-object/from16 v1, v25

    .line 33
    invoke-static {v2, v3, v6, v1}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getDimensions(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)[I

    move-result-object v1

    const/4 v5, 0x0

    .line 34
    aget v7, v1, v5

    const/4 v5, 0x1

    .line 35
    aget v1, v1, v5

    goto :goto_7

    :cond_f
    :goto_9
    int-to-float v5, v0

    div-float/2addr v14, v5

    .line 36
    invoke-static {v14}, Ljava/lang/Math;->round(F)I

    move-result v7

    div-float/2addr v1, v5

    .line 37
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    goto :goto_7

    :cond_10
    :goto_a
    int-to-float v5, v0

    div-float/2addr v14, v5

    float-to-double v12, v14

    .line 38
    invoke-static {v12, v13}, Ljava/lang/Math;->floor(D)D

    move-result-wide v12

    double-to-int v7, v12

    div-float/2addr v1, v5

    float-to-double v12, v1

    .line 39
    invoke-static {v12, v13}, Ljava/lang/Math;->floor(D)D

    move-result-wide v12

    double-to-int v1, v12

    goto :goto_7

    .line 40
    :goto_b
    invoke-virtual {v5, v7, v1, v4, v12}, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->getScaleFactor(IIII)F

    move-result v5

    float-to-double v13, v5

    .line 41
    invoke-static {v13, v14}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getDensityMultiplier(D)I

    move-result v5

    move v15, v0

    move/from16 v24, v1

    int-to-double v0, v5

    mul-double/2addr v0, v13

    .line 42
    invoke-static {v0, v1}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->round(D)I

    move-result v0

    int-to-float v1, v0

    int-to-float v5, v5

    div-float/2addr v1, v5

    float-to-double v5, v1

    div-double v5, v13, v5

    int-to-double v0, v0

    mul-double/2addr v5, v0

    .line 43
    invoke-static {v5, v6}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->round(D)I

    move-result v0

    .line 44
    iput v0, v3, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    .line 45
    invoke-static {v13, v14}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getDensityMultiplier(D)I

    move-result v0

    iput v0, v3, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    .line 46
    iget v1, v3, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    if-lez v1, :cond_11

    if-lez v0, :cond_11

    if-eq v1, v0, :cond_11

    const/4 v0, 0x1

    goto :goto_c

    :cond_11
    const/4 v0, 0x0

    :goto_c
    if-eqz v0, :cond_12

    const/4 v0, 0x1

    .line 47
    iput-boolean v0, v3, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    goto :goto_d

    :cond_12
    const/4 v0, 0x0

    .line 48
    iput v0, v3, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    iput v0, v3, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    :goto_d
    const/4 v0, 0x2

    .line 49
    invoke-static {v8, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 50
    iget v0, v3, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    iget v1, v3, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    const/16 v5, 0x135

    const-string v6, "Calculate scaling, source: ["

    move/from16 p3, v15

    move-object/from16 v15, v23

    invoke-static {v5, v6, v11, v15, v9}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v6, v22

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "], power of two scaled: ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v6, v24

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "], exact scale factor: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v6, ", power of 2 sample size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v6, p3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", adjusted scale factor: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13, v14}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v6, ", target density: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", density: "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_f

    .line 51
    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot round with null rounding"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14
    move-object v5, v0

    move-object v6, v1

    move v12, v13

    .line 52
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static/range {p3 .. p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x76

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Cannot scale with factor: "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " from: "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", source: ["

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15
    :goto_e
    move/from16 v21, v10

    move v12, v13

    const/4 v0, 0x3

    .line 53
    invoke-static {v8, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 54
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x4a

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Unable to determine dimensions for: "

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " with target ["

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_16
    :goto_f
    move-object/from16 v1, p0

    .line 55
    iget-object v5, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->hardwareConfigState:Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;

    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v21, :cond_1c

    if-eqz v19, :cond_17

    goto :goto_12

    :cond_17
    const/16 v0, 0x80

    if-lt v4, v0, :cond_1a

    if-lt v12, v0, :cond_1a

    .line 56
    monitor-enter v5

    .line 57
    :try_start_0
    iget v0, v5, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->decodesSinceLastFdCheck:I

    add-int/lit8 v0, v0, 0x1

    iput v0, v5, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->decodesSinceLastFdCheck:I

    const/16 v6, 0x32

    if-lt v0, v6, :cond_19

    const/4 v0, 0x0

    .line 58
    iput v0, v5, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->decodesSinceLastFdCheck:I

    .line 59
    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->FD_SIZE_LIST:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    const/16 v6, 0x2bc

    if-ge v0, v6, :cond_18

    const/4 v7, 0x1

    goto :goto_10

    :cond_18
    const/4 v7, 0x0

    .line 60
    :goto_10
    iput-boolean v7, v5, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->isHardwareConfigAllowed:Z

    .line 61
    iget-boolean v7, v5, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->isHardwareConfigAllowed:Z

    if-nez v7, :cond_19

    const-string v7, "Downsampler"

    const/4 v8, 0x5

    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_19

    const-string v7, "Downsampler"

    .line 62
    new-instance v8, Ljava/lang/StringBuilder;

    const/16 v10, 0x76

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v10, "Excluding HARDWARE bitmap config because we\'re over the file descriptor limit, file descriptors "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", limit "

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    :cond_19
    iget-boolean v0, v5, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->isHardwareConfigAllowed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v5

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    goto :goto_11

    :catchall_0
    move-exception v0

    monitor-exit v5

    throw v0

    :cond_1a
    const/4 v0, 0x0

    :goto_11
    if-eqz v0, :cond_1b

    .line 64
    sget-object v5, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    iput-object v5, v3, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    const/4 v5, 0x0

    .line 65
    iput-boolean v5, v3, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    goto :goto_13

    :cond_1b
    const/4 v5, 0x0

    goto :goto_13

    :cond_1c
    :goto_12
    const/4 v0, 0x0

    move v5, v0

    :goto_13
    if-eqz v0, :cond_1d

    goto :goto_16

    .line 66
    :cond_1d
    sget-object v0, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_ARGB_8888:Lcom/bumptech/glide/load/DecodeFormat;

    move-object/from16 v6, p4

    if-eq v6, v0, :cond_21

    .line 67
    :try_start_1
    iget-object v0, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->parsers:Ljava/util/List;

    iget-object v7, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->byteArrayPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    invoke-static {v0, v2, v7}, Lcom/bumptech/glide/load/ImageHeaderParserUtils;->getType(Ljava/util/List;Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->hasAlpha()Z

    move-result v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_14

    :catch_0
    move-exception v0

    const-string v7, "Downsampler"

    const/4 v8, 0x3

    .line 68
    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_1e

    const-string v7, "Downsampler"

    .line 69
    invoke-static/range {p4 .. p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x48

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v8, "Cannot determine whether the image has alpha or not from header, format "

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1e
    move v0, v5

    :goto_14
    if-eqz v0, :cond_1f

    .line 70
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    goto :goto_15

    :cond_1f
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    :goto_15
    iput-object v0, v3, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 71
    sget-object v6, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    if-ne v0, v6, :cond_20

    const/4 v0, 0x1

    .line 72
    iput-boolean v0, v3, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    goto :goto_17

    :cond_20
    :goto_16
    const/4 v0, 0x1

    goto :goto_17

    :cond_21
    const/4 v0, 0x1

    .line 73
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v6, v3, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 74
    :goto_17
    iget v6, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    if-ltz v11, :cond_22

    if-ltz v9, :cond_22

    if-eqz p8, :cond_22

    move/from16 p3, v0

    move v13, v12

    goto/16 :goto_1a

    .line 75
    :cond_22
    iget v4, v3, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    if-lez v4, :cond_23

    iget v7, v3, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    if-lez v7, :cond_23

    if-eq v4, v7, :cond_23

    move v7, v0

    goto :goto_18

    :cond_23
    move v7, v5

    :goto_18
    if-eqz v7, :cond_24

    int-to-float v4, v4

    .line 76
    iget v7, v3, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    int-to-float v7, v7

    div-float v20, v4, v7

    :cond_24
    move/from16 v4, v20

    int-to-float v7, v11

    int-to-float v8, v6

    div-float/2addr v7, v8

    float-to-double v12, v7

    .line 77
    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v12

    double-to-int v7, v12

    int-to-float v10, v9

    div-float/2addr v10, v8

    float-to-double v12, v10

    .line 78
    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v12

    double-to-int v8, v12

    int-to-float v7, v7

    mul-float/2addr v7, v4

    .line 79
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    int-to-float v8, v8

    mul-float/2addr v8, v4

    .line 80
    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v13

    const-string v8, "Downsampler"

    const/4 v10, 0x2

    .line 81
    invoke-static {v8, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_25

    const-string v8, "Downsampler"

    .line 82
    iget v10, v3, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    iget v12, v3, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    const/16 v14, 0xc0

    const-string v15, "Calculated target ["

    move/from16 p3, v0

    const-string v0, "x"

    invoke-static {v14, v15, v7, v0, v13}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v14, "] for source ["

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, "x"

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, "], sampleSize: "

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", targetDensity: "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", density: "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", density multiplier: "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_19

    :cond_25
    move/from16 p3, v0

    :goto_19
    move v4, v7

    :goto_1a
    if-lez v4, :cond_28

    if-lez v13, :cond_28

    .line 83
    iget-object v0, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    .line 84
    iget-object v6, v3, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    sget-object v7, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    if-ne v6, v7, :cond_26

    goto :goto_1c

    .line 85
    :cond_26
    iget-object v7, v3, Landroid/graphics/BitmapFactory$Options;->outConfig:Landroid/graphics/Bitmap$Config;

    if-nez v7, :cond_27

    goto :goto_1b

    :cond_27
    move-object v6, v7

    .line 86
    :goto_1b
    invoke-interface {v0, v4, v13, v6}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->getDirty(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, v3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 87
    :cond_28
    :goto_1c
    iget-object v0, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    move-object/from16 v4, p9

    invoke-static {v2, v3, v4, v0}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->decodeStream(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 88
    iget-object v2, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-interface {v4, v2, v0}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;->onDecodeComplete(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;)V

    const-string v2, "Downsampler"

    const/4 v4, 0x2

    .line 89
    invoke-static {v2, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 90
    invoke-static {v0}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getBitmapString(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object v2

    .line 91
    iget-object v4, v3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-static {v4}, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->getBitmapString(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object v4

    .line 92
    iget v6, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iget v7, v3, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    iget v3, v3, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    .line 93
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v8

    .line 94
    invoke-static/range {v17 .. v18}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v12

    const/16 v10, 0xd0

    invoke-static {v2, v10}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v10

    move-object/from16 v14, v16

    invoke-static {v14, v10}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v10

    invoke-static {v4, v10}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v10

    invoke-static {v8, v10}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v10

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v10, "Decoded "

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " from ["

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, "] "

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " with inBitmap "

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " for ["

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v4, p6

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v2, p7

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "], sample size: "

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", density: "

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", target density: "

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", thread: "

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", duration: "

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v12, v13}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Downsampler"

    .line 95
    invoke-static {v3, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_29
    const/4 v2, 0x0

    if-eqz v0, :cond_2b

    .line 96
    iget-object v2, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-virtual {v0, v2}, Landroid/graphics/Bitmap;->setDensity(I)V

    .line 97
    iget-object v2, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    packed-switch p5, :pswitch_data_2

    goto :goto_1d

    :pswitch_4
    move/from16 v5, p3

    :goto_1d
    if-nez v5, :cond_2a

    move-object v2, v0

    goto :goto_1e

    .line 98
    :cond_2a
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    move/from16 v4, p5

    .line 99
    invoke-static {v4, v3}, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->initializeMatrixForRotation(ILandroid/graphics/Matrix;)V

    .line 100
    new-instance v4, Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    const/4 v7, 0x0

    invoke-direct {v4, v7, v7, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 101
    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 102
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 103
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 104
    invoke-static {v0}, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->getNonNullConfig(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap$Config;

    move-result-object v7

    .line 105
    invoke-interface {v2, v5, v6, v7}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->get(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 106
    iget v5, v4, Landroid/graphics/RectF;->left:F

    neg-float v5, v5

    iget v4, v4, Landroid/graphics/RectF;->top:F

    neg-float v4, v4

    invoke-virtual {v3, v5, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 107
    invoke-static {v0, v2, v3}, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->applyMatrix(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V

    .line 108
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    .line 109
    :goto_1e
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2b

    .line 110
    iget-object v1, v1, Lcom/bumptech/glide/load/resource/bitmap/Downsampler;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-interface {v1, v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->put(Landroid/graphics/Bitmap;)V

    :cond_2b
    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x2
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method
