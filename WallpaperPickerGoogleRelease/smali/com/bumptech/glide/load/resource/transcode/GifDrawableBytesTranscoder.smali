.class public Lcom/bumptech/glide/load/resource/transcode/GifDrawableBytesTranscoder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder<",
        "Lcom/bumptech/glide/load/resource/gif/GifDrawable;",
        "[B>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public transcode(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "toTranscode",
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "Lcom/bumptech/glide/load/resource/gif/GifDrawable;",
            ">;",
            "Lcom/bumptech/glide/load/Options;",
            ")",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "[B>;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/Resource;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    .line 2
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;->state:Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;

    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->gifDecoder:Lcom/bumptech/glide/gifdecoder/GifDecoder;

    invoke-interface {p0}, Lcom/bumptech/glide/gifdecoder/GifDecoder;->getData()Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 4
    new-instance p1, Lcom/bumptech/glide/load/resource/bytes/BytesResource;

    sget p2, Lcom/bumptech/glide/util/ByteBufferUtil;->$r8$clinit:I

    .line 5
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->isReadOnly()Z

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 6
    new-instance p2, Lcom/bumptech/glide/util/ByteBufferUtil$SafeArray;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-direct {p2, v0, v1, v2}, Lcom/bumptech/glide/util/ByteBufferUtil$SafeArray;-><init>([BII)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_1

    .line 7
    iget v0, p2, Lcom/bumptech/glide/util/ByteBufferUtil$SafeArray;->offset:I

    if-nez v0, :cond_1

    iget v0, p2, Lcom/bumptech/glide/util/ByteBufferUtil$SafeArray;->limit:I

    iget-object p2, p2, Lcom/bumptech/glide/util/ByteBufferUtil$SafeArray;->data:[B

    array-length p2, p2

    if-ne v0, p2, :cond_1

    .line 8
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    goto :goto_1

    .line 9
    :cond_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result p2

    new-array p2, p2, [B

    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 12
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    move-object p0, p2

    .line 13
    :goto_1
    invoke-direct {p1, p0}, Lcom/bumptech/glide/load/resource/bytes/BytesResource;-><init>([B)V

    return-object p1
.end method
