.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;
.super Lcom/android/wallpaper/picker/AppbarFragment;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/RotationStarter;
.implements Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment$Listener;
.implements Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;
.implements Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$Listener;
.implements Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;
.implements Lcom/android/wallpaper/picker/StartRotationDialogFragment$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$GridPaddingDecoration;,
        Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;,
        Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$EmptySelectionAnimator;,
        Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

.field public mAppStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

.field public mAppliedWallpaperIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mAppliedWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

.field public mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

.field public mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

.field public mCurrentWallpaperBottomSheetExpandedRunnable:Ljava/lang/Runnable;

.field public mCurrentWallpaperBottomSheetPresenter:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter;

.field public mFormFactor:I

.field public mHandler:Landroid/os/Handler;

.field public mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

.field public mIsWallpapersReceived:Z

.field public mLoading:Landroidx/core/widget/ContentLoadingProgressBar;

.field public mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

.field public mPendingSetIndividualHolder:Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

.field public mProgressDialog:Landroid/app/ProgressDialog;

.field public mRandom:Ljava/util/Random;

.field public mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

.field public mStagedStartRotationErrorDialogFragment:Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;

.field public mTileSizePx:Landroid/graphics/Point;

.field public mUpdateDailyWallpaperThumbRunnable:Ljava/lang/Runnable;

.field public mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

.field public mWallpaperChangedListener:Lcom/android/wallpaper/module/WallpaperChangedNotifier$Listener;

.field public mWallpaperChangedNotifier:Lcom/android/wallpaper/module/WallpaperChangedNotifier;

.field public mWallpaperDestination:I

.field public mWallpaperManager:Landroid/app/WallpaperManager;

.field public mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

.field public mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

.field public mWallpaperRotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

.field public mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

.field public mWallpapers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;"
        }
    .end annotation
.end field

.field public mWallpapersUiContainer:Lcom/android/wallpaper/picker/WallpapersUiContainer;

.field public mWasUpdateRunnableRun:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/AppbarFragment;-><init>()V

    .line 2
    new-instance v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$1;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperChangedListener:Lcom/android/wallpaper/module/WallpaperChangedNotifier$Listener;

    .line 3
    new-instance v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$2;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$2;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mUpdateDailyWallpaperThumbRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method public static access$1000(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/picker/FragmentTransactionChecker;

    if-eqz v0, :cond_1

    .line 2
    new-instance v1, Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;

    invoke-direct {v1}, Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;-><init>()V

    .line 3
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v3, "network_preference"

    .line 4
    invoke-virtual {v2, v3, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 5
    invoke-virtual {v1, v2}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 6
    invoke-virtual {v1, p0, p1}, Landroidx/fragment/app/Fragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 7
    invoke-interface {v0}, Lcom/android/wallpaper/picker/FragmentTransactionChecker;->isSafeToCommitFragmentTransaction()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 8
    iget-object p0, p0, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string p1, "start_rotation_error_dialog"

    .line 9
    invoke-virtual {v1, p0, p1}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 10
    :cond_0
    iput-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mStagedStartRotationErrorDialogFragment:Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;

    :cond_1
    :goto_0
    return-void
.end method

.method public static access$300(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mRandom:Ljava/util/Random;

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/model/WallpaperInfo;

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v2

    .line 5
    new-instance v6, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$3;

    invoke-direct {v6, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$3;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V

    .line 6
    iget-object p0, p1, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mActivity:Landroid/app/Activity;

    const v0, 0x1010530

    .line 7
    invoke-static {p0, v0}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v7

    .line 8
    iget-object p0, p1, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mThumbnailView:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-nez p0, :cond_0

    const/16 p0, 0x12c

    goto :goto_0

    :cond_0
    const/16 p0, 0x7d0

    :goto_0
    move v5, p0

    .line 9
    iget-object v3, p1, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mActivity:Landroid/app/Activity;

    iget-object v4, p1, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;->mThumbnailView:Landroid/widget/ImageView;

    invoke-virtual/range {v2 .. v7}, Lcom/android/wallpaper/asset/Asset;->loadDrawableWithTransition(Landroid/content/Context;Landroid/widget/ImageView;ILcom/android/wallpaper/asset/Asset$DrawableLoadedListener;I)V

    return-void
.end method


# virtual methods
.method public fetchWallpapers(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mIsWallpapersReceived:Z

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->updateLoading()V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;

    invoke-direct {v2, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V

    invoke-virtual {v0, v1, v2, p1}, Lcom/android/wallpaper/model/WallpaperCategory;->fetchWallpapers(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperReceiver;Z)V

    return-void
.end method

.method public final getIndividualPickerFragmentHost()Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->mParentFragment:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    .line 2
    check-cast v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;

    return-object v0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;

    return-object p0
.end method

.method public getNumColumns()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 2
    :cond_0
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isFewerColumnLayout()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 3
    invoke-static {v0}, Lcom/android/wallpaper/util/SizeCalculator;->getActivityWindowWidthPx(Landroid/app/Activity;)I

    move-result p0

    const/4 v1, 0x2

    .line 4
    invoke-static {v0, p0, v1, v1}, Lcom/android/wallpaper/util/SizeCalculator;->getNumColumns(Landroid/content/Context;III)I

    move-result p0

    goto :goto_0

    .line 5
    :cond_1
    invoke-static {v0}, Lcom/android/wallpaper/util/SizeCalculator;->getActivityWindowWidthPx(Landroid/app/Activity;)I

    move-result p0

    const/4 v1, 0x3

    const/4 v2, 0x4

    .line 6
    invoke-static {v0, p0, v1, v2}, Lcom/android/wallpaper/util/SizeCalculator;->getNumColumns(Landroid/content/Context;III)I

    move-result p0

    :goto_0
    return p0
.end method

.method public highlightAppliedWallpaper(I)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperDestination:I

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    if-eqz p1, :cond_4

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->showCheckMarkAndBorderForAppliedWallpaper(Z)V

    .line 4
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {v1}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v1

    .line 6
    iget-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperManager:Landroid/app/WallpaperManager;

    const/4 v3, 0x2

    .line 7
    invoke-virtual {v2, v3}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    move-result v2

    const/4 v3, 0x1

    if-gez v2, :cond_0

    move p1, v3

    :cond_0
    if-nez p1, :cond_2

    .line 8
    iget p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperDestination:I

    if-nez p1, :cond_1

    goto :goto_0

    .line 9
    :cond_1
    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperRemoteId()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    .line 10
    invoke-virtual {v1}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_3
    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperRemoteId()Ljava/lang/String;

    move-result-object p1

    .line 11
    :goto_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    .line 12
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    sget-object v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$$ExternalSyntheticLambda1;->INSTANCE:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$$ExternalSyntheticLambda1;

    .line 13
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;)V

    .line 14
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p1

    .line 15
    invoke-interface {p1}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    move-result-object p1

    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppliedWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 17
    invoke-virtual {p0, v3}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->showCheckMarkAndBorderForAppliedWallpaper(Z)V

    :cond_4
    return-void
.end method

.method public isFewerColumnLayout()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    const/16 v0, 0x8

    if-gt p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isRotationEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperRotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public maybeSetUpImageGrid()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    if-nez v0, :cond_1

    return-void

    .line 3
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_2

    return-void

    .line 4
    :cond_2
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 5
    iget v0, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    .line 6
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getNumColumns()I

    move-result v2

    if-eq v0, v2, :cond_3

    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    move v0, v1

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    if-eqz v2, :cond_4

    if-nez v0, :cond_4

    return-void

    .line 8
    :cond_4
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemDecorationCount()I

    move-result v0

    :goto_1
    if-ge v1, v0, :cond_5

    .line 9
    iget-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecorationAt(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 10
    :cond_5
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$GridPaddingDecoration;

    .line 11
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isFewerColumnLayout()Z

    move-result v2

    const v3, 0x7f070107

    const v4, 0x7f07010b

    if-eqz v2, :cond_6

    .line 12
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_2

    .line 13
    :cond_6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 14
    :goto_2
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isFewerColumnLayout()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 15
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070106

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    goto :goto_3

    .line 16
    :cond_7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f07010a

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 17
    :goto_3
    invoke-direct {v1, p0, v2, v5}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$GridPaddingDecoration;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;II)V

    .line 18
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 19
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isFewerColumnLayout()Z

    move-result v0

    const v1, 0x7f0700f2

    const v2, 0x7f0702b5

    if-eqz v0, :cond_8

    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_4

    .line 21
    :cond_8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 22
    :goto_4
    iget-object v5, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v6

    iget-object v7, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v7

    .line 24
    invoke-virtual {v5, v0, v6, v0, v7}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 25
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isFewerColumnLayout()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 28
    invoke-static {v0}, Lcom/android/wallpaper/util/SizeCalculator;->getActivityWindowWidthPx(Landroid/app/Activity;)I

    move-result v4

    const/4 v5, 0x2

    .line 29
    invoke-static {v0, v4, v5, v5}, Lcom/android/wallpaper/util/SizeCalculator;->getNumColumns(Landroid/content/Context;III)I

    move-result v0

    .line 30
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 31
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 32
    invoke-static {v0, v4, v3, v1}, Lcom/android/wallpaper/util/SizeCalculator;->getSquareTileSize(IIII)Landroid/graphics/Point;

    move-result-object v0

    goto :goto_5

    .line 33
    :cond_9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 35
    invoke-static {v0}, Lcom/android/wallpaper/util/SizeCalculator;->getActivityWindowWidthPx(Landroid/app/Activity;)I

    move-result v3

    const/4 v5, 0x3

    const/4 v6, 0x4

    .line 36
    invoke-static {v0, v3, v5, v6}, Lcom/android/wallpaper/util/SizeCalculator;->getNumColumns(Landroid/content/Context;III)I

    move-result v0

    .line 37
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 38
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 39
    invoke-static {v0, v3, v4, v1}, Lcom/android/wallpaper/util/SizeCalculator;->getSquareTileSize(IIII)Landroid/graphics/Point;

    move-result-object v0

    .line 40
    :goto_5
    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mTileSizePx:Landroid/graphics/Point;

    .line 41
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->setUpImageGrid()V

    .line 42
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;

    iget-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    iget-object v3, p0, Landroidx/fragment/app/Fragment;->mParentFragment:Landroidx/fragment/app/Fragment;

    .line 44
    check-cast v3, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getNumColumns()I

    move-result p0

    invoke-direct {v1, v2, v3, p0}, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;I)V

    .line 45
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAccessibilityDelegateCompat(Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;)V

    return-void
.end method

.method public onCategoryLoaded()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getIndividualPickerFragmentHost()Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getIndividualPickerFragmentHost()Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;->isHostToolbarShown()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getIndividualPickerFragmentHost()Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    .line 4
    iget-object v1, v1, Lcom/android/wallpaper/model/Category;->mTitle:Ljava/lang/String;

    .line 5
    invoke-interface {v0, v1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;->setToolbarTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 6
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    .line 7
    iget-object v0, v0, Lcom/android/wallpaper/model/Category;->mTitle:Ljava/lang/String;

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/AppbarFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 9
    :goto_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    invoke-virtual {v0}, Lcom/android/wallpaper/model/Category;->getWallpaperRotationInitializer()Lcom/android/wallpaper/model/WallpaperRotationInitializer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperRotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

    .line 10
    iget-object v0, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mToolbar:Landroid/widget/Toolbar;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isRotationEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0e0003

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/AppbarFragment;->setUpToolbarMenu(I)V

    :cond_2
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->fetchWallpapers(Z)V

    .line 13
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    instance-of v0, v0, Lcom/android/wallpaper/model/ThirdPartyLiveWallpaperCategory;

    if-eqz v0, :cond_3

    .line 15
    new-instance v0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    .line 16
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    check-cast p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    const-string v1, "android.service.wallpaper.WallpaperService"

    invoke-virtual {p0, v0, v1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->addListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;Ljava/lang/String;)V

    :cond_3
    return-void
.end method

.method public onClickTryAgain(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mPendingSetIndividualHolder:Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->setWallpaper()V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 4
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v2

    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 5
    invoke-static {}, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->getInstance()Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    move-result-object v2

    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperChangedNotifier:Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    .line 6
    iget-object v3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperChangedListener:Lcom/android/wallpaper/module/WallpaperChangedNotifier$Listener;

    .line 7
    iget-object v4, v2, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->mListeners:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 8
    iget-object v2, v2, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->mListeners:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    :cond_0
    invoke-static {v1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v2

    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 10
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x1

    iput v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    .line 11
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getPackageStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/PackageStatusNotifier;

    move-result-object v2

    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    .line 12
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v2

    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    .line 13
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v2

    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    .line 14
    new-instance v3, Lcom/android/wallpaper/module/WallpaperSetter;

    .line 15
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v4

    .line 16
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v3, v2, v4, v5, v6}, Lcom/android/wallpaper/module/WallpaperSetter;-><init>(Lcom/android/wallpaper/module/WallpaperPersister;Lcom/android/wallpaper/module/WallpaperPreferences;Lcom/android/wallpaper/module/UserEventLogger;Z)V

    iput-object v3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    .line 17
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    .line 18
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mRandom:Ljava/util/Random;

    .line 19
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mHandler:Landroid/os/Handler;

    if-eqz p1, :cond_1

    const-string v2, "IndividualPickerFragment.NIGHT_MODE"

    .line 20
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    .line 21
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v2, v2, 0x30

    if-eq p1, v2, :cond_1

    .line 22
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object p1

    invoke-virtual {p1}, Lcom/bumptech/glide/Glide;->clearMemory()V

    .line 23
    :cond_1
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getCategoryProvider(Landroid/content/Context;)Lcom/android/wallpaper/model/CategoryProvider;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 24
    new-instance v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$4;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$4;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V

    check-cast p1, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {p1, v0, v6}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->fetchCategories(Lcom/android/wallpaper/model/CategoryReceiver;Z)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const p3, 0x7f0d0063

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getIndividualPickerFragmentHost()Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;

    move-result-object p2

    invoke-interface {p2}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;->isHostToolbarShown()Z

    move-result p2

    const p3, 0x7f0e0003

    const/4 v1, 0x1

    if-eqz p2, :cond_0

    const p2, 0x7f0a0113

    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/16 v2, 0x8

    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 4
    iput-boolean v1, p0, Lcom/android/wallpaper/picker/AppbarFragment;->mUpArrowEnabled:Z

    .line 5
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isRotationEnabled()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 6
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getIndividualPickerFragmentHost()Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;

    move-result-object p2

    invoke-interface {p2, p3}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;->setToolbarMenu(I)V

    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0, p1, v1}, Lcom/android/wallpaper/picker/AppbarFragment;->setUpToolbar(Landroid/view/View;Z)V

    .line 8
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isRotationEnabled()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 9
    invoke-virtual {p0, p3}, Lcom/android/wallpaper/picker/AppbarFragment;->setUpToolbarMenu(I)V

    .line 10
    :cond_1
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    if-eqz p2, :cond_2

    .line 11
    iget-object p2, p2, Lcom/android/wallpaper/model/Category;->mTitle:Ljava/lang/String;

    .line 12
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/picker/AppbarFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 13
    :cond_2
    :goto_0
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-interface {p2, p3}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p2

    .line 14
    iget-object p3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperManager:Landroid/app/WallpaperManager;

    invoke-virtual {p3}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object p3

    .line 15
    new-instance v2, Landroid/util/ArraySet;

    invoke-direct {v2}, Landroid/util/ArraySet;-><init>()V

    if-eqz p3, :cond_3

    .line 16
    invoke-virtual {p3}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    move-result-object p3

    goto :goto_1

    .line 17
    :cond_3
    invoke-interface {p2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperRemoteId()Ljava/lang/String;

    move-result-object p3

    .line 18
    :goto_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 19
    invoke-virtual {v2, p3}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    .line 20
    :cond_4
    iget-object p3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperManager:Landroid/app/WallpaperManager;

    const/4 v3, 0x2

    .line 21
    invoke-virtual {p3, v3}, Landroid/app/WallpaperManager;->getWallpaperId(I)I

    move-result p3

    if-ltz p3, :cond_5

    goto :goto_2

    :cond_5
    move v1, v0

    .line 22
    :goto_2
    invoke-interface {p2}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperRemoteId()Ljava/lang/String;

    move-result-object p2

    if-eqz v1, :cond_6

    .line 23
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_6

    .line 24
    invoke-virtual {v2, p2}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    .line 25
    :cond_6
    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppliedWallpaperIds:Ljava/util/Set;

    const p2, 0x7f0a028b

    .line 26
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    .line 27
    iget p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    if-nez p2, :cond_7

    .line 28
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f07010f

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    .line 29
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->updateImageGridPadding(Z)V

    .line 30
    iget-object p3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p3, p2}, Landroid/view/ViewGroup;->setScrollBarSize(I)V

    :cond_7
    const p2, 0x7f0a0139

    .line 31
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/core/widget/ContentLoadingProgressBar;

    iput-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mLoading:Landroidx/core/widget/ContentLoadingProgressBar;

    .line 32
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->updateLoading()V

    .line 33
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->maybeSetUpImageGrid()V

    .line 34
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p3, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;

    invoke-direct {p3, p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 35
    sget-object p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$$ExternalSyntheticLambda0;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperChangedNotifier:Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperChangedListener:Lcom/android/wallpaper/module/WallpaperChangedNotifier$Listener;

    .line 5
    iget-object v0, v0, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->mListeners:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 6
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    if-eqz v0, :cond_1

    .line 7
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    check-cast v1, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    invoke-virtual {v1, v0}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->removeListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;)V

    .line 8
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperSetter:Lcom/android/wallpaper/module/WallpaperSetter;

    invoke-virtual {p0}, Lcom/android/wallpaper/module/WallpaperSetter;->cleanUp()V

    return-void
.end method

.method public onDestroyView()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getIndividualPickerFragmentHost()Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualPickerFragmentHost;->removeToolbarMenu()V

    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a00c3

    if-ne p1, v0, :cond_0

    .line 2
    new-instance p1, Lcom/android/wallpaper/picker/StartRotationDialogFragment;

    invoke-direct {p1}, Lcom/android/wallpaper/picker/StartRotationDialogFragment;-><init>()V

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p1, p0, v0}, Landroidx/fragment/app/Fragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 4
    iget-object p0, p0, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "start_rotation_dialog"

    .line 5
    invoke-virtual {p1, p0, v1}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public onResume()V
    .locals 4

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v0

    .line 4
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLastAppActiveTimestamp(J)V

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/MemoryCategory;->NORMAL:Lcom/bumptech/glide/MemoryCategory;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/Glide;->setMemoryCategory(Lcom/bumptech/glide/MemoryCategory;)Lcom/bumptech/glide/MemoryCategory;

    .line 6
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mStagedStartRotationErrorDialogFragment:Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 7
    iget-object v2, p0, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v3, "start_rotation_error_dialog"

    .line 8
    invoke-virtual {v0, v2, v3}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 9
    iput-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mStagedStartRotationErrorDialogFragment:Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    if-eqz v0, :cond_1

    .line 11
    iget-object v2, p0, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v3, "individual_set_wallpaper_error_dialog"

    .line 12
    invoke-virtual {v0, v2, v3}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 13
    iput-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    .line 14
    :cond_1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->shouldShowRotationTile()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWasUpdateRunnableRun:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 15
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mUpdateDailyWallpaperThumbRunnable:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_2
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p0, p0, 0x30

    const-string v0, "IndividualPickerFragment.NIGHT_MODE"

    .line 2
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public onSet(I)V
    .locals 0

    const-string p0, "IndividualPickerFrgmnt"

    const-string p1, "Unable to set wallpaper since the selected wallpaper info is null"

    .line 1
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onStartRotationDialogDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mHandler:Landroid/os/Handler;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mUpdateDailyWallpaperThumbRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public retryStartRotation(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->startRotation(I)V

    return-void
.end method

.method public setUpImageGrid()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;Ljava/util/List;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getNumColumns()I

    move-result p0

    invoke-direct {v1, v2, p0}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    return-void
.end method

.method public shouldShowRotationTile()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isRotationEnabled()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final showCheckMarkAndBorderForAppliedWallpaper(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppliedWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    if-nez v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->shouldShowRotationTile()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    instance-of v1, v1, Lcom/android/wallpaper/model/DesktopCustomCategory;

    if-eqz v1, :cond_2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 5
    :cond_2
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 6
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    const v2, 0x7f080112

    invoke-virtual {v0, v1, v2, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->showBadge(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;IZ)V

    goto :goto_0

    .line 7
    :cond_3
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 8
    :goto_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppliedWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    if-nez v0, :cond_4

    goto :goto_1

    .line 9
    :cond_4
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 10
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->shouldShowRotationTile()Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    instance-of v1, v1, Lcom/android/wallpaper/model/DesktopCustomCategory;

    if-eqz v1, :cond_6

    :cond_5
    add-int/lit8 v0, v0, 0x1

    .line 12
    :cond_6
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 13
    iget-object p0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setActivated(Z)V

    goto :goto_1

    .line 14
    :cond_7
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    :goto_1
    return-void
.end method

.method public startRotation(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->isRotationEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "Rotation is not enabled for this category "

    .line 2
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/model/Category;->mTitle:Ljava/lang/String;

    .line 4
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "IndividualPickerFrgmnt"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 5
    :cond_0
    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const v0, 0x7f1200fe

    .line 6
    new-instance v2, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    iput-object v2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v0, 0x0

    .line 7
    invoke-virtual {v2, v0}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 8
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f110129

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 10
    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 11
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 12
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 13
    :cond_1
    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    if-nez v0, :cond_2

    .line 14
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    const/4 v1, 0x0

    .line 15
    iput v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mPendingSelectedAdapterPosition:I

    .line 16
    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperRotationInitializer:Lcom/android/wallpaper/model/WallpaperRotationInitializer;

    new-instance v2, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;

    invoke-direct {v2, p0, v0, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$7;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;Landroid/content/Context;I)V

    invoke-interface {v1, v0, p1, v2}, Lcom/android/wallpaper/model/WallpaperRotationInitializer;->setFirstWallpaperInRotation(Landroid/content/Context;ILcom/android/wallpaper/model/WallpaperRotationInitializer$Listener;)V

    return-void
.end method

.method public updateImageGridPadding(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f07010f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0700ac

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    .line 3
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v0, v0, v2, v1}, Landroid/view/ViewGroup;->setPadding(IIII)V

    return-void
.end method

.method public updateLoading()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mLoading:Landroidx/core/widget/ContentLoadingProgressBar;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget-boolean p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mIsWallpapersReceived:Z

    if-eqz p0, :cond_1

    .line 3
    invoke-virtual {v0}, Landroidx/core/widget/ContentLoadingProgressBar;->hide()V

    goto :goto_0

    .line 4
    :cond_1
    invoke-virtual {v0}, Landroidx/core/widget/ContentLoadingProgressBar;->show()V

    :goto_0
    return-void
.end method
