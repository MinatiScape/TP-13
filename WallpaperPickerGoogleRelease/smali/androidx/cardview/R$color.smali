.class public Landroidx/cardview/R$color;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static calculateInSampleSize(IIII)I
    .locals 2

    .line 1
    div-int/lit8 p1, p1, 0x2

    .line 2
    div-int/lit8 p0, p0, 0x2

    const/4 v0, 0x0

    :goto_0
    shr-int v1, p1, v0

    if-lt v1, p3, :cond_0

    shr-int v1, p0, v0

    if-lt v1, p2, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    shl-int/2addr p0, v0

    return p0
.end method

.method public static generateHashCode(Landroid/graphics/Bitmap;)J
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 2
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-long v2, v0

    const-wide/16 v4, 0x20f

    add-long/2addr v4, v2

    const-wide/16 v2, 0x1f

    mul-long/2addr v4, v2

    int-to-long v6, v1

    add-long/2addr v4, v6

    const/4 v6, 0x0

    move v7, v6

    :goto_0
    if-ge v7, v0, :cond_1

    move v8, v6

    :goto_1
    if-ge v8, v1, :cond_0

    mul-long/2addr v4, v2

    .line 3
    invoke-virtual {p0, v7, v8}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v9

    int-to-long v9, v9

    add-long/2addr v4, v9

    mul-int/lit8 v8, v8, 0x2

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_0
    mul-int/lit8 v7, v7, 0x2

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_1
    return-wide v4
.end method

.method public static getCollectionId(Landroid/content/Intent;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0}, Landroidx/cardview/R$color;->isDeepLink(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p0

    const-string v0, "collection_id"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static isDeepLink(Landroid/content/Intent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {p0}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object p0

    const-string v0, "//g.co/wallpaper"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
