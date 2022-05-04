.class public Lcom/google/android/apps/wallpaper/model/GoogleLiveWallpaperInfo;
.super Lcom/android/wallpaper/model/LiveWallpaperInfo;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/apps/wallpaper/model/GoogleLiveWallpaperInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/model/GoogleLiveWallpaperInfo$1;

    invoke-direct {v0}, Lcom/google/android/apps/wallpaper/model/GoogleLiveWallpaperInfo$1;-><init>()V

    sput-object v0, Lcom/google/android/apps/wallpaper/model/GoogleLiveWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/app/WallpaperInfo;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1
    invoke-direct {p0, p1, v0, v1}, Lcom/android/wallpaper/model/LiveWallpaperInfo;-><init>(Landroid/app/WallpaperInfo;ZLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/WallpaperInfo;ZLjava/lang/String;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/wallpaper/model/LiveWallpaperInfo;-><init>(Landroid/app/WallpaperInfo;ZLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 3
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/LiveWallpaperInfo;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;

    if-nez v0, :cond_2

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    .line 3
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getServiceInfo()Landroid/content/pm/ServiceInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4
    iget-object v0, v0, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    const-string v1, "android.service.wallpaper.thumbnail"

    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 6
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 7
    new-instance v1, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;

    iget-object v2, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    invoke-direct {v1, p1, v2, v0}, Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;-><init>(Landroid/content/Context;Landroid/app/WallpaperInfo;Landroid/net/Uri;)V

    iput-object v1, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;

    goto :goto_1

    .line 8
    :cond_1
    new-instance v0, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset;

    iget-object v1, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    invoke-direct {v0, p1, v1}, Lcom/google/android/apps/wallpaper/asset/GoogleLiveWallpaperThumbAsset;-><init>(Landroid/content/Context;Landroid/app/WallpaperInfo;)V

    iput-object v0, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;

    .line 9
    :cond_2
    :goto_1
    iget-object p0, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/LiveWallpaperThumbAsset;

    return-object p0
.end method
