.class public Lcom/android/wallpaper/picker/CategoryFragment;
.super Lcom/android/wallpaper/picker/AppbarFragment;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;
.implements Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;
.implements Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/CategoryFragment$PreviewPagerAdapter;,
        Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mBottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/bottomsheet/BottomSheetBehavior<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public mCategorySelectorFragment:Lcom/android/wallpaper/picker/CategorySelectorFragment;

.field public mHomePreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

.field public mIndividualPickerFragment:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

.field public mLockPreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

.field public mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

.field public mPreviewPager:Lcom/android/wallpaper/widget/PreviewPager;

.field public mRootContainer:Landroid/view/View;

.field public mWallPaperPreviews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

.field public mWallpaperIndex:I

.field public mWallpaperSurface:Landroid/view/SurfaceView;

.field public mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

.field public mWorkspaceSurface:Landroid/view/SurfaceView;

.field public mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/AppbarFragment;-><init>()V

    .line 2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 3
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    new-instance v0, Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mCategorySelectorFragment:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    return-void
.end method


# virtual methods
.method public cleanUp()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategoryFragment;->getFragmentHost()Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;->cleanUp()V

    return-void
.end method

.method public expandBottomSheet()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mBottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->state:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 3
    invoke-virtual {p0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    :cond_0
    return-void
.end method

.method public fetchCategories()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategoryFragment;->getFragmentHost()Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;->fetchCategories()V

    return-void
.end method

.method public getBottomSheetState()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mBottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    iget p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->state:I

    return p0
.end method

.method public getDefaultTitle()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f110033

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getFragmentHost()Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;

    return-object p0
.end method

.method public isHostToolbarShown()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public moveToPreviousFragment()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mCategorySelectorFragment:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    .line 3
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyChanged()V

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 12

    const p3, 0x7f0d0058

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 2
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallPaperPreviews:Ljava/util/List;

    const p3, 0x7f0d00ef

    const/4 v1, 0x0

    .line 3
    invoke-virtual {p1, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/cardview/widget/CardView;

    const v9, 0x7f0a029e

    .line 4
    invoke-virtual {v2, v9}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/SurfaceView;

    iput-object v3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    .line 5
    new-instance v4, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v5

    .line 7
    invoke-direct {v4, v3, v5, v0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;-><init>(Landroid/view/SurfaceView;Landroid/content/Context;Z)V

    .line 8
    iput-object v4, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    const v10, 0x7f0a029a

    .line 9
    invoke-virtual {v2, v10}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/SurfaceView;

    iput-object v3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    .line 10
    new-instance v11, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v6, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, v11

    move-object v5, v2

    .line 11
    invoke-direct/range {v3 .. v8}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;-><init>(Landroid/content/Context;Landroid/view/View;Landroid/view/SurfaceView;Ljava/util/concurrent/Future;Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;)V

    .line 12
    iput-object v11, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 13
    iget-object v3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallPaperPreviews:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    invoke-virtual {p1, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/cardview/widget/CardView;

    .line 15
    invoke-virtual {p1, v9}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p3

    const/16 v3, 0x8

    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 16
    invoke-virtual {p1, v10}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p3

    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    const p3, 0x7f0a013e

    .line 17
    invoke-virtual {p1, p3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup;

    .line 18
    invoke-virtual {p3, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 19
    new-instance v3, Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 20
    iget-object v4, p0, Landroidx/fragment/app/Fragment;->mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

    .line 21
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v4, v5, p3}, Lcom/android/wallpaper/widget/LockScreenPreviewer;-><init>(Landroidx/lifecycle/Lifecycle;Landroid/content/Context;Landroid/view/ViewGroup;)V

    iput-object v3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 22
    iget-object v3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallPaperPreviews:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const v3, 0x7f0a0297

    .line 23
    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/wallpaper/widget/PreviewPager;

    iput-object v3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mPreviewPager:Lcom/android/wallpaper/widget/PreviewPager;

    .line 24
    invoke-virtual {v3}, Lcom/android/wallpaper/widget/PreviewPager;->isRtl()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 25
    iget-object v3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallPaperPreviews:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 26
    :cond_0
    iget-object v3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mPreviewPager:Lcom/android/wallpaper/widget/PreviewPager;

    new-instance v4, Lcom/android/wallpaper/picker/CategoryFragment$PreviewPagerAdapter;

    iget-object v5, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallPaperPreviews:Ljava/util/List;

    invoke-direct {v4, v5}, Lcom/android/wallpaper/picker/CategoryFragment$PreviewPagerAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {v3, v4}, Lcom/android/wallpaper/widget/PreviewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 27
    iget-object v3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mPreviewPager:Lcom/android/wallpaper/widget/PreviewPager;

    new-instance v4, Lcom/android/wallpaper/picker/CategoryFragment$1;

    invoke-direct {v4, p0}, Lcom/android/wallpaper/picker/CategoryFragment$1;-><init>(Lcom/android/wallpaper/picker/CategoryFragment;)V

    .line 28
    iput-object v4, v3, Lcom/android/wallpaper/widget/PreviewPager;->mExternalPageListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    .line 29
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    .line 30
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategoryFragment;->getFragmentHost()Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;

    move-result-object v4

    .line 31
    invoke-virtual {v3}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 32
    invoke-virtual {v3}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v6, "android.permission.READ_WALLPAPER_INTERNAL"

    .line 33
    invoke-virtual {v5, v6, v3}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    const/4 v5, 0x1

    if-nez v3, :cond_1

    move v3, v5

    goto :goto_0

    :cond_1
    move v3, v0

    :goto_0
    if-nez v3, :cond_3

    .line 34
    invoke-interface {v4}, Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;->isReadExternalStoragePermissionGranted()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    move v3, v0

    goto :goto_2

    :cond_3
    :goto_1
    move v3, v5

    :goto_2
    if-eqz v3, :cond_4

    .line 35
    invoke-virtual {p0, p2, v5}, Lcom/android/wallpaper/picker/CategoryFragment;->showCurrentWallpaper(Landroid/view/View;Z)V

    goto :goto_3

    .line 36
    :cond_4
    invoke-virtual {p0, p2, v0}, Lcom/android/wallpaper/picker/CategoryFragment;->showCurrentWallpaper(Landroid/view/View;Z)V

    const v3, 0x7f0a01a2

    .line 37
    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 38
    new-instance v4, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda3;

    invoke-direct {v4, p0, p2}, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda3;-><init>(Lcom/android/wallpaper/picker/CategoryFragment;Landroid/view/View;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x7f110033

    .line 39
    invoke-virtual {p0, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f1100ff

    new-array v6, v5, [Ljava/lang/Object;

    aput-object v3, v6, v0

    .line 40
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const v3, 0x7f0a01a3

    .line 41
    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 42
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_3
    const v0, 0x7f0a0081

    .line 43
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 44
    invoke-static {v3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object v4

    iput-object v4, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mBottomSheetBehavior:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 45
    new-instance v6, Lcom/android/wallpaper/picker/CategoryFragment$2;

    invoke-direct {v6, p0}, Lcom/android/wallpaper/picker/CategoryFragment$2;-><init>(Lcom/android/wallpaper/picker/CategoryFragment;)V

    invoke-virtual {v4, v6}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    const v4, 0x7f0a01d0

    .line 46
    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mRootContainer:Landroid/view/View;

    .line 47
    new-instance v4, Lcom/android/wallpaper/picker/CategoryFragment$3;

    invoke-direct {v4, p0, v2, p1, p3}, Lcom/android/wallpaper/picker/CategoryFragment$3;-><init>(Lcom/android/wallpaper/picker/CategoryFragment;Landroidx/cardview/widget/CardView;Landroidx/cardview/widget/CardView;Landroid/view/ViewGroup;)V

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 48
    sget-object p1, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda1;->INSTANCE:Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda1;

    invoke-virtual {v3, p1}, Landroid/view/ViewGroup;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 49
    invoke-virtual {p0, p2, v5}, Lcom/android/wallpaper/picker/AppbarFragment;->setUpToolbar(Landroid/view/View;Z)V

    .line 50
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    .line 51
    new-instance p3, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {p3, p1}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 52
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mCategorySelectorFragment:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 53
    invoke-virtual {p3, v0, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 54
    invoke-virtual {p3}, Landroidx/fragment/app/FragmentTransaction;->commitNow()V

    .line 55
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    .line 56
    invoke-static {p1}, Landroidx/cardview/R$color;->getCollectionId(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p3

    .line 57
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 58
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v2

    .line 59
    invoke-interface {v2, p3}, Lcom/android/wallpaper/module/Injector;->getIndividualPickerFragment(Ljava/lang/String;)Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    move-result-object p3

    iput-object p3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mIndividualPickerFragment:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 60
    iget v2, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperIndex:I

    invoke-virtual {p3, v2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->highlightAppliedWallpaper(I)V

    .line 61
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p3

    .line 62
    new-instance v2, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v2, p3}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 63
    iget-object p3, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mIndividualPickerFragment:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 64
    invoke-virtual {v2, v0, p3}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 65
    invoke-virtual {v2, v1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 66
    invoke-virtual {v2}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    .line 67
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->executePendingTransactions()Z

    .line 68
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    :cond_5
    return-object p2
.end method

.method public onDestroy()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    :cond_0
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->cleanUp()V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->cleanUp()V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 5
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    .line 6
    iput-object v1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mPreviewPager:Lcom/android/wallpaper/widget/PreviewPager;

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/widget/PreviewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 8
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallPaperPreviews:Ljava/util/List;

    sget-object v1, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda5;->INSTANCE:Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda5;

    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 9
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallPaperPreviews:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->clear()V

    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a00c3

    if-ne p1, v0, :cond_1

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mIndividualPickerFragment:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mIndividualPickerFragment:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    new-instance p1, Lcom/android/wallpaper/picker/StartRotationDialogFragment;

    invoke-direct {p1}, Lcom/android/wallpaper/picker/StartRotationDialogFragment;-><init>()V

    .line 5
    invoke-virtual {p1, p0, v0}, Landroidx/fragment/app/Fragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 6
    iget-object p0, p0, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "start_rotation_dialog"

    .line 7
    invoke-virtual {p1, p0, v1}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return v0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public onPause()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

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
    .locals 4

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v1

    .line 3
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLastAppActiveTimestamp(J)V

    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object v1

    sget-object v2, Lcom/bumptech/glide/MemoryCategory;->NORMAL:Lcom/bumptech/glide/MemoryCategory;

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/Glide;->setMemoryCategory(Lcom/bumptech/glide/MemoryCategory;)Lcom/bumptech/glide/MemoryCategory;

    .line 5
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/Injector;->getCurrentWallpaperFactory(Landroid/content/Context;)Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;

    move-result-object v1

    .line 7
    new-instance v2, Lcom/android/wallpaper/picker/CategoryFragment$5;

    invoke-direct {v2, p0}, Lcom/android/wallpaper/picker/CategoryFragment$5;-><init>(Lcom/android/wallpaper/picker/CategoryFragment;)V

    check-cast v1, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;

    invoke-virtual {v1, v2, v0}, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->createCurrentWallpaperInfos(Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;Z)V

    .line 8
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p0, :cond_0

    .line 9
    iput-boolean v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    .line 10
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
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/wallpaper/picker/BottomActionBarFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-interface {p1, p2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperSurface:Landroid/view/SurfaceView;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1, p2}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWorkspaceSurfaceCallback:Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    return-void
.end method

.method public removeToolbarMenu()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    invoke-virtual {p0}, Landroid/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object p0

    invoke-interface {p0}, Landroid/view/Menu;->clear()V

    return-void
.end method

.method public requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategoryFragment;->getFragmentHost()Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/wallpaper/picker/MyPhotosStarter$MyPhotosStarterProvider;->getMyPhotosStarter()Lcom/android/wallpaper/picker/MyPhotosStarter;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/picker/MyPhotosStarter;->requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    return-void
.end method

.method public setToolbarMenu(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->inflateMenu(I)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    invoke-virtual {p1, p0}, Landroid/widget/Toolbar;->setOnMenuItemClickListener(Landroid/widget/Toolbar$OnMenuItemClickListener;)V

    return-void
.end method

.method public setToolbarTitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/AppbarFragment;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public show(Lcom/android/wallpaper/model/Category;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/wallpaper/model/WallpaperCategory;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategoryFragment;->getFragmentHost()Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;

    move-result-object p0

    .line 3
    iget-object p1, p1, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 4
    invoke-interface {p0, p1}, Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;->show(Ljava/lang/String;)V

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

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mIndividualPickerFragment:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 8
    iget v0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mWallpaperIndex:I

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->highlightAppliedWallpaper(I)V

    .line 9
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mIndividualPickerFragment:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    .line 11
    new-instance v0, Landroidx/fragment/app/BackStackRecord;

    invoke-direct {v0, p1}, Landroidx/fragment/app/BackStackRecord;-><init>(Landroidx/fragment/app/FragmentManager;)V

    const p1, 0x7f0a0081

    .line 12
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mIndividualPickerFragment:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 13
    invoke-virtual {v0, p1, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    const/4 p1, 0x0

    .line 14
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 15
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->executePendingTransactions()Z

    return-void
.end method

.method public final showCurrentWallpaper(Landroid/view/View;Z)V
    .locals 2

    const p0, 0x7f0a0297

    .line 1
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    .line 2
    :goto_0
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    const p0, 0x7f0a01a1

    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_1

    const/16 v0, 0x8

    .line 4
    :cond_1
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
