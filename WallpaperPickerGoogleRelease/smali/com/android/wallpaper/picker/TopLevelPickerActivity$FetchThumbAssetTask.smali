.class public Lcom/android/wallpaper/picker/TopLevelPickerActivity$FetchThumbAssetTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/TopLevelPickerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FetchThumbAssetTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/android/wallpaper/asset/Asset;",
        ">;"
    }
.end annotation


# instance fields
.field public mAppContext:Landroid/content/Context;

.field public mReceiver:Lcom/android/wallpaper/picker/TopLevelPickerActivity$AssetReceiver;

.field public mWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/picker/TopLevelPickerActivity$AssetReceiver;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$FetchThumbAssetTask;->mAppContext:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$FetchThumbAssetTask;->mWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 4
    iput-object p3, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$FetchThumbAssetTask;->mReceiver:Lcom/android/wallpaper/picker/TopLevelPickerActivity$AssetReceiver;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$FetchThumbAssetTask;->mWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$FetchThumbAssetTask;->mAppContext:Landroid/content/Context;

    invoke-virtual {p1, p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p0

    return-object p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 9

    .line 1
    check-cast p1, Lcom/android/wallpaper/asset/Asset;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$FetchThumbAssetTask;->mReceiver:Lcom/android/wallpaper/picker/TopLevelPickerActivity$AssetReceiver;

    check-cast p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda1;

    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;

    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda1;->f$1:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda1;->f$2:Landroid/content/Context;

    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4$$ExternalSyntheticLambda1;->f$3:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;

    .line 3
    iget-object v2, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {v0, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v3

    iget-object v4, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 5
    iget-object v5, v4, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperImage:Landroid/widget/ImageView;

    const/16 v6, 0xc8

    .line 6
    new-instance v7, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {v7, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;)V

    const/4 v8, 0x0

    .line 7
    invoke-virtual/range {v3 .. v8}, Lcom/android/wallpaper/asset/Asset;->loadDrawableWithTransition(Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;I)V

    :goto_0
    return-void
.end method
