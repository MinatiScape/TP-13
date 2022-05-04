.class public final Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/Resource;
.implements Lcom/bumptech/glide/load/engine/Initializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/Resource<",
        "Landroid/graphics/drawable/BitmapDrawable;",
        ">;",
        "Lcom/bumptech/glide/load/engine/Initializable;"
    }
.end annotation


# instance fields
.field public final bitmapResource:Lcom/bumptech/glide/load/engine/Resource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/Resource<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public final resources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/engine/Resource;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "resources",
            "bitmapResource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "Lcom/bumptech/glide/load/engine/Resource<",
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
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;->resources:Landroid/content/res/Resources;

    .line 4
    iput-object p2, p0, Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;->bitmapResource:Lcom/bumptech/glide/load/engine/Resource;

    return-void
.end method

.method public static obtain(Landroid/content/res/Resources;Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/engine/Resource;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "resources",
            "bitmapResource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/load/engine/Resource<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1
    :cond_0
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;

    invoke-direct {v0, p0, p1}, Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;-><init>(Landroid/content/res/Resources;Lcom/bumptech/glide/load/engine/Resource;)V

    return-object v0
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v1, p0, Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;->resources:Landroid/content/res/Resources;

    iget-object p0, p0, Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;->bitmapResource:Lcom/bumptech/glide/load/engine/Resource;

    invoke-interface {p0}, Lcom/bumptech/glide/load/engine/Resource;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Bitmap;

    invoke-direct {v0, v1, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v0
.end method

.method public getResourceClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Landroid/graphics/drawable/BitmapDrawable;

    return-object p0
.end method

.method public getSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;->bitmapResource:Lcom/bumptech/glide/load/engine/Resource;

    invoke-interface {p0}, Lcom/bumptech/glide/load/engine/Resource;->getSize()I

    move-result p0

    return p0
.end method

.method public initialize()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;->bitmapResource:Lcom/bumptech/glide/load/engine/Resource;

    instance-of v0, p0, Lcom/bumptech/glide/load/engine/Initializable;

    if-eqz v0, :cond_0

    .line 2
    check-cast p0, Lcom/bumptech/glide/load/engine/Initializable;

    invoke-interface {p0}, Lcom/bumptech/glide/load/engine/Initializable;->initialize()V

    :cond_0
    return-void
.end method

.method public recycle()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;->bitmapResource:Lcom/bumptech/glide/load/engine/Resource;

    invoke-interface {p0}, Lcom/bumptech/glide/load/engine/Resource;->recycle()V

    return-void
.end method
