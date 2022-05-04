.class public Lcom/android/customization/model/color/ColorSectionController;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CustomizationSectionController;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/wallpaper/model/CustomizationSectionController<",
        "Lcom/android/customization/picker/color/ColorSectionView;",
        ">;"
    }
.end annotation


# instance fields
.field public final mColorManager:Lcom/android/customization/model/color/ColorCustomizationManager;

.field public final mColorSectionAdapter:Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;

.field public mColorSectionView:Lcom/android/customization/picker/color/ColorSectionView;

.field public mColorViewPager:Landroidx/viewpager2/widget/ViewPager2;

.field public final mEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

.field public mHomeWallpaperColors:Landroid/app/WallpaperColors;

.field public mHomeWallpaperColorsReady:Z

.field public mLastColorApplyingTime:J

.field public final mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

.field public mLockWallpaperColors:Landroid/app/WallpaperColors;

.field public mLockWallpaperColorsReady:Z

.field public final mPresetColorOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/customization/model/color/ColorOption;",
            ">;"
        }
    .end annotation
.end field

.field public mSelectedColor:Lcom/android/customization/model/color/ColorOption;

.field public mTabLayout:Lcom/android/wallpaper/widget/SeparatedTabLayout;

.field public mTabPositionToRestore:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final mWallpaperColorOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/customization/model/color/ColorOption;",
            ">;"
        }
    .end annotation
.end field

.field public final mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperColorsViewModel;Landroidx/lifecycle/LifecycleOwner;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;-><init>(Lcom/android/customization/model/color/ColorSectionController;Lcom/android/customization/model/color/ColorSectionController$1;)V

    iput-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorSectionAdapter:Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mWallpaperColorOptions:Ljava/util/List;

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mPresetColorOptions:Ljava/util/List;

    .line 5
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    move-result-object v0

    iput-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mTabPositionToRestore:Ljava/util/Optional;

    const-wide/16 v0, 0x0

    .line 6
    iput-wide v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mLastColorApplyingTime:J

    .line 7
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    check-cast v0, Lcom/android/customization/module/CustomizationInjector;

    .line 8
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v0

    check-cast v0, Lcom/android/customization/module/ThemesUserEventLogger;

    iput-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

    .line 9
    new-instance v0, Lcom/android/customization/model/theme/OverlayManagerCompat;

    invoke-direct {v0, p1}, Lcom/android/customization/model/theme/OverlayManagerCompat;-><init>(Landroid/content/Context;)V

    invoke-static {p1, v0}, Lcom/android/customization/model/color/ColorCustomizationManager;->getInstance(Landroid/content/Context;Lcom/android/customization/model/theme/OverlayManagerCompat;)Lcom/android/customization/model/color/ColorCustomizationManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorManager:Lcom/android/customization/model/color/ColorCustomizationManager;

    .line 10
    iput-object p2, p0, Lcom/android/customization/model/color/ColorSectionController;->mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    .line 11
    iput-object p3, p0, Lcom/android/customization/model/color/ColorSectionController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    if-eqz p4, :cond_0

    const-string p1, "COLOR_TAB_POSITION"

    .line 12
    invoke-virtual {p4, p1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 13
    invoke-virtual {p4, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object p1

    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mTabPositionToRestore:Ljava/util/Optional;

    :cond_0
    return-void
.end method


# virtual methods
.method public createView(Landroid/content/Context;)Lcom/android/wallpaper/picker/SectionView;
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d0040

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/customization/picker/color/ColorSectionView;

    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorSectionView:Lcom/android/customization/picker/color/ColorSectionView;

    const v0, 0x7f0a00a5

    .line 2
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/viewpager2/widget/ViewPager2;

    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorViewPager:Landroidx/viewpager2/widget/ViewPager2;

    .line 3
    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorSectionAdapter:Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;

    .line 4
    iget-object v2, p1, Landroidx/viewpager2/widget/ViewPager2;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v2

    .line 5
    iget-object v3, p1, Landroidx/viewpager2/widget/ViewPager2;->mAccessibilityProvider:Landroidx/viewpager2/widget/ViewPager2$AccessibilityProvider;

    invoke-virtual {v3, v2}, Landroidx/viewpager2/widget/ViewPager2$AccessibilityProvider;->onDetachAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    if-eqz v2, :cond_0

    .line 6
    iget-object v3, p1, Landroidx/viewpager2/widget/ViewPager2;->mCurrentItemDataSetChangeObserver:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;

    .line 7
    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {v2, v3}, Landroid/database/Observable;->unregisterObserver(Ljava/lang/Object;)V

    .line 8
    :cond_0
    iget-object v2, p1, Landroidx/viewpager2/widget/ViewPager2;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    const/4 v2, 0x0

    .line 9
    iput v2, p1, Landroidx/viewpager2/widget/ViewPager2;->mCurrentItem:I

    .line 10
    invoke-virtual {p1}, Landroidx/viewpager2/widget/ViewPager2;->restorePendingState()V

    .line 11
    iget-object v3, p1, Landroidx/viewpager2/widget/ViewPager2;->mAccessibilityProvider:Landroidx/viewpager2/widget/ViewPager2$AccessibilityProvider;

    invoke-virtual {v3, v0}, Landroidx/viewpager2/widget/ViewPager2$AccessibilityProvider;->onAttachAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    if-eqz v0, :cond_1

    .line 12
    iget-object p1, p1, Landroidx/viewpager2/widget/ViewPager2;->mCurrentItemDataSetChangeObserver:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;

    .line 13
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {v0, p1}, Landroid/database/Observable;->registerObserver(Ljava/lang/Object;)V

    .line 14
    :cond_1
    iget-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorViewPager:Landroidx/viewpager2/widget/ViewPager2;

    .line 15
    iput-boolean v2, p1, Landroidx/viewpager2/widget/ViewPager2;->mUserInputEnabled:Z

    .line 16
    iget-object p1, p1, Landroidx/viewpager2/widget/ViewPager2;->mAccessibilityProvider:Landroidx/viewpager2/widget/ViewPager2$AccessibilityProvider;

    check-cast p1, Landroidx/viewpager2/widget/ViewPager2$PageAwareAccessibilityProvider;

    .line 17
    invoke-virtual {p1}, Landroidx/viewpager2/widget/ViewPager2$PageAwareAccessibilityProvider;->updatePageAccessibilityActions()V

    .line 18
    iget-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorSectionView:Lcom/android/customization/picker/color/ColorSectionView;

    const v0, 0x7f0a01f2

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/widget/SeparatedTabLayout;

    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mTabLayout:Lcom/android/wallpaper/widget/SeparatedTabLayout;

    .line 19
    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorViewPager:Landroidx/viewpager2/widget/ViewPager2;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    new-instance v3, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;

    invoke-direct {v3, p1, v1}, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;-><init>(Lcom/google/android/material/tabs/TabLayout;Lcom/android/wallpaper/widget/SeparatedTabLayout$1;)V

    .line 21
    iget-object v4, v0, Landroidx/viewpager2/widget/ViewPager2;->mExternalPageChangeCallbacks:Landroidx/viewpager2/widget/CompositeOnPageChangeCallback;

    .line 22
    iget-object v4, v4, Landroidx/viewpager2/widget/CompositeOnPageChangeCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    new-instance v3, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnTabSelectedListener;

    invoke-direct {v3, v0, v1}, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnTabSelectedListener;-><init>(Landroidx/viewpager2/widget/ViewPager2;Lcom/android/wallpaper/widget/SeparatedTabLayout$1;)V

    .line 24
    iget-object v0, p1, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 25
    iget-object p1, p1, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    :cond_2
    iget-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->getHomeWallpaperColors()Landroidx/lifecycle/MutableLiveData;

    move-result-object p1

    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    new-instance v1, Lcom/android/customization/model/color/ColorSectionController$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v2}, Lcom/android/customization/model/color/ColorSectionController$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/model/color/ColorSectionController;I)V

    invoke-virtual {p1, v0, v1}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 27
    iget-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mWallpaperColorsViewModel:Lcom/android/wallpaper/model/WallpaperColorsViewModel;

    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->getLockWallpaperColors()Landroidx/lifecycle/MutableLiveData;

    move-result-object p1

    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    new-instance v1, Lcom/android/customization/model/color/ColorSectionController$$ExternalSyntheticLambda0;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lcom/android/customization/model/color/ColorSectionController$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/model/color/ColorSectionController;I)V

    invoke-virtual {p1, v0, v1}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 28
    iget-object p0, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorSectionView:Lcom/android/customization/picker/color/ColorSectionView;

    return-object p0
.end method

.method public isAvailable(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_4

    .line 1
    invoke-static {p1}, Lcom/android/customization/model/color/ColorUtils;->isMonetEnabled(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p0, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorManager:Lcom/android/customization/model/color/ColorCustomizationManager;

    .line 2
    iget-object p1, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mOverlayManagerCompat:Lcom/android/customization/model/theme/OverlayManagerCompat;

    .line 3
    iget-object p1, p1, Lcom/android/customization/model/theme/OverlayManagerCompat;->mOverlayManager:Landroid/content/om/OverlayManager;

    if-eqz p1, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    move p1, v1

    :goto_0
    if-eqz p1, :cond_3

    .line 4
    iget-object p0, p0, Lcom/android/customization/model/color/ColorCustomizationManager;->mProvider:Lcom/android/customization/model/color/ColorOptionsProvider;

    check-cast p0, Lcom/android/customization/model/color/ColorProvider;

    .line 5
    iget-boolean p1, p0, Lcom/android/customization/model/color/ColorProvider;->monetEnabled:Z

    if-eqz p1, :cond_2

    .line 6
    iget-object p1, p0, Lcom/android/customization/model/ResourcesApkProvider;->mStubApkResources:Landroid/content/res/Resources;

    if-eqz p1, :cond_1

    move p1, v0

    goto :goto_1

    :cond_1
    move p1, v1

    :goto_1
    if-eqz p1, :cond_2

    .line 7
    iget-boolean p0, p0, Lcom/android/customization/model/color/ColorProvider;->colorsAvailable:Z

    if-eqz p0, :cond_2

    move p0, v0

    goto :goto_2

    :cond_2
    move p0, v1

    :goto_2
    if-eqz p0, :cond_3

    move p0, v0

    goto :goto_3

    :cond_3
    move p0, v1

    :goto_3
    if-eqz p0, :cond_4

    goto :goto_4

    :cond_4
    move v0, v1

    :goto_4
    return v0
.end method

.method public final maybeLoadColors()V
    .locals 17

    move-object/from16 v0, p0

    .line 1
    iget-boolean v1, v0, Lcom/android/customization/model/color/ColorSectionController;->mHomeWallpaperColorsReady:Z

    if-eqz v1, :cond_6

    iget-boolean v1, v0, Lcom/android/customization/model/color/ColorSectionController;->mLockWallpaperColorsReady:Z

    if-eqz v1, :cond_6

    .line 2
    iget-object v1, v0, Lcom/android/customization/model/color/ColorSectionController;->mColorManager:Lcom/android/customization/model/color/ColorCustomizationManager;

    iget-object v2, v0, Lcom/android/customization/model/color/ColorSectionController;->mHomeWallpaperColors:Landroid/app/WallpaperColors;

    iget-object v3, v0, Lcom/android/customization/model/color/ColorSectionController;->mLockWallpaperColors:Landroid/app/WallpaperColors;

    .line 3
    iput-object v2, v1, Lcom/android/customization/model/color/ColorCustomizationManager;->mHomeWallpaperColors:Landroid/app/WallpaperColors;

    .line 4
    iput-object v3, v1, Lcom/android/customization/model/color/ColorCustomizationManager;->mLockWallpaperColors:Landroid/app/WallpaperColors;

    .line 5
    new-instance v10, Lcom/android/customization/model/color/ColorSectionController$1;

    invoke-direct {v10, v0}, Lcom/android/customization/model/color/ColorSectionController$1;-><init>(Lcom/android/customization/model/color/ColorSectionController;)V

    if-eqz v3, :cond_0

    .line 6
    invoke-virtual {v3, v2}, Landroid/app/WallpaperColors;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v3, 0x0

    :cond_0
    move-object v9, v3

    .line 7
    iget-object v0, v1, Lcom/android/customization/model/color/ColorCustomizationManager;->mProvider:Lcom/android/customization/model/color/ColorOptionsProvider;

    iget-object v8, v1, Lcom/android/customization/model/color/ColorCustomizationManager;->mHomeWallpaperColors:Landroid/app/WallpaperColors;

    move-object v5, v0

    check-cast v5, Lcom/android/customization/model/color/ColorProvider;

    .line 8
    iget-object v0, v5, Lcom/android/customization/model/color/ColorProvider;->homeWallpaperColors:Landroid/app/WallpaperColors;

    invoke-static {v0, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 9
    iget-object v0, v5, Lcom/android/customization/model/color/ColorProvider;->lockWallpaperColors:Landroid/app/WallpaperColors;

    invoke-static {v0, v9}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    :goto_1
    move v7, v0

    if-eqz v7, :cond_3

    .line 10
    iput-object v8, v5, Lcom/android/customization/model/color/ColorProvider;->homeWallpaperColors:Landroid/app/WallpaperColors;

    .line 11
    iput-object v9, v5, Lcom/android/customization/model/color/ColorProvider;->lockWallpaperColors:Landroid/app/WallpaperColors;

    .line 12
    :cond_3
    iget-object v0, v5, Lcom/android/customization/model/color/ColorProvider;->colorBundles:Ljava/util/List;

    if-eqz v0, :cond_5

    if-eqz v7, :cond_4

    goto :goto_2

    .line 13
    :cond_4
    invoke-virtual {v10, v0}, Lcom/android/customization/model/color/ColorSectionController$1;->onOptionsLoaded(Ljava/util/List;)V

    goto :goto_3

    .line 14
    :cond_5
    :goto_2
    iget-object v0, v5, Lcom/android/customization/model/color/ColorProvider;->scope:Lkotlinx/coroutines/CoroutineScope;

    const/4 v12, 0x0

    const/4 v13, 0x0

    new-instance v14, Lcom/android/customization/model/color/ColorProvider$fetch$1;

    const/4 v11, 0x0

    const/4 v6, 0x0

    move-object v4, v14

    invoke-direct/range {v4 .. v11}, Lcom/android/customization/model/color/ColorProvider$fetch$1;-><init>(Lcom/android/customization/model/color/ColorProvider;ZZLandroid/app/WallpaperColors;Landroid/app/WallpaperColors;Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;Lkotlin/coroutines/Continuation;)V

    const/4 v15, 0x3

    const/16 v16, 0x0

    move-object v11, v0

    invoke-static/range {v11 .. v16}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    :cond_6
    :goto_3
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorViewPager:Landroidx/viewpager2/widget/ViewPager2;

    if-eqz p0, :cond_0

    .line 2
    iget p0, p0, Landroidx/viewpager2/widget/ViewPager2;->mCurrentItem:I

    const-string v0, "COLOR_TAB_POSITION"

    .line 3
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public final setUpColorOptionsController(Lcom/android/customization/widget/OptionSelectorController;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/customization/widget/OptionSelectorController<",
            "Lcom/android/customization/model/color/ColorOption;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mSelectedColor:Lcom/android/customization/model/color/ColorOption;

    if-eqz v0, :cond_0

    .line 2
    iget-object v1, p1, Lcom/android/customization/widget/OptionSelectorController;->mOptions:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/android/customization/model/color/ColorSectionController;->mSelectedColor:Lcom/android/customization/model/color/ColorOption;

    invoke-virtual {p1, v0}, Lcom/android/customization/widget/OptionSelectorController;->setSelectedOption(Lcom/android/customization/model/CustomizationOption;)V

    .line 4
    :cond_0
    new-instance v0, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/model/color/ColorSectionController;)V

    .line 5
    iget-object p0, p1, Lcom/android/customization/widget/OptionSelectorController;->mListeners:Ljava/util/Set;

    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method
