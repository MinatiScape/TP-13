.class public Lcom/bumptech/glide/load/resource/gif/GifDrawableResource;
.super Lcom/bumptech/glide/load/resource/drawable/DrawableResource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/load/resource/drawable/DrawableResource<",
        "Lcom/bumptech/glide/load/resource/gif/GifDrawable;",
        ">;",
        "Lcom/bumptech/glide/load/engine/Initializable;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/resource/gif/GifDrawable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "drawable"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/resource/drawable/DrawableResource;-><init>(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public getResourceClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/bumptech/glide/load/resource/gif/GifDrawable;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    return-object p0
.end method

.method public getSize()I
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/drawable/DrawableResource;->drawable:Landroid/graphics/drawable/Drawable;

    check-cast p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    .line 2
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;->state:Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;

    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    .line 3
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->gifDecoder:Lcom/bumptech/glide/gifdecoder/GifDecoder;

    invoke-interface {v0}, Lcom/bumptech/glide/gifdecoder/GifDecoder;->getByteSize()I

    move-result v0

    .line 4
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getCurrentFrame()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getCurrentFrame()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .line 5
    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getCurrentFrame()Landroid/graphics/Bitmap;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p0

    .line 6
    invoke-static {v1, v2, p0}, Lcom/bumptech/glide/util/Util;->getBitmapByteSize(IILandroid/graphics/Bitmap$Config;)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public initialize()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/drawable/DrawableResource;->drawable:Landroid/graphics/drawable/Drawable;

    check-cast p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/GifDrawable;->getFirstFrame()Landroid/graphics/Bitmap;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->prepareToDraw()V

    return-void
.end method

.method public recycle()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/drawable/DrawableResource;->drawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifDrawable;->stop()V

    .line 2
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/drawable/DrawableResource;->drawable:Landroid/graphics/drawable/Drawable;

    check-cast p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;->isRecycled:Z

    .line 4
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;->state:Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;

    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    .line 5
    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->callbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 6
    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->firstFrame:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 7
    iget-object v3, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    invoke-interface {v3, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->put(Landroid/graphics/Bitmap;)V

    .line 8
    iput-object v2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->firstFrame:Landroid/graphics/Bitmap;

    :cond_0
    const/4 v1, 0x0

    .line 9
    iput-boolean v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->isRunning:Z

    .line 10
    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->current:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    if-eqz v1, :cond_1

    .line 11
    iget-object v3, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->requestManager:Lcom/bumptech/glide/RequestManager;

    invoke-virtual {v3, v1}, Lcom/bumptech/glide/RequestManager;->clear(Lcom/bumptech/glide/request/target/Target;)V

    .line 12
    iput-object v2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->current:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    .line 13
    :cond_1
    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->next:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    if-eqz v1, :cond_2

    .line 14
    iget-object v3, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->requestManager:Lcom/bumptech/glide/RequestManager;

    invoke-virtual {v3, v1}, Lcom/bumptech/glide/RequestManager;->clear(Lcom/bumptech/glide/request/target/Target;)V

    .line 15
    iput-object v2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->next:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    .line 16
    :cond_2
    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->pendingTarget:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    if-eqz v1, :cond_3

    .line 17
    iget-object v3, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->requestManager:Lcom/bumptech/glide/RequestManager;

    invoke-virtual {v3, v1}, Lcom/bumptech/glide/RequestManager;->clear(Lcom/bumptech/glide/request/target/Target;)V

    .line 18
    iput-object v2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->pendingTarget:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    .line 19
    :cond_3
    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->gifDecoder:Lcom/bumptech/glide/gifdecoder/GifDecoder;

    invoke-interface {v1}, Lcom/bumptech/glide/gifdecoder/GifDecoder;->clear()V

    .line 20
    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->isCleared:Z

    return-void
.end method
