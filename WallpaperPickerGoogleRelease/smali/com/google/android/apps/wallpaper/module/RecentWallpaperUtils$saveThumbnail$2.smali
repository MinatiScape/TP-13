.class public final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->saveThumbnail(Landroid/content/Context;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
    c = "com.google.android.apps.wallpaper.module.RecentWallpaperUtils$saveThumbnail$2"
    f = "RecentWallpaperUtils.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field public final synthetic $context:Landroid/content/Context;

.field public final synthetic $fullSizeBitmap:Landroid/graphics/Bitmap;

.field public final synthetic $info:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic $wallpaperId:Ljava/lang/String;

.field public label:I

.field private synthetic p$:Lkotlinx/coroutines/CoroutineScope;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/graphics/Bitmap;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/String;",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$fullSizeBitmap:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$wallpaperId:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$info:Lcom/android/wallpaper/model/WallpaperInfo;

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

    new-instance v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$fullSizeBitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$wallpaperId:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$info:Lcom/android/wallpaper/model/WallpaperInfo;

    move-object v0, v6

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    iput-object p1, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->p$:Lkotlinx/coroutines/CoroutineScope;

    return-object v6
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->label:I

    if-nez v0, :cond_2

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 2
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$context:Landroid/content/Context;

    invoke-static {p1}, Lcom/android/wallpaper/util/SizeCalculator;->getSuggestedThumbnailSize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v2

    .line 3
    new-instance v1, Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v1}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 4
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$fullSizeBitmap:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_0

    .line 5
    new-instance p1, Landroid/graphics/Rect;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$fullSizeBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$fullSizeBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {p1, v4, v4, v0, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 6
    check-cast p1, Landroid/graphics/Rect;

    iget v0, v2, Landroid/graphics/Point;->x:I

    iget v2, v2, Landroid/graphics/Point;->y:I

    invoke-static {p1, v0, v2}, Lcom/android/wallpaper/util/WallpaperCropUtils;->fitToSize(Landroid/graphics/Rect;II)V

    .line 7
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$wallpaperId:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->getWallpaperThumbnailFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 8
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$fullSizeBitmap:Landroid/graphics/Bitmap;

    iget-object v2, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    const/4 v3, 0x1

    invoke-static {p0, v2, v1, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    const-string v1, "createScaledBitmap(fullSizeBitmap, thumbRect.width(), thumbRect.height(),\n                        true)"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-static {p1, v0, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->access$storeBitmap(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$info:Lcom/android/wallpaper/model/WallpaperInfo;

    if-nez p1, :cond_1

    .line 11
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$wallpaperId:Ljava/lang/String;

    const-string p1, "fullSizeBitmap & info both null for "

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->stringPlus(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "RecentWallpaperUtils"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0

    .line 13
    :cond_1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$context:Landroid/content/Context;

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p1

    const/4 v6, 0x0

    .line 14
    new-instance v7, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$wallpaperId:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;->$context:Landroid/content/Context;

    move-object v0, v7

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2$1;-><init>(Lkotlin/jvm/internal/Ref$ObjectRef;Landroid/graphics/Point;Lcom/android/wallpaper/asset/Asset;Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {p1, v6, v7}, Lcom/android/wallpaper/asset/Asset;->decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    .line 15
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
