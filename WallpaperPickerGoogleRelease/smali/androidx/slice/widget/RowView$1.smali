.class public Landroidx/slice/widget/RowView$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic this$0:Landroidx/slice/widget/RowView;

.field public final synthetic val$b:Landroid/widget/Button;


# direct methods
.method public constructor <init>(Landroidx/slice/widget/RowView;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$b"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/RowView$1;->this$0:Landroidx/slice/widget/RowView;

    iput-object p2, p0, Landroidx/slice/widget/RowView$1;->val$b:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object p1, p0, Landroidx/slice/widget/RowView$1;->this$0:Landroidx/slice/widget/RowView;

    iget-object v0, p1, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    if-eqz v0, :cond_0

    .line 2
    new-instance v0, Landroidx/slice/widget/EventInfo;

    invoke-virtual {p1}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result p1

    const/4 v1, 0x4

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/slice/widget/RowView$1;->this$0:Landroidx/slice/widget/RowView;

    iget v4, v3, Landroidx/slice/widget/RowView;->mRowIndex:I

    invoke-direct {v0, p1, v1, v2, v4}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    .line 3
    iget-object p1, v3, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    iget-object v1, v3, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 4
    iget-object v1, v1, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 5
    invoke-interface {p1, v0, v1}, Landroidx/slice/widget/SliceView$OnSliceActionListener;->onSliceAction(Landroidx/slice/widget/EventInfo;Landroidx/slice/SliceItem;)V

    .line 6
    :cond_0
    iget-object p1, p0, Landroidx/slice/widget/RowView$1;->this$0:Landroidx/slice/widget/RowView;

    iget-object v0, p1, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 7
    iget-object v0, v0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 8
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/slice/SliceItem;->fireActionInternal(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    iput-boolean v0, p1, Landroidx/slice/widget/RowView;->mShowActionSpinner:Z

    .line 9
    iget-object p1, p0, Landroidx/slice/widget/RowView$1;->this$0:Landroidx/slice/widget/RowView;

    iget-boolean v0, p1, Landroidx/slice/widget/RowView;->mShowActionSpinner:Z

    if-eqz v0, :cond_2

    .line 10
    iget-object v0, p1, Landroidx/slice/widget/SliceChildView;->mLoadingListener:Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;

    if-eqz v0, :cond_1

    .line 11
    iget-object v1, p1, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 12
    iget-object v1, v1, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 13
    iget p1, p1, Landroidx/slice/widget/RowView;->mRowIndex:I

    check-cast v0, Landroidx/slice/widget/SliceAdapter;

    invoke-virtual {v0, v1, p1}, Landroidx/slice/widget/SliceAdapter;->onSliceActionLoading(Landroidx/slice/SliceItem;I)V

    .line 14
    :cond_1
    iget-object p1, p0, Landroidx/slice/widget/RowView$1;->this$0:Landroidx/slice/widget/RowView;

    iget-object v0, p1, Landroidx/slice/widget/RowView;->mLoadingActions:Ljava/util/Set;

    iget-object p1, p1, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 15
    iget-object p1, p1, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 16
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 17
    iget-object p1, p0, Landroidx/slice/widget/RowView$1;->val$b:Landroid/widget/Button;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 18
    :cond_2
    iget-object p0, p0, Landroidx/slice/widget/RowView$1;->this$0:Landroidx/slice/widget/RowView;

    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->updateActionSpinner()V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "RowView"

    const-string v0, "PendingIntent for slice cannot be sent"

    .line 19
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method
