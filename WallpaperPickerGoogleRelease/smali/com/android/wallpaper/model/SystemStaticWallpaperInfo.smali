.class public Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;
.super Lcom/android/wallpaper/model/WallpaperInfo;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final mActionTypeResId:I

.field public mActionUrl:Ljava/lang/String;

.field public final mActionUrlResId:I

.field public mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

.field public mAttributions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final mCollectionId:Ljava/lang/String;

.field public final mDrawableResId:I

.field public final mPackageName:Ljava/lang/String;

.field public mResources:Landroid/content/res/Resources;

.field public final mSubtitle1ResId:I

.field public final mSubtitle2ResId:I

.field public final mTitleResId:I

.field public final mWallpaperId:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo$1;

    invoke-direct {v0}, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo$1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Lcom/android/wallpaper/model/SystemStaticWallpaperInfo$1;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>(Landroid/os/Parcel;)V

    .line 12
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mPackageName:Ljava/lang/String;

    .line 13
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mWallpaperId:Ljava/lang/String;

    .line 14
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mCollectionId:Ljava/lang/String;

    .line 15
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mDrawableResId:I

    .line 16
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mTitleResId:I

    .line 17
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mSubtitle1ResId:I

    .line 18
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mSubtitle2ResId:I

    .line 19
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionTypeResId:I

    .line 20
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionUrlResId:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mPackageName:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mWallpaperId:Ljava/lang/String;

    .line 4
    iput-object p3, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mCollectionId:Ljava/lang/String;

    .line 5
    iput p4, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mDrawableResId:I

    .line 6
    iput p5, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mTitleResId:I

    .line 7
    iput p6, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mSubtitle1ResId:I

    .line 8
    iput p7, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mSubtitle2ResId:I

    .line 9
    iput p8, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionTypeResId:I

    .line 10
    iput p9, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionUrlResId:I

    return-void
.end method

.method public static fromAttributeSet(Ljava/lang/String;Ljava/lang/String;Landroid/util/AttributeSet;)Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;
    .locals 12

    const/4 v0, 0x0

    const-string v1, "id"

    .line 1
    invoke-interface {p2, v0, v1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const-string v1, "src"

    const/4 v2, 0x0

    .line 3
    invoke-interface {p2, v0, v1, v2}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v6

    const-string v1, "title"

    .line 4
    invoke-interface {p2, v0, v1, v2}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v7

    const-string v1, "subtitle1"

    .line 5
    invoke-interface {p2, v0, v1, v2}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v8

    const-string v1, "subtitle2"

    .line 6
    invoke-interface {p2, v0, v1, v2}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v9

    const-string v1, "actionUrl"

    .line 7
    invoke-interface {p2, v0, v1, v2}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v11

    .line 8
    new-instance p2, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;

    const/4 v10, 0x0

    move-object v2, p2

    move-object v3, p0

    move-object v5, p1

    invoke-direct/range {v2 .. v11}, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIIII)V

    return-object p2
.end method


# virtual methods
.method public getActionIconRes(Landroid/content/Context;)I
    .locals 0

    const p0, 0x7f0800ac

    return p0
.end method

.method public getActionLabelRes(Landroid/content/Context;)I
    .locals 0

    const p0, 0x7f110080

    return p0
.end method

.method public getActionUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionUrl:Ljava/lang/String;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionUrlResId:I

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->getPackageResources(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object p1

    iget v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionUrlResId:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionUrl:Ljava/lang/String;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->getPackageResources(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object p1

    .line 3
    new-instance v0, Lcom/android/wallpaper/asset/SystemStaticAsset;

    iget v1, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mDrawableResId:I

    iget-object v2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mWallpaperId:Ljava/lang/String;

    invoke-direct {v0, p1, v1, v2}, Lcom/android/wallpaper/asset/SystemStaticAsset;-><init>(Landroid/content/res/Resources;ILjava/lang/String;)V

    iput-object v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    return-object p0
.end method

.method public getAttributions(Landroid/content/Context;)Ljava/util/List;
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

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mAttributions:Ljava/util/List;

    if-nez v0, :cond_2

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->getPackageResources(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object p1

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mAttributions:Ljava/util/List;

    .line 4
    iget v1, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mTitleResId:I

    if-eqz v1, :cond_0

    .line 5
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    :cond_0
    iget v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mSubtitle1ResId:I

    if-eqz v0, :cond_1

    .line 7
    iget-object v1, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mAttributions:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    :cond_1
    iget v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mSubtitle2ResId:I

    if-eqz v0, :cond_2

    .line 9
    iget-object v1, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mAttributions:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    :cond_2
    iget-object p0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mAttributions:Ljava/util/List;

    return-object p0
.end method

.method public getCollectionId(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mCollectionId:Ljava/lang/String;

    return-object p0
.end method

.method public final getPackageResources(Landroid/content/Context;)Landroid/content/res/Resources;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mResources:Landroid/content/res/Resources;

    if-eqz v0, :cond_0

    return-object v0

    .line 2
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    iget-object v0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mResources:Landroid/content/res/Resources;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "PartnerStaticWPInfo"

    const-string v0, "Could not get app resources"

    .line 3
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mResources:Landroid/content/res/Resources;

    return-object p0
.end method

.method public getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p0

    return-object p0
.end method

.method public getWallpaperId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mWallpaperId:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 3
    iget-object p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mWallpaperId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    iget-object p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mCollectionId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 5
    iget p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mDrawableResId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 6
    iget p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mTitleResId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 7
    iget p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mSubtitle1ResId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 8
    iget p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mSubtitle2ResId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    iget p2, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionTypeResId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 10
    iget p0, p0, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;->mActionUrlResId:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
