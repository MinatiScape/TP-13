.class public final Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.google.android.apps.wallpaper.module.ThemeSanitizerReceiver$onReceive$1"
    f = "ThemeSanitizerReceiver.kt"
    l = {
        0x4e
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field public final synthetic $context:Landroid/content/Context;

.field public final synthetic $prefs:Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

.field public final synthetic $result:Landroid/content/BroadcastReceiver$PendingResult;

.field public label:I

.field private synthetic p$:Lkotlinx/coroutines/CoroutineScope;

.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;Landroid/content/Context;Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;Landroid/content/BroadcastReceiver$PendingResult;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;",
            "Landroid/content/Context;",
            "Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;",
            "Landroid/content/BroadcastReceiver$PendingResult;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->this$0:Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->$prefs:Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->$result:Landroid/content/BroadcastReceiver$PendingResult;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 7
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v6, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->this$0:Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->$prefs:Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->$result:Landroid/content/BroadcastReceiver$PendingResult;

    move-object v0, v6

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;-><init>(Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;Landroid/content/Context;Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;Landroid/content/BroadcastReceiver$PendingResult;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    iput-object p1, v6, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->p$:Lkotlinx/coroutines/CoroutineScope;

    return-object v6
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    sget-object v0, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    .line 1
    iget v1, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 2
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 4
    :try_start_1
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->this$0:Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->$context:Landroid/content/Context;

    iput v2, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->label:I

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    sget-object p1, Lkotlinx/coroutines/Dispatchers;->INSTANCE:Lkotlinx/coroutines/Dispatchers;

    .line 6
    sget-object p1, Lkotlinx/coroutines/Dispatchers;->IO:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 7
    new-instance v3, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$sanitizeThemes$2;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$sanitizeThemes$2;-><init>(Landroid/content/Context;Lkotlin/coroutines/Continuation;)V

    invoke-static {p1, v3, p0}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_2

    goto :goto_0

    :cond_2
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    :goto_0
    if-ne p1, v0, :cond_3

    return-object v0

    .line 8
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->$prefs:Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

    invoke-interface {p1, v2}, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;->setThemesSanitized(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    const-string v0, "ThemeSanitizerReceiver"

    const-string v1, "Error cleaning up themes setting"

    .line 9
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 10
    :goto_2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/ThemeSanitizerReceiver$onReceive$1;->$result:Landroid/content/BroadcastReceiver$PendingResult;

    invoke-virtual {p0}, Landroid/content/BroadcastReceiver$PendingResult;->finish()V

    .line 11
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
