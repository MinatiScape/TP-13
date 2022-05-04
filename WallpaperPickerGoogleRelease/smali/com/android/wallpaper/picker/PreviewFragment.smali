.class public abstract Lcom/android/wallpaper/picker/PreviewFragment;
.super Lcom/android/wallpaper/picker/AppbarFragment;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;
.implements Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$Listener;
.implements Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/PreviewFragment$WallpaperInfoContent;
    }
.end annotation


# static fields
.field public static final ALPHA_OUT:Landroid/view/animation/Interpolator;


# instance fields
.field public mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

.field public mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

.field public mLastSelectedTabPositionOptional:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public mOnBackPressedCallback:Landroidx/activity/OnBackPressedCallback;

.field public mPreviewBitmapTransformation:Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;

.field public mRootView:Landroid/view/View;

.field public mSetWallpaperViewModel:Lcom/android/wallpaper/model/SetWallpaperViewModel;

.field public mShowInFullScreen:Z

.field public mStagedLoadWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;

.field public mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

.field public mTestingModeEnabled:Z

.field public mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

.field public mViewAsHome:Z

.field public mViewModelProvider:Landroidx/lifecycle/ViewModelProvider;

.field public mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

.field public mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    const/4 v1, 0x0

    const v2, 0x3f4ccccd    # 0.8f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    sput-object v0, Lcom/android/wallpaper/picker/PreviewFragment;->ALPHA_OUT:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/AppbarFragment;-><init>()V

    .line 2
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mLastSelectedTabPositionOptional:Ljava/util/Optional;

    return-void
.end method


# virtual methods
.method public createWorkspaceSurfaceCallback(Landroid/view/SurfaceView;)Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 v1, 0x0

    .line 2
    invoke-direct {v0, p1, p0, v1}, Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;-><init>(Landroid/view/SurfaceView;Landroid/content/Context;Z)V

    return-object v0
.end method

.method public finishActivity(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    if-nez p0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    const p1, 0x7f110149

    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 3
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not show toast "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "PreviewFragment"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 p1, -0x1

    .line 5
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setResult(I)V

    .line 6
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    const p1, 0x7f01001c

    const v0, 0x7f01001d

    .line 7
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    return-void
.end method

.method public getAttributions(Landroid/content/Context;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getDefaultTitle()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f110104

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public abstract getLayoutResId()I
.end method

.method public getToolbarColorId()I
    .locals 0

    const p0, 0x106000d

    return p0
.end method

.method public onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/AppbarFragment;->onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 3
    iget-boolean v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mShowInFullScreen:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 4
    sget-object v0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->EDIT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    new-instance v2, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v1}, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;I)V

    invoke-virtual {p1, v0, v2}, Lcom/android/wallpaper/widget/BottomActionBar;->setActionClickListener(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda2;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;I)V

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 6
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mRootView:Landroid/view/View;

    const v0, 0x7f0a0105

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->setFullScreenActions(Landroid/view/View;)V

    .line 7
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mOnBackPressedCallback:Landroidx/activity/OnBackPressedCallback;

    if-nez p1, :cond_1

    .line 8
    new-instance p1, Lcom/android/wallpaper/picker/PreviewFragment$1;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lcom/android/wallpaper/picker/PreviewFragment$1;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;Z)V

    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mOnBackPressedCallback:Landroidx/activity/OnBackPressedCallback;

    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 10
    iget-object p1, p1, Landroidx/activity/ComponentActivity;->mOnBackPressedDispatcher:Landroidx/activity/OnBackPressedDispatcher;

    .line 11
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mOnBackPressedCallback:Landroidx/activity/OnBackPressedCallback;

    invoke-virtual {p1, p0, v0}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    :cond_1
    return-void
.end method

.method public onClickOk()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_0
    return-void
.end method

.method public onClickTryAgain(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mSetWallpaperViewModel:Lcom/android/wallpaper/model/SetWallpaperViewModel;

    .line 2
    iput p1, v0, Lcom/android/wallpaper/model/SetWallpaperViewModel;->mDestination:I

    .line 3
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->setCurrentWallpaper(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 4
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    .line 5
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    const-string v2, "wallpaper"

    .line 6
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 7
    new-instance v1, Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;

    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v2, v3, :cond_0

    goto :goto_0

    :cond_0
    move v3, v4

    .line 9
    :goto_0
    invoke-direct {v1, p1, v3}, Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;-><init>(Landroid/content/Context;Z)V

    iput-object v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mPreviewBitmapTransformation:Lcom/android/wallpaper/picker/WallpaperPreviewBitmapTransformation;

    .line 10
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    const-string v2, "preview_mode"

    .line 11
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 12
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    const-string v2, "view_as_home"

    .line 13
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mViewAsHome:Z

    .line 14
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    const-string v2, "view_full_screen"

    .line 15
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mShowInFullScreen:Z

    .line 16
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mArguments:Landroid/os/Bundle;

    const-string v2, "testing_mode_enabled"

    .line 17
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mTestingModeEnabled:Z

    .line 18
    new-instance v1, Lcom/android/wallpaper/module/WallpaperSetter;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v2

    .line 19
    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p1

    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    iget-boolean v3, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mTestingModeEnabled:Z

    invoke-direct {v1, v2, p1, v0, v3}, Lcom/android/wallpaper/module/WallpaperSetter;-><init>(Lcom/android/wallpaper/module/WallpaperPersister;Lcom/android/wallpaper/module/WallpaperPreferences;Lcom/android/wallpaper/module/UserEventLogger;Z)V

    iput-object v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    .line 20
    new-instance p1, Landroidx/lifecycle/ViewModelProvider;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mViewModelProvider:Landroidx/lifecycle/ViewModelProvider;

    .line 21
    const-class v0, Lcom/android/wallpaper/model/SetWallpaperViewModel;

    invoke-virtual {p1, v0}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/model/SetWallpaperViewModel;

    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mSetWallpaperViewModel:Lcom/android/wallpaper/model/SetWallpaperViewModel;

    .line 22
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    .line 24
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 25
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/CharSequence;

    invoke-virtual {p1, p0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/PreviewFragment;->getLayoutResId()I

    move-result p3

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/android/wallpaper/picker/AppbarFragment;->setUpToolbar(Landroid/view/View;Z)V

    .line 3
    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mRootView:Landroid/view/View;

    .line 4
    new-instance p2, Lcom/android/wallpaper/util/FullScreenAnimation;

    invoke-direct {p2, p1}, Lcom/android/wallpaper/util/FullScreenAnimation;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda0;

    invoke-direct {p3, p0}, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    invoke-virtual {p0}, Lcom/android/wallpaper/module/WallpaperSetter;->cleanUp()V

    return-void
.end method

.method public onDialogDismissed(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    sget-object p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->APPLY:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar;->deselectAction(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    return-void
.end method

.method public onResume()V
    .locals 4

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    .line 3
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLastAppActiveTimestamp(J)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mStagedLoadWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    const-string v3, "load_wallpaper_error_dialog"

    .line 6
    invoke-virtual {v0, v2, v3}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 7
    iput-object v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mStagedLoadWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    if-eqz v0, :cond_1

    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v2

    const-string v3, "set_wallpaper_error_dialog"

    .line 10
    invoke-virtual {v0, v2, v3}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 11
    iput-object v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    .line 12
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mSetWallpaperViewModel:Lcom/android/wallpaper/model/SetWallpaperViewModel;

    .line 13
    iget-object v0, v0, Lcom/android/wallpaper/model/SetWallpaperViewModel;->mStatus:Landroidx/lifecycle/MutableLiveData;

    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    new-instance v2, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;)V

    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    return-void
.end method

.method public onSet(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mSetWallpaperViewModel:Lcom/android/wallpaper/model/SetWallpaperViewModel;

    .line 2
    iput p1, v0, Lcom/android/wallpaper/model/SetWallpaperViewModel;->mDestination:I

    .line 3
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->setCurrentWallpaper(I)V

    return-void
.end method

.method public onSetWallpaperClicked(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 2
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    .line 3
    iget-object v2, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    instance-of v2, v2, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    invoke-virtual {p1, v0, v1, p0, v2}, Lcom/android/wallpaper/module/WallpaperSetter;->requestDestination(Landroid/app/Activity;Landroidx/fragment/app/FragmentManager;Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;Z)V

    return-void
.end method

.method public abstract setCurrentWallpaper(I)V
.end method

.method public setFullScreenActions(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mShowInFullScreen:Z

    const v1, 0x7f0a01f4

    const v2, 0x7f0a0115

    if-nez v0, :cond_1

    .line 2
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 3
    iget-object v2, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 4
    iget-boolean v2, v2, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceVisibility:Z

    if-eqz v2, :cond_0

    const v2, 0x7f110095

    goto :goto_0

    :cond_0
    const v2, 0x7f110121

    .line 5
    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(I)V

    .line 6
    new-instance v2, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;I)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 8
    :cond_1
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 9
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    const p1, 0x7f0e0002

    .line 10
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/AppbarFragment;->setUpToolbarMenu(I)V

    const p1, 0x7f0a0044

    .line 11
    new-instance v0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;I)V

    .line 12
    iget-object v1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    invoke-virtual {v1}, Landroid/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v1

    invoke-interface {v1, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    .line 13
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0a004f

    .line 14
    new-instance v0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;I)V

    .line 15
    iget-object v1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    invoke-virtual {v1}, Landroid/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v1

    invoke-interface {v1, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    .line 16
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    :goto_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 18
    iget-boolean p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsFullScreen:Z

    if-eqz p1, :cond_2

    iget p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mBottomActionBarTranslation:F

    goto :goto_2

    :cond_2
    const/4 p1, 0x0

    .line 19
    :goto_2
    iget-object p0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mView:Landroid/view/View;

    const v0, 0x7f0a0077

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    return-void
.end method

.method public setUpTabs(Lcom/google/android/material/tabs/TabLayout;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object v0

    const v1, 0x7f110099

    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->setText(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 2
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object v0

    const v1, 0x7f1100a7

    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->setText(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 3
    new-instance v0, Lcom/android/wallpaper/picker/PreviewFragment$2;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/PreviewFragment$2;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;)V

    .line 4
    iget-object v1, p1, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 5
    iget-object v1, p1, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mLastSelectedTabPositionOptional:Ljava/util/Optional;

    new-instance v1, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda3;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;)V

    invoke-virtual {v0, v1}, Ljava/util/Optional;->orElseGet(Ljava/util/function/Supplier;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 7
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->select()V

    if-nez v0, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 8
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->updateScreenPreview(Z)V

    return-void
.end method

.method public showLoadWallpaperErrorDialog()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;

    invoke-direct {v0}, Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;-><init>()V

    const/4 v1, 0x1

    .line 2
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/Fragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/picker/BasePreviewActivity;

    if-eqz v1, :cond_0

    .line 4
    iget-boolean v1, v1, Lcom/android/wallpaper/picker/BaseActivity;->mIsSafeToCommitFragmentTransaction:Z

    if-eqz v1, :cond_0

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v1, "load_wallpaper_error_dialog"

    .line 6
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 7
    :cond_0
    iput-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mStagedLoadWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;

    :goto_0
    return-void
.end method

.method public abstract updateScreenPreview(Z)V
.end method
