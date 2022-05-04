.class public Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;
.super Lcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;
.source "SourceFile"


# static fields
.field public static final ID_BYTES:[B


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/bumptech/glide/load/Key;->CHARSET:Ljava/nio/charset/Charset;

    const-string v1, "com.bumptech.glide.load.resource.bitmap.CenterCrop"

    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;->ID_BYTES:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/bitmap/BitmapTransformation;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1
    instance-of p0, p1, Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;

    return p0
.end method

.method public hashCode()I
    .locals 0

    const p0, -0x23bf86f2

    return p0
.end method

.method public transform(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "pool",
            "toTransform",
            "outWidth",
            "outHeight"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->DEFAULT_PAINT:Landroid/graphics/Paint;

    .line 2
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    if-ne p0, p3, :cond_0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    if-ne p0, p4, :cond_0

    goto :goto_1

    .line 3
    :cond_0
    new-instance p0, Landroid/graphics/Matrix;

    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    mul-int/2addr v0, p4

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int/2addr v1, p3

    const/4 v2, 0x0

    const/high16 v3, 0x3f000000    # 0.5f

    if-le v0, v1, :cond_1

    int-to-float v0, p4

    .line 5
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    int-to-float v1, p3

    .line 6
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v0

    sub-float/2addr v1, v4

    mul-float/2addr v1, v3

    move v5, v2

    move v2, v1

    move v1, v5

    goto :goto_0

    :cond_1
    int-to-float v0, p3

    .line 7
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    int-to-float v1, p4

    .line 8
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v0

    sub-float/2addr v1, v4

    mul-float/2addr v1, v3

    .line 9
    :goto_0
    invoke-virtual {p0, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    add-float/2addr v2, v3

    float-to-int v0, v2

    int-to-float v0, v0

    add-float/2addr v1, v3

    float-to-int v1, v1

    int-to-float v1, v1

    .line 10
    invoke-virtual {p0, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 11
    invoke-static {p2}, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->getNonNullConfig(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap$Config;

    move-result-object v0

    invoke-interface {p1, p3, p4, v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;->get(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 12
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result p3

    invoke-virtual {p1, p3}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    .line 13
    invoke-static {p2, p1, p0}, Lcom/bumptech/glide/load/resource/bitmap/TransformationUtils;->applyMatrix(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V

    move-object p2, p1

    :goto_1
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
    sget-object p0, Lcom/bumptech/glide/load/resource/bitmap/CenterCrop;->ID_BYTES:[B

    invoke-virtual {p1, p0}, Ljava/security/MessageDigest;->update([B)V

    return-void
.end method
