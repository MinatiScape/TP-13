.class public abstract Landroidx/slice/SliceViewManagerBase;
.super Landroidx/slice/SliceViewManager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;
    }
.end annotation


# instance fields
.field public final mContext:Landroid/content/Context;

.field public final mListenerLookup:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/util/Pair<",
            "Landroid/net/Uri;",
            "Landroidx/slice/SliceViewManager$SliceCallback;",
            ">;",
            "Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/slice/SliceViewManager;-><init>()V

    .line 2
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroidx/slice/SliceViewManagerBase;->mListenerLookup:Landroid/util/ArrayMap;

    .line 3
    iput-object p1, p0, Landroidx/slice/SliceViewManagerBase;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public registerSliceCallback(Landroid/net/Uri;Landroidx/slice/SliceViewManager$SliceCallback;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "uri",
            "callback"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    new-instance v1, Landroidx/slice/SliceViewManagerBase$1;

    invoke-direct {v1, p0, v0}, Landroidx/slice/SliceViewManagerBase$1;-><init>(Landroidx/slice/SliceViewManagerBase;Landroid/os/Handler;)V

    .line 3
    new-instance v0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;

    invoke-direct {v0, p0, p1, v1, p2}, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;-><init>(Landroidx/slice/SliceViewManagerBase;Landroid/net/Uri;Ljava/util/concurrent/Executor;Landroidx/slice/SliceViewManager$SliceCallback;)V

    .line 4
    new-instance v1, Landroid/util/Pair;

    invoke-direct {v1, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 5
    iget-object p1, p0, Landroidx/slice/SliceViewManagerBase;->mListenerLookup:Landroid/util/ArrayMap;

    monitor-enter p1

    .line 6
    :try_start_0
    iget-object p2, p0, Landroidx/slice/SliceViewManagerBase;->mListenerLookup:Landroid/util/ArrayMap;

    invoke-virtual {p2, v1, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;

    if-eqz p2, :cond_0

    .line 7
    invoke-virtual {p2}, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;->stopListening()V

    .line 8
    :cond_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    iget-object p1, p0, Landroidx/slice/SliceViewManagerBase;->mContext:Landroid/content/Context;

    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object p2, v0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;->mUri:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 11
    invoke-virtual {p1}, Landroid/content/ContentProviderClient;->release()Z

    .line 12
    iget-object p1, p0, Landroidx/slice/SliceViewManagerBase;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object p2, v0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;->mUri:Landroid/net/Uri;

    iget-object v1, v0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;->mObserver:Landroid/database/ContentObserver;

    const/4 v2, 0x1

    invoke-virtual {p1, p2, v2, v1}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 13
    iget-boolean p1, v0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;->mPinned:Z

    if-nez p1, :cond_1

    .line 14
    :try_start_1
    iget-object p1, v0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;->mUri:Landroid/net/Uri;

    invoke-virtual {p0, p1}, Landroidx/slice/SliceViewManager;->pinSlice(Landroid/net/Uri;)V

    .line 15
    iput-boolean v2, v0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;->mPinned:Z
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_1
    return-void

    :catchall_0
    move-exception p0

    .line 16
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method
