.class public Lcom/bumptech/glide/RequestManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/manager/LifecycleListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/RequestManager$RequestManagerConnectivityListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/manager/LifecycleListener;"
    }
.end annotation


# static fields
.field public static final DECODE_TYPE_BITMAP:Lcom/bumptech/glide/request/RequestOptions;

.field public static final DOWNLOAD_ONLY_OPTIONS:Lcom/bumptech/glide/request/RequestOptions;


# instance fields
.field public final addSelfToLifecycle:Ljava/lang/Runnable;

.field public final connectivityMonitor:Lcom/bumptech/glide/manager/ConnectivityMonitor;

.field public final context:Landroid/content/Context;

.field public final defaultRequestListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/bumptech/glide/request/RequestListener<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public final glide:Lcom/bumptech/glide/Glide;

.field public final lifecycle:Lcom/bumptech/glide/manager/Lifecycle;

.field public final mainHandler:Landroid/os/Handler;

.field public requestOptions:Lcom/bumptech/glide/request/RequestOptions;

.field public final requestTracker:Lcom/bumptech/glide/manager/RequestTracker;

.field public final targetTracker:Lcom/bumptech/glide/manager/TargetTracker;

.field public final treeNode:Lcom/bumptech/glide/manager/RequestManagerTreeNode;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    const-class v0, Landroid/graphics/Bitmap;

    .line 2
    new-instance v1, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {v1}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    invoke-virtual {v1, v0}, Lcom/bumptech/glide/request/BaseRequestOptions;->decode(Ljava/lang/Class;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/RequestOptions;

    const/4 v1, 0x1

    .line 3
    iput-boolean v1, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->isLocked:Z

    .line 4
    sput-object v0, Lcom/bumptech/glide/RequestManager;->DECODE_TYPE_BITMAP:Lcom/bumptech/glide/request/RequestOptions;

    .line 5
    const-class v0, Lcom/bumptech/glide/load/resource/gif/GifDrawable;

    .line 6
    new-instance v2, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {v2}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    invoke-virtual {v2, v0}, Lcom/bumptech/glide/request/BaseRequestOptions;->decode(Ljava/lang/Class;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/RequestOptions;

    .line 7
    iput-boolean v1, v0, Lcom/bumptech/glide/request/BaseRequestOptions;->isLocked:Z

    .line 8
    sget-object v0, Lcom/bumptech/glide/load/engine/DiskCacheStrategy;->DATA:Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    .line 9
    invoke-static {v0}, Lcom/bumptech/glide/request/RequestOptions;->diskCacheStrategyOf(Lcom/bumptech/glide/load/engine/DiskCacheStrategy;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    sget-object v2, Lcom/bumptech/glide/Priority;->LOW:Lcom/bumptech/glide/Priority;

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/request/BaseRequestOptions;->priority(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/RequestOptions;

    .line 10
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/BaseRequestOptions;->skipMemoryCache(Z)Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/RequestOptions;

    sput-object v0, Lcom/bumptech/glide/RequestManager;->DOWNLOAD_ONLY_OPTIONS:Lcom/bumptech/glide/request/RequestOptions;

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/Glide;Lcom/bumptech/glide/manager/Lifecycle;Lcom/bumptech/glide/manager/RequestManagerTreeNode;Landroid/content/Context;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "glide",
            "lifecycle",
            "treeNode",
            "context"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/bumptech/glide/manager/RequestTracker;

    invoke-direct {v0}, Lcom/bumptech/glide/manager/RequestTracker;-><init>()V

    .line 2
    iget-object v1, p1, Lcom/bumptech/glide/Glide;->connectivityMonitorFactory:Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance v2, Lcom/bumptech/glide/manager/TargetTracker;

    invoke-direct {v2}, Lcom/bumptech/glide/manager/TargetTracker;-><init>()V

    iput-object v2, p0, Lcom/bumptech/glide/RequestManager;->targetTracker:Lcom/bumptech/glide/manager/TargetTracker;

    .line 5
    new-instance v2, Lcom/bumptech/glide/RequestManager$1;

    invoke-direct {v2, p0}, Lcom/bumptech/glide/RequestManager$1;-><init>(Lcom/bumptech/glide/RequestManager;)V

    iput-object v2, p0, Lcom/bumptech/glide/RequestManager;->addSelfToLifecycle:Ljava/lang/Runnable;

    .line 6
    new-instance v3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/bumptech/glide/RequestManager;->mainHandler:Landroid/os/Handler;

    .line 7
    iput-object p1, p0, Lcom/bumptech/glide/RequestManager;->glide:Lcom/bumptech/glide/Glide;

    .line 8
    iput-object p2, p0, Lcom/bumptech/glide/RequestManager;->lifecycle:Lcom/bumptech/glide/manager/Lifecycle;

    .line 9
    iput-object p3, p0, Lcom/bumptech/glide/RequestManager;->treeNode:Lcom/bumptech/glide/manager/RequestManagerTreeNode;

    .line 10
    iput-object v0, p0, Lcom/bumptech/glide/RequestManager;->requestTracker:Lcom/bumptech/glide/manager/RequestTracker;

    .line 11
    iput-object p4, p0, Lcom/bumptech/glide/RequestManager;->context:Landroid/content/Context;

    .line 12
    invoke-virtual {p4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    new-instance p4, Lcom/bumptech/glide/RequestManager$RequestManagerConnectivityListener;

    invoke-direct {p4, v0}, Lcom/bumptech/glide/RequestManager$RequestManagerConnectivityListener;-><init>(Lcom/bumptech/glide/manager/RequestTracker;)V

    .line 13
    check-cast v1, Lcom/bumptech/glide/manager/DefaultConnectivityMonitorFactory;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    .line 14
    invoke-static {p3, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x3

    const-string v4, "ConnectivityMonitor"

    .line 15
    invoke-static {v4, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_2

    if-eqz v0, :cond_1

    const-string v1, "ACCESS_NETWORK_STATE permission granted, registering connectivity monitor"

    goto :goto_1

    :cond_1
    const-string v1, "ACCESS_NETWORK_STATE permission missing, cannot register connectivity monitor"

    .line 16
    :goto_1
    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    if-eqz v0, :cond_3

    .line 17
    new-instance v0, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;

    invoke-direct {v0, p3, p4}, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;-><init>(Landroid/content/Context;Lcom/bumptech/glide/manager/ConnectivityMonitor$ConnectivityListener;)V

    goto :goto_2

    :cond_3
    new-instance v0, Lcom/bumptech/glide/manager/NullConnectivityMonitor;

    invoke-direct {v0}, Lcom/bumptech/glide/manager/NullConnectivityMonitor;-><init>()V

    .line 18
    :goto_2
    iput-object v0, p0, Lcom/bumptech/glide/RequestManager;->connectivityMonitor:Lcom/bumptech/glide/manager/ConnectivityMonitor;

    .line 19
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnBackgroundThread()Z

    move-result p3

    if-eqz p3, :cond_4

    .line 20
    invoke-virtual {v3, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_3

    .line 21
    :cond_4
    invoke-interface {p2, p0}, Lcom/bumptech/glide/manager/Lifecycle;->addListener(Lcom/bumptech/glide/manager/LifecycleListener;)V

    .line 22
    :goto_3
    invoke-interface {p2, v0}, Lcom/bumptech/glide/manager/Lifecycle;->addListener(Lcom/bumptech/glide/manager/LifecycleListener;)V

    .line 23
    new-instance p2, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 24
    iget-object p3, p1, Lcom/bumptech/glide/Glide;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 25
    iget-object p3, p3, Lcom/bumptech/glide/GlideContext;->defaultRequestListeners:Ljava/util/List;

    .line 26
    invoke-direct {p2, p3}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p2, p0, Lcom/bumptech/glide/RequestManager;->defaultRequestListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 27
    iget-object p2, p1, Lcom/bumptech/glide/Glide;->glideContext:Lcom/bumptech/glide/GlideContext;

    .line 28
    iget-object p2, p2, Lcom/bumptech/glide/GlideContext;->defaultRequestOptions:Lcom/bumptech/glide/request/RequestOptions;

    .line 29
    invoke-virtual {p2}, Lcom/bumptech/glide/request/BaseRequestOptions;->clone()Lcom/bumptech/glide/request/BaseRequestOptions;

    move-result-object p2

    check-cast p2, Lcom/bumptech/glide/request/RequestOptions;

    invoke-virtual {p2}, Lcom/bumptech/glide/request/BaseRequestOptions;->autoClone()Lcom/bumptech/glide/request/BaseRequestOptions;

    iput-object p2, p0, Lcom/bumptech/glide/RequestManager;->requestOptions:Lcom/bumptech/glide/request/RequestOptions;

    .line 30
    iget-object p2, p1, Lcom/bumptech/glide/Glide;->managers:Ljava/util/List;

    monitor-enter p2

    .line 31
    :try_start_0
    iget-object p3, p1, Lcom/bumptech/glide/Glide;->managers:Ljava/util/List;

    invoke-interface {p3, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_5

    .line 32
    iget-object p1, p1, Lcom/bumptech/glide/Glide;->managers:Ljava/util/List;

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    monitor-exit p2

    return-void

    .line 34
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot register already registered manager"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception p0

    .line 35
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public as(Ljava/lang/Class;)Lcom/bumptech/glide/RequestBuilder;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "resourceClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ResourceType:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TResourceType;>;)",
            "Lcom/bumptech/glide/RequestBuilder<",
            "TResourceType;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/bumptech/glide/RequestBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/RequestManager;->glide:Lcom/bumptech/glide/Glide;

    iget-object v2, p0, Lcom/bumptech/glide/RequestManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p0, p1, v2}, Lcom/bumptech/glide/RequestBuilder;-><init>(Lcom/bumptech/glide/Glide;Lcom/bumptech/glide/RequestManager;Ljava/lang/Class;Landroid/content/Context;)V

    return-object v0
.end method

.method public asBitmap()Lcom/bumptech/glide/RequestBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/RequestBuilder<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    const-class v0, Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestManager;->as(Ljava/lang/Class;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    sget-object v0, Lcom/bumptech/glide/RequestManager;->DECODE_TYPE_BITMAP:Lcom/bumptech/glide/request/RequestOptions;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    return-object p0
.end method

.method public asDrawable()Lcom/bumptech/glide/RequestBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/RequestBuilder<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 1
    const-class v0, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestManager;->as(Ljava/lang/Class;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    return-object p0
.end method

.method public clear(Lcom/bumptech/glide/request/target/Target;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/Target<",
            "*>;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnMainThread()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/RequestManager;->untrack(Lcom/bumptech/glide/request/target/Target;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/RequestManager;->glide:Lcom/bumptech/glide/Glide;

    .line 4
    iget-object v0, p0, Lcom/bumptech/glide/Glide;->managers:Ljava/util/List;

    monitor-enter v0

    .line 5
    :try_start_0
    iget-object p0, p0, Lcom/bumptech/glide/Glide;->managers:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/RequestManager;

    .line 6
    invoke-virtual {v1, p1}, Lcom/bumptech/glide/RequestManager;->untrack(Lcom/bumptech/glide/request/target/Target;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 p0, 0x1

    .line 7
    monitor-exit v0

    goto :goto_0

    .line 8
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p0, 0x0

    :goto_0
    if-nez p0, :cond_4

    .line 9
    invoke-interface {p1}, Lcom/bumptech/glide/request/target/Target;->getRequest()Lcom/bumptech/glide/request/Request;

    move-result-object p0

    if-eqz p0, :cond_4

    .line 10
    invoke-interface {p1}, Lcom/bumptech/glide/request/target/Target;->getRequest()Lcom/bumptech/glide/request/Request;

    move-result-object p0

    const/4 v0, 0x0

    .line 11
    invoke-interface {p1, v0}, Lcom/bumptech/glide/request/target/Target;->setRequest(Lcom/bumptech/glide/request/Request;)V

    .line 12
    invoke-interface {p0}, Lcom/bumptech/glide/request/Request;->clear()V

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 13
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    .line 14
    :cond_3
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->mainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/bumptech/glide/RequestManager$2;

    invoke-direct {v1, p0, p1}, Lcom/bumptech/glide/RequestManager$2;-><init>(Lcom/bumptech/glide/RequestManager;Lcom/bumptech/glide/request/target/Target;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_4
    :goto_1
    return-void
.end method

.method public onDestroy()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->targetTracker:Lcom/bumptech/glide/manager/TargetTracker;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/TargetTracker;->onDestroy()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->targetTracker:Lcom/bumptech/glide/manager/TargetTracker;

    .line 3
    iget-object v0, v0, Lcom/bumptech/glide/manager/TargetTracker;->targets:Ljava/util/Set;

    invoke-static {v0}, Lcom/bumptech/glide/util/Util;->getSnapshot(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    .line 4
    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/target/Target;

    .line 5
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/RequestManager;->clear(Lcom/bumptech/glide/request/target/Target;)V

    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->targetTracker:Lcom/bumptech/glide/manager/TargetTracker;

    .line 7
    iget-object v0, v0, Lcom/bumptech/glide/manager/TargetTracker;->targets:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 8
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->requestTracker:Lcom/bumptech/glide/manager/RequestTracker;

    .line 9
    iget-object v1, v0, Lcom/bumptech/glide/manager/RequestTracker;->requests:Ljava/util/Set;

    invoke-static {v1}, Lcom/bumptech/glide/util/Util;->getSnapshot(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/request/Request;

    const/4 v3, 0x0

    .line 10
    invoke-virtual {v0, v2, v3}, Lcom/bumptech/glide/manager/RequestTracker;->clearRemoveAndMaybeRecycle(Lcom/bumptech/glide/request/Request;Z)Z

    goto :goto_1

    .line 11
    :cond_1
    iget-object v0, v0, Lcom/bumptech/glide/manager/RequestTracker;->pendingRequests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 12
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->lifecycle:Lcom/bumptech/glide/manager/Lifecycle;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/manager/Lifecycle;->removeListener(Lcom/bumptech/glide/manager/LifecycleListener;)V

    .line 13
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->lifecycle:Lcom/bumptech/glide/manager/Lifecycle;

    iget-object v1, p0, Lcom/bumptech/glide/RequestManager;->connectivityMonitor:Lcom/bumptech/glide/manager/ConnectivityMonitor;

    invoke-interface {v0, v1}, Lcom/bumptech/glide/manager/Lifecycle;->removeListener(Lcom/bumptech/glide/manager/LifecycleListener;)V

    .line 14
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/bumptech/glide/RequestManager;->addSelfToLifecycle:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 15
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->glide:Lcom/bumptech/glide/Glide;

    .line 16
    iget-object v1, v0, Lcom/bumptech/glide/Glide;->managers:Ljava/util/List;

    monitor-enter v1

    .line 17
    :try_start_0
    iget-object v2, v0, Lcom/bumptech/glide/Glide;->managers:Ljava/util/List;

    invoke-interface {v2, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 18
    iget-object v0, v0, Lcom/bumptech/glide/Glide;->managers:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 19
    monitor-exit v1

    return-void

    .line 20
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot unregister not yet registered manager"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception p0

    .line 21
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public onStart()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->requestTracker:Lcom/bumptech/glide/manager/RequestTracker;

    const/4 v1, 0x0

    .line 3
    iput-boolean v1, v0, Lcom/bumptech/glide/manager/RequestTracker;->isPaused:Z

    .line 4
    iget-object v1, v0, Lcom/bumptech/glide/manager/RequestTracker;->requests:Ljava/util/Set;

    invoke-static {v1}, Lcom/bumptech/glide/util/Util;->getSnapshot(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/request/Request;

    .line 5
    invoke-interface {v2}, Lcom/bumptech/glide/request/Request;->isComplete()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v2}, Lcom/bumptech/glide/request/Request;->isRunning()Z

    move-result v3

    if-nez v3, :cond_0

    .line 6
    invoke-interface {v2}, Lcom/bumptech/glide/request/Request;->begin()V

    goto :goto_0

    .line 7
    :cond_1
    iget-object v0, v0, Lcom/bumptech/glide/manager/RequestTracker;->pendingRequests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 8
    iget-object p0, p0, Lcom/bumptech/glide/RequestManager;->targetTracker:Lcom/bumptech/glide/manager/TargetTracker;

    invoke-virtual {p0}, Lcom/bumptech/glide/manager/TargetTracker;->onStart()V

    return-void
.end method

.method public onStop()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager;->requestTracker:Lcom/bumptech/glide/manager/RequestTracker;

    const/4 v1, 0x1

    .line 3
    iput-boolean v1, v0, Lcom/bumptech/glide/manager/RequestTracker;->isPaused:Z

    .line 4
    iget-object v1, v0, Lcom/bumptech/glide/manager/RequestTracker;->requests:Ljava/util/Set;

    invoke-static {v1}, Lcom/bumptech/glide/util/Util;->getSnapshot(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/request/Request;

    .line 5
    invoke-interface {v2}, Lcom/bumptech/glide/request/Request;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 6
    invoke-interface {v2}, Lcom/bumptech/glide/request/Request;->clear()V

    .line 7
    iget-object v3, v0, Lcom/bumptech/glide/manager/RequestTracker;->pendingRequests:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 8
    :cond_1
    iget-object p0, p0, Lcom/bumptech/glide/RequestManager;->targetTracker:Lcom/bumptech/glide/manager/TargetTracker;

    invoke-virtual {p0}, Lcom/bumptech/glide/manager/TargetTracker;->onStop()V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/bumptech/glide/RequestManager;->requestTracker:Lcom/bumptech/glide/manager/RequestTracker;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object p0, p0, Lcom/bumptech/glide/RequestManager;->treeNode:Lcom/bumptech/glide/manager/RequestManagerTreeNode;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const/16 v2, 0x15

    invoke-static {v0, v2}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v3

    const-string v3, "{tracker="

    const-string v4, ", treeNode="

    invoke-static {v2, v0, v3, v1, v4}, Landroidx/recyclerview/R$attr$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-static {v0, p0, v1}, Landroid/support/v4/app/FragmentTabHost$SavedState$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public untrack(Lcom/bumptech/glide/request/target/Target;)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/Target<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Lcom/bumptech/glide/request/target/Target;->getRequest()Lcom/bumptech/glide/request/Request;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    .line 2
    :cond_0
    iget-object v2, p0, Lcom/bumptech/glide/RequestManager;->requestTracker:Lcom/bumptech/glide/manager/RequestTracker;

    .line 3
    invoke-virtual {v2, v0, v1}, Lcom/bumptech/glide/manager/RequestTracker;->clearRemoveAndMaybeRecycle(Lcom/bumptech/glide/request/Request;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4
    iget-object p0, p0, Lcom/bumptech/glide/RequestManager;->targetTracker:Lcom/bumptech/glide/manager/TargetTracker;

    .line 5
    iget-object p0, p0, Lcom/bumptech/glide/manager/TargetTracker;->targets:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const/4 p0, 0x0

    .line 6
    invoke-interface {p1, p0}, Lcom/bumptech/glide/request/target/Target;->setRequest(Lcom/bumptech/glide/request/Request;)V

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method
