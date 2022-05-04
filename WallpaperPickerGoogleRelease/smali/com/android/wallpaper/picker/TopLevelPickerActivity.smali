.class public Lcom/android/wallpaper/picker/TopLevelPickerActivity;
.super Lcom/android/wallpaper/picker/BaseActivity;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/WallpapersUiContainer;
.implements Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter;
.implements Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$Listener;
.implements Lcom/android/wallpaper/picker/MyPhotosStarter;
.implements Lcom/android/wallpaper/picker/AppbarFragment$AppbarFragmentHost;
.implements Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/TopLevelPickerActivity$FetchThumbAssetTask;,
        Lcom/android/wallpaper/picker/TopLevelPickerActivity$AssetReceiver;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mBottomSheet:Landroid/widget/LinearLayout;

.field public mCurrentWallpaperExploreButton:Landroid/widget/Button;

.field public mCurrentWallpaperImage:Landroid/widget/ImageView;

.field public mCurrentWallpaperPresentationMode:Landroid/widget/TextView;

.field public mCurrentWallpaperSkipWallpaperButton:Landroid/widget/Button;

.field public mCurrentWallpaperSubtitle:Landroid/widget/TextView;

.field public mCurrentWallpaperTitle:Landroid/widget/TextView;

.field public mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

.field public mFragmentContainer:Landroid/widget/FrameLayout;

.field public mLastSelectedCategoryTabIndex:I

.field public mLoadingIndicatorContainer:Landroid/widget/FrameLayout;

.field public mNetworkStatusListener:Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;

.field public mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

.field public mPendingSetWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

.field public mRefreshWallpaperProgressDialog:Landroid/app/ProgressDialog;

.field public mSetWallpaperProgressDialog:Landroid/app/ProgressDialog;

.field public mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

.field public mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

.field public mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

.field public mWallpaperPositionOptions:Landroid/widget/LinearLayout;

.field public mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public cleanUp()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->cleanUp()V

    return-void
.end method

.method public doneFetchingCategories()V
    .locals 10

    .line 1
    iget v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mLastSelectedCategoryTabIndex:I

    const v1, 0x7f0a022f

    .line 2
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/tabs/TabLayout;

    .line 3
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->removeAllTabs()V

    .line 4
    iget-object v2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 5
    iget-object v2, v2, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 6
    invoke-interface {v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperCollectionId()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v5, v3

    move v6, v4

    .line 7
    :goto_0
    iget-object v7, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 8
    iget-object v7, v7, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 9
    check-cast v7, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    .line 10
    iget-boolean v8, v7, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mFetchedCategories:Z

    if-eqz v8, :cond_0

    iget-object v7, v7, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    goto :goto_1

    :cond_0
    move v7, v4

    :goto_1
    if-ge v6, v7, :cond_5

    .line 11
    iget-object v7, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 12
    iget-object v7, v7, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 13
    check-cast v7, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v7, v6}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->getCategory(I)Lcom/android/wallpaper/model/Category;

    move-result-object v7

    .line 14
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object v8

    .line 15
    iget-object v9, v7, Lcom/android/wallpaper/model/Category;->mTitle:Ljava/lang/String;

    .line 16
    invoke-virtual {v8, v9}, Lcom/google/android/material/tabs/TabLayout$Tab;->setText(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 17
    iput-object v7, v8, Lcom/google/android/material/tabs/TabLayout$Tab;->tag:Ljava/lang/Object;

    .line 18
    iget-object v9, v1, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-virtual {v1, v8, v9, v4}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;IZ)V

    if-nez v5, :cond_1

    .line 19
    invoke-virtual {v7}, Lcom/android/wallpaper/model/Category;->isEnumerable()Z

    move-result v9

    if-eqz v9, :cond_1

    move-object v5, v8

    :cond_1
    if-eq v6, v0, :cond_3

    const/4 v9, -0x1

    if-ne v0, v9, :cond_2

    if-nez v3, :cond_2

    .line 20
    invoke-virtual {v7}, Lcom/android/wallpaper/model/Category;->isEnumerable()Z

    move-result v9

    if-eqz v9, :cond_2

    if-eqz v2, :cond_2

    .line 21
    iget-object v7, v7, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 22
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    goto :goto_2

    :cond_2
    move v7, v4

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v7, 0x1

    :goto_3
    if-eqz v7, :cond_4

    move-object v3, v8

    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_5
    if-nez v3, :cond_6

    move-object v3, v5

    :cond_6
    if-eqz v3, :cond_7

    .line 23
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->select()V

    :cond_7
    return-void
.end method

.method public fetchCategories()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 3
    check-cast v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    .line 4
    iget-boolean v0, v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mFetchedCategories:Z

    xor-int/lit8 v0, v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->initialize(Z)V

    return-void
.end method

.method public getCategorySelectorFragment()Lcom/android/wallpaper/picker/CategorySelectorFragment;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 2
    iget v0, v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mFormFactor:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const v0, 0x7f0a0101

    .line 4
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/picker/CategoryFragment;

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mCategorySelectorFragment:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    return-object p0
.end method

.method public getMyPhotosStarter()Lcom/android/wallpaper/picker/MyPhotosStarter;
    .locals 0

    return-object p0
.end method

.method public final getTextColorForWallpaperPositionButton(Z)I
    .locals 0

    if-eqz p1, :cond_0

    const p1, 0x1010435

    goto :goto_0

    :cond_0
    const p1, 0x1010212

    .line 1
    :goto_0
    invoke-static {p0, p1}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public isReadExternalStoragePermissionGranted()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->isReadExternalStoragePermissionGranted()Z

    move-result p0

    return p0
.end method

.method public isUpArrowSupported()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/android/wallpaper/util/ActivityUtils;->isSUWMode(Landroid/content/Context;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, -0x1

    if-nez p1, :cond_1

    if-ne p2, v0, :cond_1

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 3
    iget v1, v1, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mFormFactor:I

    if-nez v1, :cond_1

    if-nez p3, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_1

    .line 5
    new-instance p1, Lcom/android/wallpaper/model/ImageWallpaperInfo;

    invoke-direct {p1, v1}, Lcom/android/wallpaper/model/ImageWallpaperInfo;-><init>(Landroid/net/Uri;)V

    .line 6
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCustomPhotoWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;)V

    return-void

    .line 7
    :cond_1
    iget-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_2

    const p1, 0x7f01001c

    const p2, 0x7f01001d

    .line 8
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 9
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_2
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

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 3
    :cond_0
    iget-object p0, p0, Landroidx/activity/ComponentActivity;->mOnBackPressedDispatcher:Landroidx/activity/OnBackPressedDispatcher;

    invoke-virtual {p0}, Landroidx/activity/OnBackPressedDispatcher;->onBackPressed()V

    return-void
.end method

.method public onClickTryAgain(I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mPendingSetWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    if-eqz p1, :cond_0

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCustomPhotoWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;)V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mLastSelectedCategoryTabIndex:I

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 4
    new-instance v1, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-direct {v1, p0, p0, v0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;-><init>(Lcom/android/wallpaper/picker/WallpapersUiContainer;Landroidx/fragment/app/FragmentActivity;Lcom/android/wallpaper/module/Injector;)V

    iput-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 5
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    .line 6
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getNetworkStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/NetworkStatusNotifier;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    .line 7
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    .line 8
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 10
    iget-object v0, v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 11
    check-cast v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v0}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->resetIfNeeded()Z

    .line 12
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 13
    iget-object v0, v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-static {v0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/app/WallpaperManager;->isWallpaperSupported()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 15
    invoke-virtual {v0}, Landroid/app/WallpaperManager;->isSetWallpaperAllowed()Z

    move-result v0

    xor-int/2addr v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    const v1, 0x7f0d0038

    const v3, 0x7f0a0101

    if-eqz v0, :cond_1

    .line 16
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 17
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    .line 18
    sget p1, Lcom/android/wallpaper/picker/WallpaperDisabledFragment;->$r8$clinit:I

    .line 19
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v1, "wallpaper_support_level"

    .line 20
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 21
    new-instance v0, Lcom/android/wallpaper/picker/WallpaperDisabledFragment;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/WallpaperDisabledFragment;-><init>()V

    .line 22
    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 23
    new-instance p1, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {p1, p0}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 24
    invoke-virtual {p1, v3, v0}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 25
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 27
    iget v0, v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mFormFactor:I

    if-ne v0, v2, :cond_3

    .line 28
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/wallpaper/util/ActivityUtils;->isSUWMode(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_2

    const p1, 0x7f0a0103

    .line 30
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/View;->setFitsSystemWindows(Z)V

    .line 31
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    .line 32
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    or-int/lit16 v0, v0, 0x200

    or-int/lit16 v0, v0, 0x100

    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 34
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 35
    sget-object v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/picker/TopLevelPickerActivity$$ExternalSyntheticLambda0;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    const p1, 0x7f0a026d

    .line 36
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 37
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getDelegate()Landroidx/appcompat/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AppCompatDelegate;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 38
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    .line 39
    invoke-virtual {p1, v3}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_6

    .line 40
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logAppLaunched(Landroid/content/Intent;)V

    .line 41
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->incrementAppLaunched()V

    .line 42
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/wallpaper/module/DailyLoggingAlarmScheduler;->setAlarm(Landroid/content/Context;)V

    const v0, 0x7f110141

    .line 43
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 44
    new-instance v0, Lcom/android/wallpaper/picker/CategoryFragment;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/CategoryFragment;-><init>()V

    .line 45
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "ToolbarFragment.title"

    .line 46
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 47
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 48
    new-instance p0, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {p0, p1}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 49
    invoke-virtual {p0, v3, v0}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 50
    invoke-virtual {p0}, Landroidx/fragment/app/BackStackRecord;->commit()I

    goto/16 :goto_1

    :cond_3
    const v0, 0x7f0d0037

    .line 51
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    const v0, 0x7f0a0079

    .line 52
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mBottomSheet:Landroid/widget/LinearLayout;

    const v1, 0x7f0a00b7

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperImage:Landroid/widget/ImageView;

    .line 54
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 55
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenAspectRatio(Landroid/content/Context;)F

    move-result v1

    .line 56
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f0700b2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    float-to-int v1, v2

    .line 57
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 58
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mBottomSheet:Landroid/widget/LinearLayout;

    const v1, 0x7f0a00b8

    .line 59
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperPresentationMode:Landroid/widget/TextView;

    const v0, 0x7f0a00bb

    .line 60
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperTitle:Landroid/widget/TextView;

    const v0, 0x7f0a00ba

    .line 61
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperSubtitle:Landroid/widget/TextView;

    const v0, 0x7f0a00b6

    .line 62
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperExploreButton:Landroid/widget/Button;

    const v0, 0x7f0a00b9

    .line 63
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mCurrentWallpaperSkipWallpaperButton:Landroid/widget/Button;

    .line 64
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mFragmentContainer:Landroid/widget/FrameLayout;

    const v0, 0x7f0a013a

    .line 65
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mLoadingIndicatorContainer:Landroid/widget/FrameLayout;

    const v0, 0x7f0a00d2

    .line 66
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mWallpaperPositionOptions:Landroid/widget/LinearLayout;

    const v0, 0x7f0a022f

    .line 67
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/tabs/TabLayout;

    .line 68
    new-instance v1, Lcom/android/wallpaper/picker/TopLevelPickerActivity$1;

    invoke-direct {v1, p0, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$1;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Lcom/google/android/material/tabs/TabLayout;)V

    .line 69
    iget-object v2, v0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 70
    iget-object v0, v0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    :cond_4
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 72
    invoke-virtual {v0, v3}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_5

    .line 73
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logAppLaunched(Landroid/content/Intent;)V

    .line 74
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->incrementAppLaunched()V

    .line 75
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/wallpaper/module/DailyLoggingAlarmScheduler;->setAlarm(Landroid/content/Context;)V

    .line 76
    :cond_5
    new-instance v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$2;

    invoke-direct {v0, p0, p1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$2;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mNetworkStatusListener:Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;

    .line 77
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    check-cast p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->registerListener(Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;)V

    :cond_6
    :goto_1
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->cleanUp()V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mNetworkStatusListener:Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;

    if-eqz v0, :cond_0

    .line 4
    iget-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mNetworkStatusNotifier:Lcom/android/wallpaper/module/NetworkStatusNotifier;

    check-cast v1, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-virtual {v1, v0}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->unregisterListener(Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;)V

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mRefreshWallpaperProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    .line 6
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 7
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mSetWallpaperProgressDialog:Landroid/app/ProgressDialog;

    if-eqz p0, :cond_2

    .line 8
    invoke-virtual {p0}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_2
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/wallpaper/picker/BaseActivity;->onResume()V

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "device_provisioned"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    move v2, v1

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-interface {v0, v2, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logResumed(ZZ)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    if-eqz v0, :cond_1

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const-string v2, "toplevel_set_wallpaper_error_dialog"

    .line 6
    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    :cond_1
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;

    move-result-object v0

    .line 2
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-super {p0, p1}, Landroidx/activity/ComponentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public onStop()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-interface {v0}, Lcom/android/wallpaper/module/UserEventLogger;->logStopped()V

    .line 2
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    return-void
.end method

.method public onUpArrowPressed()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->onBackPressed()V

    return-void
.end method

.method public onWallpapersReady()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setDesktopLoading(Z)V

    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCurrentWallpapersExpanded(Z)V

    return-void
.end method

.method public refreshCurrentWallpapers(Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 3
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getCurrentWallpaperFactory(Landroid/content/Context;)Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;

    move-result-object v2

    .line 4
    new-instance v3, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;

    invoke-direct {v3, p0, v1, p1, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$4;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Landroid/content/Context;Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;Lcom/android/wallpaper/module/Injector;)V

    check-cast v2, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;

    const/4 p0, 0x1

    invoke-virtual {v2, v3, p0}, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->createCurrentWallpaperInfos(Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;Z)V

    return-void
.end method

.method public requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    return-void
.end method

.method public requestExternalStoragePermission(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->requestExternalStoragePermission(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    return-void
.end method

.method public final setCenterCropWallpaperPositionButtonSelected(Landroid/widget/Button;Z)V
    .locals 2

    if-eqz p2, :cond_0

    const v0, 0x7f08006f

    goto :goto_0

    :cond_0
    const v0, 0x7f080070

    .line 1
    :goto_0
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    invoke-virtual {p1, v0, v1, v1, v1}, Landroid/widget/Button;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->getTextColorForWallpaperPositionButton(Z)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setTextColor(I)V

    return-void
.end method

.method public final setCenterWallpaperPositionButtonSelected(Landroid/widget/Button;Z)V
    .locals 2

    if-eqz p2, :cond_0

    const v0, 0x7f08006e

    goto :goto_0

    :cond_0
    const v0, 0x7f080071

    .line 1
    :goto_0
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    invoke-virtual {p1, v0, v1, v1, v1}, Landroid/widget/Button;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->getTextColorForWallpaperPositionButton(Z)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setTextColor(I)V

    return-void
.end method

.method public setCurrentWallpapersExpanded(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mBottomSheet:Landroid/widget/LinearLayout;

    .line 2
    invoke-static {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object p0

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    .line 3
    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    return-void
.end method

.method public final setCustomPhotoWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mPendingSetWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    const v0, 0x7f1200fe

    .line 2
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, p0, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mSetWallpaperProgressDialog:Landroid/app/ProgressDialog;

    const/4 v0, 0x0

    .line 3
    invoke-virtual {v1, v0}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mSetWallpaperProgressDialog:Landroid/app/ProgressDialog;

    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f110119

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 6
    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 7
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mSetWallpaperProgressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 8
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mSetWallpaperProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    new-instance v2, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;

    invoke-direct {v2, p0, p1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Lcom/android/wallpaper/model/WallpaperInfo;)V

    check-cast v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    invoke-virtual {v0, p0, p1, v1, v2}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaperWithPosition(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperInfo;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    return-void
.end method

.method public final setDesktopLoading(Z)V
    .locals 2

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p1, :cond_0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mLoadingIndicatorContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mFragmentContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    goto :goto_0

    .line 3
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mLoadingIndicatorContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mFragmentContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public final setStretchWallpaperPositionButtonSelected(Landroid/widget/Button;Z)V
    .locals 2

    if-eqz p2, :cond_0

    const v0, 0x7f08010c

    goto :goto_0

    :cond_0
    const v0, 0x7f08010d

    .line 1
    :goto_0
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    invoke-virtual {p1, v0, v1, v1, v1}, Landroid/widget/Button;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->getTextColorForWallpaperPositionButton(Z)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setTextColor(I)V

    return-void
.end method

.method public show(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->show(Ljava/lang/String;)V

    return-void
.end method

.method public showViewOnlyPreview(Lcom/android/wallpaper/model/WallpaperInfo;Z)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

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
