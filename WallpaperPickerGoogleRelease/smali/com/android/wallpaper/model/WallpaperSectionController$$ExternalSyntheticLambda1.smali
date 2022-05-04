.class public final synthetic Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;
.implements Landroidx/lifecycle/Observer;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/wallpaper/model/WallpaperSectionController;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/model/WallpaperSectionController;I)V
    .locals 1

    iput p2, p0, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;->$r8$classId:I

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    return-void
.end method


# virtual methods
.method public onChanged(Ljava/lang/Object;)V
    .locals 4

    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    check-cast p1, Ljava/lang/Boolean;

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurface:Landroid/view/SurfaceView;

    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->getHomeWallpaperColors()Landroidx/lifecycle/MutableLiveData;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/WallpaperColors;

    .line 3
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 4
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    .line 5
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    if-eqz v0, :cond_1

    const/4 v3, 0x0

    .line 6
    iput-object v3, v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mLastSurface:Landroid/view/Surface;

    .line 7
    iget-boolean v3, v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mShouldUseWallpaperColors:Z

    if-nez v3, :cond_0

    goto :goto_0

    .line 8
    :cond_0
    iput-object p0, v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mWallpaperColors:Landroid/app/WallpaperColors;

    const/4 p0, 0x1

    .line 9
    iput-boolean p0, v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mIsWallpaperColorsReady:Z

    .line 10
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->maybeRenderPreview()V

    .line 11
    :cond_1
    :goto_0
    invoke-virtual {v1, p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    return-void
.end method

.method public onSurfaceCreated()V
    .locals 2

    iget v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomePreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    if-eqz v0, :cond_0

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mHomeWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-virtual {p0, v0, v1}, Lcom/android/wallpaper/model/WallpaperSectionController;->maybeLoadThumbnail(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/util/WallpaperSurfaceCallback;)Lcom/android/wallpaper/asset/Asset;

    :cond_0
    return-void

    .line 3
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockPreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    if-eqz v0, :cond_1

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-virtual {p0, v0, v1}, Lcom/android/wallpaper/model/WallpaperSectionController;->maybeLoadThumbnail(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/util/WallpaperSurfaceCallback;)Lcom/android/wallpaper/asset/Asset;

    :cond_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
