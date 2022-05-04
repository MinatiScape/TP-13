.class public final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRecentWallpaperUtils.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RecentWallpaperUtils.kt\ncom/google/android/apps/wallpaper/module/RecentWallpaperUtils\n+ 2 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,346:1\n37#2,2:347\n1#3:349\n*E\n*S KotlinDebug\n*F\n+ 1 RecentWallpaperUtils.kt\ncom/google/android/apps/wallpaper/module/RecentWallpaperUtils\n*L\n136#1,2:347\n*E\n"
.end annotation


# direct methods
.method public static final access$storeBitmap(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object p0

    .line 2
    :try_start_0
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v0, 0x64

    invoke-virtual {p2, p1, v0, p0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 3
    invoke-static {p0, p1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception p2

    invoke-static {p0, p1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public static final cleanUpRecentsArray(Lorg/json/JSONArray;Landroid/content/Context;)Lorg/json/JSONArray;
    .locals 12
    .param p0    # Lorg/json/JSONArray;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    const-string v3, "id"

    const/4 v4, 0x0

    if-ltz v1, :cond_2

    :goto_0
    add-int/lit8 v5, v1, -0x1

    .line 3
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "component"

    .line 4
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 5
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "entry.getString(KEY_COMPONENT)"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v8, "/"

    filled-new-array {v8}, [Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x6

    invoke-static {v7, v8, v4, v4, v9}, Lkotlin/text/StringsKt__StringsKt;->split$default(Ljava/lang/CharSequence;[Ljava/lang/String;ZII)Ljava/util/List;

    move-result-object v7

    .line 6
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 7
    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    new-instance v10, Landroid/content/Intent;

    const-string v11, "android.service.wallpaper.WallpaperService"

    invoke-direct {v10, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 9
    invoke-virtual {v10, v8, v7}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v7

    .line 10
    invoke-virtual {v9, v7, v4}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v7

    if-nez v7, :cond_0

    .line 11
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    :cond_0
    if-gez v5, :cond_1

    goto :goto_1

    :cond_1
    move v1, v5

    goto :goto_0

    .line 13
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/4 v2, 0x5

    if-le v1, v2, :cond_3

    .line 14
    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "null cannot be cast to non-null type org.json.JSONObject"

    invoke-static {v1, v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    check-cast v1, Lorg/json/JSONObject;

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 15
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "removedId"

    .line 16
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->getWallpaperFullBitmapFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    .line 17
    invoke-static {v1}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->getWallpaperThumbnailFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    goto :goto_2

    :cond_4
    return-object p0
.end method

.method public static final createRecentEntryJson(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Landroid/app/WallpaperInfo;Ljava/lang/Integer;)Lorg/json/JSONObject;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Landroid/app/WallpaperInfo;",
            "Ljava/lang/Integer;",
            ")",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "id"

    .line 2
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p0, "collectionId"

    .line 3
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p2, :cond_0

    .line 4
    new-instance p0, Lorg/json/JSONArray;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/String;

    .line 5
    invoke-interface {p2, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    const-string p2, "null cannot be cast to non-null type kotlin.Array<T>"

    invoke-static {p1, p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    invoke-direct {p0, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/Object;)V

    const-string p1, "attributions"

    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    const-string p0, "actionUrl"

    .line 7
    invoke-virtual {v0, p0, p3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p4, :cond_1

    .line 8
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x2f

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 9
    invoke-virtual {p4}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "component"

    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    if-eqz p5, :cond_2

    .line 11
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const-string p1, "color"

    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_2
    return-object v0
.end method

.method public static final getWallpaperFullBitmapFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "wallpaperId"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "/"

    const-string v1, "-"

    const/4 v2, 0x0

    const/4 v3, 0x4

    .line 1
    invoke-static {p0, v0, v1, v2, v3}, Lkotlin/text/StringsKt__StringsJVMKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)Ljava/lang/String;

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "wp-full-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".png"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final getWallpaperThumbnailFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "wallpaperId"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "/"

    const-string v1, "-"

    const/4 v2, 0x0

    const/4 v3, 0x4

    .line 1
    invoke-static {p0, v0, v1, v2, v3}, Lkotlin/text/StringsKt__StringsJVMKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)Ljava/lang/String;

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "wp-thumb-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".png"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final obtainPlaceHolderColor(Lcom/android/wallpaper/asset/Asset;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Lkotlin/coroutines/SafeContinuation;

    invoke-static {p2}, Lkotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p2

    invoke-direct {v0, p2}, Lkotlin/coroutines/SafeContinuation;-><init>(Lkotlin/coroutines/Continuation;)V

    if-nez p0, :cond_0

    const/4 p0, 0x0

    .line 2
    invoke-virtual {v0, p0}, Lkotlin/coroutines/SafeContinuation;->resumeWith(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const-string p2, "window"

    .line 3
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string p2, "null cannot be cast to non-null type android.view.WindowManager"

    invoke-static {p1, p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    check-cast p1, Landroid/view/WindowManager;

    .line 4
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    .line 5
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p1

    .line 6
    iget p2, p1, Landroid/graphics/Point;->x:I

    div-int/lit8 p2, p2, 0x2

    iget p1, p1, Landroid/graphics/Point;->y:I

    div-int/lit8 p1, p1, 0x2

    .line 7
    new-instance v1, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$obtainPlaceHolderColor$2$1;

    invoke-direct {v1, v0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$obtainPlaceHolderColor$2$1;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 8
    invoke-virtual {p0, p2, p1, v1}, Lcom/android/wallpaper/asset/Asset;->decodeBitmap(IILcom/android/wallpaper/asset/Asset$BitmapReceiver;)V

    .line 9
    :goto_0
    invoke-virtual {v0}, Lkotlin/coroutines/SafeContinuation;->getOrThrow()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final parseRecentWallpapers(Lorg/json/JSONArray;)Ljava/util/List;
    .locals 14
    .param p0    # Lorg/json/JSONArray;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string v0, "jsonArray"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_2

    .line 2
    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "jsonArray.getJSONObject(it)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    new-instance v5, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;

    const-string v6, "id"

    .line 4
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v6, "obj.getString(KEY_ID)"

    invoke-static {v7, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "collectionId"

    const/4 v8, 0x0

    .line 5
    invoke-virtual {v4, v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v6, "attributions"

    .line 6
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    if-nez v6, :cond_0

    move-object v11, v8

    goto :goto_2

    .line 7
    :cond_0
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v10

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11, v10}, Ljava/util/ArrayList;-><init>(I)V

    move v12, v2

    :goto_1
    if-ge v12, v10, :cond_1

    invoke-virtual {v6, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    const-string v6, "actionUrl"

    .line 8
    invoke-virtual {v4, v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v6, "component"

    .line 9
    invoke-virtual {v4, v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v6, "color"

    .line 10
    invoke-virtual {v4, v6, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object v6, v5

    move-object v8, v9

    move-object v9, v11

    move-object v11, v12

    move-object v12, v4

    .line 11
    invoke-direct/range {v6 .. v12}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 12
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public static final synthetic recentFromImageWallpaperInfo(Lcom/android/wallpaper/model/WallpaperInfo;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 12

    instance-of v0, p2, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;

    iget v1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->label:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;

    invoke-direct {v0, p2}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;-><init>(Lkotlin/coroutines/Continuation;)V

    :goto_0
    iget-object p2, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->result:Ljava/lang/Object;

    sget-object v1, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    .line 1
    iget v2, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->label:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->L$3:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object p1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->L$2:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    iget-object v1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->L$1:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->L$0:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {p2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v9, p0

    move-object v8, p1

    move-object v6, v0

    move-object v7, v1

    goto :goto_1

    .line 2
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3
    :cond_2
    invoke-static {p2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 4
    invoke-virtual {p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object p2

    const-string v2, "wallpaper.wallpaperId"

    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 6
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p0

    iput-object p2, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->L$0:Ljava/lang/Object;

    iput-object v2, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->L$1:Ljava/lang/Object;

    iput-object v4, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->L$2:Ljava/lang/Object;

    iput-object v5, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->L$3:Ljava/lang/Object;

    iput v3, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromImageWallpaperInfo$1;->label:I

    invoke-static {p0, p1, v0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->obtainPlaceHolderColor(Lcom/android/wallpaper/asset/Asset;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_3

    return-object v1

    :cond_3
    move-object v6, p2

    move-object v7, v2

    move-object v8, v4

    move-object v9, v5

    move-object p2, p0

    :goto_1
    const/4 v10, 0x0

    .line 9
    move-object v11, p2

    check-cast v11, Ljava/lang/Integer;

    .line 10
    invoke-static/range {v6 .. v11}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->createRecentEntryJson(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Landroid/app/WallpaperInfo;Ljava/lang/Integer;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static final recentFromLiveWallpaper(Lcom/android/wallpaper/model/LiveWallpaperInfo;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 12

    instance-of v0, p2, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;

    iget v1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->label:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;

    invoke-direct {v0, p2}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;-><init>(Lkotlin/coroutines/Continuation;)V

    :goto_0
    iget-object p2, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->result:Ljava/lang/Object;

    sget-object v1, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    .line 1
    iget v2, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->label:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p0, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->L$3:Ljava/lang/Object;

    check-cast p0, Landroid/app/WallpaperInfo;

    iget-object p1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->L$2:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    iget-object v1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->L$1:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->L$0:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {p2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v10, p0

    move-object v8, p1

    move-object v6, v0

    move-object v7, v1

    goto :goto_1

    .line 2
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 3
    :cond_2
    invoke-static {p2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 4
    iget-object p2, p0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.service.wallpaper.WallpaperService"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    invoke-virtual {p2}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const/4 v5, 0x0

    .line 7
    invoke-virtual {v2, v4, v5}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    if-nez v2, :cond_3

    const/4 p0, 0x0

    return-object p0

    .line 8
    :cond_3
    invoke-virtual {p0}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v2

    const-string v4, "wallpaper.wallpaperId"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 10
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v5

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object p0

    iput-object v2, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->L$0:Ljava/lang/Object;

    iput-object v4, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->L$1:Ljava/lang/Object;

    iput-object v5, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->L$2:Ljava/lang/Object;

    iput-object p2, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->L$3:Ljava/lang/Object;

    iput v3, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->label:I

    invoke-static {p0, p1, v0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->obtainPlaceHolderColor(Lcom/android/wallpaper/asset/Asset;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_4

    return-object v1

    :cond_4
    move-object v10, p2

    move-object v6, v2

    move-object v7, v4

    move-object v8, v5

    move-object p2, p0

    .line 12
    :goto_1
    move-object v11, p2

    check-cast v11, Ljava/lang/Integer;

    const/4 v9, 0x0

    .line 13
    invoke-static/range {v6 .. v11}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->createRecentEntryJson(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Landroid/app/WallpaperInfo;Ljava/lang/Integer;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static final reorderRecentsOnly(Lorg/json/JSONArray;Ljava/lang/String;)Z
    .locals 7
    .param p0    # Lorg/json/JSONArray;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-lez v0, :cond_2

    move v3, v1

    :goto_0
    add-int/lit8 v4, v3, 0x1

    .line 2
    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "id"

    .line 3
    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_2

    :cond_0
    if-lt v4, v0, :cond_1

    goto :goto_1

    :cond_1
    move v3, v4

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    move-object v5, p1

    :goto_1
    move v3, v2

    :goto_2
    if-ne v3, v2, :cond_3

    return v1

    .line 4
    :cond_3
    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    .line 5
    invoke-virtual {p0, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const/4 p0, 0x1

    return p0
.end method

.method public static final saveFullBitmap(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lkotlinx/coroutines/Dispatchers;->INSTANCE:Lkotlinx/coroutines/Dispatchers;

    .line 2
    sget-object v0, Lkotlinx/coroutines/Dispatchers;->IO:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 3
    new-instance v1, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, p2, v2}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveFullBitmap$2;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    invoke-static {v0, v1, p3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    if-ne p0, p1, :cond_0

    return-object p0

    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public static final saveThumbnail(Landroid/content/Context;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 8
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/android/wallpaper/model/WallpaperInfo;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lkotlinx/coroutines/Dispatchers;->INSTANCE:Lkotlinx/coroutines/Dispatchers;

    .line 2
    sget-object v0, Lkotlinx/coroutines/Dispatchers;->IO:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 3
    new-instance v7, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;

    const/4 v6, 0x0

    move-object v1, v7

    move-object v2, p0

    move-object v3, p3

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v6}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$saveThumbnail$2;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Lkotlin/coroutines/Continuation;)V

    invoke-static {v0, v7, p4}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;

    if-ne p0, p1, :cond_0

    return-object p0

    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
