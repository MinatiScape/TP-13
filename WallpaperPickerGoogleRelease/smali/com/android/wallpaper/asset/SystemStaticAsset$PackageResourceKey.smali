.class public Lcom/android/wallpaper/asset/SystemStaticAsset$PackageResourceKey;
.super Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/asset/SystemStaticAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PackageResourceKey"
.end annotation


# instance fields
.field public mResName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;-><init>(Landroid/content/res/Resources;I)V

    .line 2
    iput-object p3, p0, Lcom/android/wallpaper/asset/SystemStaticAsset$PackageResourceKey;->mResName:Ljava/lang/String;

    return-void
.end method


# virtual methods
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

    iget v1, p0, Lcom/android/wallpaper/asset/ResourceAsset$PackageResourceKey;->mResId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",resName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/android/wallpaper/asset/SystemStaticAsset$PackageResourceKey;->mResName:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
