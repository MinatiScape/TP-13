.class public Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TilesInitTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "[I>;"
    }
.end annotation


# instance fields
.field public final contextRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field public decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

.field public final decoderFactoryRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory<",
            "+",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;",
            ">;>;"
        }
    .end annotation
.end field

.field public exception:Ljava/lang/Exception;

.field public final source:Landroid/net/Uri;

.field public final viewRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;",
            "Landroid/content/Context;",
            "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory<",
            "+",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;",
            ">;",
            "Landroid/net/Uri;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->viewRef:Ljava/lang/ref/WeakReference;

    .line 3
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->contextRef:Ljava/lang/ref/WeakReference;

    .line 4
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->decoderFactoryRef:Ljava/lang/ref/WeakReference;

    .line 5
    iput-object p4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->source:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    :try_start_0
    iget-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->source:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->contextRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 4
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->decoderFactoryRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 5
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->viewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    .line 6
    sget-object v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    .line 7
    invoke-interface {v1}, Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;->make()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    .line 8
    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->source:Landroid/net/Uri;

    invoke-interface {v1, v0, v3}, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;->init(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Point;

    move-result-object v1

    .line 9
    iget v3, v1, Landroid/graphics/Point;->x:I

    .line 10
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 11
    invoke-static {v2, v0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$5200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x3

    new-array v0, v0, [I

    const/4 v2, 0x0

    aput v3, v0, v2

    const/4 v2, 0x1

    aput v1, v0, v2

    const/4 v1, 0x2

    aput p1, v0, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 12
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    const-string v0, "SubsamplingScaleImageView"

    const-string v1, "Failed to initialise bitmap decoder"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 13
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->exception:Ljava/lang/Exception;

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 6

    .line 1
    check-cast p1, [I

    .line 2
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->viewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    if-eqz v0, :cond_5

    .line 3
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    if-eqz v1, :cond_4

    if-eqz p1, :cond_4

    array-length v2, p1

    const/4 v3, 0x3

    if-ne v2, v3, :cond_4

    const/4 p0, 0x0

    .line 4
    aget v2, p1, p0

    const/4 v3, 0x1

    aget v3, p1, v3

    const/4 v4, 0x2

    aget p1, p1, v4

    sget-object v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget v4, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v4, :cond_2

    iget v5, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v5, :cond_2

    if-ne v4, v2, :cond_0

    if-eq v5, v3, :cond_2

    .line 7
    :cond_0
    invoke-virtual {v0, p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 8
    iget-object v4, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_2

    .line 9
    iget-boolean v5, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v5, :cond_1

    .line 10
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    :cond_1
    const/4 v4, 0x0

    .line 11
    iput-object v4, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 12
    iput-boolean p0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 13
    iput-boolean p0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 14
    :cond_2
    iput-object v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    .line 15
    iput v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 16
    iput v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 17
    iput p1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 18
    invoke-virtual {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    .line 19
    invoke-virtual {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkImageLoaded()Z

    move-result p0

    if-nez p0, :cond_3

    iget p0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTileWidth:I

    if-lez p0, :cond_3

    const p1, 0x7fffffff

    if-eq p0, p1, :cond_3

    iget p0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTileHeight:I

    if-lez p0, :cond_3

    if-eq p0, p1, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result p0

    if-lez p0, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result p0

    if-lez p0, :cond_3

    .line 20
    new-instance p0, Landroid/graphics/Point;

    iget p1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTileWidth:I

    iget v1, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTileHeight:I

    invoke-direct {p0, p1, v1}, Landroid/graphics/Point;-><init>(II)V

    invoke-virtual {v0, p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->initialiseBaseLayer(Landroid/graphics/Point;)V

    .line 21
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 22
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0

    .line 24
    :cond_4
    iget-object p0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;->exception:Ljava/lang/Exception;

    if-eqz p0, :cond_5

    sget-object p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    :cond_5
    :goto_0
    return-void
.end method
