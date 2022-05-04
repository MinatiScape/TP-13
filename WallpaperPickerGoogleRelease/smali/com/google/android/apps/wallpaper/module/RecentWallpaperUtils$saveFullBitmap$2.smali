.class public final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->saveFullBitmap(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
    c = "com.google.android.apps.wallpaper.module.RecentWallpaperUtils$saveFullBitmap$2"
    f = "RecentWallpaperUtils.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field public final synthetic $context:Landroid/content/Context;

.field public final synthetic $wallpaperBitmap:Landroid/graphics/Bitmap;

.field public final synthetic $wallpaperId:Ljava/lang/String;

.field public label:I

.field private synthetic p$:Lkotlinx/coroutines/CoroutineScope;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$wallpaperId:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$wallpaperBitmap:Landroid/graphics/Bitmap;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3
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

    new-instance v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$wallpaperId:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$wallpaperBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1, v2, p0, p2}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    iput-object p1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->p$:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$wallpaperId:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$wallpaperBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1, v2, p0, p2}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->p$:Lkotlinx/coroutines/CoroutineScope;

    .line 2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->label:I

    if-nez v0, :cond_0

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 2
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$wallpaperId:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->getWallpaperFullBitmapFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;->$wallpaperBitmap:Landroid/graphics/Bitmap;

    invoke-static {p1, v0, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->access$storeBitmap(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 3
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
