.class public final Landroidx/recyclerview/widget/RecyclerView$Recycler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Recycler"
.end annotation


# instance fields
.field public final mAttachedScrap:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field public final mCachedViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field public mChangedScrap:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field public mRecyclerPool:Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

.field public mRequestedCacheMax:I

.field public final mUnmodifiableAttachedScrap:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field public mViewCacheMax:I

.field public final synthetic this$0:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    .line 5
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mUnmodifiableAttachedScrap:Ljava/util/List;

    const/4 p1, 0x2

    .line 6
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mRequestedCacheMax:I

    .line 7
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mViewCacheMax:I

    return-void
.end method


# virtual methods
.method public addViewHolderToRecycledViewPool(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "holder",
            "dispatchRecycled"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->clearNestedRecyclerViewIfNotNested(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 2
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 3
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->mAccessibilityDelegate:Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 4
    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;->mItemDelegate:Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate$ItemDelegate;

    .line 5
    instance-of v3, v1, Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate$ItemDelegate;

    if-eqz v3, :cond_0

    .line 6
    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate$ItemDelegate;->mOriginalItemDelegates:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/core/view/AccessibilityDelegateCompat;

    goto :goto_0

    :cond_0
    move-object v1, v2

    .line 7
    :goto_0
    invoke-static {v0, v1}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    :cond_1
    if-eqz p2, :cond_4

    .line 8
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView;->mRecyclerListener:Landroidx/recyclerview/widget/RecyclerView$RecyclerListener;

    if-eqz p2, :cond_2

    .line 9
    invoke-interface {p2, p1}, Landroidx/recyclerview/widget/RecyclerView$RecyclerListener;->onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 10
    :cond_2
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView;->mRecyclerListeners:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    const/4 v0, 0x0

    :goto_1
    if-ge v0, p2, :cond_3

    .line 11
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->mRecyclerListeners:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$RecyclerListener;

    invoke-interface {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$RecyclerListener;->onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 12
    :cond_3
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p2, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 13
    iget-object v0, p2, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    if-eqz v0, :cond_4

    .line 14
    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView;->mViewInfoStore:Landroidx/recyclerview/widget/ViewInfoStore;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/ViewInfoStore;->removeViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 15
    :cond_4
    iput-object v2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mBindingAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 16
    iput-object v2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mOwnerRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->getRecycledViewPool()Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    iget p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemViewType:I

    .line 19
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->getScrapDataForType(I)Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;

    move-result-object v0

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;->mScrapHeap:Ljava/util/ArrayList;

    .line 20
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->mScrap:Landroid/util/SparseArray;

    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;

    iget p0, p0, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;->mMaxScrap:I

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-gt p0, p2, :cond_5

    goto :goto_2

    .line 21
    :cond_5
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->resetInternal()V

    .line 22
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2
    return-void
.end method

.method public clear()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->recycleAndClearCachedViews()V

    return-void
.end method

.method public convertPreLayoutPositionToPostLayout(I)I
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "position"
        }
    .end annotation

    if-ltz p1, :cond_1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 2
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 3
    iget-boolean v0, v0, Landroidx/recyclerview/widget/RecyclerView$State;->mInPreLayout:Z

    if-nez v0, :cond_0

    return p1

    .line 4
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->mAdapterHelper:Landroidx/recyclerview/widget/AdapterHelper;

    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/AdapterHelper;->findPositionOffset(II)I

    move-result p0

    return p0

    .line 6
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid position "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ". State item count is "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 7
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p0, v1}, Landroidx/recyclerview/widget/ChildHelper$$ExternalSyntheticOutline0;->m(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRecycledViewPool()Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mRecyclerPool:Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    invoke-direct {v0}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mRecyclerPool:Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    .line 3
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mRecyclerPool:Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    return-object p0
.end method

.method public final invalidateDisplayListInt(Landroid/view/ViewGroup;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "viewGroup",
            "invalidateThis"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    if-ltz v0, :cond_1

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 3
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_0

    .line 4
    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {p0, v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->invalidateDisplayListInt(Landroid/view/ViewGroup;Z)V

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    if-nez p2, :cond_2

    return-void

    .line 5
    :cond_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p0

    const/4 p2, 0x4

    if-ne p0, p2, :cond_3

    const/4 p0, 0x0

    .line 6
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 7
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_1

    .line 8
    :cond_3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p0

    .line 9
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 10
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setVisibility(I)V

    :goto_1
    return-void
.end method

.method public recycleAndClearCachedViews()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, -0x1

    add-int/2addr v0, v1

    :goto_0
    if-ltz v0, :cond_0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->recycleCachedViewAt(I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 3
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    sget-boolean v0, Landroidx/recyclerview/widget/RecyclerView;->ALLOW_THREAD_GAP_WORK:Z

    if-eqz v0, :cond_2

    .line 5
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->mPrefetchRegistry:Landroidx/recyclerview/widget/GapWorker$LayoutPrefetchRegistryImpl;

    .line 6
    iget-object v0, p0, Landroidx/recyclerview/widget/GapWorker$LayoutPrefetchRegistryImpl;->mPrefetchArray:[I

    if-eqz v0, :cond_1

    .line 7
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    :cond_1
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Landroidx/recyclerview/widget/GapWorker$LayoutPrefetchRegistryImpl;->mCount:I

    :cond_2
    return-void
.end method

.method public recycleCachedViewAt(I)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cachedViewIndex"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    const/4 v1, 0x1

    .line 2
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->addViewHolderToRecycledViewPool(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Z)V

    .line 3
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method public recycleView(Landroid/view/View;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isTmpDetached()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->removeDetachedView(Landroid/view/View;Z)V

    .line 4
    :cond_0
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isScrap()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 5
    iget-object p1, v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->unscrapView(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    goto :goto_0

    .line 6
    :cond_1
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 7
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->clearReturnedFromScrapFlag()V

    .line 8
    :cond_2
    :goto_0
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->recycleViewHolderInternal(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 9
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->mItemAnimator:Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;

    if-eqz p1, :cond_3

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isRecyclable()Z

    move-result p1

    if-nez p1, :cond_3

    .line 10
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->mItemAnimator:Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;->endAnimation(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    :cond_3
    return-void
.end method

.method public recycleViewHolderInternal(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "holder"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isScrap()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_c

    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 2
    :cond_0
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isTmpDetached()Z

    move-result v0

    if-nez v0, :cond_b

    .line 3
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v0

    if-nez v0, :cond_a

    .line 4
    iget v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v0, v0, 0x10

    if-nez v0, :cond_1

    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget-object v3, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->hasTransientState()Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v1

    .line 6
    :goto_0
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 7
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isRecyclable()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 8
    iget v3, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mViewCacheMax:I

    if-lez v3, :cond_6

    const/16 v3, 0x20e

    .line 9
    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->hasAnyOfTheFlags(I)Z

    move-result v3

    if-nez v3, :cond_6

    .line 10
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 11
    iget v4, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mViewCacheMax:I

    if-lt v3, v4, :cond_2

    if-lez v3, :cond_2

    .line 12
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->recycleCachedViewAt(I)V

    add-int/lit8 v3, v3, -0x1

    .line 13
    :cond_2
    sget-boolean v4, Landroidx/recyclerview/widget/RecyclerView;->ALLOW_THREAD_GAP_WORK:Z

    if-eqz v4, :cond_5

    if-lez v3, :cond_5

    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView;->mPrefetchRegistry:Landroidx/recyclerview/widget/GapWorker$LayoutPrefetchRegistryImpl;

    iget v5, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mPosition:I

    .line 14
    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/GapWorker$LayoutPrefetchRegistryImpl;->lastPrefetchIncludedPosition(I)Z

    move-result v4

    if-nez v4, :cond_5

    :cond_3
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_4

    .line 15
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    iget v4, v4, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mPosition:I

    .line 16
    iget-object v5, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v5, Landroidx/recyclerview/widget/RecyclerView;->mPrefetchRegistry:Landroidx/recyclerview/widget/GapWorker$LayoutPrefetchRegistryImpl;

    invoke-virtual {v5, v4}, Landroidx/recyclerview/widget/GapWorker$LayoutPrefetchRegistryImpl;->lastPrefetchIncludedPosition(I)Z

    move-result v4

    if-nez v4, :cond_3

    :cond_4
    add-int/2addr v3, v2

    .line 17
    :cond_5
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v4, v3, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    move v3, v2

    goto :goto_1

    :cond_6
    move v3, v1

    :goto_1
    if-nez v3, :cond_7

    .line 18
    invoke-virtual {p0, p1, v2}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->addViewHolderToRecycledViewPool(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Z)V

    move v1, v2

    :cond_7
    move v2, v1

    move v1, v3

    goto :goto_2

    :cond_8
    move v2, v1

    .line 19
    :goto_2
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->mViewInfoStore:Landroidx/recyclerview/widget/ViewInfoStore;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/ViewInfoStore;->removeViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    if-nez v1, :cond_9

    if-nez v2, :cond_9

    if-eqz v0, :cond_9

    const/4 p0, 0x0

    .line 20
    iput-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mBindingAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 21
    iput-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mOwnerRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    :cond_9
    return-void

    .line 22
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Trying to recycle an ignored view holder. You should first call stopIgnoringView(view) before calling recycle."

    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    invoke-static {p0, v0}, Landroidx/recyclerview/widget/ChildHelper$$ExternalSyntheticOutline0;->m(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 24
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Tmp detached view should be removed from RecyclerView before it can be recycled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    invoke-static {p0, v1}, Landroidx/recyclerview/widget/ChildHelper$$ExternalSyntheticOutline0;->m(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_c
    :goto_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v3, "Scrapped or attached views may not be recycled. isScrap:"

    invoke-static {v3}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 27
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isScrap()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " isAttached:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_d

    move v1, v2

    :cond_d
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p0, v3}, Landroidx/recyclerview/widget/ChildHelper$$ExternalSyntheticOutline0;->m(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public scrapView(Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p1

    const/16 v0, 0xc

    .line 2
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->hasAnyOfTheFlags(I)Z

    move-result v0

    if-nez v0, :cond_2

    .line 3
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isUpdated()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->canReuseUpdatedViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    :cond_1
    const/4 v0, 0x1

    .line 6
    iput-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    .line 7
    iput-boolean v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mInChangeScrap:Z

    .line 8
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 9
    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 10
    iget-boolean v0, v0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mHasStableIds:Z

    if-eqz v0, :cond_3

    goto :goto_1

    .line 11
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Called scrap view with an invalid view. Invalid views cannot be reused from scrap, they should rebound from recycler pool."

    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    invoke-static {p0, v0}, Landroidx/recyclerview/widget/ChildHelper$$ExternalSyntheticOutline0;->m(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    :goto_1
    const/4 v0, 0x0

    .line 13
    iput-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    .line 14
    iput-boolean v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mInChangeScrap:Z

    .line 15
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2
    return-void
.end method

.method public tryGetViewHolderForPositionByDeadline(IZJ)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 16
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "position",
            "dryRun",
            "deadlineNs"
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p1

    if-ltz v1, :cond_47

    .line 1
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v2

    if-ge v1, v2, :cond_47

    .line 2
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 3
    iget-boolean v2, v2, Landroidx/recyclerview/widget/RecyclerView$State;->mInPreLayout:Z

    const/16 v3, 0x20

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v2, :cond_5

    .line 4
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_2

    :cond_0
    move v6, v5

    :goto_0
    if-ge v6, v2, :cond_2

    .line 5
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 6
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v8

    if-nez v8, :cond_1

    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v8

    if-ne v8, v1, :cond_1

    .line 7
    invoke-virtual {v7, v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->addFlags(I)V

    goto :goto_3

    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 8
    :cond_2
    iget-object v6, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v7, v6, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 9
    iget-boolean v7, v7, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mHasStableIds:Z

    if-eqz v7, :cond_4

    .line 10
    iget-object v6, v6, Landroidx/recyclerview/widget/RecyclerView;->mAdapterHelper:Landroidx/recyclerview/widget/AdapterHelper;

    .line 11
    invoke-virtual {v6, v1, v5}, Landroidx/recyclerview/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v6

    if-lez v6, :cond_4

    .line 12
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v7, v7, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v7

    if-ge v6, v7, :cond_4

    .line 13
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v7, v7, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v7, v6}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v6

    move v8, v5

    :goto_1
    if-ge v8, v2, :cond_4

    .line 14
    iget-object v9, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 15
    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v10

    if-nez v10, :cond_3

    .line 16
    iget-wide v10, v9, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemId:J

    cmp-long v10, v10, v6

    if-nez v10, :cond_3

    .line 17
    invoke-virtual {v9, v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->addFlags(I)V

    move-object v7, v9

    goto :goto_3

    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    move-object v7, v4

    :goto_3
    if-eqz v7, :cond_6

    const/4 v2, 0x1

    goto :goto_4

    :cond_5
    move-object v7, v4

    :cond_6
    move v2, v5

    :goto_4
    const/4 v6, -0x1

    if-nez v7, :cond_1c

    .line 18
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v5

    :goto_5
    if-ge v8, v7, :cond_9

    .line 19
    iget-object v9, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 20
    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v10

    if-nez v10, :cond_8

    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v10

    if-ne v10, v1, :cond_8

    .line 21
    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v10

    if-nez v10, :cond_8

    iget-object v10, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v10, v10, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    iget-boolean v10, v10, Landroidx/recyclerview/widget/RecyclerView$State;->mInPreLayout:Z

    if-nez v10, :cond_7

    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v10

    if-nez v10, :cond_8

    .line 22
    :cond_7
    invoke-virtual {v9, v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->addFlags(I)V

    goto/16 :goto_9

    :cond_8
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    :cond_9
    if-nez p2, :cond_f

    .line 23
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v7, v7, Landroidx/recyclerview/widget/RecyclerView;->mChildHelper:Landroidx/recyclerview/widget/ChildHelper;

    .line 24
    iget-object v8, v7, Landroidx/recyclerview/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    move v9, v5

    :goto_6
    if-ge v9, v8, :cond_b

    .line 25
    iget-object v10, v7, Landroidx/recyclerview/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    .line 26
    iget-object v11, v7, Landroidx/recyclerview/widget/ChildHelper;->mCallback:Landroidx/recyclerview/widget/ChildHelper$Callback;

    check-cast v11, Landroidx/recyclerview/widget/RecyclerView$5;

    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    invoke-static {v10}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v11

    .line 28
    invoke-virtual {v11}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v12

    if-ne v12, v1, :cond_a

    .line 29
    invoke-virtual {v11}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v12

    if-nez v12, :cond_a

    .line 30
    invoke-virtual {v11}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v11

    if-nez v11, :cond_a

    goto :goto_7

    :cond_a
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    :cond_b
    move-object v10, v4

    :goto_7
    if-eqz v10, :cond_f

    .line 31
    invoke-static {v10}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v7

    .line 32
    iget-object v8, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v8, v8, Landroidx/recyclerview/widget/RecyclerView;->mChildHelper:Landroidx/recyclerview/widget/ChildHelper;

    .line 33
    iget-object v9, v8, Landroidx/recyclerview/widget/ChildHelper;->mCallback:Landroidx/recyclerview/widget/ChildHelper$Callback;

    check-cast v9, Landroidx/recyclerview/widget/RecyclerView$5;

    .line 34
    iget-object v9, v9, Landroidx/recyclerview/widget/RecyclerView$5;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v9

    if-ltz v9, :cond_e

    .line 35
    iget-object v11, v8, Landroidx/recyclerview/widget/ChildHelper;->mBucket:Landroidx/recyclerview/widget/ChildHelper$Bucket;

    invoke-virtual {v11, v9}, Landroidx/recyclerview/widget/ChildHelper$Bucket;->get(I)Z

    move-result v11

    if-eqz v11, :cond_d

    .line 36
    iget-object v11, v8, Landroidx/recyclerview/widget/ChildHelper;->mBucket:Landroidx/recyclerview/widget/ChildHelper$Bucket;

    invoke-virtual {v11, v9}, Landroidx/recyclerview/widget/ChildHelper$Bucket;->clear(I)V

    .line 37
    invoke-virtual {v8, v10}, Landroidx/recyclerview/widget/ChildHelper;->unhideViewInternal(Landroid/view/View;)Z

    .line 38
    iget-object v8, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v8, v8, Landroidx/recyclerview/widget/RecyclerView;->mChildHelper:Landroidx/recyclerview/widget/ChildHelper;

    invoke-virtual {v8, v10}, Landroidx/recyclerview/widget/ChildHelper;->indexOfChild(Landroid/view/View;)I

    move-result v8

    if-eq v8, v6, :cond_c

    .line 39
    iget-object v9, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v9, v9, Landroidx/recyclerview/widget/RecyclerView;->mChildHelper:Landroidx/recyclerview/widget/ChildHelper;

    invoke-virtual {v9, v8}, Landroidx/recyclerview/widget/ChildHelper;->detachViewFromParent(I)V

    .line 40
    invoke-virtual {v0, v10}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->scrapView(Landroid/view/View;)V

    const/16 v8, 0x2020

    .line 41
    invoke-virtual {v7, v8}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->addFlags(I)V

    goto/16 :goto_a

    .line 42
    :cond_c
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "layout index should not be -1 after unhiding a view:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    invoke-static {v0, v2}, Landroidx/recyclerview/widget/ChildHelper$$ExternalSyntheticOutline0;->m(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 44
    :cond_d
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "trying to unhide a view that was not hidden"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "view is not a child, cannot hide "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_f
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v5

    :goto_8
    if-ge v8, v7, :cond_12

    .line 47
    iget-object v9, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 48
    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v10

    if-nez v10, :cond_11

    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v10

    if-ne v10, v1, :cond_11

    .line 49
    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isAttachedToTransitionOverlay()Z

    move-result v10

    if-nez v10, :cond_11

    if-nez p2, :cond_10

    .line 50
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_10
    :goto_9
    move-object v7, v9

    goto :goto_a

    :cond_11
    add-int/lit8 v8, v8, 0x1

    goto :goto_8

    :cond_12
    move-object v7, v4

    :goto_a
    if-eqz v7, :cond_1c

    .line 51
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v8

    if-eqz v8, :cond_13

    .line 52
    iget-object v8, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v8, v8, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 53
    iget-boolean v8, v8, Landroidx/recyclerview/widget/RecyclerView$State;->mInPreLayout:Z

    goto :goto_d

    .line 54
    :cond_13
    iget v8, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mPosition:I

    if-ltz v8, :cond_1b

    iget-object v9, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v9, v9, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v9

    if-ge v8, v9, :cond_1b

    .line 55
    iget-object v8, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v9, v8, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 56
    iget-boolean v9, v9, Landroidx/recyclerview/widget/RecyclerView$State;->mInPreLayout:Z

    if-nez v9, :cond_14

    .line 57
    iget-object v8, v8, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    iget v9, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mPosition:I

    invoke-virtual {v8, v9}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result v8

    .line 58
    iget v9, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemViewType:I

    if-eq v8, v9, :cond_14

    goto :goto_b

    .line 59
    :cond_14
    iget-object v8, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v8, v8, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 60
    iget-boolean v9, v8, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mHasStableIds:Z

    if-eqz v9, :cond_16

    .line 61
    iget-wide v9, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemId:J

    .line 62
    iget v11, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mPosition:I

    invoke-virtual {v8, v11}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v11

    cmp-long v8, v9, v11

    if-nez v8, :cond_15

    goto :goto_c

    :cond_15
    :goto_b
    move v8, v5

    goto :goto_d

    :cond_16
    :goto_c
    const/4 v8, 0x1

    :goto_d
    if-nez v8, :cond_1a

    if-nez p2, :cond_19

    const/4 v8, 0x4

    .line 63
    invoke-virtual {v7, v8}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 64
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isScrap()Z

    move-result v8

    if-eqz v8, :cond_17

    .line 65
    iget-object v8, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v9, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v8, v9, v5}, Landroidx/recyclerview/widget/RecyclerView;->removeDetachedView(Landroid/view/View;Z)V

    .line 66
    iget-object v8, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    invoke-virtual {v8, v7}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->unscrapView(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    goto :goto_e

    .line 67
    :cond_17
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v8

    if-eqz v8, :cond_18

    .line 68
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->clearReturnedFromScrapFlag()V

    .line 69
    :cond_18
    :goto_e
    invoke-virtual {v0, v7}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->recycleViewHolderInternal(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    :cond_19
    move-object v7, v4

    goto :goto_f

    :cond_1a
    const/4 v2, 0x1

    goto :goto_f

    .line 70
    :cond_1b
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Inconsistency detected. Invalid view holder adapter position"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    .line 71
    invoke-static {v0, v2}, Landroidx/recyclerview/widget/ChildHelper$$ExternalSyntheticOutline0;->m(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1c
    :goto_f
    const/4 v8, 0x2

    if-nez v7, :cond_30

    .line 72
    iget-object v9, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v9, v9, Landroidx/recyclerview/widget/RecyclerView;->mAdapterHelper:Landroidx/recyclerview/widget/AdapterHelper;

    .line 73
    invoke-virtual {v9, v1, v5}, Landroidx/recyclerview/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v9

    if-ltz v9, :cond_2f

    .line 74
    iget-object v10, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v10, v10, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v10}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v10

    if-ge v9, v10, :cond_2f

    .line 75
    iget-object v10, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v10, v10, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v10, v9}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result v10

    .line 76
    iget-object v11, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v11, v11, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 77
    iget-boolean v12, v11, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mHasStableIds:Z

    if-eqz v12, :cond_25

    .line 78
    invoke-virtual {v11, v9}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v11

    .line 79
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/2addr v7, v6

    :goto_10
    if-ltz v7, :cond_20

    .line 80
    iget-object v13, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 81
    iget-wide v14, v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemId:J

    cmp-long v14, v14, v11

    if-nez v14, :cond_1f

    .line 82
    invoke-virtual {v13}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v14

    if-nez v14, :cond_1f

    .line 83
    iget v14, v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemViewType:I

    if-ne v10, v14, :cond_1e

    .line 84
    invoke-virtual {v13, v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 85
    invoke-virtual {v13}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 86
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 87
    iget-boolean v3, v3, Landroidx/recyclerview/widget/RecyclerView$State;->mInPreLayout:Z

    if-nez v3, :cond_1d

    const/16 v3, 0xe

    .line 88
    invoke-virtual {v13, v8, v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->setFlags(II)V

    :cond_1d
    move-object v7, v13

    goto :goto_13

    :cond_1e
    if-nez p2, :cond_1f

    .line 89
    iget-object v14, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v14, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 90
    iget-object v14, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v15, v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v14, v15, v5}, Landroidx/recyclerview/widget/RecyclerView;->removeDetachedView(Landroid/view/View;Z)V

    .line 91
    iget-object v13, v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 92
    invoke-static {v13}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v13

    .line 93
    iput-object v4, v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    .line 94
    iput-boolean v5, v13, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mInChangeScrap:Z

    .line 95
    invoke-virtual {v13}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->clearReturnedFromScrapFlag()V

    .line 96
    invoke-virtual {v0, v13}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->recycleViewHolderInternal(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    :cond_1f
    add-int/lit8 v7, v7, -0x1

    goto :goto_10

    .line 97
    :cond_20
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/2addr v3, v6

    :goto_11
    if-ltz v3, :cond_23

    .line 98
    iget-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 99
    iget-wide v13, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemId:J

    cmp-long v13, v13, v11

    if-nez v13, :cond_22

    .line 100
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isAttachedToTransitionOverlay()Z

    move-result v13

    if-nez v13, :cond_22

    .line 101
    iget v13, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemViewType:I

    if-ne v10, v13, :cond_21

    if-nez p2, :cond_24

    .line 102
    iget-object v11, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_13

    :cond_21
    if-nez p2, :cond_22

    .line 103
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->recycleCachedViewAt(I)V

    goto :goto_12

    :cond_22
    add-int/lit8 v3, v3, -0x1

    goto :goto_11

    :cond_23
    :goto_12
    move-object v7, v4

    :cond_24
    :goto_13
    if-eqz v7, :cond_25

    .line 104
    iput v9, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mPosition:I

    const/4 v2, 0x1

    :cond_25
    if-nez v7, :cond_29

    .line 105
    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->getRecycledViewPool()Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    move-result-object v3

    .line 106
    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->mScrap:Landroid/util/SparseArray;

    invoke-virtual {v3, v10}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;

    if-eqz v3, :cond_27

    .line 107
    iget-object v7, v3, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;->mScrapHeap:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_27

    .line 108
    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;->mScrapHeap:Ljava/util/ArrayList;

    .line 109
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/2addr v7, v6

    :goto_14
    if-ltz v7, :cond_27

    .line 110
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    invoke-virtual {v6}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isAttachedToTransitionOverlay()Z

    move-result v6

    if-nez v6, :cond_26

    .line 111
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    goto :goto_15

    :cond_26
    add-int/lit8 v7, v7, -0x1

    goto :goto_14

    :cond_27
    move-object v3, v4

    :goto_15
    if-eqz v3, :cond_28

    .line 112
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->resetInternal()V

    .line 113
    sget-boolean v6, Landroidx/recyclerview/widget/RecyclerView;->FORCE_INVALIDATE_DISPLAY_LIST:Z

    if-eqz v6, :cond_28

    .line 114
    iget-object v6, v3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    instance-of v7, v6, Landroid/view/ViewGroup;

    if-eqz v7, :cond_28

    .line 115
    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v0, v6, v5}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->invalidateDisplayListInt(Landroid/view/ViewGroup;Z)V

    :cond_28
    move-object v7, v3

    :cond_29
    if-nez v7, :cond_30

    .line 116
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView;->getNanoTime()J

    move-result-wide v6

    const-wide v11, 0x7fffffffffffffffL

    cmp-long v3, p3, v11

    if-eqz v3, :cond_2c

    .line 117
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mRecyclerPool:Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    .line 118
    invoke-virtual {v3, v10}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->getScrapDataForType(I)Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;

    move-result-object v3

    iget-wide v11, v3, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;->mCreateRunningAverageNs:J

    const-wide/16 v13, 0x0

    cmp-long v3, v11, v13

    if-eqz v3, :cond_2b

    add-long/2addr v11, v6

    cmp-long v3, v11, p3

    if-gez v3, :cond_2a

    goto :goto_16

    :cond_2a
    move v3, v5

    goto :goto_17

    :cond_2b
    :goto_16
    const/4 v3, 0x1

    :goto_17
    if-nez v3, :cond_2c

    return-object v4

    .line 119
    :cond_2c
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v9, v3, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    const-string v11, "RV CreateView"

    .line 120
    invoke-static {v11}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 121
    invoke-virtual {v9, v3, v10}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v3

    .line 122
    iget-object v9, v3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    if-nez v9, :cond_2e

    .line 123
    iput v10, v3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemViewType:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 125
    sget-boolean v9, Landroidx/recyclerview/widget/RecyclerView;->ALLOW_THREAD_GAP_WORK:Z

    if-eqz v9, :cond_2d

    .line 126
    iget-object v9, v3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v9}, Landroidx/recyclerview/widget/RecyclerView;->findNestedRecyclerView(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v9

    if-eqz v9, :cond_2d

    .line 127
    new-instance v11, Ljava/lang/ref/WeakReference;

    invoke-direct {v11, v9}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v11, v3, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mNestedRecyclerView:Ljava/lang/ref/WeakReference;

    .line 128
    :cond_2d
    iget-object v9, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView;->getNanoTime()J

    move-result-wide v11

    .line 129
    iget-object v9, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mRecyclerPool:Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    sub-long/2addr v11, v6

    .line 130
    invoke-virtual {v9, v10}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->getScrapDataForType(I)Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;

    move-result-object v6

    .line 131
    iget-wide v13, v6, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;->mCreateRunningAverageNs:J

    invoke-virtual {v9, v13, v14, v11, v12}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->runningAverage(JJ)J

    move-result-wide v9

    iput-wide v9, v6, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;->mCreateRunningAverageNs:J

    move-object v7, v3

    goto :goto_18

    .line 132
    :cond_2e
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ViewHolder views must not be attached when created. Ensure that you are not passing \'true\' to the attachToRoot parameter of LayoutInflater.inflate(..., boolean attachToRoot)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    .line 133
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 134
    throw v0

    .line 135
    :cond_2f
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Inconsistency detected. Invalid item position "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "(offset:"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ").state:"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 136
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0, v3}, Landroidx/recyclerview/widget/ChildHelper$$ExternalSyntheticOutline0;->m(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_30
    :goto_18
    if-eqz v2, :cond_31

    .line 137
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 138
    iget-boolean v3, v3, Landroidx/recyclerview/widget/RecyclerView$State;->mInPreLayout:Z

    if-nez v3, :cond_31

    const/16 v3, 0x2000

    .line 139
    invoke-virtual {v7, v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->hasAnyOfTheFlags(I)Z

    move-result v6

    if-eqz v6, :cond_31

    .line 140
    invoke-virtual {v7, v5, v3}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->setFlags(II)V

    .line 141
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    iget-boolean v3, v3, Landroidx/recyclerview/widget/RecyclerView$State;->mRunSimpleAnimations:Z

    if-eqz v3, :cond_31

    .line 142
    invoke-static {v7}, Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;->buildAdapterChangeFlagsForAnimations(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)I

    .line 143
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->mItemAnimator:Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;

    .line 144
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getUnmodifiedPayloads()Ljava/util/List;

    .line 145
    invoke-virtual {v3, v7}, Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;->recordPreLayoutInformation(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)Landroidx/recyclerview/widget/RecyclerView$ItemAnimator$ItemHolderInfo;

    move-result-object v3

    .line 146
    iget-object v6, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6, v7, v3}, Landroidx/recyclerview/widget/RecyclerView;->recordAnimationInfoIfBouncedHiddenView(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Landroidx/recyclerview/widget/RecyclerView$ItemAnimator$ItemHolderInfo;)V

    .line 147
    :cond_31
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 148
    iget-boolean v3, v3, Landroidx/recyclerview/widget/RecyclerView$State;->mInPreLayout:Z

    if-eqz v3, :cond_32

    .line 149
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isBound()Z

    move-result v3

    if-eqz v3, :cond_32

    .line 150
    iput v1, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    goto :goto_1c

    .line 151
    :cond_32
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isBound()Z

    move-result v3

    if-eqz v3, :cond_34

    .line 152
    iget v3, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/2addr v3, v8

    if-eqz v3, :cond_33

    const/4 v3, 0x1

    goto :goto_19

    :cond_33
    move v3, v5

    :goto_19
    if-nez v3, :cond_34

    .line 153
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v3

    if-eqz v3, :cond_37

    .line 154
    :cond_34
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->mAdapterHelper:Landroidx/recyclerview/widget/AdapterHelper;

    .line 155
    invoke-virtual {v3, v1, v5}, Landroidx/recyclerview/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v3

    .line 156
    iput-object v4, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mBindingAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 157
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iput-object v4, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mOwnerRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 158
    iget v6, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemViewType:I

    .line 159
    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView;->getNanoTime()J

    move-result-wide v8

    const-wide v10, 0x7fffffffffffffffL

    cmp-long v4, p3, v10

    if-eqz v4, :cond_38

    .line 160
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mRecyclerPool:Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    .line 161
    invoke-virtual {v4, v6}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->getScrapDataForType(I)Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;

    move-result-object v4

    iget-wide v10, v4, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;->mBindRunningAverageNs:J

    const-wide/16 v12, 0x0

    cmp-long v4, v10, v12

    if-eqz v4, :cond_36

    add-long/2addr v10, v8

    cmp-long v4, v10, p3

    if-gez v4, :cond_35

    goto :goto_1a

    :cond_35
    move v4, v5

    goto :goto_1b

    :cond_36
    :goto_1a
    const/4 v4, 0x1

    :goto_1b
    if-nez v4, :cond_38

    :cond_37
    :goto_1c
    const/4 v1, 0x1

    move v3, v5

    goto/16 :goto_20

    .line 162
    :cond_38
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    iget-object v6, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mBindingAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    if-nez v6, :cond_39

    const/4 v6, 0x1

    goto :goto_1d

    :cond_39
    move v6, v5

    :goto_1d
    if-eqz v6, :cond_3b

    .line 164
    iput v3, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mPosition:I

    .line 165
    iget-boolean v10, v4, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mHasStableIds:Z

    if-eqz v10, :cond_3a

    .line 166
    invoke-virtual {v4, v3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v10

    iput-wide v10, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemId:J

    :cond_3a
    const/16 v10, 0x207

    const/4 v11, 0x1

    .line 167
    invoke-virtual {v7, v11, v10}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->setFlags(II)V

    const-string v10, "RV OnBindView"

    .line 168
    invoke-static {v10}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 169
    :cond_3b
    iput-object v4, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mBindingAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 170
    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getUnmodifiedPayloads()Ljava/util/List;

    .line 171
    invoke-virtual {v4, v7, v3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    if-eqz v6, :cond_3e

    .line 172
    iget-object v3, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mPayloads:Ljava/util/List;

    if-eqz v3, :cond_3c

    .line 173
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 174
    :cond_3c
    iget v3, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit16 v3, v3, -0x401

    iput v3, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mFlags:I

    .line 175
    iget-object v3, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 176
    instance-of v4, v3, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    if-eqz v4, :cond_3d

    .line 177
    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    const/4 v4, 0x1

    iput-boolean v4, v3, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->mInsetsDirty:Z

    .line 178
    :cond_3d
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 179
    :cond_3e
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView;->getNanoTime()J

    move-result-wide v3

    .line 180
    iget-object v6, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mRecyclerPool:Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    .line 181
    iget v10, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mItemViewType:I

    sub-long/2addr v3, v8

    .line 182
    invoke-virtual {v6, v10}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->getScrapDataForType(I)Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;

    move-result-object v8

    .line 183
    iget-wide v9, v8, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;->mBindRunningAverageNs:J

    invoke-virtual {v6, v9, v10, v3, v4}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->runningAverage(JJ)J

    move-result-wide v3

    iput-wide v3, v8, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool$ScrapData;->mBindRunningAverageNs:J

    .line 184
    iget-object v3, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView;->isAccessibilityEnabled()Z

    move-result v3

    if-eqz v3, :cond_42

    .line 185
    iget-object v3, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 186
    sget-object v4, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 187
    invoke-virtual {v3}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v4

    const/4 v6, 0x1

    if-nez v4, :cond_3f

    .line 188
    invoke-virtual {v3, v6}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 189
    :cond_3f
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView;->mAccessibilityDelegate:Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;

    if-nez v4, :cond_40

    goto :goto_1e

    .line 190
    :cond_40
    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;->mItemDelegate:Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate$ItemDelegate;

    .line 191
    instance-of v8, v4, Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate$ItemDelegate;

    if-eqz v8, :cond_41

    .line 192
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    invoke-static {v3}, Landroidx/core/view/ViewCompat;->getAccessibilityDelegate(Landroid/view/View;)Landroidx/core/view/AccessibilityDelegateCompat;

    move-result-object v8

    if-eqz v8, :cond_41

    if-eq v8, v4, :cond_41

    .line 194
    iget-object v9, v4, Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate$ItemDelegate;->mOriginalItemDelegates:Ljava/util/Map;

    invoke-interface {v9, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    :cond_41
    invoke-static {v3, v4}, Landroidx/core/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroidx/core/view/AccessibilityDelegateCompat;)V

    :goto_1e
    move v3, v6

    goto :goto_1f

    :cond_42
    const/4 v3, 0x1

    .line 196
    :goto_1f
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 197
    iget-boolean v4, v4, Landroidx/recyclerview/widget/RecyclerView$State;->mInPreLayout:Z

    if-eqz v4, :cond_43

    .line 198
    iput v1, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    :cond_43
    move v1, v3

    .line 199
    :goto_20
    iget-object v4, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    if-nez v4, :cond_44

    .line 200
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 201
    iget-object v4, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_21

    .line 202
    :cond_44
    iget-object v6, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6, v4}, Landroidx/recyclerview/widget/RecyclerView;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v6

    if-nez v6, :cond_45

    .line 203
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/RecyclerView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 204
    iget-object v4, v7, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_21

    .line 205
    :cond_45
    move-object v0, v4

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 206
    :goto_21
    iput-object v7, v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->mViewHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    if-eqz v2, :cond_46

    if-eqz v3, :cond_46

    move v5, v1

    .line 207
    :cond_46
    iput-boolean v5, v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->mPendingInvalidate:Z

    return-object v7

    .line 208
    :cond_47
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid item position "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "). Item count:"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    .line 209
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    .line 210
    invoke-static {v0, v3}, Landroidx/recyclerview/widget/ChildHelper$$ExternalSyntheticOutline0;->m(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public unscrapView(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "holder"
        }
    .end annotation

    .line 1
    iget-boolean v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mInChangeScrap:Z

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 3
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :goto_0
    const/4 p0, 0x0

    .line 4
    iput-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    const/4 p0, 0x0

    .line 5
    iput-boolean p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->mInChangeScrap:Z

    .line 6
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->clearReturnedFromScrapFlag()V

    return-void
.end method

.method public updateViewCacheSize()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->this$0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->mLayout:Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_0

    iget v0, v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->mPrefetchMaxCountObserved:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mRequestedCacheMax:I

    add-int/2addr v1, v0

    iput v1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mViewCacheMax:I

    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-ltz v0, :cond_1

    .line 4
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p0, Landroidx/recyclerview/widget/RecyclerView$Recycler;->mViewCacheMax:I

    if-le v1, v2, :cond_1

    .line 5
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->recycleCachedViewAt(I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_1
    return-void
.end method
