.class public Lcom/android/wallpaper/backup/MissingHashCodeGenerator;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ServiceCast"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    const-string p2, "android.intent.action.MY_PACKAGE_REPLACED"

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 2
    invoke-static {}, Lcom/android/wallpaper/compat/BuildCompat;->isAtLeastN()Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object p0

    .line 4
    invoke-virtual {p0}, Landroid/app/WallpaperManager;->isWallpaperSupported()Z

    move-result p0

    if-nez p0, :cond_1

    return-void

    .line 5
    :cond_1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p0

    .line 6
    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p0

    .line 7
    invoke-interface {p0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperHashCode()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p2, v0, v2

    if-eqz p2, :cond_2

    .line 8
    invoke-interface {p0}, Lcom/android/wallpaper/module/WallpaperPreferences;->getLockWallpaperHashCode()J

    move-result-wide v0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_2

    return-void

    .line 9
    :cond_2
    sget p0, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;->$r8$clinit:I

    const-string p0, "jobscheduler"

    .line 10
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/job/JobScheduler;

    .line 11
    new-instance p2, Landroid/app/job/JobInfo$Builder;

    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lcom/android/wallpaper/backup/MissingHashCodeGeneratorJobService;

    invoke-direct {v0, p1, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p1, 0x2

    invoke-direct {p2, p1, v0}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    .line 12
    invoke-virtual {p2, v2, v3}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    const/4 p2, 0x1

    .line 13
    invoke-virtual {p1, p2}, Landroid/app/job/JobInfo$Builder;->setPersisted(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    :cond_3
    :goto_0
    return-void
.end method
