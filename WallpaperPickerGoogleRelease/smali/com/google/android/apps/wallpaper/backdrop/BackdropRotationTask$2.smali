.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;


# instance fields
.field public final synthetic val$appContext:Landroid/content/Context;

.field public final synthetic val$gcmNetworkManagerWrapper:Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;

.field public final synthetic val$tag:Ljava/lang/String;

.field public final synthetic val$taskResultCallable:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;

.field public final synthetic val$taskResultFuture:Ljava/util/concurrent/FutureTask;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask;Landroid/content/Context;Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;Ljava/util/concurrent/FutureTask;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$appContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$gcmNetworkManagerWrapper:Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$tag:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$taskResultCallable:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;

    iput-object p6, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$taskResultFuture:Ljava/util/concurrent/FutureTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefreshed(Lcom/android/wallpaper/model/WallpaperMetadata;Lcom/android/wallpaper/model/WallpaperMetadata;I)V
    .locals 7

    const/4 p1, 0x1

    if-ne p3, p1, :cond_3

    .line 1
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$appContext:Landroid/content/Context;

    const-string p2, "BackdropRotationTask"

    const-string p3, "Wallpaper presentation mode is static, cutting task short."

    invoke-static {p2, p3, p1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 2
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$gcmNetworkManagerWrapper:Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;

    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$tag:Ljava/lang/String;

    const-class p3, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask;

    .line 3
    iget-object p1, p1, Lcom/google/android/apps/wallpaper/backdrop/DefaultGcmNetworkManagerWrapper;->mAppContext:Landroid/content/Context;

    invoke-static {p1}, Landroidx/viewpager2/widget/FakeDrag;->getInstance(Landroid/content/Context;)Landroidx/viewpager2/widget/FakeDrag;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    new-instance v0, Landroid/content/ComponentName;

    iget-object v1, p1, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, v1, p3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_2

    const/16 p3, 0x64

    .line 6
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lt p3, v1, :cond_1

    .line 7
    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroidx/viewpager2/widget/FakeDrag;->zzc(Ljava/lang/String;)Z

    .line 8
    invoke-virtual {p1}, Landroidx/viewpager2/widget/FakeDrag;->zza()Landroid/content/Intent;

    move-result-object p3

    if-eqz p3, :cond_0

    const-string v1, "scheduler_action"

    const-string v2, "CANCEL_TASK"

    .line 9
    invoke-virtual {p3, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "tag"

    .line 10
    invoke-virtual {p3, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "component"

    .line 11
    invoke-virtual {p3, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 12
    iget-object p1, p1, Landroidx/viewpager2/widget/FakeDrag;->mViewPager:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    invoke-virtual {p1, p3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 13
    :cond_0
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$taskResultCallable:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;

    const/4 p2, 0x2

    iput p2, p1, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;->taskResult:I

    .line 14
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$taskResultFuture:Ljava/util/concurrent/FutureTask;

    invoke-virtual {p0}, Ljava/util/concurrent/FutureTask;->run()V

    return-void

    .line 15
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Tag is larger than max permissible tag length (100)"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 16
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Must provide a valid tag."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 17
    :cond_3
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$appContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$tag:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$taskResultCallable:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$2;->val$taskResultFuture:Ljava/util/concurrent/FutureTask;

    sget p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask;->$r8$clinit:I

    .line 18
    invoke-static {p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->getInstance(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    move-result-object v3

    .line 19
    invoke-virtual {v3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->getCollectionId()Ljava/lang/String;

    move-result-object p0

    .line 20
    invoke-virtual {v3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->getCollectionName()Ljava/lang/String;

    move-result-object p2

    .line 21
    invoke-virtual {v3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->getResumeToken()Ljava/lang/String;

    move-result-object p3

    .line 22
    new-instance v6, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;

    move-object v0, v6

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$1;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationTask$TaskResultCallable;Ljava/util/concurrent/FutureTask;)V

    invoke-static {p1, p0, p2, p3, v6}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;->updateWallpaper(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;)V

    return-void
.end method
