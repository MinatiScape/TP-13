.class public final Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field public final scope:Lkotlinx/coroutines/CoroutineScope;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    sget-object v0, Lkotlinx/coroutines/Dispatchers;->INSTANCE:Lkotlinx/coroutines/Dispatchers;

    .line 3
    sget-object v0, Lkotlinx/coroutines/Dispatchers;->Default:Lkotlinx/coroutines/CoroutineDispatcher;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 4
    invoke-static {v1, v2}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;I)Lkotlinx/coroutines/CompletableJob;

    move-result-object v1

    invoke-virtual {v0, v1}, Lkotlin/coroutines/AbstractCoroutineContextElement;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    invoke-static {v0}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;->scope:Lkotlinx/coroutines/CoroutineScope;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "intent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ThemeSanitizerReceiver"

    if-eqz v0, :cond_5

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v2, "android.intent.action.MY_PACKAGE_REPLACED"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    const-string v0, "android.intent.action.BOOT_COMPLETED"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 3
    :cond_0
    sget p2, Lcom/android/wallpaper/compat/BuildCompat;->sSdk:I

    const/16 v0, 0x1f

    if-ge p2, v0, :cond_2

    sget-object p2, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    const-string v0, "S"

    .line 4
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p2, 0x1

    :goto_1
    if-eqz p2, :cond_5

    .line 5
    invoke-static {p1}, Lcom/android/customization/model/color/ColorUtils;->isMonetEnabled(Landroid/content/Context;)Z

    move-result p2

    if-nez p2, :cond_3

    const-string p0, "Skipping theme sanitizer"

    .line 6
    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 7
    :cond_3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p2

    const-string v0, "null cannot be cast to non-null type com.android.wallpaper.module.GoogleWallpapersInjector"

    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    check-cast p2, Lcom/android/wallpaper/module/GoogleWallpapersInjector;

    .line 8
    invoke-interface {p2, p1}, Lcom/android/wallpaper/module/GoogleWallpapersInjector;->getGooglePreferences(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

    move-result-object v5

    .line 9
    invoke-interface {v5}, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;->isThemesSanitized()Z

    move-result p2

    if-eqz p2, :cond_4

    const-string p0, "Already sanitized, skipping theme sanitizer"

    .line 10
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 11
    :cond_4
    invoke-virtual {p0}, Landroid/content/BroadcastReceiver;->goAsync()Landroid/content/BroadcastReceiver$PendingResult;

    move-result-object v6

    .line 12
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;->scope:Lkotlinx/coroutines/CoroutineScope;

    const/4 v8, 0x0

    const/4 v9, 0x0

    new-instance v10, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;

    const/4 v7, 0x0

    move-object v2, v10

    move-object v3, p0

    move-object v4, p1

    invoke-direct/range {v2 .. v7}, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;-><init>(Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;Landroid/content/Context;Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;Landroid/content/BroadcastReceiver$PendingResult;Lkotlin/coroutines/Continuation;)V

    const/4 v11, 0x3

    const/4 v12, 0x0

    move-object v7, p2

    invoke-static/range {v7 .. v12}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    return-void

    :cond_5
    const-string p0, "Unexpected action or Android version!"

    .line 13
    invoke-static {v1, p0, p1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 14
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Unexpected broadcast action or unsupported Android version"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
