.class public Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;
.super Lcom/android/wallpaper/model/WallpaperInfo;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mAsset:Lcom/android/wallpaper/asset/FileAsset;

.field public mFetchedSystemLegacyDir:Z

.field public mFullName:Ljava/lang/String;

.field public mSystemLegacyDir:Ljava/io/File;

.field public mThumbAsset:Lcom/android/wallpaper/asset/FileAsset;

.field public mThumbName:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo$1;

    invoke-direct {v0}, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo$1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo$1;)V
    .locals 0

    .line 4
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>(Landroid/os/Parcel;)V

    .line 5
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mThumbName:Ljava/lang/String;

    .line 6
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mFullName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mThumbName:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mFullName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/FileAsset;

    if-nez v0, :cond_1

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->getSystemLegacyDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 3
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mFullName:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object p1, v0

    .line 4
    :goto_0
    new-instance v0, Lcom/android/wallpaper/asset/FileAsset;

    invoke-direct {v0, p1}, Lcom/android/wallpaper/asset/FileAsset;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/FileAsset;

    .line 5
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/FileAsset;

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

    const v0, 0x7f1100f2

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

.method public final getSystemLegacyDir(Landroid/content/Context;)Ljava/io/File;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mFetchedSystemLegacyDir:Z

    if-nez v0, :cond_0

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getPartnerProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/PartnerProvider;

    move-result-object p1

    .line 3
    check-cast p1, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    invoke-virtual {p1}, Lcom/android/wallpaper/module/DefaultPartnerProvider;->getLegacyWallpaperDirectory()Ljava/io/File;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mSystemLegacyDir:Ljava/io/File;

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mFetchedSystemLegacyDir:Z

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mSystemLegacyDir:Ljava/io/File;

    return-object p0
.end method

.method public getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/FileAsset;

    if-nez v0, :cond_1

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->getSystemLegacyDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 3
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mThumbName:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object p1, v0

    .line 4
    :goto_0
    new-instance v0, Lcom/android/wallpaper/asset/FileAsset;

    invoke-direct {v0, p1}, Lcom/android/wallpaper/asset/FileAsset;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/FileAsset;

    .line 5
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/FileAsset;

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
    iget-object p2, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mThumbName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/model/LegacyPartnerWallpaperInfo;->mFullName:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
