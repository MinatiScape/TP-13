.class public Lcom/android/wallpaper/model/DefaultWallpaperInfo;
.super Lcom/android/wallpaper/model/WallpaperInfo;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/wallpaper/model/DefaultWallpaperInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mAsset:Lcom/android/wallpaper/asset/Asset;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/model/DefaultWallpaperInfo$1;

    invoke-direct {v0}, Lcom/android/wallpaper/model/DefaultWallpaperInfo$1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/model/DefaultWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Lcom/android/wallpaper/model/DefaultWallpaperInfo$1;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/DefaultWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/Asset;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;

    invoke-direct {v0, p1}, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/wallpaper/model/DefaultWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/Asset;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/DefaultWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/Asset;

    return-object p0
.end method

.method public getAttributions(Landroid/content/Context;)Ljava/util/List;
    .locals 1
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

    const/4 p0, 0x1

    new-array p0, p0, [Ljava/lang/String;

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f110086

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    aput-object p1, p0, v0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getBackupPermission()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getCollectionId(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    const p0, 0x7f1100f1

    .line 1
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/DefaultWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/Asset;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;

    invoke-direct {v0, p1}, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/wallpaper/model/DefaultWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/Asset;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/DefaultWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/Asset;

    return-object p0
.end method

.method public getWallpaperId()Ljava/lang/String;
    .locals 0

    const-string p0, "built-in-wallpaper"

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
    iget p0, p0, Lcom/android/wallpaper/model/WallpaperInfo;->mPlaceholderColor:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
