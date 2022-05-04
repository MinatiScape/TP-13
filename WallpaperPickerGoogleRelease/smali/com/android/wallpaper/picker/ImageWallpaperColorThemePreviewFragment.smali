.class public final Lcom/android/wallpaper/picker/ImageWallpaperColorThemePreviewFragment;
.super Lcom/android/wallpaper/picker/ImagePreviewFragment;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/WallpaperColorThemePreview;


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mIgnoreInitialColorChange:Z

.field public mWallpaperColors:Landroid/app/WallpaperColors;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/ImagePreviewFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public createWorkspaceSurfaceCallback(Landroid/view/SurfaceView;)Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 2
    invoke-interface {p0}, Lcom/android/wallpaper/picker/WallpaperColorThemePreview;->shouldApplyWallpaperColors()Z

    move-result p0

    invoke-direct {v0, p1, v1, p0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;-><init>(Landroid/view/SurfaceView;Landroid/content/Context;Z)V

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/ImagePreviewFragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    if-eqz p1, :cond_0

    const-string v0, "preview_mode"

    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/android/wallpaper/picker/ImageWallpaperColorThemePreviewFragment;->mIgnoreInitialColorChange:Z

    :cond_0
    return-void
.end method

.method public onWallpaperColorsChanged(Landroid/app/WallpaperColors;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/picker/ImageWallpaperColorThemePreviewFragment;->mIgnoreInitialColorChange:Z

    if-nez v0, :cond_1

    if-nez p1, :cond_0

    goto/16 :goto_0

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImageWallpaperColorThemePreviewFragment;->mWallpaperColors:Landroid/app/WallpaperColors;

    invoke-virtual {p1, v0}, Landroid/app/WallpaperColors;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-interface {p0}, Lcom/android/wallpaper/picker/WallpaperColorThemePreview;->shouldApplyWallpaperColors()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3
    iput-object p1, p0, Lcom/android/wallpaper/picker/ImageWallpaperColorThemePreviewFragment;->mWallpaperColors:Landroid/app/WallpaperColors;

    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/customization/model/color/WallpaperColorResources;

    invoke-direct {v1, p1}, Lcom/android/customization/model/color/WallpaperColorResources;-><init>(Landroid/app/WallpaperColors;)V

    .line 6
    iget-object v1, v1, Lcom/android/customization/model/color/WallpaperColorResources;->mColorOverlay:Landroid/util/SparseIntArray;

    invoke-static {v0, v1}, Landroid/widget/RemoteViews$ColorResources;->create(Landroid/content/Context;Landroid/util/SparseIntArray;)Landroid/widget/RemoteViews$ColorResources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/RemoteViews$ColorResources;->apply(Landroid/content/Context;)V

    .line 7
    invoke-interface {p0, v0}, Lcom/android/wallpaper/picker/WallpaperColorThemePreview;->updateSystemBarColor(Landroid/content/Context;)V

    .line 8
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    const v2, 0x1010433

    const-string v3, "android.R.attr.colorPrimary is not set in the current theme"

    .line 9
    invoke-static {v0, v2, v3}, Lcom/google/android/material/resources/MaterialAttributes;->resolveOrThrow(Landroid/content/Context;ILjava/lang/String;)I

    move-result v2

    .line 10
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 11
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 12
    iget-object v2, p0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    const v3, 0x7f0a01ec

    .line 13
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 14
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    const v3, 0x7f0d00c8

    .line 15
    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x1

    .line 16
    invoke-virtual {p0, v2, v3}, Lcom/android/wallpaper/picker/AppbarFragment;->setUpToolbar(Landroid/view/View;Z)V

    .line 17
    iget-object v2, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    invoke-virtual {v2}, Lcom/android/wallpaper/util/FullScreenAnimation;->ensureToolbarIsCorrectlyLocated()V

    .line 18
    iget-object v2, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    invoke-virtual {v2}, Lcom/android/wallpaper/util/FullScreenAnimation;->ensureToolbarIsCorrectlyColored()V

    .line 19
    iget-object v2, p0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    const v4, 0x7f0a0105

    .line 20
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 21
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    const v4, 0x7f0d0068

    .line 22
    invoke-virtual {v1, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/wallpaper/picker/PreviewFragment;->setFullScreenActions(Landroid/view/View;)V

    .line 23
    iget-object v2, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-virtual {v1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/android/wallpaper/widget/BottomActionBar;->setColor(Landroid/content/Context;)V

    .line 24
    iget-object v2, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    iget-object v4, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-interface {p0, v2, v4, p1}, Lcom/android/wallpaper/picker/WallpaperColorThemePreview;->updateWorkspacePreview(Landroid/view/SurfaceView;Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;Landroid/app/WallpaperColors;)V

    .line 25
    iget-object v2, p0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    const v4, 0x7f0a01f3

    .line 26
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 27
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    const v4, 0x7f0d00cc

    .line 28
    invoke-virtual {v1, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a01f2

    .line 29
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/tabs/TabLayout;

    .line 30
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/picker/PreviewFragment;->setUpTabs(Lcom/google/android/material/tabs/TabLayout;)V

    .line 31
    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    invoke-virtual {v1}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->release()V

    .line 32
    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockPreviewContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 33
    new-instance v1, Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 34
    iget-object v2, p0, Landroidx/fragment/app/Fragment;->mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

    .line 35
    iget-object v4, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockPreviewContainer:Landroid/view/ViewGroup;

    invoke-direct {v1, v2, v0, v4}, Lcom/android/wallpaper/widget/LockScreenPreviewer;-><init>(Landroidx/lifecycle/Lifecycle;Landroid/content/Context;Landroid/view/ViewGroup;)V

    iput-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 36
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 37
    iget-boolean v0, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsFullScreen:Z

    xor-int/2addr v0, v3

    .line 38
    invoke-virtual {v1, v0}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setDateViewVisibility(Z)V

    goto :goto_1

    .line 39
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    iget-object v1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    const/4 v2, 0x0

    invoke-interface {p0, v0, v1, v2}, Lcom/android/wallpaper/picker/WallpaperColorThemePreview;->updateWorkspacePreview(Landroid/view/SurfaceView;Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;Landroid/app/WallpaperColors;)V

    :cond_2
    :goto_1
    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/ImageWallpaperColorThemePreviewFragment;->mIgnoreInitialColorChange:Z

    .line 41
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/ImagePreviewFragment;->onWallpaperColorsChanged(Landroid/app/WallpaperColors;)V

    return-void
.end method
