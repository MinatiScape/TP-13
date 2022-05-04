.class public Lcom/android/wallpaper/model/PartnerWallpaperInfo;
.super Lcom/android/wallpaper/model/WallpaperInfo;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/wallpaper/model/PartnerWallpaperInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

.field public mFetchedPartnerResources:Z

.field public mFullRes:I

.field public mPartnerResources:Landroid/content/res/Resources;

.field public mThumbAsset:Lcom/android/wallpaper/asset/ResourceAsset;

.field public mThumbRes:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/model/PartnerWallpaperInfo$1;

    invoke-direct {v0}, Lcom/android/wallpaper/model/PartnerWallpaperInfo$1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>()V

    .line 2
    iput p1, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mThumbRes:I

    .line 3
    iput p2, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mFullRes:I

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Lcom/android/wallpaper/model/PartnerWallpaperInfo$1;)V
    .locals 0

    .line 4
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>(Landroid/os/Parcel;)V

    .line 5
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mThumbRes:I

    .line 6
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mFullRes:I

    return-void
.end method


# virtual methods
.method public getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->getPartnerResources(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object p1

    .line 3
    new-instance v0, Lcom/android/wallpaper/asset/ResourceAsset;

    iget v1, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mFullRes:I

    invoke-direct {v0, p1, v1}, Lcom/android/wallpaper/asset/ResourceAsset;-><init>(Landroid/content/res/Resources;I)V

    iput-object v0, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

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

.method public final getPartnerResources(Landroid/content/Context;)Landroid/content/res/Resources;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mFetchedPartnerResources:Z

    if-nez v0, :cond_0

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getPartnerProvider(Landroid/content/Context;)Lcom/android/wallpaper/module/PartnerProvider;

    move-result-object p1

    .line 3
    check-cast p1, Lcom/android/wallpaper/module/DefaultPartnerProvider;

    .line 4
    iget-object p1, p1, Lcom/android/wallpaper/module/DefaultPartnerProvider;->mResources:Landroid/content/res/Resources;

    .line 5
    iput-object p1, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mPartnerResources:Landroid/content/res/Resources;

    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mFetchedPartnerResources:Z

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mPartnerResources:Landroid/content/res/Resources;

    return-object p0
.end method

.method public getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->getPartnerResources(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object p1

    .line 3
    new-instance v0, Lcom/android/wallpaper/asset/ResourceAsset;

    iget v1, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mThumbRes:I

    invoke-direct {v0, p1, v1}, Lcom/android/wallpaper/asset/ResourceAsset;-><init>(Landroid/content/res/Resources;I)V

    iput-object v0, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/ResourceAsset;

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
    iget p2, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mThumbRes:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 3
    iget p0, p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;->mFullRes:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
