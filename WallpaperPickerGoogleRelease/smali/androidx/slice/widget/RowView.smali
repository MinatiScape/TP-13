.class public Landroidx/slice/widget/RowView;
.super Landroidx/slice/widget/SliceChildView;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/RowView$TimeSetListener;,
        Landroidx/slice/widget/RowView$DateSetListener;
    }
.end annotation


# instance fields
.field public final mActionDivider:Landroid/view/View;

.field public final mActionSpinner:Landroid/widget/ProgressBar;

.field public final mActions:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroidx/slice/core/SliceActionImpl;",
            "Landroidx/slice/widget/SliceActionView;",
            ">;"
        }
    .end annotation
.end field

.field public mAllowTwoLines:Z

.field public final mBottomDivider:Landroid/view/View;

.field public final mContent:Landroid/widget/LinearLayout;

.field public final mEndContainer:Landroid/widget/LinearLayout;

.field public mHandler:Landroid/os/Handler;

.field public mHeaderActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/slice/core/SliceAction;",
            ">;"
        }
    .end annotation
.end field

.field public mIconSize:I

.field public mImageSize:I

.field public mIsHeader:Z

.field public mIsRangeSliding:Z

.field public mIsStarRating:Z

.field public mLastSentRangeUpdate:J

.field public final mLastUpdatedText:Landroid/widget/TextView;

.field public mLoadingActions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation
.end field

.field public mMeasuredRangeHeight:I

.field public final mPrimaryText:Landroid/widget/TextView;

.field public mRangeBar:Landroid/view/View;

.field public mRangeItem:Landroidx/slice/SliceItem;

.field public mRangeMaxValue:I

.field public mRangeMinValue:I

.field public mRangeUpdater:Ljava/lang/Runnable;

.field public mRangeUpdaterRunning:Z

.field public mRangeValue:I

.field public final mRatingBarChangeListener:Landroid/widget/RatingBar$OnRatingBarChangeListener;

.field public final mRootView:Landroid/widget/LinearLayout;

.field public mRowAction:Landroidx/slice/core/SliceActionImpl;

.field public mRowContent:Landroidx/slice/widget/RowContent;

.field public mRowIndex:I

.field public final mSecondaryText:Landroid/widget/TextView;

.field public mSeeMoreView:Landroid/view/View;

.field public final mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field public mSelectionItem:Landroidx/slice/SliceItem;

.field public mSelectionOptionKeys:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mSelectionOptionValues:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field public mSelectionSpinner:Landroid/widget/Spinner;

.field public mShowActionSpinner:Z

.field public final mStartContainer:Landroid/widget/LinearLayout;

.field public mStartItem:Landroidx/slice/SliceItem;

.field public final mSubContent:Landroid/widget/LinearLayout;

.field public final mToggles:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroidx/slice/core/SliceActionImpl;",
            "Landroidx/slice/widget/SliceActionView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Landroidx/slice/widget/SliceChildView;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mToggles:Landroid/util/ArrayMap;

    .line 3
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mActions:Landroid/util/ArrayMap;

    .line 4
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mLoadingActions:Ljava/util/Set;

    .line 5
    new-instance v0, Landroidx/slice/widget/RowView$2;

    invoke-direct {v0, p0}, Landroidx/slice/widget/RowView$2;-><init>(Landroidx/slice/widget/RowView;)V

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mRangeUpdater:Ljava/lang/Runnable;

    .line 6
    new-instance v0, Landroidx/slice/widget/RowView$3;

    invoke-direct {v0, p0}, Landroidx/slice/widget/RowView$3;-><init>(Landroidx/slice/widget/RowView;)V

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 7
    new-instance v0, Landroidx/slice/widget/RowView$4;

    invoke-direct {v0, p0}, Landroidx/slice/widget/RowView$4;-><init>(Landroidx/slice/widget/RowView;)V

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mRatingBarChangeListener:Landroid/widget/RatingBar$OnRatingBarChangeListener;

    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070048

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/RowView;->mIconSize:I

    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070057

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/RowView;->mImageSize:I

    .line 10
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d002b

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    const p1, 0x7f0a011d

    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Landroidx/slice/widget/RowView;->mStartContainer:Landroid/widget/LinearLayout;

    const p1, 0x1020002

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Landroidx/slice/widget/RowView;->mContent:Landroid/widget/LinearLayout;

    const v0, 0x7f0a0229

    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mSubContent:Landroid/widget/LinearLayout;

    const v0, 0x1020016

    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mPrimaryText:Landroid/widget/TextView;

    const v0, 0x1020010

    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mSecondaryText:Landroid/widget/TextView;

    const v0, 0x7f0a012e

    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mLastUpdatedText:Landroid/widget/TextView;

    const v0, 0x7f0a0078

    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mBottomDivider:Landroid/view/View;

    const v0, 0x7f0a0041

    .line 19
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mActionDivider:Landroid/view/View;

    const v0, 0x7f0a004e

    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mActionSpinner:Landroid/widget/ProgressBar;

    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Landroidx/slice/widget/SliceViewUtil;->tintIndeterminateProgressBar(Landroid/content/Context;Landroid/widget/ProgressBar;)V

    const v0, 0x1020018

    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mEndContainer:Landroid/widget/LinearLayout;

    .line 23
    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    const/4 v0, 0x2

    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void
.end method


# virtual methods
.method public final addAction(Landroidx/slice/core/SliceActionImpl;ILandroid/view/ViewGroup;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x0,
            0x0,
            0x0
        }
        names = {
            "actionContent",
            "color",
            "container",
            "isStart"
        }
    .end annotation

    .line 1
    new-instance v6, Landroidx/slice/widget/SliceActionView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-direct {v6, v0, v1}, Landroidx/slice/widget/SliceActionView;-><init>(Landroid/content/Context;Landroidx/slice/widget/RowStyle;)V

    .line 2
    invoke-virtual {p3, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 3
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-ne v0, v2, :cond_0

    .line 4
    invoke-virtual {p3, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroidx/slice/core/SliceActionImpl;->isToggle()Z

    move-result p3

    xor-int/lit8 v0, p3, 0x1

    if-eqz p3, :cond_1

    const/4 v2, 0x3

    goto :goto_0

    :cond_1
    move v2, v1

    .line 6
    :goto_0
    new-instance v3, Landroidx/slice/widget/EventInfo;

    invoke-virtual {p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v4

    iget v5, p0, Landroidx/slice/widget/RowView;->mRowIndex:I

    invoke-direct {v3, v4, v0, v2, v5}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    const/4 v7, 0x1

    if-eqz p4, :cond_2

    .line 7
    invoke-virtual {v3, v1, v1, v7}, Landroidx/slice/widget/EventInfo;->setPosition(III)V

    .line 8
    :cond_2
    iget-object p4, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    iget-object v5, p0, Landroidx/slice/widget/SliceChildView;->mLoadingListener:Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;

    move-object v0, v6

    move-object v1, p1

    move-object v2, v3

    move-object v3, p4

    move v4, p2

    invoke-virtual/range {v0 .. v5}, Landroidx/slice/widget/SliceActionView;->setAction(Landroidx/slice/core/SliceActionImpl;Landroidx/slice/widget/EventInfo;Landroidx/slice/widget/SliceView$OnSliceActionListener;ILandroidx/slice/widget/SliceActionView$SliceActionLoadingListener;)V

    .line 9
    iget-object p2, p0, Landroidx/slice/widget/RowView;->mLoadingActions:Ljava/util/Set;

    .line 10
    iget-object p4, p1, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 11
    invoke-interface {p2, p4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 12
    invoke-virtual {v6, v7}, Landroidx/slice/widget/SliceActionView;->setLoading(Z)V

    :cond_3
    if-eqz p3, :cond_4

    .line 13
    iget-object p0, p0, Landroidx/slice/widget/RowView;->mToggles:Landroid/util/ArrayMap;

    invoke-virtual {p0, p1, v6}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 14
    :cond_4
    iget-object p0, p0, Landroidx/slice/widget/RowView;->mActions:Landroid/util/ArrayMap;

    invoke-virtual {p0, p1, v6}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    return-void
.end method

.method public final addItem(Landroidx/slice/SliceItem;IZ)Z
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "sliceItem",
            "color",
            "isStart"
        }
    .end annotation

    if-eqz p3, :cond_0

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mStartContainer:Landroid/widget/LinearLayout;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mEndContainer:Landroid/widget/LinearLayout;

    .line 2
    :goto_0
    iget-object v1, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v2, "slice"

    .line 3
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    .line 4
    iget-object v1, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v4, "action"

    .line 5
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 6
    :cond_1
    iget-object v1, p1, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v4, "shortcut"

    invoke-static {v1, v4}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 7
    new-instance v1, Landroidx/slice/core/SliceActionImpl;

    invoke-direct {v1, p1}, Landroidx/slice/core/SliceActionImpl;-><init>(Landroidx/slice/SliceItem;)V

    invoke-virtual {p0, v1, p2, v0, p3}, Landroidx/slice/widget/RowView;->addAction(Landroidx/slice/core/SliceActionImpl;ILandroid/view/ViewGroup;Z)V

    return v2

    .line 8
    :cond_2
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object p3

    invoke-virtual {p3}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    if-nez p3, :cond_3

    return v3

    .line 9
    :cond_3
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/slice/SliceItem;

    .line 10
    :cond_4
    iget-object p3, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v1, "image"

    .line 11
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    const/4 v1, 0x0

    if-eqz p3, :cond_5

    .line 12
    iget-object p3, p1, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast p3, Landroidx/core/graphics/drawable/IconCompat;

    move-object v4, v1

    goto :goto_1

    .line 13
    :cond_5
    iget-object p3, p1, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v4, "long"

    .line 14
    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_6

    move-object v4, p1

    move-object p3, v1

    goto :goto_1

    :cond_6
    move-object p3, v1

    move-object v4, p3

    :goto_1
    if-eqz p3, :cond_13

    .line 15
    iget-object v1, p1, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v4, "no_tint"

    invoke-static {v1, v4}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    xor-int/2addr v1, v2

    .line 16
    iget-object v4, p1, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v5, "raw"

    invoke-static {v4, v5}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    .line 18
    new-instance v6, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p3, v7}, Landroidx/core/graphics/drawable/IconCompat;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    .line 20
    iget-object v7, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz v7, :cond_8

    .line 21
    iget v7, v7, Landroidx/slice/widget/SliceStyle;->mImageCornerRadius:F

    const/4 v8, 0x0

    cmpl-float v7, v7, v8

    if-lez v7, :cond_7

    move v7, v2

    goto :goto_2

    :cond_7
    move v7, v3

    :goto_2
    if-eqz v7, :cond_8

    move v7, v2

    goto :goto_3

    :cond_8
    move v7, v3

    :goto_3
    if-eqz v7, :cond_9

    .line 22
    iget-object p1, p1, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v7, "large"

    invoke-static {p1, v7}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 23
    new-instance p1, Landroidx/slice/CornerDrawable;

    iget-object v7, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 24
    iget v7, v7, Landroidx/slice/widget/SliceStyle;->mImageCornerRadius:F

    .line 25
    invoke-direct {p1, p3, v7}, Landroidx/slice/CornerDrawable;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 26
    invoke-virtual {v6, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_4

    .line 27
    :cond_9
    invoke-virtual {v6, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_4
    const/4 p1, -0x1

    if-eqz v1, :cond_a

    if-eq p2, p1, :cond_a

    .line 28
    invoke-virtual {v6, p2}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 29
    :cond_a
    iget-boolean p2, p0, Landroidx/slice/widget/RowView;->mIsRangeSliding:Z

    if-eqz p2, :cond_b

    .line 30
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 31
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_5

    .line 32
    :cond_b
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 33
    :goto_5
    iget-object p2, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    if-eqz p2, :cond_e

    .line 34
    iget v0, p2, Landroidx/slice/widget/RowStyle;->mIconSize:I

    if-lez v0, :cond_c

    goto :goto_6

    .line 35
    :cond_c
    iget v0, p0, Landroidx/slice/widget/RowView;->mIconSize:I

    :goto_6
    iput v0, p0, Landroidx/slice/widget/RowView;->mIconSize:I

    .line 36
    iget p2, p2, Landroidx/slice/widget/RowStyle;->mImageSize:I

    if-lez p2, :cond_d

    goto :goto_7

    .line 37
    :cond_d
    iget p2, p0, Landroidx/slice/widget/RowView;->mImageSize:I

    :goto_7
    iput p2, p0, Landroidx/slice/widget/RowView;->mImageSize:I

    .line 38
    :cond_e
    invoke-virtual {v6}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v4, :cond_f

    .line 39
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v5

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    goto :goto_8

    :cond_f
    iget v0, p0, Landroidx/slice/widget/RowView;->mImageSize:I

    :goto_8
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    if-eqz v4, :cond_10

    .line 40
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p3

    int-to-float p3, p3

    div-float/2addr p3, v5

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    goto :goto_9

    .line 41
    :cond_10
    iget p3, p0, Landroidx/slice/widget/RowView;->mImageSize:I

    :goto_9
    iput p3, p2, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 42
    invoke-virtual {v6, p2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    if-eqz v1, :cond_12

    .line 43
    iget p2, p0, Landroidx/slice/widget/RowView;->mImageSize:I

    if-ne p2, p1, :cond_11

    .line 44
    iget p0, p0, Landroidx/slice/widget/RowView;->mIconSize:I

    div-int/lit8 p0, p0, 0x2

    goto :goto_a

    :cond_11
    iget p0, p0, Landroidx/slice/widget/RowView;->mIconSize:I

    sub-int/2addr p2, p0

    div-int/lit8 p0, p2, 0x2

    goto :goto_a

    :cond_12
    move p0, v3

    .line 45
    :goto_a
    invoke-virtual {v6, p0, p0, p0, p0}, Landroid/widget/ImageView;->setPadding(IIII)V

    move-object v1, v6

    goto :goto_b

    :cond_13
    if-eqz v4, :cond_15

    .line 46
    new-instance v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {v1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 47
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getLong()J

    move-result-wide v4

    invoke-static {p2, v4, v5}, Landroidx/slice/widget/SliceViewUtil;->getTimestampString(Landroid/content/Context;J)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    iget-object p1, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz p1, :cond_14

    .line 49
    iget p1, p1, Landroidx/slice/widget/SliceStyle;->mSubtitleSize:I

    int-to-float p1, p1

    .line 50
    invoke-virtual {v1, v3, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 51
    iget-object p0, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-virtual {p0}, Landroidx/slice/widget/RowStyle;->getSubtitleColor()I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    :cond_14
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_15
    :goto_b
    if-eqz v1, :cond_16

    goto :goto_c

    :cond_16
    move v2, v3

    :goto_c
    return v2
.end method

.method public final addSubtitle(Z)V
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hasTitle"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    if-eqz v0, :cond_16

    .line 2
    iget-object v0, v0, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-eqz v0, :cond_0

    goto/16 :goto_d

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 5
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 6
    iget-object v2, v0, Landroidx/slice/widget/RowContent;->mSummaryItem:Landroidx/slice/SliceItem;

    if-nez v2, :cond_2

    iget-object v2, v0, Landroidx/slice/widget/RowContent;->mSubtitleItem:Landroidx/slice/SliceItem;

    goto :goto_0

    .line 7
    :cond_1
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 8
    iget-object v2, v0, Landroidx/slice/widget/RowContent;->mSubtitleItem:Landroidx/slice/SliceItem;

    .line 9
    :cond_2
    :goto_0
    iget-boolean v0, p0, Landroidx/slice/widget/SliceChildView;->mShowLastUpdated:Z

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v0, :cond_6

    iget-wide v5, p0, Landroidx/slice/widget/SliceChildView;->mLastUpdated:J

    const-wide/16 v7, -0x1

    cmp-long v0, v5, v7

    if-eqz v0, :cond_6

    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v5

    const-wide v5, 0x7528ad000L

    cmp-long v0, v7, v5

    if-lez v0, :cond_3

    .line 11
    div-long/2addr v7, v5

    long-to-int v0, v7

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f100002

    new-array v7, v1, [Ljava/lang/Object;

    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v4

    .line 14
    invoke-virtual {v5, v6, v0, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_3
    const-wide/32 v5, 0x5265c00

    cmp-long v0, v7, v5

    if-lez v0, :cond_4

    .line 15
    div-long/2addr v7, v5

    long-to-int v0, v7

    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/high16 v6, 0x7f100000

    new-array v7, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-virtual {v5, v6, v0, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    const-wide/32 v5, 0xea60

    cmp-long v0, v7, v5

    if-lez v0, :cond_5

    .line 17
    div-long/2addr v7, v5

    long-to-int v0, v7

    .line 18
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f100001

    new-array v7, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-virtual {v5, v6, v0, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_5
    move-object v0, v3

    :goto_1
    if-eqz v0, :cond_6

    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f110024

    new-array v7, v1, [Ljava/lang/Object;

    aput-object v0, v7, v4

    invoke-virtual {v5, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_6
    move-object v0, v3

    :goto_2
    if-eqz v2, :cond_7

    .line 20
    invoke-virtual {v2}, Landroidx/slice/SliceItem;->getSanitizedText()Ljava/lang/CharSequence;

    move-result-object v3

    .line 21
    :cond_7
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_9

    if-eqz v2, :cond_8

    .line 22
    iget-object v2, v2, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v5, "partial"

    invoke-static {v2, v5}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    goto :goto_3

    :cond_8
    move v2, v4

    goto :goto_4

    :cond_9
    :goto_3
    move v2, v1

    :goto_4
    if-eqz v2, :cond_c

    .line 23
    iget-object v5, p0, Landroidx/slice/widget/RowView;->mSecondaryText:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    iget-object v5, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz v5, :cond_c

    .line 25
    iget-object v6, p0, Landroidx/slice/widget/RowView;->mSecondaryText:Landroid/widget/TextView;

    iget-boolean v7, p0, Landroidx/slice/widget/RowView;->mIsHeader:Z

    if-eqz v7, :cond_a

    .line 26
    iget v5, v5, Landroidx/slice/widget/SliceStyle;->mHeaderSubtitleSize:I

    goto :goto_5

    .line 27
    :cond_a
    iget v5, v5, Landroidx/slice/widget/SliceStyle;->mSubtitleSize:I

    :goto_5
    int-to-float v5, v5

    .line 28
    invoke-virtual {v6, v4, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 29
    iget-object v5, p0, Landroidx/slice/widget/RowView;->mSecondaryText:Landroid/widget/TextView;

    iget-object v6, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-virtual {v6}, Landroidx/slice/widget/RowStyle;->getSubtitleColor()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    iget-boolean v5, p0, Landroidx/slice/widget/RowView;->mIsHeader:Z

    if-eqz v5, :cond_b

    .line 31
    iget-object v5, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 32
    iget v5, v5, Landroidx/slice/widget/SliceStyle;->mVerticalHeaderTextPadding:I

    goto :goto_6

    .line 33
    :cond_b
    iget-object v5, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 34
    iget v5, v5, Landroidx/slice/widget/SliceStyle;->mVerticalTextPadding:I

    .line 35
    :goto_6
    iget-object v6, p0, Landroidx/slice/widget/RowView;->mSecondaryText:Landroid/widget/TextView;

    invoke-virtual {v6, v4, v5, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    :cond_c
    const/4 v5, 0x2

    if-eqz v0, :cond_f

    .line 36
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_d

    .line 37
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " \u00b7 "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 38
    :cond_d
    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 39
    new-instance v6, Landroid/text/style/StyleSpan;

    invoke-direct {v6, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v3, v6, v4, v7, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 40
    iget-object v6, p0, Landroidx/slice/widget/RowView;->mLastUpdatedText:Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    iget-object v3, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz v3, :cond_f

    .line 42
    iget-object v6, p0, Landroidx/slice/widget/RowView;->mLastUpdatedText:Landroid/widget/TextView;

    iget-boolean v7, p0, Landroidx/slice/widget/RowView;->mIsHeader:Z

    if-eqz v7, :cond_e

    .line 43
    iget v3, v3, Landroidx/slice/widget/SliceStyle;->mHeaderSubtitleSize:I

    goto :goto_7

    .line 44
    :cond_e
    iget v3, v3, Landroidx/slice/widget/SliceStyle;->mSubtitleSize:I

    :goto_7
    int-to-float v3, v3

    .line 45
    invoke-virtual {v6, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 46
    iget-object v3, p0, Landroidx/slice/widget/RowView;->mLastUpdatedText:Landroid/widget/TextView;

    iget-object v6, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-virtual {v6}, Landroidx/slice/widget/RowStyle;->getSubtitleColor()I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    :cond_f
    iget-object v3, p0, Landroidx/slice/widget/RowView;->mLastUpdatedText:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    const/16 v7, 0x8

    if-eqz v6, :cond_10

    move v6, v7

    goto :goto_8

    :cond_10
    move v6, v4

    :goto_8
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 48
    iget-object v3, p0, Landroidx/slice/widget/RowView;->mSecondaryText:Landroid/widget/TextView;

    if-eqz v2, :cond_11

    move v7, v4

    :cond_11
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 49
    iget-object v3, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 50
    iget-boolean v3, v3, Landroidx/slice/widget/RowContent;->mIsHeader:Z

    if-eqz v3, :cond_13

    .line 51
    iget-boolean v3, p0, Landroidx/slice/widget/RowView;->mAllowTwoLines:Z

    if-eqz v3, :cond_12

    goto :goto_9

    :cond_12
    move v3, v4

    goto :goto_a

    :cond_13
    :goto_9
    move v3, v1

    :goto_a
    if-eqz v3, :cond_14

    if-nez p1, :cond_14

    if-eqz v2, :cond_14

    .line 52
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_14

    goto :goto_b

    :cond_14
    move v5, v1

    .line 53
    :goto_b
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mSecondaryText:Landroid/widget/TextView;

    if-ne v5, v1, :cond_15

    goto :goto_c

    :cond_15
    move v1, v4

    :goto_c
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 54
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mSecondaryText:Landroid/widget/TextView;

    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 55
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mSecondaryText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->requestLayout()V

    .line 56
    iget-object p0, p0, Landroidx/slice/widget/RowView;->mLastUpdatedText:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->requestLayout()V

    :cond_16
    :goto_d
    return-void
.end method

.method public final getRowContentHeight()I
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    iget-object v1, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    iget-object v2, p0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-virtual {v0, v1, v2}, Landroidx/slice/widget/RowContent;->getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result v0

    .line 2
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-nez v1, :cond_0

    .line 3
    iget-object v1, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 4
    iget v1, v1, Landroidx/slice/widget/SliceStyle;->mRowRangeHeight:I

    sub-int/2addr v0, v1

    .line 5
    :cond_0
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    if-eqz v1, :cond_1

    .line 6
    iget-object p0, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 7
    iget p0, p0, Landroidx/slice/widget/SliceStyle;->mRowSelectionHeight:I

    sub-int/2addr v0, p0

    :cond_1
    return v0
.end method

.method public final measureChildWithExactHeight(Landroid/view/View;II)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "child",
            "widthMeasureSpec",
            "childHeight"
        }
    .end annotation

    .line 1
    iget v0, p0, Landroidx/slice/widget/SliceChildView;->mInsetTop:I

    add-int/2addr p3, v0

    iget v0, p0, Landroidx/slice/widget/SliceChildView;->mInsetBottom:I

    add-int/2addr p3, v0

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p3, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p3

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->measureChild(Landroid/view/View;II)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    if-eqz v0, :cond_b

    .line 2
    iget-object v1, v0, Landroidx/slice/core/SliceActionImpl;->mActionItem:Landroidx/slice/SliceItem;

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 3
    :cond_0
    invoke-virtual {v0}, Landroidx/slice/core/SliceActionImpl;->getSubtype()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 4
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    invoke-virtual {v0}, Landroidx/slice/core/SliceActionImpl;->getSubtype()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x1

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v3, "date_picker"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_1
    const-string v3, "time_picker"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    move v2, v4

    goto :goto_0

    :sswitch_2
    const-string v3, "toggle"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 5
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mActions:Landroid/util/ArrayMap;

    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    invoke-virtual {v0, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/slice/widget/SliceActionView;

    goto :goto_1

    .line 6
    :pswitch_0
    invoke-virtual {p0, v4}, Landroidx/slice/widget/RowView;->onClickPicker(Z)V

    return-void

    .line 7
    :pswitch_1
    invoke-virtual {p0, v1}, Landroidx/slice/widget/RowView;->onClickPicker(Z)V

    return-void

    .line 8
    :pswitch_2
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mToggles:Landroid/util/ArrayMap;

    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    invoke-virtual {v0, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/slice/widget/SliceActionView;

    goto :goto_1

    .line 9
    :cond_4
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mActions:Landroid/util/ArrayMap;

    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    invoke-virtual {v0, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/slice/widget/SliceActionView;

    :goto_1
    if-eqz v0, :cond_7

    .line 10
    instance-of p1, p1, Landroidx/slice/widget/SliceActionView;

    if-nez p1, :cond_7

    .line 11
    iget-object p0, v0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    if-nez p0, :cond_5

    goto/16 :goto_2

    .line 12
    :cond_5
    invoke-virtual {p0}, Landroidx/slice/core/SliceActionImpl;->isToggle()Z

    move-result p0

    if-eqz p0, :cond_6

    .line 13
    iget-object p0, v0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    if-eqz p0, :cond_b

    iget-object p0, v0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    if-eqz p0, :cond_b

    invoke-virtual {p0}, Landroidx/slice/core/SliceActionImpl;->isToggle()Z

    move-result p0

    if-eqz p0, :cond_b

    .line 14
    iget-object p0, v0, Landroidx/slice/widget/SliceActionView;->mActionView:Landroid/view/View;

    check-cast p0, Landroid/widget/Checkable;

    invoke-interface {p0}, Landroid/widget/Checkable;->toggle()V

    goto :goto_2

    .line 15
    :cond_6
    invoke-virtual {v0}, Landroidx/slice/widget/SliceActionView;->sendActionInternal()V

    goto :goto_2

    .line 16
    :cond_7
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 17
    iget-boolean p1, p1, Landroidx/slice/widget/RowContent;->mIsHeader:Z

    if-eqz p1, :cond_8

    .line 18
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->performClick()Z

    goto :goto_2

    .line 19
    :cond_8
    :try_start_0
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 20
    iget-object p1, p1, Landroidx/slice/core/SliceActionImpl;->mActionItem:Landroidx/slice/SliceItem;

    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Landroidx/slice/SliceItem;->fireActionInternal(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p1

    iput-boolean p1, p0, Landroidx/slice/widget/RowView;->mShowActionSpinner:Z

    .line 22
    iget-object p1, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    if-eqz p1, :cond_9

    .line 23
    new-instance p1, Landroidx/slice/widget/EventInfo;

    invoke-virtual {p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v0

    const/4 v2, 0x3

    iget v3, p0, Landroidx/slice/widget/RowView;->mRowIndex:I

    invoke-direct {p1, v0, v2, v1, v3}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    .line 24
    iget-object v0, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    iget-object v1, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 25
    iget-object v1, v1, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 26
    invoke-interface {v0, p1, v1}, Landroidx/slice/widget/SliceView$OnSliceActionListener;->onSliceAction(Landroidx/slice/widget/EventInfo;Landroidx/slice/SliceItem;)V

    .line 27
    :cond_9
    iget-boolean p1, p0, Landroidx/slice/widget/RowView;->mShowActionSpinner:Z

    if-eqz p1, :cond_a

    iget-object p1, p0, Landroidx/slice/widget/SliceChildView;->mLoadingListener:Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;

    if-eqz p1, :cond_a

    .line 28
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 29
    iget-object v0, v0, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 30
    iget v1, p0, Landroidx/slice/widget/RowView;->mRowIndex:I

    check-cast p1, Landroidx/slice/widget/SliceAdapter;

    invoke-virtual {p1, v0, v1}, Landroidx/slice/widget/SliceAdapter;->onSliceActionLoading(Landroidx/slice/SliceItem;I)V

    .line 31
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mLoadingActions:Ljava/util/Set;

    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 32
    iget-object v0, v0, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 33
    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 34
    :cond_a
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->updateActionSpinner()V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    const-string p1, "RowView"

    const-string v0, "PendingIntent for slice cannot be sent"

    .line 35
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_b
    :goto_2
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x33c144ac -> :sswitch_2
        0x2d3f6240 -> :sswitch_1
        0x4a87b63f -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final onClickPicker(Z)V
    .locals 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "isDatePicker"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ASDF"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 3
    iget-object v2, v2, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 6
    iget-object v0, v0, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    const-string v1, "long"

    const-string v2, "millis"

    .line 7
    invoke-static {v0, v1, v2}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 8
    :cond_1
    iget v1, p0, Landroidx/slice/widget/RowView;->mRowIndex:I

    .line 9
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 10
    new-instance v3, Ljava/util/Date;

    invoke-virtual {v0}, Landroidx/slice/SliceItem;->getLong()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    if-eqz p1, :cond_2

    .line 11
    new-instance p1, Landroid/app/DatePickerDialog;

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f1200f7

    new-instance v9, Landroidx/slice/widget/RowView$DateSetListener;

    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 13
    iget-object v0, v0, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 14
    invoke-direct {v9, p0, v0, v1}, Landroidx/slice/widget/RowView$DateSetListener;-><init>(Landroidx/slice/widget/RowView;Landroidx/slice/SliceItem;I)V

    const/4 p0, 0x1

    .line 15
    invoke-virtual {v2, p0}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/4 p0, 0x2

    .line 16
    invoke-virtual {v2, p0}, Ljava/util/Calendar;->get(I)I

    move-result v11

    const/4 p0, 0x5

    .line 17
    invoke-virtual {v2, p0}, Ljava/util/Calendar;->get(I)I

    move-result v12

    move-object v6, p1

    invoke-direct/range {v6 .. v12}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;ILandroid/app/DatePickerDialog$OnDateSetListener;III)V

    .line 18
    invoke-virtual {p1}, Landroid/app/DatePickerDialog;->show()V

    goto :goto_0

    .line 19
    :cond_2
    new-instance p1, Landroid/app/TimePickerDialog;

    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1200f7

    new-instance v5, Landroidx/slice/widget/RowView$TimeSetListener;

    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 21
    iget-object v0, v0, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 22
    invoke-direct {v5, p0, v0, v1}, Landroidx/slice/widget/RowView$TimeSetListener;-><init>(Landroidx/slice/widget/RowView;Landroidx/slice/SliceItem;I)V

    const/16 p0, 0xb

    .line 23
    invoke-virtual {v2, p0}, Ljava/util/Calendar;->get(I)I

    move-result p0

    const/16 v0, 0xc

    .line 24
    invoke-virtual {v2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v6

    const/4 v7, 0x0

    move-object v0, p1

    move-object v1, v3

    move v2, v4

    move-object v3, v5

    move v4, p0

    move v5, v6

    move v6, v7

    invoke-direct/range {v0 .. v6}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;ILandroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    .line 25
    invoke-virtual {p1}, Landroid/app/TimePickerDialog;->show()V

    :goto_0
    return-void
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "parent",
            "view",
            "position",
            "id"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Landroidx/slice/widget/RowView;->mSelectionItem:Landroidx/slice/SliceItem;

    if-eqz p2, :cond_3

    iget-object p2, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    if-ne p1, p2, :cond_3

    if-ltz p3, :cond_3

    iget-object p1, p0, Landroidx/slice/widget/RowView;->mSelectionOptionKeys:Ljava/util/ArrayList;

    .line 2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lt p3, p1, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget-object p1, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    if-eqz p1, :cond_1

    .line 4
    new-instance p1, Landroidx/slice/widget/EventInfo;

    invoke-virtual {p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result p2

    const/4 p4, 0x5

    const/4 p5, 0x6

    iget v0, p0, Landroidx/slice/widget/RowView;->mRowIndex:I

    invoke-direct {p1, p2, p4, p5, v0}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    .line 5
    iget-object p2, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    iget-object p4, p0, Landroidx/slice/widget/RowView;->mSelectionItem:Landroidx/slice/SliceItem;

    invoke-interface {p2, p1, p4}, Landroidx/slice/widget/SliceView$OnSliceActionListener;->onSliceAction(Landroidx/slice/widget/EventInfo;Landroidx/slice/SliceItem;)V

    .line 6
    :cond_1
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mSelectionOptionKeys:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 7
    :try_start_0
    iget-object p2, p0, Landroidx/slice/widget/RowView;->mSelectionItem:Landroidx/slice/SliceItem;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    new-instance p4, Landroid/content/Intent;

    invoke-direct {p4}, Landroid/content/Intent;-><init>()V

    const/high16 p5, 0x10000000

    .line 8
    invoke-virtual {p4, p5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object p4

    const-string p5, "android.app.slice.extra.SELECTION"

    .line 9
    invoke-virtual {p4, p5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 10
    invoke-virtual {p2, p3, p1}, Landroidx/slice/SliceItem;->fireActionInternal(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Landroidx/slice/widget/RowView;->mShowActionSpinner:Z

    .line 12
    iget-object p1, p0, Landroidx/slice/widget/SliceChildView;->mLoadingListener:Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;

    if-eqz p1, :cond_2

    .line 13
    iget-object p2, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 14
    iget-object p2, p2, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 15
    iget p3, p0, Landroidx/slice/widget/RowView;->mRowIndex:I

    check-cast p1, Landroidx/slice/widget/SliceAdapter;

    invoke-virtual {p1, p2, p3}, Landroidx/slice/widget/SliceAdapter;->onSliceActionLoading(Landroidx/slice/SliceItem;I)V

    .line 16
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mLoadingActions:Ljava/util/Set;

    iget-object p2, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 17
    iget-object p2, p2, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 18
    invoke-interface {p1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 19
    :cond_2
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->updateActionSpinner()V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "RowView"

    const-string p2, "PendingIntent for slice cannot be sent"

    .line 20
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 1
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
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    move-result p1

    .line 2
    iget-object p2, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    iget p3, p0, Landroidx/slice/widget/SliceChildView;->mInsetTop:I

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result p4

    add-int/2addr p4, p1

    .line 3
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->getRowContentHeight()I

    move-result p5

    iget v0, p0, Landroidx/slice/widget/SliceChildView;->mInsetTop:I

    add-int/2addr p5, v0

    .line 4
    invoke-virtual {p2, p1, p3, p4, p5}, Landroid/widget/LinearLayout;->layout(IIII)V

    .line 5
    iget-object p2, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    if-eqz p2, :cond_0

    iget-object p2, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-nez p2, :cond_0

    .line 6
    iget-object p2, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 7
    iget p2, p2, Landroidx/slice/widget/SliceStyle;->mRowRangeHeight:I

    .line 8
    iget p3, p0, Landroidx/slice/widget/RowView;->mMeasuredRangeHeight:I

    sub-int/2addr p2, p3

    div-int/lit8 p2, p2, 0x2

    .line 9
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->getRowContentHeight()I

    move-result p3

    add-int/2addr p3, p2

    iget p2, p0, Landroidx/slice/widget/SliceChildView;->mInsetTop:I

    add-int/2addr p3, p2

    .line 10
    iget p2, p0, Landroidx/slice/widget/RowView;->mMeasuredRangeHeight:I

    add-int/2addr p2, p3

    .line 11
    iget-object p0, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p4

    add-int/2addr p4, p1

    invoke-virtual {p0, p1, p3, p4, p2}, Landroid/view/View;->layout(IIII)V

    goto :goto_0

    .line 12
    :cond_0
    iget-object p2, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    if-eqz p2, :cond_1

    .line 13
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->getRowContentHeight()I

    move-result p2

    iget p3, p0, Landroidx/slice/widget/SliceChildView;->mInsetTop:I

    add-int/2addr p2, p3

    .line 14
    iget-object p3, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    invoke-virtual {p3}, Landroid/widget/Spinner;->getMeasuredHeight()I

    move-result p3

    add-int/2addr p3, p2

    .line 15
    iget-object p0, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    .line 16
    invoke-virtual {p0}, Landroid/widget/Spinner;->getMeasuredWidth()I

    move-result p4

    add-int/2addr p4, p1

    .line 17
    invoke-virtual {p0, p1, p2, p4, p3}, Landroid/widget/Spinner;->layout(IIII)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 4
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
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->getRowContentHeight()I

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 2
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 3
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1, p1, p2}, Landroidx/slice/widget/RowView;->measureChildWithExactHeight(Landroid/view/View;II)V

    .line 4
    iget-object p2, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result p2

    goto :goto_0

    .line 5
    :cond_0
    iget-object p2, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    move p2, v0

    .line 6
    :goto_0
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    if-eqz v1, :cond_1

    iget-object v2, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-nez v2, :cond_1

    .line 7
    iget-object v2, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 8
    iget v2, v2, Landroidx/slice/widget/SliceStyle;->mRowRangeHeight:I

    .line 9
    invoke-virtual {p0, v1, p1, v2}, Landroidx/slice/widget/RowView;->measureChildWithExactHeight(Landroid/view/View;II)V

    .line 10
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    iput v1, p0, Landroidx/slice/widget/RowView;->mMeasuredRangeHeight:I

    .line 11
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result p2

    goto :goto_1

    .line 12
    :cond_1
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    if-eqz v1, :cond_2

    .line 13
    iget-object v2, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 14
    iget v2, v2, Landroidx/slice/widget/SliceStyle;->mRowSelectionHeight:I

    .line 15
    invoke-virtual {p0, v1, p1, v2}, Landroidx/slice/widget/RowView;->measureChildWithExactHeight(Landroid/view/View;II)V

    .line 16
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getMeasuredWidth()I

    move-result v1

    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 17
    :cond_2
    :goto_1
    iget v1, p0, Landroidx/slice/widget/SliceChildView;->mInsetStart:I

    add-int/2addr p2, v1

    iget v1, p0, Landroidx/slice/widget/SliceChildView;->mInsetEnd:I

    add-int/2addr p2, v1

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getSuggestedMinimumWidth()I

    move-result v1

    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 18
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    if-eqz v1, :cond_3

    iget-object v2, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    iget-object v3, p0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-virtual {v1, v2, v3}, Landroidx/slice/widget/RowContent;->getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result v1

    goto :goto_2

    :cond_3
    move v1, v0

    .line 19
    :goto_2
    invoke-static {p2, p1, v0}, Landroid/widget/FrameLayout;->resolveSizeAndState(III)I

    move-result p1

    iget p2, p0, Landroidx/slice/widget/SliceChildView;->mInsetTop:I

    add-int/2addr v1, p2

    iget p2, p0, Landroidx/slice/widget/SliceChildView;->mInsetBottom:I

    add-int/2addr v1, p2

    invoke-virtual {p0, p1, v1}, Landroid/widget/FrameLayout;->setMeasuredDimension(II)V

    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parent"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method

.method public final populateViews(Z)V
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "isUpdate"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    .line 1
    iget-boolean p1, p0, Landroidx/slice/widget/RowView;->mIsRangeSliding:Z

    if-eqz p1, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    if-nez p1, :cond_1

    .line 2
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->resetViewState()V

    .line 3
    :cond_1
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    invoke-virtual {v2}, Landroidx/slice/widget/SliceContent;->getLayoutDir()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2

    .line 4
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    invoke-virtual {v2}, Landroidx/slice/widget/SliceContent;->getLayoutDir()I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 5
    :cond_2
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    invoke-virtual {v2}, Landroidx/slice/widget/RowContent;->isDefaultSeeMore()Z

    move-result v2

    const/16 v4, 0x8

    if-eqz v2, :cond_5

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v2, 0x7f0d0028

    invoke-virtual {p1, v2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 7
    new-instance v0, Landroidx/slice/widget/RowView$1;

    invoke-direct {v0, p0, p1}, Landroidx/slice/widget/RowView$1;-><init>(Landroidx/slice/widget/RowView;Landroid/widget/Button;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    iget v0, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    if-eq v0, v3, :cond_3

    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(I)V

    .line 10
    :cond_3
    iput-object p1, p0, Landroidx/slice/widget/RowView;->mSeeMoreView:Landroid/view/View;

    .line 11
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 12
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mLoadingActions:Ljava/util/Set;

    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 13
    iget-object v2, v2, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 14
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 15
    iput-boolean v1, p0, Landroidx/slice/widget/RowView;->mShowActionSpinner:Z

    .line 16
    invoke-virtual {p1, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 17
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->updateActionSpinner()V

    :cond_4
    return-void

    .line 18
    :cond_5
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 19
    iget-object v2, v2, Landroidx/slice/widget/SliceContent;->mContentDescr:Landroidx/slice/SliceItem;

    const/4 v5, 0x0

    if-eqz v2, :cond_6

    .line 20
    iget-object v2, v2, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/CharSequence;

    goto :goto_1

    :cond_6
    move-object v2, v5

    :goto_1
    if-eqz v2, :cond_7

    .line 21
    iget-object v6, p0, Landroidx/slice/widget/RowView;->mContent:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v2}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 22
    :cond_7
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 23
    iget-boolean v6, v2, Landroidx/slice/widget/RowContent;->mIsHeader:Z

    if-eqz v6, :cond_8

    iget-boolean v7, v2, Landroidx/slice/widget/RowContent;->mShowTitleItems:Z

    if-nez v7, :cond_8

    move-object v7, v5

    goto :goto_2

    :cond_8
    iget-object v7, v2, Landroidx/slice/widget/RowContent;->mStartItem:Landroidx/slice/SliceItem;

    .line 24
    :goto_2
    iput-object v7, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-eqz v7, :cond_a

    if-eqz v6, :cond_9

    .line 25
    iget-boolean v2, v2, Landroidx/slice/widget/RowContent;->mShowTitleItems:Z

    if-eqz v2, :cond_a

    :cond_9
    move v2, v1

    goto :goto_3

    :cond_a
    move v2, v0

    :goto_3
    if-eqz v2, :cond_b

    .line 26
    iget v2, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    invoke-virtual {p0, v7, v2, v1}, Landroidx/slice/widget/RowView;->addItem(Landroidx/slice/SliceItem;IZ)Z

    move-result v2

    .line 27
    :cond_b
    iget-object v6, p0, Landroidx/slice/widget/RowView;->mStartContainer:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_c

    move v2, v0

    goto :goto_4

    :cond_c
    move v2, v4

    :goto_4
    invoke-virtual {v6, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 28
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 29
    iget-object v2, v2, Landroidx/slice/widget/RowContent;->mTitleItem:Landroidx/slice/SliceItem;

    if-eqz v2, :cond_d

    .line 30
    iget-object v6, p0, Landroidx/slice/widget/RowView;->mPrimaryText:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroidx/slice/SliceItem;->getSanitizedText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    :cond_d
    iget-object v6, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    if-eqz v6, :cond_f

    .line 32
    iget-object v7, p0, Landroidx/slice/widget/RowView;->mPrimaryText:Landroid/widget/TextView;

    iget-boolean v8, p0, Landroidx/slice/widget/RowView;->mIsHeader:Z

    if-eqz v8, :cond_e

    .line 33
    iget v6, v6, Landroidx/slice/widget/SliceStyle;->mHeaderTitleSize:I

    goto :goto_5

    .line 34
    :cond_e
    iget v6, v6, Landroidx/slice/widget/SliceStyle;->mTitleSize:I

    :goto_5
    int-to-float v6, v6

    .line 35
    invoke-virtual {v7, v0, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 36
    iget-object v6, p0, Landroidx/slice/widget/RowView;->mPrimaryText:Landroid/widget/TextView;

    iget-object v7, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-virtual {v7}, Landroidx/slice/widget/RowStyle;->getTitleColor()I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    :cond_f
    iget-object v6, p0, Landroidx/slice/widget/RowView;->mPrimaryText:Landroid/widget/TextView;

    if-eqz v2, :cond_10

    move v7, v0

    goto :goto_6

    :cond_10
    move v7, v4

    :goto_6
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    if-eqz v2, :cond_11

    move v2, v1

    goto :goto_7

    :cond_11
    move v2, v0

    .line 38
    :goto_7
    invoke-virtual {p0, v2}, Landroidx/slice/widget/RowView;->addSubtitle(Z)V

    .line 39
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mBottomDivider:Landroid/view/View;

    iget-object v6, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 40
    iget-boolean v6, v6, Landroidx/slice/widget/RowContent;->mShowBottomDivider:Z

    if-eqz v6, :cond_12

    move v6, v0

    goto :goto_8

    :cond_12
    move v6, v4

    .line 41
    :goto_8
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 42
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 43
    iget-object v2, v2, Landroidx/slice/widget/RowContent;->mPrimaryAction:Landroidx/slice/SliceItem;

    const/4 v6, 0x2

    if-eqz v2, :cond_16

    .line 44
    iget-object v7, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-eq v2, v7, :cond_16

    .line 45
    new-instance v7, Landroidx/slice/core/SliceActionImpl;

    invoke-direct {v7, v2}, Landroidx/slice/core/SliceActionImpl;-><init>(Landroidx/slice/SliceItem;)V

    iput-object v7, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 46
    invoke-virtual {v7}, Landroidx/slice/core/SliceActionImpl;->getSubtype()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_16

    .line 47
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    invoke-virtual {v2}, Landroidx/slice/core/SliceActionImpl;->getSubtype()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_0

    :goto_9
    move v2, v3

    goto :goto_a

    :sswitch_0
    const-string v7, "date_picker"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_13

    goto :goto_9

    :cond_13
    move v2, v6

    goto :goto_a

    :sswitch_1
    const-string v7, "time_picker"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    goto :goto_9

    :cond_14
    move v2, v1

    goto :goto_a

    :sswitch_2
    const-string v7, "toggle"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_15

    goto :goto_9

    :cond_15
    move v2, v0

    :goto_a
    packed-switch v2, :pswitch_data_0

    goto :goto_b

    .line 48
    :pswitch_0
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1, v1}, Landroidx/slice/widget/RowView;->setViewClickable(Landroid/view/View;Z)V

    return-void

    .line 49
    :pswitch_1
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1, v1}, Landroidx/slice/widget/RowView;->setViewClickable(Landroid/view/View;Z)V

    return-void

    .line 50
    :pswitch_2
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    iget v2, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    iget-object v3, p0, Landroidx/slice/widget/RowView;->mEndContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1, v2, v3, v0}, Landroidx/slice/widget/RowView;->addAction(Landroidx/slice/core/SliceActionImpl;ILandroid/view/ViewGroup;Z)V

    .line 51
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1, v1}, Landroidx/slice/widget/RowView;->setViewClickable(Landroid/view/View;Z)V

    return-void

    .line 52
    :cond_16
    :goto_b
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 53
    iget-object v2, v2, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    if-eqz v2, :cond_2f

    .line 54
    iget-object v7, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    if-eqz v7, :cond_17

    .line 55
    iget-object v7, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v7, v1}, Landroidx/slice/widget/RowView;->setViewClickable(Landroid/view/View;Z)V

    .line 56
    :cond_17
    iput-object v2, p0, Landroidx/slice/widget/RowView;->mRangeItem:Landroidx/slice/SliceItem;

    const-string v7, "int"

    const-string v8, "range_mode"

    .line 57
    invoke-static {v2, v7, v8}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v2

    if-eqz v2, :cond_19

    .line 58
    invoke-virtual {v2}, Landroidx/slice/SliceItem;->getInt()I

    move-result v2

    if-ne v2, v6, :cond_18

    move v2, v1

    goto :goto_c

    :cond_18
    move v2, v0

    :goto_c
    iput-boolean v2, p0, Landroidx/slice/widget/RowView;->mIsStarRating:Z

    :cond_19
    if-nez p1, :cond_2e

    .line 59
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRangeItem:Landroidx/slice/SliceItem;

    const-string v2, "min"

    invoke-static {p1, v7, v2}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p1

    if-eqz p1, :cond_1a

    .line 60
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getInt()I

    move-result p1

    goto :goto_d

    :cond_1a
    move p1, v0

    .line 61
    :goto_d
    iput p1, p0, Landroidx/slice/widget/RowView;->mRangeMinValue:I

    .line 62
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRangeItem:Landroidx/slice/SliceItem;

    const-string v9, "max"

    invoke-static {v2, v7, v9}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v2

    .line 63
    iget-boolean v9, p0, Landroidx/slice/widget/RowView;->mIsStarRating:Z

    if-eqz v9, :cond_1b

    const/4 v9, 0x5

    goto :goto_e

    :cond_1b
    const/16 v9, 0x64

    :goto_e
    if-eqz v2, :cond_1c

    .line 64
    invoke-virtual {v2}, Landroidx/slice/SliceItem;->getInt()I

    move-result v9

    .line 65
    :cond_1c
    iput v9, p0, Landroidx/slice/widget/RowView;->mRangeMaxValue:I

    .line 66
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRangeItem:Landroidx/slice/SliceItem;

    const-string v9, "value"

    invoke-static {v2, v7, v9}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v2

    if-eqz v2, :cond_1d

    .line 67
    invoke-virtual {v2}, Landroidx/slice/SliceItem;->getInt()I

    move-result v2

    sub-int/2addr v2, p1

    goto :goto_f

    :cond_1d
    move v2, v0

    .line 68
    :goto_f
    iput v2, p0, Landroidx/slice/widget/RowView;->mRangeValue:I

    .line 69
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mHandler:Landroid/os/Handler;

    if-nez p1, :cond_1e

    .line 70
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Landroidx/slice/widget/RowView;->mHandler:Landroid/os/Handler;

    .line 71
    :cond_1e
    iget-boolean p1, p0, Landroidx/slice/widget/RowView;->mIsStarRating:Z

    const/4 v2, -0x2

    if-eqz p1, :cond_1f

    .line 72
    new-instance p1, Landroid/widget/RatingBar;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/widget/RatingBar;-><init>(Landroid/content/Context;)V

    .line 73
    invoke-virtual {p1}, Landroid/widget/RatingBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    .line 74
    invoke-virtual {v1, v6}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget v4, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v4, v5}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    const/high16 v1, 0x3f800000    # 1.0f

    .line 75
    invoke-virtual {p1, v1}, Landroid/widget/RatingBar;->setStepSize(F)V

    .line 76
    iget v1, p0, Landroidx/slice/widget/RowView;->mRangeMaxValue:I

    invoke-virtual {p1, v1}, Landroid/widget/RatingBar;->setNumStars(I)V

    .line 77
    iget v1, p0, Landroidx/slice/widget/RowView;->mRangeValue:I

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Landroid/widget/RatingBar;->setRating(F)V

    .line 78
    invoke-virtual {p1, v0}, Landroid/widget/RatingBar;->setVisibility(I)V

    .line 79
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v1, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x11

    .line 80
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 81
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 82
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mRatingBarChangeListener:Landroid/widget/RatingBar$OnRatingBarChangeListener;

    invoke-virtual {p1, v2}, Landroid/widget/RatingBar;->setOnRatingBarChangeListener(Landroid/widget/RatingBar$OnRatingBarChangeListener;)V

    .line 85
    iput-object v1, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    goto/16 :goto_17

    .line 86
    :cond_1f
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRangeItem:Landroidx/slice/SliceItem;

    invoke-static {p1, v7, v8}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p1

    if-eqz p1, :cond_20

    .line 87
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getInt()I

    move-result p1

    if-ne p1, v1, :cond_20

    move p1, v1

    goto :goto_10

    :cond_20
    move p1, v0

    .line 88
    :goto_10
    iget-object v6, p0, Landroidx/slice/widget/RowView;->mRangeItem:Landroidx/slice/SliceItem;

    .line 89
    iget-object v6, v6, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v7, "action"

    .line 90
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 91
    iget-object v7, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-nez v7, :cond_21

    move v7, v1

    goto :goto_11

    :cond_21
    move v7, v0

    :goto_11
    if-eqz v6, :cond_23

    if-eqz v7, :cond_22

    .line 92
    new-instance v5, Landroid/widget/SeekBar;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v5, v7}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    goto :goto_13

    .line 93
    :cond_22
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v7, 0x7f0d002a

    invoke-virtual {v5, v7, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/SeekBar;

    .line 94
    iget-object v7, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    if-eqz v7, :cond_27

    .line 95
    iget v7, v7, Landroidx/slice/widget/RowStyle;->mSeekBarInlineWidth:I

    if-eqz v5, :cond_27

    if-ltz v7, :cond_27

    .line 96
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    .line 97
    iput v7, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 98
    invoke-virtual {v5, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_13

    :cond_23
    if-eqz v7, :cond_24

    .line 99
    new-instance v7, Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x1010078

    invoke-direct {v7, v8, v5, v9}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    move-object v5, v7

    goto :goto_12

    .line 100
    :cond_24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v7, 0x7f0d0022

    invoke-virtual {v5, v7, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ProgressBar;

    .line 101
    iget-object v7, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    if-eqz v7, :cond_26

    .line 102
    iget v7, v7, Landroidx/slice/widget/RowStyle;->mProgressBarInlineWidth:I

    if-eqz v5, :cond_25

    if-ltz v7, :cond_25

    .line 103
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    .line 104
    iput v7, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 105
    invoke-virtual {v5, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 106
    :cond_25
    iget-object v7, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    .line 107
    iget v8, v7, Landroidx/slice/widget/RowStyle;->mProgressBarStartPadding:I

    .line 108
    iget v7, v7, Landroidx/slice/widget/RowStyle;->mProgressBarEndPadding:I

    .line 109
    invoke-virtual {p0, v5, v8, v7}, Landroidx/slice/widget/RowView;->setViewSidePaddings(Landroid/view/View;II)V

    :cond_26
    :goto_12
    if-eqz p1, :cond_27

    .line 110
    invoke-virtual {v5, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    :cond_27
    :goto_13
    if-eqz p1, :cond_28

    .line 111
    invoke-virtual {v5}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    goto :goto_14

    .line 112
    :cond_28
    invoke-virtual {v5}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 113
    :goto_14
    iget v8, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    if-eq v8, v3, :cond_2a

    if-eqz v7, :cond_2a

    .line 114
    invoke-virtual {v7, v8}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    if-eqz p1, :cond_29

    .line 115
    invoke-virtual {v5, v7}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_15

    .line 116
    :cond_29
    invoke-virtual {v5, v7}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 117
    :cond_2a
    :goto_15
    iget p1, p0, Landroidx/slice/widget/RowView;->mRangeMaxValue:I

    iget v7, p0, Landroidx/slice/widget/RowView;->mRangeMinValue:I

    sub-int/2addr p1, v7

    invoke-virtual {v5, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 118
    iget p1, p0, Landroidx/slice/widget/RowView;->mRangeValue:I

    invoke-virtual {v5, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 119
    invoke-virtual {v5, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 120
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-nez p1, :cond_2b

    .line 121
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p1, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v5, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_16

    .line 122
    :cond_2b
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mSubContent:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 123
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mContent:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 124
    :goto_16
    iput-object v5, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    if-eqz v6, :cond_2e

    .line 125
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    invoke-virtual {p1}, Landroidx/slice/widget/RowContent;->getInputRangeThumb()Landroidx/slice/SliceItem;

    move-result-object p1

    .line 126
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    check-cast v1, Landroid/widget/SeekBar;

    if-eqz p1, :cond_2c

    .line 127
    iget-object p1, p1, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast p1, Landroidx/core/graphics/drawable/IconCompat;

    if-eqz p1, :cond_2c

    .line 128
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroidx/core/graphics/drawable/IconCompat;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_2c

    .line 129
    invoke-virtual {v1, p1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 130
    :cond_2c
    invoke-virtual {v1}, Landroid/widget/SeekBar;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 131
    iget v2, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    if-eq v2, v3, :cond_2d

    if-eqz p1, :cond_2d

    .line 132
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 133
    invoke-virtual {v1, p1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 134
    :cond_2d
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {v1, p1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 135
    :cond_2e
    :goto_17
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-nez p1, :cond_2f

    return-void

    .line 136
    :cond_2f
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 137
    iget-object p1, p1, Landroidx/slice/widget/RowContent;->mSelection:Landroidx/slice/SliceItem;

    if-eqz p1, :cond_35

    .line 138
    iput-object p1, p0, Landroidx/slice/widget/RowView;->mSelectionItem:Landroidx/slice/SliceItem;

    .line 139
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mHandler:Landroid/os/Handler;

    if-nez v1, :cond_30

    .line 140
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Landroidx/slice/widget/RowView;->mHandler:Landroid/os/Handler;

    .line 141
    :cond_30
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroidx/slice/widget/RowView;->mSelectionOptionKeys:Ljava/util/ArrayList;

    .line 142
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroidx/slice/widget/RowView;->mSelectionOptionValues:Ljava/util/ArrayList;

    .line 143
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/slice/Slice;->getItems()Ljava/util/List;

    move-result-object p1

    move v1, v0

    .line 144
    :goto_18
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_34

    .line 145
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/slice/SliceItem;

    .line 146
    iget-object v3, v2, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v4, "selection_option"

    invoke-static {v3, v4}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_31

    goto :goto_19

    :cond_31
    const-string v3, "text"

    const-string v4, "selection_option_key"

    .line 147
    invoke-static {v2, v3, v4}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v4

    const-string v5, "selection_option_value"

    .line 148
    invoke-static {v2, v3, v5}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v2

    if-eqz v4, :cond_33

    if-nez v2, :cond_32

    goto :goto_19

    .line 149
    :cond_32
    iget-object v3, p0, Landroidx/slice/widget/RowView;->mSelectionOptionKeys:Ljava/util/ArrayList;

    .line 150
    iget-object v4, v4, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v4, Ljava/lang/CharSequence;

    .line 151
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    iget-object v3, p0, Landroidx/slice/widget/RowView;->mSelectionOptionValues:Ljava/util/ArrayList;

    invoke-virtual {v2}, Landroidx/slice/SliceItem;->getSanitizedText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_33
    :goto_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 153
    :cond_34
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v1, 0x7f0d0025

    invoke-virtual {p1, v1, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Spinner;

    iput-object p1, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    .line 154
    new-instance p1, Landroid/widget/ArrayAdapter;

    .line 155
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0d0027

    iget-object v2, p0, Landroidx/slice/widget/RowView;->mSelectionOptionValues:Ljava/util/ArrayList;

    invoke-direct {p1, v0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    const v0, 0x7f0d0026

    .line 156
    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 157
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 158
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 159
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    invoke-virtual {p1, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void

    .line 160
    :cond_35
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->updateEndItems()V

    .line 161
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->updateActionSpinner()V

    return-void

    :sswitch_data_0
    .sparse-switch
        -0x33c144ac -> :sswitch_2
        0x2d3f6240 -> :sswitch_1
        0x4a87b63f -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public resetView()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 2
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mLoadingActions:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 3
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->resetViewState()V

    return-void
.end method

.method public final resetViewState()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 3
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0, v1}, Landroidx/slice/widget/RowView;->setViewClickable(Landroid/view/View;Z)V

    .line 4
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mContent:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0, v1}, Landroidx/slice/widget/RowView;->setViewClickable(Landroid/view/View;Z)V

    .line 5
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mStartContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 6
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mEndContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 7
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mEndContainer:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 8
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mPrimaryText:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mSecondaryText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mLastUpdatedText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mLastUpdatedText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 12
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mToggles:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->clear()V

    .line 13
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mActions:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->clear()V

    .line 14
    iput-object v3, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 15
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mBottomDivider:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 16
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mActionDivider:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 17
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mSeeMoreView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 18
    iget-object v4, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 19
    iput-object v3, p0, Landroidx/slice/widget/RowView;->mSeeMoreView:Landroid/view/View;

    .line 20
    :cond_0
    iput-boolean v1, p0, Landroidx/slice/widget/RowView;->mIsRangeSliding:Z

    .line 21
    iput-object v3, p0, Landroidx/slice/widget/RowView;->mRangeItem:Landroidx/slice/SliceItem;

    .line 22
    iput v1, p0, Landroidx/slice/widget/RowView;->mRangeMinValue:I

    .line 23
    iput v1, p0, Landroidx/slice/widget/RowView;->mRangeMaxValue:I

    .line 24
    iput v1, p0, Landroidx/slice/widget/RowView;->mRangeValue:I

    const-wide/16 v4, 0x0

    .line 25
    iput-wide v4, p0, Landroidx/slice/widget/RowView;->mLastSentRangeUpdate:J

    .line 26
    iput-object v3, p0, Landroidx/slice/widget/RowView;->mHandler:Landroid/os/Handler;

    .line 27
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 28
    iget-object v4, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-nez v4, :cond_1

    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    goto :goto_0

    .line 30
    :cond_1
    iget-object v4, p0, Landroidx/slice/widget/RowView;->mContent:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 31
    :goto_0
    iput-object v3, p0, Landroidx/slice/widget/RowView;->mRangeBar:Landroid/view/View;

    .line 32
    :cond_2
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mSubContent:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 33
    iput-object v3, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    .line 34
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mActionSpinner:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 35
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_3

    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 37
    iput-object v3, p0, Landroidx/slice/widget/RowView;->mSelectionSpinner:Landroid/widget/Spinner;

    .line 38
    :cond_3
    iput-object v3, p0, Landroidx/slice/widget/RowView;->mSelectionItem:Landroidx/slice/SliceItem;

    return-void
.end method

.method public sendSliderValue()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRangeItem:Landroidx/slice/SliceItem;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/slice/widget/RowView;->mLastSentRangeUpdate:J

    .line 3
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRangeItem:Landroidx/slice/SliceItem;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const/high16 v3, 0x10000000

    .line 4
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "android.app.slice.extra.RANGE_VALUE"

    iget v4, p0, Landroidx/slice/widget/RowView;->mRangeValue:I

    .line 5
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v2

    .line 6
    invoke-virtual {v0, v1, v2}, Landroidx/slice/SliceItem;->fireActionInternal(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 7
    iget-object v0, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    if-eqz v0, :cond_1

    .line 8
    new-instance v0, Landroidx/slice/widget/EventInfo;

    invoke-virtual {p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x4

    iget v4, p0, Landroidx/slice/widget/RowView;->mRowIndex:I

    invoke-direct {v0, v1, v2, v3, v4}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    .line 9
    iget v1, p0, Landroidx/slice/widget/RowView;->mRangeValue:I

    iput v1, v0, Landroidx/slice/widget/EventInfo;->state:I

    .line 10
    iget-object v1, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    iget-object p0, p0, Landroidx/slice/widget/RowView;->mRangeItem:Landroidx/slice/SliceItem;

    invoke-interface {v1, v0, p0}, Landroidx/slice/widget/SliceView$OnSliceActionListener;->onSliceAction(Landroidx/slice/widget/EventInfo;Landroidx/slice/SliceItem;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "RowView"

    const-string v1, "PendingIntent for slice cannot be sent"

    .line 11
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public setAllowTwoLines(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "allowTwoLines"
        }
    .end annotation

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/RowView;->mAllowTwoLines:Z

    .line 2
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 3
    invoke-virtual {p0, p1}, Landroidx/slice/widget/RowView;->populateViews(Z)V

    :cond_0
    return-void
.end method

.method public setInsets(IIII)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "l",
            "t",
            "r",
            "b"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/slice/widget/SliceChildView;->mInsetStart:I

    .line 2
    iput p2, p0, Landroidx/slice/widget/SliceChildView;->mInsetTop:I

    .line 3
    iput p3, p0, Landroidx/slice/widget/SliceChildView;->mInsetEnd:I

    .line 4
    iput p4, p0, Landroidx/slice/widget/SliceChildView;->mInsetBottom:I

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    return-void
.end method

.method public setLastUpdated(J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lastUpdated"
        }
    .end annotation

    .line 1
    iput-wide p1, p0, Landroidx/slice/widget/SliceChildView;->mLastUpdated:J

    .line 2
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    if-eqz p1, :cond_1

    .line 3
    iget-object p1, p1, Landroidx/slice/widget/RowContent;->mTitleItem:Landroidx/slice/SliceItem;

    if-eqz p1, :cond_0

    .line 4
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSanitizedText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 5
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/slice/widget/RowView;->addSubtitle(Z)V

    :cond_1
    return-void
.end method

.method public setLoadingActions(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "actions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/slice/SliceItem;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mLoadingActions:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Landroidx/slice/widget/RowView;->mShowActionSpinner:Z

    goto :goto_0

    .line 3
    :cond_0
    iput-object p1, p0, Landroidx/slice/widget/RowView;->mLoadingActions:Ljava/util/Set;

    .line 4
    :goto_0
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->updateEndItems()V

    .line 5
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->updateActionSpinner()V

    return-void
.end method

.method public setShowLastUpdated(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "showLastUpdated"
        }
    .end annotation

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/SliceChildView;->mShowLastUpdated:Z

    .line 2
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 3
    invoke-virtual {p0, p1}, Landroidx/slice/widget/RowView;->populateViews(Z)V

    :cond_0
    return-void
.end method

.method public setSliceActions(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "actions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/slice/core/SliceAction;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/RowView;->mHeaderActions:Ljava/util/List;

    .line 2
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    if-eqz p1, :cond_0

    .line 3
    invoke-virtual {p0}, Landroidx/slice/widget/RowView;->updateEndItems()V

    :cond_0
    return-void
.end method

.method public setSliceItem(Landroidx/slice/widget/SliceContent;ZIILandroidx/slice/widget/SliceView$OnSliceActionListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "content",
            "isHeader",
            "index",
            "rowCount",
            "observer"
        }
    .end annotation

    .line 1
    iput-object p5, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    .line 2
    iget-object p4, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    const/4 p5, 0x0

    if-eqz p4, :cond_3

    invoke-virtual {p4}, Landroidx/slice/widget/RowContent;->isValid()Z

    move-result p4

    if-eqz p4, :cond_3

    .line 3
    iget-object p4, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    if-eqz p4, :cond_0

    .line 4
    new-instance v0, Landroidx/slice/SliceStructure;

    .line 5
    iget-object p4, p4, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 6
    invoke-direct {v0, p4}, Landroidx/slice/SliceStructure;-><init>(Landroidx/slice/SliceItem;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 7
    :goto_0
    new-instance p4, Landroidx/slice/SliceStructure;

    .line 8
    iget-object v1, p1, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 9
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v1

    invoke-direct {p4, v1}, Landroidx/slice/SliceStructure;-><init>(Landroidx/slice/Slice;)V

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 10
    invoke-virtual {v0, p4}, Landroidx/slice/SliceStructure;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    move v2, p5

    :goto_1
    if-eqz v0, :cond_2

    .line 11
    iget-object v0, v0, Landroidx/slice/SliceStructure;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_2

    iget-object p4, p4, Landroidx/slice/SliceStructure;->mUri:Landroid/net/Uri;

    .line 12
    invoke-virtual {v0, p4}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_2

    move p4, v1

    goto :goto_2

    :cond_2
    move p4, p5

    :goto_2
    if-eqz p4, :cond_3

    if-eqz v2, :cond_3

    goto :goto_3

    :cond_3
    move v1, p5

    .line 13
    :goto_3
    iput-boolean p5, p0, Landroidx/slice/widget/RowView;->mShowActionSpinner:Z

    .line 14
    iput-boolean p2, p0, Landroidx/slice/widget/RowView;->mIsHeader:Z

    .line 15
    check-cast p1, Landroidx/slice/widget/RowContent;

    iput-object p1, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 16
    iput p3, p0, Landroidx/slice/widget/RowView;->mRowIndex:I

    .line 17
    invoke-virtual {p0, v1}, Landroidx/slice/widget/RowView;->populateViews(Z)V

    return-void
.end method

.method public setStyle(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/RowStyle;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "styles",
            "rowStyle"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 2
    iput-object p2, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    if-eqz p1, :cond_6

    .line 3
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mStartContainer:Landroid/widget/LinearLayout;

    .line 4
    iget v0, p2, Landroidx/slice/widget/RowStyle;->mTitleItemStartPadding:I

    .line 5
    iget p2, p2, Landroidx/slice/widget/RowStyle;->mTitleItemEndPadding:I

    .line 6
    invoke-virtual {p0, p1, v0, p2}, Landroidx/slice/widget/RowView;->setViewSidePaddings(Landroid/view/View;II)V

    .line 7
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mContent:Landroid/widget/LinearLayout;

    iget-object p2, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    .line 8
    iget v0, p2, Landroidx/slice/widget/RowStyle;->mContentStartPadding:I

    .line 9
    iget p2, p2, Landroidx/slice/widget/RowStyle;->mContentEndPadding:I

    .line 10
    invoke-virtual {p0, p1, v0, p2}, Landroidx/slice/widget/RowView;->setViewSidePaddings(Landroid/view/View;II)V

    .line 11
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mPrimaryText:Landroid/widget/TextView;

    iget-object p2, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    .line 12
    iget v0, p2, Landroidx/slice/widget/RowStyle;->mTitleStartPadding:I

    .line 13
    iget p2, p2, Landroidx/slice/widget/RowStyle;->mTitleEndPadding:I

    .line 14
    invoke-virtual {p0, p1, v0, p2}, Landroidx/slice/widget/RowView;->setViewSidePaddings(Landroid/view/View;II)V

    .line 15
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mSubContent:Landroid/widget/LinearLayout;

    iget-object p2, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    .line 16
    iget v0, p2, Landroidx/slice/widget/RowStyle;->mSubContentStartPadding:I

    .line 17
    iget p2, p2, Landroidx/slice/widget/RowStyle;->mSubContentEndPadding:I

    .line 18
    invoke-virtual {p0, p1, v0, p2}, Landroidx/slice/widget/RowView;->setViewSidePaddings(Landroid/view/View;II)V

    .line 19
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mEndContainer:Landroid/widget/LinearLayout;

    iget-object p2, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    .line 20
    iget v0, p2, Landroidx/slice/widget/RowStyle;->mEndItemStartPadding:I

    .line 21
    iget p2, p2, Landroidx/slice/widget/RowStyle;->mEndItemEndPadding:I

    .line 22
    invoke-virtual {p0, p1, v0, p2}, Landroidx/slice/widget/RowView;->setViewSidePaddings(Landroid/view/View;II)V

    .line 23
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mBottomDivider:Landroid/view/View;

    iget-object p2, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    .line 24
    iget v0, p2, Landroidx/slice/widget/RowStyle;->mBottomDividerStartPadding:I

    .line 25
    iget p2, p2, Landroidx/slice/widget/RowStyle;->mBottomDividerEndPadding:I

    if-gez v0, :cond_0

    if-gez p2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz p1, :cond_4

    if-eqz v1, :cond_1

    goto :goto_1

    .line 26
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-ltz v0, :cond_2

    .line 27
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    :cond_2
    if-ltz p2, :cond_3

    .line 28
    invoke-virtual {v1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 29
    :cond_3
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    :cond_4
    :goto_1
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mActionDivider:Landroid/view/View;

    iget-object p2, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    .line 31
    iget p2, p2, Landroidx/slice/widget/RowStyle;->mActionDividerHeight:I

    if-eqz p1, :cond_5

    if-ltz p2, :cond_5

    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 33
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    :cond_5
    iget-object p1, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-virtual {p1}, Landroidx/slice/widget/RowStyle;->getTintColor()I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_6

    .line 36
    iget-object p1, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    invoke-virtual {p1}, Landroidx/slice/widget/RowStyle;->getTintColor()I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/slice/widget/RowView;->setTint(I)V

    :cond_6
    return-void
.end method

.method public setTint(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tintColor"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    .line 2
    iget-object p1, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 3
    invoke-virtual {p0, p1}, Landroidx/slice/widget/RowView;->populateViews(Z)V

    :cond_0
    return-void
.end method

.method public final setViewClickable(Landroid/view/View;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "layout",
            "isClickable"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    move-object v1, p0

    goto :goto_0

    :cond_0
    move-object v1, v0

    .line 1
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p2, :cond_1

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x101030e

    invoke-static {p0, v0}, Landroidx/slice/widget/SliceViewUtil;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 3
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 4
    invoke-virtual {p1, p2}, Landroid/view/View;->setClickable(Z)V

    return-void
.end method

.method public final setViewSidePaddings(Landroid/view/View;II)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "v",
            "start",
            "end"
        }
    .end annotation

    if-gez p2, :cond_0

    if-gez p3, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    if-eqz p1, :cond_4

    if-eqz p0, :cond_1

    goto :goto_3

    :cond_1
    if-ltz p2, :cond_2

    goto :goto_1

    .line 1
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getPaddingStart()I

    move-result p2

    .line 2
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result p0

    if-ltz p3, :cond_3

    goto :goto_2

    .line 3
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getPaddingEnd()I

    move-result p3

    .line 4
    :goto_2
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    .line 5
    invoke-virtual {p1, p2, p0, p3, v0}, Landroid/view/View;->setPaddingRelative(IIII)V

    :cond_4
    :goto_3
    return-void
.end method

.method public updateActionSpinner()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mActionSpinner:Landroid/widget/ProgressBar;

    iget-boolean p0, p0, Landroidx/slice/widget/RowView;->mShowActionSpinner:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/16 p0, 0x8

    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method public final updateEndItems()V
    .locals 12

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    if-eqz v0, :cond_15

    .line 2
    iget-object v0, v0, Landroidx/slice/widget/RowContent;->mRange:Landroidx/slice/SliceItem;

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-nez v0, :cond_0

    goto/16 :goto_b

    .line 4
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mEndContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 5
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 6
    iget-object v1, v0, Landroidx/slice/widget/RowContent;->mEndItems:Ljava/util/ArrayList;

    .line 7
    iget-object v2, p0, Landroidx/slice/widget/RowView;->mHeaderActions:Ljava/util/List;

    if-eqz v2, :cond_1

    move-object v1, v2

    .line 8
    :cond_1
    iget-boolean v0, v0, Landroidx/slice/widget/RowContent;->mIsHeader:Z

    if-eqz v0, :cond_2

    .line 9
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 10
    iget-boolean v0, v0, Landroidx/slice/widget/RowContent;->mShowTitleItems:Z

    if-nez v0, :cond_2

    .line 11
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    const/4 v0, 0x0

    const/4 v2, 0x0

    move-object v6, v0

    move v3, v2

    move v4, v3

    move v5, v4

    move v7, v5

    .line 12
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    const-string v9, "action"

    const/4 v10, 0x1

    if-ge v3, v8, :cond_8

    .line 13
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    instance-of v8, v8, Landroidx/slice/SliceItem;

    if-eqz v8, :cond_3

    .line 14
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/slice/SliceItem;

    goto :goto_1

    .line 15
    :cond_3
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/slice/core/SliceActionImpl;

    .line 16
    iget-object v8, v8, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    :goto_1
    const/4 v11, 0x3

    if-ge v4, v11, :cond_7

    .line 17
    iget v11, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    invoke-virtual {p0, v8, v11, v2}, Landroidx/slice/widget/RowView;->addItem(Landroidx/slice/SliceItem;IZ)Z

    move-result v11

    if-eqz v11, :cond_7

    if-nez v6, :cond_4

    .line 18
    invoke-static {v8, v9}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v11

    if-eqz v11, :cond_4

    move-object v6, v8

    :cond_4
    add-int/lit8 v4, v4, 0x1

    if-ne v4, v10, :cond_7

    .line 19
    iget-object v5, p0, Landroidx/slice/widget/RowView;->mToggles:Landroid/util/ArrayMap;

    invoke-virtual {v5}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_5

    .line 20
    invoke-virtual {v8}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v5

    const-string v7, "image"

    .line 21
    invoke-static {v5, v7, v0, v0}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v5

    if-nez v5, :cond_5

    move v5, v10

    goto :goto_2

    :cond_5
    move v5, v2

    .line 22
    :goto_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    if-ne v7, v10, :cond_6

    .line 23
    invoke-static {v8, v9}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v7

    if-eqz v7, :cond_6

    move v7, v10

    goto :goto_3

    :cond_6
    move v7, v2

    :cond_7
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 24
    :cond_8
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mEndContainer:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    if-lez v4, :cond_9

    move v3, v2

    goto :goto_4

    :cond_9
    move v3, v1

    :goto_4
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 25
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mActionDivider:Landroid/view/View;

    iget-object v3, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    if-eqz v3, :cond_b

    if-nez v5, :cond_a

    iget-object v3, p0, Landroidx/slice/widget/RowView;->mRowContent:Landroidx/slice/widget/RowContent;

    .line 26
    iget-boolean v3, v3, Landroidx/slice/widget/RowContent;->mShowActionDivider:Z

    if-eqz v3, :cond_b

    if-eqz v7, :cond_b

    :cond_a
    move v1, v2

    .line 27
    :cond_b
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mStartItem:Landroidx/slice/SliceItem;

    if-eqz v0, :cond_c

    .line 29
    invoke-static {v0, v9}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    if-eqz v0, :cond_c

    move v0, v10

    goto :goto_5

    :cond_c
    move v0, v2

    :goto_5
    if-eqz v6, :cond_d

    move v1, v10

    goto :goto_6

    :cond_d
    move v1, v2

    .line 30
    :goto_6
    iget-object v3, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    if-eqz v3, :cond_e

    .line 31
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0, v10}, Landroidx/slice/widget/RowView;->setViewClickable(Landroid/view/View;Z)V

    goto :goto_8

    :cond_e
    if-eq v1, v0, :cond_12

    if-eq v4, v10, :cond_f

    if-eqz v0, :cond_12

    .line 32
    :cond_f
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mToggles:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10

    .line 33
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mToggles:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/slice/core/SliceActionImpl;

    iput-object v0, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    goto :goto_7

    .line 34
    :cond_10
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mActions:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p0, Landroidx/slice/widget/RowView;->mActions:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    move-result v0

    if-ne v0, v10, :cond_11

    .line 35
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mActions:Landroid/util/ArrayMap;

    invoke-virtual {v0, v2}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/slice/widget/SliceActionView;

    .line 36
    iget-object v0, v0, Landroidx/slice/widget/SliceActionView;->mSliceAction:Landroidx/slice/core/SliceActionImpl;

    .line 37
    iput-object v0, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    .line 38
    :cond_11
    :goto_7
    iget-object v0, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0, v10}, Landroidx/slice/widget/RowView;->setViewClickable(Landroid/view/View;Z)V

    move v0, v10

    goto :goto_9

    :cond_12
    :goto_8
    move v0, v2

    .line 39
    :goto_9
    iget-object v1, p0, Landroidx/slice/widget/RowView;->mRowAction:Landroidx/slice/core/SliceActionImpl;

    if-eqz v1, :cond_13

    if-nez v0, :cond_13

    iget-object v0, p0, Landroidx/slice/widget/RowView;->mLoadingActions:Ljava/util/Set;

    .line 40
    iget-object v1, v1, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 41
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 42
    iput-boolean v10, p0, Landroidx/slice/widget/RowView;->mShowActionSpinner:Z

    .line 43
    :cond_13
    iget-object p0, p0, Landroidx/slice/widget/RowView;->mRootView:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_14

    goto :goto_a

    :cond_14
    const/4 v2, 0x2

    :goto_a
    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 44
    invoke-virtual {p0, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_15
    :goto_b
    return-void
.end method
