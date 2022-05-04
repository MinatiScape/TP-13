.class public Lcom/android/wallpaper/picker/TopLevelPickerActivity$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

.field public final synthetic val$tabLayout:Lcom/google/android/material/tabs/TabLayout;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Lcom/google/android/material/tabs/TabLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iput-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$1;->val$tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->tag:Ljava/lang/Object;

    .line 2
    check-cast v0, Lcom/android/wallpaper/model/Category;

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/model/Category;->isEnumerable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$1;->onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    :cond_0
    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 5

    .line 1
    iget-object p1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->tag:Ljava/lang/Object;

    .line 2
    check-cast p1, Lcom/android/wallpaper/model/Category;

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 4
    iget-object p1, p1, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 5
    iget-object v1, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 6
    iget-object v1, v1, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    check-cast v1, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v1, p1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->getCategory(Ljava/lang/String;)Lcom/android/wallpaper/model/Category;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {v1}, Lcom/android/wallpaper/model/Category;->isEnumerable()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 8
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    const v2, 0x7f0a0101

    .line 9
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 10
    new-instance v4, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v4, v1}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 11
    invoke-virtual {v4, v3}, Landroidx/fragment/app/BackStackRecord;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 12
    invoke-virtual {v4}, Landroidx/fragment/app/BackStackRecord;->commit()I

    .line 13
    :cond_1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v3

    .line 14
    invoke-interface {v3, p1}, Lcom/android/wallpaper/module/Injector;->getIndividualPickerFragment(Ljava/lang/String;)Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    move-result-object p1

    .line 15
    new-instance v3, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v3, v1}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 16
    invoke-virtual {v3, v2, p1}, Landroidx/fragment/app/FragmentTransaction;->add(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 17
    invoke-virtual {v3}, Landroidx/fragment/app/BackStackRecord;->commit()I

    .line 18
    iput-object v0, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetPresenter:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter;

    .line 19
    iput-object v0, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapersUiContainer:Lcom/android/wallpaper/picker/WallpapersUiContainer;

    goto :goto_0

    .line 20
    :cond_2
    iget-object p1, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 21
    iget-object p1, p1, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPickerIntentFactory:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$IndividualPickerActivityIntentFactory;

    const/4 v2, 0x0

    .line 22
    invoke-virtual {v1, v0, p1, v2}, Lcom/android/wallpaper/model/Category;->show(Landroid/app/Activity;Lcom/android/wallpaper/model/PickerIntentFactory;I)V

    const p1, 0x7f0a022f

    .line 23
    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/tabs/TabLayout;

    .line 24
    iget v0, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mLastSelectedCategoryTabIndex:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_3

    .line 25
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object p1

    .line 26
    iget-object v0, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->tag:Ljava/lang/Object;

    .line 27
    check-cast v0, Lcom/android/wallpaper/model/Category;

    invoke-virtual {v0}, Lcom/android/wallpaper/model/Category;->isEnumerable()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 28
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->select()V

    .line 29
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$1;->val$tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    move-result p0

    .line 30
    iput p0, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mLastSelectedCategoryTabIndex:I

    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method
