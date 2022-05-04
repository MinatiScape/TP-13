.class public interface abstract Lcom/android/wallpaper/picker/WallpaperColorThemePreview;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static synthetic lambda$updateWorkspacePreview$0(Landroid/view/SurfaceView;)V
    .locals 2

    const/4 v0, -0x1

    .line 1
    invoke-virtual {p0, v0}, Landroid/view/SurfaceView;->setTop(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/SurfaceView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v0, 0x12c

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method


# virtual methods
.method public shouldApplyWallpaperColors()Z
    .locals 3

    .line 1
    check-cast p0, Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    const/4 v0, 0x0

    const-string v1, "WallpaperColorThemePreview"

    if-eqz p0, :cond_2

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    invoke-static {p0}, Lcom/android/customization/model/color/ColorUtils;->isMonetEnabled(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string p0, "Monet is not enabled"

    .line 4
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 5
    :cond_1
    new-instance v0, Lcom/android/customization/model/theme/OverlayManagerCompat;

    invoke-direct {v0, p0}, Lcom/android/customization/model/theme/OverlayManagerCompat;-><init>(Landroid/content/Context;)V

    invoke-static {p0, v0}, Lcom/android/customization/model/color/ColorCustomizationManager;->getInstance(Landroid/content/Context;Lcom/android/customization/model/theme/OverlayManagerCompat;)Lcom/android/customization/model/color/ColorCustomizationManager;

    move-result-object p0

    const-string v0, "Current color source: "

    .line 6
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/customization/model/color/ColorCustomizationManager;->getCurrentColorSource()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 7
    invoke-virtual {p0}, Lcom/android/customization/model/color/ColorCustomizationManager;->getCurrentColorSource()Ljava/lang/String;

    move-result-object p0

    const-string v0, "preset"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0

    :cond_2
    :goto_0
    const-string p0, "shouldApplyWallpaperColors: activity is null or finishing"

    .line 8
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public updateSystemBarColor(Landroid/content/Context;)V
    .locals 2

    const v0, 0x1010433

    const-string v1, "android.R.attr.colorPrimary is not set in the current theme"

    .line 1
    invoke-static {p1, v0, v1}, Lcom/google/android/material/resources/MaterialAttributes;->resolveOrThrow(Landroid/content/Context;ILjava/lang/String;)I

    move-result p1

    .line 2
    check-cast p0, Landroidx/fragment/app/Fragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 3
    invoke-virtual {p0, p1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/Window;->setNavigationBarColor(I)V

    return-void
.end method

.method public updateWorkspacePreview(Landroid/view/SurfaceView;Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;Landroid/app/WallpaperColors;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/wallpaper/picker/WallpaperColorThemePreview;->shouldApplyWallpaperColors()Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getVisibility()I

    move-result p0

    const/16 v0, 0x8

    .line 3
    invoke-virtual {p1, v0}, Landroid/view/SurfaceView;->setVisibility(I)V

    if-eqz p2, :cond_2

    .line 4
    invoke-virtual {p2}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->cleanUp()V

    .line 5
    iget-boolean v0, p2, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mShouldUseWallpaperColors:Z

    if-nez v0, :cond_1

    goto :goto_0

    .line 6
    :cond_1
    iput-object p3, p2, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mWallpaperColors:Landroid/app/WallpaperColors;

    const/4 p3, 0x1

    .line 7
    iput-boolean p3, p2, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mIsWallpaperColorsReady:Z

    .line 8
    invoke-virtual {p2}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->maybeRenderPreview()V

    .line 9
    :goto_0
    invoke-virtual {p1}, Landroid/view/SurfaceView;->setUseAlpha()V

    const/4 p3, 0x0

    .line 10
    invoke-virtual {p1, p3}, Landroid/view/SurfaceView;->setAlpha(F)V

    .line 11
    new-instance p3, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {p3, p1}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Landroid/view/SurfaceView;)V

    .line 12
    iput-object p3, p2, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mListener:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback$WorkspaceRenderListener;

    .line 13
    :cond_2
    invoke-virtual {p1, p0}, Landroid/view/SurfaceView;->setVisibility(I)V

    return-void
.end method
