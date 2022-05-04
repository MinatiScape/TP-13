.class public Lcom/android/customization/picker/grid/GridFragment;
.super Lcom/android/wallpaper/picker/AppbarFragment;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public final mApplyGridCallback:Lcom/android/customization/model/CustomizationManager$Callback;

.field public mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

.field public mContent:Landroid/view/View;

.field public mError:Landroid/view/View;

.field public mEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

.field public mGridManager:Lcom/android/customization/model/grid/GridOptionsManager;

.field public mGridOptionPreviewer:Lcom/android/customization/picker/grid/GridOptionPreviewer;

.field public mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

.field public mLoading:Landroidx/core/widget/ContentLoadingProgressBar;

.field public mOptionsContainer:Landroidx/recyclerview/widget/RecyclerView;

.field public mOptionsController:Lcom/android/customization/widget/OptionSelectorController;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/customization/widget/OptionSelectorController<",
            "Lcom/android/customization/model/grid/GridOption;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/AppbarFragment;-><init>()V

    .line 2
    new-instance v0, Lcom/android/customization/picker/grid/GridFragment$1;

    invoke-direct {v0, p0}, Lcom/android/customization/picker/grid/GridFragment$1;-><init>(Lcom/android/customization/picker/grid/GridFragment;)V

    iput-object v0, p0, Lcom/android/customization/picker/grid/GridFragment;->mApplyGridCallback:Lcom/android/customization/model/CustomizationManager$Callback;

    return-void
.end method

.method public static access$800(Lcom/android/customization/picker/grid/GridFragment;Lcom/android/customization/model/CustomizationOption;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    check-cast p1, Lcom/android/customization/model/grid/GridOption;

    invoke-virtual {v0, p1}, Lcom/android/customization/model/grid/GridOptionViewModel;->setSelectedOption(Lcom/android/customization/model/grid/GridOption;)V

    .line 2
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment;->mEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    invoke-virtual {v0}, Lcom/android/customization/model/grid/GridOptionViewModel;->getSelectedOption()Lcom/android/customization/model/grid/GridOption;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/android/customization/module/ThemesUserEventLogger;->logGridSelected(Lcom/android/customization/model/grid/GridOption;)V

    .line 3
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionPreviewer:Lcom/android/customization/picker/grid/GridOptionPreviewer;

    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    invoke-virtual {p0}, Lcom/android/customization/model/grid/GridOptionViewModel;->getSelectedOption()Lcom/android/customization/model/grid/GridOption;

    move-result-object p0

    .line 4
    iput-object p0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOption:Lcom/android/customization/model/grid/GridOption;

    if-eqz p0, :cond_2

    .line 5
    iget-object p0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mPreviewContainer:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    iget-object p0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mSurfaceCallback:Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 7
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->cleanUp()V

    .line 8
    iget-object p0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mSurfaceCallback:Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;

    .line 9
    iput-object v0, p0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->mLastSurface:Landroid/view/Surface;

    .line 10
    :cond_0
    iget-object p0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOptionSurface:Landroid/view/SurfaceView;

    if-nez p0, :cond_1

    .line 11
    new-instance p0, Landroid/view/SurfaceView;

    iget-object v1, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mPreviewContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object p0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOptionSurface:Landroid/view/SurfaceView;

    .line 12
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    iget-object p0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOptionSurface:Landroid/view/SurfaceView;

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 14
    new-instance p0, Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;

    iget-object v1, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOptionSurface:Landroid/view/SurfaceView;

    .line 15
    invoke-virtual {v1}, Landroid/view/SurfaceView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;-><init>(Lcom/android/customization/picker/grid/GridOptionPreviewer;Landroid/view/SurfaceView;Landroid/content/Context;Lcom/android/customization/picker/grid/GridOptionPreviewer$1;)V

    iput-object p0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mSurfaceCallback:Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;

    .line 16
    iget-object p0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOptionSurface:Landroid/view/SurfaceView;

    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p0

    iget-object v0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mSurfaceCallback:Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;

    invoke-interface {p0, v0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 17
    :cond_1
    iget-object p0, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mPreviewContainer:Landroid/view/ViewGroup;

    iget-object p1, p1, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOptionSurface:Landroid/view/SurfaceView;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public getDefaultTitle()Ljava/lang/CharSequence;
    .locals 1

    const v0, 0x7f110092

    .line 1
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public onBackPressed()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/customization/model/grid/GridOptionViewModel;->setSelectedOption(Lcom/android/customization/model/grid/GridOption;)V

    .line 2
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/customization/model/grid/GridOptionViewModel;->setBottomActionBarVisible(Z)V

    return v0
.end method

.method public onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/AppbarFragment;->onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V

    .line 2
    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 3
    sget-object v1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->APPLY_TEXT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->showActionsOnly([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 4
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    new-instance v0, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/picker/grid/GridFragment;)V

    invoke-virtual {p1, v1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->setActionClickListener(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    new-instance p1, Landroidx/lifecycle/ViewModelProvider;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v0, Lcom/android/customization/model/grid/GridOptionViewModel;

    invoke-virtual {p1, v0}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p1

    check-cast p1, Lcom/android/customization/model/grid/GridOptionViewModel;

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const p3, 0x7f0d0061

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/android/wallpaper/picker/AppbarFragment;->setUpToolbar(Landroid/view/View;Z)V

    const p3, 0x7f0a00b0

    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    iput-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mContent:Landroid/view/View;

    const p3, 0x7f0a018e

    .line 4
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mOptionsContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p3

    const-string v1, "accessibility"

    invoke-virtual {p3, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/accessibility/AccessibilityManager;

    .line 6
    invoke-virtual {p3}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result p3

    const/4 v1, 0x0

    if-eqz p3, :cond_0

    .line 7
    iget-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mOptionsContainer:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p3, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    :cond_0
    const p3, 0x7f0a0139

    .line 8
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroidx/core/widget/ContentLoadingProgressBar;

    iput-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mLoading:Landroidx/core/widget/ContentLoadingProgressBar;

    const p3, 0x7f0a00ef

    .line 9
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    iput-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mError:Landroid/view/View;

    .line 10
    sget-object p3, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda0;

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {p3}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object p3

    invoke-virtual {p3}, Lcom/bumptech/glide/Glide;->clearMemory()V

    .line 12
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {p3}, Lcom/android/customization/model/grid/GridOptionsManager;->getInstance(Landroid/content/Context;)Lcom/android/customization/model/grid/GridOptionsManager;

    move-result-object p3

    iput-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridManager:Lcom/android/customization/model/grid/GridOptionsManager;

    .line 13
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p3

    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {p3, v2}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object p3

    check-cast p3, Lcom/android/customization/module/ThemesUserEventLogger;

    iput-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mEventLogger:Lcom/android/customization/module/ThemesUserEventLogger;

    .line 15
    iget-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mContent:Landroid/view/View;

    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    iget-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mError:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 17
    iget-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mLoading:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-virtual {p3}, Landroidx/core/widget/ContentLoadingProgressBar;->show()V

    .line 18
    iget-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridManager:Lcom/android/customization/model/grid/GridOptionsManager;

    new-instance v2, Lcom/android/customization/picker/grid/GridFragment$2;

    invoke-direct {v2, p0}, Lcom/android/customization/picker/grid/GridFragment$2;-><init>(Lcom/android/customization/picker/grid/GridFragment;)V

    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    new-instance v3, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;

    iget-object p3, p3, Lcom/android/customization/model/grid/GridOptionsManager;->mProvider:Lcom/android/customization/model/grid/LauncherGridOptionsProvider;

    invoke-direct {v3, p3, v2, p2, v1}, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;-><init>(Lcom/android/customization/model/grid/LauncherGridOptionsProvider;Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;ZLcom/android/customization/model/grid/GridOptionsManager$1;)V

    new-array p2, v0, [Ljava/lang/Void;

    invoke-virtual {v3, p2}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    const p2, 0x7f0a0299

    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/SurfaceView;

    .line 21
    new-instance p3, Lcom/android/customization/picker/WallpaperPreviewer;

    .line 22
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mLifecycleRegistry:Landroidx/lifecycle/LifecycleRegistry;

    .line 23
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    const v3, 0x7f0a0296

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    invoke-direct {p3, v1, v2, v3, p2}, Lcom/android/customization/picker/WallpaperPreviewer;-><init>(Landroidx/lifecycle/Lifecycle;Landroid/app/Activity;Landroid/widget/ImageView;Landroid/view/SurfaceView;)V

    .line 24
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    .line 25
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {p2, v1}, Lcom/android/wallpaper/module/Injector;->getCurrentWallpaperFactory(Landroid/content/Context;)Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;

    move-result-object p2

    .line 26
    new-instance v1, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p3}, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda1;-><init>(Lcom/android/customization/picker/grid/GridFragment;Lcom/android/customization/picker/WallpaperPreviewer;)V

    check-cast p2, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;

    invoke-virtual {p2, v1, v0}, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->createCurrentWallpaperInfos(Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;Z)V

    .line 27
    new-instance p2, Lcom/android/customization/picker/grid/GridOptionPreviewer;

    iget-object p3, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridManager:Lcom/android/customization/model/grid/GridOptionsManager;

    const v0, 0x7f0a010d

    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p2, p3, v0}, Lcom/android/customization/picker/grid/GridOptionPreviewer;-><init>(Lcom/android/customization/model/grid/GridOptionsManager;Landroid/view/ViewGroup;)V

    iput-object p2, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionPreviewer:Lcom/android/customization/picker/grid/GridOptionPreviewer;

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionPreviewer:Lcom/android/customization/picker/grid/GridOptionPreviewer;

    if-eqz p0, :cond_1

    .line 3
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOptionSurface:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    .line 4
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mSurfaceCallback:Lcom/android/customization/picker/grid/GridOptionPreviewer$GridOptionSurfaceHolderCallback;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;->cleanUp()V

    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mGridOptionSurface:Landroid/view/SurfaceView;

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridOptionPreviewer;->mPreviewContainer:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    :cond_1
    return-void
.end method
