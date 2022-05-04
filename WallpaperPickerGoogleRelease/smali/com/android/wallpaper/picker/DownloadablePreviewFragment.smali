.class public Lcom/android/wallpaper/picker/DownloadablePreviewFragment;
.super Lcom/android/wallpaper/picker/LivePreviewFragment;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field public mContext:Landroid/content/Context;

.field public mIsCancelingDownload:Z

.field public mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/LivePreviewFragment;-><init>()V

    .line 2
    new-instance v0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment$1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/DownloadablePreviewFragment$1;-><init>(Lcom/android/wallpaper/picker/DownloadablePreviewFragment;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method


# virtual methods
.method public onAttach(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/AppbarFragment;->onAttach(Landroid/content/Context;)V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mContext:Landroid/content/Context;

    .line 3
    new-instance p1, Landroid/content/IntentFilter;

    const-string v0, "com.google.pixel.livewallpaper.action.DOWNLOAD_STATE"

    invoke-direct {p1, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    const-string v1, "com.google.pixel.livewallpaper.permission.DOWNLOAD_LIVE_WALLPAPER"

    const/4 v2, 0x0

    invoke-virtual {v0, p0, p1, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    return-void
.end method

.method public onBackPressed()Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mIsCancelingDownload:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    instance-of v2, v0, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;

    if-eqz v2, :cond_1

    .line 3
    iput-boolean v1, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mIsCancelingDownload:Z

    .line 4
    invoke-virtual {v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object v0

    .line 5
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.pixel.livewallpaper.action.CANCEL_LIVE_WALLPAPER"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    new-instance v2, Landroid/content/ComponentName;

    const-string v3, "com.google.pixel.livewallpaper"

    const-string v4, "com.google.pixel.livewallpaper.split.FeatureActivity"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const/high16 v2, 0x30000000

    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v2, "android.live_wallpaper.info"

    .line 8
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    const/4 v0, 0x4

    invoke-static {p0, v1, v0}, Lcom/android/wallpaper/util/ActivityUtils;->startActivityForResultSafely(Landroid/app/Activity;Landroid/content/Intent;I)V

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/LivePreviewFragment;->onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    sget-object v1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->INFORMATION:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DOWNLOAD:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v3, 0x1

    aput-object v1, v0, v3

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->showActionsOnly([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v0, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/DownloadablePreviewFragment;)V

    invoke-virtual {p1, v1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->setActionClickListener(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 5
    invoke-virtual {p1, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-virtual {p0}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/LivePreviewFragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mContext:Landroid/content/Context;

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    return-void
.end method

.method public onDetach()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public previewLiveWallpaper(Landroid/widget/ImageView;)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Handler;->getMain()Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/DownloadablePreviewFragment;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public showDownloadFailed()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-array v3, v2, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    sget-object v4, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DOWNLOAD:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    aput-object v4, v3, v1

    invoke-virtual {v0, v3}, Lcom/android/wallpaper/widget/BottomActionBar;->showActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-array v0, v2, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->PROGRESS:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->hideActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    return-void
.end method

.method public showDownloadSuccess()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    const/4 v1, 0x2

    new-array v2, v1, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    sget-object v3, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DOWNLOAD:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    sget-object v3, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->PROGRESS:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-virtual {v0, v2}, Lcom/android/wallpaper/widget/BottomActionBar;->hideActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-array v1, v1, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DELETE:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    aput-object v2, v1, v4

    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->APPLY:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    aput-object v2, v1, v5

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/widget/BottomActionBar;->showActions([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 4
    new-instance v8, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    .line 5
    invoke-virtual {v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object v0

    invoke-direct {v8, v0}, Lcom/android/wallpaper/model/LiveWallpaperInfo;-><init>(Landroid/app/WallpaperInfo;)V

    .line 6
    iget-object v0, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    check-cast v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 7
    iput-object v8, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 8
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    const v1, 0x7f0a01f2

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/tabs/TabLayout;

    .line 10
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v6

    iget-object v7, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mContext:Landroid/content/Context;

    const/4 v9, 0x1

    .line 11
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    move-result v0

    if-nez v0, :cond_0

    move v10, v5

    goto :goto_0

    :cond_0
    move v10, v4

    :goto_0
    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 12
    invoke-interface/range {v6 .. v12}, Lcom/android/wallpaper/module/Injector;->getPreviewFragment(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperInfo;IZZZ)Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 13
    iget-object p0, p0, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    .line 14
    new-instance v1, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v1, p0}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    const p0, 0x7f0a0101

    .line 15
    invoke-virtual {v1, p0, v0}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 16
    invoke-virtual {v1}, Landroidx/fragment/app/BackStackRecord;->commitAllowingStateLoss()I

    return-void
.end method

.method public startDownload(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 2
    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object p1

    .line 3
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.google.pixel.livewallpaper"

    const-string v3, "com.google.pixel.livewallpaper.split.FeatureActivity"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const/high16 v1, 0x30000000

    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v1, "android.live_wallpaper.info"

    .line 6
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    const/4 p1, 0x4

    invoke-static {p0, v0, p1}, Lcom/android/wallpaper/util/ActivityUtils;->startActivityForResultSafely(Landroid/app/Activity;Landroid/content/Intent;I)V

    return-void
.end method
