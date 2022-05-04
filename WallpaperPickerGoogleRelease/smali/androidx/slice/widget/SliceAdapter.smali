.class public Landroidx/slice/widget/SliceAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"

# interfaces
.implements Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/SliceAdapter$IdGenerator;,
        Landroidx/slice/widget/SliceAdapter$SliceViewHolder;,
        Landroidx/slice/widget/SliceAdapter$SliceWrapper;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/slice/widget/SliceAdapter$SliceViewHolder;",
        ">;",
        "Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;"
    }
.end annotation


# instance fields
.field public mAllowTwoLines:Z

.field public final mContext:Landroid/content/Context;

.field public final mIdGen:Landroidx/slice/widget/SliceAdapter$IdGenerator;

.field public mInsetBottom:I

.field public mInsetEnd:I

.field public mInsetStart:I

.field public mInsetTop:I

.field public mLastUpdated:J

.field public mLoadingActions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation
.end field

.field public mParent:Landroidx/slice/widget/SliceView;

.field public mPolicy:Landroidx/slice/widget/SliceViewPolicy;

.field public mShowLastUpdated:Z

.field public mSliceActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/slice/core/SliceAction;",
            ">;"
        }
    .end annotation
.end field

.field public mSliceObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

.field public mSliceStyle:Landroidx/slice/widget/SliceStyle;

.field public mSlices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/slice/widget/SliceAdapter$SliceWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public mTemplateView:Landroidx/slice/widget/TemplateView;


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

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    new-instance v0, Landroidx/slice/widget/SliceAdapter$IdGenerator;

    invoke-direct {v0}, Landroidx/slice/widget/SliceAdapter$IdGenerator;-><init>()V

    iput-object v0, p0, Landroidx/slice/widget/SliceAdapter;->mIdGen:Landroidx/slice/widget/SliceAdapter$IdGenerator;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/slice/widget/SliceAdapter;->mSlices:Ljava/util/List;

    .line 4
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/slice/widget/SliceAdapter;->mLoadingActions:Ljava/util/Set;

    .line 5
    iput-object p1, p0, Landroidx/slice/widget/SliceAdapter;->mContext:Landroid/content/Context;

    .line 6
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->hasObservers()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mHasStableIds:Z

    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot change whether this adapter has stable IDs while the adapter has registered observers."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/SliceAdapter;->mSlices:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public getItemId(I)J
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "position"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/SliceAdapter;->mSlices:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/slice/widget/SliceAdapter$SliceWrapper;

    iget-wide p0, p0, Landroidx/slice/widget/SliceAdapter$SliceWrapper;->mId:J

    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "position"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/SliceAdapter;->mSlices:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/slice/widget/SliceAdapter$SliceWrapper;

    iget p0, p0, Landroidx/slice/widget/SliceAdapter$SliceWrapper;->mType:I

    return p0
.end method

.method public notifyHeaderChanged()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/slice/widget/SliceAdapter;->getItemCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    :cond_0
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "holder",
            "position"
        }
    .end annotation

    .line 1
    check-cast p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;

    .line 2
    iget-object p0, p0, Landroidx/slice/widget/SliceAdapter;->mSlices:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/slice/widget/SliceAdapter$SliceWrapper;

    .line 3
    iget-object p0, p0, Landroidx/slice/widget/SliceAdapter$SliceWrapper;->mItem:Landroidx/slice/widget/SliceContent;

    .line 4
    iget-object v0, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    if-eqz v0, :cond_8

    if-nez p0, :cond_0

    goto/16 :goto_6

    .line 5
    :cond_0
    iget-object v0, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget-object v0, v0, Landroidx/slice/widget/SliceAdapter;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 6
    iget-object v1, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 7
    invoke-virtual {v0, v1}, Landroidx/slice/widget/SliceStyle;->getRowStyle(Landroidx/slice/SliceItem;)Landroidx/slice/widget/RowStyle;

    move-result-object v0

    .line 8
    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {v1, p1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {v1, p1}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 10
    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    iget-object v2, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    .line 11
    iput-object v2, v1, Landroidx/slice/widget/SliceChildView;->mLoadingListener:Landroidx/slice/widget/SliceActionView$SliceActionLoadingListener;

    .line 12
    instance-of v3, p0, Landroidx/slice/widget/RowContent;

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v3, :cond_1

    .line 13
    move-object v3, p0

    check-cast v3, Landroidx/slice/widget/RowContent;

    .line 14
    iget-boolean v3, v3, Landroidx/slice/widget/RowContent;->mIsHeader:Z

    move v8, v3

    goto :goto_0

    :cond_1
    if-nez p2, :cond_2

    move v8, v6

    goto :goto_0

    :cond_2
    move v8, v7

    .line 15
    :goto_0
    iget-object v2, v2, Landroidx/slice/widget/SliceAdapter;->mLoadingActions:Ljava/util/Set;

    invoke-virtual {v1, v2}, Landroidx/slice/widget/SliceChildView;->setLoadingActions(Ljava/util/Set;)V

    .line 16
    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    iget-object v2, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget-object v2, v2, Landroidx/slice/widget/SliceAdapter;->mPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-virtual {v1, v2}, Landroidx/slice/widget/SliceChildView;->setPolicy(Landroidx/slice/widget/SliceViewPolicy;)V

    .line 17
    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {v0}, Landroidx/slice/widget/RowStyle;->getTintColor()I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/slice/widget/SliceChildView;->setTint(I)V

    .line 18
    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    iget-object v2, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget-object v2, v2, Landroidx/slice/widget/SliceAdapter;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    invoke-virtual {v1, v2, v0}, Landroidx/slice/widget/SliceChildView;->setStyle(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/RowStyle;)V

    .line 19
    iget-object v0, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    if-eqz v8, :cond_3

    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget-boolean v1, v1, Landroidx/slice/widget/SliceAdapter;->mShowLastUpdated:Z

    if-eqz v1, :cond_3

    move v1, v6

    goto :goto_1

    :cond_3
    move v1, v7

    :goto_1
    invoke-virtual {v0, v1}, Landroidx/slice/widget/SliceChildView;->setShowLastUpdated(Z)V

    .line 20
    iget-object v0, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    if-eqz v8, :cond_4

    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget-wide v1, v1, Landroidx/slice/widget/SliceAdapter;->mLastUpdated:J

    goto :goto_2

    :cond_4
    const-wide/16 v1, -0x1

    :goto_2
    invoke-virtual {v0, v1, v2}, Landroidx/slice/widget/SliceChildView;->setLastUpdated(J)V

    if-nez p2, :cond_5

    .line 21
    iget-object v0, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget v0, v0, Landroidx/slice/widget/SliceAdapter;->mInsetTop:I

    goto :goto_3

    :cond_5
    move v0, v7

    .line 22
    :goto_3
    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    invoke-virtual {v1}, Landroidx/slice/widget/SliceAdapter;->getItemCount()I

    move-result v1

    sub-int/2addr v1, v6

    if-ne p2, v1, :cond_6

    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget v1, v1, Landroidx/slice/widget/SliceAdapter;->mInsetBottom:I

    goto :goto_4

    :cond_6
    move v1, v7

    .line 23
    :goto_4
    iget-object v2, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    iget-object v3, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget v4, v3, Landroidx/slice/widget/SliceAdapter;->mInsetStart:I

    iget v3, v3, Landroidx/slice/widget/SliceAdapter;->mInsetEnd:I

    invoke-virtual {v2, v4, v0, v3, v1}, Landroidx/slice/widget/SliceChildView;->setInsets(IIII)V

    .line 24
    iget-object v0, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget-boolean v1, v1, Landroidx/slice/widget/SliceAdapter;->mAllowTwoLines:Z

    invoke-virtual {v0, v1}, Landroidx/slice/widget/SliceChildView;->setAllowTwoLines(Z)V

    .line 25
    iget-object v0, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    if-eqz v8, :cond_7

    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget-object v1, v1, Landroidx/slice/widget/SliceAdapter;->mSliceActions:Ljava/util/List;

    goto :goto_5

    :cond_7
    const/4 v1, 0x0

    :goto_5
    invoke-virtual {v0, v1}, Landroidx/slice/widget/SliceChildView;->setSliceActions(Ljava/util/List;)V

    .line 26
    iget-object v0, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    invoke-virtual {v1}, Landroidx/slice/widget/SliceAdapter;->getItemCount()I

    move-result v4

    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget-object v5, v1, Landroidx/slice/widget/SliceAdapter;->mSliceObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    move-object v1, p0

    move v2, v8

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Landroidx/slice/widget/SliceChildView;->setSliceItem(Landroidx/slice/widget/SliceContent;ZIILandroidx/slice/widget/SliceView$OnSliceActionListener;)V

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 27
    iget-object v1, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->this$0:Landroidx/slice/widget/SliceAdapter;

    iget-object v1, v1, Landroidx/slice/widget/SliceAdapter;->mSliceActions:Ljava/util/List;

    invoke-static {p0, v8, v1}, Landroidx/slice/widget/ListContent;->getRowType(Landroidx/slice/widget/SliceContent;ZLjava/util/List;)I

    move-result p0

    aput p0, v0, v7

    aput p2, v0, v6

    .line 28
    iget-object p0, p1, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;->mSliceChildView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    :cond_8
    :goto_6
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "parent",
            "viewType"
        }
    .end annotation

    const/4 p1, 0x3

    const/4 v0, 0x0

    if-eq p2, p1, :cond_2

    const/4 p1, 0x4

    if-eq p2, p1, :cond_1

    const/4 p1, 0x5

    if-eq p2, p1, :cond_0

    .line 1
    new-instance p1, Landroidx/slice/widget/RowView;

    iget-object p2, p0, Landroidx/slice/widget/SliceAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p1, p2}, Landroidx/slice/widget/RowView;-><init>(Landroid/content/Context;)V

    goto :goto_0

    .line 2
    :cond_0
    iget-object p1, p0, Landroidx/slice/widget/SliceAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0d0020

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    goto :goto_0

    .line 3
    :cond_1
    iget-object p1, p0, Landroidx/slice/widget/SliceAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0d001f

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    goto :goto_0

    .line 4
    :cond_2
    iget-object p1, p0, Landroidx/slice/widget/SliceAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0d001b

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 5
    instance-of p2, p1, Landroidx/slice/widget/GridRowView;

    if-eqz p2, :cond_3

    .line 6
    check-cast p1, Landroidx/slice/widget/GridRowView;

    goto :goto_0

    .line 7
    :cond_3
    new-instance p1, Landroidx/slice/widget/GridRowView;

    iget-object p2, p0, Landroidx/slice/widget/SliceAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p1, p2, v0}, Landroidx/slice/widget/GridRowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    :goto_0
    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p2, v0, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 9
    new-instance p2, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;

    invoke-direct {p2, p0, p1}, Landroidx/slice/widget/SliceAdapter$SliceViewHolder;-><init>(Landroidx/slice/widget/SliceAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public onSliceActionLoading(Landroidx/slice/SliceItem;I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "actionItem",
            "position"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/SliceAdapter;->mLoadingActions:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2
    invoke-virtual {p0}, Landroidx/slice/widget/SliceAdapter;->getItemCount()I

    move-result p1

    if-le p1, p2, :cond_0

    .line 3
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    const/4 p1, 0x1

    invoke-virtual {p0, p2, p1}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyItemRangeChanged(II)V

    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyChanged()V

    :goto_0
    return-void
.end method

.method public setSliceItems(Ljava/util/List;II)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "slices",
            "color",
            "mode"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/slice/widget/SliceContent;",
            ">;II)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/SliceAdapter;->mLoadingActions:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 2
    iget-object p1, p0, Landroidx/slice/widget/SliceAdapter;->mSlices:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    goto :goto_1

    .line 3
    :cond_0
    iget-object p2, p0, Landroidx/slice/widget/SliceAdapter;->mIdGen:Landroidx/slice/widget/SliceAdapter$IdGenerator;

    .line 4
    iget-object p2, p2, Landroidx/slice/widget/SliceAdapter$IdGenerator;->mUsedIds:Landroidx/collection/ArrayMap;

    invoke-virtual {p2}, Landroidx/collection/SimpleArrayMap;->clear()V

    .line 5
    new-instance p2, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p3

    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p2, p0, Landroidx/slice/widget/SliceAdapter;->mSlices:Ljava/util/List;

    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/slice/widget/SliceContent;

    .line 7
    iget-object p3, p0, Landroidx/slice/widget/SliceAdapter;->mSlices:Ljava/util/List;

    new-instance v0, Landroidx/slice/widget/SliceAdapter$SliceWrapper;

    iget-object v1, p0, Landroidx/slice/widget/SliceAdapter;->mIdGen:Landroidx/slice/widget/SliceAdapter$IdGenerator;

    invoke-direct {v0, p2, v1}, Landroidx/slice/widget/SliceAdapter$SliceWrapper;-><init>(Landroidx/slice/widget/SliceContent;Landroidx/slice/widget/SliceAdapter$IdGenerator;)V

    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 8
    :cond_1
    :goto_1
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyChanged()V

    return-void
.end method
