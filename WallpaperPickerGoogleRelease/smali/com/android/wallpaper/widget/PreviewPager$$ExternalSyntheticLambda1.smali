.class public final synthetic Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$PageTransformer;
.implements Landroidx/slice/SliceViewManager$SliceCallback;
.implements Lcom/android/wallpaper/picker/SectionView$SectionViewListener;
.implements Lcom/android/wallpaper/util/WallpaperSurfaceCallback$SurfaceListener;
.implements Lcom/android/wallpaper/util/FullScreenAnimation$FullScreenStatusListener;
.implements Landroidx/lifecycle/Observer;
.implements Lcom/android/wallpaper/asset/Asset$DrawableLoadedListener;
.implements Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback$WorkspaceRenderListener;
.implements Lcom/android/wallpaper/util/PreviewUtils$WorkspacePreviewCallback;
.implements Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/view/SurfaceView;)V
    .locals 1

    const/16 v0, 0x8

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/customization/model/mode/DarkModeSectionController;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/customization/picker/WallpaperPreviewer;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;)V
    .locals 1

    const/4 v0, 0x7

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/PreviewFragment;)V
    .locals 1

    const/4 v0, 0x6

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/WorkspaceSurfaceHolderCallback;)V
    .locals 1

    const/16 v0, 0x9

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V
    .locals 1

    const/16 v0, 0xa

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;)V
    .locals 1

    const/16 v0, 0xb

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/util/WallpaperSurfaceCallback;)V
    .locals 1

    const/16 v0, 0xc

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/widget/PreviewPager;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onChanged(Ljava/lang/Object;)V
    .locals 3

    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/PreviewFragment;

    check-cast p1, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    sget-object v0, Lcom/android/wallpaper/picker/PreviewFragment;->ALPHA_OUT:Landroid/view/animation/Interpolator;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mSetWallpaperViewModel:Lcom/android/wallpaper/model/SetWallpaperViewModel;

    .line 3
    iget p1, p1, Lcom/android/wallpaper/model/SetWallpaperViewModel;->mDestination:I

    const v0, 0x7f110116

    .line 4
    invoke-static {v0, p1}, Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;->newInstance(II)Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    move-result-object p1

    .line 5
    invoke-virtual {p1, p0, v1}, Landroidx/fragment/app/Fragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/picker/BasePreviewActivity;

    .line 7
    iget-boolean v0, v0, Lcom/android/wallpaper/picker/BaseActivity;->mIsSafeToCommitFragmentTransaction:Z

    if-eqz v0, :cond_1

    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    const-string v0, "set_wallpaper_error_dialog"

    .line 9
    invoke-virtual {p1, p0, v0}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 10
    :cond_1
    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    goto :goto_0

    .line 11
    :cond_2
    invoke-static {}, Landroid/os/Handler;->getMain()Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/PreviewFragment$$ExternalSyntheticLambda2;-><init>(Lcom/android/wallpaper/picker/PreviewFragment;I)V

    const-wide/16 v1, 0x12c

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_0
    return-void
.end method

.method public onDrawableLoaded()V
    .locals 1

    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;

    if-eqz p0, :cond_0

    .line 1
    check-cast p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetPresenter:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter;

    check-cast p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCurrentWallpapersExpanded(Z)V

    :cond_0
    return-void
.end method

.method public onFullScreenStatusChange(Z)V
    .locals 2

    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    xor-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setDateViewVisibility(Z)V

    if-nez p1, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    sget-object p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->EDIT:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    :cond_0
    return-void
.end method

.method public onPackageChanged(Ljava/lang/String;I)V
    .locals 3

    iget v0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->$r8$classId:I

    const/4 v1, 0x1

    const/4 v2, 0x3

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    sget v0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->$r8$clinit:I

    if-ne p2, v2, :cond_0

    .line 1
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    .line 2
    invoke-virtual {p2, p1}, Lcom/android/wallpaper/model/WallpaperCategory;->containsThirdParty(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 3
    :cond_0
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->fetchWallpapers(Z)V

    :cond_1
    return-void

    .line 4
    :pswitch_1
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    sget v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->$r8$clinit:I

    if-ne p2, v2, :cond_2

    .line 5
    iget-object p2, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    .line 6
    invoke-virtual {p2, p1}, Lcom/android/wallpaper/model/WallpaperCategory;->containsThirdParty(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 7
    :cond_2
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->fetchWallpapers(Z)V

    :cond_3
    return-void

    .line 8
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eq p2, v2, :cond_5

    .line 9
    iget-boolean p1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mSurfaceCreated:Z

    if-eqz p1, :cond_4

    goto :goto_1

    .line 10
    :cond_4
    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHost:Landroid/view/SurfaceControlViewHost;

    if-eqz p1, :cond_5

    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->setupSurfaceWallpaper(Z)V

    :cond_5
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onSurfaceCreated()V
    .locals 2

    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/picker/WallpaperPreviewer;

    .line 1
    iget-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    .line 3
    iget-object v1, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 4
    new-instance v1, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0}, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;-><init>(Lcom/android/customization/picker/WallpaperPreviewer;Landroid/widget/ImageView;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public onViewActivated(Landroid/content/Context;Z)V
    .locals 4

    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/customization/model/mode/DarkModeSectionController;

    sget-object v0, Lcom/android/customization/model/mode/DarkModeSectionController;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p1, :cond_0

    goto :goto_0

    .line 1
    :cond_0
    iget-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mDarkModeSectionView:Lcom/android/customization/picker/mode/DarkModeSectionView;

    const v1, 0x7f0a00c5

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Switch;

    .line 2
    invoke-virtual {v0}, Landroid/widget/Switch;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3
    iget-object p0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mContext:Landroid/content/Context;

    const p1, 0x7f1100be

    .line 4
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    .line 5
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 6
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 7
    :cond_1
    const-class v0, Landroid/app/UiModeManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/UiModeManager;

    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x10e0000

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    .line 9
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, p1, v0, p2}, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda1;-><init>(Lcom/android/customization/model/mode/DarkModeSectionController;Landroid/content/Context;Landroid/app/UiModeManager;Z)V

    int-to-long p0, v1

    invoke-virtual {v2, v3, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_0
    return-void
.end method
