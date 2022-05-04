.class public Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;
.super Lcom/android/wallpaper/model/WallpaperInfo;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mActionType:I

.field public mActionUrl:Ljava/lang/String;

.field public mAttributions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mBaseImageUrl:Ljava/lang/String;

.field public mCollectionId:Ljava/lang/String;

.field public mDesktopAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

.field public mDesktopImageUrl:Landroid/net/Uri;

.field public mFullAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

.field public mFullImageUrl:Landroid/net/Uri;

.field public mThumbAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

.field public mThumbImageUrl:Landroid/net/Uri;

.field public mTinyThumbImageUrl:Landroid/net/Uri;

.field public mWallpaperId:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo$1;

    invoke-direct {v0}, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo$1;-><init>()V

    sput-object v0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo$1;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>(Landroid/os/Parcel;)V

    .line 13
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mBaseImageUrl:Ljava/lang/String;

    .line 14
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mFullImageUrl:Landroid/net/Uri;

    .line 15
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mThumbImageUrl:Landroid/net/Uri;

    .line 16
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mTinyThumbImageUrl:Landroid/net/Uri;

    .line 17
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mDesktopImageUrl:Landroid/net/Uri;

    .line 18
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mAttributions:Ljava/util/List;

    .line 19
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mActionUrl:Ljava/lang/String;

    .line 20
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mCollectionId:Ljava/lang/String;

    .line 21
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mWallpaperId:Ljava/lang/String;

    .line 22
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mActionType:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Landroid/net/Uri;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Landroid/net/Uri;",
            "Landroid/net/Uri;",
            "Landroid/net/Uri;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mBaseImageUrl:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mFullImageUrl:Landroid/net/Uri;

    .line 4
    iput-object p3, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mThumbImageUrl:Landroid/net/Uri;

    .line 5
    iput-object p4, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mTinyThumbImageUrl:Landroid/net/Uri;

    .line 6
    iput-object p5, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mDesktopImageUrl:Landroid/net/Uri;

    .line 7
    iput-object p6, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mAttributions:Ljava/util/List;

    .line 8
    iput-object p7, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mActionUrl:Ljava/lang/String;

    .line 9
    iput-object p8, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mCollectionId:Ljava/lang/String;

    .line 10
    iput-object p9, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mWallpaperId:Ljava/lang/String;

    .line 11
    iput p10, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mActionType:I

    return-void
.end method


# virtual methods
.method public getActionIconRes(Landroid/content/Context;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mActionType:I

    invoke-static {p0}, Landroidx/core/R$id;->getActionIconForType(I)I

    move-result p0

    return p0
.end method

.method public getActionLabelRes(Landroid/content/Context;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mActionType:I

    invoke-static {p0}, Landroidx/core/R$id;->getActionLabelForType(I)I

    move-result p0

    return p0
.end method

.method public getActionUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mActionUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mFullAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mFullImageUrl:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mTinyThumbImageUrl:Landroid/net/Uri;

    invoke-direct {v0, p1, v1, v2}, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;)V

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mFullAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mFullAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    return-object p0
.end method

.method public getAttributions(Landroid/content/Context;)Ljava/util/List;
    .locals 0
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
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mAttributions:Ljava/util/List;

    return-object p0
.end method

.method public getBaseImageUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mBaseImageUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getCollectionId(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mCollectionId:Ljava/lang/String;

    return-object p0
.end method

.method public getDesktopAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mDesktopAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mDesktopImageUrl:Landroid/net/Uri;

    invoke-direct {v0, p1, v1}, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mDesktopAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mDesktopAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    return-object p0
.end method

.method public getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mThumbAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mThumbImageUrl:Landroid/net/Uri;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mTinyThumbImageUrl:Landroid/net/Uri;

    invoke-direct {v0, p1, v1, v2}, Lcom/google/android/apps/wallpaper/asset/NetworkAsset;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;)V

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mThumbAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mThumbAsset:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    return-object p0
.end method

.method public getWallpaperId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mWallpaperId:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mBaseImageUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 3
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mFullImageUrl:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mThumbImageUrl:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 5
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mTinyThumbImageUrl:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 6
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mDesktopImageUrl:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 7
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mAttributions:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 8
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mActionUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 9
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mCollectionId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 10
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mWallpaperId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 11
    iget p0, p0, Lcom/google/android/apps/wallpaper/model/NetworkWallpaperInfo;->mActionType:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
