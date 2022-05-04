.class public Landroidx/core/widget/ContentLoadingProgressBar;
.super Landroid/widget/ProgressBar;
.source "SourceFile"


# instance fields
.field public final mDelayedHide:Ljava/lang/Runnable;

.field public final mDelayedShow:Ljava/lang/Runnable;

.field public mDismissed:Z

.field public mPostedHide:Z

.field public mPostedShow:Z

.field public mStartTime:J


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

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/core/widget/ContentLoadingProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs"
        }
    .end annotation

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, -0x1

    .line 3
    iput-wide p1, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mStartTime:J

    .line 4
    iput-boolean v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mPostedHide:Z

    .line 5
    iput-boolean v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mPostedShow:Z

    .line 6
    iput-boolean v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDismissed:Z

    .line 7
    new-instance p1, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0, v0}, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;-><init>(Landroidx/core/widget/ContentLoadingProgressBar;I)V

    iput-object p1, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    .line 8
    new-instance p1, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;-><init>(Landroidx/core/widget/ContentLoadingProgressBar;I)V

    iput-object p1, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public hide()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;-><init>(Landroidx/core/widget/ContentLoadingProgressBar;I)V

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/ProgressBar;->onAttachedToWindow()V

    .line 2
    iget-object v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 3
    iget-object v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/ProgressBar;->onDetachedFromWindow()V

    .line 2
    iget-object v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 3
    iget-object v0, p0, Landroidx/core/widget/ContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Landroidx/core/widget/ContentLoadingProgressBar$$ExternalSyntheticLambda0;-><init>(Landroidx/core/widget/ContentLoadingProgressBar;I)V

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
