.class public final Lkotlinx/coroutines/internal/MainDispatcherLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nMainDispatchers.kt\nKotlin\n*S Kotlin\n*F\n+ 1 MainDispatchers.kt\nkotlinx/coroutines/internal/MainDispatcherLoader\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,114:1\n1658#2,14:115\n*E\n*S KotlinDebug\n*F\n+ 1 MainDispatchers.kt\nkotlinx/coroutines/internal/MainDispatcherLoader\n*L\n35#1,14:115\n*E\n"
.end annotation


# static fields
.field public static final FAST_SERVICE_LOADER_ENABLED:Z

.field public static final dispatcher:Lkotlinx/coroutines/MainCoroutineDispatcher;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 8

    const-string v0, "kotlinx.coroutines.fast.service.loader"

    .line 1
    invoke-static {v0}, Lkotlinx/coroutines/internal/SystemPropsKt;->systemProp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 2
    :goto_0
    sput-boolean v0, Lkotlinx/coroutines/internal/MainDispatcherLoader;->FAST_SERVICE_LOADER_ENABLED:Z

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 3
    :try_start_0
    const-class v0, Lkotlinx/coroutines/internal/MainDispatcherFactory;

    .line 4
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const-string v4, "clz.classLoader"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 5
    :try_start_1
    invoke-static {v0, v3}, Lkotlinx/coroutines/internal/FastServiceLoader;->loadProviders$kotlinx_coroutines_core(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/List;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 6
    :catchall_0
    :try_start_2
    invoke-static {v0, v3}, Ljava/util/ServiceLoader;->load(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/ServiceLoader;

    move-result-object v0

    const-string v3, "ServiceLoader.load(service, loader)"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0}, Lkotlin/collections/CollectionsKt___CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    goto :goto_1

    .line 7
    :cond_1
    invoke-static {}, Lkotlinx/coroutines/internal/MainDispatcherLoader$$ExternalSyntheticServiceLoad0;->m()Ljava/util/Iterator;

    move-result-object v0

    const-string v3, "ServiceLoader.load(\n    \u2026             ).iterator()"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0}, Lkotlin/sequences/SequencesKt___SequencesJvmKt;->asSequence(Ljava/util/Iterator;)Lkotlin/sequences/Sequence;

    move-result-object v0

    invoke-static {v0}, Lkotlin/sequences/SequencesKt;->toList(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v0

    .line 8
    :goto_1
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    move-object v4, v2

    goto :goto_2

    .line 10
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 11
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_2

    .line 12
    :cond_3
    move-object v5, v4

    check-cast v5, Lkotlinx/coroutines/internal/MainDispatcherFactory;

    .line 13
    invoke-interface {v5}, Lkotlinx/coroutines/internal/MainDispatcherFactory;->getLoadPriority()I

    move-result v5

    .line 14
    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 15
    move-object v7, v6

    check-cast v7, Lkotlinx/coroutines/internal/MainDispatcherFactory;

    .line 16
    invoke-interface {v7}, Lkotlinx/coroutines/internal/MainDispatcherFactory;->getLoadPriority()I

    move-result v7

    if-ge v5, v7, :cond_5

    move-object v4, v6

    move v5, v7

    .line 17
    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_4

    .line 18
    :goto_2
    check-cast v4, Lkotlinx/coroutines/internal/MainDispatcherFactory;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v4, :cond_6

    .line 19
    :try_start_3
    invoke-interface {v4, v0}, Lkotlinx/coroutines/internal/MainDispatcherFactory;->createDispatcher(Ljava/util/List;)Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v0

    .line 20
    :try_start_4
    new-instance v3, Lkotlinx/coroutines/internal/MissingMainCoroutineDispatcher;

    invoke-interface {v4}, Lkotlinx/coroutines/internal/MainDispatcherFactory;->hintOnError()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Lkotlinx/coroutines/internal/MissingMainCoroutineDispatcher;-><init>(Ljava/lang/Throwable;Ljava/lang/String;)V

    move-object v0, v3

    :goto_3
    if-eqz v0, :cond_6

    goto :goto_4

    .line 21
    :cond_6
    new-instance v0, Lkotlinx/coroutines/internal/MissingMainCoroutineDispatcher;

    invoke-direct {v0, v2, v2, v1}, Lkotlinx/coroutines/internal/MissingMainCoroutineDispatcher;-><init>(Ljava/lang/Throwable;Ljava/lang/String;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_4

    :catchall_2
    move-exception v0

    .line 22
    new-instance v3, Lkotlinx/coroutines/internal/MissingMainCoroutineDispatcher;

    invoke-direct {v3, v0, v2, v1}, Lkotlinx/coroutines/internal/MissingMainCoroutineDispatcher;-><init>(Ljava/lang/Throwable;Ljava/lang/String;I)V

    move-object v0, v3

    .line 23
    :goto_4
    sput-object v0, Lkotlinx/coroutines/internal/MainDispatcherLoader;->dispatcher:Lkotlinx/coroutines/MainCoroutineDispatcher;

    return-void
.end method
