.class public final Lcom/google/android/apps/wallpaper/provider/RecentWallpapersProvider;
.super Landroid/content/ContentProvider;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRecentWallpapersProvider.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RecentWallpapersProvider.kt\ncom/google/android/apps/wallpaper/provider/RecentWallpapersProvider\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,201:1\n1#2:202\n*E\n"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string p0, "uri"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "selection"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "selectionArgs"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public final getRecentWallpapers()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p0

    const-string v0, "null cannot be cast to non-null type com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences"

    invoke-static {p0, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    check-cast p0, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

    .line 2
    invoke-interface {p0}, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;->getRecentWallpapers()Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->parseRecentWallpapers(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v0

    .line 3
    move-object v1, v0

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 4
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x5

    if-ge v1, v3, :cond_0

    .line 5
    invoke-interface {p0}, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;->getDefaultRecentWallpapers()Lorg/json/JSONArray;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->parseRecentWallpapers(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 6
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 7
    :cond_0
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 8
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    sub-int/2addr p0, v3

    const/4 v0, 0x0

    if-gez p0, :cond_1

    move p0, v0

    :cond_1
    invoke-static {v2, p0}, Lkotlin/collections/CollectionsKt___CollectionsKt;->drop(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt___CollectionsKt;->reversed(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-string p0, "uri"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "vnd.android.cursor.dir/recent_wallpapers"

    return-object p0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/ContentValues;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    const-string p0, "uri"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "initialValues"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p0

    if-nez p0, :cond_0

    .line 2
    new-instance p0, Lcom/android/wallpaper/module/WallpapersInjector;

    invoke-direct {p0}, Lcom/android/wallpaper/module/WallpapersInjector;-><init>()V

    .line 3
    sput-object p0, Lcom/android/wallpaper/module/InjectorProvider;->sInjector:Lcom/android/wallpaper/module/Injector;

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public openFile(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    .locals 1
    .param p1    # Landroid/net/Uri;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    const-string p2, "uri"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object p1

    .line 2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    const/4 v0, 0x2

    if-lt p2, v0, :cond_1

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    const-string v0, "thumb"

    invoke-static {v0, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    .line 3
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "wallpaperId"

    .line 5
    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->getWallpaperThumbnailFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 6
    :try_start_0
    new-instance p2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    invoke-direct {p2, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/high16 p0, 0x10000000

    invoke-static {p2, p0}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 7
    new-instance p1, Ljava/io/FileNotFoundException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 8
    :cond_0
    new-instance p0, Ljava/io/FileNotFoundException;

    const-string p1, "Invalid wallpaper id"

    invoke-direct {p0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 9
    :cond_1
    new-instance p0, Ljava/io/FileNotFoundException;

    const-string p1, "Invalid thumb url"

    invoke-direct {p0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 5
    .param p1    # Landroid/net/Uri;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    const-string p2, "uri"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    const-string p2, "/list_recent"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_0
    new-instance p1, Landroid/database/MatrixCursor;

    const-string p2, "id"

    const-string p3, "placeholder_color"

    const-string p4, "component"

    const-string p5, "title"

    filled-new-array {p2, p3, p4, p5}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/apps/wallpaper/provider/RecentWallpapersProvider;->getRecentWallpapers()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;

    .line 4
    iget-object v1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->attributions:Ljava/util/List;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 5
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 6
    iget-object v1, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->attributions:Ljava/util/List;

    .line 7
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_1

    :cond_1
    const-string v1, ""

    .line 8
    :goto_1
    invoke-virtual {p1}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object v3

    .line 9
    iget-object v4, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->id:Ljava/lang/String;

    .line 10
    invoke-virtual {v3, p2, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    move-result-object v3

    .line 11
    iget-object v4, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->component:Ljava/lang/String;

    .line 12
    invoke-virtual {v3, p4, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    move-result-object v3

    .line 13
    invoke-virtual {v3, p5, v1}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    move-result-object v1

    .line 14
    iget-object v0, v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->placeHolderColor:Ljava/lang/Integer;

    if-nez v0, :cond_2

    goto :goto_2

    .line 15
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    :goto_2
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 16
    invoke-virtual {v1, p3, v0}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    goto :goto_0

    :cond_3
    return-object p1
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 18
    .param p1    # Landroid/net/Uri;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/ContentValues;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    move-object/from16 v0, p2

    const-string v1, "uri"

    move-object/from16 v2, p1

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "values"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/set_recent_wallpaper"

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    :cond_0
    const-string v1, "id"

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v3

    .line 4
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object v4

    const-string v5, "null cannot be cast to non-null type com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences"

    invoke-static {v4, v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    check-cast v4, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;

    .line 5
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/apps/wallpaper/provider/RecentWallpapersProvider;->getRecentWallpapers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;

    .line 6
    iget-object v8, v8, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->id:Ljava/lang/String;

    .line 7
    invoke-static {v8, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    goto :goto_0

    :cond_2
    move-object v6, v7

    :goto_0
    check-cast v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;

    if-nez v6, :cond_3

    return v2

    .line 8
    :cond_3
    invoke-virtual/range {p0 .. p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-interface {v3, v5}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v5

    .line 9
    invoke-virtual/range {p0 .. p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-interface {v3, v8}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object v3

    .line 10
    iget-object v8, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->component:Ljava/lang/String;

    const/4 v9, 0x1

    const-string v10, "RecentWallpapersProvider"

    if-nez v8, :cond_5

    .line 11
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->getWallpaperFullBitmapFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 13
    move-object v11, v3

    check-cast v11, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    invoke-virtual {v11}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->getDefaultWhichWallpaper()I

    move-result v1

    .line 14
    invoke-virtual {v11, v0, v2, v1}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setBitmapToWallpaperManagerCompat(Landroid/graphics/Bitmap;ZI)I

    move-result v17

    .line 15
    iget-object v12, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->attributions:Ljava/util/List;

    .line 16
    iget-object v13, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->actionUrl:Ljava/lang/String;

    .line 17
    sget-object v0, Lcom/android/wallpaper/model/WallpaperInfo;->sExecutor:Ljava/util/concurrent/ExecutorService;

    const v14, 0x7f110080

    const v15, 0x7f0800ac

    .line 18
    iget-object v0, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->collectionId:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 19
    invoke-virtual/range {v11 .. v17}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->saveStaticWallpaperMetadata(Ljava/util/List;Ljava/lang/String;IILjava/lang/String;I)Z

    .line 20
    iget-object v0, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->collectionId:Ljava/lang/String;

    .line 21
    invoke-virtual/range {p0 .. p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f11009e

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_1

    .line 22
    :cond_4
    iget-object v7, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->id:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "Exception setting wallpaper from recent provider"

    .line 23
    invoke-static {v10, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2

    :catch_1
    move-exception v0

    const-string v1, "File not found exception setting wallpaper from recent provider"

    .line 24
    invoke-static {v10, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v2

    :cond_5
    const-string v0, "/"

    .line 25
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {v8, v0, v2, v2, v1}, Lkotlin/text/StringsKt__StringsKt;->split$default(Ljava/lang/CharSequence;[Ljava/lang/String;ZII)Ljava/util/List;

    move-result-object v0

    .line 26
    invoke-virtual/range {p0 .. p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 27
    iget-object v7, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->collectionId:Ljava/lang/String;

    .line 28
    iget-object v8, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->id:Ljava/lang/String;

    .line 29
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 30
    invoke-static {v1, v7, v8, v11, v0}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->fromPackageAndServiceName(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/wallpaper/model/LiveWallpaperInfo;

    move-result-object v0

    if-nez v0, :cond_6

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Couldn\'t find specified live wallpaper: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ".service"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v10, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 32
    :cond_6
    invoke-virtual/range {p0 .. p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v1

    .line 33
    iget-object v2, v0, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    .line 34
    invoke-virtual {v2}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/WallpaperManager;->setWallpaperComponent(Landroid/content/ComponentName;)Z

    const/high16 v2, 0x3f000000    # 0.5f

    const/4 v7, 0x0

    .line 35
    invoke-virtual {v1, v2, v7}, Landroid/app/WallpaperManager;->setWallpaperOffsetSteps(FF)V

    .line 36
    check-cast v3, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    invoke-virtual {v3}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->getDefaultWhichWallpaper()I

    move-result v2

    const/4 v3, 0x2

    and-int/2addr v2, v3

    if-nez v2, :cond_7

    .line 37
    invoke-virtual {v1, v3}, Landroid/app/WallpaperManager;->clear(I)V

    .line 38
    :cond_7
    invoke-virtual {v0}, Lcom/android/wallpaper/model/LiveWallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v7

    .line 39
    :goto_1
    iget-object v0, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->id:Ljava/lang/String;

    .line 40
    invoke-interface {v4, v0}, Lcom/google/android/apps/wallpaper/module/GoogleWallpaperPreferences;->updateLastWallpaper(Ljava/lang/String;)V

    .line 41
    iget-object v0, v6, Lcom/google/android/apps/wallpaper/module/RecentWallpaperEntry;->collectionId:Ljava/lang/String;

    .line 42
    invoke-interface {v5, v0, v7}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSet(Ljava/lang/String;Ljava/lang/String;)V

    return v9
.end method
