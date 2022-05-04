.class public Lcom/android/wallpaper/module/WallpaperSetter;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public mCurrentScreenOrientation:Ljava/util/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Optional<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

.field public mProgressDialog:Landroid/app/ProgressDialog;

.field public final mSingleThreadExecutor:Ljava/util/concurrent/ExecutorService;

.field public final mTestingModeEnabled:Z

.field public final mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

.field public final mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/WallpaperPersister;Lcom/android/wallpaper/module/WallpaperPreferences;Lcom/android/wallpaper/module/UserEventLogger;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mSingleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 3
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mCurrentScreenOrientation:Ljava/util/Optional;

    .line 4
    iput-boolean p4, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mTestingModeEnabled:Z

    .line 5
    iput-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    .line 6
    iput-object p2, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 7
    iput-object p3, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    return-void
.end method


# virtual methods
.method public cleanUp()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mProgressDialog:Landroid/app/ProgressDialog;

    :cond_0
    return-void
.end method

.method public final onWallpaperApplied(Lcom/android/wallpaper/model/WallpaperInfo;Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    .line 2
    invoke-virtual {p1, p2}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 3
    invoke-virtual {p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object p1

    .line 4
    invoke-interface {v0, v1, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSet(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->setPendingWallpaperSetStatus(I)V

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetResult(I)V

    .line 7
    invoke-virtual {p0}, Lcom/android/wallpaper/module/WallpaperSetter;->cleanUp()V

    .line 8
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mCurrentScreenOrientation:Ljava/util/Optional;

    new-instance v0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p2}, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/module/WallpaperSetter;Landroid/app/Activity;)V

    invoke-virtual {p1, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public final onWallpaperApplyError(Ljava/lang/Throwable;Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setPendingWallpaperSetStatus(I)V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetResult(I)V

    .line 3
    invoke-static {p1}, Landroidx/lifecycle/runtime/R$id;->isOOM(Ljava/lang/Throwable;)Z

    move-result p1

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetFailureReason(I)V

    .line 5
    invoke-virtual {p0}, Lcom/android/wallpaper/module/WallpaperSetter;->cleanUp()V

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mCurrentScreenOrientation:Ljava/util/Optional;

    new-instance v0, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p2}, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/module/WallpaperSetter;Landroid/app/Activity;)V

    invoke-virtual {p1, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public requestDestination(Landroid/app/Activity;Landroidx/fragment/app/FragmentManager;Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;Z)V
    .locals 7

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/module/WallpaperSetter;->saveAndLockScreenOrientationIfNeeded(Landroid/app/Activity;)V

    .line 2
    new-instance v0, Lcom/android/wallpaper/module/WallpaperSetter$3;

    invoke-direct {v0, p0, p3, p1}, Lcom/android/wallpaper/module/WallpaperSetter$3;-><init>(Lcom/android/wallpaper/module/WallpaperSetter;Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;Landroid/app/Activity;)V

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/wallpaper/module/Injector;->getWallpaperStatusChecker()Lcom/google/android/material/shape/EdgeTreatment;

    move-result-object v1

    .line 4
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    if-nez v2, :cond_1

    .line 5
    invoke-virtual {v1, p1}, Lcom/google/android/material/shape/EdgeTreatment;->isHomeStaticWallpaperSet(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    :cond_1
    move v3, v4

    .line 6
    :goto_1
    new-instance v5, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;

    invoke-direct {v5}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;-><init>()V

    const v6, 0x7f110115

    .line 7
    iput v6, v5, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mTitleResId:I

    .line 8
    iput-object v0, v5, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mListener:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;

    if-nez v2, :cond_2

    if-eqz v3, :cond_4

    .line 9
    :cond_2
    invoke-virtual {v1, p1}, Lcom/google/android/material/shape/EdgeTreatment;->isLockWallpaperSet(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_4

    if-eqz p4, :cond_3

    const/4 p2, 0x2

    .line 10
    invoke-interface {p3, p2}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;->onSet(I)V

    .line 11
    iget-object p2, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mCurrentScreenOrientation:Ljava/util/Optional;

    new-instance p3, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;

    invoke-direct {p3, p0, p1}, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/module/WallpaperSetter;Landroid/app/Activity;)V

    invoke-virtual {p2, p3}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    goto :goto_2

    .line 12
    :cond_3
    iput-boolean v4, v5, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mHomeAvailable:Z

    .line 13
    invoke-virtual {v5}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->updateButtonsVisibility()V

    :cond_4
    if-eqz p4, :cond_5

    .line 14
    iput-boolean v4, v5, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mLockAvailable:Z

    .line 15
    invoke-virtual {v5}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->updateButtonsVisibility()V

    :cond_5
    const-string p0, "set_wallpaper_dialog"

    .line 16
    invoke-virtual {v5, p2, p0}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :goto_2
    return-void
.end method

.method public final saveAndLockScreenOrientationIfNeeded(Landroid/app/Activity;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mCurrentScreenOrientation:Ljava/util/Optional;

    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p1}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mCurrentScreenOrientation:Ljava/util/Optional;

    const/16 p0, 0xe

    .line 3
    invoke-virtual {p1, p0}, Landroid/app/Activity;->setRequestedOrientation(I)V

    :cond_0
    return-void
.end method

.method public setCurrentWallpaper(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;IFLandroid/graphics/Rect;Landroid/app/WallpaperColors;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
    .locals 7

    .line 1
    instance-of v0, p2, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    .line 2
    check-cast p2, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    .line 3
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/module/WallpaperSetter;->saveAndLockScreenOrientationIfNeeded(Landroid/app/Activity;)V

    if-eq p4, v1, :cond_1

    .line 4
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object p3

    .line 5
    iget-object p5, p2, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    .line 6
    invoke-virtual {p5}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object p5

    .line 7
    invoke-virtual {p3, p5}, Landroid/app/WallpaperManager;->setWallpaperComponent(Landroid/content/ComponentName;)Z

    const/4 p5, 0x0

    const/high16 p6, 0x3f000000    # 0.5f

    .line 8
    invoke-virtual {p3, p6, p5}, Landroid/app/WallpaperManager;->setWallpaperOffsetSteps(FF)V

    .line 9
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    .line 10
    invoke-virtual {p3, v0, p6, p5}, Landroid/app/WallpaperManager;->setWallpaperOffsets(Landroid/os/IBinder;FF)V

    const/4 p5, 0x2

    if-ne p4, p5, :cond_0

    .line 11
    invoke-virtual {p3, p5}, Landroid/app/WallpaperManager;->clear(I)V

    .line 12
    :cond_0
    iget-object p3, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mSingleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance p4, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;

    invoke-direct {p4, p0, p2, p7, p1}, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/module/WallpaperSetter;Lcom/android/wallpaper/model/LiveWallpaperInfo;Landroid/app/WallpaperColors;Landroid/app/Activity;)V

    invoke-interface {p3, p4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 13
    invoke-virtual {p0, p2, p1}, Lcom/android/wallpaper/module/WallpaperSetter;->onWallpaperApplied(Lcom/android/wallpaper/model/WallpaperInfo;Landroid/app/Activity;)V

    if-eqz p8, :cond_2

    .line 14
    invoke-interface {p8, p2}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onSuccess(Lcom/android/wallpaper/model/WallpaperInfo;)V

    goto :goto_0

    .line 15
    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "Live wallpaper cannot be applied on lock screen only"

    invoke-direct {p2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p2

    .line 16
    invoke-virtual {p0, p2, p1}, Lcom/android/wallpaper/module/WallpaperSetter;->onWallpaperApplyError(Ljava/lang/Throwable;Landroid/app/Activity;)V

    if-eqz p8, :cond_2

    .line 17
    invoke-interface {p8, p2}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onError(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    return-void

    .line 18
    :cond_3
    iget-object p7, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {p7, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setPendingWallpaperSetStatus(I)V

    .line 19
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/module/WallpaperSetter;->saveAndLockScreenOrientationIfNeeded(Landroid/app/Activity;)V

    .line 20
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object p7

    invoke-virtual {p7}, Lcom/bumptech/glide/Glide;->clearMemory()V

    .line 21
    iget-boolean p7, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mTestingModeEnabled:Z

    if-nez p7, :cond_5

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p7

    if-nez p7, :cond_5

    const p7, 0x7f1200fe

    .line 22
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p1, p7}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 p7, 0x0

    .line 23
    invoke-virtual {v0, p7}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 24
    iget-object p7, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mProgressDialog:Landroid/app/ProgressDialog;

    const v0, 0x7f110119

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p7, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 25
    iget-object p7, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p7, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 26
    instance-of p7, p1, Landroidx/lifecycle/LifecycleOwner;

    if-eqz p7, :cond_4

    .line 27
    move-object p7, p1

    check-cast p7, Landroidx/lifecycle/LifecycleOwner;

    invoke-interface {p7}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object p7

    new-instance v0, Lcom/android/wallpaper/module/WallpaperSetter$1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/module/WallpaperSetter$1;-><init>(Lcom/android/wallpaper/module/WallpaperSetter;)V

    invoke-virtual {p7, v0}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 28
    :cond_4
    iget-object p7, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p7}, Landroid/app/ProgressDialog;->show()V

    .line 29
    :cond_5
    iget-object p7, p0, Lcom/android/wallpaper/module/WallpaperSetter;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    new-instance v6, Lcom/android/wallpaper/module/WallpaperSetter$2;

    invoke-direct {v6, p0, p2, p1, p8}, Lcom/android/wallpaper/module/WallpaperSetter$2;-><init>(Lcom/android/wallpaper/module/WallpaperSetter;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/app/Activity;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    move-object v0, p7

    check-cast v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    move-object v1, p2

    move-object v2, p3

    move-object v3, p6

    move v4, p5

    move v5, p4

    invoke-virtual/range {v0 .. v6}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Rect;FILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    return-void
.end method
