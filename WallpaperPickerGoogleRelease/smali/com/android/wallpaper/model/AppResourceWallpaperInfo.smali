.class public Lcom/android/wallpaper/model/AppResourceWallpaperInfo;
.super Lcom/android/wallpaper/model/WallpaperInfo;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/wallpaper/model/AppResourceWallpaperInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

.field public mFullRes:I

.field public mPackageName:Ljava/lang/String;

.field public mResources:Landroid/content/res/Resources;

.field public mThumbAsset:Lcom/android/wallpaper/asset/ResourceAsset;

.field public mThumbRes:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo$1;

    invoke-direct {v0}, Lcom/android/wallpaper/model/AppResourceWallpaperInfo$1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Lcom/android/wallpaper/model/AppResourceWallpaperInfo$1;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>(Landroid/os/Parcel;)V

    .line 6
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mPackageName:Ljava/lang/String;

    .line 7
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mThumbRes:I

    .line 8
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mFullRes:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/model/WallpaperInfo;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mPackageName:Ljava/lang/String;

    .line 3
    iput p2, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mThumbRes:I

    .line 4
    iput p3, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mFullRes:I

    return-void
.end method

.method public static getAll(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;I)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/pm/ApplicationInfo;",
            "I)",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;"
        }
    .end annotation

    const-string v0, "drawable"

    .line 1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;

    move-result-object p0

    .line 3
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p2

    .line 4
    array-length v2, p2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, p2, v3

    .line 5
    iget-object v5, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p0, v4, v0, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 6
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "_small"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v6, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p0, v4, v0, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    if-eqz v5, :cond_0

    if-eqz v4, :cond_0

    .line 7
    new-instance v6, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;

    iget-object v7, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-direct {v6, v7, v4, v5}, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;-><init>(Ljava/lang/String;II)V

    .line 8
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    const-string p0, "AppResource"

    const-string p1, "Hosting app package not found"

    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-object v1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mPackageName:Ljava/lang/String;

    check-cast p1, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;

    iget-object v3, p1, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mThumbRes:I

    iget v3, p1, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mThumbRes:I

    if-ne v1, v3, :cond_1

    iget p0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mFullRes:I

    iget p1, p1, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mFullRes:I

    if-ne p0, p1, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->getPackageResources(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object p1

    .line 3
    new-instance v0, Lcom/android/wallpaper/asset/ResourceAsset;

    iget v1, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mFullRes:I

    invoke-direct {v0, p1, v1}, Lcom/android/wallpaper/asset/ResourceAsset;-><init>(Landroid/content/res/Resources;I)V

    iput-object v0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mAsset:Lcom/android/wallpaper/asset/ResourceAsset;

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

.method public final getPackageResources(Landroid/content/Context;)Landroid/content/res/Resources;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mResources:Landroid/content/res/Resources;

    if-eqz v0, :cond_0

    return-object v0

    .line 2
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    iget-object v0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mResources:Landroid/content/res/Resources;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "AppResource"

    const-string v0, "Could not get app resources"

    .line 3
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mResources:Landroid/content/res/Resources;

    return-object p0
.end method

.method public getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->getPackageResources(Landroid/content/Context;)Landroid/content/res/Resources;

    move-result-object p1

    .line 3
    new-instance v0, Lcom/android/wallpaper/asset/ResourceAsset;

    iget v1, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mThumbRes:I

    invoke-direct {v0, p1, v1}, Lcom/android/wallpaper/asset/ResourceAsset;-><init>(Landroid/content/res/Resources;I)V

    iput-object v0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mThumbAsset:Lcom/android/wallpaper/asset/ResourceAsset;

    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    .line 2
    iget v1, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mThumbRes:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 3
    iget p0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mFullRes:I

    add-int/2addr v0, p0

    return v0
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
    iget-object p2, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 3
    iget p2, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mThumbRes:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    iget p0, p0, Lcom/android/wallpaper/model/AppResourceWallpaperInfo;->mFullRes:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
