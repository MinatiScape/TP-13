.class public Lcom/android/wallpaper/widget/LockScreenPreviewer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/LifecycleObserver;


# static fields
.field public static final sExecutorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field public final mContext:Landroid/content/Context;

.field public final mDatePattern:Ljava/lang/String;

.field public final mLifecycle:Landroidx/lifecycle/Lifecycle;

.field public final mLockDate:Landroid/widget/TextView;

.field public final mLockTime:Landroid/widget/TextView;

.field public mTicker:Lcom/android/wallpaper/util/TimeUtils$TimeTicker;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Landroidx/lifecycle/Lifecycle;Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mLifecycle:Landroidx/lifecycle/Lifecycle;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mContext:Landroid/content/Context;

    .line 4
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0074

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    const v0, 0x7f0a013f

    .line 5
    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mLockTime:Landroid/widget/TextView;

    const v0, 0x7f0a013b

    .line 6
    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mLockDate:Landroid/widget/TextView;

    .line 7
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    const-string v1, "EEE, MMM d"

    invoke-static {v0, v1}, Landroid/text/format/DateFormat;->getBestDateTimePattern(Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mDatePattern:Ljava/lang/String;

    .line 8
    const-class v0, Landroid/view/WindowManager;

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 9
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v7

    .line 10
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    .line 11
    invoke-virtual {p2}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p2

    if-nez p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    move v8, p2

    .line 12
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getRootView()Landroid/view/View;

    move-result-object p2

    .line 13
    new-instance v0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;

    move-object v3, v0

    move-object v4, p0

    move-object v5, p3

    move-object v9, p2

    invoke-direct/range {v3 .. v9}, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;-><init>(Lcom/android/wallpaper/widget/LockScreenPreviewer;Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Point;ZLandroid/view/View;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 14
    invoke-virtual {p1, p0}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    return-void
.end method


# virtual methods
.method public onPause()V
    .locals 3
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_PAUSE:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mTicker:Lcom/android/wallpaper/util/TimeUtils$TimeTicker;

    if-nez v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    sget-object v0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/widget/LockScreenPreviewer;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    :goto_0
    return-void
.end method

.method public onResume()V
    .locals 3
    .annotation runtime Landroidx/lifecycle/OnLifecycleEvent;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_RESUME:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mTicker:Lcom/android/wallpaper/util/TimeUtils$TimeTicker;

    if-nez v0, :cond_0

    .line 2
    sget-object v0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/widget/LockScreenPreviewer;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->updateDateTime()V

    return-void
.end method

.method public release()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mLifecycle:Landroidx/lifecycle/Lifecycle;

    check-cast v0, Landroidx/lifecycle/LifecycleRegistry;

    const-string v1, "removeObserver"

    .line 2
    invoke-virtual {v0, v1}, Landroidx/lifecycle/LifecycleRegistry;->enforceMainThreadIfNeeded(Ljava/lang/String;)V

    .line 3
    iget-object v0, v0, Landroidx/lifecycle/LifecycleRegistry;->mObserverMap:Landroidx/arch/core/internal/FastSafeIterableMap;

    invoke-virtual {v0, p0}, Landroidx/arch/core/internal/FastSafeIterableMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mTicker:Lcom/android/wallpaper/util/TimeUtils$TimeTicker;

    if-nez v0, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    sget-object v0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/widget/LockScreenPreviewer;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    :goto_0
    return-void
.end method

.method public setColor(Landroid/app/WallpaperColors;)V
    .locals 2

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    .line 1
    invoke-virtual {p1}, Landroid/app/WallpaperColors;->getColorHints()I

    move-result p1

    and-int/2addr p1, v0

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_2

    const v1, 0x7f06010e

    goto :goto_1

    :cond_2
    const v1, 0x7f06010d

    :goto_1
    invoke-virtual {p1, v1}, Landroid/content/Context;->getColor(I)I

    move-result p1

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_3

    const v0, 0x7f060102

    goto :goto_2

    :cond_3
    const v0, 0x7f060103

    :goto_2
    invoke-virtual {v1, v0}, Landroid/content/Context;->getColor(I)I

    move-result v0

    .line 4
    iget-object v1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mLockDate:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mLockDate:Landroid/widget/TextView;

    iget-object p0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mContext:Landroid/content/Context;

    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f07027b

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p0

    const/4 v1, 0x0

    .line 7
    invoke-virtual {p1, p0, v1, v1, v0}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    return-void
.end method

.method public setDateViewVisibility(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mLockDate:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public final updateDateTime()V
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mLockDate:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mDatePattern:Ljava/lang/String;

    invoke-static {v2, v0}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mLockTime:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 4
    invoke-static {v1}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "HH\nmm"

    goto :goto_0

    :cond_0
    const-string v1, "hh\nmm"

    .line 5
    :goto_0
    invoke-static {v1, v0}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
