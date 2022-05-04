.class public Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$2:Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1;

.field public final synthetic val$s:Landroidx/slice/Slice;


# direct methods
.method public constructor <init>(Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1;Landroidx/slice/Slice;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$2",
            "val$s"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1$1;->this$2:Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1;

    iput-object p2, p0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1$1;->val$s:Landroidx/slice/Slice;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1$1;->this$2:Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1;

    iget-object v0, v0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1;->this$1:Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;

    iget-object v0, v0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl;->mCallback:Landroidx/slice/SliceViewManager$SliceCallback;

    iget-object p0, p0, Landroidx/slice/SliceViewManagerBase$SliceListenerImpl$1$1;->val$s:Landroidx/slice/Slice;

    check-cast v0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    iget-object v0, v0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;

    sget v1, Landroidx/slice/widget/SliceLiveData$SliceLiveDataImpl;->$r8$clinit:I

    .line 2
    invoke-virtual {v0, p0}, Landroidx/lifecycle/LiveData;->postValue(Ljava/lang/Object;)V

    return-void
.end method
