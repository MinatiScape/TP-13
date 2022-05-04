.class public Lcom/android/wallpaper/picker/CustomizationPickerFragment;
.super Lcom/android/wallpaper/picker/AppbarFragment;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CustomizationSectionController$CustomizationSectionNavigationController;


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mBackStackSavedInstanceState:Landroid/os/Bundle;

.field public mNestedScrollView:Landroidx/core/widget/NestedScrollView;

.field public final mSectionControllers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/CustomizationSectionController<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/AppbarFragment;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mSectionControllers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getAvailableSections(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/CustomizationSectionController<",
            "*>;>;)",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/CustomizationSectionController<",
            "*>;>;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;-><init>(Lcom/android/wallpaper/picker/CustomizationPickerFragment;)V

    .line 2
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    .line 3
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public getDefaultTitle()Ljava/lang/CharSequence;
    .locals 1

    const v0, 0x7f110033

    .line 1
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getToolbarColorId()I
    .locals 0

    const p0, 0x106000d

    return p0
.end method

.method public getToolbarId()I
    .locals 0

    const p0, 0x7f0a0035

    return p0
.end method

.method public navigateTo(Landroidx/fragment/app/Fragment;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    .line 2
    new-instance v0, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v0, p0}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    const v1, 0x7f0a0101

    .line 3
    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    const/4 p1, 0x0

    .line 4
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/BackStackRecord;->commit()I

    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->executePendingTransactions()Z

    return-void
.end method

.method public onBackPressed()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v2, ":settings:fragment_args_key"

    .line 2
    invoke-virtual {v0, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mSectionControllers:Ljava/util/List;

    sget-object v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda1;->INSTANCE:Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda1;

    invoke-interface {p0, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    :cond_1
    return v1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 16

    move-object/from16 v9, p0

    const v0, 0x7f0d003d

    const/4 v1, 0x0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    .line 1
    invoke-virtual {v2, v0, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v10

    const v0, 0x7f0a00ae

    .line 2
    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    :cond_0
    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d005d

    invoke-virtual {v1, v2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/wallpaper/util/ActivityUtils;->isLaunchedFromSettingsRelated(Landroid/content/Intent;)Z

    move-result v0

    invoke-virtual {v9, v10, v0}, Lcom/android/wallpaper/picker/AppbarFragment;->setUpToolbar(Landroid/view/View;Z)V

    const v0, 0x7f0a01eb

    .line 6
    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Landroid/view/ViewGroup;

    .line 7
    sget-object v0, Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda0;

    invoke-virtual {v11, v0}, Landroid/view/ViewGroup;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    const v0, 0x7f0a01df

    .line 8
    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/core/widget/NestedScrollView;

    iput-object v0, v9, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    .line 9
    iget-object v0, v9, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mBackStackSavedInstanceState:Landroid/os/Bundle;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    .line 10
    iput-object v1, v9, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mBackStackSavedInstanceState:Landroid/os/Bundle;

    move-object v12, v0

    goto :goto_0

    :cond_1
    move-object/from16 v12, p3

    .line 11
    :goto_0
    iget-object v0, v9, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mSectionControllers:Ljava/util/List;

    sget-object v1, Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda2;->INSTANCE:Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda2;

    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 12
    iget-object v0, v9, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mSectionControllers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 13
    new-instance v0, Landroidx/lifecycle/ViewModelProvider;

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v1, Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    .line 14
    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    .line 15
    new-instance v0, Landroidx/lifecycle/ViewModelProvider;

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v1, Lcom/android/wallpaper/model/WorkspaceViewModel;

    .line 16
    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Lcom/android/wallpaper/model/WorkspaceViewModel;

    .line 17
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/wallpaper/module/Injector;->getCustomizationSections()Lcom/android/wallpaper/module/CustomizationSections;

    move-result-object v0

    .line 18
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v15

    .line 19
    iget-object v8, v9, Landroidx/fragment/app/Fragment;->mViewLifecycleOwner:Landroidx/fragment/app/FragmentViewLifecycleOwner;

    if-eqz v8, :cond_3

    .line 20
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lcom/android/wallpaper/model/PermissionRequester;

    .line 21
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/android/wallpaper/model/WallpaperPreviewNavigator;

    .line 22
    check-cast v0, Lcom/android/wallpaper/module/GoogleCustomizationSections;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 24
    new-instance v5, Lcom/android/wallpaper/model/WallpaperSectionController;

    move-object v0, v5

    move-object v1, v15

    move-object v2, v8

    move-object v4, v13

    move-object/from16 p1, v10

    move-object v10, v5

    move-object v5, v14

    move-object/from16 p2, v11

    move-object v11, v6

    move-object/from16 v6, p0

    move-object v9, v8

    move-object v8, v12

    invoke-direct/range {v0 .. v8}, Lcom/android/wallpaper/model/WallpaperSectionController;-><init>(Landroid/app/Activity;Landroidx/lifecycle/LifecycleOwner;Lcom/android/wallpaper/model/PermissionRequester;Lcom/android/wallpaper/model/WallpaperColorsViewModel;Lcom/android/wallpaper/model/WorkspaceViewModel;Lcom/android/wallpaper/model/CustomizationSectionController$CustomizationSectionNavigationController;Lcom/android/wallpaper/model/WallpaperPreviewNavigator;Landroid/os/Bundle;)V

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    new-instance v0, Lcom/android/customization/model/color/ColorSectionController;

    invoke-direct {v0, v15, v13, v9, v12}, Lcom/android/customization/model/color/ColorSectionController;-><init>(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperColorsViewModel;Landroidx/lifecycle/LifecycleOwner;Landroid/os/Bundle;)V

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    new-instance v0, Lcom/android/customization/model/mode/DarkModeSectionController;

    .line 27
    invoke-virtual {v9}, Landroidx/fragment/app/FragmentViewLifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v1

    invoke-direct {v0, v15, v1}, Lcom/android/customization/model/mode/DarkModeSectionController;-><init>(Landroid/content/Context;Landroidx/lifecycle/Lifecycle;)V

    .line 28
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    new-instance v0, Lcom/android/customization/model/themedicon/ThemedIconSectionController;

    .line 30
    sget-object v1, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->sThemedIconSwitchProvider:Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

    if-nez v1, :cond_2

    .line 31
    invoke-virtual {v15}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 32
    new-instance v2, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

    .line 33
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    new-instance v4, Lcom/android/customization/model/themedicon/ThemedIconUtils;

    const v5, 0x7f110136

    .line 34
    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Lcom/android/customization/model/themedicon/ThemedIconUtils;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 35
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v5

    .line 36
    invoke-interface {v5, v1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v1

    check-cast v1, Lcom/android/customization/module/CustomizationPreferences;

    invoke-direct {v2, v3, v4, v1}, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;-><init>(Landroid/content/ContentResolver;Lcom/android/customization/model/themedicon/ThemedIconUtils;Lcom/android/customization/module/CustomizationPreferences;)V

    sput-object v2, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->sThemedIconSwitchProvider:Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

    .line 37
    :cond_2
    sget-object v1, Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;->sThemedIconSwitchProvider:Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;

    .line 38
    invoke-direct {v0, v1, v14, v12}, Lcom/android/customization/model/themedicon/ThemedIconSectionController;-><init>(Lcom/android/customization/model/themedicon/ThemedIconSwitchProvider;Lcom/android/wallpaper/model/WorkspaceViewModel;Landroid/os/Bundle;)V

    .line 39
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    new-instance v0, Lcom/android/customization/model/grid/GridSectionController;

    .line 41
    invoke-static {v15}, Lcom/android/customization/model/grid/GridOptionsManager;->getInstance(Landroid/content/Context;)Lcom/android/customization/model/grid/GridOptionsManager;

    move-result-object v1

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2}, Lcom/android/customization/model/grid/GridSectionController;-><init>(Lcom/android/customization/model/grid/GridOptionsManager;Lcom/android/wallpaper/model/CustomizationSectionController$CustomizationSectionNavigationController;)V

    .line 42
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    iget-object v0, v2, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mSectionControllers:Ljava/util/List;

    invoke-virtual {v2, v11}, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->getAvailableSections(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 44
    iget-object v0, v2, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mSectionControllers:Ljava/util/List;

    new-instance v1, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;

    move-object/from16 v3, p2

    invoke-direct {v1, v2, v3}, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/CustomizationPickerFragment;Landroid/view/ViewGroup;)V

    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 45
    iget-object v0, v2, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    new-instance v1, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;

    invoke-direct {v1, v2, v12}, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/CustomizationPickerFragment;Landroid/os/Bundle;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    return-object p1

    .line 46
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t access the Fragment View\'s LifecycleOwner when getView() is null i.e., before onCreateView() or after onDestroyView()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onDestroyView()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mBackStackSavedInstanceState:Landroid/os/Bundle;

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->onSaveInstanceStateInternal(Landroid/os/Bundle;)V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mSectionControllers:Ljava/util/List;

    sget-object v1, Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda2;->INSTANCE:Lcom/android/wallpaper/picker/CustomizationPickerFragment$$ExternalSyntheticLambda2;

    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mSectionControllers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->onSaveInstanceStateInternal(Landroid/os/Bundle;)V

    return-void
.end method

.method public final onSaveInstanceStateInternal(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mNestedScrollView:Landroidx/core/widget/NestedScrollView;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScrollY()I

    move-result v0

    const-string v1, "SCROLL_POSITION_Y"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/CustomizationPickerFragment;->mSectionControllers:Ljava/util/List;

    new-instance v0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;

    invoke-direct {v0, p1}, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;-><init>(Landroid/os/Bundle;)V

    invoke-interface {p0, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method
