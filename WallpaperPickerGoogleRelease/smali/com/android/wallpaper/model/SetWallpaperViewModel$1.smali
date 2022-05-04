.class public Lcom/android/wallpaper/model/SetWallpaperViewModel$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;


# instance fields
.field public final synthetic val$viewModel:Lcom/android/wallpaper/model/SetWallpaperViewModel;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/model/SetWallpaperViewModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/model/SetWallpaperViewModel$1;->val$viewModel:Lcom/android/wallpaper/model/SetWallpaperViewModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    const-string v0, "SetWallpaperViewModel"

    const-string v1, "SetWallpaperCallback error"

    .line 1
    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/model/SetWallpaperViewModel$1;->val$viewModel:Lcom/android/wallpaper/model/SetWallpaperViewModel;

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/model/SetWallpaperViewModel;->mStatus:Landroidx/lifecycle/MutableLiveData;

    .line 4
    sget-object p1, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;->ERROR:Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public onSuccess(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 1

    const-string p1, "SetWallpaperViewModel"

    const-string v0, "SetWallpaperCallback success"

    .line 1
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/model/SetWallpaperViewModel$1;->val$viewModel:Lcom/android/wallpaper/model/SetWallpaperViewModel;

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/model/SetWallpaperViewModel;->mStatus:Landroidx/lifecycle/MutableLiveData;

    .line 4
    sget-object p1, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;->SUCCESS:Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void
.end method
