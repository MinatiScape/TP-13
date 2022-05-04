.class public final Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/Key;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveWallpaperThumbKey"
.end annotation


# instance fields
.field public mInfo:Landroid/app/WallpaperInfo;


# direct methods
.method public constructor <init>(Landroid/app/WallpaperInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;->mInfo:Landroid/app/WallpaperInfo;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 2
    :cond_0
    check-cast p1, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;->getCacheKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;->getCacheKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final getCacheKey()Ljava/lang/String;
    .locals 2

    const-string v0, "LiveWallpaperThumbKey{packageName="

    .line 1
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;->mInfo:Landroid/app/WallpaperInfo;

    .line 2
    invoke-virtual {v1}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",serviceName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;->mInfo:Landroid/app/WallpaperInfo;

    .line 3
    invoke-virtual {p0}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;->getCacheKey()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;->getCacheKey()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public updateDiskCacheKey(Ljava/security/MessageDigest;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset$LiveWallpaperThumbKey;->getCacheKey()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/bumptech/glide/load/Key;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/security/MessageDigest;->update([B)V

    return-void
.end method
