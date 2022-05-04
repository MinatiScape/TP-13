.class public final Lcom/android/customization/model/color/ColorProvider;
.super Lcom/android/customization/model/ResourcesApkProvider;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/model/color/ColorOptionsProvider;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nColorProvider.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ColorProvider.kt\ncom/android/customization/model/color/ColorProvider\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,239:1\n787#2:240\n815#2,2:241\n*E\n*S KotlinDebug\n*F\n+ 1 ColorProvider.kt\ncom/android/customization/model/color/ColorProvider\n*L\n148#1:240\n148#1,2:241\n*E\n"
.end annotation


# instance fields
.field public colorBundles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lcom/android/customization/model/color/ColorOption;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public colorsAvailable:Z

.field public homeWallpaperColors:Landroid/app/WallpaperColors;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public lockWallpaperColors:Landroid/app/WallpaperColors;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final monetEnabled:Z

.field public final scope:Lkotlinx/coroutines/CoroutineScope;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "stubPackageName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/customization/model/ResourcesApkProvider;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 2
    invoke-static {p1}, Lcom/android/customization/model/color/ColorUtils;->isMonetEnabled(Landroid/content/Context;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/customization/model/color/ColorProvider;->monetEnabled:Z

    .line 3
    instance-of p2, p1, Landroidx/lifecycle/LifecycleOwner;

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_2

    .line 4
    check-cast p1, Landroidx/lifecycle/LifecycleOwner;

    .line 5
    invoke-interface {p1}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object p1

    const-string p2, "lifecycle"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    :cond_0
    iget-object p2, p1, Landroidx/lifecycle/Lifecycle;->mInternalScopeRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/lifecycle/LifecycleCoroutineScopeImpl;

    if-eqz p2, :cond_1

    goto :goto_0

    .line 7
    :cond_1
    new-instance p2, Landroidx/lifecycle/LifecycleCoroutineScopeImpl;

    .line 8
    invoke-static {v0, v1}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;I)Lkotlinx/coroutines/CompletableJob;

    move-result-object v2

    sget-object v3, Lkotlinx/coroutines/Dispatchers;->Default:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 9
    sget-object v3, Lkotlinx/coroutines/internal/MainDispatcherLoader;->dispatcher:Lkotlinx/coroutines/MainCoroutineDispatcher;

    .line 10
    invoke-virtual {v3}, Lkotlinx/coroutines/MainCoroutineDispatcher;->getImmediate()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v4

    check-cast v2, Lkotlinx/coroutines/JobSupport;

    invoke-virtual {v2, v4}, Lkotlinx/coroutines/JobSupport;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v2

    .line 11
    invoke-direct {p2, p1, v2}, Landroidx/lifecycle/LifecycleCoroutineScopeImpl;-><init>(Landroidx/lifecycle/Lifecycle;Lkotlin/coroutines/CoroutineContext;)V

    .line 12
    iget-object v2, p1, Landroidx/lifecycle/Lifecycle;->mInternalScopeRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v0, p2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 13
    invoke-virtual {v3}, Lkotlinx/coroutines/MainCoroutineDispatcher;->getImmediate()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v3

    const/4 v4, 0x0

    new-instance v5, Landroidx/lifecycle/LifecycleCoroutineScopeImpl$register$1;

    invoke-direct {v5, p2, v0}, Landroidx/lifecycle/LifecycleCoroutineScopeImpl$register$1;-><init>(Landroidx/lifecycle/LifecycleCoroutineScopeImpl;Lkotlin/coroutines/Continuation;)V

    const/4 v6, 0x2

    const/4 v7, 0x0

    move-object v2, p2

    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    goto :goto_0

    .line 14
    :cond_2
    sget-object p1, Lkotlinx/coroutines/Dispatchers;->INSTANCE:Lkotlinx/coroutines/Dispatchers;

    .line 15
    sget-object p1, Lkotlinx/coroutines/Dispatchers;->Default:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 16
    invoke-static {v0, v1}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;I)Lkotlinx/coroutines/CompletableJob;

    move-result-object p2

    invoke-virtual {p1, p2}, Lkotlin/coroutines/AbstractCoroutineContextElement;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object p1

    invoke-static {p1}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object p2

    .line 17
    :goto_0
    iput-object p2, p0, Lcom/android/customization/model/color/ColorProvider;->scope:Lkotlinx/coroutines/CoroutineScope;

    .line 18
    iput-boolean v1, p0, Lcom/android/customization/model/color/ColorProvider;->colorsAvailable:Z

    return-void
.end method

.method public static final access$getItemColorFromStub(Lcom/android/customization/model/color/ColorProvider;Ljava/lang/String;Ljava/lang/String;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/customization/model/ResourcesApkProvider;->mStubApkResources:Landroid/content/res/Resources;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    const-string p1, "%s%s"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/android/customization/model/ResourcesApkProvider;->mStubPackageName:Ljava/lang/String;

    const-string v1, "color"

    invoke-virtual {v0, p1, v1, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    .line 2
    iget-object p0, p0, Lcom/android/customization/model/ResourcesApkProvider;->mStubApkResources:Landroid/content/res/Resources;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result p0

    return p0
.end method

.method public static final access$loadSeedColors(Lcom/android/customization/model/color/ColorProvider;Landroid/app/WallpaperColors;Landroid/app/WallpaperColors;)V
    .locals 11

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p1, :cond_0

    goto/16 :goto_9

    .line 2
    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x2

    const/4 v7, 0x4

    if-nez p2, :cond_1

    move v2, v7

    goto :goto_0

    :cond_1
    move v2, v0

    :goto_0
    if-eqz p2, :cond_7

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v1

    iget-object v3, p0, Lcom/android/customization/model/ResourcesApkProvider;->mContext:Landroid/content/Context;

    invoke-interface {v1, v3}, Lcom/android/wallpaper/module/Injector;->getWallpaperManagerCompat(Landroid/content/Context;)Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    move-result-object v1

    .line 4
    invoke-virtual {v1, v0}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperId(I)I

    move-result v0

    const/4 v3, 0x1

    .line 5
    invoke-virtual {v1, v3}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperId(I)I

    move-result v1

    if-le v0, v1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    move v8, v3

    if-eqz v8, :cond_3

    move-object v1, p2

    goto :goto_2

    :cond_3
    move-object v1, p1

    :goto_2
    const-string v9, "lock_wallpaper"

    const-string v10, "home_wallpaper"

    if-eqz v8, :cond_4

    move-object v3, v9

    goto :goto_3

    :cond_4
    move-object v3, v10

    :goto_3
    const/4 v4, 0x1

    move-object v0, p0

    move-object v5, v6

    .line 6
    invoke-virtual/range {v0 .. v5}, Lcom/android/customization/model/color/ColorProvider;->buildColorSeeds(Landroid/app/WallpaperColors;ILjava/lang/String;ZLjava/util/List;)V

    if-eqz v8, :cond_5

    move-object v1, p1

    goto :goto_4

    :cond_5
    move-object v1, p2

    .line 7
    :goto_4
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result p1

    rsub-int/lit8 v2, p1, 0x4

    if-eqz v8, :cond_6

    move-object v3, v10

    goto :goto_5

    :cond_6
    move-object v3, v9

    :goto_5
    const/4 v4, 0x0

    move-object v0, p0

    move-object v5, v6

    .line 8
    invoke-virtual/range {v0 .. v5}, Lcom/android/customization/model/color/ColorProvider;->buildColorSeeds(Landroid/app/WallpaperColors;ILjava/lang/String;ZLjava/util/List;)V

    goto :goto_6

    :cond_7
    const/4 v4, 0x1

    const-string v3, "home_wallpaper"

    move-object v0, p0

    move-object v1, p1

    move-object v5, v6

    .line 9
    invoke-virtual/range {v0 .. v5}, Lcom/android/customization/model/color/ColorProvider;->buildColorSeeds(Landroid/app/WallpaperColors;ILjava/lang/String;ZLjava/util/List;)V

    .line 10
    :goto_6
    iget-object p1, p0, Lcom/android/customization/model/color/ColorProvider;->colorBundles:Ljava/util/List;

    if-nez p1, :cond_8

    const/4 p1, 0x0

    goto :goto_8

    .line 11
    :cond_8
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 12
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_9
    :goto_7
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/android/customization/model/color/ColorOption;

    .line 13
    instance-of v1, v1, Lcom/android/customization/model/color/ColorSeedOption;

    if-nez v1, :cond_9

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :cond_a
    move-object p1, p2

    :goto_8
    if-nez p1, :cond_b

    .line 14
    sget-object p1, Lkotlin/collections/EmptyList;->INSTANCE:Lkotlin/collections/EmptyList;

    .line 15
    :cond_b
    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 16
    iput-object v6, p0, Lcom/android/customization/model/color/ColorProvider;->colorBundles:Ljava/util/List;

    :goto_9
    return-void
.end method


# virtual methods
.method public final buildBundle(IIZLjava/lang/String;Ljava/util/List;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIZ",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/android/customization/model/color/ColorOption;",
            ">;)V"
        }
    .end annotation

    move v0, p1

    .line 1
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 2
    new-instance v1, Lcom/android/systemui/monet/ColorScheme;

    const/4 v3, 0x0

    invoke-direct {v1, p1, v3}, Lcom/android/systemui/monet/ColorScheme;-><init>(IZ)V

    .line 3
    new-instance v4, Lcom/android/systemui/monet/ColorScheme;

    const/4 v5, 0x1

    invoke-direct {v4, p1, v5}, Lcom/android/systemui/monet/ColorScheme;-><init>(IZ)V

    const/4 v6, 0x4

    new-array v7, v6, [I

    .line 4
    invoke-virtual {v1}, Lcom/android/systemui/monet/ColorScheme;->getAccent1()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x2

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    const/16 v10, 0xff

    invoke-static {v8, v10}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v8

    aput v8, v7, v3

    .line 5
    invoke-virtual {v1}, Lcom/android/systemui/monet/ColorScheme;->getAccent1()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    invoke-static {v8, v10}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v8

    aput v8, v7, v5

    .line 6
    invoke-virtual {v1}, Lcom/android/systemui/monet/ColorScheme;->getAccent3()Ljava/util/List;

    move-result-object v8

    const/4 v11, 0x6

    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    invoke-static {v8}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v8

    const/high16 v12, 0x42aa0000    # 85.0f

    invoke-virtual {v8, v12}, Landroid/content/res/ColorStateList;->withLStar(F)Landroid/content/res/ColorStateList;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/ColorStateList;->getColors()[I

    move-result-object v8

    aget v8, v8, v3

    aput v8, v7, v9

    .line 7
    invoke-virtual {v1}, Lcom/android/systemui/monet/ColorScheme;->getAccent1()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-static {v1, v10}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v1

    const/4 v8, 0x3

    aput v1, v7, v8

    new-array v1, v6, [I

    .line 8
    invoke-virtual {v4}, Lcom/android/systemui/monet/ColorScheme;->getAccent1()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    invoke-static {v6, v10}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v6

    aput v6, v1, v3

    .line 9
    invoke-virtual {v4}, Lcom/android/systemui/monet/ColorScheme;->getAccent1()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    invoke-static {v6, v10}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v6

    aput v6, v1, v5

    .line 10
    invoke-virtual {v4}, Lcom/android/systemui/monet/ColorScheme;->getAccent3()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v6, v12}, Landroid/content/res/ColorStateList;->withLStar(F)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/ColorStateList;->getColors()[I

    move-result-object v6

    aget v3, v6, v3

    aput v3, v1, v9

    .line 11
    invoke-virtual {v4}, Lcom/android/systemui/monet/ColorScheme;->getAccent1()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-static {v3, v10}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v3

    aput v3, v1, v8

    const-string v3, ""

    if-eqz p3, :cond_0

    move-object v4, v3

    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p1}, Lcom/android/customization/model/color/ColorUtils;->toColorString(I)Ljava/lang/String;

    move-result-object v4

    :goto_0
    const-string v6, "android.theme.customization.system_palette"

    .line 13
    invoke-virtual {v2, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p3, :cond_1

    goto :goto_1

    .line 14
    :cond_1
    invoke-static {p1}, Lcom/android/customization/model/color/ColorUtils;->toColorString(I)Ljava/lang/String;

    move-result-object v3

    :goto_1
    const-string v0, "android.theme.customization.accent_color"

    .line 15
    invoke-virtual {v2, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/2addr v5, p2

    .line 16
    new-instance v8, Lcom/android/customization/model/color/ColorSeedOption;

    .line 17
    new-instance v6, Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;

    const/4 v0, 0x0

    invoke-direct {v6, v7, v1, v0}, Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;-><init>([I[ILcom/android/customization/model/color/ColorSeedOption$1;)V

    const/4 v1, 0x0

    move-object v0, v8

    move/from16 v3, p3

    move-object/from16 v4, p4

    .line 18
    invoke-direct/range {v0 .. v6}, Lcom/android/customization/model/color/ColorSeedOption;-><init>(Ljava/lang/String;Ljava/util/Map;ZLjava/lang/String;ILcom/android/customization/model/color/ColorSeedOption$PreviewInfo;)V

    move-object/from16 v0, p5

    .line 19
    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final buildColorSeeds(Landroid/app/WallpaperColors;ILjava/lang/String;ZLjava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/WallpaperColors;",
            "I",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List<",
            "Lcom/android/customization/model/color/ColorOption;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/systemui/monet/ColorScheme;->Companion:Lcom/android/systemui/monet/ColorScheme$Companion;

    invoke-virtual {v0, p1}, Lcom/android/systemui/monet/ColorScheme$Companion;->getSeedColors(Landroid/app/WallpaperColors;)Ljava/util/List;

    move-result-object p1

    .line 2
    invoke-static {p1}, Lkotlin/collections/CollectionsKt___CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v2

    const/4 v3, 0x0

    move-object v1, p0

    move v4, p4

    move-object v5, p3

    move-object v6, p5

    .line 3
    invoke-virtual/range {v1 .. v6}, Lcom/android/customization/model/color/ColorProvider;->buildBundle(IIZLjava/lang/String;Ljava/util/List;)V

    const/4 p4, 0x1

    .line 4
    invoke-static {p1, p4}, Lkotlin/collections/CollectionsKt___CollectionsKt;->drop(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object p1

    sub-int/2addr p2, p4

    const-string v0, "$this$take"

    .line 5
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    if-ltz p2, :cond_0

    move v1, p4

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    if-eqz v1, :cond_7

    if-nez p2, :cond_1

    .line 6
    sget-object p1, Lkotlin/collections/EmptyList;->INSTANCE:Lkotlin/collections/EmptyList;

    goto :goto_1

    .line 7
    :cond_1
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    if-lt p2, v1, :cond_2

    invoke-static {p1}, Lkotlin/collections/CollectionsKt___CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    goto :goto_1

    :cond_2
    if-ne p2, p4, :cond_3

    .line 8
    invoke-static {p1}, Lkotlin/collections/CollectionsKt___CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    .line 9
    invoke-static {p1}, Lkotlin/collections/CollectionsKt__CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    goto :goto_1

    .line 10
    :cond_3
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 11
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move v2, v0

    :cond_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 12
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/2addr v2, p4

    if-ne v2, p2, :cond_4

    .line 13
    :cond_5
    invoke-static {v1}, Lkotlin/collections/CollectionsKt__CollectionsKt;->optimizeReadOnlyList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 14
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_6

    add-int/2addr v0, p4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result v2

    const/4 v4, 0x0

    move-object v1, p0

    move v3, v0

    move-object v5, p3

    move-object v6, p5

    .line 15
    invoke-virtual/range {v1 .. v6}, Lcom/android/customization/model/color/ColorProvider;->buildBundle(IIZLjava/lang/String;Ljava/util/List;)V

    goto :goto_2

    :cond_6
    return-void

    .line 16
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Requested element count "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " is less than zero."

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
