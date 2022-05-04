.class public Landroidx/core/provider/FontRequestWorker;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/provider/FontRequestWorker$TypefaceResult;
    }
.end annotation


# static fields
.field public static final DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;

.field public static final LOCK:Ljava/lang/Object;

.field public static final PENDING_REPLIES:Landroidx/collection/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Landroidx/core/util/Consumer<",
            "Landroidx/core/provider/FontRequestWorker$TypefaceResult;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public static final sTypefaceCache:Landroidx/collection/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Landroidx/collection/LruCache;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Landroidx/collection/LruCache;-><init>(I)V

    sput-object v0, Landroidx/core/provider/FontRequestWorker;->sTypefaceCache:Landroidx/collection/LruCache;

    .line 2
    new-instance v9, Landroidx/core/provider/RequestExecutor$DefaultThreadFactory;

    const-string v0, "fonts-androidx"

    const/16 v1, 0xa

    invoke-direct {v9, v0, v1}, Landroidx/core/provider/RequestExecutor$DefaultThreadFactory;-><init>(Ljava/lang/String;I)V

    .line 3
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const/16 v1, 0x2710

    int-to-long v5, v1

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x1

    move-object v2, v0

    invoke-direct/range {v2 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 5
    sput-object v0, Landroidx/core/provider/FontRequestWorker;->DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;

    .line 6
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/core/provider/FontRequestWorker;->LOCK:Ljava/lang/Object;

    .line 7
    new-instance v0, Landroidx/collection/SimpleArrayMap;

    invoke-direct {v0}, Landroidx/collection/SimpleArrayMap;-><init>()V

    sput-object v0, Landroidx/core/provider/FontRequestWorker;->PENDING_REPLIES:Landroidx/collection/SimpleArrayMap;

    return-void
.end method

.method public static getFontSync(Ljava/lang/String;Landroid/content/Context;Landroidx/core/provider/FontRequest;I)Landroidx/core/provider/FontRequestWorker$TypefaceResult;
    .locals 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10,
            0x10,
            0x0
        }
        names = {
            "cacheId",
            "context",
            "request",
            "style"
        }
    .end annotation

    .line 1
    sget-object v0, Landroidx/core/provider/FontRequestWorker;->sTypefaceCache:Landroidx/collection/LruCache;

    invoke-virtual {v0, p0}, Landroidx/collection/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Typeface;

    if-eqz v0, :cond_0

    .line 2
    new-instance p0, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    invoke-direct {p0, v0}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(Landroid/graphics/Typeface;)V

    return-object p0

    .line 3
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 4
    invoke-static {v0, p2, v1}, Landroidx/core/provider/FontProvider;->getProvider(Landroid/content/pm/PackageManager;Landroidx/core/provider/FontRequest;Landroid/content/res/Resources;)Landroid/content/pm/ProviderInfo;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_1

    .line 5
    new-instance p2, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;

    invoke-direct {p2, v3, v2}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;-><init>(I[Landroidx/core/provider/FontsContractCompat$FontInfo;)V

    goto :goto_0

    .line 6
    :cond_1
    iget-object v0, v0, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    invoke-static {p1, p2, v0, v2}, Landroidx/core/provider/FontProvider;->query(Landroid/content/Context;Landroidx/core/provider/FontRequest;Ljava/lang/String;Landroid/os/CancellationSignal;)[Landroidx/core/provider/FontsContractCompat$FontInfo;

    move-result-object p2

    .line 7
    new-instance v0, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;

    invoke-direct {v0, v1, p2}, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;-><init>(I[Landroidx/core/provider/FontsContractCompat$FontInfo;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    move-object p2, v0

    .line 8
    :goto_0
    iget v0, p2, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->mStatusCode:I

    const/4 v4, -0x3

    if-eqz v0, :cond_3

    if-eq v0, v3, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, -0x2

    goto :goto_4

    .line 9
    :cond_3
    iget-object v0, p2, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->mFonts:[Landroidx/core/provider/FontsContractCompat$FontInfo;

    if-eqz v0, :cond_8

    .line 10
    array-length v5, v0

    if-nez v5, :cond_4

    goto :goto_3

    .line 11
    :cond_4
    array-length v5, v0

    move v6, v1

    :goto_1
    if-ge v6, v5, :cond_7

    aget-object v7, v0, v6

    .line 12
    iget v7, v7, Landroidx/core/provider/FontsContractCompat$FontInfo;->mResultCode:I

    if-eqz v7, :cond_6

    if-gez v7, :cond_5

    :goto_2
    move v0, v4

    goto :goto_4

    :cond_5
    move v0, v7

    goto :goto_4

    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_7
    move v0, v1

    goto :goto_4

    :cond_8
    :goto_3
    move v0, v3

    :goto_4
    if-eqz v0, :cond_9

    .line 13
    new-instance p0, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    invoke-direct {p0, v0}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(I)V

    return-object p0

    .line 14
    :cond_9
    iget-object p2, p2, Landroidx/core/provider/FontsContractCompat$FontFamilyResult;->mFonts:[Landroidx/core/provider/FontsContractCompat$FontInfo;

    .line 15
    sget-object v0, Landroidx/core/graphics/TypefaceCompat;->sTypefaceCompatImpl:Landroidx/core/graphics/TypefaceCompatBaseImpl;

    check-cast v0, Landroidx/core/graphics/TypefaceCompatApi29Impl;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    .line 17
    :try_start_1
    array-length v0, p2

    move v5, v1

    move-object v6, v2

    :goto_5
    if-ge v5, v0, :cond_e

    aget-object v7, p2, v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 18
    :try_start_2
    iget-object v8, v7, Landroidx/core/provider/FontsContractCompat$FontInfo;->mUri:Landroid/net/Uri;

    const-string v9, "r"

    .line 19
    invoke-virtual {p1, v8, v9, v2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/os/ParcelFileDescriptor;

    move-result-object v8
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    if-nez v8, :cond_a

    if-eqz v8, :cond_d

    goto :goto_7

    .line 20
    :cond_a
    :try_start_3
    new-instance v9, Landroid/graphics/fonts/Font$Builder;

    invoke-direct {v9, v8}, Landroid/graphics/fonts/Font$Builder;-><init>(Landroid/os/ParcelFileDescriptor;)V

    .line 21
    iget v10, v7, Landroidx/core/provider/FontsContractCompat$FontInfo;->mWeight:I

    .line 22
    invoke-virtual {v9, v10}, Landroid/graphics/fonts/Font$Builder;->setWeight(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v9

    .line 23
    iget-boolean v10, v7, Landroidx/core/provider/FontsContractCompat$FontInfo;->mItalic:Z

    if-eqz v10, :cond_b

    move v10, v3

    goto :goto_6

    :cond_b
    move v10, v1

    .line 24
    :goto_6
    invoke-virtual {v9, v10}, Landroid/graphics/fonts/Font$Builder;->setSlant(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v9

    .line 25
    iget v7, v7, Landroidx/core/provider/FontsContractCompat$FontInfo;->mTtcIndex:I

    .line 26
    invoke-virtual {v9, v7}, Landroid/graphics/fonts/Font$Builder;->setTtcIndex(I)Landroid/graphics/fonts/Font$Builder;

    move-result-object v7

    .line 27
    invoke-virtual {v7}, Landroid/graphics/fonts/Font$Builder;->build()Landroid/graphics/fonts/Font;

    move-result-object v7

    if-nez v6, :cond_c

    .line 28
    new-instance v9, Landroid/graphics/fonts/FontFamily$Builder;

    invoke-direct {v9, v7}, Landroid/graphics/fonts/FontFamily$Builder;-><init>(Landroid/graphics/fonts/Font;)V

    move-object v6, v9

    goto :goto_7

    .line 29
    :cond_c
    invoke-virtual {v6, v7}, Landroid/graphics/fonts/FontFamily$Builder;->addFont(Landroid/graphics/fonts/Font;)Landroid/graphics/fonts/FontFamily$Builder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 30
    :goto_7
    :try_start_4
    invoke-virtual {v8}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_9

    :catchall_0
    move-exception v7

    .line 31
    :try_start_5
    invoke-virtual {v8}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_8

    :catchall_1
    move-exception v8

    :try_start_6
    invoke-virtual {v7, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_8
    throw v7
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    :catch_0
    :cond_d
    :goto_9
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    :cond_e
    if-nez v6, :cond_f

    goto :goto_b

    .line 32
    :cond_f
    :try_start_7
    new-instance p1, Landroid/graphics/fonts/FontStyle;

    and-int/lit8 p2, p3, 0x1

    if-eqz p2, :cond_10

    const/16 p2, 0x2bc

    goto :goto_a

    :cond_10
    const/16 p2, 0x190

    :goto_a
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_11

    move v1, v3

    .line 33
    :cond_11
    invoke-direct {p1, p2, v1}, Landroid/graphics/fonts/FontStyle;-><init>(II)V

    .line 34
    new-instance p2, Landroid/graphics/Typeface$CustomFallbackBuilder;

    invoke-virtual {v6}, Landroid/graphics/fonts/FontFamily$Builder;->build()Landroid/graphics/fonts/FontFamily;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/graphics/Typeface$CustomFallbackBuilder;-><init>(Landroid/graphics/fonts/FontFamily;)V

    .line 35
    invoke-virtual {p2, p1}, Landroid/graphics/Typeface$CustomFallbackBuilder;->setStyle(Landroid/graphics/fonts/FontStyle;)Landroid/graphics/Typeface$CustomFallbackBuilder;

    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/graphics/Typeface$CustomFallbackBuilder;->build()Landroid/graphics/Typeface;

    move-result-object v2
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    :catch_1
    :goto_b
    if-eqz v2, :cond_12

    .line 37
    sget-object p1, Landroidx/core/provider/FontRequestWorker;->sTypefaceCache:Landroidx/collection/LruCache;

    invoke-virtual {p1, p0, v2}, Landroidx/collection/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    new-instance p0, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    invoke-direct {p0, v2}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(Landroid/graphics/Typeface;)V

    return-object p0

    .line 39
    :cond_12
    new-instance p0, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    invoke-direct {p0, v4}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(I)V

    return-object p0

    .line 40
    :catch_2
    new-instance p0, Landroidx/core/provider/FontRequestWorker$TypefaceResult;

    const/4 p1, -0x1

    invoke-direct {p0, p1}, Landroidx/core/provider/FontRequestWorker$TypefaceResult;-><init>(I)V

    return-object p0
.end method
