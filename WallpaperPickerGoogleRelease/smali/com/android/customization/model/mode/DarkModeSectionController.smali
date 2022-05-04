.class public Lcom/android/customization/model/mode/DarkModeSectionController;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CustomizationSectionController;
.implements Landroidx/lifecycle/LifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/customization/model/mode/DarkModeSectionController$BatterySaverStateReceiver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/wallpaper/model/CustomizationSectionController<",
        "Lcom/android/customization/picker/mode/DarkModeSectionView;",
        ">;",
        "Landroidx/lifecycle/LifecycleObserver;"
    }
.end annotation


# static fields
.field public static final sExecutorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field public final mBatterySaverStateReceiver:Lcom/android/customization/model/mode/DarkModeSectionController$BatterySaverStateReceiver;

.field public mContext:Landroid/content/Context;

.field public mDarkModeSectionView:Lcom/android/customization/picker/mode/DarkModeSectionView;

.field public final mLifecycle:Landroidx/lifecycle/Lifecycle;

.field public final mPowerManager:Landroid/os/PowerManager;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/android/customization/model/mode/DarkModeSectionController;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/lifecycle/Lifecycle;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lcom/android/customization/model/mode/DarkModeSectionController$BatterySaverStateReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/customization/model/mode/DarkModeSectionController$BatterySaverStateReceiver;-><init>(Lcom/android/customization/model/mode/DarkModeSectionController;Lcom/android/customization/model/mode/DarkModeSectionController$1;)V

    iput-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mBatterySaverStateReceiver:Lcom/android/customization/model/mode/DarkModeSectionController$BatterySaverStateReceiver;

    .line 3
    iput-object p1, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mContext:Landroid/content/Context;

    .line 4
    iput-object p2, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mLifecycle:Landroidx/lifecycle/Lifecycle;

    .line 5
    const-class v0, Landroid/os/PowerManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    iput-object p1, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mPowerManager:Landroid/os/PowerManager;

    .line 6
    invoke-virtual {p2, p0}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    return-void
.end method


# virtual methods
.method public createView(Landroid/content/Context;)Lcom/android/wallpaper/picker/SectionView;
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0044

    const/4 v2, 0x0

    .line 2
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/customization/picker/mode/DarkModeSectionView;

    iput-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mDarkModeSectionView:Lcom/android/customization/picker/mode/DarkModeSectionView;

    .line 3
    new-instance v1, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Lcom/android/customization/model/mode/DarkModeSectionController;)V

    .line 4
    iput-object v1, v0, Lcom/android/wallpaper/picker/SectionView;->mSectionViewListener:Lcom/android/wallpaper/picker/SectionView$SectionViewListener;

    .line 5
    const-class v0, Landroid/os/PowerManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    .line 6
    iget-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mDarkModeSectionView:Lcom/android/customization/picker/mode/DarkModeSectionView;

    invoke-virtual {p1}, Landroid/os/PowerManager;->isPowerSaveMode()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Lcom/android/customization/picker/mode/DarkModeSectionView;->setEnabled(Z)V

    .line 7
    iget-object p0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mDarkModeSectionView:Lcom/android/customization/picker/mode/DarkModeSectionView;

    return-object p0
.end method

.method public isAvailable(Landroid/content/Context;)Z
    .locals 1

    const/4 p0, 0x0

    if-nez p1, :cond_0

    return p0

    :cond_0
    const-string v0, "android.permission.MODIFY_DAY_NIGHT_MODE"

    .line 1
    invoke-static {p1, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_1

    const/4 p0, 0x1

    :cond_1
    return p0
.end method

.method public onStart()V
    .locals 3
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_START:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/customization/model/mode/DarkModeSectionController;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda0;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/model/mode/DarkModeSectionController;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public onStop()V
    .locals 3
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_STOP:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    sget-object v0, Lcom/android/customization/model/mode/DarkModeSectionController;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda0;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/model/mode/DarkModeSectionController;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mLifecycle:Landroidx/lifecycle/Lifecycle;

    check-cast v0, Landroidx/lifecycle/LifecycleRegistry;

    const-string v1, "removeObserver"

    .line 2
    invoke-virtual {v0, v1}, Landroidx/lifecycle/LifecycleRegistry;->enforceMainThreadIfNeeded(Ljava/lang/String;)V

    .line 3
    iget-object v0, v0, Landroidx/lifecycle/LifecycleRegistry;->mObserverMap:Landroidx/arch/core/internal/FastSafeIterableMap;

    invoke-virtual {v0, p0}, Landroidx/arch/core/internal/FastSafeIterableMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mContext:Landroid/content/Context;

    return-void
.end method
