.class public Landroidx/slice/widget/SliceView;
.super Landroid/view/ViewGroup;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/Observer;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/SliceView$OnSliceActionListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/view/ViewGroup;",
        "Landroidx/lifecycle/Observer<",
        "Landroidx/slice/Slice;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# static fields
.field public static final SLICE_ACTION_PRIORITY_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroidx/slice/core/SliceAction;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mActionRow:Landroidx/slice/widget/ActionRow;

.field public mActionRowHeight:I

.field public mActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/slice/core/SliceAction;",
            ">;"
        }
    .end annotation
.end field

.field public mCurrentSlice:Landroidx/slice/Slice;

.field public mCurrentSliceLoggedVisible:Z

.field public mCurrentSliceMetrics:Landroidx/slice/widget/SliceMetrics;

.field public mCurrentView:Landroidx/slice/widget/SliceChildView;

.field public mDownX:I

.field public mDownY:I

.field public mHandler:Landroid/os/Handler;

.field public mInLongpress:Z

.field public mLargeHeight:I

.field public mListContent:Landroidx/slice/widget/ListContent;

.field public mLongClickListener:Landroid/view/View$OnLongClickListener;

.field public mLongpressCheck:Ljava/lang/Runnable;

.field public mMinTemplateHeight:I

.field public mOnClickListener:Landroid/view/View$OnClickListener;

.field public mPressing:Z

.field public mRefreshLastUpdated:Ljava/lang/Runnable;

.field public mShortcutSize:I

.field public mShowActionDividers:Z

.field public mShowHeaderDivider:Z

.field public mShowLastUpdated:Z

.field public mShowTitleItems:Z

.field public mSliceMetadata:Landroidx/slice/SliceMetadata;

.field public mSliceStyle:Landroidx/slice/widget/SliceStyle;

.field public mThemeTintColor:I

.field public mTouchSlopSquared:I

.field public mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroidx/slice/widget/SliceView$3;

    invoke-direct {v0}, Landroidx/slice/widget/SliceView$3;-><init>()V

    sput-object v0, Landroidx/slice/widget/SliceView;->SLICE_ACTION_PRIORITY_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

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
    invoke-direct {p0, p1, v0}, Landroidx/slice/widget/SliceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    const v0, 0x7f04032a

    .line 2
    invoke-direct {p0, p1, p2, v0}, Landroidx/slice/widget/SliceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs",
            "defStyleAttr"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowLastUpdated:Z

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mCurrentSliceLoggedVisible:Z

    .line 6
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowTitleItems:Z

    .line 7
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowHeaderDivider:Z

    .line 8
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowActionDividers:Z

    const/4 v0, -0x1

    .line 9
    iput v0, p0, Landroidx/slice/widget/SliceView;->mThemeTintColor:I

    .line 10
    new-instance v0, Landroidx/slice/widget/SliceView$1;

    invoke-direct {v0, p0}, Landroidx/slice/widget/SliceView$1;-><init>(Landroidx/slice/widget/SliceView;)V

    iput-object v0, p0, Landroidx/slice/widget/SliceView;->mLongpressCheck:Ljava/lang/Runnable;

    .line 11
    new-instance v0, Landroidx/slice/widget/SliceView$2;

    invoke-direct {v0, p0}, Landroidx/slice/widget/SliceView$2;-><init>(Landroidx/slice/widget/SliceView;)V

    iput-object v0, p0, Landroidx/slice/widget/SliceView;->mRefreshLastUpdated:Ljava/lang/Runnable;

    const v0, 0x7f12032b

    .line 12
    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/slice/widget/SliceView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs",
            "defStyleAttr",
            "defStyleRes"
        }
    .end annotation

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowLastUpdated:Z

    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mCurrentSliceLoggedVisible:Z

    .line 16
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowTitleItems:Z

    .line 17
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowHeaderDivider:Z

    .line 18
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowActionDividers:Z

    const/4 v0, -0x1

    .line 19
    iput v0, p0, Landroidx/slice/widget/SliceView;->mThemeTintColor:I

    .line 20
    new-instance v0, Landroidx/slice/widget/SliceView$1;

    invoke-direct {v0, p0}, Landroidx/slice/widget/SliceView$1;-><init>(Landroidx/slice/widget/SliceView;)V

    iput-object v0, p0, Landroidx/slice/widget/SliceView;->mLongpressCheck:Ljava/lang/Runnable;

    .line 21
    new-instance v0, Landroidx/slice/widget/SliceView$2;

    invoke-direct {v0, p0}, Landroidx/slice/widget/SliceView$2;-><init>(Landroidx/slice/widget/SliceView;)V

    iput-object v0, p0, Landroidx/slice/widget/SliceView;->mRefreshLastUpdated:Ljava/lang/Runnable;

    .line 22
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/slice/widget/SliceView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public final applyConfigurations()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/slice/widget/SliceChildView;->setSliceActionListener(Landroidx/slice/widget/SliceView$OnSliceActionListener;)V

    .line 2
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    iget-object v2, p0, Landroidx/slice/widget/SliceView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    invoke-virtual {v2, v1}, Landroidx/slice/widget/SliceStyle;->getRowStyle(Landroidx/slice/SliceItem;)Landroidx/slice/widget/RowStyle;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroidx/slice/widget/SliceChildView;->setStyle(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/RowStyle;)V

    .line 3
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p0}, Landroidx/slice/widget/SliceView;->getTintColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/slice/widget/SliceChildView;->setTint(I)V

    .line 4
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/slice/widget/SliceContent;->getLayoutDir()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 5
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    iget-object p0, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    invoke-virtual {p0}, Landroidx/slice/widget/SliceContent;->getLayoutDir()I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    goto :goto_0

    .line 6
    :cond_0
    iget-object p0, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    :goto_0
    return-void
.end method

.method public final getChildLp(Landroid/view/View;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "child"
        }
    .end annotation

    .line 1
    instance-of p1, p1, Landroidx/slice/widget/ShortcutView;

    if-eqz p1, :cond_0

    .line 2
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    iget p0, p0, Landroidx/slice/widget/SliceView;->mShortcutSize:I

    invoke-direct {p1, p0, p0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    return-object p1

    .line 3
    :cond_0
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    const/4 p1, -0x1

    invoke-direct {p0, p1, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method public final getTintColor()I
    .locals 3

    .line 1
    iget v0, p0, Landroidx/slice/widget/SliceView;->mThemeTintColor:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 2
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentSlice:Landroidx/slice/Slice;

    const-string v1, "int"

    const-string v2, "color"

    invoke-static {v0, v1, v2}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 3
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->getInt()I

    move-result p0

    goto :goto_0

    .line 4
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x1010435

    .line 5
    invoke-static {p0, v0}, Landroidx/slice/widget/SliceViewUtil;->getColorAttr(Landroid/content/Context;I)I

    move-result p0

    :goto_0
    return p0
.end method

.method public final handleTouchForLongpress(Landroid/view/MotionEvent;)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ev"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 p1, 0x3

    if-eq v0, p1, :cond_2

    return v2

    .line 2
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    float-to-int v0, v0

    iget v1, p0, Landroidx/slice/widget/SliceView;->mDownX:I

    sub-int/2addr v0, v1

    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    float-to-int p1, p1

    iget v1, p0, Landroidx/slice/widget/SliceView;->mDownY:I

    sub-int/2addr p1, v1

    mul-int/2addr v0, v0

    mul-int/2addr p1, p1

    add-int/2addr p1, v0

    .line 4
    iget v0, p0, Landroidx/slice/widget/SliceView;->mTouchSlopSquared:I

    if-le p1, v0, :cond_1

    .line 5
    iput-boolean v2, p0, Landroidx/slice/widget/SliceView;->mPressing:Z

    .line 6
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mLongpressCheck:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 7
    :cond_1
    iget-boolean p0, p0, Landroidx/slice/widget/SliceView;->mInLongpress:Z

    return p0

    .line 8
    :cond_2
    iget-boolean p1, p0, Landroidx/slice/widget/SliceView;->mInLongpress:Z

    .line 9
    iput-boolean v2, p0, Landroidx/slice/widget/SliceView;->mPressing:Z

    .line 10
    iput-boolean v2, p0, Landroidx/slice/widget/SliceView;->mInLongpress:Z

    .line 11
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mHandler:Landroid/os/Handler;

    iget-object p0, p0, Landroidx/slice/widget/SliceView;->mLongpressCheck:Ljava/lang/Runnable;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return p1

    .line 12
    :cond_3
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Landroidx/slice/widget/SliceView;->mLongpressCheck:Ljava/lang/Runnable;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Landroidx/slice/widget/SliceView;->mDownX:I

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Landroidx/slice/widget/SliceView;->mDownY:I

    .line 15
    iput-boolean v1, p0, Landroidx/slice/widget/SliceView;->mPressing:Z

    .line 16
    iput-boolean v2, p0, Landroidx/slice/widget/SliceView;->mInLongpress:Z

    .line 17
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mHandler:Landroid/os/Handler;

    iget-object p0, p0, Landroidx/slice/widget/SliceView;->mLongpressCheck:Ljava/lang/Runnable;

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return v2
.end method

.method public final init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs",
            "defStyleAttr",
            "defStyleRes"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/slice/widget/SliceStyle;

    invoke-direct {v0, p1, p2, p3, p4}, Landroidx/slice/widget/SliceStyle;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v0, p0, Landroidx/slice/widget/SliceView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 2
    iget p1, v0, Landroidx/slice/widget/SliceStyle;->mTintColor:I

    .line 3
    iput p1, p0, Landroidx/slice/widget/SliceView;->mThemeTintColor:I

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070055

    .line 5
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Landroidx/slice/widget/SliceView;->mShortcutSize:I

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f07004d

    .line 7
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Landroidx/slice/widget/SliceView;->mMinTemplateHeight:I

    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070049

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Landroidx/slice/widget/SliceView;->mLargeHeight:I

    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f07003b

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Landroidx/slice/widget/SliceView;->mActionRowHeight:I

    .line 10
    new-instance p1, Landroidx/slice/widget/SliceViewPolicy;

    invoke-direct {p1}, Landroidx/slice/widget/SliceViewPolicy;-><init>()V

    iput-object p1, p0, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 11
    new-instance p1, Landroidx/slice/widget/TemplateView;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Landroidx/slice/widget/TemplateView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    .line 12
    iget-object p2, p0, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-virtual {p1, p2}, Landroidx/slice/widget/TemplateView;->setPolicy(Landroidx/slice/widget/SliceViewPolicy;)V

    .line 13
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p0, p1}, Landroidx/slice/widget/SliceView;->getChildLp(Landroid/view/View;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    invoke-virtual {p0}, Landroidx/slice/widget/SliceView;->applyConfigurations()V

    .line 15
    new-instance p1, Landroidx/slice/widget/ActionRow;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Landroidx/slice/widget/ActionRow;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Landroidx/slice/widget/SliceView;->mActionRow:Landroidx/slice/widget/ActionRow;

    .line 16
    new-instance p2, Landroid/graphics/drawable/ColorDrawable;

    const p3, -0x111112

    invoke-direct {p2, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 17
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mActionRow:Landroidx/slice/widget/ActionRow;

    invoke-virtual {p0, p1}, Landroidx/slice/widget/SliceView;->getChildLp(Landroid/view/View;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    invoke-virtual {p0}, Landroidx/slice/widget/SliceView;->updateActions()V

    .line 19
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    mul-int/2addr p1, p1

    .line 20
    iput p1, p0, Landroidx/slice/widget/SliceView;->mTouchSlopSquared:I

    .line 21
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Landroidx/slice/widget/SliceView;->mHandler:Landroid/os/Handler;

    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 23
    invoke-super {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final logSliceMetricsVisibilityChange(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "visibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentSliceMetrics:Landroidx/slice/widget/SliceMetrics;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 2
    iget-boolean v1, p0, Landroidx/slice/widget/SliceView;->mCurrentSliceLoggedVisible:Z

    if-nez v1, :cond_0

    .line 3
    check-cast v0, Landroidx/slice/widget/SliceMetricsWrapper;

    .line 4
    iget-object v0, v0, Landroidx/slice/widget/SliceMetricsWrapper;->mSliceMetrics:Landroid/app/slice/SliceMetrics;

    invoke-virtual {v0}, Landroid/app/slice/SliceMetrics;->logVisible()V

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mCurrentSliceLoggedVisible:Z

    :cond_0
    if-nez p1, :cond_1

    .line 6
    iget-boolean p1, p0, Landroidx/slice/widget/SliceView;->mCurrentSliceLoggedVisible:Z

    if-eqz p1, :cond_1

    .line 7
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentSliceMetrics:Landroidx/slice/widget/SliceMetrics;

    check-cast p1, Landroidx/slice/widget/SliceMetricsWrapper;

    .line 8
    iget-object p1, p1, Landroidx/slice/widget/SliceMetricsWrapper;->mSliceMetrics:Landroid/app/slice/SliceMetrics;

    invoke-virtual {p1}, Landroid/app/slice/SliceMetrics;->logHidden()V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Landroidx/slice/widget/SliceView;->mCurrentSliceLoggedVisible:Z

    :cond_1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Landroidx/slice/widget/SliceView;->logSliceMetricsVisibilityChange(Z)V

    .line 4
    invoke-virtual {p0, v0}, Landroidx/slice/widget/SliceView;->refreshLastUpdatedLabel(Z)V

    :cond_0
    return-void
.end method

.method public onChanged(Ljava/lang/Object;)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "slice"
        }
    .end annotation

    .line 1
    check-cast p1, Landroidx/slice/Slice;

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3
    new-instance v1, Landroidx/slice/widget/LocationBasedViewTracker;

    sget-object v2, Landroidx/slice/widget/LocationBasedViewTracker;->INPUT_FOCUS:Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;

    invoke-direct {v1, p0, v0, v2}, Landroidx/slice/widget/LocationBasedViewTracker;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;)V

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "accessibility"

    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-nez v0, :cond_1

    goto :goto_1

    .line 6
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/ViewGroup;->addFocusables(Ljava/util/ArrayList;II)V

    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 9
    invoke-virtual {v4}, Landroid/view/View;->isAccessibilityFocused()Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_0

    :cond_3
    move-object v4, v3

    :goto_0
    if-eqz v4, :cond_4

    .line 10
    new-instance v0, Landroidx/slice/widget/LocationBasedViewTracker;

    sget-object v5, Landroidx/slice/widget/LocationBasedViewTracker;->A11Y_FOCUS:Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;

    invoke-direct {v0, p0, v4, v5}, Landroidx/slice/widget/LocationBasedViewTracker;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;)V

    :cond_4
    :goto_1
    if-eqz p1, :cond_7

    .line 11
    invoke-virtual {p1}, Landroidx/slice/Slice;->getUri()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_5

    goto :goto_2

    .line 12
    :cond_5
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentSlice:Landroidx/slice/Slice;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroidx/slice/Slice;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/slice/Slice;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 13
    :cond_6
    invoke-virtual {p0, v2}, Landroidx/slice/widget/SliceView;->logSliceMetricsVisibilityChange(Z)V

    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/slice/Slice;->getUri()Landroid/net/Uri;

    move-result-object v4

    .line 15
    new-instance v5, Landroidx/slice/widget/SliceMetricsWrapper;

    invoke-direct {v5, v0, v4}, Landroidx/slice/widget/SliceMetricsWrapper;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    .line 16
    iput-object v5, p0, Landroidx/slice/widget/SliceView;->mCurrentSliceMetrics:Landroidx/slice/widget/SliceMetrics;

    goto :goto_3

    .line 17
    :cond_7
    :goto_2
    invoke-virtual {p0, v2}, Landroidx/slice/widget/SliceView;->logSliceMetricsVisibilityChange(Z)V

    .line 18
    iput-object v3, p0, Landroidx/slice/widget/SliceView;->mCurrentSliceMetrics:Landroidx/slice/widget/SliceMetrics;

    :cond_8
    :goto_3
    const/4 v0, 0x1

    if-eqz p1, :cond_9

    .line 19
    iget-object v4, p0, Landroidx/slice/widget/SliceView;->mCurrentSlice:Landroidx/slice/Slice;

    if-eqz v4, :cond_9

    .line 20
    invoke-virtual {p1}, Landroidx/slice/Slice;->getUri()Landroid/net/Uri;

    move-result-object v4

    iget-object v5, p0, Landroidx/slice/widget/SliceView;->mCurrentSlice:Landroidx/slice/Slice;

    invoke-virtual {v5}, Landroidx/slice/Slice;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    move v4, v0

    goto :goto_4

    :cond_9
    move v4, v2

    .line 21
    :goto_4
    iget-object v5, p0, Landroidx/slice/widget/SliceView;->mSliceMetadata:Landroidx/slice/SliceMetadata;

    .line 22
    iput-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentSlice:Landroidx/slice/Slice;

    if-eqz p1, :cond_a

    .line 23
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v6, p0, Landroidx/slice/widget/SliceView;->mCurrentSlice:Landroidx/slice/Slice;

    .line 24
    new-instance v7, Landroidx/slice/SliceMetadata;

    invoke-direct {v7, p1, v6}, Landroidx/slice/SliceMetadata;-><init>(Landroid/content/Context;Landroidx/slice/Slice;)V

    goto :goto_5

    :cond_a
    move-object v7, v3

    .line 25
    :goto_5
    iput-object v7, p0, Landroidx/slice/widget/SliceView;->mSliceMetadata:Landroidx/slice/SliceMetadata;

    if-eqz v4, :cond_b

    .line 26
    invoke-virtual {v5}, Landroidx/slice/SliceMetadata;->getLoadingState()I

    move-result p1

    if-ne p1, v1, :cond_c

    .line 27
    invoke-virtual {v7}, Landroidx/slice/SliceMetadata;->getLoadingState()I

    move-result p1

    if-nez p1, :cond_c

    goto/16 :goto_a

    .line 28
    :cond_b
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p1}, Landroidx/slice/widget/SliceChildView;->resetView()V

    .line 29
    :cond_c
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mSliceMetadata:Landroidx/slice/SliceMetadata;

    if-eqz p1, :cond_d

    .line 30
    iget-object p1, p1, Landroidx/slice/SliceMetadata;->mListContent:Landroidx/slice/widget/ListContent;

    goto :goto_6

    :cond_d
    move-object p1, v3

    .line 31
    :goto_6
    iput-object p1, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    .line 32
    iget-boolean v4, p0, Landroidx/slice/widget/SliceView;->mShowTitleItems:Z

    if-eqz v4, :cond_e

    .line 33
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowTitleItems:Z

    if-eqz p1, :cond_e

    .line 34
    iget-object v4, p1, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    if-eqz v4, :cond_e

    .line 35
    iput-boolean v0, v4, Landroidx/slice/widget/RowContent;->mShowTitleItems:Z

    .line 36
    :cond_e
    iget-boolean v4, p0, Landroidx/slice/widget/SliceView;->mShowHeaderDivider:Z

    if-eqz v4, :cond_f

    .line 37
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowHeaderDivider:Z

    if-eqz p1, :cond_f

    .line 38
    iget-object v4, p1, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    if-eqz v4, :cond_f

    iget-object v4, p1, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v4, v0, :cond_f

    .line 39
    iget-object p1, p1, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    .line 40
    iput-boolean v0, p1, Landroidx/slice/widget/RowContent;->mShowBottomDivider:Z

    .line 41
    :cond_f
    iget-boolean p1, p0, Landroidx/slice/widget/SliceView;->mShowActionDividers:Z

    if-eqz p1, :cond_11

    .line 42
    iput-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowActionDividers:Z

    .line 43
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz p1, :cond_11

    .line 44
    iget-object p1, p1, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_10
    :goto_7
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_11

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/slice/widget/SliceContent;

    .line 45
    instance-of v5, v4, Landroidx/slice/widget/RowContent;

    if-eqz v5, :cond_10

    .line 46
    check-cast v4, Landroidx/slice/widget/RowContent;

    .line 47
    iput-boolean v0, v4, Landroidx/slice/widget/RowContent;->mShowActionDivider:Z

    goto :goto_7

    .line 48
    :cond_11
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Landroidx/slice/widget/ListContent;->isValid()Z

    move-result p1

    if-nez p1, :cond_12

    goto :goto_9

    .line 49
    :cond_12
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p1, v3}, Landroidx/slice/widget/SliceChildView;->setLoadingActions(Ljava/util/Set;)V

    .line 50
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mSliceMetadata:Landroidx/slice/SliceMetadata;

    .line 51
    iget-object v3, p1, Landroidx/slice/SliceMetadata;->mSliceActions:Ljava/util/List;

    .line 52
    iput-object v3, p0, Landroidx/slice/widget/SliceView;->mActions:Ljava/util/List;

    .line 53
    iget-object v3, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    .line 54
    iget-wide v4, p1, Landroidx/slice/SliceMetadata;->mLastUpdated:J

    .line 55
    invoke-virtual {v3, v4, v5}, Landroidx/slice/widget/SliceChildView;->setLastUpdated(J)V

    .line 56
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    iget-boolean v3, p0, Landroidx/slice/widget/SliceView;->mShowLastUpdated:Z

    if-eqz v3, :cond_13

    iget-object v3, p0, Landroidx/slice/widget/SliceView;->mSliceMetadata:Landroidx/slice/SliceMetadata;

    invoke-virtual {v3}, Landroidx/slice/SliceMetadata;->isExpired()Z

    move-result v3

    if-eqz v3, :cond_13

    move v2, v0

    :cond_13
    invoke-virtual {p1, v2}, Landroidx/slice/widget/SliceChildView;->setShowLastUpdated(Z)V

    .line 57
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    iget-object v2, p0, Landroidx/slice/widget/SliceView;->mSliceMetadata:Landroidx/slice/SliceMetadata;

    .line 58
    iget-object v2, v2, Landroidx/slice/SliceMetadata;->mSlice:Landroidx/slice/Slice;

    .line 59
    iget-object v2, v2, Landroidx/slice/Slice;->mHints:[Ljava/lang/String;

    const-string v3, "permission_request"

    invoke-static {v2, v3}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    .line 60
    invoke-virtual {p1, v2}, Landroidx/slice/widget/SliceChildView;->setAllowTwoLines(Z)V

    .line 61
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p0}, Landroidx/slice/widget/SliceView;->getTintColor()I

    move-result v2

    invoke-virtual {p1, v2}, Landroidx/slice/widget/SliceChildView;->setTint(I)V

    .line 62
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    invoke-virtual {p1}, Landroidx/slice/widget/SliceContent;->getLayoutDir()I

    move-result p1

    const/4 v2, -0x1

    if-eq p1, v2, :cond_14

    .line 63
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    iget-object v1, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    invoke-virtual {v1}, Landroidx/slice/widget/SliceContent;->getLayoutDir()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    goto :goto_8

    .line 64
    :cond_14
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 65
    :goto_8
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    iget-object v1, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    invoke-virtual {p1, v1}, Landroidx/slice/widget/SliceChildView;->setSliceContent(Landroidx/slice/widget/ListContent;)V

    .line 66
    invoke-virtual {p0}, Landroidx/slice/widget/SliceView;->updateActions()V

    .line 67
    invoke-virtual {p0, v0}, Landroidx/slice/widget/SliceView;->logSliceMetricsVisibilityChange(Z)V

    .line 68
    invoke-virtual {p0, v0}, Landroidx/slice/widget/SliceView;->refreshLastUpdatedLabel(Z)V

    goto :goto_a

    .line 69
    :cond_15
    :goto_9
    iput-object v3, p0, Landroidx/slice/widget/SliceView;->mActions:Ljava/util/List;

    .line 70
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p1}, Landroidx/slice/widget/SliceChildView;->resetView()V

    .line 71
    invoke-virtual {p0}, Landroidx/slice/widget/SliceView;->updateActions()V

    :goto_a
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/slice/widget/ListContent;->getShortcut(Landroid/content/Context;)Landroidx/slice/core/SliceAction;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 2
    :try_start_0
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/slice/widget/ListContent;->getShortcut(Landroid/content/Context;)Landroidx/slice/core/SliceAction;

    move-result-object p1

    check-cast p1, Landroidx/slice/core/SliceActionImpl;

    .line 3
    iget-object v0, p1, Landroidx/slice/core/SliceActionImpl;->mActionItem:Landroidx/slice/SliceItem;

    if-eqz v0, :cond_0

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/slice/SliceItem;->fireActionInternal(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 5
    iget-object p0, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    .line 6
    iget-object p1, p1, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 7
    invoke-virtual {p0, p1}, Landroidx/slice/widget/SliceChildView;->setActionLoading(Landroidx/slice/SliceItem;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "SliceView"

    const-string v0, "PendingIntent for slice cannot be sent"

    .line 8
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 9
    :cond_1
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mOnClickListener:Landroid/view/View$OnClickListener;

    if-eqz p1, :cond_2

    .line 10
    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/slice/widget/SliceView;->logSliceMetricsVisibilityChange(Z)V

    .line 3
    invoke-virtual {p0, v0}, Landroidx/slice/widget/SliceView;->refreshLastUpdatedLabel(Z)V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ev"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Landroidx/slice/widget/SliceView;->handleTouchForLongpress(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "changed",
            "l",
            "t",
            "r",
            "b"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p3

    const/4 p4, 0x0

    invoke-virtual {p1, p4, p4, p2, p3}, Landroid/view/View;->layout(IIII)V

    .line 3
    iget-object p2, p0, Landroidx/slice/widget/SliceView;->mActionRow:Landroidx/slice/widget/ActionRow;

    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result p2

    const/16 p3, 0x8

    if-eq p2, p3, :cond_0

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    .line 5
    iget-object p2, p0, Landroidx/slice/widget/SliceView;->mActionRow:Landroidx/slice/widget/ActionRow;

    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result p3

    iget-object p0, p0, Landroidx/slice/widget/SliceView;->mActionRow:Landroidx/slice/widget/ActionRow;

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result p0

    add-int/2addr p0, p1

    .line 7
    invoke-virtual {p2, p4, p1, p3, p0}, Landroid/widget/FrameLayout;->layout(IIII)V

    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "widthMeasureSpec",
            "heightMeasureSpec"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 2
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 3
    iget v0, v0, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    const/4 v1, 0x3

    if-ne v1, v0, :cond_0

    .line 4
    iget p1, p0, Landroidx/slice/widget/SliceView;->mShortcutSize:I

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result p1

    add-int/2addr p1, v0

    .line 5
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mActionRow:Landroidx/slice/widget/ActionRow;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eq v0, v2, :cond_1

    .line 6
    iget v0, p0, Landroidx/slice/widget/SliceView;->mActionRowHeight:I

    goto :goto_0

    :cond_1
    move v0, v3

    .line 7
    :goto_0
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 8
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 10
    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v5, -0x2

    if-eq v4, v5, :cond_3

    :cond_2
    if-nez p2, :cond_4

    :cond_3
    const/4 v4, -0x1

    goto :goto_1

    :cond_4
    move v4, v2

    .line 11
    :goto_1
    iget-object v5, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz v5, :cond_8

    invoke-virtual {v5}, Landroidx/slice/widget/ListContent;->isValid()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 12
    iget-object v5, p0, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 13
    iget v6, v5, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    if-eq v6, v1, :cond_8

    if-lez v4, :cond_6

    .line 14
    iget-object v6, p0, Landroidx/slice/widget/SliceView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 15
    iget v6, v6, Landroidx/slice/widget/SliceStyle;->mRowMaxHeight:I

    if-ge v4, v6, :cond_6

    .line 16
    iget v6, p0, Landroidx/slice/widget/SliceView;->mMinTemplateHeight:I

    if-gt v4, v6, :cond_5

    move v4, v6

    .line 17
    :cond_5
    iget v6, v5, Landroidx/slice/widget/SliceViewPolicy;->mMaxSmallHeight:I

    if-eq v6, v4, :cond_7

    .line 18
    iput v4, v5, Landroidx/slice/widget/SliceViewPolicy;->mMaxSmallHeight:I

    .line 19
    iget-object v5, v5, Landroidx/slice/widget/SliceViewPolicy;->mListener:Landroidx/slice/widget/SliceViewPolicy$PolicyChangeListener;

    if-eqz v5, :cond_7

    .line 20
    check-cast v5, Landroidx/slice/widget/TemplateView;

    .line 21
    iget-object v5, v5, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    if-eqz v5, :cond_7

    .line 22
    invoke-virtual {v5}, Landroidx/slice/widget/SliceAdapter;->notifyHeaderChanged()V

    goto :goto_2

    .line 23
    :cond_6
    iget v6, v5, Landroidx/slice/widget/SliceViewPolicy;->mMaxSmallHeight:I

    if-eqz v6, :cond_7

    .line 24
    iput v3, v5, Landroidx/slice/widget/SliceViewPolicy;->mMaxSmallHeight:I

    .line 25
    iget-object v5, v5, Landroidx/slice/widget/SliceViewPolicy;->mListener:Landroidx/slice/widget/SliceViewPolicy$PolicyChangeListener;

    if-eqz v5, :cond_7

    .line 26
    check-cast v5, Landroidx/slice/widget/TemplateView;

    .line 27
    iget-object v5, v5, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    if-eqz v5, :cond_7

    .line 28
    invoke-virtual {v5}, Landroidx/slice/widget/SliceAdapter;->notifyHeaderChanged()V

    .line 29
    :cond_7
    :goto_2
    iget-object v5, p0, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 30
    iget v6, v5, Landroidx/slice/widget/SliceViewPolicy;->mMaxHeight:I

    if-eq v4, v6, :cond_8

    .line 31
    iput v4, v5, Landroidx/slice/widget/SliceViewPolicy;->mMaxHeight:I

    .line 32
    iget-object v4, v5, Landroidx/slice/widget/SliceViewPolicy;->mListener:Landroidx/slice/widget/SliceViewPolicy$PolicyChangeListener;

    if-eqz v4, :cond_8

    .line 33
    check-cast v4, Landroidx/slice/widget/TemplateView;

    .line 34
    iget-object v5, v4, Landroidx/slice/widget/TemplateView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz v5, :cond_8

    .line 35
    iget-object v6, v4, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    iget-object v7, v4, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-virtual {v5, v6, v7}, Landroidx/slice/widget/ListContent;->getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroidx/slice/widget/TemplateView;->updateDisplayedItems(I)V

    .line 36
    :cond_8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v4

    sub-int/2addr v2, v4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v2, v4

    const/high16 v4, 0x40000000    # 2.0f

    if-eq p2, v4, :cond_10

    .line 37
    iget-object v5, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz v5, :cond_f

    invoke-virtual {v5}, Landroidx/slice/widget/ListContent;->isValid()Z

    move-result v5

    if-nez v5, :cond_9

    goto :goto_5

    .line 38
    :cond_9
    iget-object v5, p0, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 39
    iget v6, v5, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    if-ne v6, v1, :cond_a

    .line 40
    iget p2, p0, Landroidx/slice/widget/SliceView;->mShortcutSize:I

    goto :goto_3

    .line 41
    :cond_a
    iget-object v1, p0, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    iget-object v6, p0, Landroidx/slice/widget/SliceView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 42
    invoke-virtual {v1, v6, v5}, Landroidx/slice/widget/ListContent;->getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result v1

    add-int/2addr v1, v0

    if-gt v2, v1, :cond_e

    if-nez p2, :cond_b

    goto :goto_4

    .line 43
    :cond_b
    iget-object p2, p0, Landroidx/slice/widget/SliceView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 44
    iget-boolean p2, p2, Landroidx/slice/widget/SliceStyle;->mExpandToAvailableHeight:Z

    if-eqz p2, :cond_c

    goto :goto_6

    .line 45
    :cond_c
    iget-object p2, p0, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 46
    iget p2, p2, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    const/4 v1, 0x2

    if-ne p2, v1, :cond_d

    .line 47
    iget p2, p0, Landroidx/slice/widget/SliceView;->mLargeHeight:I

    add-int v1, p2, v0

    if-lt v2, v1, :cond_d

    :goto_3
    add-int v2, p2, v0

    goto :goto_6

    .line 48
    :cond_d
    iget p2, p0, Landroidx/slice/widget/SliceView;->mMinTemplateHeight:I

    if-gt v2, p2, :cond_10

    move v2, p2

    goto :goto_6

    :cond_e
    :goto_4
    move v2, v1

    goto :goto_6

    :cond_f
    :goto_5
    move v2, v0

    .line 49
    :cond_10
    :goto_6
    invoke-static {p1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    if-lez v0, :cond_11

    .line 50
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v1

    add-int/2addr v1, v0

    goto :goto_7

    :cond_11
    move v1, v3

    .line 51
    :goto_7
    iget-object v5, p0, Landroidx/slice/widget/SliceView;->mActionRow:Landroidx/slice/widget/ActionRow;

    invoke-static {v1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {v5, p2, v1}, Landroid/widget/FrameLayout;->measure(II)V

    .line 52
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v1

    add-int/2addr v1, v2

    if-lez v0, :cond_12

    goto :goto_8

    .line 53
    :cond_12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v3

    :goto_8
    add-int/2addr v1, v3

    .line 54
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-static {v1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {v0, p2, v1}, Landroid/widget/FrameLayout;->measure(II)V

    .line 55
    iget-object p2, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    .line 56
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result p2

    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mActionRow:Landroidx/slice/widget/ActionRow;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v0

    add-int/2addr v0, p2

    .line 57
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ev"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Landroidx/slice/widget/SliceView;->handleTouchForLongpress(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "changedView",
            "visibility"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    const/4 v0, 0x0

    if-nez p2, :cond_0

    move v1, p1

    goto :goto_0

    :cond_0
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0, v1}, Landroidx/slice/widget/SliceView;->logSliceMetricsVisibilityChange(Z)V

    if-nez p2, :cond_1

    goto :goto_1

    :cond_1
    move p1, v0

    .line 4
    :goto_1
    invoke-virtual {p0, p1}, Landroidx/slice/widget/SliceView;->refreshLastUpdatedLabel(Z)V

    :cond_2
    return-void
.end method

.method public onWindowVisibilityChanged(I)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "visibility"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 2
    :goto_0
    invoke-virtual {p0, v2}, Landroidx/slice/widget/SliceView;->logSliceMetricsVisibilityChange(Z)V

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    move v0, v1

    .line 3
    :goto_1
    invoke-virtual {p0, v0}, Landroidx/slice/widget/SliceView;->refreshLastUpdatedLabel(Z)V

    return-void
.end method

.method public final refreshLastUpdatedLabel(Z)V
    .locals 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "visibility"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/slice/widget/SliceView;->mShowLastUpdated:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mSliceMetadata:Landroidx/slice/SliceMetadata;

    if-eqz v0, :cond_5

    .line 2
    iget-wide v1, v0, Landroidx/slice/SliceMetadata;->mExpiry:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_5

    if-eqz p1, :cond_4

    .line 3
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/slice/widget/SliceView;->mRefreshLastUpdated:Ljava/lang/Runnable;

    invoke-virtual {v0}, Landroidx/slice/SliceMetadata;->isExpired()Z

    move-result v0

    const-wide/32 v5, 0xea60

    if-eqz v0, :cond_1

    goto :goto_2

    .line 4
    :cond_1
    iget-object p0, p0, Landroidx/slice/widget/SliceView;->mSliceMetadata:Landroidx/slice/SliceMetadata;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 6
    iget-wide v9, p0, Landroidx/slice/SliceMetadata;->mExpiry:J

    const-wide/16 v11, 0x0

    cmp-long p0, v9, v11

    if-eqz p0, :cond_3

    cmp-long p0, v9, v3

    if-eqz p0, :cond_3

    cmp-long p0, v7, v9

    if-lez p0, :cond_2

    goto :goto_1

    :cond_2
    sub-long v11, v9, v7

    :cond_3
    :goto_1
    add-long/2addr v5, v11

    .line 7
    :goto_2
    invoke-virtual {p1, v1, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_3

    .line 8
    :cond_4
    iget-object p1, p0, Landroidx/slice/widget/SliceView;->mHandler:Landroid/os/Handler;

    iget-object p0, p0, Landroidx/slice/widget/SliceView;->mRefreshLastUpdated:Ljava/lang/Runnable;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_5
    :goto_3
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/SliceView;->mOnClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 2
    iput-object p1, p0, Landroidx/slice/widget/SliceView;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-void
.end method

.method public setSliceViewPolicy(Landroidx/slice/widget/SliceViewPolicy;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "policy"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    return-void
.end method

.method public final updateActions()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mActions:Ljava/util/List;

    const/16 v1, 0x8

    if-nez v0, :cond_0

    .line 2
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mActionRow:Landroidx/slice/widget/ActionRow;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 3
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/slice/widget/SliceChildView;->setSliceActions(Ljava/util/List;)V

    .line 4
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingStart()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingEnd()I

    move-result v3

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result p0

    .line 6
    invoke-virtual {v0, v1, v2, v3, p0}, Landroidx/slice/widget/SliceChildView;->setInsets(IIII)V

    return-void

    .line 7
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/slice/widget/SliceView;->mActions:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 8
    sget-object v2, Landroidx/slice/widget/SliceView;->SLICE_ACTION_PRIORITY_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 9
    iget-object v2, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {v2, v0}, Landroidx/slice/widget/SliceChildView;->setSliceActions(Ljava/util/List;)V

    .line 10
    iget-object v0, p0, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingStart()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingEnd()I

    move-result v4

    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v5

    .line 12
    invoke-virtual {v0, v2, v3, v4, v5}, Landroidx/slice/widget/SliceChildView;->setInsets(IIII)V

    .line 13
    iget-object p0, p0, Landroidx/slice/widget/SliceView;->mActionRow:Landroidx/slice/widget/ActionRow;

    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    return-void
.end method
