.class public abstract Lcom/android/wallpaper/model/Category;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final mCollectionId:Ljava/lang/String;

.field public final mPriority:I

.field public final mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/model/Category;->mTitle:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 4
    iput p3, p0, Lcom/android/wallpaper/model/Category;->mPriority:I

    return-void
.end method


# virtual methods
.method public containsThirdParty(Ljava/lang/String;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/wallpaper/model/Category;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    if-ne p1, p0, :cond_1

    const/4 p0, 0x1

    return p0

    .line 2
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 3
    check-cast p1, Lcom/android/wallpaper/model/Category;

    .line 4
    iget-object p1, p1, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method public getOverlayIcon(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getOverlayIconSizeDp()I
    .locals 0

    const/16 p0, 0x28

    return p0
.end method

.method public getSingleWallpaper()Lcom/android/wallpaper/model/WallpaperInfo;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public abstract getThumbnail(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
.end method

.method public getWallpaperRotationInitializer()Lcom/android/wallpaper/model/WallpaperRotationInitializer;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result p0

    :goto_0
    return p0
.end method

.method public isEnumerable()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSingleWallpaperCategory()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public abstract show(Landroid/app/Activity;Lcom/android/wallpaper/model/PickerIntentFactory;I)V
.end method

.method public supportsCustomPhotos()Z
    .locals 0

    instance-of p0, p0, Lcom/android/wallpaper/model/DesktopCustomCategory;

    return p0
.end method

.method public supportsThirdParty()Z
    .locals 0

    instance-of p0, p0, Lcom/android/wallpaper/model/ThirdPartyAppCategory;

    return p0
.end method
