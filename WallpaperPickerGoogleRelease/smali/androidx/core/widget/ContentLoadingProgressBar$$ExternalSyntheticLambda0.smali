.class public final synthetic Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Landroidx/core/widget/ContentLoadingProgressBar;


# direct methods
.method public synthetic constructor <init>(Landroidx/core/widget/ContentLoadingProgressBar;I)V
    .locals 1

    iput p2, p0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    const/4 v0, 0x2

    if-eq p2, v0, :cond_0

    const/4 v0, 0x3

    if-eq p2, v0, :cond_0

    const/4 v0, 0x4

    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;->f$0:Landroidx/core/widget/ContentLoadingProgressBar;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    iget v0, p0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v1, 0x1

    const-wide/16 v2, 0x1f4

    const/16 v4, 0x8

    const-wide/16 v5, -0x1

    const/4 v7, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    iget-object p0, p0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;->f$0:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-virtual {p0}, Landroidx/core/widget/ContentLoadingProgressBar;->show()V

    return-void

    :pswitch_1
    iget-object p0, p0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;->f$0:Landroidx/core/widget/ContentLoadingProgressBar;

    .line 1
    iput-boolean v1, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDismissed:Z

    .line 2
    iget-object v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 3
    iput-boolean v7, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mPostedShow:Z

    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iget-wide v9, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mStartTime:J

    sub-long/2addr v7, v9

    cmp-long v0, v7, v2

    if-gez v0, :cond_1

    cmp-long v0, v9, v5

    if-nez v0, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    iget-boolean v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mPostedHide:Z

    if-nez v0, :cond_2

    .line 6
    iget-object v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    sub-long/2addr v2, v7

    invoke-virtual {p0, v0, v2, v3}, Landroid/widget/ProgressBar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 7
    iput-boolean v1, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mPostedHide:Z

    goto :goto_1

    .line 8
    :cond_1
    :goto_0
    invoke-virtual {p0, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_2
    :goto_1
    return-void

    .line 9
    :pswitch_2
    iget-object p0, p0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;->f$0:Landroidx/core/widget/ContentLoadingProgressBar;

    .line 10
    iput-wide v5, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mStartTime:J

    .line 11
    iput-boolean v7, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDismissed:Z

    .line 12
    iget-object v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 13
    iput-boolean v7, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mPostedHide:Z

    .line 14
    iget-boolean v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mPostedShow:Z

    if-nez v0, :cond_3

    .line 15
    iget-object v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    invoke-virtual {p0, v0, v2, v3}, Landroid/widget/ProgressBar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 16
    iput-boolean v1, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mPostedShow:Z

    :cond_3
    return-void

    .line 17
    :pswitch_3
    iget-object p0, p0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;->f$0:Landroidx/core/widget/ContentLoadingProgressBar;

    .line 18
    iput-boolean v7, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mPostedShow:Z

    .line 19
    iget-boolean v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDismissed:Z

    if-nez v0, :cond_4

    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mStartTime:J

    .line 21
    invoke-virtual {p0, v7}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :cond_4
    return-void

    .line 22
    :pswitch_4
    iget-object p0, p0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;->f$0:Landroidx/core/widget/ContentLoadingProgressBar;

    .line 23
    iput-boolean v7, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mPostedHide:Z

    .line 24
    iput-wide v5, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mStartTime:J

    .line 25
    invoke-virtual {p0, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void

    .line 26
    :goto_2
    iget-object p0, p0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;->f$0:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-virtual {p0}, Landroidx/core/widget/ContentLoadingProgressBar;->hide()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
