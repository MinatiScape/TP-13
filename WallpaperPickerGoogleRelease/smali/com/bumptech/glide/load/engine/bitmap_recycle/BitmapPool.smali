.class public interface abstract Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract clearMemory()V
.end method

.method public abstract get(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "width",
            "height",
            "config"
        }
    .end annotation
.end method

.method public abstract getDirty(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "width",
            "height",
            "config"
        }
    .end annotation
.end method

.method public abstract put(Landroid/graphics/Bitmap;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bitmap"
        }
    .end annotation
.end method

.method public abstract setSizeMultiplier(F)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sizeMultiplier"
        }
    .end annotation
.end method

.method public abstract trimMemory(I)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "level"
        }
    .end annotation
.end method
