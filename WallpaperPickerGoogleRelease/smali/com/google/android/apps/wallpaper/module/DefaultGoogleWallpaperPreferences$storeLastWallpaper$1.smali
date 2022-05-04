.class public final Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;->storeLastWallpaper(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Landroid/app/WallpaperInfo;Landroid/app/WallpaperColors;)V
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

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDefaultGoogleWallpaperPreferences.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DefaultGoogleWallpaperPreferences.kt\ncom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,191:1\n1#2:192\n*E\n"
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.google.android.apps.wallpaper.module.DefaultGoogleWallpaperPreferences$storeLastWallpaper$1"
    f = "DefaultGoogleWallpaperPreferences.kt"
    l = {
        0xae,
        0xb0
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field public final synthetic $croppedWallpaperBitmap:Landroid/graphics/Bitmap;

.field public final synthetic $wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic $wallpaperId:Ljava/lang/String;

.field public label:I

.field private synthetic p$:Lkotlinx/coroutines/CoroutineScope;

.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;",
            "Ljava/lang/String;",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$wallpaperId:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$croppedWallpaperBitmap:Landroid/graphics/Bitmap;

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

    new-instance v6, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$wallpaperId:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$croppedWallpaperBitmap:Landroid/graphics/Bitmap;

    move-object v0, v6

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;-><init>(Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    iput-object p1, v6, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->p$:Lkotlinx/coroutines/CoroutineScope;

    return-object v6
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    sget-object v0, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    .line 1
    iget v1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->label:I

    const-string v2, "mContext"

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v1, :cond_2

    if-eq v1, v4, :cond_1

    if-ne v1, v3, :cond_0

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

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

    goto :goto_0

    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 4
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    .line 5
    iget-object p1, p1, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    .line 6
    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$wallpaperId:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v6, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$croppedWallpaperBitmap:Landroid/graphics/Bitmap;

    iput v4, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->label:I

    invoke-static {p1, v1, v5, v6, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->saveThumbnail(Landroid/content/Context;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_3

    return-object v0

    .line 7
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    .line 8
    invoke-virtual {p1}, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;->notifyRecentsChange()V

    .line 9
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$croppedWallpaperBitmap:Landroid/graphics/Bitmap;

    if-nez p1, :cond_4

    goto :goto_1

    :cond_4
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->this$0:Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->$wallpaperId:Ljava/lang/String;

    .line 10
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPreferences;->mContext:Landroid/content/Context;

    .line 11
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput v3, p0, Lcom/google/android/apps/wallpaper/module/DefaultGoogleWallpaperPreferences$storeLastWallpaper$1;->label:I

    invoke-static {v1, v4, p1, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->saveFullBitmap(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_5

    return-object v0

    .line 12
    :cond_5
    :goto_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
