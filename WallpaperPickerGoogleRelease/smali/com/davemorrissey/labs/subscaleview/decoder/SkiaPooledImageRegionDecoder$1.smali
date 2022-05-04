.class public Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$1;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public final synthetic this$0:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;


# direct methods
.method public constructor <init>(Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$1;->this$0:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$1;->this$0:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;

    .line 2
    iget-object v1, v0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->decoderPool:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$DecoderPool;

    if-eqz v1, :cond_6

    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v2, v1, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$DecoderPool;->decoders:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 5
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$1;->this$0:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;

    .line 6
    iget-wide v3, v1, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->fileLength:J

    .line 7
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x0

    const/4 v5, 0x4

    if-lt v2, v5, :cond_1

    const-string v2, "No additional decoders allowed, reached hard limit (4)"

    .line 8
    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->debug(Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_1
    int-to-long v5, v2

    mul-long/2addr v5, v3

    const-wide/32 v3, 0x1400000

    cmp-long v3, v5, v3

    if-lez v3, :cond_2

    const-string v2, "No additional encoders allowed, reached hard memory limit (20Mb)"

    .line 9
    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->debug(Ljava/lang/String;)V

    goto :goto_2

    .line 10
    :cond_2
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v3

    if-lt v2, v3, :cond_3

    const-string v2, "No additional encoders allowed, limited by CPU cores ("

    .line 11
    invoke-static {v2}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 12
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v3

    .line 13
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->debug(Ljava/lang/String;)V

    goto :goto_2

    .line 14
    :cond_3
    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->context:Landroid/content/Context;

    const-string v4, "activity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager;

    const/4 v4, 0x1

    if-eqz v3, :cond_4

    .line 15
    new-instance v7, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v7}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 16
    invoke-virtual {v3, v7}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 17
    iget-boolean v3, v7, Landroid/app/ActivityManager$MemoryInfo;->lowMemory:Z

    goto :goto_1

    :cond_4
    move v3, v4

    :goto_1
    if-eqz v3, :cond_5

    const-string v2, "No additional encoders allowed, memory is low"

    .line 18
    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->debug(Ljava/lang/String;)V

    goto :goto_2

    .line 19
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Additional decoder allowed, current count is "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", estimated native memory "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-wide/32 v2, 0x100000

    div-long/2addr v5, v2

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "Mb"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->debug(Ljava/lang/String;)V

    move v1, v4

    :goto_2
    if-eqz v1, :cond_6

    .line 20
    :try_start_1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$1;->this$0:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;

    .line 21
    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->decoderPool:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$DecoderPool;

    if-eqz v0, :cond_0

    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 23
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$1;->this$0:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;

    const-string v3, "Starting decoder"

    .line 24
    invoke-virtual {v2, v3}, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->debug(Ljava/lang/String;)V

    .line 25
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$1;->this$0:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;

    .line 26
    invoke-virtual {v2}, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->initialiseDecoder()V

    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 28
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$1;->this$0:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Started decoder, took "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-long/2addr v2, v0

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 29
    invoke-virtual {v4, v0}, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->debug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    .line 30
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder$1;->this$0:Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;

    const-string v2, "Failed to start decoder: "

    invoke-static {v2}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 31
    invoke-virtual {v1, v0}, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaPooledImageRegionDecoder;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    :catchall_0
    move-exception p0

    .line 32
    monitor-exit v1

    throw p0

    :cond_6
    return-void
.end method
