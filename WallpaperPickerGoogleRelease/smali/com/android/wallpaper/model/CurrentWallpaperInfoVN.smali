.class public Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;
.super Lcom/android/wallpaper/model/WallpaperInfo;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mActionIconRes:I

.field public mActionLabelRes:I

.field public mActionUrl:Ljava/lang/String;

.field public mAsset:Lcom/android/wallpaper/asset/Asset;

.field public mAttributions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mCollectionId:Ljava/lang/String;

.field public mWallpaperManagerFlag:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN$1;

    invoke-direct {v0}, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN$1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Lcom/android/wallpaper/model/CurrentWallpaperInfoVN$1;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>(Landroid/os/Parcel;)V

    .line 9
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mAttributions:Ljava/util/List;

    .line 10
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->readStringList(Ljava/util/List;)V

    .line 11
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mWallpaperManagerFlag:I

    .line 12
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionUrl:Ljava/lang/String;

    .line 13
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mCollectionId:Ljava/lang/String;

    .line 14
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionLabelRes:I

    .line 15
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionIconRes:I

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "II",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mAttributions:Ljava/util/List;

    .line 3
    iput p6, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mWallpaperManagerFlag:I

    .line 4
    iput-object p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionUrl:Ljava/lang/String;

    .line 5
    iput p3, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionLabelRes:I

    .line 6
    iput p4, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionIconRes:I

    .line 7
    iput-object p5, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mCollectionId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getActionIconRes(Landroid/content/Context;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionIconRes:I

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const p0, 0x7f0800ac

    :goto_0
    return p0
.end method

.method public getActionLabelRes(Landroid/content/Context;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionLabelRes:I

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const p0, 0x7f110080

    :goto_0
    return p0
.end method

.method public getActionUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mAsset:Lcom/android/wallpaper/asset/Asset;

    if-nez v0, :cond_2

    .line 2
    iget v0, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mWallpaperManagerFlag:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/wallpaper/module/Injector;->getWallpaperStatusChecker()Lcom/google/android/material/shape/EdgeTreatment;

    move-result-object v0

    .line 4
    invoke-virtual {v0, p1}, Lcom/google/android/material/shape/EdgeTreatment;->isHomeStaticWallpaperSet(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 5
    new-instance v0, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;

    invoke-direct {v0, p1}, Lcom/android/wallpaper/asset/BuiltInWallpaperAsset;-><init>(Landroid/content/Context;)V

    goto :goto_1

    .line 6
    :cond_1
    new-instance v0, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;

    iget v1, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mWallpaperManagerFlag:I

    invoke-direct {v0, p1, v1}, Lcom/android/wallpaper/asset/CurrentWallpaperAssetVN;-><init>(Landroid/content/Context;I)V

    .line 7
    :goto_1
    iput-object v0, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mAsset:Lcom/android/wallpaper/asset/Asset;

    .line 8
    :cond_2
    iget-object p0, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mAsset:Lcom/android/wallpaper/asset/Asset;

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
    iget-object p0, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mAttributions:Ljava/util/List;

    return-object p0
.end method

.method public getCollectionId(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mCollectionId:Ljava/lang/String;

    return-object p0
.end method

.method public getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p0

    return-object p0
.end method

.method public getWallpaperId()Ljava/lang/String;
    .locals 0

    const-string p0, "unknown_current_wallpaper_id"

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
    iget-object p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mAttributions:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 3
    iget p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mWallpaperManagerFlag:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    iget-object p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 5
    iget-object p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mCollectionId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 6
    iget p2, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionLabelRes:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 7
    iget p0, p0, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;->mActionIconRes:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
