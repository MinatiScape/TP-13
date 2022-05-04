.class public Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;


# direct methods
.method public constructor <init>(Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;->this$0:Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const-string v0, "Error binding slice"

    const-string v1, "SliceLiveData"

    const/4 v2, 0x0

    .line 1
    :try_start_0
    iget-object v3, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;->this$0:Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    iget-object v4, v3, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mUri:Landroid/net/Uri;

    if-eqz v4, :cond_0

    iget-object v3, v3, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mSliceViewManager:Landroidx/slice/SliceViewManager;

    invoke-virtual {v3, v4}, Landroidx/slice/SliceViewManager;->bindSlice(Landroid/net/Uri;)Landroidx/slice/Slice;

    move-result-object v3

    goto :goto_0

    .line 2
    :cond_0
    iget-object v3, v3, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mSliceViewManager:Landroidx/slice/SliceViewManager;

    invoke-virtual {v3, v2}, Landroidx/slice/SliceViewManager;->bindSlice(Landroid/content/Intent;)Landroidx/slice/Slice;

    move-result-object v3

    .line 3
    :goto_0
    iget-object v4, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;->this$0:Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    iget-object v5, v4, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mUri:Landroid/net/Uri;

    if-nez v5, :cond_1

    if-eqz v3, :cond_1

    .line 4
    invoke-virtual {v3}, Landroidx/slice/Slice;->getUri()Landroid/net/Uri;

    move-result-object v5

    iput-object v5, v4, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mUri:Landroid/net/Uri;

    .line 5
    iget-object v4, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;->this$0:Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    iget-object v5, v4, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mSliceViewManager:Landroidx/slice/SliceViewManager;

    iget-object v6, v4, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mUri:Landroid/net/Uri;

    iget-object v4, v4, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mSliceCallback:Landroidx/slice/SliceViewManager$SliceCallback;

    invoke-virtual {v5, v6, v4}, Landroidx/slice/SliceViewManager;->registerSliceCallback(Landroid/net/Uri;Landroidx/slice/SliceViewManager$SliceCallback;)V

    .line 6
    :cond_1
    iget-object v4, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;->this$0:Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    .line 7
    invoke-virtual {v4, v3}, Landroidx/lifecycle/LiveData;->postValue(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v3

    .line 8
    iget-object v4, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;->this$0:Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    const/4 v5, 0x0

    .line 9
    iget-object v4, v4, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mListener:Landroidx/slice/widget/SliceLiveData$OnErrorListener;

    if-eqz v4, :cond_2

    .line 10
    invoke-interface {v4, v5, v3}, Landroidx/slice/widget/SliceLiveData$OnErrorListener;->onSliceError(ILjava/lang/Throwable;)V

    goto :goto_1

    .line 11
    :cond_2
    invoke-static {v1, v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 12
    :goto_1
    iget-object p0, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;->this$0:Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    .line 13
    invoke-virtual {p0, v2}, Landroidx/lifecycle/LiveData;->postValue(Ljava/lang/Object;)V

    goto :goto_3

    :catch_1
    move-exception v3

    .line 14
    iget-object v4, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;->this$0:Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    const/4 v5, 0x3

    .line 15
    iget-object v4, v4, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->mListener:Landroidx/slice/widget/SliceLiveData$OnErrorListener;

    if-eqz v4, :cond_3

    .line 16
    invoke-interface {v4, v5, v3}, Landroidx/slice/widget/SliceLiveData$OnErrorListener;->onSliceError(ILjava/lang/Throwable;)V

    goto :goto_2

    .line 17
    :cond_3
    invoke-static {v1, v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 18
    :goto_2
    iget-object p0, p0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl$1;->this$0:Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    .line 19
    invoke-virtual {p0, v2}, Landroidx/lifecycle/LiveData;->postValue(Ljava/lang/Object;)V

    :goto_3
    return-void
.end method
