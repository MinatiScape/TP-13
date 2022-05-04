.class public Lcom/android/wallpaper/picker/CustomizationPickerActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;
.implements Lcom/android/wallpaper/picker/WallpapersUiContainer;
.implements Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;
.implements Lcom/android/wallpaper/widget/BottomActionBar$BottomActionBarHost;
.implements Lcom/android/wallpaper/picker/FragmentTransactionChecker;
.implements Lcom/android/wallpaper/model/PermissionRequester;
.implements Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;
.implements Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;
.implements Lcom/android/wallpaper/model/WallpaperPreviewNavigator;


# instance fields
.field public mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

.field public mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

.field public mIsSafeToCommitFragmentTransaction:Z

.field public mNetworkStatus:I

.field public mNetworkStatusListener:Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;

.field public mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

.field public mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public cleanUp()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->cleanUp()V

    return-void
.end method

.method public doneFetchingCategories()V
    .locals 0

    return-void
.end method

.method public fetchCategories()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 2
    iget-object v1, v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 3
    check-cast v1, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    invoke-static {p0}, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;->getToBeInstalledComponent(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 5
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v3

    .line 6
    invoke-interface {v3, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

    .line 7
    invoke-interface {p0}, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;->getLastToBeInstalled()Ljava/lang/String;

    move-result-object v3

    .line 8
    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_0

    .line 9
    invoke-interface {p0, v2}, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;->setLastToBeInstalled(Ljava/lang/String;)V

    move p0, v4

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    goto :goto_1

    .line 10
    :cond_1
    iget-boolean p0, v1, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mFetchedCategories:Z

    xor-int/2addr v4, p0

    .line 11
    :goto_1
    invoke-virtual {v0, v4}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->initialize(Z)V

    return-void
.end method

.method public getBottomActionBar()Lcom/android/wallpaper/widget/BottomActionBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    return-object p0
.end method

.method public getCategorySelectorFragment()Lcom/android/wallpaper/picker/CategorySelectorFragment;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const v0, 0x7f0a0101

    .line 2
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object p0

    .line 3
    instance-of v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;

    if-eqz v0, :cond_0

    .line 4
    check-cast p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getMyPhotosStarter()Lcom/android/wallpaper/picker/MyPhotosStarter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    return-object p0
.end method

.method public isHostToolbarShown()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isReadExternalStoragePermissionGranted()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->isReadExternalStoragePermissionGranted()Z

    move-result p0

    return p0
.end method

.method public isSafeToCommitFragmentTransaction()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mIsSafeToCommitFragmentTransaction:Z

    return p0
.end method

.method public isUpArrowSupported()Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/wallpaper/util/ActivityUtils;->isSUWMode(Landroid/content/Context;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public moveToPreviousFragment()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 3
    invoke-static {p0}, Lcom/android/wallpaper/util/ActivityUtils;->isSUWMode(Landroid/content/Context;)Z

    move-result p1

    const p2, 0x7f01001d

    const p3, 0x7f01001c

    if-eqz p1, :cond_0

    .line 4
    invoke-virtual {p0, p3, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setResult(I)V

    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0, p3, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    const/4 p1, -0x1

    .line 8
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setResult(I)V

    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 10
    invoke-static {p0}, Landroidx/cardview/R$style;->launchHome(Landroid/content/Context;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f0a0101

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 2
    instance-of v1, v0, Lcom/android/wallpaper/picker/BottomActionBarFragment;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/android/wallpaper/picker/BottomActionBarFragment;

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/BottomActionBarFragment;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    move-result v0

    if-eqz v0, :cond_2

    return-void

    .line 6
    :cond_2
    iget-object p0, p0, Landroidx/activity/ComponentActivity;->mOnBackPressedDispatcher:Landroidx/activity/OnBackPressedDispatcher;

    invoke-virtual {p0}, Landroidx/activity/OnBackPressedDispatcher;->onBackPressed()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 2
    new-instance v1, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-direct {v1, p0, p0, v0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;-><init>(Lcom/android/wallpaper/picker/WallpapersUiContainer;Landroidx/fragment/app/FragmentActivity;Lcom/android/wallpaper/module/Injector;)V

    iput-object v1, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 3
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    .line 4
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getNetworkStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/NetworkStatusNotifier;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    .line 5
    check-cast v1, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-virtual {v1}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->getNetworkStatus()I

    move-result v1

    iput v1, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mNetworkStatus:I

    .line 6
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 7
    new-instance p1, Lcom/android/wallpaper/module/LargeScreenMultiPanesChecker;

    invoke-direct {p1}, Lcom/android/wallpaper/module/LargeScreenMultiPanesChecker;-><init>()V

    .line 8
    invoke-virtual {p1, p0}, Lcom/android/wallpaper/module/LargeScreenMultiPanesChecker;->isMultiPanesEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string v3, "is_from_settings_homepage"

    .line 10
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    if-nez v3, :cond_1

    .line 11
    invoke-static {v1}, Lcom/android/wallpaper/util/ActivityUtils;->isLaunchedFromSettingsRelated(Landroid/content/Intent;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 12
    invoke-virtual {p1, v1}, Lcom/android/wallpaper/module/LargeScreenMultiPanesChecker;->getMultiPanesIntent(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object p1

    .line 13
    invoke-static {p0, p1, v2}, Lcom/android/wallpaper/util/ActivityUtils;->startActivityForResultSafely(Landroid/app/Activity;Landroid/content/Intent;I)V

    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_1
    const p1, 0x7f0d0031

    .line 15
    invoke-virtual {p0, p1}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    const p1, 0x7f0a0077

    .line 16
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/widget/BottomActionBar;

    iput-object p1, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 17
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p0}, Lcom/android/wallpaper/util/ActivityUtils;->isSUWMode(Landroid/content/Context;)Z

    move-result v1

    .line 18
    invoke-virtual {p1, v1}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V

    .line 19
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    const v1, 0x7f0a0101

    invoke-virtual {p1, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object p1

    if-nez p1, :cond_4

    .line 20
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 21
    iget-object p1, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/android/wallpaper/module/UserEventLogger;->logAppLaunched(Landroid/content/Intent;)V

    .line 22
    :cond_2
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/wallpaper/module/WallpaperPreferences;->incrementAppLaunched()V

    .line 23
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/wallpaper/module/DailyLoggingAlarmScheduler;->setAlarm(Landroid/content/Context;)V

    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "com.android.launcher3.WALLPAPER_FLAVOR"

    .line 25
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "wallpaper_only"

    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 27
    new-instance p1, Lcom/android/wallpaper/picker/WallpaperOnlyFragment;

    invoke-direct {p1}, Lcom/android/wallpaper/picker/WallpaperOnlyFragment;-><init>()V

    goto :goto_1

    .line 28
    :cond_3
    new-instance p1, Lcom/android/wallpaper/picker/CustomizationPickerFragment;

    invoke-direct {p1}, Lcom/android/wallpaper/picker/CustomizationPickerFragment;-><init>()V

    .line 29
    :goto_1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 30
    new-instance v2, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v2, v0}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 31
    invoke-virtual {v2, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 32
    invoke-virtual {v2}, Landroidx/fragment/app/BackStackRecord;->commitNow()V

    .line 33
    :cond_4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 34
    invoke-static {p1}, Landroidx/cardview/R$color;->getCollectionId(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 36
    new-instance v1, Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-direct {v1}, Lcom/android/wallpaper/picker/CategorySelectorFragment;-><init>()V

    invoke-virtual {p0, v1}, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->switchFragmentWithBackStack(Landroidx/fragment/app/Fragment;)V

    .line 37
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/android/wallpaper/module/Injector;->getIndividualPickerFragment(Ljava/lang/String;)Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->switchFragmentWithBackStack(Landroidx/fragment/app/Fragment;)V

    const/4 v0, 0x0

    .line 38
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 39
    :cond_5
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 40
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    check-cast p1, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {p1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->resetIfNeeded()Z

    move-result p1

    .line 41
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    new-instance v1, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$5;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$5;-><init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;)V

    check-cast v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v0, v1, p1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->fetchCategories(Lcom/android/wallpaper/model/CategoryReceiver;Z)V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onDestroy()V

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mIsSafeToCommitFragmentTransaction:Z

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.method public onResume()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mIsSafeToCommitFragmentTransaction:Z

    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.android.launcher3.WALLPAPER_FLAVOR"

    .line 4
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "wallpaper_only"

    .line 5
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "device_provisioned"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move v0, v4

    .line 7
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-interface {p0, v0, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logResumed(ZZ)V

    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStart()V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mNetworkStatusListener:Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;

    if-nez v0, :cond_0

    .line 3
    new-instance v0, Lcom/android/wallpaper/picker/CustomizationPickerActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/CustomizationPickerActivity$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/CustomizationPickerActivity;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mNetworkStatusListener:Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    check-cast p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->registerListener(Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logStopped()V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mNetworkStatusListener:Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;

    if-eqz v0, :cond_0

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    check-cast v1, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-virtual {v1, v0}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->unregisterListener(Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;)V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mNetworkStatusListener:Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;

    .line 5
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStop()V

    return-void
.end method

.method public onUpArrowPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->onBackPressed()V

    return-void
.end method

.method public onWallpapersReady()V
    .locals 0

    return-void
.end method

.method public removeToolbarMenu()V
    .locals 0

    return-void
.end method

.method public requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    return-void
.end method

.method public requestExternalStoragePermission(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->requestExternalStoragePermission(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    return-void
.end method

.method public setToolbarMenu(I)V
    .locals 0

    return-void
.end method

.method public setToolbarTitle(Ljava/lang/CharSequence;)V
    .locals 0

    return-void
.end method

.method public show(Lcom/android/wallpaper/model/Category;)V
    .locals 1

    .line 2
    instance-of v0, p1, Lcom/android/wallpaper/model/WallpaperCategory;

    if-nez v0, :cond_0

    .line 3
    iget-object p1, p1, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->show(Ljava/lang/String;)V

    return-void

    .line 5
    :cond_0
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 6
    iget-object p1, p1, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 7
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getIndividualPickerFragment(Ljava/lang/String;)Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->switchFragmentWithBackStack(Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method public show(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->show(Ljava/lang/String;)V

    return-void
.end method

.method public showViewOnlyPreview(Lcom/android/wallpaper/model/WallpaperInfo;Z)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mViewOnlyPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

    move-object v1, v0

    check-cast v1, Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity$ViewOnlyPreviewActivityIntentFactory;

    const/4 v2, 0x1

    .line 3
    iput-boolean v2, v1, Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity$ViewOnlyPreviewActivityIntentFactory;->mIsHomeAndLockPreviews:Z

    .line 4
    iput-boolean p2, v1, Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity$ViewOnlyPreviewActivityIntentFactory;->mIsViewAsHome:Z

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    const/4 p2, 0x2

    invoke-virtual {p1, p0, v0, p2}, Lcom/android/wallpaper/model/WallpaperInfo;->showPreview(Landroid/app/Activity;Lcom/android/wallpaper/model/InlinePreviewIntentFactory;I)V

    return-void
.end method

.method public final switchFragmentWithBackStack(Landroidx/fragment/app/Fragment;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 2
    new-instance v1, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v1, v0}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    const v0, 0x7f0a0101

    .line 3
    invoke-virtual {v1, v0, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    const/4 p1, 0x0

    .line 4
    invoke-virtual {v1, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 5
    invoke-virtual {v1}, Landroidx/fragment/app/BackStackRecord;->commit()I

    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->executePendingTransactions()Z

    return-void
.end method
