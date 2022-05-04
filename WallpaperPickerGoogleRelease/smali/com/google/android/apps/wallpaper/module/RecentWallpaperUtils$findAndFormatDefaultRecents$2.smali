.class public final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;
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
        "Lorg/json/JSONArray;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRecentWallpaperUtils.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RecentWallpaperUtils.kt\ncom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,346:1\n1819#2,2:347\n1819#2,2:349\n*E\n*S KotlinDebug\n*F\n+ 1 RecentWallpaperUtils.kt\ncom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2\n*L\n247#1,2:347\n266#1,2:349\n*E\n"
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.google.android.apps.wallpaper.module.RecentWallpaperUtils$findAndFormatDefaultRecents$2"
    f = "RecentWallpaperUtils.kt"
    l = {
        0xfa,
        0xfc,
        0x101,
        0x102,
        0x104,
        0x105
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field public final synthetic $context:Landroid/content/Context;

.field public final synthetic $wallpapers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;"
        }
    .end annotation
.end field

.field public L$0:Ljava/lang/Object;

.field public L$1:Ljava/lang/Object;

.field public L$2:Ljava/lang/Object;

.field public L$3:Ljava/lang/Object;

.field public L$4:Ljava/lang/Object;

.field public label:I

.field private synthetic p$:Lkotlinx/coroutines/CoroutineScope;


# direct methods
.method public constructor <init>(Ljava/util/List;Landroid/content/Context;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;",
            "Landroid/content/Context;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->$wallpapers:Ljava/util/List;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->$context:Landroid/content/Context;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
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

    new-instance v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->$wallpapers:Ljava/util/List;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->$context:Landroid/content/Context;

    invoke-direct {v0, v1, p0, p2}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;-><init>(Ljava/util/List;Landroid/content/Context;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    iput-object p1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->p$:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->$wallpapers:Ljava/util/List;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->$context:Landroid/content/Context;

    invoke-direct {v0, v1, p0, p2}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;-><init>(Ljava/util/List;Landroid/content/Context;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->p$:Lkotlinx/coroutines/CoroutineScope;

    .line 2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    sget-object v0, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    .line 1
    iget v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->label:I

    const/4 v2, 0x0

    const-string v3, "wallpaperInfo.wallpaperId"

    packed-switch v1, :pswitch_data_0

    .line 2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3
    :pswitch_0
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$3:Ljava/lang/Object;

    check-cast v1, Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    check-cast v4, Ljava/util/Iterator;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    check-cast v5, Landroid/content/Context;

    iget-object v6, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v1

    move-object v1, v0

    goto/16 :goto_6

    :pswitch_1
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$3:Ljava/lang/Object;

    check-cast v1, Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    check-cast v4, Ljava/util/Iterator;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    check-cast v5, Landroid/content/Context;

    iget-object v6, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object p1, v0

    goto/16 :goto_5

    :pswitch_2
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$4:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$3:Ljava/lang/Object;

    check-cast v4, Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    check-cast v5, Ljava/util/Iterator;

    iget-object v6, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    check-cast v6, Landroid/content/Context;

    iget-object v7, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    check-cast v7, Ljava/util/ArrayList;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v8, v7

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v1

    move-object v1, v0

    goto/16 :goto_4

    :pswitch_3
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    check-cast v1, Ljava/util/Iterator;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    check-cast v4, Landroid/content/Context;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v7, v5

    move-object v5, v1

    move-object v1, v0

    goto/16 :goto_8

    :pswitch_4
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$3:Ljava/lang/Object;

    check-cast v1, Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    check-cast v4, Ljava/util/Iterator;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    check-cast v5, Landroid/content/Context;

    iget-object v6, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v1

    move-object v1, v0

    goto :goto_2

    :pswitch_5
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 5
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->$wallpapers:Ljava/util/List;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->$context:Landroid/content/Context;

    .line 6
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object v5, v1

    move-object v6, v4

    move-object v1, p1

    move-object p1, v0

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/wallpaper/model/WallpaperInfo;

    .line 7
    instance-of v7, v4, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    if-eqz v7, :cond_5

    instance-of v7, v4, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;

    if-nez v7, :cond_5

    .line 8
    move-object v7, v4

    check-cast v7, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    .line 9
    iget-object v8, v7, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    .line 10
    invoke-virtual {v8}, Landroid/app/WallpaperInfo;->getServiceInfo()Landroid/content/pm/ServiceInfo;

    move-result-object v8

    iget-object v8, v8, Landroid/content/pm/ServiceInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 11
    iget v8, v8, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v8, v8, 0x81

    const/4 v9, 0x1

    if-eqz v8, :cond_1

    move v8, v9

    goto :goto_1

    :cond_1
    const/4 v8, 0x0

    :goto_1
    if-eqz v8, :cond_5

    .line 12
    iput-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    iput-object v6, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    iput-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    iput-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$3:Ljava/lang/Object;

    iput v9, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->label:I

    invoke-static {v7, v6, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->recentFromLiveWallpaper(Lcom/android/wallpaper/model/LiveWallpaperInfo;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v7

    if-ne v7, p1, :cond_2

    return-object p1

    :cond_2
    move-object v10, v0

    move-object v0, p1

    move-object p1, v7

    move-object v7, v1

    move-object v1, v10

    :goto_2
    check-cast p1, Lorg/json/JSONObject;

    if-nez p1, :cond_3

    goto/16 :goto_7

    .line 13
    :cond_3
    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    move-object p1, v4

    check-cast p1, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    invoke-virtual {p1}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v7, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    iput-object v6, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    iput-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    iput-object v2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$3:Ljava/lang/Object;

    const/4 v8, 0x2

    iput v8, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->label:I

    .line 15
    invoke-static {v6, p1, v4, v2, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->saveThumbnail(Landroid/content/Context;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_4

    return-object v0

    :cond_4
    :goto_3
    move-object v4, v6

    goto/16 :goto_8

    .line 16
    :cond_5
    instance-of v7, v4, Lcom/android/wallpaper/model/SystemStaticWallpaperInfo;

    if-nez v7, :cond_6

    .line 17
    instance-of v7, v4, Lcom/android/wallpaper/model/ImageWallpaperInfo;

    if-nez v7, :cond_6

    .line 18
    instance-of v7, v4, Lcom/android/wallpaper/model/CurrentWallpaperInfoVN;

    if-eqz v7, :cond_0

    .line 19
    :cond_6
    iput-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    iput-object v6, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    iput-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    iput-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$3:Ljava/lang/Object;

    iput-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$4:Ljava/lang/Object;

    const/4 v7, 0x3

    iput v7, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->label:I

    invoke-static {v4, v6, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->recentFromImageWallpaperInfo(Lcom/android/wallpaper/model/WallpaperInfo;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v7

    if-ne v7, p1, :cond_7

    return-object p1

    :cond_7
    move-object v8, v1

    move-object v1, v0

    move-object v0, p1

    move-object p1, v7

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v8

    :goto_4
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    invoke-virtual {v5}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v8, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    iput-object v7, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    iput-object v6, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    iput-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$3:Ljava/lang/Object;

    iput-object v2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$4:Ljava/lang/Object;

    const/4 v3, 0x4

    iput v3, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->label:I

    .line 21
    invoke-static {v7, p1, v5, v2, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->saveThumbnail(Landroid/content/Context;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_8

    return-object v0

    :cond_8
    move-object p1, v0

    move-object v0, v1

    move-object v3, v4

    move-object v1, v5

    move-object v4, v6

    move-object v5, v7

    move-object v6, v8

    .line 22
    :goto_5
    iput-object v6, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    iput-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    iput-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    iput-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$3:Ljava/lang/Object;

    const/4 v7, 0x5

    iput v7, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->label:I

    .line 23
    new-instance v7, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p0}, Lkotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v8

    invoke-direct {v7, v8}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 24
    invoke-virtual {v1, v5}, Lcom/android/wallpaper/model/WallpaperInfo;->getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v8

    .line 25
    new-instance v9, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$getWallpaperBitmap$2$1;

    invoke-direct {v9, v7, v8}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$getWallpaperBitmap$2$1;-><init>(Lkotlin/coroutines/Continuation;Lcom/android/wallpaper/asset/Asset;)V

    invoke-virtual {v8, v2, v9}, Lcom/android/wallpaper/asset/Asset;->decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    .line 26
    invoke-virtual {v7}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object v7

    if-ne v7, p1, :cond_9

    return-object p1

    :cond_9
    move-object v10, v0

    move-object v0, p1

    move-object p1, v7

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v1

    move-object v1, v10

    .line 27
    :goto_6
    check-cast p1, Landroid/graphics/Bitmap;

    if-nez p1, :cond_a

    move-object v3, v4

    :goto_7
    move-object p1, v0

    move-object v0, v1

    goto :goto_9

    .line 28
    :cond_a
    invoke-virtual {v3}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v7, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$0:Ljava/lang/Object;

    iput-object v6, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$1:Ljava/lang/Object;

    iput-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$2:Ljava/lang/Object;

    iput-object v2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->L$3:Ljava/lang/Object;

    const/4 v8, 0x6

    iput v8, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$findAndFormatDefaultRecents$2;->label:I

    invoke-static {v6, v3, p1, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->saveFullBitmap(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_b

    return-object v0

    :cond_b
    move-object v3, v4

    goto/16 :goto_3

    :goto_8
    move-object p1, v0

    move-object v0, v1

    move-object v6, v4

    :goto_9
    move-object v1, v7

    goto/16 :goto_0

    .line 29
    :cond_c
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 30
    invoke-static {v1}, Lkotlin/collections/CollectionsKt___CollectionsKt;->reversed(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    .line 31
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    .line 32
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_a

    :cond_d
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
