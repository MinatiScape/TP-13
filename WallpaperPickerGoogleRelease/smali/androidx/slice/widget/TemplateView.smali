.class public Landroidx/slice/widget/TemplateView;
.super Landroidx/slice/widget/SliceChildView;
.source "SourceFile"

# interfaces
.implements Landroidx/slice/widget/SliceViewPolicy$PolicyChangeListener;


# instance fields
.field public mAdapter:Landroidx/slice/widget/SliceAdapter;

.field public mDisplayedItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/slice/widget/SliceContent;",
            ">;"
        }
    .end annotation
.end field

.field public mDisplayedItemsHeight:I

.field public final mForeground:Landroid/view/View;

.field public mListContent:Landroidx/slice/widget/ListContent;

.field public mLoc:[I

.field public mParent:Landroidx/slice/widget/SliceView;

.field public final mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
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
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/slice/widget/TemplateView;->mDisplayedItems:Ljava/util/List;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Landroidx/slice/widget/TemplateView;->mDisplayedItemsHeight:I

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 4
    iput-object v0, p0, Landroidx/slice/widget/TemplateView;->mLoc:[I

    .line 5
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/slice/widget/TemplateView;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 7
    new-instance v1, Landroidx/slice/widget/SliceAdapter;

    invoke-direct {v1, p1}, Landroidx/slice/widget/SliceAdapter;-><init>(Landroid/content/Context;)V

    .line 8
    iput-object v1, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 9
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 10
    new-instance v1, Landroidx/slice/widget/SliceAdapter;

    invoke-direct {v1, p1}, Landroidx/slice/widget/SliceAdapter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 11
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 13
    new-instance p1, Landroid/view/View;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Landroidx/slice/widget/TemplateView;->mForeground:Landroid/view/View;

    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x101030e

    invoke-static {v0, v1}, Landroidx/slice/widget/SliceViewUtil;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    .line 17
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 18
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 19
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public getLoadingActions()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 2
    iget-object p0, p0, Landroidx/slice/widget/SliceAdapter;->mLoadingActions:Ljava/util/Set;

    return-object p0
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroidx/slice/widget/SliceView;

    iput-object v0, p0, Landroidx/slice/widget/TemplateView;->mParent:Landroidx/slice/widget/SliceView;

    .line 3
    iget-object v1, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 4
    iput-object v0, v1, Landroidx/slice/widget/SliceAdapter;->mParent:Landroidx/slice/widget/SliceView;

    .line 5
    iput-object p0, v1, Landroidx/slice/widget/SliceAdapter;->mTemplateView:Landroidx/slice/widget/TemplateView;

    return-void
.end method

.method public onMeasure(II)V
    .locals 2
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
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 2
    iget-object v1, p0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 3
    iget-boolean v1, v1, Landroidx/slice/widget/SliceViewPolicy;->mScrollable:Z

    if-nez v1, :cond_0

    .line 4
    iget-object v1, p0, Landroidx/slice/widget/TemplateView;->mDisplayedItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    iget v1, p0, Landroidx/slice/widget/TemplateView;->mDisplayedItemsHeight:I

    if-eq v1, v0, :cond_0

    .line 5
    invoke-virtual {p0, v0}, Landroidx/slice/widget/TemplateView;->updateDisplayedItems(I)V

    .line 6
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void
.end method

.method public resetView()V
    .locals 4

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Landroidx/slice/widget/TemplateView;->mDisplayedItemsHeight:I

    .line 2
    iget-object v0, p0, Landroidx/slice/widget/TemplateView;->mDisplayedItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 3
    iget-object v0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    invoke-virtual {p0}, Landroidx/slice/widget/SliceChildView;->getMode()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3, v1}, Landroidx/slice/widget/SliceAdapter;->setSliceItems(Ljava/util/List;II)V

    .line 4
    iput-object v2, p0, Landroidx/slice/widget/TemplateView;->mListContent:Landroidx/slice/widget/ListContent;

    return-void
.end method

.method public setActionLoading(Landroidx/slice/SliceItem;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "item"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/slice/widget/SliceAdapter;->onSliceActionLoading(Landroidx/slice/SliceItem;I)V

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
    iget-object p0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 2
    iput-boolean p1, p0, Landroidx/slice/widget/SliceAdapter;->mAllowTwoLines:Z

    .line 3
    invoke-virtual {p0}, Landroidx/slice/widget/SliceAdapter;->notifyHeaderChanged()V

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
    iget-object p0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 6
    iput p1, p0, Landroidx/slice/widget/SliceAdapter;->mInsetStart:I

    .line 7
    iput p2, p0, Landroidx/slice/widget/SliceAdapter;->mInsetTop:I

    .line 8
    iput p3, p0, Landroidx/slice/widget/SliceAdapter;->mInsetEnd:I

    .line 9
    iput p4, p0, Landroidx/slice/widget/SliceAdapter;->mInsetBottom:I

    return-void
.end method

.method public setLastUpdated(J)V
    .locals 2
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
    iget-object p0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 3
    iget-wide v0, p0, Landroidx/slice/widget/SliceAdapter;->mLastUpdated:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 4
    iput-wide p1, p0, Landroidx/slice/widget/SliceAdapter;->mLastUpdated:J

    .line 5
    invoke-virtual {p0}, Landroidx/slice/widget/SliceAdapter;->notifyHeaderChanged()V

    :cond_0
    return-void
.end method

.method public setLoadingActions(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loadingActions"
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

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    if-nez p1, :cond_0

    .line 2
    iget-object p1, p0, Landroidx/slice/widget/SliceAdapter;->mLoadingActions:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    goto :goto_0

    .line 3
    :cond_0
    iput-object p1, p0, Landroidx/slice/widget/SliceAdapter;->mLoadingActions:Ljava/util/Set;

    .line 4
    :goto_0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyChanged()V

    return-void
.end method

.method public setPolicy(Landroidx/slice/widget/SliceViewPolicy;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "policy"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 2
    iget-object v0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 3
    iput-object p1, v0, Landroidx/slice/widget/SliceAdapter;->mPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 4
    iput-object p0, p1, Landroidx/slice/widget/SliceViewPolicy;->mListener:Landroidx/slice/widget/SliceViewPolicy$PolicyChangeListener;

    return-void
.end method

.method public setShowLastUpdated(Z)V
    .locals 1
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
    iget-object p0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 3
    iget-boolean v0, p0, Landroidx/slice/widget/SliceAdapter;->mShowLastUpdated:Z

    if-eq v0, p1, :cond_0

    .line 4
    iput-boolean p1, p0, Landroidx/slice/widget/SliceAdapter;->mShowLastUpdated:Z

    .line 5
    invoke-virtual {p0}, Landroidx/slice/widget/SliceAdapter;->notifyHeaderChanged()V

    :cond_0
    return-void
.end method

.method public setSliceActionListener(Landroidx/slice/widget/SliceView$OnSliceActionListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "observer"
        }
    .end annotation

    const/4 p1, 0x0

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    .line 2
    iget-object p0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    if-eqz p0, :cond_0

    .line 3
    iput-object p1, p0, Landroidx/slice/widget/SliceAdapter;->mSliceObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

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
    iget-object p0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 2
    iput-object p1, p0, Landroidx/slice/widget/SliceAdapter;->mSliceActions:Ljava/util/List;

    .line 3
    invoke-virtual {p0}, Landroidx/slice/widget/SliceAdapter;->notifyHeaderChanged()V

    return-void
.end method

.method public setSliceContent(Landroidx/slice/widget/ListContent;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sliceContent"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/TemplateView;->mListContent:Landroidx/slice/widget/ListContent;

    .line 2
    iget-object v0, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    iget-object v1, p0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-virtual {p1, v0, v1}, Landroidx/slice/widget/ListContent;->getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result p1

    .line 3
    invoke-virtual {p0, p1}, Landroidx/slice/widget/TemplateView;->updateDisplayedItems(I)V

    return-void
.end method

.method public setStyle(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/RowStyle;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "style",
            "rowStyle"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 2
    iput-object p2, p0, Landroidx/slice/widget/SliceChildView;->mRowStyle:Landroidx/slice/widget/RowStyle;

    .line 3
    iget-object v0, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    .line 4
    iput-object p1, v0, Landroidx/slice/widget/SliceAdapter;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 5
    iget-object p1, v0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyChanged()V

    .line 6
    iget-boolean p1, p2, Landroidx/slice/widget/RowStyle;->mDisableRecyclerViewItemAnimator:Z

    if-eqz p1, :cond_0

    .line 7
    iget-object p0, p0, Landroidx/slice/widget/TemplateView;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    :cond_0
    return-void
.end method

.method public setTint(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tint"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/slice/widget/TemplateView;->updateDisplayedItems(I)V

    return-void
.end method

.method public final updateDisplayedItems(I)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "height"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/TemplateView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroidx/slice/widget/ListContent;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 2
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/TemplateView;->mListContent:Landroidx/slice/widget/ListContent;

    iget-object v1, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    iget-object v2, p0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget v3, v2, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v3, v4, :cond_1

    .line 4
    new-instance p1, Landroidx/slice/widget/DisplayedListItems;

    new-instance v1, Ljava/util/ArrayList;

    new-array v2, v4, [Landroidx/slice/widget/RowContent;

    .line 5
    iget-object v3, v0, Landroidx/slice/widget/ListContent;->mHeaderContent:Landroidx/slice/widget/RowContent;

    aput-object v3, v2, v5

    .line 6
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v0, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v4

    invoke-direct {p1, v1, v0}, Landroidx/slice/widget/DisplayedListItems;-><init>(Ljava/util/List;I)V

    goto :goto_0

    .line 8
    :cond_1
    iget-boolean v3, v2, Landroidx/slice/widget/SliceViewPolicy;->mScrollable:Z

    if-nez v3, :cond_2

    if-lez p1, :cond_2

    .line 9
    invoke-virtual {v1, v0, p1, v2}, Landroidx/slice/widget/SliceStyle;->getListItemsForNonScrollingList(Landroidx/slice/widget/ListContent;ILandroidx/slice/widget/SliceViewPolicy;)Landroidx/slice/widget/DisplayedListItems;

    move-result-object p1

    goto :goto_0

    .line 10
    :cond_2
    new-instance p1, Landroidx/slice/widget/DisplayedListItems;

    .line 11
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    iget-object v0, v0, Landroidx/slice/widget/ListContent;->mRowItems:Ljava/util/ArrayList;

    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_3

    invoke-virtual {v1, v0}, Landroidx/slice/widget/SliceStyle;->shouldSkipFirstListItem(Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {v0, v4, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    .line 15
    :cond_3
    invoke-direct {p1, v0, v5}, Landroidx/slice/widget/DisplayedListItems;-><init>(Ljava/util/List;I)V

    .line 16
    :goto_0
    iget-object p1, p1, Landroidx/slice/widget/DisplayedListItems;->mDisplayedItems:Ljava/util/List;

    .line 17
    iput-object p1, p0, Landroidx/slice/widget/TemplateView;->mDisplayedItems:Ljava/util/List;

    .line 18
    iget-object v0, p0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    iget-object v1, p0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 19
    invoke-virtual {v0, p1, v1}, Landroidx/slice/widget/SliceStyle;->getListItemsHeight(Ljava/util/List;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result p1

    .line 20
    iput p1, p0, Landroidx/slice/widget/TemplateView;->mDisplayedItemsHeight:I

    .line 21
    iget-object p1, p0, Landroidx/slice/widget/TemplateView;->mAdapter:Landroidx/slice/widget/SliceAdapter;

    iget-object v0, p0, Landroidx/slice/widget/TemplateView;->mDisplayedItems:Ljava/util/List;

    iget v1, p0, Landroidx/slice/widget/SliceChildView;->mTintColor:I

    iget-object v2, p0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 22
    iget v2, v2, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    .line 23
    invoke-virtual {p1, v0, v1, v2}, Landroidx/slice/widget/SliceAdapter;->setSliceItems(Ljava/util/List;II)V

    .line 24
    iget p1, p0, Landroidx/slice/widget/TemplateView;->mDisplayedItemsHeight:I

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v0

    if-le p1, v0, :cond_4

    move v5, v4

    .line 25
    :cond_4
    iget-object p1, p0, Landroidx/slice/widget/TemplateView;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p0, p0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 26
    iget-boolean p0, p0, Landroidx/slice/widget/SliceViewPolicy;->mScrollable:Z

    if-eqz p0, :cond_5

    if-eqz v5, :cond_5

    goto :goto_1

    :cond_5
    const/4 v4, 0x2

    .line 27
    :goto_1
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->setOverScrollMode(I)V

    return-void

    .line 28
    :cond_6
    :goto_2
    invoke-virtual {p0}, Landroidx/slice/widget/TemplateView;->resetView()V

    return-void
.end method
