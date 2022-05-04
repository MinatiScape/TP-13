.class public Lcom/android/wallpaper/model/ImageWallpaperInfo;
.super Lcom/android/wallpaper/model/WallpaperInfo;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/wallpaper/model/ImageWallpaperInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXIF_TAGS:[Ljava/lang/String;


# instance fields
.field public mAsset:Lcom/android/wallpaper/asset/ContentUriAsset;

.field public mIsAssetUncached:Z

.field public mUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/wallpaper/model/ImageWallpaperInfo$1;

    invoke-direct {v0}, Lcom/android/wallpaper/model/ImageWallpaperInfo$1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    const-string v0, "ImageDescription"

    const-string v1, "Artist"

    const-string v2, "DateTimeOriginal"

    const-string v3, "Model"

    .line 2
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->EXIF_TAGS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mUri:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Z)V
    .locals 0

    .line 3
    invoke-direct {p0}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mUri:Landroid/net/Uri;

    .line 5
    iput-boolean p2, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mIsAssetUncached:Z

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>(Landroid/os/Parcel;)V

    .line 7
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mUri:Landroid/net/Uri;

    return-void
.end method

.method public static getGenericAttributions(Landroid/content/Context;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f1100e9

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    aput-object p0, v0, v1

    .line 2
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mIsAssetUncached:Z

    if-eqz v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/asset/ContentUriAsset;

    iget-object v1, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mUri:Landroid/net/Uri;

    const/4 v2, 0x1

    invoke-direct {v0, p1, v1, v2}, Lcom/android/wallpaper/asset/ContentUriAsset;-><init>(Landroid/content/Context;Landroid/net/Uri;Z)V

    iput-object v0, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ContentUriAsset;

    goto :goto_0

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ContentUriAsset;

    if-nez v0, :cond_1

    .line 4
    new-instance v0, Lcom/android/wallpaper/asset/ContentUriAsset;

    iget-object v1, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mUri:Landroid/net/Uri;

    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, p1, v1, v2}, Lcom/android/wallpaper/asset/ContentUriAsset;-><init>(Landroid/content/Context;Landroid/net/Uri;Z)V

    .line 6
    iput-object v0, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ContentUriAsset;

    .line 7
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ContentUriAsset;

    return-object p0
.end method

.method public getAttributions(Landroid/content/Context;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/ImageWallpaperInfo;->getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/asset/ContentUriAsset;

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ContentUriAsset;->isJpeg()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    invoke-static {p1}, Lcom/android/wallpaper/model/ImageWallpaperInfo;->getGenericAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 4
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 5
    sget-object v1, Lcom/android/wallpaper/model/ImageWallpaperInfo;->EXIF_TAGS:[Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_7

    aget-object v4, v1, v3

    .line 6
    invoke-virtual {p0}, Lcom/android/wallpaper/asset/ContentUriAsset;->ensureExifInterface()V

    .line 7
    iget-object v5, p0, Lcom/android/wallpaper/asset/ContentUriAsset;->mExifCompat:Lcom/android/wallpaper/asset/ExifInterfaceCompat;

    const/4 v6, 0x0

    if-nez v5, :cond_1

    const-string v5, "ContentUriAsset"

    const-string v7, "Unable to read EXIF tags for content URI asset"

    .line 8
    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 9
    :cond_1
    iget-object v7, v5, Lcom/android/wallpaper/asset/ExifInterfaceCompat;->mFrameworkExifInterface:Landroid/media/ExifInterface;

    if-eqz v7, :cond_2

    .line 10
    invoke-virtual {v7, v4}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 11
    :cond_2
    iget-object v5, v5, Lcom/android/wallpaper/asset/ExifInterfaceCompat;->mSupportExifInterface:Landroidx/exifinterface/media/ExifInterface;

    invoke-virtual {v5, v4}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_1
    if-eqz v5, :cond_4

    .line 12
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_3

    goto :goto_2

    .line 13
    :cond_3
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    :cond_4
    :goto_2
    if-nez v6, :cond_5

    goto :goto_4

    :cond_5
    const-string v5, "DateTimeOriginal"

    if-ne v4, v5, :cond_6

    .line 14
    :try_start_0
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyy:MM:dd HH:mm:ss"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    .line 15
    invoke-static {}, Ljava/text/SimpleDateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v6, v4

    goto :goto_3

    :catch_0
    move-exception v4

    const-string v5, "ImageWallpaperInfo"

    const-string v7, "Unable to parse image datetime"

    .line 16
    invoke-static {v5, v7, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 17
    :cond_6
    :goto_3
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 18
    :cond_7
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_8

    return-object v0

    .line 19
    :cond_8
    invoke-static {p1}, Lcom/android/wallpaper/model/ImageWallpaperInfo;->getGenericAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getCollectionId(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    const p0, 0x7f11009e

    .line 1
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/ImageWallpaperInfo;->getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p0

    return-object p0
.end method

.method public getTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mUri:Landroid/net/Uri;

    return-object p0
.end method

.method public showPreview(Landroid/app/Activity;Lcom/android/wallpaper/model/InlinePreviewIntentFactory;I)V
    .locals 0

    .line 1
    invoke-interface {p2, p1, p0}, Lcom/android/wallpaper/model/InlinePreviewIntentFactory;->newIntent(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p1, p0, p3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget p2, p0, Lcom/android/wallpaper/model/WallpaperInfo;->mPlaceholderColor:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mUri:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
