.class public final Lcom/android/customization/model/color/ColorProvider$fetch$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
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
    c = "com.android.customization.model.color.ColorProvider$fetch$1"
    f = "ColorProvider.kt"
    l = {
        0x5c
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field public final synthetic $callback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener<",
            "Lcom/android/customization/model/color/ColorOption;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic $homeWallpaperColors:Landroid/app/WallpaperColors;

.field public final synthetic $lockWallpaperColors:Landroid/app/WallpaperColors;

.field public final synthetic $reload:Z

.field public final synthetic $wallpaperColorsChanged:Z

.field public label:I

.field private synthetic p$:Lkotlinx/coroutines/CoroutineScope;

.field public final synthetic this$0:Lcom/android/customization/model/color/ColorProvider;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/color/ColorProvider;ZZLandroid/app/WallpaperColors;Landroid/app/WallpaperColors;Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/customization/model/color/ColorProvider;",
            "ZZ",
            "Landroid/app/WallpaperColors;",
            "Landroid/app/WallpaperColors;",
            "Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener<",
            "Lcom/android/customization/model/color/ColorOption;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/android/customization/model/color/ColorProvider$fetch$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->this$0:Lcom/android/customization/model/color/ColorProvider;

    iput-boolean p2, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$reload:Z

    iput-boolean p3, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$wallpaperColorsChanged:Z

    iput-object p4, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$homeWallpaperColors:Landroid/app/WallpaperColors;

    iput-object p5, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$lockWallpaperColors:Landroid/app/WallpaperColors;

    iput-object p6, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$callback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p7}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 9
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

    new-instance v8, Lcom/android/customization/model/color/ColorProvider$fetch$1;

    iget-object v1, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->this$0:Lcom/android/customization/model/color/ColorProvider;

    iget-boolean v2, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$reload:Z

    iget-boolean v3, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$wallpaperColorsChanged:Z

    iget-object v4, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$homeWallpaperColors:Landroid/app/WallpaperColors;

    iget-object v5, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$lockWallpaperColors:Landroid/app/WallpaperColors;

    iget-object v6, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$callback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;

    move-object v0, v8

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/android/customization/model/color/ColorProvider$fetch$1;-><init>(Lcom/android/customization/model/color/ColorProvider;ZZLandroid/app/WallpaperColors;Landroid/app/WallpaperColors;Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    iput-object p1, v8, Lcom/android/customization/model/color/ColorProvider$fetch$1;->p$:Lkotlinx/coroutines/CoroutineScope;

    return-object v8
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/customization/model/color/ColorProvider$fetch$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/android/customization/model/color/ColorProvider$fetch$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    sget-object v0, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    .line 1
    iget v1, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->label:I

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
    iget-object p1, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->this$0:Lcom/android/customization/model/color/ColorProvider;

    .line 5
    iget-object v1, p1, Lcom/android/customization/model/color/ColorProvider;->colorBundles:Ljava/util/List;

    if-eqz v1, :cond_2

    .line 6
    iget-boolean v1, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$reload:Z

    if-eqz v1, :cond_4

    .line 7
    :cond_2
    iput v2, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->label:I

    .line 8
    sget-object v1, Lkotlinx/coroutines/Dispatchers;->INSTANCE:Lkotlinx/coroutines/Dispatchers;

    .line 9
    sget-object v1, Lkotlinx/coroutines/Dispatchers;->IO:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 10
    new-instance v2, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;-><init>(Lcom/android/customization/model/color/ColorProvider;Lkotlin/coroutines/Continuation;)V

    invoke-static {v1, v2, p0}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_3

    goto :goto_0

    :cond_3
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    :goto_0
    if-ne p1, v0, :cond_4

    return-object v0

    .line 11
    :cond_4
    :goto_1
    iget-boolean p1, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$wallpaperColorsChanged:Z

    if-nez p1, :cond_5

    iget-boolean p1, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$reload:Z

    if-eqz p1, :cond_6

    .line 12
    :cond_5
    iget-object p1, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->this$0:Lcom/android/customization/model/color/ColorProvider;

    iget-object v0, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$homeWallpaperColors:Landroid/app/WallpaperColors;

    iget-object v1, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$lockWallpaperColors:Landroid/app/WallpaperColors;

    invoke-static {p1, v0, v1}, Lcom/android/customization/model/color/ColorProvider;->access$loadSeedColors(Lcom/android/customization/model/color/ColorProvider;Landroid/app/WallpaperColors;Landroid/app/WallpaperColors;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    :cond_6
    iget-object p1, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$callback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;

    if-nez p1, :cond_7

    goto :goto_2

    :cond_7
    iget-object p0, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->this$0:Lcom/android/customization/model/color/ColorProvider;

    .line 14
    iget-object p0, p0, Lcom/android/customization/model/color/ColorProvider;->colorBundles:Ljava/util/List;

    .line 15
    invoke-interface {p1, p0}, Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;->onOptionsLoaded(Ljava/util/List;)V

    .line 16
    :goto_2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0

    :catchall_0
    move-exception p1

    .line 17
    iget-object v0, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->this$0:Lcom/android/customization/model/color/ColorProvider;

    const/4 v1, 0x0

    .line 18
    iput-boolean v1, v0, Lcom/android/customization/model/color/ColorProvider;->colorsAvailable:Z

    .line 19
    iget-object p0, p0, Lcom/android/customization/model/color/ColorProvider$fetch$1;->$callback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;

    if-nez p0, :cond_8

    goto :goto_3

    :cond_8
    invoke-interface {p0, p1}, Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;->onError(Ljava/lang/Throwable;)V

    .line 20
    :goto_3
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
