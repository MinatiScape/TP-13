.class public final Lcom/android/customization/model/color/ColorProvider$loadPreset$2;
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
    c = "com.android.customization.model.color.ColorProvider$loadPreset$2"
    f = "ColorProvider.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field public label:I

.field private synthetic p$:Lkotlinx/coroutines/CoroutineScope;

.field public final synthetic this$0:Lcom/android/customization/model/color/ColorProvider;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/color/ColorProvider;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/customization/model/color/ColorProvider;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/android/customization/model/color/ColorProvider$loadPreset$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->this$0:Lcom/android/customization/model/color/ColorProvider;

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

    new-instance v0, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;

    iget-object p0, p0, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->this$0:Lcom/android/customization/model/color/ColorProvider;

    invoke-direct {v0, p0, p2}, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;-><init>(Lcom/android/customization/model/color/ColorProvider;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    iput-object p1, v0, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->p$:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    new-instance v0, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;

    iget-object p0, p0, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->this$0:Lcom/android/customization/model/color/ColorProvider;

    invoke-direct {v0, p0, p2}, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;-><init>(Lcom/android/customization/model/color/ColorProvider;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->p$:Lkotlinx/coroutines/CoroutineScope;

    .line 2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 22
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    move-object/from16 v1, p0

    const-string v2, "android"

    .line 1
    iget v0, v1, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->label:I

    if-nez v0, :cond_a

    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 2
    iget-object v0, v1, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->this$0:Lcom/android/customization/model/color/ColorProvider;

    .line 3
    iget-object v0, v0, Lcom/android/customization/model/ResourcesApkProvider;->mContext:Landroid/content/Context;

    .line 4
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 5
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 6
    iget-object v0, v1, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->this$0:Lcom/android/customization/model/color/ColorProvider;

    .line 7
    iget-object v5, v0, Lcom/android/customization/model/ResourcesApkProvider;->mStubApkResources:Landroid/content/res/Resources;

    iget-object v6, v0, Lcom/android/customization/model/ResourcesApkProvider;->mStubPackageName:Ljava/lang/String;

    const-string v7, "color_bundles"

    const-string v8, "array"

    invoke-virtual {v5, v7, v8, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 8
    iget-object v0, v0, Lcom/android/customization/model/ResourcesApkProvider;->mStubApkResources:Landroid/content/res/Resources;

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    const-string v5, "bundleNames"

    .line 9
    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    .line 10
    array-length v6, v0

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-lt v5, v6, :cond_2

    .line 11
    array-length v5, v0

    if-eqz v5, :cond_1

    if-eq v5, v8, :cond_0

    .line 12
    new-instance v5, Ljava/util/ArrayList;

    .line 13
    new-instance v6, Lkotlin/collections/ArrayAsCollection;

    invoke-direct {v6, v0, v7}, Lkotlin/collections/ArrayAsCollection;-><init>([Ljava/lang/Object;Z)V

    .line 14
    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_2

    .line 15
    :cond_0
    aget-object v0, v0, v7

    invoke-static {v0}, Lkotlin/collections/CollectionsKt__CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    goto :goto_2

    .line 16
    :cond_1
    sget-object v5, Lkotlin/collections/EmptyList;->INSTANCE:Lkotlin/collections/EmptyList;

    goto :goto_2

    .line 17
    :cond_2
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 18
    array-length v9, v0

    move v10, v7

    move v11, v10

    :goto_0
    if-ge v10, v9, :cond_4

    aget-object v12, v0, v10

    .line 19
    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/2addr v11, v8

    if-ne v11, v5, :cond_3

    goto :goto_1

    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    move-object v5, v6

    .line 20
    :goto_2
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v6, v8

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 21
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 22
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 23
    iget-object v9, v1, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->this$0:Lcom/android/customization/model/color/ColorProvider;

    .line 24
    iget-object v10, v9, Lcom/android/customization/model/ResourcesApkProvider;->mStubApkResources:Landroid/content/res/Resources;

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const-string v12, "bundle_name_"

    aput-object v12, v11, v7

    aput-object v0, v11, v8

    const-string v12, "%s%s"

    invoke-static {v12, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    iget-object v12, v9, Lcom/android/customization/model/ResourcesApkProvider;->mStubPackageName:Ljava/lang/String;

    const-string v13, "string"

    invoke-virtual {v10, v11, v13, v12}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 25
    iget-object v9, v9, Lcom/android/customization/model/ResourcesApkProvider;->mStubApkResources:Landroid/content/res/Resources;

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 26
    iget-object v10, v1, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->this$0:Lcom/android/customization/model/color/ColorProvider;

    const-string v11, "color_secondary_"

    invoke-static {v10, v11, v0}, Lcom/android/customization/model/color/ColorProvider;->access$getItemColorFromStub(Lcom/android/customization/model/color/ColorProvider;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 27
    new-instance v12, Lcom/android/systemui/monet/ColorScheme;

    invoke-direct {v12, v10, v8}, Lcom/android/systemui/monet/ColorScheme;-><init>(IZ)V

    .line 28
    new-instance v8, Lcom/android/systemui/monet/ColorScheme;

    invoke-direct {v8, v10, v7}, Lcom/android/systemui/monet/ColorScheme;-><init>(IZ)V

    .line 29
    invoke-virtual {v8}, Lcom/android/systemui/monet/ColorScheme;->getBackgroundColor()I

    move-result v8

    .line 30
    invoke-virtual {v12}, Lcom/android/systemui/monet/ColorScheme;->getBackgroundColor()I

    move-result v16

    .line 31
    invoke-static {v10}, Lcom/android/customization/model/color/ColorUtils;->toColorString(I)Ljava/lang/String;

    move-result-object v10

    const-string v12, "android.theme.customization.system_palette"

    .line 32
    invoke-virtual {v15, v12, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    iget-object v10, v1, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->this$0:Lcom/android/customization/model/color/ColorProvider;

    invoke-static {v10, v11, v0}, Lcom/android/customization/model/color/ColorProvider;->access$getItemColorFromStub(Lcom/android/customization/model/color/ColorProvider;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 34
    new-instance v10, Lcom/android/systemui/monet/ColorScheme;

    const/4 v11, 0x1

    invoke-direct {v10, v0, v11}, Lcom/android/systemui/monet/ColorScheme;-><init>(IZ)V

    .line 35
    new-instance v11, Lcom/android/systemui/monet/ColorScheme;

    invoke-direct {v11, v0, v7}, Lcom/android/systemui/monet/ColorScheme;-><init>(IZ)V

    .line 36
    invoke-virtual {v11}, Lcom/android/systemui/monet/ColorScheme;->getAccentColor()I

    move-result v11

    .line 37
    invoke-virtual {v10}, Lcom/android/systemui/monet/ColorScheme;->getAccentColor()I

    move-result v12

    .line 38
    invoke-static {v0}, Lcom/android/customization/model/color/ColorUtils;->toColorString(I)Ljava/lang/String;

    move-result-object v0

    const-string v10, "android.theme.customization.accent_color"

    .line 39
    invoke-virtual {v15, v10, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lcom/android/customization/model/ResourceConstants;->ICONS_FOR_PREVIEW:[Ljava/lang/String;

    .line 41
    :try_start_0
    array-length v7, v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_3

    const/4 v10, 0x0

    :goto_4
    if-ge v10, v7, :cond_5

    move-object/from16 v18, v5

    :try_start_1
    aget-object v5, v0, v10

    move-object/from16 v19, v0

    .line 42
    invoke-virtual {v3, v2}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v0
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    move-object/from16 v20, v3

    .line 43
    :try_start_2
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v3

    move/from16 v21, v7

    const-string v7, "drawable"

    .line 44
    invoke-virtual {v0, v5, v7, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    const/4 v5, 0x0

    :try_start_3
    invoke-virtual {v3, v0, v5}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 45
    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_3 .. :try_end_3} :catch_0

    add-int/lit8 v10, v10, 0x1

    move-object/from16 v5, v18

    move-object/from16 v0, v19

    move-object/from16 v3, v20

    move/from16 v7, v21

    goto :goto_4

    :catch_0
    move-exception v0

    goto :goto_6

    :catch_1
    move-exception v0

    :goto_5
    const/4 v5, 0x0

    goto :goto_6

    :catch_2
    move-exception v0

    move-object/from16 v20, v3

    goto :goto_5

    :cond_5
    move-object/from16 v20, v3

    move-object/from16 v18, v5

    const/4 v5, 0x0

    goto :goto_7

    :catch_3
    move-exception v0

    move-object/from16 v20, v3

    move-object/from16 v18, v5

    goto :goto_5

    :goto_6
    const-string v3, "ColorBundlePreviewExtractor"

    const-string v7, "Didn\'t find android package icons, will skip preview"

    .line 46
    invoke-static {v3, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 47
    :goto_7
    iget-object v0, v1, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->this$0:Lcom/android/customization/model/color/ColorProvider;

    .line 48
    iget-object v0, v0, Lcom/android/customization/model/ResourcesApkProvider;->mContext:Landroid/content/Context;

    if-nez v9, :cond_6

    const v3, 0x7f110032

    .line 49
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_8

    :cond_6
    move-object v3, v9

    .line 50
    :goto_8
    new-instance v7, Lcom/android/customization/model/color/ColorBundle;

    const/16 v19, 0x0

    .line 51
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    const-string v9, "config_icon_mask"

    .line 52
    invoke-virtual {v0, v9, v13, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    .line 53
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 54
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_7

    .line 55
    invoke-static {v9}, Landroidx/core/graphics/PathParser;->createPathFromPathData(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object v9

    goto :goto_9

    :cond_7
    move-object v9, v5

    :goto_9
    if-eqz v9, :cond_8

    .line 56
    new-instance v5, Landroid/graphics/drawable/shapes/PathShape;

    const/high16 v10, 0x42c80000    # 100.0f

    invoke-direct {v5, v9, v10, v10}, Landroid/graphics/drawable/shapes/PathShape;-><init>(Landroid/graphics/Path;FF)V

    .line 57
    new-instance v9, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v9, v5}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    const/16 v5, 0x64

    .line 58
    invoke-virtual {v9, v5}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    .line 59
    invoke-virtual {v9, v5}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicWidth(I)V

    move-object v5, v9

    .line 60
    :cond_8
    new-instance v21, Lcom/android/customization/model/color/ColorBundle$PreviewInfo;

    const-string v9, "config_bottomDialogCornerRadius"

    const-string v10, "dimen"

    .line 61
    invoke-virtual {v0, v9, v10, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    .line 62
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    const/16 v17, 0x0

    move-object/from16 v9, v21

    move v10, v11

    move v11, v12

    move v12, v8

    move/from16 v13, v16

    move-object v8, v15

    move-object v15, v5

    move/from16 v16, v0

    invoke-direct/range {v9 .. v17}, Lcom/android/customization/model/color/ColorBundle$PreviewInfo;-><init>(IIIILjava/util/List;Landroid/graphics/drawable/Drawable;ILcom/android/customization/model/color/ColorBundle$1;)V

    move-object v9, v7

    move-object v10, v3

    move-object v11, v8

    move/from16 v12, v19

    move v13, v6

    move-object/from16 v14, v21

    .line 63
    invoke-direct/range {v9 .. v14}, Lcom/android/customization/model/color/ColorBundle;-><init>(Ljava/lang/String;Ljava/util/Map;ZILcom/android/customization/model/color/ColorBundle$PreviewInfo;)V

    .line 64
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v3, 0x1

    add-int/2addr v6, v3

    move v8, v3

    move-object/from16 v5, v18

    move-object/from16 v3, v20

    const/4 v7, 0x0

    goto/16 :goto_3

    .line 65
    :cond_9
    iget-object v0, v1, Lcom/android/customization/model/color/ColorProvider$loadPreset$2;->this$0:Lcom/android/customization/model/color/ColorProvider;

    .line 66
    iput-object v4, v0, Lcom/android/customization/model/color/ColorProvider;->colorBundles:Ljava/util/List;

    .line 67
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
