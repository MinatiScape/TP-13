.class public final Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;->getDefaultRecentWallpapers()Lorg/json/JSONArray;
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
        "Lorg/json/JSONArray;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDefaultGoogleWallpaperPreferences.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DefaultGoogleWallpaperPreferences.kt\ncom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,191:1\n1623#2,8:192\n*E\n*S KotlinDebug\n*F\n+ 1 DefaultGoogleWallpaperPreferences.kt\ncom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1\n*L\n122#1,8:192\n*E\n"
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.google.android.apps.wallpaper.module.DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1"
    f = "DefaultGoogleWallpaperPreferences.kt"
    l = {
        0x78,
        0x79
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field public label:I

.field private synthetic p$:Lkotlinx/coroutines/CoroutineScope;

.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 1
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

    new-instance v0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    invoke-direct {v0, p0, p2}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;-><init>(Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    iput-object p1, v0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->p$:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    invoke-direct {v0, p0, p2}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;-><init>(Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->p$:Lkotlinx/coroutines/CoroutineScope;

    .line 2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    sget-object v0, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    .line 1
    iget v1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->label:I

    const-string v2, "mContext"

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v1, :cond_2

    if-eq v1, v4, :cond_1

    if-ne v1, v3, :cond_0

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 2
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 4
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    .line 5
    iget-object p1, p1, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    .line 6
    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput v4, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->label:I

    .line 7
    new-instance v1, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p0}, Lkotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v5

    invoke-direct {v1, v5}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 8
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 9
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 10
    new-instance v7, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;

    new-instance v8, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;

    invoke-direct {v8, v6, p1, v5, v1}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;-><init>(Ljava/util/HashMap;Landroid/content/Context;Ljava/util/List;Lkotlin/coroutines/Continuation;)V

    invoke-direct {v7, v8, p1, v4}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$GoogleFetchCategoriesTask;-><init>(Lcom/android/wallpaper/model/CategoryReceiver;Landroid/content/Context;Z)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    .line 11
    invoke-virtual {v7, p1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 12
    invoke-virtual {v1}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_3

    const-string v1, "frame"

    .line 13
    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_3
    if-ne p1, v0, :cond_4

    return-object v0

    .line 14
    :cond_4
    :goto_0
    check-cast p1, Ljava/util/List;

    .line 15
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    .line 16
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    .line 17
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 19
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 20
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_5
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 21
    move-object v6, v5

    check-cast v6, Lcom/android/wallpaper/model/WallpaperInfo;

    .line 22
    invoke-virtual {v6}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v6

    .line 23
    invoke-virtual {v2, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 24
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 25
    :cond_6
    iput v3, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->label:I

    .line 26
    sget-object p1, Lkotlinx/coroutines/Dispatchers;->INSTANCE:Lkotlinx/coroutines/Dispatchers;

    .line 27
    sget-object p1, Lkotlinx/coroutines/Dispatchers;->IO:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 28
    new-instance v2, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;

    const/4 v3, 0x0

    invoke-direct {v2, v4, v1, v3}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;-><init>(Ljava/util/List;Landroid/content/Context;Lkotlin/coroutines/Continuation;)V

    invoke-static {p1, v2, p0}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_7

    return-object v0

    .line 29
    :cond_7
    :goto_2
    check-cast p1, Lorg/json/JSONArray;

    .line 30
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$getDefaultRecentWallpapers$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "defaultRecents"

    .line 31
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mNoBackupPrefs:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "default_recent_wallpapers"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 33
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-object p1
.end method
