.class public Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;
.super Landroidx/lifecycle/LiveData;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/widget/SliceLiveData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SliceLiveDataImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/lifecycle/LiveData<",
        "Landroidx/slice/Slice;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public final mListener:Landroidx/slice/widget/SliceLiveData$OnErrorListener;

.field public final mSliceCallback:Landroidx/slice/SliceViewManager$SliceCallback;

.field public final mSliceViewManager:Landroidx/slice/SliceViewManager;

.field public final mUpdateSlice:Ljava/lang/Runnable;

.field public mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroidx/slice/widget/SliceLiveData$OnErrorListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "uri",
            "listener"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/lifecycle/LiveData;-><init>()V

    .line 2
    new-instance p3, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;

    invoke-direct {p3, p0}, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;-><init>(Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;)V

    iput-object p3, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mUpdateSlice:Ljava/lang/Runnable;

    .line 3
    new-instance p3, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {p3, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;)V

    iput-object p3, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mSliceCallback:Landroidx/slice/SliceViewManager$SliceCallback;

    .line 4
    new-instance p3, Landroidx/slice/SliceViewManagerWrapper;

    invoke-direct {p3, p1}, Landroidx/slice/SliceViewManagerWrapper;-><init>(Landroid/content/Context;)V

    .line 5
    iput-object p3, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mSliceViewManager:Landroidx/slice/SliceViewManager;

    .line 6
    iput-object p2, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mUri:Landroid/net/Uri;

    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mListener:Landroidx/slice/widget/SliceLiveData$OnErrorListener;

    return-void
.end method


# virtual methods
.method public onActive()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mUpdateSlice:Ljava/lang/Runnable;

    invoke-static {v0}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    .line 2
    iget-object v0, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    .line 3
    iget-object v1, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mSliceViewManager:Landroidx/slice/SliceViewManager;

    iget-object p0, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mSliceCallback:Landroidx/slice/SliceViewManager$SliceCallback;

    invoke-virtual {v1, v0, p0}, Landroidx/slice/SliceViewManager;->registerSliceCallback(Landroid/net/Uri;Landroidx/slice/SliceViewManager$SliceCallback;)V

    :cond_0
    return-void
.end method

.method public onInactive()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_1

    .line 2
    iget-object v1, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mSliceViewManager:Landroidx/slice/SliceViewManager;

    iget-object p0, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mSliceCallback:Landroidx/slice/SliceViewManager$SliceCallback;

    check-cast v1, Landroidx/slice/SliceViewManagerBase;

    .line 3
    iget-object v2, v1, Landroidx/slice/SliceViewManagerBase;->mListenerLookup:Landroid/util/ArrayMap;

    monitor-enter v2

    .line 4
    :try_start_0
    iget-object v1, v1, Landroidx/slice/SliceViewManagerBase;->mListenerLookup:Landroid/util/ArrayMap;

    new-instance v3, Landroid/util/Pair;

    invoke-direct {v3, v0, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;

    if-eqz p0, :cond_0

    .line 5
    invoke-virtual {p0}, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;->stopListening()V

    .line 6
    :cond_0
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    return-void
.end method
