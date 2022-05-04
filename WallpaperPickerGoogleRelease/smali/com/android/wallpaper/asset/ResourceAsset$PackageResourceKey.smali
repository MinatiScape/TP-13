.class public Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/Key;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/ResourceAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PackageResourceKey"
.end annotation


# instance fields
.field public mPackageName:Ljava/lang/String;

.field public mResId:I


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;->mPackageName:Ljava/lang/String;

    .line 3
    iput p2, p0, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;->mResId:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;->getCacheKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;->getCacheKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public getCacheKey()Ljava/lang/String;
    .locals 2

    const-string v0, "PackageResourceKey{packageName="

    .line 1
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",resId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;->mResId:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;->getCacheKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;->getCacheKey()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public updateDiskCacheKey(Ljava/security/MessageDigest;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;->getCacheKey()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/bumptech/glide/load/Key;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/security/MessageDigest;->update([B)V

    return-void
.end method
