.class public Landroidx/slice/widget/RowView$DateSetListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/widget/RowView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DateSetListener"
.end annotation


# instance fields
.field public final mActionItem:Landroidx/slice/SliceItem;

.field public final mRowIndex:I

.field public final synthetic this$0:Landroidx/slice/widget/RowView;


# direct methods
.method public constructor <init>(Landroidx/slice/widget/RowView;Landroidx/slice/SliceItem;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            "this$0",
            "datePickerItem",
            "mRowIndex"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/RowView$DateSetListener;->this$0:Landroidx/slice/widget/RowView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Landroidx/slice/widget/RowView$DateSetListener;->mActionItem:Landroidx/slice/SliceItem;

    .line 3
    iput p3, p0, Landroidx/slice/widget/RowView$DateSetListener;->mRowIndex:I

    return-void
.end method


# virtual methods
.method public onDateSet(Landroid/widget/DatePicker;III)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "datePicker",
            "year",
            "month",
            "day"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p1

    .line 2
    invoke-virtual {p1, p2, p3, p4}, Ljava/util/Calendar;->set(III)V

    .line 3
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    .line 4
    iget-object p2, p0, Landroidx/slice/widget/RowView$DateSetListener;->mActionItem:Landroidx/slice/SliceItem;

    if-eqz p2, :cond_0

    .line 5
    :try_start_0
    iget-object p3, p0, Landroidx/slice/widget/RowView$DateSetListener;->this$0:Landroidx/slice/widget/RowView;

    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    new-instance p4, Landroid/content/Intent;

    invoke-direct {p4}, Landroid/content/Intent;-><init>()V

    const/high16 v0, 0x10000000

    .line 6
    invoke-virtual {p4, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object p4

    const-string v0, "android.app.slice.extra.RANGE_VALUE"

    .line 7
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {p4, v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1

    .line 8
    invoke-virtual {p2, p3, p1}, Landroidx/slice/SliceItem;->fireActionInternal(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 9
    iget-object p1, p0, Landroidx/slice/widget/RowView$DateSetListener;->this$0:Landroidx/slice/widget/RowView;

    iget-object p2, p1, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    if-eqz p2, :cond_0

    .line 10
    new-instance p2, Landroidx/slice/widget/EventInfo;

    invoke-virtual {p1}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result p1

    const/4 p3, 0x6

    const/4 p4, 0x7

    iget v0, p0, Landroidx/slice/widget/RowView$DateSetListener;->mRowIndex:I

    invoke-direct {p2, p1, p3, p4, v0}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    .line 11
    iget-object p1, p0, Landroidx/slice/widget/RowView$DateSetListener;->this$0:Landroidx/slice/widget/RowView;

    iget-object p1, p1, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    iget-object p0, p0, Landroidx/slice/widget/RowView$DateSetListener;->mActionItem:Landroidx/slice/SliceItem;

    invoke-interface {p1, p2, p0}, Landroidx/slice/widget/SliceView$OnSliceActionListener;->onSliceAction(Landroidx/slice/widget/EventInfo;Landroidx/slice/SliceItem;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "RowView"

    const-string p2, "PendingIntent for slice cannot be sent"

    .line 12
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method
