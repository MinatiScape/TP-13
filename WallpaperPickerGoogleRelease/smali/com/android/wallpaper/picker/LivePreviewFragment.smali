.class public Lcom/android/wallpaper/picker/LivePreviewFragment;
.super Lcom/android/wallpaper/picker/PreviewFragment;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/LivePreviewFragment$PreviewCustomizeSettingsContent;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mDeleteIntent:Landroid/content/Intent;

.field public mHomePreviewCard:Landroidx/cardview/widget/CardView;

.field public mLockPreviewContainer:Landroid/view/ViewGroup;

.field public mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

.field public mPlaceholderColorFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public mPreviewContainer:Landroid/view/ViewGroup;

.field public mScreenSize:Landroid/graphics/Point;

.field public mSettingsIntent:Landroid/content/Intent;

.field public mSettingsLiveData:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Landroidx/slice/Slice;",
            ">;"
        }
    .end annotation
.end field

.field public mSettingsSliceView:Landroidx/slice/widget/SliceView;

.field public mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

.field public mWallpaperColors:Landroid/app/WallpaperColors;

.field public mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

.field public mWallpaperSurface:Landroid/view/SurfaceView;

.field public mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

.field public mWorkspaceSurface:Landroid/view/SurfaceView;

.field public mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/PreviewFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getDeleteAction(Landroid/app/WallpaperInfo;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object p0

    .line 2
    invoke-virtual {p1}, Landroid/app/WallpaperInfo;->getServiceInfo()Landroid/content/pm/ServiceInfo;

    move-result-object p1

    .line 3
    iget-object v0, p1, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 4
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const/4 v0, 0x0

    if-nez v1, :cond_1

    const-string p0, "This wallpaper is not pre-installed: "

    .line 5
    invoke-static {p0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget-object p1, p1, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "LivePreviewFragment"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_1
    if-nez p0, :cond_2

    move-object p0, v0

    goto :goto_1

    .line 6
    :cond_2
    invoke-virtual {p0}, Landroid/app/WallpaperInfo;->getServiceInfo()Landroid/content/pm/ServiceInfo;

    move-result-object p0

    :goto_1
    if-eqz p0, :cond_3

    .line 7
    iget-object v1, p1, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    iget-object p0, p0, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-static {v1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    return-object v0

    .line 8
    :cond_3
    iget-object p0, p1, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    if-eqz p0, :cond_4

    const-string p1, "action_delete_live_wallpaper"

    .line 9
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    return-object v0
.end method

.method public getLayoutResId()I
    .locals 0

    const p0, 0x7f0d0064

    return p0
.end method

.method public getSettingsActivity(Landroid/app/WallpaperInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/app/WallpaperInfo;->getSettingsActivity()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSettingsSliceUri(Landroid/app/WallpaperInfo;)Landroid/net/Uri;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    sget p0, Lcom/android/wallpaper/compat/BuildCompat;->sSdk:I

    const/16 v0, 0x1d

    if-lt p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    .line 2
    invoke-virtual {p1}, Landroid/app/WallpaperInfo;->getSettingsSliceUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public getWallpaperIntent(Landroid/app/WallpaperInfo;)Landroid/content/Intent;
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    const-string v0, "android.service.wallpaper.WallpaperService"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2
    invoke-virtual {p1}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    sget-object v1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->INFORMATION:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v3, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DELETE:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v4, 0x1

    aput-object v3, v0, v4

    sget-object v5, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->EDIT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v6, 0x2

    aput-object v5, v0, v6

    sget-object v5, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->CUSTOMIZE:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v7, 0x3

    aput-object v5, v0, v7

    sget-object v7, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->APPLY:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v8, 0x4

    aput-object v7, v0, v8

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->showActionsOnly([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, v2}, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;I)V

    invoke-virtual {p1, v7, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->setActionClickListener(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v0, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v0, p0, v7}, Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;Landroid/content/Context;)V

    .line 6
    invoke-virtual {p1, v0, v1}, Lcom/android/wallpaper/widget/BottomActionBar;->bindBottomSheetContentWithAction(Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 7
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    const v0, 0x7f0a01f3

    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v1, Lcom/android/wallpaper/picker/LivePreviewFragment$3;

    invoke-direct {v1, p0, p1}, Lcom/android/wallpaper/picker/LivePreviewFragment$3;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;Landroid/view/View;)V

    .line 10
    iput-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mAccessibilityCallback:Lcom/android/wallpaper/widget/BottomActionBar$AccessibilityCallback;

    .line 11
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/LivePreviewFragment;->getSettingsSliceUri(Landroid/app/WallpaperInfo;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 12
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Landroidx/slice/widget/SliceLiveData;->SUPPORTED_SPECS:Ljava/util/Set;

    .line 13
    new-instance v1, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v7, 0x0

    invoke-direct {v1, v0, p1, v7}, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroidx/slice/widget/SliceLiveData$OnErrorListener;)V

    .line 14
    iput-object v1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsLiveData:Landroidx/lifecycle/LiveData;

    .line 15
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v0, Lcom/android/wallpaper/picker/LivePreviewFragment$PreviewCustomizeSettingsContent;

    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1, v7}, Lcom/android/wallpaper/picker/LivePreviewFragment$PreviewCustomizeSettingsContent;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;Landroid/content/Context;Lcom/android/wallpaper/picker/LivePreviewFragment$1;)V

    .line 17
    invoke-virtual {p1, v0, v5}, Lcom/android/wallpaper/widget/BottomActionBar;->bindBottomSheetContentWithAction(Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    goto :goto_0

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsIntent:Landroid/content/Intent;

    if-eqz p1, :cond_1

    .line 19
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, v4}, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;I)V

    invoke-virtual {p1, v5, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->setActionClickListener(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 20
    :cond_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-array v0, v4, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    aput-object v5, v0, v2

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->hideActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 21
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/LivePreviewFragment;->getDeleteAction(Landroid/app/WallpaperInfo;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 22
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-array v0, v4, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    aput-object v3, v0, v2

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->hideActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    goto :goto_1

    .line 23
    :cond_2
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, v6}, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;I)V

    invoke-virtual {p1, v3, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->setActionClickListener(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V

    .line 24
    :goto_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 25
    invoke-virtual {p1, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 26
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-virtual {p1}, Lcom/android/wallpaper/widget/BottomActionBar;->disableActions()V

    .line 27
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p1, :cond_3

    .line 28
    iget-boolean p1, p1, Lcom/android/wallpaper/util/WallpaperConnection;->mEngineReady:Z

    if-eqz p1, :cond_3

    move v2, v4

    :cond_3
    if-eqz v2, :cond_4

    .line 29
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-virtual {p0}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions()V

    :cond_4
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->computePlaceholderColor(Landroid/content/Context;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mPlaceholderColorFuture:Ljava/util/concurrent/Future;

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/LivePreviewFragment;->getDeleteAction(Landroid/app/WallpaperInfo;)Ljava/lang/String;

    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 6
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mDeleteIntent:Landroid/content/Intent;

    .line 7
    invoke-virtual {p1}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mDeleteIntent:Landroid/content/Intent;

    const-string v1, "android.live_wallpaper.info"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/LivePreviewFragment;->getSettingsActivity(Landroid/app/WallpaperInfo;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 10
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    iput-object v1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsIntent:Landroid/content/Intent;

    .line 11
    new-instance v2, Landroid/content/ComponentName;

    invoke-virtual {p1}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 12
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsIntent:Landroid/content/Intent;

    const/4 v1, 0x1

    const-string v2, "android.service.wallpaper.PREVIEW_MODE"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    .line 14
    iget-object v1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsIntent:Landroid/content/Intent;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/Intent;->resolveActivityInfo(Landroid/content/pm/PackageManager;I)Landroid/content/pm/ActivityInfo;

    move-result-object p1

    if-nez p1, :cond_1

    .line 15
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Couldn\'t find wallpaper settings activity: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "LivePreviewFragment"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsIntent:Landroid/content/Intent;

    :cond_1
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/wallpaper/picker/PreviewFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    .line 3
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object p3

    .line 4
    invoke-virtual {p2}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 5
    invoke-virtual {p3, v0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p3

    iput-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mScreenSize:Landroid/graphics/Point;

    const p3, 0x7f0a0138

    .line 6
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mPreviewContainer:Landroid/view/ViewGroup;

    const p3, 0x7f0a0272

    .line 7
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/android/wallpaper/picker/TouchForwardingLayout;

    iput-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    const p3, 0x7f0a01b3

    .line 8
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    const v0, 0x7f0600ef

    .line 9
    invoke-virtual {p2, v0}, Landroid/app/Activity;->getColor(I)I

    move-result v0

    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 10
    new-instance p3, Landroidx/constraintlayout/widget/ConstraintSet;

    invoke-direct {p3}, Landroidx/constraintlayout/widget/ConstraintSet;-><init>()V

    .line 11
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mPreviewContainer:Landroid/view/ViewGroup;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p3, v0}, Landroidx/constraintlayout/widget/ConstraintSet;->clone(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 12
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mScreenSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mScreenSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "%d:%d"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getId()I

    move-result v1

    .line 14
    invoke-virtual {p3, v1}, Landroidx/constraintlayout/widget/ConstraintSet;->get(I)Landroidx/constraintlayout/widget/ConstraintSet$Constraint;

    move-result-object v1

    iget-object v1, v1, Landroidx/constraintlayout/widget/ConstraintSet$Constraint;->layout:Landroidx/constraintlayout/widget/ConstraintSet$Layout;

    iput-object v0, v1, Landroidx/constraintlayout/widget/ConstraintSet$Layout;->dimensionRatio:Ljava/lang/String;

    .line 15
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mPreviewContainer:Landroid/view/ViewGroup;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p3, v0}, Landroidx/constraintlayout/widget/ConstraintSet;->applyTo(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 16
    iget-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mPreviewContainer:Landroid/view/ViewGroup;

    const v0, 0x7f0a028a

    invoke-virtual {p3, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroidx/cardview/widget/CardView;

    iput-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    .line 17
    iget-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mPreviewContainer:Landroid/view/ViewGroup;

    const v0, 0x7f0a013e

    invoke-virtual {p3, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mLockPreviewContainer:Landroid/view/ViewGroup;

    .line 18
    new-instance p3, Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 19
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mLockPreviewContainer:Landroid/view/ViewGroup;

    invoke-direct {p3, v0, v1, v2}, Lcom/android/wallpaper/widget/LockScreenPreviewer;-><init>(Landroidx/lifecycle/Lifecycle;Landroid/content/Context;Landroid/view/ViewGroup;)V

    iput-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 21
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 22
    iget-boolean v0, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsFullScreen:Z

    xor-int/2addr v0, v4

    .line 23
    invoke-virtual {p3, v0}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setDateViewVisibility(Z)V

    .line 24
    iget-object p3, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    new-instance v0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, v3}, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda3;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;I)V

    .line 25
    iput-object v0, p3, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenStatusListener:Lcom/android/wallpaper/util/FullScreenAnimation$FullScreenStatusListener;

    .line 26
    iget-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    const v0, 0x7f0a029a

    invoke-virtual {p3, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/SurfaceView;

    iput-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 27
    iget-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mTouchForwardingLayout:Lcom/android/wallpaper/picker/TouchForwardingLayout;

    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    .line 28
    iput-object v0, p3, Lcom/android/wallpaper/picker/TouchForwardingLayout;->mView:Landroid/view/View;

    .line 29
    iput-boolean v4, p3, Lcom/android/wallpaper/picker/TouchForwardingLayout;->mForwardingEnabled:Z

    const p3, 0x7f0a029e

    .line 30
    invoke-virtual {v0, p3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/SurfaceView;

    iput-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    .line 31
    invoke-virtual {p0, p3}, Lcom/android/wallpaper/picker/PreviewFragment;->createWorkspaceSurfaceCallback(Landroid/view/SurfaceView;)Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    move-result-object p3

    iput-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    .line 32
    new-instance p3, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    iget-object v3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    iget-object v4, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mPlaceholderColorFuture:Ljava/util/concurrent/Future;

    new-instance v5, Lcom/android/wallpaper/picker/LivePreviewFragment$1;

    invoke-direct {v5, p0}, Lcom/android/wallpaper/picker/LivePreviewFragment$1;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;)V

    move-object v0, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;-><init>(Landroid/content/Context;Landroid/view/View;Landroid/view/SurfaceView;Ljava/util/concurrent/Future;Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;)V

    iput-object p3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    const p3, 0x7f0a01f2

    .line 33
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {p0, p3}, Lcom/android/wallpaper/picker/PreviewFragment;->setUpTabs(Lcom/google/android/material/tabs/TabLayout;)V

    .line 34
    new-instance p3, Lcom/android/wallpaper/picker/LivePreviewFragment$2;

    invoke-direct {p3, p0, p2, p1}, Lcom/android/wallpaper/picker/LivePreviewFragment$2;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;Landroid/app/Activity;Landroid/view/View;)V

    invoke-virtual {p1, p3}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-object p1
.end method

.method public onDestroyView()V
    .locals 4

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsLiveData:Landroidx/lifecycle/LiveData;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 3
    iget-object v3, v1, Landroidx/lifecycle/LiveData;->mObservers:Landroidx/arch/core/internal/SafeIterableMap;

    .line 4
    iget v3, v3, Landroidx/arch/core/internal/SafeIterableMap;->mSize:I

    if-lez v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 5
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsSliceView:Landroidx/slice/widget/SliceView;

    if-eqz v0, :cond_1

    .line 6
    invoke-virtual {v1, v0}, Landroidx/lifecycle/LiveData;->removeObserver(Landroidx/lifecycle/Observer;)V

    .line 7
    iput-object v2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsLiveData:Landroidx/lifecycle/LiveData;

    .line 8
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v0, :cond_2

    .line 9
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    .line 10
    iput-object v2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 11
    :cond_2
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    if-eqz v0, :cond_3

    .line 12
    invoke-virtual {v0}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->release()V

    .line 13
    :cond_3
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->cleanUp()V

    .line 14
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 15
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->cleanUp()V

    .line 16
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    return-void
.end method

.method public onEngineShown()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 3
    iget-object v0, v0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    .line 4
    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0xfa

    .line 5
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 6
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Lcom/android/wallpaper/picker/PreviewFragment;->ALPHA_OUT:Landroid/view/animation/Interpolator;

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 10
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    if-eqz p0, :cond_1

    .line 11
    invoke-virtual {p0}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions()V

    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/util/WallpaperConnection;->setEngineVisibility(Z)V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/wallpaper/picker/PreviewFragment;->onResume()V

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/util/WallpaperConnection;->setEngineVisibility(Z)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/wallpaper/picker/BottomActionBarFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object p2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-interface {p1, p2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    new-instance v0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda2;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1, p2}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    return-void
.end method

.method public onWallpaperColorsChanged(Landroid/app/WallpaperColors;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperColors:Landroid/app/WallpaperColors;

    .line 2
    iget-object p2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    invoke-virtual {p2, p1}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setColor(Landroid/app/WallpaperColors;)V

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    if-eqz p1, :cond_1

    .line 4
    invoke-virtual {p1}, Landroid/app/WallpaperColors;->getColorHints()I

    move-result p1

    and-int/lit8 p1, p1, 0x1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x3

    .line 5
    :goto_1
    iput p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenTextColor:I

    .line 6
    iget-boolean p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsFullScreen:Z

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/util/FullScreenAnimation;->animateColor(Z)V

    return-void
.end method

.method public previewLiveWallpaper(Landroid/widget/ImageView;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    new-instance v0, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;)V

    invoke-virtual {p1, v0}, Landroid/view/SurfaceView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public setCurrentWallpaper(I)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v7, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperColors:Landroid/app/WallpaperColors;

    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mViewModelProvider:Landroidx/lifecycle/ViewModelProvider;

    .line 2
    const-class v3, Lcom/android/wallpaper/model/SetWallpaperViewModel;

    invoke-virtual {p0, v3}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/model/SetWallpaperViewModel;

    .line 3
    new-instance v8, Lcom/android/wallpaper/model/SetWallpaperViewModel$1;

    invoke-direct {v8, p0}, Lcom/android/wallpaper/model/SetWallpaperViewModel$1;-><init>(Lcom/android/wallpaper/model/SetWallpaperViewModel;)V

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move v4, p1

    .line 4
    invoke-virtual/range {v0 .. v8}, Lcom/android/wallpaper/module/WallpaperSetter;->setCurrentWallpaper(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;IFLandroid/graphics/Rect;Landroid/app/WallpaperColors;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    return-void
.end method

.method public setUpLiveWallpaperPreview(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 2
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 3
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v1, :cond_1

    .line 4
    invoke-virtual {v1}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    .line 5
    :cond_1
    invoke-static {}, Lcom/android/wallpaper/util/WallpaperConnection;->isPreviewAvailable()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    .line 6
    new-instance v1, Lcom/android/wallpaper/util/WallpaperConnection;

    .line 7
    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/LivePreviewFragment;->getWallpaperIntent(Landroid/app/WallpaperInfo;)Landroid/content/Intent;

    move-result-object p1

    iget-object v3, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-direct {v1, p1, v0, p0, v3}, Lcom/android/wallpaper/util/WallpaperConnection;-><init>(Landroid/content/Intent;Landroid/content/Context;Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;Landroid/view/SurfaceView;)V

    iput-object v1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 8
    iput-boolean v2, v1, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    .line 9
    invoke-virtual {v1, v2}, Lcom/android/wallpaper/util/WallpaperConnection;->setEngineVisibility(Z)V

    goto :goto_0

    .line 10
    :cond_2
    invoke-virtual {p1, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p1

    new-instance v1, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, v2}, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda3;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;I)V

    .line 11
    invoke-static {v0, p1, v1}, Lcom/android/wallpaper/widget/WallpaperColorsLoader;->getWallpaperColors(Landroid/content/Context;Lcom/android/wallpaper/asset/Asset;Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;)V

    .line 12
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/android/wallpaper/util/WallpaperConnection;->connect()Z

    move-result p1

    if-nez p1, :cond_3

    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    :cond_3
    :goto_1
    return-void
.end method

.method public updateScreenPreview(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-eqz p1, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mLockPreviewContainer:Landroid/view/ViewGroup;

    if-eqz p1, :cond_1

    move v1, v2

    :cond_1
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 4
    iput-boolean p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsHomeSelected:Z

    return-void
.end method
