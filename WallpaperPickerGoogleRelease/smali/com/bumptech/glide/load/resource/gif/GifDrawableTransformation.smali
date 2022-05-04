.class public Lcom/bumptech/glide/load/resource/gif/GifDrawableTransformation;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/Transformation;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/Transformation<",
        "Lcom/bumptech/glide/load/resource/gif/GifDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field public final wrapped:Lcom/bumptech/glide/load/Transformation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/Transformation<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/Transformation;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "wrapped"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Transformation<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Argument must not be null"

    .line 2
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawableTransformation;->wrapped:Lcom/bumptech/glide/load/Transformation;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/bumptech/glide/load/resource/gif/GifDrawableTransformation;

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/bumptech/glide/load/resource/gif/GifDrawableTransformation;

    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawableTransformation;->wrapped:Lcom/bumptech/glide/load/Transformation;

    iget-object p1, p1, Lcom/bumptech/glide/load/resource/gif/GifDrawableTransformation;->wrapped:Lcom/bumptech/glide/load/Transformation;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawableTransformation;->wrapped:Lcom/bumptech/glide/load/Transformation;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public transform(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Resource;II)Lcom/bumptech/glide/load/engine/Resource;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "resource",
            "outWidth",
            "outHeight"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "Lcom/bumptech/glide/load/resource/gif/GifDrawable;",
            ">;II)",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "Lcom/bumptech/glide/load/resource/gif/GifDrawable;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Lcom/bumptech/glide/load/engine/Resource;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    .line 2
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object v1

    .line 3
    iget-object v1, v1, Lcom/bumptech/glide/Glide;->bitmapPool:Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;

    .line 4
    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifDrawable;->getFirstFrame()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 5
    new-instance v3, Lcom/bumptech/glide/load/resource/bitmap/BitmapResource;

    invoke-direct {v3, v2, v1}, Lcom/bumptech/glide/load/resource/bitmap/BitmapResource;-><init>(Landroid/graphics/Bitmap;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    .line 6
    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawableTransformation;->wrapped:Lcom/bumptech/glide/load/Transformation;

    invoke-interface {v1, p1, v3, p3, p4}, Lcom/bumptech/glide/load/Transformation;->transform(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Resource;II)Lcom/bumptech/glide/load/engine/Resource;

    move-result-object p1

    .line 7
    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_0

    .line 8
    invoke-virtual {v3}, Lcom/bumptech/glide/load/resource/bitmap/BitmapResource;->recycle()V

    .line 9
    :cond_0
    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/Resource;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    .line 10
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawableTransformation;->wrapped:Lcom/bumptech/glide/load/Transformation;

    .line 11
    iget-object p3, v0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;->state:Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;

    iget-object p3, p3, Lcom/bumptech/glide/load/resource/gif/GifDrawable$GifState;->frameLoader:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;

    invoke-virtual {p3, p0, p1}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->setFrameTransformation(Lcom/bumptech/glide/load/Transformation;Landroid/graphics/Bitmap;)V

    return-object p2
.end method

.method public updateDiskCacheKey(Ljava/security/MessageDigest;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "messageDigest"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/gif/GifDrawableTransformation;->wrapped:Lcom/bumptech/glide/load/Transformation;

    invoke-interface {p0, p1}, Lcom/bumptech/glide/load/Key;->updateDiskCacheKey(Ljava/security/MessageDigest;)V

    return-void
.end method
